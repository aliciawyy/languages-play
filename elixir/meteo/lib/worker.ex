defmodule Meteo.Worker do
  use GenServer

  # register a name for the GenServer
  @name MW

  def start_link(opts \\ []) do
    GenServer.start_link(__MODULE__, :ok, opts ++ [name: @name])
  end

  def init(:ok) do
    {:ok, %{}}
  end

  def update_stats(old_stats, location) do
    if Map.has_key?(old_stats, location) do
      Map.update!(old_stats, location, &(&1 + 1))
    else
      Map.put_new(old_stats, location, 1)
    end
  end

  def get_stats do
    GenServer.call(@name, :get_stats)
  end

  def get_temperature(location) do
    GenServer.call(@name, {:location, location})
  end

  def handle_call(:get_stats, _from, stats), do: {:reply, stats, stats}
  def handle_call({:location, location}, _from, stats) do
    case temperature(location) do
      {:ok, temp} ->
        new_stats = update_stats(stats, location)
        {:reply, "#{temp} C", new_stats}
      _ ->
        {:reply, :error, stats}
    end
  end

  # GenServer.cast/2 sets up asynchronous requests to the server. A good
  # usecase of this is a command issued to the server and the client does
  # not care about the reply, like reset the stats
  def reset_stats do
    GenServer.cast(@name, :reset_stats)
  end

  def stop do
    GenServer.cast(@name, :stop)
  end

  def handle_cast(:reset_stats, _stats), do: {:noreply, %{}}
  def handle_cast(:stop, stats), do: {:stop, :normal, stats}

  def handle_info(msg, stats) do
    IO.puts "received #{msg}"
    {:noreply, stats}
  end

  # Helper functions

  def temperature(location) do
    url(location) |> HTTPoison.get |> parse_response
  end

  def url(location) do
    location = URI.encode(location)
    "http://api.openweathermap.org/data/2.5/weather?q=#{location}&appid=#{apikey()}"
  end

  defp parse_response({:ok, %HTTPoison.Response{body: body, status_code: 200}}) do
    body |> JSON.decode! |> compute_temperature
  end
  defp parse_response({:ok, %HTTPoison.Response{body: body, status_code: 401}}) do
    {:error, JSON.decode!(body)["message"]}
  end
  defp parse_response(_), do: {:error, "unknown error"}

  defp apikey do
    # file format: cdaaedafra
    "~/.config/openweathermap.apikey"
    |> Path.expand
    |> File.read!
    |> String.trim
  end

  defp compute_temperature(json) do
    try do
      temperature = (json["main"]["temp"] - 273.15) |> Float.round(1)
      {:ok, temperature}
    rescue
      _ -> {:error, "unable to compute the temperature from #{json}"}
    end
  end
end

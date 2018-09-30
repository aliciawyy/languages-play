defmodule Meteo.Worker do

  def temperature(location) do
    result = url(location) |> HTTPoison.get |> parse_response
    case result do
      {:ok, temperature} -> "#{location}: #{temperature} C"
      {:error, reason} -> "#{location} not found for #{reason}"
    end
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

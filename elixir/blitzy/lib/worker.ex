defmodule Blitzy.Worker do
  use Timex
  require Logger

  def start(url, caller) do
    send(caller, {self(), start(url)})
  end

  def start(url) do
    {time_lapsed, response} = Duration.measure(fn -> HTTPoison.get(url) end)
    handle_response({Duration.to_milliseconds(time_lapsed), response})
  end

  defp handle_response({msecs, {:ok, %HTTPoison.Response{status_code: code}}})
       when code >= 200 and code <= 304 do
    Logger.info(
      "worker [#{node()}-#{inspect(self())}] completed in #{msecs} msecs"
    )

    {:ok, msecs}
  end

  defp handle_response({_msecs, {:error, reason}}) do
    Logger.info(
      "worker [#{node()}-#{inspect(self())}] error due to #{inspect(reason)}"
    )

    {:error, reason}
  end

  defp handle_response({_msecs, _}), do: {:error, :unknown}
end

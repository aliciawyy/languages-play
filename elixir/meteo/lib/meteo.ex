defmodule Meteo do
  @moduledoc """
  Meteo lets clients to fetch temperatures of cities all over the world
  concurrently.
  """

  @doc """
  Hello world.

  ## Examples

  """
  def temperature(cities) do
    coordinator_pid = spawn(Meteo.Coordinator, :loop, [Enum.count(cities)])

    cities
    |> Enum.each(fn city ->
      worker_pid = spawn(Meteo.Worker, :loop, [])
      send(worker_pid, {coordinator_pid, city})
    end)
  end
end

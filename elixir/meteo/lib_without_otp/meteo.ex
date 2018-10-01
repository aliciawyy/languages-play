defmodule Meteo do
  @moduledoc """
  Documentation for Meteo.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Meteo.hello()
      :world

  """
  def temperature(cities) do
    coordinator_pid = spawn(Meteo.Coordinator, :loop, [Enum.count(cities)])
    cities
    |> Enum.each(fn city ->
      worker_pid = spawn(Meteo.Worker, :loop, [])
      send(worker_pid, {coordinator_pid, city}) end)
  end
end

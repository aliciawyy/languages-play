defmodule Pooly.PoolsSupervisor do
  use Supervisor

  def start_link(_) do
    Supervisor.start_link(__MODULE__, :ok, [])
  end

  def init(_) do
    {:ok, %{}}
  end
end

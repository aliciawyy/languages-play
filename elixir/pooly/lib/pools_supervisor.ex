defmodule Pooly.PoolSupervisor do
  use Supervisor

  def start_link(pool_config) do
    GenServer.start_link(__MODULE__, pool_config, [])
  end

  @impl true
  def init(pool_config) do
    {:ok, %{}}
  end
end

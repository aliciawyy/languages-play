defmodule Pooly.PoolSupervisor do
  use Supervisor

  def start_link(pool_config) do
    opts = [name: :"#{pool_config[:name]}Supervisor"]

    GenServer.start_link(__MODULE__, pool_config, opts)
  end

  @impl true
  def init(pool_config) do
    children = [
      %{start: {Pooly.PoolServer, :start_link, [self(), pool_config]}}
    ]

    opts = [strategy: :one_for_all]

    Supervisor.init(children, opts)
  end
end

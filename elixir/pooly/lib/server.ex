defmodule Pooly.Server do
  use GenServer
  import Supervisor.Spec

  def start_link(pools_config) do
    GenServer.start_link(__MODULE__, pools_config, name: __MODULE__)
  end

  @impl true
  def init(pools_config) do
    pools_config
    |> Enum.each(fn pool_config ->
      send(self(), {:start_pool, pool_config})
    end)
    {:ok, pools_config}
  end

  def handle_info({:start_pool, pool_config}, state) do
    {:ok, _} = Supervisor.start_child(
      Pooly.PoolsSupervisor, supervisor_spec(pool_config)
    )
    {:noreply, state}
  end

  defp supervisor_spec(pool_config) do
    supervisor(
      Pooly.PoolSupervisor, [pool_config], id: "#{pool_config[:name]}Server"
    )
  end

  def checkout(pool_name) do
    GenServer.call(:"#{pool_name}Server", :checkout)
  end
end

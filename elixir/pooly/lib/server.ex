defmodule Pooly.Server do
  use GenServer

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
    {:ok, _} = Supervisor.start_child(Pooly.PoolsSupervisor, child_spec(pool_config))

    {:noreply, state}
  end

  defp child_spec(pool_config) do
    %{
      id: server_name(pool_config[:name]),
      start: {Pooly.PoolSupervisor, :start_link, [pool_config]}
    }
  end

  def checkout(pool_name) do
    GenServer.call(__MODULE__, {:checkout, server_name(pool_name)})
  end

  def checkin(pool_name, worker) do
  end

  def status(pool_name) do
  end

  defp server_name(pool_name) do
    :"#{pool_name}Server"
  end

  @impl true
  def handle_call({:checkout, server_name}, {from_pid, _ref}, state) do
  end
end

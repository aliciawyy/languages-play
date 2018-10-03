defmodule Pooly.Server do
  use GenServer
  import Supervisor.Spec

  defmodule State do
    defstruct sup: nil, size: nil, mfa: nil, worker_sup: nil, workers: nil, monitors: nil
  end

  def start_link(sup, pool_config) do
    GenServer.start_link(__MODULE__, [sup, pool_config], name: __MODULE__)
  end

  # sup is the pid to the top-level supervisor
  def init([sup, pool_config]) when is_pid(sup) do
    monitors = :ets.new(:monitors, [:private])
    init(pool_config, %State{sup: sup, monitors: monitors})
  end

  def init([mfa: mfa, size: size], state) do
    state = %{state | mfa: mfa, size: size}
    send(self(), :start_worker_supervisor)
    {:ok, state}
  end

  def handle_info(:start_worker_supervisor, state = %State{sup: sup, size: size, mfa: mfa}) do
    # start the worker supervisor process via the top level Supervisor
    {:ok, worker_sup} = Supervisor.start_child(sup, supervisor_spec(mfa))
    workers = prepopulate(size, worker_sup)
    {:noreply, %{state | worker_sup: worker_sup, workers: workers}}
  end

  defp supervisor_spec(mfa) do
    # The top-level supervisor won't restart automatically the worker
    # supervisor
    supervisor(Pooly.WorkerSupervisor, [mfa], restart: :temporary)
  end

  defp prepopulate(size, sup) do
    1..size |> Enum.map(fn _ -> new_worker(sup) end)
  end

  defp new_worker(sup) do
    {:ok, worker} = Supervisor.start_child(sup, [[]])
    worker
  end

  def checkout, do: GenServer.call(__MODULE__, :checkout)
  def status, do: GenServer.call(__MODULE__, :status)
  def checkin(worker_pid), do: GenServer.cast(__MODULE__, {:checkin, worker_pid})

  def handle_call(:checkout, {from_pid, _ref}, %{workers: workers, monitors: monitors} = state) do
    case workers do
      [worker | rest] ->
        ref = Process.monitor(from_pid)
        true = :ets.insert(monitors, {worker, ref})
        {:reply, worker, %{state | workers: rest}}

      [] ->
        {:reply, :noproc, state}
    end
  end

  def handle_call(:status, %{workers: workers, monitors: monitors} = state) do
    {:reply, {length(workers), :ets.info(monitors, :size)}, state}
  end

  def handle_cast({:checkin, worker_pid}, %{workers: workers, monitors: monitors} = state) do
    case :ets.lookup(monitors, worker_pid) do
      [{pid, ref}] ->
        true = Process.demonitor(ref)
        true = :ets.delete(monitors, pid)
        {:noreply, %{state | workers: [pid | workers]}}

      [] ->
        {:noreply, state}
    end
  end
end

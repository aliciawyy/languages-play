defmodule Pooly do
  @moduledoc """
  Documentation for Pooly.
  """

  def start(_type, _args) do
    pool_config = [mfa: {SampleWorker, :start_link, []}, size: 5]
    start_pool(pool_config)
  end

  @doc """
  Starts a pool of workers
  """
  def start_pool(pool_config) do
    Pooly.Supervisor.start_link(pool_config)
  end

  @doc """
  Request and getting a worker from the pool

  :noproc is returned when no more worker available
  """
  def checkout do
    Pooly.Server.checkout
  end

  @doc """
  Once the consumer process is done with the worker, the process must
  return it to the pool with checkin
  """
  def checkin(worker_pid) do
    Pooly.Server.checkin(pid)
  end

  @doc """
  {Number of free workers, number of busy workers}
  """
  def status do
    Pooly.Server.status
  end
end

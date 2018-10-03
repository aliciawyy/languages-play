defmodule Pooly do
  @moduledoc """
  Documentation for Pooly.
  """

  @doc """
  Starts a pool of the
  """
  def start_pool(mfa: mfa, size: size) do
    IO.puts(mfa)
    IO.puts(size)
  end

  @doc """
  Request and getting a worker from the pool

  :noproc is returned when no more worker available
  """
  def checkout do
  end

  @doc """
  Once the consumer process is done with the worker, the process must
  return it to the pool with checkin
  """
  def checkin(worker_pid) do
  end

  @doc """
  {Number of free workers, number of busy workers}
  """
  def status do
  end
end

defmodule Pooly.WorkerSupervisor do
  use Supervisor

  def start_link({_, _, _} = mfa) do
    Supervisor.start_link(__MODULE__, mfa)
  end

  @doc """

  ## Restart Strategy

  A restart strategy indicate how a Supervisor restarts a child
  when it goes wrong. There are four kinds of restart strategies:

  :one_for_one If one process dies, only that process is restarted.
               None of other processes is affected.
  :one_for_all If any process dies, all the processes in the supervision
               tree die along with it. After that, all of them are restarted.
  :rest_for_one The *rest* of the processes are the processes that *started*
                after the process. They will die with the process then
                restarted together.
  :simple_one_for_one For this strategy, every child process spawned from
                      the Supervisor is the same kind of process.

  ## Other options

  max_restarts, max_seconds: max number of restarts the Supervisor can try
  withing the maximum seconds
  """
  def init({m, f, a}) do
    worker_opts = [restart: :permanent, function: f]
    children = [worker(m, a, worker_opts)]
    opts = [
      strategy: :simple_one_for_one,
      max_restarts: 5,
      max_seconds: 5
    ]
    supervise(children, opts)
  end
end

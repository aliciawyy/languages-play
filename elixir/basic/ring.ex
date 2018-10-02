defmodule Ring do
  @moduledoc """
  The Ring module links a list of processes in a ring.

  If one of the linked processes died, none of them will survive.

  If you don't want a process to die when it receives an error signal, you need
  the process to *trap exit signals*.
  """

  def create_processes(n) do
    1..n |> Enum.map(fn _ -> spawn(&loop/0) end)
  end

  def loop do
    receive do
      {:link, link_to} when is_pid(link_to) ->
        Process.link(link_to)
        loop()
      :trap_exit ->
        Process.flag(:trap_exit, true)
        loop()
      :crash -> 1/0
      {:EXIT, pid, reason} ->
        IO.puts "#{inspect self()} received {:EXIT, #{inspect pid}, #{reason}}"
        loop()
    end
  end

  def link_processes(procs), do: link_processes(procs, [])
  def link_processes([proc_1, proc_2|rest], linked_processes) do
    # link the proc 1 and 2
    send(proc_1, {:link, proc_2})
    link_processes([proc_2 | rest], [proc_1|linked_processes])
  end
  def link_processes([proc | []], linked_processes) do
    first_process = linked_processes |> List.last()
    send(first_process, {:link, proc})
  end
end

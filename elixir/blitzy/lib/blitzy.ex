defmodule Blitzy do
  use Application

  def start(_type, _args) do
    Blitzy.Supervisor.start_link(:ok)
  end

  def run_and_report(n_workers, url) do
    run(n_workers, url) |> parse_result
  end

  def run(n_workers, url) when n_workers > 0 do
    worker_fun = fn -> Blitzy.Worker.start(url) end

    1..n_workers
    |> Enum.map(fn _ -> Task.async(worker_fun) end)
    |> Enum.map(&Task.await(&1, :infinity))
  end

  def parse_result(result) do
    {successes, _failures} =
      result
      |> Enum.split_with(fn x ->
        case x do
          {:ok, _} -> true
          _ -> false
        end
      end)

    total_workers = Enum.count(result)
    total_success = Enum.count(successes)
    total_failure = total_workers - total_success

    data = successes |> Enum.map(fn {:ok, time_lapsed} -> time_lapsed end)
    average_time = Enum.sum(data) / total_success
    max_req_time = Enum.max(data)
    min_req_time = Enum.min(data)

    IO.puts("""
    Total requests  : #{total_workers}
    Successful req  : #{total_success}
    Failed req      : #{total_failure}

    Average req time: #{average_time} mseconds
    Max req time    : #{max_req_time} mseconds
    Min req time    : #{min_req_time} mseconds
    """)
  end
end

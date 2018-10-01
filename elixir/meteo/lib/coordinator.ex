defmodule Meteo.Coordinator do
  def loop(results \\ [], n_expected_results) do
    receive do
      {:ok, result} ->
        new_results = [result | results]

        if n_expected_results == Enum.count(new_results) do
          send(self(), :exit)
        end

        loop(new_results, n_expected_results)

      :exit ->
        results |> Enum.sort() |> Enum.join(", ") |> IO.puts()

      _ ->
        loop(results, n_expected_results)
    end
  end
end

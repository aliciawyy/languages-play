defmodule MyFile do
  def read(path) do
    case File.read(path) do
      {:ok, data} -> IO.puts data
      {:error, reason} -> IO.puts "Error #{reason}"
    end
  end
end

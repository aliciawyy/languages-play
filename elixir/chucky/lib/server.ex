defmodule Chucky.Server do
  use GenServer

  def start_link(_) do
    # Globally registers the GenServer in the cluster
    opts = [name: {:global, __MODULE__}]

    GenServer.start_link(__MODULE__, [], opts)
  end

  @impl true
  def init(_) do
    :random.seed(:os.timestamp)
    facts = "facts.txt" |> File.read!() |> String.split("\n")
    {:ok, facts}
  end

  def fact do
    GenServer.call({:global, __MODULE__}, :fact)
  end

  @impl true
  def handle_call(:fact, _from, facts) do
    random_fact = facts |> Enum.shuffle() |> List.first()
    {:reply, random_fact, facts}
  end
end

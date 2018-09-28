defmodule GameOfLife do
  @moduledoc """
  Documentation for GameOfLife.
  """

  @doc """
  Hello world.

  ## Examples

      iex> GameOfLife.hello()
      :world

  """
  alias Scenic.Graph
  alias Scenic.Primitives

  @width 800
  @height 600
  @cell_size 10

  def build_grid(graph, {width, height}, spacing) do
    horizontal = Enum.reduce(0..height, graph, fn y, acc ->
      Primitives.line(acc, {{0, spacing * y}, {width, spacing * y}}, stroke: {1, :white}) end)
    Enum.reduce(0..width, horizontal, fn x, acc ->
      Primitives.line(acc, {{spacing * x, 0}, {spacing * x, height}}, stroke: {1, :white}) end)
  end

  def init() do
    Graph.build()
    |> build_grid({@width, @height}, @cell_size)
  end
end

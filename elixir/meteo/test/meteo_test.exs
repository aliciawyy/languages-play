defmodule MeteoTest do
  use ExUnit.Case
  doctest Meteo

  test "greets the world" do
    assert Meteo.hello() == :world
  end
end

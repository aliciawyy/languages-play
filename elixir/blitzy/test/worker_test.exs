defmodule Blitzy.WorkerTest do
  use ExUnit.Case

  test "handle good url" do
    {:ok, time_lapsed} = Blitzy.Worker.start("google.com")
    assert is_float(time_lapsed)
  end

  test "handle error response" do
    {:error, reason} = Blitzy.Worker.start("errorurlnotexist")
    assert reason == %HTTPoison.Error{id: nil, reason: :nxdomain}
  end

  test "worker with send" do
    Blitzy.Worker.start("errorurlnotexist", self())

    receive do
      {_from, {:error, reason}} ->
        assert reason == %HTTPoison.Error{id: nil, reason: :nxdomain}
    end
  end
end

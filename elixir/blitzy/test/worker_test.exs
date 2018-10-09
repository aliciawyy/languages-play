defmodule Blitzy.WorkerTest do
  use ExUnit.Case

  test "handle error response" do
    {:error, reason} = Blitzy.Worker.start("errorurlnotexist")
    assert reason == %HTTPoison.Error{id: nil, reason: :nxdomain}
  end
end

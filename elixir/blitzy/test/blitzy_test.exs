defmodule BlitzyTest do
  use ExUnit.Case
  doctest Blitzy

  test "multiple async tasks" do
    result = Blitzy.run(3, "errorurlnotexist")
    assert length(result) == 3
  end

end

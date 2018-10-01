defmodule PingPong do
  def pong do
    receive do
      {sender, :ping, count} ->
        IO.puts "#{count} Ping received"
        send(sender, {self(), :pong, count + 1})
        pong()
    end
  end

  def ping(n) do
    receive do
      {sender, :pong, count} ->
        IO.puts "#{count} Pong received"
        send(sender, {self(), :ping, count})
        if count < n do
          ping(n)
        end
    end
  end

  def coordinator(n \\ 5) do
    ping_pid = spawn(PingPong, :ping, [n])
    pond_pid = spawn(PingPong, :pong, [])
    send(ping_pid, {pond_pid, :pong, 0})
  end
end

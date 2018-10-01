defmodule PingPong do
  def pong do
    receive do
      {sender, :ping} ->
        IO.puts "Ping received"
        send(sender, {self(), :pong})
    end
    pong()
  end

  def ping do
    receive do
      {sender, :pong} ->
        IO.puts "Pong received"
        send(sender, {self(), :ping})
    end
    # ping()
  end

  def coordinator() do
    ping_pid = spawn(PingPong, :ping, [])
    pond_pid = spawn(PingPong, :pong, [])
    send(ping_pid, {pond_pid, :pong})
  end
end

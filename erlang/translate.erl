-module(translate).
-export([loop/0, roulette/0]).

% Example
% Pid = spawn(fun translate:loop/0).
% Pid ! "blanca".
loop() ->
  receive % receive a message from another process
    "casa" ->
      io:format("house~n"),
      loop();
    "blanca" ->
      io:format("white~n"),
      loop();
    _ ->
      io:format("I don't understand.~n"),
      loop()
  end.

roulette() ->
  receive
    3 ->
      io:format("bang.~n"),
      exit({roulette, die, at, erlang:time()});
    _ ->
      io:format("click.~n"),
      roulette()
  end.

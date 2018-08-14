-module(translate_service).
-export([loop/0, translate/2]).

loop() ->
  receive
    {From, "casa"} ->
      % Send the message "house" back to the process From
      From ! "house",
      loop();
    {From, "blanca"} ->
      From ! "white",
      loop();
    {From, _} ->
      From ! "I don't understand.",
      loop()
  end.

translate(To, Word) ->
  % The shell is a process, you can get its process identifier with self()
  To ! {self(), Word},
  receive
    Translation -> Translation
  end.

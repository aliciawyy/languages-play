-module(afile_server).
-export([start/1, loop/1]).

% Creates an Erlang process that evaluates the function loop
% and returns a Pid of the process
start(Dir) -> spawn(afile_server, loop, [Dir]).

loop(Dir) ->
  % wait for a command

  % pattern matching is used to select the message
  receive
    % Client is the Pid of the process that sent the request
    % and to whom the reply should be sent.
    { Client, list_dir } ->
      Client ! { self(), file:list_dir(Dir) };
    { Client, { get_file, File } } ->
      Full = filename:join(Dir, File),
      Client ! { self(), file:read_file(Full) }
  end,
  % Attention with the Erlang tail-call optimization
  loop(Dir).

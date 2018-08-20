-module(hello).
-export([start/0]).

% Compile the code outside Erlang shell: erlc hello.erl​
% erlc compiles the code hello.erl and produces an object file hello.beam
% Run the code
% erl -noshell -s hello start -s init stop
start() -> io:format("Hello Erlang~n").

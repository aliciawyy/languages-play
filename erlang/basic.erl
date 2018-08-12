% compile this module in erl shell with c(basic).
-module(basic). % Defines the name of the module.
-export([mirror/1]).
-export([number/1]).
% function to export, /1 means it has 1 parameter.
-export([fib/1, factorial/1, double_all/1, another_double_all/1]).
-export([count_words/1, count/1, report/1]).

mirror(Anything) -> Anything.

number(one) -> 1;
number(two) -> 2;
number(three) -> 3.

fib(1) -> 1;
fib(2) -> 1;
fib(N) -> fib(N - 1) + fib(N - 2).

factorial(1) -> 1;
factorial(N) -> N * factorial(N - 1).

double_all([]) -> [];
double_all([Head|Tail]) -> [Head + Head|double_all(Tail)].

% list comprehension
another_double_all(List) -> [X * 2 || X <- List].

count_words(String) -> string:words(String).

count(1) -> io:fwrite(" 1~n", []);
count(N) -> io:fwrite(" ~p~n", [N]), count(N - 1).

report(success) -> io:fwrite("success");
report({error, Message}) -> io:fwrite("error:  ~p~n", [Message]).

/*
 E.g. abs(-5, X). abs(5, X).
 */
abs(X, X) :- X >= 0.
abs(X, Y) :- X < 0, Y is -X.

count(0, []).
count(Count, [Head|Tail]) :- count(TailCount, Tail), Count is TailCount + 1.

sum(0, []).
sum(Sum, [Head|Tail]) :- sum(TailSum, Tail), Sum is Head + TailSum.

average(Average, List) :-
  count(Count, List),
  sum(Sum, List),
  Average is Sum / Count. 

concat([], List, List).
concat([Head|Tail], List, [Head|TotalTail]) :-
  concat(Tail, List, TotalTail).

reverse_list([], []).
reverse_list([Head|Tail], List) :-
  reverse(Tail, ReversedTail),
  append(ReversedTail, [Head], List).

min_l([Head|[]], Head).
min_l([Head|Tail], Min) :-
  min_l(Tail, MinTail), Head < MinTail, Min is Head.
min_l([Head|Tail], Min) :-
  min_l(Tail, MinTail), Head >= MinTail, Min is MinTail.

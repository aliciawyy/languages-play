-module(forms).
-export([super_animal/1]).

super_animal(Animal) ->
  case string:lowercase(Animal) of
    "dog" -> underdog;
    "cat" -> thundercat;
    _ -> unknown
  end.

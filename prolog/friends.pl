/*
  Launch the prolog interpreter with `prolog`
  compile this file with ['friends'].

  These three statements are facts.
  Like erlang, every statement ends with a period .
 */
likes(wallace, cheese).
likes(grommit, cheese).
likes(wendy, pork).

/*
 This statement is a rule
 The symbol ":-", sometimes called a turnstile, is pronounced "if".
 \+ logic negation, e.g. \+(X = Y) means X is not equal to Y
 The rule will be true if all the subgoals are true.
 */
friend(X, Y) :- \+(X = Y), likes(X, Z), likes(Y, Z).

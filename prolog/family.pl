/*
 An ancester can mean father or grandfather or great grandfather.
 */

father(zeb, john_sr).
father(john_sr, john_jr).

/*
When there are multiple clauses that make up a rule, only one of them must be
true for the rule to be true.

To query all the ancestors of john_jr we can call ancestor(Who, john_jr).

Attention with the _tail recursive optimization_.
 */
ancestor(X, Y) :- father(X, Y).
ancestor(X, Y) :- father(X, Z), ancestor(Z, Y).

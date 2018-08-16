cat(lion).
cat(tiger).

/*
 = means unify, or make both sides the same.
 Unification means _find the values that make both sides match_.
 */
dorothy(X, Y, Z) :- X = lion, Y = tiger, Z = bear.
twin_cats(X, Y) :- cat(X), cat(Y).

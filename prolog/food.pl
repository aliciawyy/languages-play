/*
 To query what food are meat, food_type(What, meat)., use ; to get the next one.
 */

food_type(velveeta, cheese).
food_type(ritz, cracker).
food_type(spam, meat).
food_type(sausage, meat).
food_type(jolt, soda).
food_type(twinkie, dessert).

flavor(sweet, dessert).
flavor(savory, meat).
flavor(savory, cheese).
flavor(sweet, soda).

/*
 To query what food are sweet, food_flavor(What, sweet).
 */
food_flavor(X, Y) :- food_type(X, Z), flavor(Y, Z).

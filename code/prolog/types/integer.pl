%% Integer type

%% There is a predicate integer(I) in the prolog's prelude to check if an expression is an integer or not
%% However, in Haskell, Integer type doesn't have fixed precision
%% Is this implementation correct?

gen_integer(I) :- random_between(-999999999999999999999999999999999999999999999999, 999999999999999999999999999999999999999999999999, I).

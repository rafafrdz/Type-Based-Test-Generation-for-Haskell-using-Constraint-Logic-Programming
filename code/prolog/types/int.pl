%% Int type

%% There is a predicate integer(I) in the prolog's prelude to check if an expression is an integer or not
%% here, I force that an integer belongs to the range (-536870912, 536870912)

int(I) :- (I >= -536870912, I =< 536870912), integer(I).

gen_int(I) :- random_between(-536870912, 536870912, I), integer(I).

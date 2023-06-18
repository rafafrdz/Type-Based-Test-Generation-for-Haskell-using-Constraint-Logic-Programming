%% Int type

int(I) :- (I >= -536870912, I =< 536870912), integer(I).

gen_int(I) :- random_between(-536870912, 536870912, I), integer(I).

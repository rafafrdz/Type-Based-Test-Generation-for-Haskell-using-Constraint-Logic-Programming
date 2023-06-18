%% Double type

double(D) :- float(D).

gen_double(D) :- gen_double(-9999999, 9999999, D).

gen_double(Min, Max, D) :-
    random(F),
    D is Min + F * (Max - Min).
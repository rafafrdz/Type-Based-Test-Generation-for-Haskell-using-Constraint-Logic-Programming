%% Double type

%% Here, for our proupose we fix the double's range boundary

double(Min, Max, D) :-
    random(F),
    D is Min + F * (Max - Min).

double(D) :- double(-9999999, 9999999, D).
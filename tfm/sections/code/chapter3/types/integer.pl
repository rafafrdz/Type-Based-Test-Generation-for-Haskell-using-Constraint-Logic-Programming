%% Integer type

%% integer(I) in the Prolog's prelude

gen_integer(I) :- random_between(-99999999999999999999999999999, 99999999999999999999999999999, I).

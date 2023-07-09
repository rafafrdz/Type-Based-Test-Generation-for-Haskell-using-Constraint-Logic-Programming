maybeint(nil).													%% rule 1
maybeint(some(X21)) :- gen_int(X21).		%% rule 2
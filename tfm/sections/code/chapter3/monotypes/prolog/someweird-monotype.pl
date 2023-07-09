someweird(nil1).																														%% rule 1
someweird(nil2).																														%% rule 2
someweird(some(X31)) :- gen_int(X31).																				%% rule 3
someweird(weird(X41, X42, X43)) :-																					%% rule 4
	someweird(X41),
	someweird(X42),
	gen_bool(X43).
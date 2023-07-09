unit(unit).
gen_unit(U) :- unit(U).
gen_int(I) :- random_between(-536870912, 536870912, I), integer(I).


someweird(nil1).																														%% rule 1
someweird(nil2).																														%% rule 2
someweird(some(X31)) :- gen_int(X31).																				%% rule 3
someweird(weird(X31, X32, X33)) :-																					%% rule 4
	someweird(X31),
	someweird(X32),
	gen_unit(X33).
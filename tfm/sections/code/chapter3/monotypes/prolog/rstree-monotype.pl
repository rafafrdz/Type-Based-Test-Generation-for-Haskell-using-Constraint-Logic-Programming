rstreelist([]).
rstreelist([X|Xs]) 	:- rstreelist(Xs), rstree(X).

rstree(r(X11, X12)) :- gen_int(X11), rstreelist(X12).			%% rule 1
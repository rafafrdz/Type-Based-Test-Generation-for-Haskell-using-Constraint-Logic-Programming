mylistbool(nil).																										%% rule 1
mylistbool(cons(X21, X22)) 	:- gen_bool(X21), mylistbool(X22).			%% rule 2
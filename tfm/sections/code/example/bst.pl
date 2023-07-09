:- use_module(library(clpfd)).

% Base case for an empty tree
bst(nil).

% Recursive case for a non-empty tree
bst(t(_,nil,nil)).
bst(t(N,L,nil)) :- L = t(LN,_,_), LN #< N, bst(L).
bst(t(N,nil,R)) :- R = t(RN,_,_), RN #> N, bst(R).
bst(t(N,L,R)) :- L = t(LN,_,_), LN #< N, bst(L), R = t(RN,_,_), RN #> N, bst(R).

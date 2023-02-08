:- use_module(library(clpfd)).

%% Implementation of lists Scala' style
list(nil).
list(cons(_, Xs)) :- list(Xs).

%% Implementation of sorted lists Scala' style
sortlist(nil).
sortlist(cons(_,nil)).
sortlist(cons(X, cons(Y, Xs))) :- X #=< Y, sortlist(cons(Y,Xs)).
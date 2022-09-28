:- use_module(library(clpfd)).

%% Implementation of lists Haskell' style
list([]).
list(_:Xs) :- list(Xs).

%% Implementation of sorted lists Haskell' style
sortlist([]).
sortlist(_:[]).
sortlist(X:Y:Xs) :- X #=< Y, sortlist(Y:Xs).
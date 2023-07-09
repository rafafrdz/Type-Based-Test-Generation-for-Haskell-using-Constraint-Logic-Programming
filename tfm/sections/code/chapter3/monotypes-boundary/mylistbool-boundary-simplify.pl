
mylistbool(0,nil).

mylistbool(1, cons(X21, X22)) :-
    base(Z22),
    gen_bool(X21),
    mylistbool(Z22, X22).


mylistbool(N2, cons(X21, X22)) :-
    N2 > 1,
    Nr2 is N2 - 1,
    states2(Nr2, W22),
    gen_bool(X21),
    mylistbool(W22, X22).


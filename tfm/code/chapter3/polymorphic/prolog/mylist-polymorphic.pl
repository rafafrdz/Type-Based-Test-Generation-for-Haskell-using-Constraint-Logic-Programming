
mylist(0, A, nil).

mylist(1, A, cons(X21, X22)) :-
    base(Z22),
    gen(A, X21),
    mylist(Z22, A, X22).


mylist(N2, A, cons(X21, X22)) :-
    N2 > 1,
    Nr2 is N2 - 1,
    states2(Nr2, W22),
    gen(A, X21),
    mylist(W22, A, X22).


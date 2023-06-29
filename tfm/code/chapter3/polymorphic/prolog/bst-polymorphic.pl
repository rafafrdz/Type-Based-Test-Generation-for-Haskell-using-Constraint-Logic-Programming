bstree(0, A, nil).

bstree(1, A, t(X21, X22, X23)) :-
    base(Z22),
    base(Z23),
    gen(A, X21),
    bstree(Z22, A, X22),
    bstree(Z23, A, X23).

bstree(N2, A, t(X21, X22, X23)) :-
    N2 > 1,
    Nr2 is N2 - 1,
    states2(Nr2, W22, W23),
    gen(A, X21),
    bstree(W22, A, X22),
    bstree(W23, A, X23).

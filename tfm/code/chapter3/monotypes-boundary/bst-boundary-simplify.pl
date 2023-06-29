bstree(0,nil).

bstree(1, t(X21, X22, X23)) :-
    base(Z22),
    base(Z23),
    gen_int(X21),
    bstree(Z22, X22),
    bstree(Z23, X23).

bstree(N2, t(X21, X22, X23)) :-
    N2 > 1,
    Nr2 is N2 - 1,
    states2(Nr2, W22, W23),
    gen_int(X21),
    bstree(W22, X22),
    bstree(W23, X23).

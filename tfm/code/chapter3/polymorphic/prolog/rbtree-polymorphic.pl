%%%%%%%%%%%%%%%%%%%%%%
%% Color
%%%%%%%%%%%%%%%%%%%%%%

color(red).

color(black).

%%%%%%%%%%%%%%%%%%%%%%
%% Red-Black Tree
%%%%%%%%%%%%%%%%%%%%%%

rbtree(0, A, nil).

rbtree(1, A, t(X21, X22, X23, X24)) :-
    base(Z23),
    base(Z24),
    gen(color, X21),
    gen(A, X22),
    rbtree(Z23, A, X23),
    rbtree(Z24, A, X24).

rbtree(N2, A, t(X21, X22, X23, X24)) :-
    N2 > 1,
    Nr2 is N2 - 1,
    states2(Nr2, W23, W24),
    gen(color, X21),
    gen(A, X22),
    rbtree(W23, A, X23),
    rbtree(W24, A, X24).

%%%%%%%%%%%%%%%%%
%% Auxiliar rules
%%%%%%%%%%%%%%%%%

% base rules
base(0).

% cases rule
cases(_, Y) :- base(Y).
cases(X, X).

% diff rules
diff2(X, X) :- base(X), !, fail.
diff2(W23, W24).

% states rules
states2(Nr2, W23, W24) :-
    cases(Nr2, W23),
    cases(Nr2, W24),
    diff2(W23, W24).
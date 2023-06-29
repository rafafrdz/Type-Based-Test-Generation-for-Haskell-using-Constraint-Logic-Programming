someweird(0, A, B, nil1).

someweird(0, A, B, nil2).

someweird(0, A, B, some(X31)) :-
    gen(A, X31).

someweird(1, A, B, weird(X41, X42, X43)) :-
    base(Z41),
    base(Z42),
    someweird(Z41, A, B, X41),
    someweird(Z42, A, B, X42),
    gen(B, X43).

someweird(N4, A, B, weird(X41, X42, X43)) :-
    N4 > 1,
    Nr4 is N4 - 1,
    states4(Nr4, W41, W42),
    someweird(W41, A, B, X41),
    someweird(W42, A, B, X42),
    gen(B, X43).

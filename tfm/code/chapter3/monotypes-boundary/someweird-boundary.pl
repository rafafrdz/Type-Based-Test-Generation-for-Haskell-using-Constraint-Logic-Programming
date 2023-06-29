%%%%%%%%%%%%%%%%%%%%%%
%% SomeWeird ADT
%%%%%%%%%%%%%%%%%%%%%%

% rule01
% Base case for nil1
someweird(0, nil1).

% rule02
% Base case for nil2
someweird(0, nil2).

% rule03
% Base case for some(_)
someweird(0, some(X31)) :-
    gen_int(X31).

% rule04
% Base case for weird(_,_,_)
someweird(1, weird(X41, X42, X43)) :-
    base(Z41),
    base(Z42),
    someweird(Z41, X41),
    someweird(Z42, X42),
    gen_bool(X43).

% rule4
% Inductive scenario for weird(_,_,_)	
someweird(N4, weird(X41, X42, X43)) :-
    N4 > 1,
    Nr4 is N4 - 1,
    states4(Nr4, W41, W42),
    someweird(W41, X41),
    someweird(W42, X42),
    gen_bool(X43).


%%%%%%%%%%%%%%%%%
%% Auxiliar rules
%%%%%%%%%%%%%%%%%

% base rules
base(0).

% cases rule
cases(_, Y) :- base(Y).
cases(X, X).

% diff rules
diff4(X, X) :- base(X), !, fail.
diff4(W41, W42).

% states rules
states4(Nr4, W41, W42) :-
    cases(Nr4, W41),
    cases(Nr4, W42),
    diff4(W41, W42).

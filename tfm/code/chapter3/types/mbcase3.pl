unit(unit).
gen_unit(U) :- unit(U).

base(0).

% caso base nil1 con N01 = 0
mls(0, nil1).
% omitimos induccion nil1

% caso base nil2 con N02 = 0
mls(0, nil2).
% omitimos induccion nil2

% caso base con(_,_,_) N03 = 1

mls(1, con(X31, X32, X33)) :-
    gen_unit(X31),
    base(Z32),
    base(Z33),
    mls(Z32, X32), % N01
    mls(Z33, X33). % N01

%% diff(X,X) :- base(X), !, fail.
%% diff(X,Y).
%% cases(_, Y) :- base(Y).
%% cases(X, X).

diff(X,X) :- base(X), !, fail.
diff(X,Y).
cases(_, Y) :- base(Y).
cases(X, X).


% caso induccion
mls(N3, con(X31, X32, X33)) :-
    N3 > 1,          % N3 > N03
    Nr is N3 - 1,
    gen_unit(X31),
    cases(Nr, Nt32),
    cases(Nr, Nt33),
    diff(Nt32, Nt33),
    mls(Nt32, X32),
    mls(Nt33, X33).
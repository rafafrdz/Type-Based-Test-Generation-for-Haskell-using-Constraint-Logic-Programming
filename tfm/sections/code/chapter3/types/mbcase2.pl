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

% caso induccion
mls(N3, con(X31, X32, X33)) :-
    N3 > 1,          % N3 > N03
    Nr is N3 - 1,
    gen_unit(X31),
    base(Z2),
    mls(Nr, X32),
    mls(Z2, X33).    % N01

mls(N3, con(X31, X32, X33)) :-
    N3 > 1,          % N3 > N03
    Nr is N3 - 1,
    gen_unit(X31),
    base(Z1),
    mls(Z1, X32),    % N01
    mls(Nr, X33).

mls(N3, con(X31, X32, X33)) :-
    N3 > 1,          % N3 > N03
    Nr is N3 - 1,
    gen_unit(X31),
    mls(Nr, X32),
    mls(Nr, X33).

unit(unit).
gen_unit(U) :- unit(U).

base(0).

% Para cada coni, existe un N0ij y una variable Ni, donde
% Ni es el N tal que se produce la recursion natural Ni > N0i.
% Ntij es la variable de la componente j en coni donde se va a tomar
% o bien el Nr o bien alguno de los N0k casos bases de las induccion natural
% para generar el caso base de la induccion estructural


% caso base nil1 con N01 = 0
mls(0, nil1).
% omitimos induccion nil1

% caso base nil2 con N02 = 0
mls(0, nil2).
% omitimos induccion nil2

% caso base con(_,_,_,_) N03 = 1

mls(1, con(X31, X32, X33, X34)) :-
    gen_unit(X31),
    base(Z32),
    base(Z33),
    base(Z34),
    mls(Z32, X32), % N01
    mls(Z33, X33), % N01
    mls(Z34, X34). % N01

% states generator
diff(X, X, X) :- base(X), !, fail.
diff(Nt32, Nt33, Nt34).

cases(_, Ntij) :- base(Ntij).
cases(X, X).

states(Nr, Nt32, Nt33, Nt34) :-
    cases(Nr, Nt32),
    cases(Nr, Nt33),
    cases(Nr, Nt34),
    diff(Nt32, Nt33, Nt34).


% caso induccion
mls(N3, con(X31, X32, X33, X34)) :-
    N3 > 1,          % N3 > N03
    Nr is N3 - 1,
    gen_unit(X31),
    states(Nr, Nt32, Nt33, Nt34),
    mls(Nt32, X32),
    mls(Nt33, X33),
    mls(Nt34, X34).
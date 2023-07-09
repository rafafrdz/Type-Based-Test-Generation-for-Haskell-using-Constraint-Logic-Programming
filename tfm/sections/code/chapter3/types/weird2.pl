unit(unit).
gen_unit(U) :- unit(U).
gen_int(I) :- random_between(-536870912, 536870912, I), integer(I).

base(0).

diff4(X, X) :- base(X), !, fail.
diff4(Nt32, Nt33).

cases(_, Ntij) :- base(Ntij).
cases(X, X).

states4(Nr, Nt41, Nt42) :-
    cases(Nr, Nt41),
    cases(Nr, Nt42),
    diff4(Nt41, Nt42).


% caso base
someweird(0,nil1).
someweird(0,nil2).
someweird(0,some(X31)) :- gen_int(X31).
someweird(1,weird(X41, X42, X43)) :-
    base(Z41),
    base(Z42),
	someweird(Z41,X41),
	someweird(Z42,X42),
	gen_unit(X43).

% caso inductivo

% estos se omiten
% someweird(N1,nil1).
% someweird(N2,nil2).
% someweird(N3,some(X31)) :- gen_int(X31).

someweird(N4,weird(X41, X42, X43)) :-
    N4 > 1,
    Nr is N4 - 1,
    states4(Nr, Nt41, Nt42),
	someweird(Nt41, X41),
	someweird(Nt42, X42),
	gen_unit(X43).
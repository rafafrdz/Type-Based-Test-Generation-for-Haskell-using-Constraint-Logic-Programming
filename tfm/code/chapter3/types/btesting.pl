gen_int(I) :- random_between(-536870912, 536870912, I), integer(I).
gen_char(C) :-
    repeat,
    random_between(0, 7935, Code),
    (char_code(C, Code), !; fail).
gen_string(S) :-
   repeat,
   random_between(0, 99, N),
   (length(L, N), maplist(gen_char, L), atom_string(L,S), string(S), !; fail).

bool(true).
bool(false).

gen_bool(B) :- bool(B).


bt(0, nil).

bt(1, t(X21,nil,nil)) :-
    gen_bool(X21).

bt(Length, t(X21,L,nil)) :-
    gen_bool(X21),
    Length > 1,
    N1 is Length - 1,
    bt(N1, L).

bt(Length, t(X21,nil,R)) :-
    gen_bool(X21),
    Length > 1,
    N1 is Length - 1,
    bt(N1, R).

bt(Length, t(X21,L,R)) :-
    gen_bool(X21),
    Length > 1,
    N1 is Length - 1,
    bt(N1, L), bt(N1, R).


%% V1
rstreelist([]).
rstreelist([X|Xs]) 	:- rstreelist(Xs), rstree(X).
rstree(r(X11, X12)) :- gen_int(X11), rstreelist(X12).

%%V2
rstreelist(0, []).
rstreelist(Length, [X|Xs]) 	:-
    Length > 0,
    N1 is Length - 1,
    rstreelist(N1, Xs),
    rstree(0, X).

rstree(Length, r(X11, X12)) :-
    gen_int(X11),
    rstreelist(Length, X12).

%%V3 ??? 

rstreelist(_, 0, []).

rstreelist(Width, Length, [X|Xs]) 	:-
    Length > 0,
    L1 is Length - 1,
    Width > 0,
    W1 is Width - 1,
    rstreelist(Width, L1, Xs),
    rstree(W1, Length, X).

rstree(0, Length,Y) :- rstree(Length, Y).

rstree(Width, Length, r(X11, X12)) :-
    gen_int(X11),
    rstreelist(Width, Length, X12).
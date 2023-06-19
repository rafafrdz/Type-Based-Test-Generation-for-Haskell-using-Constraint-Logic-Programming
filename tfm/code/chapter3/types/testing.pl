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



maybeint(nil).													%% rule 1
maybeint(some(X21)) :- gen_int(X21).		%% rule 2

either(left(X11)) 	:- gen_string(X11).			%% rule 1
either(right(X21)) 	:- gen_int(X21).				%% rule 2



mylistbool(nil).																										%% rule 1
mylistbool(cons(X21, X22)) 	:- gen_bool(X21), mylistbool(X22).	

rstlist([]).
rstlist([X|Xs]) :- rstlist(Xs), rst(X).

rst(r(_,[])).
rst(r(X11, X12)) :- gen_int(X11), rstlist(X12).


bstree(nil).																														%% rule 1
bstree(t(X21, X22, X23)) :- gen_int(X21), bstree(X22), bstree(X23).
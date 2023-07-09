%% Generator
gen(Type, X) :-
    rel_type(Type, Gen),
    call(Gen, X).
gen(Type, X) :-
    rel_gen(Type, Gen),
    call(Gen, X).

%% Generator relationship
rel_type(char, gen_char).
rel_type(string, gen_string).
rel_type(int, gen_int).
rel_type(integer, gen_integer).
rel_type(bool, gen_bool).
rel_type(unit, gen_unit).

rel_gen(Gen, Y) :- rel_type(Gen, Y), !, fail.
rel_gen(Gen, Gen).
bstree(Type, nil).					                %% rule 1
bstree(Type, t(X21, X22, X23)) :-           %% rule 2
    gen(Type, X21),
    bstree(Type, X22),
    bstree(Type, X23).

list(_, 0, []).
list(Gen, Length, [X|Xs]) :-
   Length > 0,
   N1 is Length - 1,
   gen(Gen, X),
   list(Gen, N1, Xs).


bool(true).
bool(false).

gen_bool(B) :- bool(B).
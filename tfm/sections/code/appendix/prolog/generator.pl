:- module(generator, [gen/2]).

% Import here the types module
% By using :- consult(path/subpath/types.pl).


%% Generator
gen(Type, X) :-
    rel_type(Type, G),
    call(G, X).

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

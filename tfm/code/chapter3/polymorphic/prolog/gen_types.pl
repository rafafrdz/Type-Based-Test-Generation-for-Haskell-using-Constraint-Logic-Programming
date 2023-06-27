%% Generator
gen(Type, X) :-
    rel_type(Type, Gen),
    call(Gen, X).

%% Generator relationship
rel_type(char, gen_char).
rel_type(string, gen_string).
rel_type(int, gen_int).
rel_type(integer, gen_integer).
rel_type(bool, gen_bool).
rel_type(unit, gen_unit).
rel_type(Gen, Gen).
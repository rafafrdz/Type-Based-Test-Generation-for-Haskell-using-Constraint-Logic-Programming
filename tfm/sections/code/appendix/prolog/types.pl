:- module(types,
            [
            gen_char/1,
            gen_string/1,
            gen_int/1,
            gen_integer/1,
            gen_bool/1,
            gen_unit/1
            ]).

%% Char type

char(C) :- char_code(C, _).
gen_char(C) :-
    repeat,
    random_between(0, 7935, Code),
    (char_code(C, Code), !; fail).

%% String type
%% string(S) in the Prolog's prelude

gen_string(S) :-
   repeat,
   random_between(0, 99, N),
   (length(L, N), maplist(gen_char, L), atom_string(L,S), string(S), !; fail).

%% Int type

int(I) :- (I >= -536870912, I =< 536870912), integer(I).
gen_int(I) :- random_between(-536870912, 536870912, I), integer(I).

%% Integer type
%% integer(I) in the Prolog's prelude

gen_integer(I) :- random_between(-99999999999999999999999999999, 99999999999999999999999999999, I).

%% Boolean type

bool(true).
bool(false).
gen_bool(B) :- bool(B).

%% Unit type

unit(unit).
gen_unit(U) :- unit(U).

%% Double type

double(D) :- float(D).
gen_double(D) :- gen_double(-9999999, 9999999, D).
gen_double(Min, Max, D) :-
    random(F),
    D is Min + F * (Max - Min).
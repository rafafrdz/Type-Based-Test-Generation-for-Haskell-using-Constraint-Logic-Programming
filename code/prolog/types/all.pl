:- module(generator,
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
%% There is a predicate string(S) in the prolog's prelude to check if an expression is a string or not
%% It is not the best approach to generate a string, also because it generates a list of character
%% that is a string in haskell but it representation is not a concatenated string between double quotes.

% gen_string(S) :-
%     length(L, _),
%     maplist(gen_char, L),
%     atom_string(L,S),
%     string(S).

%% Limited version

gen_string(S) :-
   repeat,
   random_between(0, 99, N),
   (length(L, N), maplist(gen_char, L), atom_string(L,S), string(S), !; fail).

%% Bounded version

% gen_string(N, S) :-
%   length(L, N),
%   maplist(gen_char, L),
%   atom_string(L,S),
%   string(S).

%% Int type
%% There is a predicate integer(I) in the prolog's prelude to check if an expression is an integer or not
%% here, I force that an integer belongs to the range (-536870912, 536870912)

int(I) :- (I >= -536870912, I =< 536870912), integer(I).

gen_int(I) :- random_between(-536870912, 536870912, I), integer(I).

%% Integer type
%% There is a predicate integer(I) in the prolog's prelude to check if an expression is an integer or not
%% However, in Haskell, Integer type doesn't have fixed precision
%% Is this implementation correct?

gen_integer(I) :- random_between(-999999999999999999999999999999999999999999999999, 999999999999999999999999999999999999999999999999, I).

%% Boolean type

bool(true).
bool(false).
gen_bool(B) :- bool(B).

%% Unit type

unit(unit).
gen_unit(U) :- unit(U).

%% Double type
%% Here, for our proupose we fix the double's range boundary

double(Min, Max, D) :-
    random(F),
    D is Min + F * (Max - Min).

double(D) :- double(-9999999, 9999999, D).
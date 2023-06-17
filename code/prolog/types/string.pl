%% String type

%% There is a predicate string(S) in the prolog's prelude to check if an expression is a string or not
%% It is not the best approach to generate a string, also because it generates a list of character
%% that is a string in haskell but it representation is not a concatenated string between double quotes.

gen_string(S) :-
    length(L, _),
    maplist(gen_char, L),
    atom_string(L,S),
    string(S).

%% Limited version

% gen_string(S) :-
%    repeat,
%    random_between(0, 999999, N),
%    (length(L, N), maplist(gen_char, L), atom_string(L,S), string(S), !; fail).

%% Bounded version

% gen_string(N, S) :-
%   length(L, N),
%   maplist(gen_char, L),
%   atom_string(L,S),
%   string(S).

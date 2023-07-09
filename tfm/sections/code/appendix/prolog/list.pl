:- module(list, [list/3]).

% Import here both types and generator modules
% By using :- consult(path/subpath/file.pl).

%% Bounded Polymorphic Type List
%% Example:
%%  list(char, 4, X).
%%  list(bool, 4, X).
%%  list(int, 4, X).

list(_, 0, []).

list(Gen, Length, [X|Xs]) :-
   Length > 0,
   N1 is Length - 1,
   gen(Gen, X),
   list(Gen, N1, Xs).



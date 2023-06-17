:- module(list, [list/1, list/2, list/3, glist/2, glist/3]).
:- consult('../types/gen_types').
:- consult('../types/all').

%% List

list([]).
list([_|Xs]) :- list(Xs).

%% Format: [_,_,_,_]

list(0, []).
list(Length, [_|Xs]) :-
   Length > 0,
   N1 is Length - 1,
   list(N1, Xs).

%% Format: _:_:_:_:[]

% list(0, []).
% list(Length, _:Xs) :-
%     Length > 0,
%     N1 is Length - 1,
%     list(N1, Xs).

%% Bounded Polymorphic Type List
%%
%% Example:
%%  list(char, 4, X).
%%  list(bool, 4, X).
%%  list(int, 4, X).

list(_, 0, []).

list(Type, Length, [X|Xs]) :-
   Length > 0,
   N1 is Length - 1,
   types:gen(Type, X),
   list(Type, N1, Xs).

%% Unbounded Polymorphic Type List
% ulist(_, []).
% ulist(Type, [X|Xs]) :-
%    types:gen(Type, X),
%    ulist(Type, Xs). 

%% Use any generator that is not defined in gen_types

glist(_, []).
glist(Gen, [X|Xs]) :-
   call(Gen, X),
   glist(Gen, Xs).


glist(_, 0, []).
glist(Gen, Length, [X|Xs]) :-
   Length > 0,
   N1 is Length - 1,
   call(Gen, X),
   list(Gen, N1, Xs).


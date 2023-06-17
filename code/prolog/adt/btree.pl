:- module(btree, [bt/1, bt/2, bt/3]).
:- consult('../types/gen_types').
:- consult('../types/all').

%% Binary Tree

bt(nil).

bt(t(_,L,R)) :- bt(L), bt(R).


%% Bounded Binary Tree

bt(0, nil).

bt(1, t(_,nil,nil)).

bt(Length, t(_,L,nil)) :-
   Length > 1,
   N1 is Length - 1,
   bt(N1, L).

bt(Length, t(_,nil,R)) :-
   Length > 1,
   N1 is Length - 1,
   bt(N1, R).

bt(Length, t(_,L,R)) :-
   Length > 1,
   N1 is Length - 1,
   bt(N1, L), bt(N1, R).


%% Bounded Polymorphic Type Binary Tree
%%
%% Example:
%%  bt(char, 4, X).
%%  bt(bool, 4, X).
%%  bt(int, 4, X).

bt(_, 0, nil).

bt(Type, 1, t(N,nil,nil)) :- types:gen(Type, N).

bt(Type, Length, t(N,L,nil)) :-
   Length > 1,
   N1 is Length - 1,
   types:gen(Type, N),
   bt(Type, N1, L).

bt(Type, Length, t(N,nil,R)) :-
   Length > 1,
   N1 is Length - 1,
   types:gen(Type, N),
   bt(Type, N1, R).

bt(Type, Length, t(N,L,R)) :-
   Length > 1,
   N1 is Length - 1,
   types:gen(Type, N),
   bt(Type, N1, L), bt(Type, N1, R).


%% Unbounded Polymorphic Type Binary Tree
% ubt(_, nil).
% ubt(Type, t(N,nil,nil)) :- types:gen(Type, N).
% ubt(Type, t(N,L,nil)) :-
%    types:gen(Type, N),
%    ubt(Type, L).
% ubt(Type, t(N,nil,R)) :-
%    types:gen(Type, N),
%    ubt(Type, R).
% ubt(Type, t(N,L,R)) :-
%    types:gen(Type, N),
%    ubt(Type, L), ubt(Type, R).
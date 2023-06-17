:- module(bstree, [bst/1, bst/2, bst/3]).
:- use_module(library(clpfd)).
:- consult('../types/gen_types').
:- consult('../types/all').

%% Binary Search Tree

bst(nil).

bst(t(_,nil,nil)).

bst(t(N,L,nil)) :-
   L = t(LN,_,_), LN #< N, bst(L).

bst(t(N,nil,R)) :-
   R = t(RN,_,_), RN #> N, bst(R).

bst(t(N,L,R)) :-
   L = t(LN,_,_), LN #< N, bst(L),
   R = t(RN,_,_), RN #> N, bst(R).


%% Bounded Binary Search Tree

bst(0, nil).

bst(1, t(_,nil,nil)).

bst(Length, t(N,L,nil)) :-
   Length > 1,
   N1 is Length - 1,
   L = t(LN,_,_), LN #< N,
   bst(N1, L).

bst(Length, t(N,nil,R)) :-
   Length > 1,
   N1 is Length - 1,
   R = t(RN,_,_), RN #> N,
   bst(N1, R).

bst(Length, t(N,L,R)) :-
   Length > 1,
   N1 is Length - 1,
   L = t(LN,_,_), LN #< N,
   R = t(RN,_,_), RN #> N,
   bst(N1, L), bst(N1, R).


%% Bounded Polymorphic Type Binary Search Tree
%%
%% Example:
%%  bst(char, 4, X). > Not work! (char has not order relationship)
%%  bst(bool, 4, X). > Not work! (bool has not order relationship)
%%  bst(int, 4, X). > Works! (int has order relationship)

bst(_, 0, nil).

bst(Type, 1, t(N,nil,nil)) :- types:gen(Type, N).

bst(Type, Length, t(N,L,nil)) :-
   Length > 1,
   N1 is Length - 1,
   types:gen(Type, N),
   L = t(LN,_,_), LN #< N,
   bst(Type, N1, L).

bst(Type, Length, t(N,nil,R)) :-
   Length > 1,
   N1 is Length - 1,
   types:gen(Type, N),
   R = t(RN,_,_), RN #> N,
   bst(Type, N1, R).

bst(Type, Length, t(N,L,R)) :-
   Length > 1,
   N1 is Length - 1,
   types:gen(Type, N),
   L = t(LN,_,_), LN #< N,
   R = t(RN,_,_), RN #> N,
   bst(Type, N1, L), bst(Type, N1, R).


%% Unbounded Polymorphic Type Binary Search Tree

% ubst(_, nil).
% 
% ubst(Type, t(N,nil,nil)) :- types:gen(Type, N).
% 
% ubst(Type, t(N,L,nil)) :-
%    types:gen(Type, N),
%    L = t(LN,_,_), LN #< N,
%    ubst(Type, L).
% 
% ubst(Type, t(N,nil,R)) :-
%    types:gen(Type, N),
%    R = t(RN,_,_), RN #> N,
%    ubst(Type, R).
% 
% ubst(Type, t(N,L,R)) :-
%    types:gen(Type, N),
%    L = t(LN,_,_), LN #< N,
%    R = t(RN,_,_), RN #> N,
%    ubst(Type, L), ubst(Type, R).
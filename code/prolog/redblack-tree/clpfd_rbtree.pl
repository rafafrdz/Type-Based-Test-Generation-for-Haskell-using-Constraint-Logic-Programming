%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Option 4: Red Black Trees with Constraint Logic Programming over Finite Domain CLP(FD)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Red Black Nodes
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

:- use_module(library(clpfd)).
:- discontiguous bstree/1.
:- discontiguous less/3.
:- discontiguous greater/3.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Red Black Nodes
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Is either red node or black node
isRB(X) :- red(X).
isRB(X) :- black(X).

%% Definition of red node
red(t(r,_,L,R)) :- black(L), black(R).

%% Definition of black node
black(nil).
black(t(b,_,L,R)) :- isRB(L), isRB(R).


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Implementation of Binary Search Tree for Red and Black Nodes
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% - Nil - %%
bstree(nil).
less(X, nil, X).
greater(X, nil, X).

%% - Red node - %%
bstree(t(_,X,L,R)) :- greater(X,L,X), less(X, R, X), bstree(L), bstree(R).
less(X, t(_,Y,_,_), X) :- X #< Y.
greater(X, t(_,Y,_,_), X) :- Y #< X.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Balance of Black Nodes
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% To control the balance (number of black node in every path)
countblack(nil, 0).
countblack(t(b,_,L,R), Z) :- 0 #=< N, Z #= N + 1, countblack(L, N), countblack(R,N).
countblack(t(r,_,L,R), N) :- 0 #=< N, countblack(L, N), countblack(R,N).

balance(t(b,_,L,R), N) :- countblack(L,N), countblack(R, N).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Depth of Trees
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% To control the depth of a tree
depth(nil, 0).
depth(t(_,_,L,R), Z) :- 0 #=< N, N #< Z, 0 #=< M, M #< Z, depth(L, N), depth(R, M).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Red-Black Tree
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
rbtree(X, N) :- depth(X, N), balance(X, _), bstree(X).
rbtree(X) :- depth(X, _), balance(X, _), bstree(X). %% This one have sense just for to know if a given tree is a red black tree, not for generate test cases.


%% Examples.
%% X = t(b, 13, t(r, 8, t(b, 1, nil, t(r, 6, nil, nil)), t(b, 11, nil, nil)), t(r, 17, t(b, 15, nil, nil), t(b, 25, t(r, 22, nil,nil), t(r, 27, nil, nil)))) -- true
%% Y = t(b, 13, t(r, 8, nil, nil), t(r, 6 nil, nil)) -- false

%% Google Images
%% X1 = t(b, 12, t(b, 5, t(b, 3, nil, t(r, 4, nil, nil)), t(r, 10, t(b, 7, t(r, 6, nil, nil), t(r, 8, nil, nil)), t(b, 11, nil, nil))), t(b, 15, t(b, 13, nil, t(r, 14, nil, nil)), t(b, 17, nil, nil))) -- true
%% X2 = t(b, 61, t(b, 52, t(b, 20, t(r, 16, nil, nil), nil), t(b, 55, nil, nil)), t(b, 85, t(r, 76, t(b, 71, t(r, 65, nil, nil), nil), t(b, 81, nil, nil)), t(r, 93, t(b, 90, nil, nil), t(b, 101, nil, nil)))) -- true

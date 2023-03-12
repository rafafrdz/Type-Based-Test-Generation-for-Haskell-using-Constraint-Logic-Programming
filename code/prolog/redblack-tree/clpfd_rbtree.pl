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
red(t(_,r,L,R)) :- black(L), black(R).

%% Definition of black node
black(nil).
black(t(_,b,L,R)) :- isRB(L), isRB(R).


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Implementation of Binary Search Tree for Red and Black Nodes
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% - Nil - %%
bstree(nil).
less(X, nil, X).
greater(X, nil, X).

%% - Red node - %%
bstree(t(X,_,L,R)) :- greater(X,L,X), less(X, R, X), bstree(L), bstree(R).
less(X, t(Y,_,_,_), X) :- X #< Y.
greater(X, t(Y,_,_,_), X) :- Y #< X.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Balance of Black Nodes
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% To control the balance (number of black node in every path)
countblack(nil, 0).
countblack(t(_,b,L,R), Z) :- 0 #=< N, Z #= N + 1, countblack(L, N), countblack(R,N).
countblack(t(_,r,L,R), N) :- 0 #=< N, countblack(L, N), countblack(R,N).

balance(t(_,b,L,R), N) :- countblack(L,N), countblack(R, N).

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
%% X = t(13, b, t(8, r, t(1, b, nil, t(6, r, nil, nil)), t(11, b, nil,nil)), t(17, r, t(15, b, nil, nil), t(25, b, t(22, r, nil,nil), t(27, r, nil,nil)))) -- true
%% Y = t(13, b, t(8, r, nil, nil), t(6, r, nil, nil)) -- false

%% Google Images
%% X1 = t(12, b, t(5, b, t(3, b, nil, t(4, r, nil, nil)), t(10, r, t(7, b, t(6, r, nil, nil), t(8, r, nil, nil)), t(11, b, nil, nil))), t(15, b, t(13, b, nil, t(14, r, nil, nil)), t(17, b, nil, nil))) -- true
%% X2 = t(61, b, t(52, b, t(20, b, t(16, r, nil, nil), nil), t(55, b, nil, nil)), t(85, b, t(76, r, t(71, b, t(65, r, nil, nil), nil), t(81, b, nil, nil)), t(93, r, t(90, b, nil, nil), t(101, b, nil, nil)))) -- true

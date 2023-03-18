%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Option 3: Red Black Trees with Constraint Logic Programming over Rationals CLP(Q)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Red Black Nodes
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

:- use_module(library(clpq)).
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

%% - Node - %%
bstree(t(_,X,L,R)) :- greater(X,L,X), less(X, R, X), bstree(L), bstree(R).
less(X, t(_,Y,_,_), X) :- clpq:{X < Y}.
greater(X, t(_,Y,_,_), X) :- clpq:{Y < X}.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Balance of Black Nodes
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% To control the balance (number of black node in every path)
countblack(nil, 0).
countblack(t(b,_,L,R), Z) :- clpq:{0 =< N},  clpq:{Z = N + 1}, countblack(L, N), countblack(R,N).
countblack(t(r,_,L,R), N) :- clpq:{0 =< N}, countblack(L, N), countblack(R,N).

balance(t(b,_,L,R), N) :- countblack(L,N), countblack(R, N).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Depth of Trees
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% To control the depth of a tree
depth(nil, 0).
depth(t(_,_,L,R), Z) :- clpq:{0 =< N, N + 1 =< Z, 0 =< M, M + 1 =< Z}, depth(L, N), depth(R, M).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Red-Black Tree
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
rbtree(X, N) :- depth(X, N), balance(X, _), bstree(X).
rbtree(X) :- depth(X, _), balance(X, _), bstree(X).


%% Examples.
%% X = t(13, b, t(8, r, t(1, b, nil, t(6, r, nil, nil)), t(11, b, nil,nil)), t(17, r, t(15, b, nil, nil), t(25, b, t(22, r, nil,nil), t(27, r, nil,nil)))) -- true
%% Y = t(13, b, t(8, r, nil, nil), t(6, r, nil, nil)) -- false

%% Google Images
%% X1 = t(12, b, t(5, b, t(3, b, nil, t(4, r, nil, nil)), t(10, r, t(7, b, t(6, r, nil, nil), t(8, r, nil, nil)), t(11, b, nil, nil))), t(15, b, t(13, b, nil, t(14, r, nil, nil)), t(17, b, nil, nil))) -- true
%% X2 = t(61, b, t(52, b, t(20, b, t(16, r, nil, nil), nil), t(55, b, nil, nil)), t(85, b, t(76, r, t(71, b, t(65, r, nil, nil), nil), t(81, b, nil, nil)), t(93, r, t(90, b, nil, nil), t(101, b, nil, nil)))) -- true

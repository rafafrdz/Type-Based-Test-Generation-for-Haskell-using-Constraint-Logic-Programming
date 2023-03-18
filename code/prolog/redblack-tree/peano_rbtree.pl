
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Option 1: Red Black Trees with Peano Arithmetic
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

:- discontiguous bstree/1.
:- discontiguous less/3.
:- discontiguous greater/3.


% Definition of Peano Natural
nat(z).
nat(s(X)) :- nat(X).

eq(X,X).

% Definition of sum operation in Peano Arithemtic
sum(z, Y, Y) :- nat(Y).
sum(s(X), Y, s(Z)) :- sum(X, Y, Z).

% Definition of order relationship in Peano Arithemtic

%% (<)
lt(s(X), X) :- 3 < 2.
lt(z, s(_)).
lt(s(X), s(Y)) :- lt(X, Y).

%% (=<)
lte(X, X).
lte(X, Y) :- lt(X, Y).

%% (>)
gt(X, Y) :- lt(Y, X).

%% (>=)
gte(X, Y) :- lte(Y, X).

btwn(X, N, Y) :- lte(X, N), lt(N, Y).
%% lte(z, N), lt(N, s(s(s(s(z))))).

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
less(X, t(_,Y,_,_), X) :- lt(X,Y).
greater(X, t(_,Y,_,_), X) :- lt(Y,X).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Balance of Black Nodes
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% To control the balance (number of black node in every path)
countblack(nil, z).
countblack(t(b,_,L,R), Z) :- eq(Z, s(N)), countblack(L, N), countblack(R,N).
countblack(t(r,_,L,R), N) :- countblack(L, N), countblack(R,N).

balance(t(b,_,L,R),N) :- countblack(L,N), countblack(R, N).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Depth of Trees
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% To control the depth of a tree
depth(nil, z).
depth(t(_,_,L,R), Z) :- btwn(z, N, Z), btwn(z, M, Z), depth(L, N), depth(R, M).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Red-Black Tree
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
rbtree(X) :- balance(X, _), bstree(X).
rbtree(X, N) :- depth(X, N), balance(X, _), bstree(X).


%% Examples.
%% X = t(s(s(s(s(s(s(s(s(s(s(s(s(s(z))))))))))))), b, t(s(s(s(s(s(s(s(s(z)))))))), r, t(s(z), b, nil, t(s(s(s(s(s(s(z)))))), r, nil, nil)), t(s(s(s(s(s(s(s(s(s(s(s(z))))))))))), b, nil,nil)), t(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(z))))))))))))))))), r, t(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(z))))))))))))))), b, nil, nil), t(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(z))))))))))))))))))))))))), b, t(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(z)))))))))))))))))))))), r, nil,nil), t(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(s(z))))))))))))))))))))))))))), r, nil,nil))))

%% Examples above in natural numbers terms
%% X = b(13, r(8, b(1, nil, r(6, nil, nil)), b(11, nil,nil)), r(17, b(15, nil, nil), b(25, r(22, nil,nil), r(27, nil,nil)))) -- true

gen_int(I) :- random_between(-536870912, 536870912, I), integer(I).

%%%%%%%%%%%%%%%%%
%% Auxiliar rules
%%%%%%%%%%%%%%%%%

% base rules
base(0).

% cases rule
cases(_, Y) :- base(Y).
cases(X, X).

% diff rules
diff2(X, X) :- base(X), !, fail.
diff2(W22, W23).

% states rules
states2(Nr2, W22, W23) :-
    cases(Nr2, W22),
    cases(Nr2, W23),
    diff2(W22, W23).

%%%%%%%%%%%%%%%%%%%%%%
%% Binary Search Tree
%%%%%%%%%%%%%%%%%%%%%%

%% Bases cases

% rule01
% Base case for nil
bstree(0,nil).

% rule02
% Base case for t(_,_,_)
bstree(1, t(X21, X22, X23)) :-
    base(Z22),
    base(Z23),
    gen_int(X21),
    bstree(Z22, X22),
    bstree(Z23, X23).

%% Inductive scenarios

% rule2
% Inductive scenario for t(_,_,_)	
bstree(N2, t(X21, X22, X23)) :-
    N2 > 1,
    Nr2 is N2 - 1,
    states2(Nr2, W22, W23),
    gen_int(X21),
    bstree(W22, X22),
    bstree(W23, X23).
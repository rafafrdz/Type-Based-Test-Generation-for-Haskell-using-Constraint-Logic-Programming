%%%%%%%%%%%%%%%%%%%%%%
%% MyListBool ADT
%%%%%%%%%%%%%%%%%%%%%%

% rule01
% Base case for nil
mylistbool(0,nil).

% rule02
% Base case for cons(_,_)
mylistbool(1, cons(X21, X22)) :-
    base(Z22),
    gen_bool(X21),
    mylistbool(Z22, X22).

% rule2
% Inductive scenario for cons(_,_,_)	
mylistbool(N2, cons(X21, X22)) :-
    N2 > 1,
    Nr2 is N2 - 1,
    states2(Nr2, W22),
    gen_bool(X21),
    mylistbool(W22, X22).


%%%%%%%%%%%%%%%%%
%% Auxiliar rules
%%%%%%%%%%%%%%%%%

% base rules
base(0).

% cases rule
cases(_, Y) :- base(Y).
cases(X, X).

% diff rules
diff2(X) :- base(X), !, fail.
diff2(W22).

% states rules
states2(Nr2, W22) :-
    cases(Nr2, W22),
    diff2(W22).

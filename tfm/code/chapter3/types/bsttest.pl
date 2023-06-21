
gen_int(I) :- random_between(-536870912, 536870912, I), integer(I).

% Caso base nil
bstree(0,nil).

% Caso inductivo nil	
%% bstree(N1, nil).	

% Caso base t(_,_,_)
bstree(1, t(X21, nil, nil)) :- gen_int(X21).

% Caso inductivo t(_,_,_)	

% a21 x ax22 x a23
bstree(N1, t(X21, X22, X23)) :-
    N1 > 1,
    N2 is N1 - 1,
    gen_int(X21),
    bstree(N2, X22),
    bstree(0, X23).

bstree(N1, t(X21, X22, X23)) :-
    N1 > 1,
    N3 is N1 - 1,
    gen_int(X21),
    bstree(0, X22),
    bstree(N3, X23).

bstree(N1, t(X21, X22, X23)) :-
    N1 > 1,
    N2 is N1 - 1,
    N3 is N1 - 1,
    gen_int(X21),
    bstree(N2, X22),
    bstree(N3, X23).
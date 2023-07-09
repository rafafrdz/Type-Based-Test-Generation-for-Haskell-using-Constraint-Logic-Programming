gen_int(I) :- random_between(-536870912, 536870912, I), integer(I).
gen_char(C) :-
    repeat,
    random_between(0, 7935, Code),
    (char_code(C, Code), !; fail).
gen_string(S) :-
   repeat,
   random_between(0, 99, N),
   (length(L, N), maplist(gen_char, L), atom_string(L,S), string(S), !; fail).

bool(true).
bool(false).

gen_bool(B) :- bool(B).

%% Nil
%% N = 0 (caso base)
bt(0, nil).

%% N > 0 (induccion)
% bt(Length, nil) -> No hay porque no tiene X1j

%% T(Bool, BSTree, BSTree)
%% N = 1 (caso base)
bt(1, t(X21,nil,nil)) :-
    gen_bool(X21).

%% N > 1 (induccion)

%% Induccion sobre X22
bt(Length, t(X21,L,nil)) :-
    gen_bool(X21),
    Length > 1,
    N1 is Length - 1,
    bt(N1, L).
%% Induccion sobre X23
bt(Length, t(X21,nil,R)) :-
    gen_bool(X21),
    Length > 1,
    N1 is Length - 1,
    bt(N1, R).

%% Induccion sobre X22 y X23
bt(Length, t(X21,L,R)) :-
    gen_bool(X21),
    Length > 1,
    N1 is Length - 1,
    bt(N1, L), bt(N1, R).

%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%

%% Nil
%% N = 0 (caso base)
bta(0, nil).

%% N > 0 (induccion)
% bta(Length, nil) -> No hay porque no tiene X1j

%% T(Bool, BSTree, BSTree)
%% N = 1 (caso base)
% bta(1, t(_,nil,nil)).

%% N > 1 (induccion)

%% Induccion sobre X23
bta(Length, t(_,L,R)) :-
    Length > 0,
    N1 is Length - 1,
    N2 is Length - 1,
    bta(N1, R),
    bta(N2, L).

% %% Induccion sobre X22 y X23
% bta(Length, t(_,L,R)) :-
%     Length > 0,
%     N1 is Length - 1,
%     bta(N1, L), bta(N1, R).



%% Caso rstree
rstree(0, _, r(_, [])).
rstree(W, N, r(_, Xs)) :-                      %% caso induccion
        W > 0,
        W1 is W - 1,
        listrstree(W1, N, Xs).

%% Caso Lista
listrstree(_, 0, []).
listrstree(W, N, [X|Xs]) :-                    %% caso induccion
    N > 0,
    N1 is N - 1,
    rstree(W, N, X),
    listrstree(W, N1, Xs).
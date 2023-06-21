%% Fijo en anchura y fijo en profundidad

%% Caso rstree
%% rstree(1, _, r(_,[])).                         %% caso base
%% rstree(W, N, r(_, Xs)) :-                      %% caso induccion
%%         W > 1,
%%         W1 is W - 1,
%%         listrstree(W1, N, Xs).
%% 
%% %% Caso Lista
%% listrstree(_, 0, []).                          %% caso base
%% listrstree(W, N, [X|Xs]) :-                    %% caso induccion
%%     N > 0,
%%     N1 is N - 1,
%%     rstree(W, N, X),
%%     listrstree(W, N1, Xs).


%% Libre en anchura fijo en profundidad

%% Caso rstree
%% rstree(1, r(_,[])).                         %% caso base
%% rstree(W, r(_, Xs)) :-                      %% caso induccion
%%         W > 1,
%%         W1 is W - 1,
%%         listrstree(W1, Xs).
%% 
%% %% Caso Lista
%% listrstree(_, []).                          %% caso base
%% listrstree(W, [X|Xs]) :-                    %% caso induccion
%%     rstree(W, X),
%%     listrstree(W, Xs).
%% 






%% Implementacion para listas normales

% %% Caso rstree
% rstree(0, _, r(_, [])).
% rstree(W, N, r(_, Xs)) :-                      %% caso induccion
%         W > 0,
%         W1 is W - 1,
%         listrstree(W1, N, Xs).
% 
% %% Caso Lista
% listrstree(_, 0, []).
% listrstree(W, N, [X|Xs]) :-                    %% caso induccion
%     N > 0,
%     N1 is N - 1,
%     rstree(W, N, X),
%     listrstree(W, N1, Xs).


gen_int(I) :- random_between(-536870912, 536870912, I), integer(I).
bool(true).
bool(false).
gen_bool(B) :- bool(B).

%% Implementacion para listas anidadas

% Caso base r(_,_)
rstree(0, _, r(X11, X12)) :-
    gen_bool(X11),
    list(0, 0, X12). %% W0 y L0

% Caso inductivo r(_,_)
rstree(W1, L1, r(X11, X12)) :-
    W1 > 0, %% W1 > W0
    W2 is W1 - 1,
    gen_bool(X11),
    list(W2, L1, X12).

% Caso base nil
list(_, 0, nil).

% Caso inductivo cons(_,_)
list(W1, L1, cons(X11, X12)) :-
    L1 > 0, %% L1 > L0
    L2 is L1 - 1,
    rstree(W1, L1, X11),
    list(W1, L2, X12).
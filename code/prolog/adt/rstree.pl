:- module(rstree, [rst/1, rst/2]).
:- consult('../types/gen_types').
:- consult('../types/all').

%% Rose Tree

rst(r(_,[])).
rst(r(_, [R|Rs])) :-
   rst(R),
   rst(r(_,Rs)).

%% Bounded Rose Tree

rst(1, t(_,[])).
rst(Length, t(_,[R|Rs])) :-
   Length > 1,
   N1 is Length - 1,
   rst(N1, R),
   rst(N1, Rs).

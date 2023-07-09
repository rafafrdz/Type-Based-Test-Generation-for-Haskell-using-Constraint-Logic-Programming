:- use_module(library(clpfd)).

%% Base case for an empty list
sorted_list([]).

%% Recursive case for a non-empty list
sorted_list(_:[]).
sorted_list(X1:X2:Xs) :- X1 #=< X2, sorted_list(X2:Xs).
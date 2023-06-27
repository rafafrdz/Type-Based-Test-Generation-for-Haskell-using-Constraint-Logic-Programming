list(_, 0, []).
list(Gen, Length, [X|Xs]) :-
   Length > 0,
   N1 is Length - 1,
   gen(Gen, X),
   list(Gen, N1, Xs).
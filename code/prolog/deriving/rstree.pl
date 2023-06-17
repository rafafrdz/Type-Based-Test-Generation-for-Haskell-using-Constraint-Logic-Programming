:- consult('../types/gen_types').
:- consult('../types/all').
:- consult('../adt/list').


tree(A, left(X11)) :- types:gen(A, X11).
tree(A, node(X21)) :- list:glist(tree(A), X21).
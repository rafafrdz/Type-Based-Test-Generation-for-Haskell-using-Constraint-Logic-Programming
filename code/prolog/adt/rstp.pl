:- consult('./list').

tree(leaf(_)).
tree(node(X21)) :- list:glist(tree, X21).

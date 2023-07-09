bstree(nil).																														%% rule 1
bstree(t(X21, X22, X23)) :- gen_int(X21), bstree(X22), bstree(X23).			%% rule 2
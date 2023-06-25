bstree(T, nil).					                %% rule 1
bstree(T, t(X21, X22, X23)) :-          %% rule 2
    gen(T, X21),
    bstree(T, X22),
    bstree(T, X23).
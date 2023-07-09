bstree(Type, nil).					                %% rule 1
bstree(Type, t(X21, X22, X23)) :-           %% rule 2
    gen(Type, X21),
    bstree(Type, X22),
    bstree(Type, X23).
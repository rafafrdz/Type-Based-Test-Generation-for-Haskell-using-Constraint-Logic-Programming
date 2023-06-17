
pred(ADT) = constr1
pred(ADT) = constr2

constr1: con1 -> atom(con1) '.'
constr1: Nil -> nil

constr2: con2 atype20 atype21 atype22 -> atom(con2) '(' X0 ',' X1 ',' X2 ')' ':-' funcT(atype21), funcT(atype22) '.'
constr2: T a (BTree a) (BTree a) -> t(X0, X1, X2)

funcT === pred

data simpletype = constrs
    simpletype = tycon tyvar1 .. tyvark ->
        atom(tycon) === pred


data simpletype = constrs -> pred(X)

data simpletype = constr1 | constr2 ->  pred(constr1)
                                        pred(constr2)


data simpletype = constr1 | constr2 ->  pred(atom(con1)) '.'
                                        pred(atom(con2) '(' X1 ',' X2 ')') ':-' pred(X1), pred(X2) '.'


data simpletype = constr1 | constr2 ->  pred(nil).
                                        pred(t(_, X1,X2)) :- pred(X1), pred(X2) .

data simpletype = constr1 | constr2 ->  bstree(nil).
                                        bstree(t(_, X1,X2)) :- bstree(X1), bstree(X2) .
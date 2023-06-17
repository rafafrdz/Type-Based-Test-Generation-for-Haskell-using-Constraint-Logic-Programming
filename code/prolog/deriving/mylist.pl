mylist(nil).
mylist(cons(X21, X22)) :- pred21(X21), pred22(X22).

mylist(nil).
mylist(cons(_, X22)) :- pred22(X22).

mylist(nil).
mylist(cons(_, X22)) :- mylist(X22).
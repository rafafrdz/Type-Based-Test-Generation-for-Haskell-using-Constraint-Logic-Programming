data Color = Red | Black

data RBTree a = Nil | T Color a (RBTree a) (RBTree a)
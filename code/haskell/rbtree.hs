data Color = R | B deriving Show

data Tree a = Nil | T Color a (Tree a) (Tree a) deriving Show

makeBlack :: Tree a -> Tree a
makeBlack (T _ y a b) = T B y a b
makeBlack t = t

balance :: Tree a -> Tree a
balance T B z (T R y (T R x a b) c) d = T R y (T B x a b) (T B z c d)
balance T B z (T R x a (T R y b c)) d = T R y (T B x a b) (T B z c d)
balance T B x a (T R z (T R y b c) d) = T R y (T B x a b) (T B z c d)
balance T B x a (T R y b (T R z c d)) = T R y (T B x a b) (T B z c d)
balance t = t

insert :: (Ord a) => a -> Tree a -> Tree a
insert x s = makeBlack $ insertAux s
  where insertAux Nil  = T R x Nil Nil
        insertAux (T c y a b)
          | x < y  = balance T c y (insertAux a) b
          | x == y = T c y a b
          | x > y  = balance T c y a (insertAux b)
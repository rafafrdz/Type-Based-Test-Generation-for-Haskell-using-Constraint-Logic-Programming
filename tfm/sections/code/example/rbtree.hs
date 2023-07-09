data Color = R | B deriving Show

data Tree a = Nil | T Color a (Tree a) (Tree a) deriving Show


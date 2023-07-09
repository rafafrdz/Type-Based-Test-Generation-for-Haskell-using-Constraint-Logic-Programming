insertOrdered :: Ord a => a -> [a] -> [a]
insertOrdered a [] = [a]
insertOrdered a xs'@(x:xs)
  | a <= x     = a : xs'
  | otherwise = x : insertOrdered a xs
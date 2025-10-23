producto :: [N] -> N

producto x:xs
            | x:xs == [] = 1
            | otherwise = x * producto xs

quitarCeros :: [N] -> [N]

quitarCeros x:xs
            | x:xs == [] = [1]
            | x != 0 = x:quitarCeros xs 
            | otherwise = quitarCeros xs

 
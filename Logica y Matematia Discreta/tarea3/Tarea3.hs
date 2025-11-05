import Prelude




---------------------------------
--Nombre 1	: Javier Fernandez
--Nro. 1	: 172271
---------------------------------
--Nombre 2 	: Facundo Duarte
--Nro. 2 	: 
---------------------------------

--------------------
----Ejercicio 1:----
--------------------


--1)
unir:: [a] -> [a] -> [a]
unir [] l2 = l2
unir (l:l1) l2 = l:(unir l1 l2)

--2)
producto :: [Int] -> Int
producto [] = 1
producto (ln:l) = ln * producto l 

--3)
{--
(∀ l1,l2::[Int]) producto(unir l1 l2) = (producto l1)*(producto l2)

Caso base -> l1 = []

producto(unir [] l2) = (producto []) * (producto l2)

->Por def de unir -> unir [] l2 = l2

->Por def de producto -> producto [] = 1

prodcuto(l2) = 1 * producto l2

-> Por def del neutro de la multiplicación -> 1*n=n

producto l2 = producto l2

Caso inductivo

Hipotesis:

producto(unir l1 l2) = (producto l1)*(producto l2)

Tesis:

producto(unir l:l1 l2) = (producto l:l1)*(producto l2)

-> por def unir -> unir l:l1 l2 = l:(unir l1 l2)

producto(l:unir l1 l2) = l*(producto l1)*(producto l2)

-> por def producto -> l1:l = l1 * producto l 

l*producto(unir l1 l2) = l*(producto l1)*(producto l2)

por H -> producto(unir l1 l2) = (producto l1)*(producto l2)

Se sustituye en el lado izquierdo la Hipotesis

l*(producto l1)*(producto l2) = l*(producto l1)*(producto l2)





-}

--------------------
----Ejercicio 2:----
--------------------
--1)
cumplen :: (a -> Bool) -> [a] -> [a]
cumplen _ [] = []
cumplen p (x:xs) 
    | p x = x: cumplen p xs
    | otherwise = cumplen p xs

--2)
descartar :: (a -> Bool) -> [a] -> [a]
descartar _ [] = []
descartar p (x:xs) 
    | p x = descartar p xs
    | otherwise = x: descartar p xs

--3)
{--

length::[a] -> Int
length [ ] = 0
length ( :xs) = 1 + length xs


(∀ xs::[a]) (∀p::(a− > Bool)) 
length(cumplen p xs) + length(descartar p xs) = length xs

Caso base -> xs = []

length(cumplen p []) + length(descartar p []) = length []

->por def cumplen p [] = []

->por def descartar p [] = []

length([]) + length([]) = length []

-> por def length [] = 0

0 + 0 = 0

-> por neutro de la suma 0 + a = a

0 = 0

Caso inductivo:

Hipotesis:

length(cumplen p xs) + length(descartar p xs) = length xs


Tesis:

length(cumplen p x:xs) + length(descartar p x:xs) = length x:xs

-> caso 1: px

length(x: cumplen p xs) + length(descartar p xs) = length x:xs

-> por def length -> length(x:xs) = 1 + length xs

length(x: cumplen p xs) + length(descartar p xs) = 1 + length xs

-> por def length -> length(x:xs) = 1 + length xs

1 + length(cumplen p xs) + length(descartar p xs) = 1 + length xs

-> por H -> length(cumplen p xs) + length(descartar p xs) = length xs

1 + length xs = 1 + length xs

-> Caso 2: not(p x)

length(cumplen p xs) + length(x:descartar p xs) = length x:xs

-> por def length -> length(x:xs) = 1 + length xs

length(cumplen p xs) + length(x:descartar p xs) = 1 + length xs

-> por def length -> length(x:xs) = 1 + length xs

length(cumplen p xs) + 1 + length(descartar p xs) = 1 + length xs

-> por H -> length(cumplen p xs) + length(descartar p xs) = length xs

1 + length xs = 1 + length xs





-}

--------------------
----Ejercicio 3:----
--------------------

data Tree = L Int | U Int Tree | B Tree Int Tree
 deriving Show
 
--1)
t :: Tree
t = B (L 4) (8) (B (U 14 (L 9)) (16) (L 18))

--2)
sumTree :: Tree -> Int
sumTree (L a) = a
sumTree (U a b) = a + sumTree b
sumTree (B a b c) = b + sumTree a + sumTree c

--3)
treeToList :: Tree -> [Int]
treeToList (L a) = [a]
treeToList (U a b) = treeToList b ++ [a] 
treeToList (B a b c) = treeToList a ++ [b] ++ treeToList c


--4)
treeHeight :: Tree -> Int
treeHeight (L a) = 1
treeHeight (U a b) = 1 + treeHeight b
treeHeight (B a b c) = 1 + max (treeHeight a) (treeHeight c)



--5)
{-- 
completeLevel :: Tree -> Int -> Tree
completeLevel t h
            | h == 1 && t == (L a) = (L a)
            | h > 1 && t == (U a b) = B ((completeLevel b (h-1)) (a) (completeLevel b (h-1)))
            | h > 1 && t == (L a) = B ((completeLevel (L a) (h-1)) (a) (completeLevel (L a) (h-1)))
            | h > 1 && t == (B a b c) = B ((completeLevel a (h-1)) (b) (completeLevel c (h-1)))
            |otherwise = t
--}
completeLevel :: Tree -> Int -> Tree
completeLevel (L a) h 
                | h == 1 = (L a)
                | otherwise = B (completeLevel (L a) (h-1)) a (completeLevel (L a) (h-1))
completeLevel (U a b) h = B (completeLevel b (h-1)) (a) (completeLevel b (h-1))
completeLevel (B a b c) h = B (completeLevel a (h-1)) b (completeLevel c (h-1))



--6)
{--
(∀t::Tree) treeHeight(completeLevel t (treeHeight t)) = treeHeight t

Caso base t = (L a)

treeHeight(completeLevel (L a) (treeHeight (L a))) = treeHeight (L a)

Por def 
-> treeHeight L a = 1
-> completeLevel L a 1 = L a
-> treeHeight L a =  1

Pasos:
treeHeight(completeLevel (L a) (treeHeight (L a))) = treeHeight (L a)
treeHeight(completeLevel La 1) = treeHeight (L a)
treeHeight (L a) = treeHeight (L a)
1 = 1

Caso inductivo: 

--}

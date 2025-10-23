import prelude


module Tarea3 where

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
unir l1 l2 
    | [] l2 = l2
    | l:l1 l2 = l:(unir l1 l2)

--2)
producto :: [Int] -> Int
producto l 
    | [] = 1
    | l1:l = l1 * producto l 

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
cumplen p x:xs 
    | p [] = []
    | p x = x: cumplen p xs
    | otherwise = cumplen p xs

--2)
descartar :: (a -> Bool) -> [a] -> [a]
descartar p x:xs 
    | p [] = []
    | p x = descartar xs
    | otherwise = x: descartar xs

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
t = undefined

--2)
sumTree :: Tree -> Int
sumTree t = undefined 

--3)
treeToList :: Tree -> [Int]
treeToList t = undefined

--4)
treeHeight :: Tree -> Int
treeHeight t = undefined

--5) 
completeLevel :: Tree -> Int -> Tree
completeLevel t h = undefined

--6)
{--
(∀t::Tree) treeHeight(completeLevels t) = treeHeight t

--}

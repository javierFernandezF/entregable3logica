import Prelude

conect :: Bool -> Bool -> Bool

conect True True = False
conect True False = True
conect False True = False
conect False False = False



module Typeable where

import Data.Typeable
-- import V1
import V2

evil :: Typeable a => a -> String
evil a
    | Just s <- cast a = s
    | Just f <- cast a = f 'x'
    | otherwise = error "Yay, runtime type errors!"

main :: IO ()
main = putStrLn $ evil $ someFunc 5
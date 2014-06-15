{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE TypeSynonymInstances #-}
module Typeclass where

import V1
-- import V2

class Evil a where
    evil :: a -> String
instance Evil String where
    evil = id
instance Evil a => Evil (Char -> a) where
    evil f = evil (f 'x')

main :: IO ()
main = putStrLn $ evil $ someFunc 5
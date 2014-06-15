{-# LANGUAGE TemplateHaskell #-}
module TH where

import THHelper
import V1
-- import V2

main :: IO ()
main = putStrLn $ $(evil 'someFunc) 5
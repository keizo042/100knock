{-# LANGUAGE OverloadedStrings #-}
import qualified Codec.Binary.UTF8.String as U
import qualified Data.ByteString.Char8 as BSC8

main :: IO ()
main = putStrLn $ f x y' z
  where
    x = 12
    y = "気温"
    y' = y
    z = 22.4

f :: Int -> String -> Double -> String
f x y z = (show x) ++ "時の" ++ y ++ "は" ++ (show z) ++ "\n"


module Main where

main :: IO ()
main = rep <$> readFile "hightemp.txt"  >>= putStrLn

rep :: String -> String
rep [] = []
rep ('\t':xs) = ' ' : rep xs
rep (x:xs) = x : rep xs

module Main where
import Control.Applicative

dist1 = "col1.txt"
dist2 = "col2.txt"

main :: IO ()
main = rep <$> get >>= write

get :: IO String
get = do
  d1 <- readFile dist1
  d2 <- readFile dist2
  return $ d1 ++ d2

rep :: String -> String
rep [] = []
rep (' ':xs) = '\t' : rep xs
rep (x:xs) = x : rep xs

write :: String -> IO ()
write = writeFile "col.txt"

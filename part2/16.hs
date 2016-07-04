module Main where
import System.Environment (getArgs)
import Control.Applicative

file = "hightemp.txt"

main :: IO ()
main =  split <$> (getArgs >>= parse) >>= p

parse :: [String] -> IO  (Int,String)
parse []  = return (0,"")
parse (x:y:_) = do
  d <- readFile y
  return (read x :: Int , d)

split :: (Int, String) -> [String]
-- split (0, "") = []
split (i,s) =  g $ f $ words s
  where
    len = length s `div` i
    f :: [String] -> [[String]]
    f [] = []
    f s  = h : f d
      where
        (h, d) = (take len s, drop len s)

    g :: [[String]] -> [String]
    g [] = []
    g (x:xs) = concat x : g xs



p :: [String] -> IO ()
p [] = return ()
p (x:xs) =  putStrLn x >> p xs

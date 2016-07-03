module Main where
import System.Environment (getArgs)
import Control.Applicative

file = "hightemp.txt"

main :: IO ()
main =  split <$> (getArgs >>= parse) >>= p

parse :: [String] -> IO  (Int,String)
parse []  = return (0,"")
parse (x:y:_) = return (read x :: Int, x)

split :: (Int, String) -> [String]
split (0, "") = []
split (i,s) =  g $ f i $ words s
  where
    f :: Int -> [String] -> [[String]]
    f _ [] = []
    f i s = h: f i d
      where
        (h, d) = (take i s, drop i s)

    g :: [[String]] -> [String]
    g [] = []
    g (x:xs) = concat x : g xs



p :: [String] -> IO ()
p [] = return ()
p (x:xs) =  putStrLn x >> p xs

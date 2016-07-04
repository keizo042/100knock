module Main where
import Data.List(nub)

dist = "hightemp.txt"
main :: IO ()
main = getInfo dist >>=  (\x-> return $ pat x) >>= (\ x -> return $ con x) >>= print

getInfo :: String -> IO [String]
getInfo name =  lines <$> readFile name 

pat :: [String] ->  [String]
pat [] =  []
pat (x:xs) = ((words x) !! 0) : pat xs

con :: [String] -> String
con = undefined

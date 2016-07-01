{-# LANGUAGE ScopedTypeVariables #-}
import qualified Data.HashTable.IO as Hash
import qualified System.Random as R
dist = "I couldn't believe that I could actually understand what I was reading : the phenomenal power of the human mind ."

type Tbl k v = Hash.BasicHashTable k v

type Map = (Int, String)

main = (f dist) >>= putStrLn

f :: String -> IO String
f s = do
  h1 <- Hash.new
  h2 <- Hash.new
  h1' <- h h1 r
  h2' <- h h2 l
  construct h1' h2'
  where
    (r, l) = g ([],[]) (words s) 1
    h :: (Tbl Int String) -> [Map] -> IO (Tbl Int String)
    h t [] = return t
    h t ((i,s):ms) = do
      Hash.insert t i s
      h t ms



g :: Int -> ([Map],[Map]) -> [String] -> Int -> ([Map], [Map])
g m [] _ =  m
g (m,n) (x:xs) i 
      | (check x) = g (((i,x):m , n)) xs (i+1)
      | otherwise = g ((m , (i,x):n)) xs (i+1)
      where
        check :: String -> Bool
        check = (<= 4) . length


construct :: (Tbl Int String) -> (Tbl Int String) -> IO [String]
construct h j = do
  g <- R.newStdGen
  f 0 h j 
  where f :: R.StdGen -> Int -> (Tbl Int String) -> (Tbl Int String) -> IO [String]


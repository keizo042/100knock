import qualified Data.HashTable.IO as H
import qualified Data.List as L

type Tbl  k v = H.BasicHashTable k v

dist = "Hi He Lied Because Boron Could Not Oxidize Fluorine, New Nations Might Also Sign Peace Security Clause. Arthur King Can."

main :: IO ()
main =  ( f $ words dist ) >>= H.toList >>= (\x -> return $ L.sortBy cmp x) >>= print

f :: [String] -> IO (Tbl String Int)
f x = do
  h <- H.new
  f' 1 0 h x
  return h

f' :: Int -> Int-> (Tbl String Int) -> [String] -> IO (Tbl String Int)
f' _ _ h [] =  return h
f' c i h (x:xs) 
  | (check c)  = do
    H.insert h (head1 x) i
    f' (c + 1) (i + length x) h xs
  | otherwise = do
    H.insert h (head2 x) i
    f' (c + 1) (i + length x) h xs
  where
    head1 :: String -> String
    head1 [] = ""
    head1 (x:xs) = (x:[])

    head2 :: String -> String
    head2 [] = []
    head2 (x:y:_) = (x:y:[])

    check :: Int -> Bool
    check x = x == 1 || x == 5 || x == 6 || x == 7 || x == 8 || x == 9 || x == 15 || x == 16 || x == 19
    


cmp :: (String,Int) -> (String,Int) -> Ordering
cmp (_, x) (_, y) = compare x y

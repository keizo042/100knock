module Main where
import Control.Applicative

main :: IO ()
main = con <$> solve  >>= write 

solve :: IO ([String], [String])
solve = do
  d <- readFile "hightemp.txt"
  return $ (f $ lines d, g $ lines d)
  where
    f [] = []
    f (x:xs) = (words x) !! 1 : f xs
    g [] = []
    g (y:ys) = (words y) !! 2 : g ys


con :: ([String], [String]) -> (String , String)
con (x, y) = (f "\t" x, f "\t" y)
  where
    f :: String -> [String]  -> String
    f _ [] = []
    f a (x:xs) = x ++  a ++ (f a xs)

write :: (String, String) -> IO ()
write (x,y) = do
  writeFile "col1.txt" x
  writeFile "col2.txt" y



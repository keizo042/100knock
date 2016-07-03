module Main where
import Control.Applicative

main :: IO ()
main = do
  (i:name:_) <-  words <$> getLine
  cont <- readFile name
  putStrLn $ unlines $ take  (f i) $ reverse $ lines cont
  where
    f =  (\x -> read x :: Int )

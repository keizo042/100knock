module Main where
import Control.Applicative
import Data.Conduit
import qualified Data.Conduit.Binary as CB

main :: IO ()
main = count <$> readFile file  >>= print

count :: String -> Int
count x = length $ filter (\x -> x == '\n') x


file = "hightemp.txt"

{-


source :: Source IO Char
source = CB.sourceFile file

sink :: Sink Char IO Int
sink = do
  y <- await
  case y of
       Nothing  -> return 0
       (Just a) -> do
         return 1
         sink


r = runResourceT $ source $$ sink
-}

import qualified System.Random as R
import Data.List (partition)

main :: IO ()
main =  ( f $ sep dist) >>= putStrLn

dist :: String
dist = "I couldn't believe that I could actually understand what I was reading : the phenomenal power of the human mind ."


type D = (String, Int)

type Data = ([D], [D])

sep :: String -> Data
sep s = partition (\ (x, _) -> (length x) <= 4) $ zip ( words s ) [1..]

f :: Data -> IO String
f = undefined



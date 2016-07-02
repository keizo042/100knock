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
f d = do
  gen <- R.newStdGen
  g gen 0  d
  where
    g :: R.StdGen -> Int -> Data -> IO [Strinb]
    g _ _ [] [] = return []
    g _ _ xs [] = xs
    g gen i [] ys = (get gen ys) : (g gen' (i+1) ys')
      where
        (y, ys', gen') = get gen ys
    g gen i (x:xs) y = undefined

get :: R.StdGen -> [a] -> (a, [a], R.StdGen)
get f xs = undefined
  where
    (i,gen) = R.randomR (0,length xs -1)
    take :: [a] -> Int -> (a,[a])
    take x i = undefined

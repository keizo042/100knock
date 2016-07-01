
dist = "Now I need a drink, alcoholic of course, after the heavy lectures invlving quantum machanics."

main = sequence_ $ map pp $ f dist

f :: String -> [(String,Int)]
f = count . words

count :: [String] -> [(String,Int)]
count [] = []
count (x:xs) = (x, length xs):(count xs)

pp :: (String,Int) -> IO ()
pp (w,i) = putStrLn $ "word: " ++  w ++"\t\t|" ++ "length:" ++ show i 



dist = "パタトクカシーー"

main = putStrLn $ f dist

f :: String -> String
f [] = []
f (x:xs) = x:(f' xs)

f' :: String -> String
f' [] = []
f' (x:xs) = f xs

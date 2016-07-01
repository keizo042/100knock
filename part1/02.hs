

d1 = "パトカー"
d2 = "タクシー"

main = putStrLn  $ f d1 d2

f :: String -> String -> String
f [] _ = []
f _ [] = []
f (x:xs) (y:ys) = x:y:(f xs ys)

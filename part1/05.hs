

dist = "I am an NLPer"

main = do 
  print $  ngram 2 $ filter (\x -> x /= ' ') dist
  print $ ngram 2 $ words dist
  return ()

ngram i x = gram x
  where
    gram [] = []
    gram xs = grammer:(gram rest)
      where (grammer, rest) = splitAt i xs

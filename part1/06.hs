import qualified Data.List as L
dist1 = "paraparaparadise"

dist2 = "paragraph"


main = do
  let x =  bigram  dist1
  let y =  bigram dist2
  print $ x
  print $ y
  print $  x L.\\ y
  print $  L.union x y
  print $ x ++ y


bigram = ngram 2

ngram i x = gram x
  where
    gram [] = []
    gram xs = grammer:(gram rest)
      where (grammer, rest) = splitAt i xs

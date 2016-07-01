import Data.Char (chr,ord)

dist = "Yankee doodle went to town. Ride on the pony. he stack a further in his hat and call it macaroni."

main = putStrLn $ cipher dist

cipher :: String -> String
cipher [] = []
cipher (x:xs) = case (f x) of
                     True ->  (chr $ 219 - (ord x)): (cipher xs)
                     False -> x:(cipher xs)
  where
    f :: Char -> Bool
    f x = 'a' <= x && x <= 'z'

                       


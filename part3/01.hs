{-# LANGUAGE DeriveGeneric #-}
module Main where
import GHC.Generics
import Data.Aeson

data Wiki = Wiki {
  text :: String
  }
  deriving (Show, Generic)

instance ToJSON Wiki 

instance FromJSON Wiki


main :: IO ()
main = return ()

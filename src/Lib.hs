-- Lib: helper functions

module Lib
  ( splitOn,
    trimLeft,
    parseIntOrDefault,
  )
where

import Data.Char (isSpace)
import Text.Read
import Data.Maybe

splitOn :: Eq a => a -> [a] -> [[a]]
splitOn c s =
  case dropWhile (== c) s of
    [] -> []
    s' -> w : splitOn c s''
      where
        (w, s'') = break (== c) s'

trimLeft :: String -> String
trimLeft = dropWhile isSpace
  

parseIntOrDefault s d =
  fromMaybe d (readMaybe s)
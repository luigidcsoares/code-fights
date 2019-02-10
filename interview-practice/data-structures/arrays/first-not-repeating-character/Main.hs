import           Data.Map                       ( fromListWith
                                                , toList
                                                )
import           Data.List                      ( intersect )

-- | The "frequency" function returns a list of pairs where
-- each pair contains a value from "xs" and its calculated frequency. 
frequency :: (Ord k, Num a) => [k] -> [(k, a)]
frequency xs = toList $ fromListWith (+) [ (x, 1) | x <- xs ]

-- | The "firstNotRepeatingCharacter" takes a string and returns
-- the first character that have a frequency of one.
firstNotRepeatingCharacter :: String -> Char
firstNotRepeatingCharacter [] = '_'
firstNotRepeatingCharacter xs | null filtered = '_'
                              | otherwise     = head $ xs `intersect` filtered
  where filtered = map fst $ filter ((== 1) . snd) $ frequency xs

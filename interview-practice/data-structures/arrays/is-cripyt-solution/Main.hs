import qualified Data.Map                      as Map

-- | Receives an array of strings `crypt`, the cryptarithm, and an an
-- array containing the mapping of letters and digits, `solution`. The
-- array `crypt` will contain three non-empty strings that follow the
-- structure: [word1, word2, word3], which should be interpreted as
-- the word1 + word2 = word3 cryptarithm.
-- If `crypt`, when it is decoded by replacing all of the letters in
-- the cryptarithm with digits using the mapping in `solution`, becomes
-- a valid arithmetic equation containing no numbers with leading zeroes,
-- the answer is true. If it does not become a valid arithmetic solution,
-- the answer is false.
isCryptSolution :: [String] -> [[Char]] -> Bool
isCryptSolution crypt solution = not hasAnyLeading && isValid decoded
 where
  solutionMap = Map.fromList . map tuplify $ solution
  getFrom coll key = case Map.lookup key coll of
    Just digit -> digit
  decoded = map (map (getFrom solutionMap)) crypt
  hasLeading coll@(x : _) = (length coll > 1) && (x == '0')
  hasAnyLeading = any hasLeading decoded
  strToInt str = read str :: Integer
  isValid [x, y, z] = (strToInt x) + (strToInt y) == (strToInt z)

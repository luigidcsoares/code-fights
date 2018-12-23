import           Data.List                      ( all
                                                , transpose
                                                )
import           Data.Set                       ( fromList
                                                , size
                                                )
-- | The 'hasDuplicates' function returns whether a list has any duplicate value
-- or not.
hasDuplicates :: (Ord a) => [a] -> Bool
hasDuplicates xs = length xs /= (size . fromList $ xs)

-- | The 'partition' function split a list into small groups of size n.
-- For example,
-- >>> partition 2 [1, 2, 3, 4]
-- [[1, 2], [3, 4]]
partition :: Int -> [a] -> [[a]]
partition _ [] = []
partition n xs = (take n xs) : (partition n $ drop n xs)


-- | The 'splitBlocks' function takes a matrix and split it into submatrices of
-- size n. For example,
-- >>> splitBlocks 2 [[1, 2, 3, 4], [1, 2, 3, 4]]
-- [[[1, 2], [1, 2]], [[3, 4], [3, 4]]]
splitBlocks :: Int -> [[a]] -> [[[a]]]
splitBlocks n xss = concatMap transpose . partition n . map (partition n) $ xss

-- | The 'sudoku2' function takes a grid (9x9) and returns whether it represents
-- a valid grid or not. To be a valid puzzle the given grid cannot contain
-- duplicate values in its rows, columns or in each 3x3 subgrid that compose the
-- grid.
sudoku2 :: [[Char]] -> Bool
sudoku2 grid = validRows && validCols && validGrid
 where
  validate block = all (not . hasDuplicates . filter (/= '.')) block
  validRows = validate grid
  validCols = validate . transpose $ grid
  validGrid = validate . map concat . splitBlocks 3 $ grid

import           Data.List                      ( transpose )

-- | the 'rotateImage' function rotate the image by 90 degrees.
-- For example,
-- >>> rotateImage [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
-- [[7, 4, 1], [8, 5, 2], [9, 6, 3]]
rotateImage :: [[a]] -> [[a]]
rotateImage = transpose . reverse

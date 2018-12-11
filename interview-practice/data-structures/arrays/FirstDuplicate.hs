import qualified Data.HashSet                  as HashSet

-- | The 'firstDuplicate' function find the first duplicated
-- element with the lowest index in a list.
-- It is implemented with a call to a tail recursive function that
-- constructs a HashSet containing all the elements of 'xs' until
-- it finds the first repeated element.
-- It takes a list of any type and returns a scalar value of
-- the same type.
firstDuplicate :: [a] -> a
firstDuplicate xs = go xs HashSet.empty
 where
  go [] hashset = -1
  go (y : ys) hashset | y `HashSet.member` hashset = y
                      | otherwise = go ys (HashSet.insert y hashset)

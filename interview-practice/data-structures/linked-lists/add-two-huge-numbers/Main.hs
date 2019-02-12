-- Definition for singly-linked list:
-- data ListNode a = ListNode { val :: a
--                            , next :: ListNode a
--                            } | Nil deriving Show
--

import           Data.Foldable

instance Foldable ListNode where
  foldMap f Nil = mempty
  foldMap f (ListNode x xs) = f x `mappend` foldMap f xs

reversel :: (Foldable t) => t a -> ListNode a
reversel = foldl (flip ListNode) Nil

addTwoHugeNumbers :: (Ord a, Num a, Foldable t) => t a -> t a -> ListNode a
addTwoHugeNumbers a b = go reversedA reversedB 0 Nil
 where
  reversedA = reversel a
  reversedB = reversel b

  -- | Helper function to add each single part of this huge number.
  go Nil Nil _ _ = Nil

  go (ListNode x Nil) Nil carry result
    | partialSum <= 9999 = ListNode partialSum result
    | otherwise          = ListNode 1 $ ListNode (partialSum - 10000) result
    where partialSum = x + carry

  go Nil (ListNode y Nil) carry result
    | partialSum <= 9999 = ListNode partialSum result
    | otherwise          = ListNode 1 $ ListNode (partialSum - 10000) result
    where partialSum = y + carry

  go (ListNode x Nil) (ListNode y Nil) carry result
    | partialSum <= 9999 = ListNode partialSum result
    | otherwise          = ListNode 1 $ ListNode (partialSum - 10000) result
    where partialSum = x + y + carry

  go (ListNode x xs) Nil carry result
    | partialSum <= 9999 = go xs Nil 0 $ ListNode partialSum result
    | otherwise          = go xs Nil 1 $ ListNode (partialSum - 10000) result
    where partialSum = x + carry

  go Nil (ListNode y ys) carry result
    | partialSum <= 9999 = go Nil ys 0 $ ListNode partialSum result
    | otherwise          = go Nil ys 1 $ ListNode (partialSum - 10000) result
    where partialSum = y + carry

  go (ListNode x xs) (ListNode y ys) carry result
    | partialSum <= 9999 = go xs ys 0 $ ListNode partialSum result
    | otherwise          = go xs ys 1 $ ListNode (partialSum - 10000) result
    where partialSum = x + y + carry

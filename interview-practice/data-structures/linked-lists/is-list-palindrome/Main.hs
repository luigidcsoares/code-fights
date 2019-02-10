-- Definition for singly-linked list:
-- data ListNode a = ListNode { val :: a
--                            , next :: ListNode a
--                            } | Nil deriving Show
--

instance Eq a => Eq (ListNode a) where
  Nil == Nil = True
  ListNode x xs == ListNode y ys = x == y && xs == ys
  _ == _ = False

count :: ListNode a -> Int
count list = go list 0
 where
  go Nil             n = n
  go (ListNode x xs) n = go xs (n + 1)

reverseHalf :: ListNode a -> (ListNode a, ListNode a)
reverseHalf list = go (Nil, list) (count list `div` 2)
 where
  go (xs, ys           ) 0 = (xs, ys)
  go (xs, ListNode y ys) n = go (ListNode y xs, ys) (n - 1)

isListPalindrome :: (Eq a) => ListNode a -> Bool
isListPalindrome list | remainder == 0 = xs == ys
                      | otherwise      = xs == (next ys)
 where
  (xs, ys)  = reverseHalf list
  remainder = count list `mod` 2

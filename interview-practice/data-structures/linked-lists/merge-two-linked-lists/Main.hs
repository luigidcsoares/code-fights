data ListNode a = ListNode { val :: a
                           , next :: ListNode a
                           } | Nil deriving Show

mergeTwoLinkedLists :: (Ord a) => ListNode a -> ListNode a -> ListNode a
mergeTwoLinkedLists Nil Nil = Nil
mergeTwoLinkedLists xs  Nil = xs
mergeTwoLinkedLists Nil ys  = ys
mergeTwoLinkedLists l1@(ListNode x xs) l2@(ListNode y ys)
  | x < y     = ListNode x $ mergeTwoLinkedLists xs l2
  | otherwise = ListNode y $ mergeTwoLinkedLists l1 ys

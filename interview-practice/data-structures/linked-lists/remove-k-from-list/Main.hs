-- Definition for singly-linked list:
data ListNode a = ListNode { val :: a
                           , next :: ListNode a
                           } | Nil deriving Show

-- | The "filter'" function takes a boolean partial function
-- and a linked list, and returns a filtered list accordingly
-- to the function received.
filter' :: (a -> Bool) -> ListNode a -> ListNode a
filter' _ Nil = Nil
filter' f (ListNode val next) | f val     = ListNode val $ filter' f next
                              | otherwise = filter' f next

-- | The "removeKFromList" function takes a linked list and a scalar
-- value, and returns a linked list containing all the elements but
-- those equal to k.
removeKFromList xs k = filter' (/= k) xs

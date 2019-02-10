;; Definition for singly-linked list:
(defrecord ListNode [value next])

(defn consl
  "Insert value `x` at the beggining of list `l`."
  [x l]
  (->ListNode x l))

(defn reversel
  "Returns a new singly linked list that is `l` reversed."
  [l]
  (loop [{value :value next :next :as list} l
         reversed nil]
    (if (nil? list)
      reversed
      (recur next (consl value reversed)))))

(defn palindrome?
  "Given a singly linked list `l`, determine whether or not it's
  a palindrome."
  [l]
  (loop [list l
         reversed (reversel l)]
    (cond
     (nil? list) true
     (not= (:value list) (:value reversed)) false
     :else (recur (:next list) (:next reversed)))))


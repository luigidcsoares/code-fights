;; Definition for singly-linked list:
;; (defrecord ListNode [value next])

(defn remove-k-from-list
  "Given a singly linked list of integers `l` and an integer `k`,
  remove all elements from list `l` that have a value equal to `k`."
  [l k]

  ;; Code signal output is just a simple list and that's why
  ;; `filtered` was defined in that way.
  (loop [{value :value next :next :as head} l
         filtered []]
    (cond
     (nil? head) filtered
     (= value k) (recur next filtered)
     :else (recur next (conj filtered value)))))

;; Test:
;; (def l (->ListNode 3 (->ListNode 1 (->ListNode 2 nil))))
;; (def k 3)
;; (println l)
;; (println (remove-k-from-list l k))

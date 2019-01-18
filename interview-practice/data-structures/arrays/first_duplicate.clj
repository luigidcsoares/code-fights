(defn first-duplicate
  "Find the first duplicated element with the lowest index in a list."
  [a]
  ;; loop binds initial values once,
  ;; then binds values from each recursion call.
  (loop [[value & remaining] a
         preceding #{}]
    (cond
      (contains? preceding value) value
      (= (count remaining) 0) -1
      :else (recur remaining (conj preceding value)))))


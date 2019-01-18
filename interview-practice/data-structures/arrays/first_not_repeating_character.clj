(defn first-not-repeating-character
  "Takes a string and returns the first character with a
  frequency of one."
  [s]
  (let [freq (frequencies s)]
    (loop [[value & remaining] s]
      (cond
        (= (get freq value) 1) value
        (= (count remaining) 0) "_"
        :else (recur remaining)))))


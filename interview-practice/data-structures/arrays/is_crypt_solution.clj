(defn crypt-solution?
  "Receives an array of strings `crypt`, the cryptarithm, and an an
  array containing the mapping of letters and digits, `solution`. The
  array `crypt` will contain three non-empty strings that follow the
  structure: [word1, word2, word3], which should be interpreted as
  the word1 + word2 = word3 cryptarithm.

  If `crypt`, when it is decoded by replacing all of the letters in
  the cryptarithm with digits using the mapping in `solution`, becomes
  a valid arithmetic equation containing no numbers with leading zeroes,
  the answer is true. If it does not become a valid arithmetic solution,
  the answer is false."
  [crypt solution]
  (let [solution-map (into {} solution)
        decoded (map (comp clojure.string/join
                           (partial map #(get solution-map %)))
                     crypt)
        leading? (some true? (map #(and (> (count %) 1)
                                        (= (first %) \0))
                                  decoded))
        valid? (= (+ (Long/parseLong (nth decoded 0))
                     (Long/parseLong (nth decoded 1)))
                  (Long/parseLong (nth decoded 2)))]
    (and (not leading?) valid?)))

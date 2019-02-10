(defn transpose
  "Transpose a matrix. For example:
  Input:  [[1 2 3] [4 5 6] [7 8 9]]
  Output: [[1 4 7] [2 5 8] [3 6 9]] "
  [v]
  (apply mapv vector v))

(defn unique?
  "Return true if `coll` doesn't hava duplicate values,
  false otherwise."
  [coll]
  (-> coll
      distinct
      count
      (= (count coll))))

(defn group
  "Split `coll` into blocks of nxn. `coll` must be a 2D matrix and
  must be able to be splitted in that way."
  [n coll]
  (->> coll
       (mapv #(partition n %))
       (partition n)
       (mapcat transpose)
       (into [])
       (mapv #(mapv (partial into []) %))))

(defn sudoku2
  "Check whether a sudoku's grid is a valid one or not."
  [grid]
  (letfn [(valid? [block] (->> block
                               (map #(filter (partial not= \.) %))
                               (map unique?)
                               (every? true?)))]
    (let [valid-rows (valid? grid)
          valid-cols (-> grid transpose valid?)
          valid-grid (->> grid (group 3) (map #(reduce concat %)) valid?)]
      (and valid-rows valid-cols valid-grid))))

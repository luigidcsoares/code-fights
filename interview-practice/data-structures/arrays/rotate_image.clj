(defn transpose
  "Transpose a matrix. For example:
  Input:  [[1 2 3] [4 5 6] [7 8 9]]
  Output: [[1 4 7] [2 5 8] [3 6 9]] "
  [v]
  (apply mapv vector v))

(defn rotate-image
  "Receives a image represented by a nxn matrix and rotate it
  by 90 degrees. For example:
  Input:  [[1 2 3] [4 5 6] [7 8 9]]
  Output: [[7 4 1] [8 5 2] [9 6 3]]"
  [v]
  (-> v reverse transpose))


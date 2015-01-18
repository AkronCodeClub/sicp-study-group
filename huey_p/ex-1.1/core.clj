;;; 1.3

(defn sum-sq-largest-two [a b c]
  (->> [a b c]
    (sort >)
    (take 2)
    (map #(* % %))
    (reduce +)))

(sum-sq-largest-two 3 9 6)

(defn sum-sq-largest-two' [a b & ns]
  (->> (conj ns a b)
    (sort >)
    (take 2)
    (map #(* % %))
    (reduce +)))

(sum-sq-largest-two' 3)

(sum-sq-largest-two' 3 9 6 12 1 4)

(sum-sq-largest-two' 3 9 6)

(defn sum-sq [a b]
  (+ (* a a) (* b b)))

(defn sum-sq-largest-two'' [a b & ns]
  (->> (conj ns a b)
    (sort >)
    (take 2)
    (apply sum-sq)))

(sum-sq-largest-two'' 3 9 6 12 1 4)

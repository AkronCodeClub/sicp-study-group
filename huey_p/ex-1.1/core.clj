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

;;; 1.8

(defn improve [guess x]
  (double (/ (+ (/ x (* guess guess)) (* 2 guess)) 3)))

(defn good-enough? [previous-guess guess]
  (< (/ (java.lang.Math/abs (- previous-guess guess)) guess) 0.000001))

(defn cube-root [x]
  (loop [previous-guess 0
         guess 1]
    (if (good-enough? previous-guess guess)
      guess
      (recur guess (improve guess x)))))

(cube-root 1e-13)

(cube-root 27)

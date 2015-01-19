;;; 1.3

(define (sum-sq a b) (+ (* a a) (* b b)))

(sum-sq 3 9)

(define (sum-sq-largest-two a b c)
  (cond ((> a b c) (sum-sq a b))
        ((> a c b) (sum-sq a c))
        ((> b a c) (sum-sq b a))
        ((> b c a) (sum-sq b c))
        ((> c a b) (sum-sq c a))
        ((> c b a) (sum-sq c b))))

(sum-sq-largest-two 3 9 6)


(define (sum-sq-largest-two-v2 a b c)
  (cond ((and (>= a c) (>= b c)) (sum-sq a b))
        ((and (>= b a) (>= c a)) (sum-sq b c))
        ((and (>= c b) (>= a b)) (sum-sq a c))))

(sum-sq-largest-two-v2 3 9 6)

(sum-sq-largest-two-v2 1 1 1)

(sum-sq-largest-two-v2 1 1 2)

(sum-sq-largest-two-v2 1 2 2)

;;; 1.8

(define (square x)
  (* x x))

(define (cube x)
  (* x x x))

(define (good-enough? guess x)
  (< (abs (- (cube guess) x)) 0.001))

(define (average x y)
  (/ (+ x y) 2))

(define (improve guess x)
  (/ (+ (/ x (square guess)) (* 2 guess)) 3))


(define (cube-root-iter guess x)
  (if (good-enough? guess x)
      (exact->inexact guess) ;; rational -> float
      (cube-root-iter (improve guess x)
                      x)))

(define (cube-root x)
  (cube-root-iter 1 x))

(cube-root 27)

(define (good-enough-v2? previous-guess guess)
  (< (/ (abs (- previous-guess guess)) guess) 0.0000001))

(define (cube-root-iter-v2 previous-guess guess x)
  (if (good-enough-v2? previous-guess guess)
      (exact->inexact guess)
      (cube-root-iter-v2 guess (improve guess x) x)))

(define (cube-root-v2 x)
  (cube-root-iter-v2 0 1 x))

(cube-root-v2 27)

(cube-root-v2 0.0000001)

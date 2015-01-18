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

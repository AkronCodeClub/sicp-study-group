(define (abs x)
  (if (< x 0)
      (- x)
      x))
(define (avg a b)
  (/ (+ a b) 2))
(define (good-enough? guess x)
  (< (abs (- guess (/ x guess))) 0.0001))
(define (improve-guess guess x)
  (avg guess (/ x guess)))
(define (sqrt guess x)
  (if (good-enough? guess x)
      guess
      (sqrt (improve-guess guess x) x)
      )
  )

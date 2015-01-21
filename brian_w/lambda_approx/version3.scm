(define (abs x)
  (if (< x 0)
      (- x)
      x))
(define (avg a b)
  (/ (+ a b) 2))


(define (approximate good-enough? improve-guess)
  (define (try guess)
    (if (good-enough? guess)
	guess
	(try (improve-guess guess))))
  (try 1)
  )

(define (sqrt x)
  (define (good-enough? guess)
    (< (abs (- guess (/ x guess))) 0.0001))
  (define (improve-guess guess)
    (avg guess (/ x guess)))
  (approximate good-enough? improve-guess)
  )

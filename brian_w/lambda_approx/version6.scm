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
  (approximate
   (lambda (guess)
     (< (abs (- guess (/ x guess))) 0.0001))
   (lambda (guess)
     (avg guess (/ x guess)))
   )
  )

(define (cubert x)
  (approximate
   (lambda (guess)
     (< (abs (- guess (/ (/ x guess) guess))) 0.0001))
   (lambda (guess)
     (/ (+ (/ x (* guess guess)) (* 2 guess)) 3))
   )
  )

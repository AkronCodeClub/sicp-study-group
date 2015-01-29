(define pow
  (lambda (x y)
    (cond ((= y 0) 1)
	  ((< y 0) (/ (pow x (+ y 1)) x))
	  (else (* x (pow x (- y 1)))))))
(define second-order
  (lambda (x)
    (+ (pow (* 3 x) 2)
       (* 14 x)
       (- 0 5))))
(= (second-order 5) 290)
(= (second-order 2) 59)
(= (second-order 54) 26995)
(define tolerance 0.00001)
(define (pow x y) (cond
		   ((= y 0) 1)
		   ((< y 0) (/ (pow x (+ y 1)) x))
		   (else (* x (pow x (- y 1))))))

(define (sqrt-iter guess x)
  (if (good-enough? guess x 2)
      guess
      (sqrt-iter (improve guess x)
                 x)))

(define (improve guess x)
	(average guess (/ x guess)))

(define (average x y)
	(/ (+ x y) 2))

(define (good-enough? g x p)
	(< (abs (- (pow g p) x)) tolerance))

(define (sqrt x)
  (sqrt-iter (/ x 3.0) x))

(define (cbrt x) (cb-rt-iter (/ x 4.0) x))

(define (cb-rt-iter guess x)
  (if (good-enough? guess x 3)
      guess
      (cb-rt-iter (cb-rt-improve guess x)
		 x)))

(define (cb-rt-improve guess x)
  (/ (+ (/ x (pow guess 2)) (* 2 guess)) 3))


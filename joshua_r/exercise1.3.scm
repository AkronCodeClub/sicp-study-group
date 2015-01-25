(define (pow x y) (cond
		   ((= y 0) 1)
		   ((< y 0) (/ (pow x (+ y 1)) x))
		   (else (* x (pow x (- y 1))))))
(pow 2 0)
(pow 2 3)
(pow 2 -1)
(pow 2 -2)
(pow 2 -3)
(define (sq x) (pow x 2))
(sq 10)
(sq 2)
(sq 3)
(+ (sq 2) (sq 3))

(define (bigger x y) (cond ((< x y) y)
			   (else x)))
(bigger 3 2)

(define (sumsq x y) (+ (sq x) (sq y)))
(sumsq 2 3)

(define
  (sumsqlargertwo x y z)
  (cond
   ((= x y) (cond ((= y z) (sumsq x x)) (else (sumsq x (bigger y z)))))
   ((> x y) (sumsq x (bigger y z)))
   (else (sumsq y (bigger x z)))))

(sumsqlargertwo 1 2 3)
(sumsqlargertwo 4 2 3)
(sumsqlargertwo 4 3 2)
(sumsqlargertwo 4 4 2)
(sumsqlargertwo 2 4 4)
(sumsqlargertwo 4 4 4)
				       
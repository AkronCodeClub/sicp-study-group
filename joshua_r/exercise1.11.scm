(define f-rec
  (lambda (n)
    (if
     (< n 3)
     n
     (+ (* 1 (f-rec (- n 1)))
	(* 2 (f-rec (- n 2)))
	(* 3 (f-rec (- n 3)))))))

(define (f-iter n)
    (define (f-iter-iter a b c count)
      (if (= count 0)
	  (calc-res a b c)
	  (f-iter-iter b c (calc-res a b c) (- count 1))))
    (define (calc-res a b c)
      (+ (* 1 c) (* 2 b) (* 3 a)))
    (if
      (< n 3)
      n
      (f-iter-iter 0 1 2 (- n 3))))

(= (f-rec 0) (f-iter 0))
(= (f-rec 1) (f-iter 1))
(= (f-rec 2) (f-iter 2))
(= (f-rec 3) (f-iter 3))
(= (f-rec 4) (f-iter 4))
(= (f-rec 5) (f-iter 5))
(= (f-rec 6) (f-iter 6))
(= (f-rec 7) (f-iter 7))
(= (f-rec 8) (f-iter 8))
(= (f-rec 9) (f-iter 9))
(= (f-rec 10) (f-iter 10))
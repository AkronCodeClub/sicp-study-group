;;;
; 1.11 - A function f is defined by the rule that f(n) = n if n<3 and f(n) = f(n - 1) + 2f(n - 2) + 3f(n - 3) if n> 3.
;        Write a procedure that computes f by means of a recursive process.
;        Write a procedure that computes f by means of an iterative process.
;;;;;;;;;;;;;

(define (proc-recu n)
  (cond ((< n 3) n)
        (+ (proc-recu (- n 1)) (* 2 (proc-recu (- n 2))) (* 3 (proc-recu (- n 3))))))
		


; looking for the pattern...
		
(proc-recu 7)

(+ (* 1 proc-recu 6) (* 2 (proc-recu 5)) (* 3 (proc-recu 4)))

(+ (* 1 (+ (* 1 proc-recu 5) (* 2 (proc-recu 4)) (* 3 (proc-recu 3))))
   (* 2 (+ (* 1 proc-recu 4) (* 2 (proc-recu 3)) (* 3 (proc-recu 2))))
   (* 3 (+ (* 1 proc-recu 3) (* 2 (proc-recu 2)) (* 3 (proc-recu 1)))))
   




; tbd...

(define (proc-iter n)
  (

  
(proc-iter 7)
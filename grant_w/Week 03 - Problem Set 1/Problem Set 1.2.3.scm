; 1.2.3
; Write a Scheme procedure that, given coefficients a, b, and c of a quadratic equation ax^2 + bx + c,
; returns the larger of the (real) roots of the equation.

(define quadratic-root
  (lambda (a b c)
      (max (/ (- (- b) (sqrt (- (* b b) (* 4 a c)))) (* 2 a))
           (/ (+ (- b) (sqrt (- (* b b) (* 4 a c)))) (* 2 a)))))

(quadratic-root 1 -4 0) ; 4  (0 and 4)
(quadratic-root 1 -6 9) ; 3  (just 3)
(quadratic-root 1 3 1)  ; -0.3819660112501051



; Improved, to eliminate duplicate code

(define (quadratic-root a b c)
    (define (get-root add) (/ ((if add + -) (- b) (sqrt (- (* b b) (* 4 a c)))) (* 2 a)))
    (max (get-root #t) (get-root #f)))

(quadratic-root 1 -4 0) ; 4
(quadratic-root 1 -6 9) ; 3
(quadratic-root 1 3 1)  ; -0.3819660112501051
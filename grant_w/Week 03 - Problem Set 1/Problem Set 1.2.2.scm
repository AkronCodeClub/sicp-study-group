; 1.2.2
; Write a Scheme procedure that, given a value for x, finds the value of the second order expression 3x^2 + 14x - 5.

(define second-order (lambda (x) (+ (* 3 x x) (* 14 x) (- 5))))

(second-order 5) ;140

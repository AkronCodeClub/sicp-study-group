;;;
; 2.1.1 - To what do the following expressions evaluate in MIT Scheme
;         (assume they are evaluated in the sequence shown)?
;;;;;;;;;;;;;

(lambda (x) (+ x x))
; procedure

((lambda (x) (+ x x)) 2)
; 4

(define double (lambda (x) (+ x x)))
; procedure

(double (double (double 2)))
; 16

(lambda (x y) x)
; procedure

((lambda (x y) x) 2 3)
; 2

((lambda (x y) x) 2)
; 2
; How does this not error? missing 'y' operand... are all operands optional?

(define thing (lambda (x y) x))
; procedure

(thing 4 5)
; 4

(thing thing 3)
; procedure
; ??? Since (thing 3) returns 3, it seems reasonable that evaluating (thing thing 3) would also be 3.
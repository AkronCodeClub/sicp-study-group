;;;
; 1.1.6 - Assume the following Scheme expressions are evaluated sequentially.
;         Indicate the value of each expression, or "unspecified" if it is unspecified.
;;;;;;;;;;;;;

(define b (+ (* 3 4) 1))
; procedure

b
; 13

(* b 2)
; 26

b
; 13

(define x 2)
; procedure

(define y (+ x 1))
; procedure

y
; 3

(define x 3)
; procedure

y
; 3

(define x y)
; procedure

x
; 3

y
; 3

;;;
; 2.2.1 - To what do the following expressions evaluate in MIT Scheme
;         (assume they are evaluated in sequence)?
;;;;;;;;;;;;;

(define plus +)
; procedure

(define + 7)
; procedure

+
; 7

plus
; 7

(plus + +)
; error

(plus 2 3)
; error

(+ 2 3)
; error

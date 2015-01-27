;;;
; 1.1.5 - Some of the following expressions are correct Scheme expressions and others are not.
;         For each expression, if it is both syntactically correct and evaluates without error,
;         indicate its value.
;;;;;;;;;;;;;

2
; 2

+
; procedure

(+ 2 3)
; 5

(5 6 7)
; error

(+)
; 0

(3 + 4)
; error

2.5
; 2.5

(* 2.5 2)
; 5

(define a 6)
a
; 6
(*a 2)
; error
(* a 2)
; 12

((+ 2 3))
; error

(+ -3 -5)
; -8

(+6 #f)
; error

(+ 6 +)
; error

(define 6 2)
; error

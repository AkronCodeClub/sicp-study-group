;;;
; 1.4 - Observe that our model of evaluation allows for combinations whose
;       operators are compound expressions. Use this observation to describe
;       the behavior of the following procedure
;         (define (a-plus-abs-b a b)
;           ((if (> b 0) + -) a b))
;;;;;;;;;;;;;

; The procedure a-plus-abs-b either subtracts b from a, or adds b to a.
; The operator it uses depends on whether or not b is greater than 0.
; If b > 0, add a+b (i.e. 2+3=5), else If b <= 0, subtract a-b (e.g. 2 - -3 = 5)
; Basically, we're adding the absolute value of b to a

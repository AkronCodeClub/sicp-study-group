;;;
; 1.1.2 - Which of the following are valid Scheme expressions?
;;;;;;;;;;;;;

+
; valid (procedure)

6 + 1
; valid (1)

(6 + 1)
; invalid (operator is 6, operands are + and 1)

(* 1 2)
; valid (operator is *, operands are 1 and 2)

-1
; valid (-1)

- 1
; valid (1)

(- 1)
; valid (operator is -, operands are 0 and 1... I think?)

(define x)
; valid (not a problem until you try to evaluate it)

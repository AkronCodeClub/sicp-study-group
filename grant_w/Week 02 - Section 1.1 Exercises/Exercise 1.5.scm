;;;
; 1.5 - What behavior will Ben observe with an interpreter that uses
;       applicative-order evaluation? Normal-order evaluation? Explain your answer.
;
;       (define (p) (p))
;       (define (test x y)
;         (if (= x 0) 0 y))
;
;       (test 0 (p))
;
; Important Note: Assume that the evaluation rule for the special form 'if' is
;                 the same whether the interpreter is using normal or applicative order:
;                 The predicate expression is evaluated first, and the result determines
;                 whether to evaluate the consequent or the alternative expression.
;;;;;;;;;;;;;

;Applicative-order: (first evaluate the operator and operands, then move to the next level of procedures)
(test 0 (p))

(if (=x 0) 0 y)          ; retrieve body of test
(if (#t) 0 (p))          ; replace formal parameter y
(if (#t) 0 (p (p)))      ; evaluate the operands
(if (#t) 0 (p (p (p))))  ; rinse, repeat...
;... Even though we'll never need the second operand, applicative-order
;    operands first, so we keep expanding forever - we're stuck

;Normal-order: (don't evaluate operands until their values are needed)
(test 0 (p))

(if (=x 0) 0 y)          ; retrieve body of test
(if (=0 0) 0 (p))        ; start working towards only primitive operators
(if (#t) 0 (p))          ; (p) is never evaluated, because its value is not ever needed
0
;... We'll never need the second operand, so normal-order doesn't bother evaluating it

; Applicative-order evaluates operands before needing them, while
; Normal-order evaluates operands only when needed

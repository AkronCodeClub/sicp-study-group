;;;
; 1.6 - Why can't 'if' be replaced with 'cond' 
;
; Important Note: To evaluate an 'if' expression, the interpreter starts by evaluating the
;                 <predicate> part of the expression. If the <predicate> evaluates to a
;                 true value, the interpreter then evaluates the <consequent> and returns
;                 its value. Otherwise it evaluates the <alternative> and returns its value.

; Using the `if` version of sqrt-iter, eventually the guess will be good enough, and only the
; consequent (guess) will be evaluated, not the alternative expression (sqrt-iter (improve guess x) x)

; Using the `cond` version, and the fact that Lisp uses applicative-order evaluation,
; both operands will be evaluated before using them. Even when the guess is "good enough", the call
; to (sqrt-iter (improve guess x)) will be evaluated again.. and again, and again, filling the stack

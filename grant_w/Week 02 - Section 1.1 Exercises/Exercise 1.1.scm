;;;
; 1.1 - What is the result of each expression?
;       (I guessed first, then tried each one in the REPL.)
;;;;;;;;;;;;;

10
;10

(+ 5 3 4)
;12

(- 9 1)
;8

(+ (* 2 4) (- 4 6))
;6

(define a 3)
;procedure

(define b (+ a 1))
;procedure

(+ a b (* a b))
;19

(= a b)
;#f

(if (and (> b a) (< b (* a b)))
    b
    a)
;4

(cond ((= a 4) 6)
      ((= b 4) (+ 6 7 a))
      (else 25))
;16

(+ 2 (if (> b a) b a))
;6

(* (cond ((> a b) a)
         ((< a b) b)
         (else -1))
   (+ a 1))
;16

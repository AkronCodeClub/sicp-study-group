;#lang racket
#lang planet neil/sicp ;this line needed for DrRacket
; comment both lines above this point to be MIT-Scheme compatible.

(define (sqr x)
  (* x x))

(define second-order
  (lambda (x)
    (+ (* 14 x) (* 3 (sqr x)) -5)))

(second-order 5)   ; 140
(second-order 10)  ; 435
(second-order 140) ; 60755

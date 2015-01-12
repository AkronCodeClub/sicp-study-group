;#lang racket
#lang planet neil/sicp ;this line needed for DrRacket
; comment both lines above this point to be MIT-Scheme compatible.

(define (Smallest x y z)
  (cond
    ((= x y z) x)
    ((and (<= x y) (<= x z)) x)
    ((and (<= y x) (<= y z)) y)
    ((and (<= z x) (<= z x)) z)
    (else x)))

(define (square x)
  (* x x))

(define (sum-of-squares x y)
  (+ (square x) (square y)))

(define (sum-of-largest-squares x y z)
  (cond
    ((= x (Smallest x y z)) (sum-of-squares y z))
    ((= y (Smallest x y z)) (sum-of-squares x z))
    ((= z (Smallest x y z)) (sum-of-squares x y))
    (else 0)))

(sum-of-largest-squares 100 200 300)
(sum-of-largest-squares 3 2 1)
(sum-of-largest-squares 2 2 2)


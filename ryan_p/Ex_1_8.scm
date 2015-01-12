;#lang racket
#lang planet neil/sicp ;this line needed for DrRacket
; comment both lines above this point to be MIT-Scheme compatible.

(define (square x)
  (* x x))

(define tolerance 0.00001)

(define (croot-iter guess x)
  (if (good-enough? guess x)
      guess
      (croot-iter (improve guess x)
                  x)))

(define (improve guess x)
  (/ (+ (/ x (square guess))
        (* 2 guess))
     3))

(define (cube x)
  (* x x x))

(define (good-enough? guess x)
  (< (abs (- (cube guess) x))
     tolerance))

(define (croot x)
  (croot-iter 1.00 x))

(croot 27)

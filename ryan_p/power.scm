;#lang racket
#lang planet neil/sicp ;this line needed for DrRacket
; comment both lines above this point to be MIT-Scheme compatible.

; power already exists as (expt z1 z2) where z1 is the base and z2 is the exponent.
;   expt is much faster than my power.

(define (power base exponent)
  (let loop ((exponent exponent) (result 1))
    (if (eqv? exponent 0)
        result
        (loop (- exponent 1) (* result base)))))

(power 2 4)
;(power 1 1999999999999999) ; very slow
(expt 1 1999999999999999) ; very fast
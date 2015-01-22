;#lang racket
#lang planet neil/sicp ;this line needed for DrRacket
; comment both lines above this point to be MIT-Scheme compatible.

(define (pascal row col)
  (cond ((< row col) (display "Row cannot be less than Column"))
        ((or (= col 0) (= row col)) 1)
        (else (+ (pascal (- row 1) col)
                 (pascal (- row 1) (- col 1))))))
(pascal 4 2) ; 6
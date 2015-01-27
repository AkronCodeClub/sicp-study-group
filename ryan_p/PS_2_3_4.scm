;#lang racket
#lang planet neil/sicp ;this line needed for DrRacket
; comment both lines above this point to be MIT-Scheme compatible.

(define mystery
  (lambda (a b)
    (mystery-meat 0 a b)))

(define mystery-meat
  (lambda (c a b)
    (if (> a b)
        c
        (mystery-meat (+ c a) (+ a 1) b))))

(display "mystery\n")
(mystery 2 5)   ;14
(mystery 2 10)  ;54
(mystery 10 2)  ;0
(newline)

(define clarity
  (lambda (a b)
    (if (> a b)
        0
        (+ a (clarity (+ a 1) b )))))

(display "clarity\n")
(clarity 2 5)   ;14
(clarity 2 10)  ;54
(clarity 10 2)  ;0
       
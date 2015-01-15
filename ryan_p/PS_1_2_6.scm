;#lang racket
#lang planet neil/sicp ;this line needed for DrRacket
; comment both lines above this point to be MIT-Scheme compatible.

(define bigger2
  (lambda (a b)
    (if (> a b) a
      b)))

(bigger2 30 3)

(define bigger3
  (lambda (a b c)
    (cond ((= (bigger2 a b) (bigger2 a c)) a)
          ((= (bigger2 b a) (bigger2 b c)) b)
          ((= (bigger2 c a) (bigger2 c b)) c))))

(bigger3 10 1 1)

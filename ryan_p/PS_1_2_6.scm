;#lang racket
#lang planet neil/sicp ;this line needed for DrRacket
; comment both lines above this point to be MIT-Scheme compatible.

(define bigger2
  (lambda (a b)
    (if (> a b) a
      b)))

(bigger2 30 3) ; 30

(define bigger3
  (lambda (a b c)
    (cond ((= (bigger2 a b) (bigger2 a c)) a)
          ((= (bigger2 b a) (bigger2 b c)) b)
          ((= (bigger2 c a) (bigger2 c b)) c))))

(bigger3 10 1 1)  ; 10
(bigger3 10 1 100); 100

; simplified bigger3.  Don't know how I didn't see this originally.
(define B3r
  (lambda (a b c)
    (bigger2 (bigger2 a b) c)))

(B3r 10 1 1)  ; 10
(B3r 10 1 100); 100


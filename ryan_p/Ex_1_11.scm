;#lang racket
#lang planet neil/sicp ;this line needed for DrRacket
; comment both lines above this point to be MIT-Scheme compatible.

(define (>= a b)
  (or (> a b) (= a b)))

; recursive
(define (fr x) 
  (if (>= x 3)
      (+ (fr (- x 1)) (* 2 (fr (- x 2))) (* 3 (fr (- x 3))))
      x))

(fr 2)
; 2
(fr 3)
; 4
(fr 4)
; 11
(fr 5)
; 25
(fr 35)
;4630608915694

; Iterative
(define (fi x)
  (if (< x 3)
      x
      (f-iter 2 1 0 x)))

(define (f-iter a b c count)
  (if (< count 3)
      a
      (f-iter (+ a (* 2 b) (* 3 c)) 
              a b 
              (- count 1))))

(fi 2)
(fi 3)
(fi 4)
(fi 5)
(fi 35)
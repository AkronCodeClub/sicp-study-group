;#lang racket
#lang planet neil/sicp ;this line needed for DrRacket
; comment both lines above this point to be MIT-Scheme compatible.

(define square
  (lambda (x)
    (* x x)))

(define quadratic-root
  (lambda (a b c)
    (define disc (sqrt (- (square b) (* 4.0 (* a c)))))
      (/ (+ (- b) disc) (* 2.0 a))))
  
(quadratic-root 3 2 1)

(define quadratic
  (lambda (a b c)
    (let ((minusb (- b))
          (radical (sqrt (- (square b) (* 4.0 (* a c)))))
          (divisor (* 2.0 a)))
      (let ((root1 (/ (+ minusb radical) divisor))
            (root2 (/ (- minusb radical) divisor)))
        (cons root1 root2)))))
        
        
(quadratic 3 2 1)

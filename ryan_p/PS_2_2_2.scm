;#lang racket
#lang planet neil/sicp ;this line needed for DrRacket
; comment both lines above this point to be MIT-Scheme compatible.

(define slow-mul-recurse
  (lambda (a b)
    (if (= b 0) 
        0
        (+ a (slow-mul-recurse a (- b 1))))))

(slow-mul-recurse 2 5)  ;10
(slow-mul-recurse 1 11) ;11
(slow-mul-recurse 0 3)  ;0
(slow-mul-recurse 3 0)  ;0
(slow-mul-recurse 33 11);363
(slow-mul-recurse 11 33);363
(slow-mul-recurse 111 33);3663
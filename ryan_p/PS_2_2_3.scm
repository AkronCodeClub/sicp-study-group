;#lang racket
#lang planet neil/sicp ;this line needed for DrRacket
; comment both lines above this point to be MIT-Scheme compatible.

; three iterative examples......

;  This way works.....
;(define slow-mul-helper
;  (lambda (a b c)
;    (if (= b 0) 
;        c
;        (slow-mul-helper a (- b 1) (+ c a)))))

;(define slow-mul-iter
;  (lambda (a b)
;    (slow-mul-helper a b 0)))

; This way works too
;(define slow-mul-iter
;  (lambda (a b)
;    (define slow-mul-helper
;      (lambda (a b c)
;        (if (= b 0)
;            c
;            (slow-mul-helper a (- b 1) (+ c a)))))
;    (slow-mul-helper a b 0)))

; and finally it works this way too
(define slow-mul-iter
  (lambda (a b)
    (let iter((a a) (b b) (result 0))
      (if (= b 0)
          result
          (iter a (- b 1) (+ result a))))))

(slow-mul-iter 2 5)  ;10
(slow-mul-iter 1 11) ;11
(slow-mul-iter 0 3)  ;0
(slow-mul-iter 3 0)  ;0
(slow-mul-iter 33 11);363
(slow-mul-iter 11 33);363
(slow-mul-iter 111 33);3663

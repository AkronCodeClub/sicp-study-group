;#lang racket
#lang planet neil/sicp ;this line needed for DrRacket
; comment both lines above this point to be MIT-Scheme compatible.

;Write a procedure (mix-it-up lst) that takes a list as input, and returns a new list, 
;with the property that for each element of argument list that is odd, it doubles the 
;element, and for each element that is even, it halves the element. You may assume that odd? 
;exists as a predicate. Here are some examples:

;(mix-it-up (list 1 2 3 4 5)) => (2 1 6 2 10)
;(mix-it-up (list 2 4 6 8)) => (1 2 3 4)

(define adjoin cons)
(define rest cdr)
(define first car)
(define (double x)
  (* x 2))
(define (halve x)
  (/ x 2))


(define mix-it-up 
  (lambda (lst) 
    (if (null? lst)
        nil
        (if (odd? (first lst))
            (adjoin (double (first lst)) (mix-it-up (rest lst)))
            (adjoin (halve (first lst)) (mix-it-up (rest lst)))))))
        
(mix-it-up (list 1 2 3 4 5)); => (2 1 6 2 10)

(mix-it-up (list 2 4 6 8)); => (1 2 3 4)
      



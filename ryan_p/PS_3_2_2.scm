;#lang racket
#lang planet neil/sicp ;this line needed for DrRacket
; comment both lines above this point to be MIT-Scheme compatible.

;Write a recursive (not iterative) procedure, (count-true pred lower upper), of type 
;(number->boolean),number,number->number, that returns the number of integers in the range 
;lower..upper (inclusive) for which predicate pred applied to that number is true.

(define adjoin cons)
(define rest cdr)
(define first car)

; returns the number of items in a list
(define (length lst)
  (if (null? lst)
      0
      (+ 1 (length (rest lst)))))

; returns a list that starts at from and goes till to, inclusive
(define (e-i from to)
  (if (> from to)
      nil
      (adjoin from (e-i (+ 1 from) to))))

; returns True if the length of the list bound by lower and upper, is equal to pred
;   otherwise returns False.
(define count-true
  (lambda (pred lower upper)
    (if (< upper lower) 
        (= pred (length (e-i upper lower)))
        (= pred (length (e-i lower upper))))))

(count-true 5 1 5) #T
(count-true 4 1 5) #F

;(define lst (e-i 1 5))

;(define (list-ref lst n)
;  (if (= n 0)
;      (first lst)
;      (list-ref (rest lst) (- n 1))))

;(list-ref lst 3)


;(length lst)

;(define (copy lst)
;  (if (null? lst)
;      nil
;      (adjoin (first lst)
;              (copy (rest lst)))))

;(define (append list1 list2)
;  (cond ((null? list1) list2)
;        (else
;         (adjoin (first list1)
;                 (append (rest list1)
;                         list2)))))


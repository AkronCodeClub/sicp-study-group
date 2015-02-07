;#lang racket
#lang planet neil/sicp

;Exercise 2.2

;Consider the problem of representing line segments in a plane. Each segment is 
;represented as a pair of points: a starting point and an ending point. Define a 
;constructor make-segment and selectors start-segment and end-segment that define 
;the representation of segments in terms of points. Furthermore, a point can be 
;represented as a pair of numbers: the x coordinate and the y coordinate. Accordingly, 
;specify a constructor make-point and selectors x-point and y-point that define this 
;representation. Finally, using your selectors and constructors, define a procedure 
;midpoint-segment that takes a line segment as argument and returns its midpoint 
;(the point whose coordinates are the average of the coordinates of the endpoints). 
;To try your procedures, you'll need a way to print points:

(define (x-point p) (car p)) ; returns the head

(define (y-point p) (cdr p)) ; returns the tail

(define (make-pair x y) (cons x y))

(define (make-point xp yp) (make-pair xp yp))

(define (make-segment ss es) (make-pair ss es))

(define (get-start-point ls) (car ls))

(define (get-end-point ls) (cdr ls))

(define (avg a b) (/ (+ a b) 2))

(define (midpoint-segment ls)
  (make-point (avg (x-point (get-start-point ls))
                   (x-point (get-end-point ls)))
              (avg (y-point (get-start-point ls))
                   (y-point (get-end-point ls)))))

(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")"))

(define start-point1 (make-point 10 10))
(define end-point1 (make-point 30 30))
(define segment1 (make-segment start-point1 end-point1))
(define mid-point1 (midpoint-segment segment1))
(print-point mid-point1)

(define start-point2 (make-point 6 30))
(define end-point2 (make-point 10 4))
(define segment2 (make-segment start-point2 end-point2))
(define mid-point2 (midpoint-segment segment2))
(print-point mid-point2)

; The code below originated from rosettacode.org for cyber-dojo counting coins kata (2/9/15)

;recursive
(define (ways-to-make-change cents coins)
  (cond ((null? coins) 0)
        ((< cents 0) 0)
        ((= cents 0) 1)
        (else
         (+ (ways-to-make-change cents (cdr coins))
            (ways-to-make-change (- cents (car coins)) coins)))))

; "car" returns the head or first element only of a list
; "cdr" drops the first element of a list and returns the rest: returns the tail of the list
; if working with pairs then "car" returns first element of the pair and "cdr" 
;    returns the second element of the pair.

; I think this turns out to be a good follow on exercise to EX 2.2 using CAR and CDR

;uncomment these lines to try ways-to-make-change
;(newline)
;(ways-to-make-change 5 '(25 10 5 1))              ; 2
;(ways-to-make-change 10 '(25 10 5 1))             ; 4
;(ways-to-make-change 100 '(25 10 5 1))            ; 242
;(ways-to-make-change 50 '(25 10 5 1))             ; 49
;(ways-to-make-change 100 '(10 5 1))               ; 121
;(ways-to-make-change 200 '(10 5 1))               ; 441
;(ways-to-make-change 200 '(25 10 5 1))            ; 1463
;(ways-to-make-change 1000 '(25 10 5 1))           ; 142511
;(ways-to-make-change 1000 '(500 100 50 25 10 5 1)); 2202008







  
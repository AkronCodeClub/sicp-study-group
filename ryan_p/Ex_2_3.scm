;#lang racket
#lang planet neil/sicp
; comment top two lines to try in MIT-Scheme

;Exercise 2.3

;Implement a representation for rectangles in a plane. (Hint: You may want to make use of 
;exercise 2.2.) In terms of your constructors and selectors, create procedures that compute 
;the perimeter and the area of a given rectangle. Now implement a different representation 
;for rectangles. Can you design your system with suitable abstraction barriers, so that the 
;same perimeter and area procedures will work using either representation?

; used by both methods
(define (x-point p) (car p)) ; returns the head

(define (y-point p) (cdr p)) ; returns the tail

(define (make-pair x y) (cons x y))

(define (make-point xp yp) (make-pair xp yp))

(define (get-start-point ls) (car ls))

(define (get-end-point ls) (cdr ls))

(define (make-rect a b)
  (cons a b))

(define (rect-perimeter w h r)
  (* 2 (+ (w r) (h r))))

(define (rect-area w h r)
  (* (w r) (h r)))

(define (print-rect-info w h r)
  (newline)
  (display "perimeter: ")
  (display (rect-perimeter w h r))
  (newline)
  (display "area: ")
  (display (rect-area w h r))
  (newline))
;=================

;used for method 1 only
(define (rect-width1 r)
  (abs (- (x-point (get-start-point r))
          (x-point (get-end-point r)))))
 
(define (rect-height1 r)
  (abs (- (y-point (get-start-point r))
          (y-point (get-end-point r)))))
;==================

;used for method 2 only
(define (rect-width2 r)
  (car (cdr r)))

(define (rect-height2 r)
  (cdr (cdr r)))
;==================

; make two identical rectangles at two different locations, areas and perimeters should equal.

;method 1  (rectangle defined with two opposing corners)
(define a1 (make-point 5 5))
(define b1 (make-point 10 15))
(define rect1 (make-rect a1 b1))
;==================

;method 2  (rectangle defined with a corner, width and height
(define a2 (make-point 100 100))
(define widthAndheight (make-point 5 10))
(define rect2 (make-rect a2 widthAndheight))
;==================

;output of both methods
(print-rect-info rect-width1 rect-height1 rect1)
(print-rect-info rect-width2 rect-height2 rect2)

;perimeter: 30
;area: 50

;perimeter: 30
;area: 50
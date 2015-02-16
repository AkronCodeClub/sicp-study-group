;#lang racket
#lang planet neil/sicp
; comment top two lines to try in MIT-Scheme

;Exercise 1.39

;A continued fraction representation of the tangent function was published in 1770
;by the German mathematician J.H. Lambert: where x is in radians. Define a procedure (tan-cf x k) 
;that computes an approximation to the tangent function based on Lambert's formula. K specifies the 
;number of terms to compute, as in exercise 1.37.

(define pi 3.141592653589793)

(define (square x) (* x x))

;(define (cont-frac numerator denominator limit)
;  (define (frac i)
;    (if (< i limit)
;        (/ (numerator i) (+ (denominator i) (frac (+ i 1))))
;        (/ (numerator i) (denominator i))))
;  (frac 1))

(define (cont-frac-iter numerator denominator limit)
  (define (frac-iter i result)
    (if (= i 0)
        result
        (frac-iter (- i 1) (/ (numerator i) (+ (denominator i) result)))))
  (frac-iter (- limit 1) (/ (numerator limit) (denominator limit))))

(define (tan-cf x limit)
  (define (numerator nk)
    (if (= nk 1)
        x
        (- (square x))))
  (define (denominator dk)
    (- (* 2 dk) 1))
  (cont-frac-iter numerator denominator limit))

(display "(tan (/ pi 10))\n")
(tan (/ pi 10))
(display "(tan-cf (/ pi 10) 10)\n")
(tan-cf (/ pi 10) 10)

;results
;(tan (/ pi 10))
;0.3249196962329063
;(tan-cf (/ pi 10) 10)
;0.32491969623290634
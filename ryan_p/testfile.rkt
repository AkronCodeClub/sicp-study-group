#lang racket

(define (factorial n)
   (if (= n 1)
       n
       (* n (factorial (- n 1)))))

(define (mySum x y)
  (+ x y))

(define myFunc
  (/ (+ 5 (/ 1 2) (- 2 (- 3 (+ 6 (/ 1 3))))) (* 3 (- 6 2) (- 2 7))))

(define (abs x)
  (cond ((< x 0) (- x))
        (else x)))

(define (square x)
  (* x x))

(define (sum-of-squares x y)
  (+ (square x) (square y)))

(define (f a)
  (sum-of-squares (+ a 1) (* a 2)))

(define (>= x y)
  (or (> x y) (= x y)))

(define (<= x y)
  (or (< x y) (= x y)))

(define (Largest x y z)
  (cond
    [(= x y z) x]
    [(and (>= x y) (>= x z)) x]
    [(and (>= y x) (>= y z)) y]
    [(and (>= z x) (>= z y)) z]
    [else x]))

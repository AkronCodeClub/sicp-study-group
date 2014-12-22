;; unrem next line if using DrRacket
;#lang planet neil/sicp

(define meters-to-feet
  (lambda (m)
    (/ (* m 39.6) 12)))
;(define (meters-to-feet m)
;  (/ (* m 39.6) 12))


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

(define >= 
  (lambda (x y)
  (or (> x y) (= x y))))

(define <= 
  (lambda (x y)
  (or (< x y) (= x y))))

(define (Smallest x y z)
  (cond
    ((= x y z) x)
    ((and (<= x y) (<= x z)) x)
    ((and (<= y x) (<= y z)) y)
    ((and (<= z x) (<= z x)) z)
    (else x)))

(define (Largest x y z)
  (cond
    ((= x y z) x)
    ((and (>= x y) (>= x z)) x)
    ((and (>= y x) (>= y z)) y)
    ((and (>= z x) (>= z y)) z)
    (else x)))

(define (sum-of-largest-squares x y z)
  (cond
    ((= x (Smallest x y z)) (sum-of-squares y z))
    ((= y (Smallest x y z)) (sum-of-squares x z))
    ((= z (Smallest x y z)) (sum-of-squares x y))
    (else 0)))

(define myProc
  (lambda (x y)
    (+ x y)))

(define max (lambda ( a b) (if (> a b) a b)))
(define max-sum (lambda (a b) (max (+ a b) (- a b))))

; if x=1 evaluates to 2
(define lambda1
  (lambda (x) (+ x x)))

; error
(define lambda2
  ((lambda (x) (+ x x)) 2))


(mySum 1 1)
(sum-of-largest-squares 1 2 3)









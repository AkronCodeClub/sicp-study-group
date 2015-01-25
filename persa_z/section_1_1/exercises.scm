;; Exercise 1.1

10
;; => 10

(+ 5 3 4)
;; => 12

(- 9 1)
;; => 8

(/ 6 2)
;; => 3

(+ (* 2 4) (- 4 6))
;; => 6

(define a 3)
;; => a

a
;; => 3

(define b (+ a 1))
;; => b

b
;; => 4

(+ a b (* a b))
;; => 19

(= a b)
;; => #f

(if (and (> b a) (< b (* a b)))
         b
         a)
;; => 4

(cond ((= a 4)) 6
      ((= b 4) (+ 6 7 a))
      (else 25))
;; => 16

(+ 2 (if (> b a) b a))
;; => 6

(* (cond ((> a b) a)
         ((< a b) b)
         (else -1))
    (+ a 1))
;; => 16


;; Exercise 1.2

;; Translate into prefix notation:
;; 5 + 4 + (2 - (3 - (6 + 4/5)))
;; divided by 3(6 - 2)(2 - 7)

(/ (+ 5 4 (- 2 (- 3 (+ 6 (/ 4 5))))) (* 3 (- 6 2)(- 2 7)))
;; => -0.24666666666666667

;; Exercise 1.3

;; Define a procedure that takes three numbers as arguments
;; and returns the sum of the squares of the two larger numbers

(define (square x)
  (* x x))

(define (sum-of-squares x y)
  (+ (square x)(square y)))

(define (>= x y)
  (not (< x y)))

(define (sum-of-squares-of-largest-numbers x y z)
  (cond ((and (>= x z)(>= y z)) (sum-of-squares x y))
        ((and (>= x y)(>= z y)) (sum-of-squares x z))
        ((and (>= y x)(>= z x)) (sum-of-squares y z))))

(sum-of-squares-of-largest-numbers 2 3 4)
;; => 25

(sum-of-squares-of-largest-numbers 10 2 1)
;; => 104

(sum-of-squares 10 2)
;; => 104



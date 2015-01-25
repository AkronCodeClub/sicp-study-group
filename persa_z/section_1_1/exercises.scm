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


;; Example 1.7: Square roots by Newton's method

(define (average x y)
  (/ (+ x y) 2))

(define (improve guess x)
  (average guess (/ x guess)))

(define (square x)
  (* x x))

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

(define (sqrt-iter guess x)
  (if (good-enough? guess x)
    guess
    (sqrt-iter (improve guess x)
               x)))

(define (sqrt x)
  (sqrt-iter 1.0 x))


;; Exercise 1.8

;; Use the cube-root formula to implement a cube-root procedure analogus to the square root procedure


(define (average x y)
  (/ (+ x y) 2))

(define (square x)
  (* x x))

(define (improve guess x)
  (/ (+ (/ x (square guess)) (* 2 guess)) 3))

(define (cube x)
  (* x x x))

(define (close-enough? guess x)
  (< (abs (- (cube guess) x)) 0.001))

(define (cube-rt-iter guess x)
  (if (close-enough? guess x)
    guess
    (cube-rt-iter (improve guess x)
                  x)))

(define (cube-rt x)
  (cube-rt-iter 1 x))

(cube-rt 8)
;; => 2.000004911675504

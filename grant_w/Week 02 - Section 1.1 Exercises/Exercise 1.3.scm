;;;
; 1.3 - Define a procedure that takes three numbers as arguments and
;       returns the sum of the squares of the two larger numbers.
;;;;;;;;;;;;;

(define (larger x y) (if (> x y) x y))

(define (square x) (* x x))

(define (sum-of-squares x y) (+ (square x) (square y)))

(define (sum-of-largest-squares x y z)
        (if (> x y)
            (if (> z y)
                (sum-of-squares x z)
                (sum-of-squares x y))
            (if (> z y)
                (sum-of-squares y z)
                (sum-of-squares y (larger x z)))))

(sum-of-largest-squares 2 1 5)
;29

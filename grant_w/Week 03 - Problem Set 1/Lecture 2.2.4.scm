; 2.2.4 - Write an expression that is equivalent to the following, but that uses lambda explicitly:
;         (define (fizz x y z) (+ x z))

(define fizz (lambda (x y z) (+ x z)))

(fizz 7 6 2)  ; 9
(fizz 1 3 4)  ; 5
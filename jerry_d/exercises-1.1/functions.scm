;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (abs x)
  (if (< x 0)
      (- x)
      x))

(define (average x y)
  (/ (+ x y) 2))

(define (square x)
  (* x x))

(define (cube x)
  (* x x x))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (assertEqual expected actual message)
  (if (equal? expected actual)
    (display "...   ")
    (display "FAIL: "))
  (display message)
  (newline))

(define (assertWithin expected actual variance message)
  (if (< (abs (- expected actual)) variance)
    (display "...   ")
    (display "FAIL: "))
  (display message)
  (newline))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (sum_squares_of_two_biggest a b c)
  (cond ((and (< a b) (< a c)) (+ (* b b) (* c c)))
        ((and (< b a) (< b c)) (+ (* a a) (* c c)))
        (else                  (+ (* a a) (* b b)))))

(display "Suite: sum_squares_of_two_biggest")
(newline)

(assertEqual 2  (sum_squares_of_two_biggest 1 1 1) "returns 2 when given all arguments are 1")
(assertEqual 8  (sum_squares_of_two_biggest 2 2 2) "returns 8 when given all arguments are 2")
(assertEqual 18 (sum_squares_of_two_biggest 3 3 2) "returns 18 when given when given 3, 3, and a smaller number")
(assertEqual 13 (sum_squares_of_two_biggest 1 2 3) "returns 13 when given 1, 2, and 3")
(assertEqual 52 (sum_squares_of_two_biggest 2 4 6) "returns the proper result when the first arg is the smallest")
(assertEqual 52 (sum_squares_of_two_biggest 4 2 6) "returns the proper result when the second arg is the smallest")
(assertEqual 52 (sum_squares_of_two_biggest 6 4 2) "returns the proper result when the first arg is the smallest")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (sqrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x)
                 x)))

(define (improve guess x)
  (average guess (/ x guess)))

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

(define (sqrt x)
  (sqrt-iter 1.0 x))

(display "Suite: sqrt")
(newline)

(assertWithin 1.4142156862745097 (sqrt 2) 0.001
              "returns ~1.414 for 2")
(assertWithin 3.00009155413138   (sqrt 9) 0.001
              "returns ~3.000 for 9")
(assertWithin 11.704699917758145 (sqrt (+ 100 37)) 0.001
              "returns ~11.704 for (+ 100 37)")
(assertWithin 1.7739279023207892 (sqrt (+ (sqrt 2) (sqrt 3))) 0.001
              "returns ~1.774 for (+ (sqrt 2) (sqrt 3))")
(assertWithin 1000.000369924366  (square (sqrt 1000)) 0.001
              "returns ~1000 for (square (sqrt 1000))")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (cbrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (cbrt-iter (improve guess x)
                 x)))

(define (improve guess x)
  (/ (+ (/ x (square guess)) (* 2 guess)) 3))

(define (good-enough? guess x)
  (< (abs (- (cube guess) x)) 0.001))

(define (cbrt x)
  (cbrt-iter 1.0 x))

(display "Suite: sum_squares_of_two_biggest")
(newline)

(assertWithin 1.2599210498948732 (cbrt 2) 0.001
              "returns ~1.260 for 2")
(assertWithin 2.080083823051904  (cbrt 9) 0.001
              "returns ~2.080 for 9")
(assertWithin 5.1551367354757724 (cbrt (+ 100 37)) 0.001
              "returns ~5.155 for (+ 100 37)")
(assertWithin 1.392849702964866  (cbrt (+ (cbrt 2) (cbrt 3))) 0.001
              "returns ~1.393 for (+ (cbrt 2) (cbrt 3))")
(assertWithin 1000.0000435797309 (cube (cbrt 1000)) 0.001
              "returns ~1000 for (cube (cbrt 1000))")

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

; PS.1.2.1: Double your pleasure
; 
; Write a Scheme procedure that, given a value for x, returns double that value.
 
(define double (lambda (x) (* x 2)))

(assertEqual  2 (double  1) "double  1 equals  2")
(assertEqual  4 (double  2) "double  2 equals  4")
(assertEqual  6 (double  3) "double  3 equals  6")
(assertEqual  8 (double  4) "double  4 equals  8")
(assertEqual 20 (double 10) "double 10 equals 10")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; PS.1.2.2: Solving simple equations
; 
; Write a Scheme procedure that, given a value for x, finds the
; value of the second order expression 3x^2 + 14x -5.

(define second-order (lambda (x) (+ (* 3 x x) (* 14 x) (- 5))))

(assertEqual  12 (second-order  1) "second-order  1 equals  12")
(assertEqual  35 (second-order  2) "second-order  2 equals  35")
(assertEqual  64 (second-order  3) "second-order  3 equals  64")
(assertEqual  99 (second-order  4) "second-order  4 equals  99")
(assertEqual 435 (second-order 10) "second-order 10 equals 435")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;  PS.1.2.3: Solving quadratic equations
; 
;  Write a Scheme procedure that, given coefficients a, b, and c of a
;  quadratic equation ax^2 + bx + c, returns the larger of the (real)
;  roots of the equation. You may assume a built-in scheme procedure
;  sqrt that takes a non-negative number and returns its square root.
;  Assume that a is greater than 0 and do not worry about guaranteeing
;  that the roots will be real. The Tutor will test your code only with
;  test cases where the roots are real.
;  
;  As with all Tutor programming problems, you should define and test
;  your procedure using an interpreter and editor -- in this case Dr. Scheme
;  -- and paste your working code into the answer box. While you are
;  testing your code, you might note that Dr. Scheme's built-in sqrt
;  procedure will accept negative arguments and return imaginary values.
; 
;  Quadratic Formula
; 
;  `x = (-b +/- sqrt(b^2 - 4ac)) / (2a)`
; 
;  @see https://www.rit.edu/~w-asc/documents/services/resources/handouts/9Roots%20of%20Quadratic%20Equations.pdf
  
  ;def quadratic_root(a, b, c)
    ;bigger2(* ->(n1, n2, denom) {
      ;[(n1 + n2)/denom, (n1 - n2)/denom]
    ;}.call(-b, (Math.sqrt(b*b - 4*a*c)), (2*a)))
  ;end
(define quadratic-root
  (lambda (a b c)
    (define (n1) (- b))
    (define (n2) (sqrt (- (* b b) (* 4 a c))))
    (define (denom) (* 2 a))
    (max (/ (+ (n1) (n2)) (denom)) (/ (- (n1) (n2)) (denom)))))

(assertWithin 4.0 (quadratic-root 1 -4 0) 0.1 "quadratic-root (1, -4, 0) ~ 4.0")
(assertWithin 3.0 (quadratic-root 1 -6 9) 0.1 "quadratic-root (1, -6, 9) ~ 3.0")
(assertWithin -0.38 (quadratic-root 1 3 1) 0.1 "quadratic-root (1, 3, 1) ~ -0.38")


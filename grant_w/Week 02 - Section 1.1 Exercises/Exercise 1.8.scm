;;;
; 1.8 - Implement a cube-root procedure analogous to the square-root procedure.
;
; Newton's method for cube roots is based on the fact that if y is an approximation to the
;   cube root of x, then a better approximation is given by the value: (( x / y^2) + 2y) / 3
;;;;;;;;;;;;;

(define (square x) (* x x))

(define (improve guess x)
  (/ (+ (/ x (square guess)) (* 2 guess)) 3))

(define (good-enough? lastguess guess)
  (< (abs (- lastguess guess)) 0.00001))

(define (cbrt-iter lastguess guess x)
  (if (good-enough? lastguess guess)
      guess
      (cbrt-iter guess (improve guess x)
                 x)))

(define (cbrt x)
  (cbrt-iter x 1.0 x))

(cbrt 64)       ; expect 4
; 4

(cbrt 8)        ; expect 2
; 2.000000000012062

(cbrt 0.000001) ; expect 0.01
; 0.010000000002405411

(cbrt 1000000)  ; expect 100
; 100

(cbrt 923923)   ; expect 97.39692811324018
; 97.39692811324018

(cbrt 0.000123) ; expect 0.049731898332685904
; 0.049731898355896365

(cbrt 0.000123) ; same as previous, but changed threshold to 0.00000001
; 0.0497318983326859  (exactly as expected)

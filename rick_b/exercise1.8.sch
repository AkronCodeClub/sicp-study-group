
; How to find the square root of a number

; guess y for square-root of number x

; better guess by averaging y with x/y (Newton's law of approximations)


;(define (sqrt-iter guess x)
;  (if (good-enough? guess x)
;      guess
;      (sqrt-iter (improve guess x)
;                 x)))


;(define (improve guess x)
;(average guess (/ x guess)))


;(define (average x y)
;  (/ (+ x y) 2))


;(define (good-enough? guess x)
;  (< (abs (- (square guess) x)) 0.001))


;(define (sqrt x)
;  (sqrt-iter 1.0 x))


;(sqrt 9) 


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Newton's method for cube roots says
; if y is an approximation to the cube root of x
; then a better approximation is given by:

;   (x/y**2 + 2y) / 3



(define (cube-iter guess x)
  (if (cube-good-enough? guess x)
      (* 1.0 guess)
      (cube-iter (cube-improve guess x) x)))

 
;   (x/y**2 + 2y) / 3  ( y is the guess)

(define (cube-improve guess x) 
  (/ (+ (/ x (* guess guess)) (* 2 guess)) 3))



; 3 cubed is 27, so the cube root of 27 is 3 

(define (cube-good-enough? guess x)
  (< (abs (- (* guess guess guess) x)) (/ 1 1000) ))


(define (cube-root x)
  (cube-iter 1 x))


;(cuberoot 27)

;Value: 3.0000005410641766


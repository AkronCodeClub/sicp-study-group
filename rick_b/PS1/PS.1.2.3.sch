; PS.1.2.3: Solving quadratic equations

; Write a Scheme procedure that, given coefficients a, b, and c of a quadratic equation 
; ax^2 + bx + c, returns the larger of the (real) roots of the equation.

; You may assume a built-in scheme procedure sqrt that takes a non-negative number 
; and returns its square root. Assume that a is greater than 0 and do not worry about 
; guaranteeing that the roots will be real.



; ax^2 + bx + c 

; Quadratic Formula:    x = [ -b ± √(b2-4ac) ] / 2a

; (b2-4ac) Need the sqrt of this. (- (* b b) (* 4 (* a c))) 

;(/ (+ (* -1 b) (sqrt (- (* b b) (* 4 (* a c))))) (* 2 a)) ;;;;;;; -b + sqrt of descriminant
;(/ (- (* -1 b) (sqrt (- (* b b) (* 4 (* a c))))) (* 2 a)) ;;;;;;; -b - sqrt of descriminant

; Discriminant
(define (discriminant a b c)
  (- (* b b) (* 4 (* a c))))


; -b + sqrt of descriminant
(define quadratic-add-root 
  (lambda (a b c) (/ (+ (* -1 b) (sqrt (discriminant a b c) )) (* 2 a))))


;-b - sqrt of descriminant
(define quadratic-sub-root 
  (lambda (a b c) (/ (- (* -1 b) (sqrt (discriminant a b c))) (* 2 a))))


(quadratic-add-root 3 100 5) ;Value: -.05007522584731087
(quadratic-sub-root 3 100 5) ;Value: -33.28325810748603

(quadratic-add-root 3 10 5) ; x=−0.6125741132772068
(quadratic-sub-root 3 10 5) ; x=−2.720759220056127 


(define (quadratic-root a b c)
  (if (< (quadratic-add-root a b c) (quadratic-sub-root a b c)) 
         (quadratic-sub-root a b c)       
      (quadratic-add-root a b c)))


(quadratic-root 3 100 5) ;Value: -.05007522584731087
(quadratic-root 3 10 5) ;x=−0.6125741132772068


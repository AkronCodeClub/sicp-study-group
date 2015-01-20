(define (square x) (* x x))

(square 3)

; 9


(define (sum-of-squares x y)
  (+ (square x) (square y)))

(sum-of-squares 2 2)

; 8


;  x < y < z
;  y < x < zf
;  z < x < y

(define (square-two-biggest x y z) 
  (cond ((and (< x y) (< x z)) (sum-of-squares y z))
        ((and (< y x) (< y z)) (sum-of-squares x z))
        ((and (< z x) (< z y)) (sum-of-squares x y))))


;(square-two-biggest 1 2 3)

(square-two-biggest 2 3 3)

;;; 13

;(square-two-biggest 2 1 3)

;;; 13

;(square-two-biggest 3 2 1)

;;; 13

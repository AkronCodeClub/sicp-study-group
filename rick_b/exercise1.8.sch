;;; (x/y**2 + 2y) / 3

(define (newton-cube-root x y) (/ (+ (/ x (* y y)) (* 2 y)) 3))

(newton-cube-root 2 2)

;;; 3/2 or 1.5

;;; cube_root = 3.37 if x == 3 && y == 5  

(newton-cube-root 3 5)

;;; 253/75   :)

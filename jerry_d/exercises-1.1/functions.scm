(define (abs x)
  (if (< x 0)
      (- x)
      x))

(abs -12)

(define (sum_squares_of_two_biggest a b c)
  (cond ((and (< a b) (< a c)) (+ (* b b) (* c c)))
        ((and (< b a) (< b c)) (+ (* a a) (* c c)))
        (else                  (+ (* a a) (* b b)))))
  
(display (sum_squares_of_two_biggest 1 1 1)) ;;; 2
(newline)

(display (sum_squares_of_two_biggest 2 2 2)) ;;; 8
(newline)

(display (sum_squares_of_two_biggest 3 3 2)) ;;; 18
(newline)

(display (sum_squares_of_two_biggest 1 2 3)) ;;; 13
(newline)

(display (sum_squares_of_two_biggest 2 4 6)) ;;; 52
(newline)

(display (sum_squares_of_two_biggest 4 2 6)) ;;; 52
(newline)

(display (sum_squares_of_two_biggest 6 4 2)) ;;; 52
(newline)

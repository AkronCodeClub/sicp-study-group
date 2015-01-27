; 1.2.4
; Write a Scheme procedure that, given two arguments, returns the square of the first argument if the first
; argument is smaller than the second argument, and otherwise returns the square root of the second argument.
; You may assume a built-in Scheme procedure sqrt that takes a non-negative number and returns its square root.

(define weird (lambda (a b)
    (if (< a b) (* a a) (sqrt b))))
    
(weird 4 8)  ; 16 (a is less than b, so return a^2)
(weird 8 4)  ; 2  (a is more than b, so return square root of b)


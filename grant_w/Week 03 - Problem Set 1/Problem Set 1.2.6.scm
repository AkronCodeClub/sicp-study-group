; 1.2.6
; Another built in Scheme procedure, called max, takes an arbitrary number of arguments,
; and returns the largest of them. We should be able to write a simple version of this ourselves.

; Part 1
; Write a Scheme procedure that takes two numbers as arguments, and returns the larger of the two.

(define bigger2 (lambda (a b) (if (> a b) a b)))

(bigger2 3 4)  ; 4
(bigger2 7 2)  ; 7
(bigger2 3 3)  ; 3


; Part 2
; Write a Scheme procedure that takes three numbers as arguments, and returns the larger of the three.
; Use your procedure bigger2.

(define bigger3 (lambda (a b c)
    (bigger2 (bigger2 a b) c)))

(bigger3 3 4 5)   ; 5
(bigger3 3 7 1)   ; 7
(bigger3 3 2 -3)  ; 3

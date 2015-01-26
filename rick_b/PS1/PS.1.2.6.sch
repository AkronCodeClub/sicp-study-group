; PS.1.2.6: Pushing it to the max

; Another built in Scheme procedure, called max, takes an arbitrary number of arguments,
; and returns the largest of them. We should be able to write a simple version of this ourselves.

; Part 1: Do it for two

; Write a Scheme procedure that takes two numbers as arguments,
; and returns the larger of the two. Do not use max within your procedure (this is cheating!!).

(define bigger2 (lambda (a b) 
  (if (< a b) b
       a)))


(bigger2 5 10)

(bigger2 10 5)


; Part 2: Do it for three

; Write a Scheme procedure that takes three numbers as arguments,
; and returns the larger of the three. Do not use max within your procedure (this is cheating!!), 
; but do use your procedure bigger2.


(define bigger3 (lambda (a b c) (bigger2 (bigger2 a b) c)))


(bigger3 1 2 3)
(bigger3 3 2 1)
(bigger3 1 3 2)

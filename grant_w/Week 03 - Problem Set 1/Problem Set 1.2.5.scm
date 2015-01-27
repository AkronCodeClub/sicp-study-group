; 1.2.5
; We used the built in Scheme procedure abs in lecture. But we ought to be able to write it ourselves.
; Write a Scheme procedure that takes a number as argument, and returns the absolute value of that number.
; Do not use abs within your procedure (this is cheating!!).

(define my-abs (lambda (a) ((if (> a 0) + -) a)))

(my-abs 3)   ; 3
(my-abs -3)  ; 3
(my-abs -40) ; 40
(my-abs 0)   ; 0

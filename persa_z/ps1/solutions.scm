;; PS.1.2.2: Solving simple equations

;; Write a Scheme procedure that, given a value for x,
;; finds the value of the second order expression 3x^2 + 14x -5.

(define second-order (lambda (x) your_code_here))

;; PS.1.2.3: Solving quadratic equations

;; Write a Scheme procedure that, given coefficients a, b, and c of a quadratic equation ax^2 + bx + c, returns the larger of the (real) roots of the equation. You may assume a built-in scheme procedure sqrt that takes a non-negative number and returns its square root. Assume that a is greater than 0 and do not worry about guaranteeing that the roots will be real. The Tutor will test your code only with test cases where the roots are real.

;; As with all Tutor programming problems, you should define and test your procedure using an interpreter and editor -- in this case Dr. Scheme -- and paste your working code into the answer box. While you are testing your code, you might note that Dr. Scheme's built-in sqrt procedure will accept negative arguments and return imaginary values.

(define quadratic-root
    (lambda (a b c) your_code_here))



;; PS.1.2.6: Pushing it to the max|#

;; Another built in Scheme procedure, called max, takes an arbitrary number of arguments, and returns the largest of them. We should be able to write a simple version of this ourselves.

;; Part 1: Do it for two

;; Write a Scheme procedure that takes two numbers as arguments, and returns the larger of the two. Do not use max within your procedure (this is cheating!!).

(define bigger2 (lambda (a b) your_code_here))
Part 2: Do it for three

;; Write a Scheme procedure that takes three numbers as arguments, and returns the larger of the three. Do not use max within your procedure (this is cheating!!), but do use your procedure bigger2.

(define bigger3 (lambda (a b c) your_code_here))

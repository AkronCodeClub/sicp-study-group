10 ; 10

(+ 5 3 4) ; 12

(- 9 1) ; 8

(/ 6 2) ; 3

(+ (* 2 4) (- 4 6)) ; 6

; create symbol "a" and associate it as the value 3
(define a 3)

; create symbol "b" and associate it as the value (+ a 1)
(define b (+ a 1))
(+ a b (* a b)) ; 19
(= a b) ; false

*|
 | if b > a AND b < (a * b)
 | return b
 | else return a
 | should return b = a + 1 = 3 + 1 = 4
 |*
(if (and (> b a) (< b (* a b)))
    b
    a)

*|
 | create a conditional check to see
 | if a = 4 return 6
 | else if b = 4 return 6 + 7 + a
 | else return 25
 | should return 6 + 7 + a = 6 + 7 + 3 = 16
 | *
(cond ((= a 4) 6)
      ((= b 4) (+ 6 7 a))
      ( else 25))

(+ 2 (if (> b a) b a)) ; 6

*|
 | create a condition to see
 | if a > b return a * (a + 1)
 | if a < b return b * (a + 1)
 | else return -1 * (a + 1)
 | should return b * (a + 1) = 4 * 4 = 16
(* (cond ((> a b) a)
	 ((< a b) b)
	 ( else -1))
   (+ a 1))



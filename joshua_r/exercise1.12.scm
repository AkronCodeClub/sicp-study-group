;;
; The following pattern of numbers is called Pascal's triangle.
;      1
;     1 1
;    1 2 1
;   1 3 3 1
;  1 4 6 4 1
;     ...
;
; The numbers at the edge of the triangle are all 1, and each 
; number inside the triangle is the sum of the two numbers above 
; it.
;
; Write a procedure that computes elements of Pascal's triangle 
; by means of a recursive process.

(define pascal-val
  (lambda (row column)
    (if (or (> column row) (< row 0) (< column 1))
	0
	(if
	 (or (< row 3) (= column 1) (= row column))
	 1
	 (+ (pascal-val (- row 1) (- column 1)) (pascal-val (- row 1) column))))))
(and
 (= (pascal-val 0 1) 0) (= (pascal-val 1 0) 0) (= (pascal-val 1 2) 0)
 (= (pascal-val 1 1) 1)
 (= (pascal-val 2 1) 1) (= (pascal-val 2 2) 1)
 (= (pascal-val 3 1) 1) (= (pascal-val 3 3) 1) (= (pascal-val 3 2) 2)
 (= (pascal-val 4 1) 1) (= (pascal-val 4 4) 1) (= (pascal-val 4 2) 3) (= (pascal-val 4 3) 3)
 (= (pascal-val 5 1) 1) (= (pascal-val 5 5) 1) (= (pascal-val 5 2) 4) (= (pascal-val 5 3) 6) (= (pascal-val 5 4) 4))
;;;
; 1.12 - The following pattern of numbers is called Pascal's triangle.
;        The numbers at the edge of the triangle are all 1, and each number inside the triangle is the sum of the two numbers above it.
;        Write a procedure that computes elements of Pascal's triangle by means of a recursive process.
;;;;;;;;;;;;;

;       1
;      1 1
;     1 2 1
;    1 3 3 1
;   1 4 6 4 1


; no clue what they mean by "that computes elements"... display them? return one specific one?

; row -> the row to calculate
; col -> the element in the row to calculate  (both are 1-index, not 0-index)
(define (pasc-recu row col)
  (cond ((or (< row 1) (< col 1) (> col row)) 0)
        ((or (= col 1) (= col row)) 1)
        ((+ (pasc-recu (- row 1) (- col 1)) (pasc-recu (- row 1) col)))))
 
 (pasc-recu 5 3) ;6
 (pasc-recu 5 4) ;4
 (pasc-recu 5 5) ;1
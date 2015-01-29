(define get-max
  (lambda vargs
    (define lgest 0)
    ; Had to search for the 'for-each'
    (for-each
     (lambda (x)
       (if (> x lgest) (set! lgest x)))
     vargs)
    ; had to search for 'display'
    (display lgest)))
(get-max 1 2 3 4 5)
(get-max 6 5 4)
(get-max 1)
(get-max 1 3 2 -1)

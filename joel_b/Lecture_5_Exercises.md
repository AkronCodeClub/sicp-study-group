# Lecture 5 Exercises

## Exercise 2.2

```scheme
(define (make-segment start-point end-point)
  (cons start-point end-point))

(define (start-segment segment) (car segment))
(define (end-segment segment) (cdr segment))

(define (make-point x y) (cons x y))

(define (x-point p) (car p))
(define (y-point p) (cdr p))

(define (avg a b) (/ (+ a b) 2.0))

(define (midpoint-segment segment)
  (make-point (avg (x-point (start-segment segment))
                   (x-point (end-segment segment)))
              (avg (y-point (start-segment segment))
                   (y-point (end-segment segment)))))

;;;Following is from exercise description
(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")"))
```

#### Output:
```scheme
> (define segment (make-segment (make-point 0 0)
                                (make-point 5 5)))
  (print-point (midpoint-segment segment))

(2.5,2.5)
> (define segment (make-segment (make-point 1 0)
                                (make-point 11 20)))
  (print-point (midpoint-segment segment))

(6.0,10.0)
```


## Exercise 2.3
```scheme
(define (make-rect bottom-left top-right)
  (cons bottom-left top-right))

(define (get-bot-left rect) (car rect))
(define (get-top-right rect) (cdr rect))

(define (make-point x y) (cons x y))

(define (get-x-point p) (car p))
(define (get-y-point p) (cdr p))

(define (get-area rect)
  (* (get-width rect) (get-height rect)))

(define (get-perimeter rect)
  (* 2 (+ (get-width rect) (get-height rect))))

(define (get-width rect)
  (- (get-x-point (get-top-right rect))
     (get-x-point (get-bot-left rect))))

(define (get-height rect)
  (- (get-y-point (get-top-right rect))
     (get-y-point (get-bot-left rect))))

(define (print-rect-info rect)
  (newline)
  (display "perimeter: ")
  (display (get-perimeter rect))
  (newline)
  (display "area: ")
  (display (get-area rect)))
```
#### Output:
```scheme
> (define r (make-rect (make-point 0 0)
                     (make-point 1 1)))
  (print-rect-info r)

perimeter: 4
area: 1
> (define r (make-rect (make-point 1 0)
                     (make-point 11 5)))
  (print-rect-info r)

perimeter: 30
area: 50
```
...*second part*

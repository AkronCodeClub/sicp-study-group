# Lectures 1 - 2

## Exercise 1.1

completed in head, confirmed with repl

## Exercise 1.2

```lisp
(/ (+ 5 4 (- 2 (- 3 (+ 6 (/ 4 5)))))
  (* 3 (- 6 2)
    (- 7 2)))
```

## Exercise 1.3

```lisp
(define (square a) (* a a))
(define (smallest a b c)
    (cond
        ((and (< a b) (< a c)) a)
        ((and (< b a) (< b c)) b)
        ((and (< c a) (< c b)) c)))
(define (exercise3 a b c)
    (-
        (+
            (square a)
            (square b)
            (square c))
        (square (smallest a b c))))
```

## Exercise 1.4

Define a procedure named `a-plus-abs-b` that takes two
arguments, `a` and `b`. Apply the `+` operator to `a` and `b`
if `b` is greater than `0`. Otherwise, apply the `-` operator.

## Exercise 1.5

skipped

## Exercise 1.6

skipped

## Exercise 1.7

skipped

## Exercise 1.8

```lisp
(define (cube x) (* x x x))
(define (improve guess x)
    (/
        (+
            (/ x
                (* guess guess))
            (* 2 guess))
        3))
(define (good-enough? guess x)
    (< (abs (- (cube guess) x)) 0.001))
(define (cube-itr guess x)
    (if (good-enough? guess x)
        guess
        (cube-itr (improve guess x) x)))
(define (cube-root x) (cube-itr 1.0 x))
```

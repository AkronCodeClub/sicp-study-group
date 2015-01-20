# Lecture 1-2 Exercises

## Exercise 1.1

```scheme
> 10
10
> (+ 5 3 4)
12
> (- 9 1)
8
> (/ 6 2)
3
> (+ (* 2 4) (- 4 6))
6
> (define a 3)
> (define b (+ a 1))
> (+ a b (* a b))
19
> (= a b)
#f
> (if (and (> b a) (< b (* a b)))
      b
      a)
4
> (cond ((= a 4) 6)
        ((= b 4) (+ 6 7 a))
        (else 25))
16
> (+ 2 (if (> b a) b a))
6
> (* (cond ((> a b) a)
           ((< a b) b)
           (else -1))
     (+ a 1))
16
```

## Exercise 1.2

```scheme
(/ (+ 5 4 (- 2 (- 3 (+ 6 (/ 4 5))))) (* 3 (- 6 2) (- 2 7)))
```


## Exercise 1.3

```scheme
(define (f x y z)
  (cond ((and (<= x y) (<= x z)) (+ (* y y) (* z z)))
        ((and (<= y x) (<= y z)) (+ (* x x) (* z z)))
        ((and (<= z x) (<= z y)) (+ (* x x) (* y y)))))
```


## Exercise 1.4

If b>0, '+' operator is returned and have '(+ a b)'. Otherwise '-' operator is returned and have '(- a b)'


## Exercise 1.5

Using _normal-order_ evaluation only the first expression is evaluated and the result would is 0. Using _applicative-order_ evaluation an error would result when the second expression is evaluated.


## Exercise 1.6
...


## Exercise 1.7
...


## Exercise 1.8

```scheme
(define (cube x)
  (* x x x))

(define (improve guess x)
  (/ (+ (/ x (* guess guess))
        (* 2 guess))
     3))

(define (good-enough? guess x)
  (< (abs (- (cube guess) x)) (* x 0.001)))

(define (curt-iter guess x)
  (if (good-enough? guess x)
      guess
      (curt-iter (improve guess x) x)))

(define (curt x)
  (curt-iter 1.0 x))
```

# Problem Set 1


## PS.1.2.2:  Solving simple equations

```scheme
(define second-order (lambda (x)
                       (+ (* 3 x x)
                          (* 14 x)
                          -5)))
```


## PS.1.2.3:  Solving quadratic equations

```scheme
(define quadratic-root (lambda (a b c)
                         (/ (- (sqrt (- (* b b) (* 4 a c)))
                               b)
                            (* 2 a))))
```


## PS.1.2.6:  Pushing it to the max

###Part 1:

```scheme
(define bigger2 (lambda (a b)
                   (if (> a b)
                       a
                       b)))
```

###Part 2:

```scheme
(define bigger3 (lambda (a b c)
                  (bigger2
                   (bigger2 a b) c)))
```

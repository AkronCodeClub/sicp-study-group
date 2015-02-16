# Lecture 6 Exercises


## Exercise 1.37

### Part a)
```scheme
(define (cont-frac n d k)
  (define (cont-frac-iter i)
    (if (> i k)
        0
        (/ (n i) (+ (d i) (cont-frac-iter (inc i))))))
  (cont-frac-iter 1))
```

#### Output:
```scheme
> ; Approximate 1/(golden ratio) after 12 steps
(cont-frac (lambda (i) 1.0)
           (lambda (i) 1.0)
           12)
0.6180257510729613
```
After 12 steps approximation is accurate to four decimal places.

### Part b)
#### Now as an iterative process:
```scheme
(define (cont-frac n d k)
  (define (cont-frac-iter value i)
    (if (< i 1)
        value
        (cont-frac-iter (/ (n i) (+ (d i) value))
                        (dec i))))
  (cont-frac-iter 0 k))
```


## Exercise 1.39

```scheme
(define (tan-cf x k)
  (cont-frac (lambda (i)
               (if (= i 1) x
                   (- (* x x))))
             (lambda (i)
               (- (* i 2.0) 1.0))
             k))

; From Exercise 1.37
(define (cont-frac n d k)
  (define (cont-frac-iter i)
    (if (> i k)
        0
        (/ (n i) (+ (d i) (cont-frac-iter (inc i))))))
  (cont-frac-iter 1))
```

#### Output:
```scheme
> (tan-cf 1 100)
1.557407724654902
> (define pi 3.14159265358979)
> (tan-cf (/ pi 4) 100)
0.9999999999999984
```

## Exercise 1.41

```scheme
(define (double f) (lambda (x) (f (f x))))
```

#### Output:
```scheme
> ((double inc) 3)
5
> (((double (double double)) inc) 5)
21
```


# Problem Set 2


## PS 2.1.5: Peano Addition
```scheme
(define plus (lambda (a b)
  (if (zero? b)
      a
      (plus (inc a) (dec b)))))
```

## PS 2.2.1:  Iterative odd?
```scheme
(define (odd?? x)
  (cond ((= x 1) #t)
        ((= x 0) #f)
        (else (odd?? (- x 2)))))
```

## PS 2.2.2:  Writing recursive *processes*
```scheme
(define slow-mul
  (lambda (a b)
    (if (zero? b)
        0
        (+ a (slow-mul a (dec b))))))
```

## PS 2.2.3:  Writing iterative *processes*
```scheme
(define slow-mul
  (lambda (a b)
    (define slow-mul-iter 
      (lambda (a counter sum)
        (if (zero? counter)
            sum
            (slow-mul-iter a
                           (dec counter)
                           (+ a sum)))))
    (slow-mul-iter a b 0)))
```

## PS 2.3.4:  Mystery
```scheme
(define clarity
  (lambda (a b)
    (if (> a b)
    0
    (+ a (clarity (+ a 1) b)))))
```

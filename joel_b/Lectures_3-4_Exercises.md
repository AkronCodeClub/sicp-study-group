# Lectures 3-4 Exercises

## Exercise 1.11

### Recursive process
```scheme
(define (fr n)
  (cond ((< n 3) n)
        ((>= n 3) (+ (fr (- n 1))
                     (* 2 (fr (- n 2)))
                     (* 3 (fr (- n 3)))))))
```

### Iterative process
```scheme
(define (f-iter a b c count)
  (if (= count 0)
      c
      (f-iter (+ a (* 2 b) (* 3 c)) a b (- count 1))))

(define (fi n)
  (f-iter 2 1 0 n))
```


## Exercise 1.12

```scheme
(define (pascal row col)
  (cond ((or (> col row)
             (< col 1)
             (< row 1)) 0)
        ((= col 1) 1)
        (else (+ (pascal (- row 1) (- col 1))
           (pascal (- row 1) col)))))
```


## Exercise 1.22

```scheme
;returns three prime numbers larger than n
(define (search-for-primes n)
  (next-prime-iter (next-odd n) 3))

(define (next-prime-iter n count)
  (if (> count 0)
    (if (timed-prime-test n)
      (next-prime-iter (+ n 2) (- count 1))
      (next-prime-iter (+ n 2) count))))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Modified from code given in exercise description
  
(define (timed-prime-test n)
  (start-prime-test n (runtime)))
  
(define (start-prime-test n start-time)
  (if (prime? n)
      (report-prime n (- (runtime) start-time))
      #f))
  
(define (report-prime n elapsed-time)
  (newline) 
  (display n) (display " *** ") (display elapsed-time))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;From Section 1.2.6 (Searching for divisors)

(define (prime? n)
  (= n (smallest-divisor n)))  
  
(define (smallest-divisor n) (find-divisor n 2))
  
(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (square n) (* n n))

(define (next-odd num)
  (if (odd? (+ 1 num))
      (+ 1 num)
      (+ 2 num)))
  
(define (divides? a b) (= (remainder b a) 0))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(search-for-primes 1e6)
(search-for-primes 1e7)
(search-for-primes 1e8)
(search-for-primes 1e9)
(search-for-primes 1e10)
(search-for-primes 1e11)
(search-for-primes 1e12)
```
### Output
```
1000003.0 *** 436
1000033.0 *** 301
1000037.0 *** 361
10000019.0 *** 962
10000079.0 *** 957
10000103.0 *** 955
100000007.0 *** 2999
100000037.0 *** 3024
100000039.0 *** 2995
1000000007.0 *** 9603
1000000009.0 *** 9496
1000000021.0 *** 9598
10000000019.0 *** 30603
10000000033.0 *** 30804
10000000061.0 *** 30435
100000000003.0 *** 117384
100000000019.0 *** 104304
100000000057.0 *** 114190
1000000000039.0 *** 327335
1000000000061.0 *** 343568
1000000000063.0 *** 319092
```

As expected, calculation time increases by roughly a factor of `√10 ≅ 3.2` each time initial number is multiplied by 10. This result is compatible with the notion that programs run in time proportional to the number of steps required for the computation.

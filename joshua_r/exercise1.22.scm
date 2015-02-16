(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime)))
(define (start-prime-test n start-time)
  (if (prime? n)
      (report-prime (- (runtime) start-time))))
(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))

;;
; Using this procedure, write a procedure search-for-primes
; that checks the primality of consecutive odd integers in a
; specified range. Use your procedure to find the three
; smallest primes larger than 1000; larger than 10,000;
; larger than 100,000; larger than 1,000,000. Note the time
; needed to test each prime. Since the testing algorithm has
; order of growth of (n), you should expect that testing for
; primes around 10,000 should take about 10 times as long as
; testing for primes around 1000. Do your timing data bear
; this out? How well do the data for 100,000 and 1,000,000
; support the n prediction? Is your result compatible with
; the notion that programs on your machine run in time
; proportional to the number of steps required for the
; computation?

(define (prime? n)
  (define (smallest-divisor n)
    (find-divisor n 2))
  (define (find-divisor n test-divisor)
    (cond ((> (square test-divisor) n) n)
	  ((divides? test-divisor n) test-divisor)
	  (else (find-divisor n (+ test-divisor 1)))))
  (define (divides? a b)
    (= (remainder b a) 0))
  (= n (smallest-divisor n)))
(define (is-odd? x) (= (remainder x 2) 1))
(define (find-primes start-n upper-n thresh count)
  (if (and (> count 0) (< start-n upper-n))
      (cond
       ((< start-n thresh) (find-primes (+ start-n 2) upper-n thresh count))
       ((prime? start-n)
	(display "Prime Number: ")
	(display start-n)
	(newline)
	(find-primes (+ start-n 2) upper-n thresh (- count 1)))
       (else (find-primes (+ start-n 2) upper-n thresh count)))
      0))

(define (search-for-primes start-n upper-n thresh count)
  (define start-time (* (runtime) 1.0))
  (cond
      ((is-odd? start-n) (find-primes start-n upper-n thresh count))
      (else (find-primes (+ 1 start-n) upper-n thresh count)))
  (report-prime (* (- (* (runtime) 1.0) start-time) 1.00))
  0)

(search-for-primes 1 10000000 1 3)
(search-for-primes 1 10000000 10 3)
(search-for-primes 1 10000000 100 3)
(search-for-primes 1 10000000 1000 3)
(search-for-primes 1 10000000 10000 3)
(search-for-primes 1 10000000 100000 3)
(search-for-primes 1 10000000 1000000 3)






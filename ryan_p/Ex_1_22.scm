;#lang racket
#lang planet neil/sicp ;this line needed for DrRacket
; comment both lines above this point to be MIT-Scheme compatible.

;Use your procedure to find the three smallest primes larger than 1000
;larger than 10,000; larger than 100,000; larger than 1,000,000. 
;Note the time needed to test each prime. Since the testing algorithm 
;has order of growth of (n), you should expect that testing for primes 
;around 10,000 should take about 10 times as long as testing for primes 
;around 1000. Do your timing data bear this out? How well do the data for 
;100,000 and 1,000,000 support the n prediction? Is your result compatible 
;with the notion that programs on your machine run in time proportional to 
;the number of steps required for the computation?

; average time for 100000000000    = 0.236124778 s
; average time for 1000000000000   = 0.770599667 s
; average time for 10000000000000  = 2.393247889 s
; average time for 100000000000000 = 7.600656889 s

(define (square n)
  (* n n))

(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))

(define (divides? a b)
  (= (remainder b a) 0))

(define (prime? n)
  (= n (smallest-divisor n)))

(define (timed-prime-test n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (if (prime? n)
      (report-prime n (- (runtime) start-time))
      #f))

(define (report-prime n elapsed-time)
  (display n)
  (display " (")
  (display (/ elapsed-time 1000000.0))
  (display " s)\n"))

(define (search-for-primes a n)
  (search-for-primes-iter (next-odd a) 0 n))

(define (search-for-primes-iter a found n)
  (if (= found n)
      (newline)
      (search-for-primes-iter (+ a 2)
                                (if (timed-prime-test a)
                                    (+ found 1)
                                    found)
                                n)))
(define (next-odd n)
  (if (even? n)
      (+ n 1)
      n))

(define (even? n)
  (= (remainder n 2) 0))

(search-for-primes 1000 3)
;1009 (0 s)
;1013 (0 s)
;1019 (0 s)

(search-for-primes 1000 3)
;1009 (0 s)
;1013 (0 s)
;1019 (0 s)

(search-for-primes 1000 3)
;1009 (0 s)
;1013 (0 s)
;1019 (0 s)

(search-for-primes 10000 3)
;10007 (0 s)
;10009 (0 s)
;10037 (0 s)

(search-for-primes 10000 3)
;10007 (0 s)
;10009 (0 s)
;10037 (0 s)

(search-for-primes 10000 3)
;10007 (0 s)
;10009 (0 s)
;10037 (0 s)

(search-for-primes 100000 3)
;100003 (0 s)
;100019 (0 s)
;100043 (0 s)

(search-for-primes 100000 3)
;100003 (0 s)
;100019 (0 s)
;100043 (0 s)

(search-for-primes 100000 3)
;100003 (0 s)
;100019 (0 s)
;100043 (0 s)

(search-for-primes 100000000000 3)
;100000000003 (0.242014 s)
;100000000019 (0.243014 s)
;100000000057 (0.237014 s)

(search-for-primes 100000000000 3)
;100000000003 (0.234013 s)
;100000000019 (0.231014 s)
;100000000057 (0.241014 s)

(search-for-primes 100000000000 3)
;100000000003 (0.230013 s)
;100000000019 (0.231014 s)
;100000000057 (0.236013 s)

(search-for-primes 1000000000000 3)
;1000000000039 (0.784045 s)
;1000000000061 (0.754044 s)
;1000000000063 (0.777044 s)

(search-for-primes 1000000000000 3)
;1000000000039 (0.785045 s)
;1000000000061 (0.794046 s)
;1000000000063 (0.761043 s)

(search-for-primes 1000000000000 3)
;1000000000039 (0.769044 s)
;1000000000061 (0.758043 s)
;1000000000063 (0.753043 s)

(search-for-primes 10000000000000 3)
;10000000000037 (2.382136 s)
;10000000000051 (2.417138 s)
;10000000000099 (2.396137 s)

(search-for-primes 10000000000000 3)
;10000000000037 (2.381136 s)
;10000000000051 (2.387136 s)
;10000000000099 (2.418139 s)

(search-for-primes 10000000000000 3)
;10000000000037 (2.371135 s)
;10000000000051 (2.403137 s)
;10000000000099 (2.383137 s)

(search-for-primes 100000000000000 3)
;100000000000031 (7.549432 s)
;100000000000067 (7.596434 s)
;100000000000097 (7.608435 s)

(search-for-primes 100000000000000 3)
;100000000000031 (7.588434 s)
;100000000000067 (7.598435 s)
;100000000000097 (7.597435 s)

(search-for-primes 100000000000000 3)
;100000000000031 (7.611435 s)
;100000000000067 (7.649437 s)
;100000000000097 (7.606435 s)

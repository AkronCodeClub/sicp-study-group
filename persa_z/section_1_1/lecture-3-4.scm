;; Exercise 1.11

;; A function f is defined by the rule that f(n) = n if n < 3 and f(n) = f(n - 1) + 2f(n - 2) + 3f(n - 3) if n > 3.

;; Write a procedure that computes f by means of a recursive process.
;; Write a procedure that computes f by means of an iterative process.

;; Using recursive process:

(define (f n)
  (if (< n 3)
    n
    (+ (* 1 (f (- n 1)))
       (* 2 (f (- n 2)))
       (* 3 (f (- n 3))))))

;; Using iterative process:

(define (f n)
  ;; Track previous three values.
  ;; fi-1 is f(i-1)
  ;; fi-2 is f(i-2)
  ;; fi-3 is f(i-3)
  (define (f-iter fi-1 fi-2 fi-3 i)
    ;; Calculate value at current index i.
    (define fi (+ fi-1
                  (* 2 fi-2)
                  (* 3 fi-3)))
    (if (= i n)
      fi
      (f-iter fi fi-1 fi-2 (+ i 1))))

  (if (< n 3)
    n
    (f-iter 2 1 0 3))) ;; start index i=3, count up until reach n.


;; Exercise 1.12

;; The following pattern of numbers is called Pascal's triangle.

;; Exercise 1.12 Formula 1

;; The numbers at the edge of the triangle are all 1, and each number inside the triangle is the sum of the two numbers above it.35 Write a procedure that computes elements of Pascal's triangle by means of a recursive process.



;; Exercise 1.22

;; Most Lisp implementations include a primitive called runtime that returns an integer that specifies the amount of time the system has been running (measured, for example, in microseconds). The following timed-prime-test procedure, when called with an integer n, prints n and checks to see if n is prime. If n is prime, the procedure prints three asterisks followed by the amount of time used in performing the test.

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

;; Using this procedure, write a procedure search-for-primes that checks the primality of consecutive odd integers in a specified range. Use your procedure to find the three smallest primes larger than 1000; larger than 10,000; larger than 100,000; larger than 1,000,000. Note the time needed to test each prime. Since the testing algorithm has order of growth of (n), you should expect that testing for primes around 10,000 should take about 10 times as long as testing for primes around 1000. Do your timing data bear this out? How well do the data for 100,000 and 1,000,000 support the n prediction? Is your result compatible with the notion that programs on your machine run in time proportional to the number of steps required for the computation?

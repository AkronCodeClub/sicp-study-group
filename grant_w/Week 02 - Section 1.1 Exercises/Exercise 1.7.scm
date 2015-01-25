;;;
; 1.7 - Explain how the good-enough test fails for small and large numbers.
;;;;;;;;;;;;;

(define (square x) (* x x))

(define (average x y)
  (/ (+ x y) 2))

(define (improve guess x)
  (average guess (/ x guess)))

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

(define (sqrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x)
                 x)))

(define (sqrt x)
  (sqrt-iter 1.0 x))

;; Testing small values
  
(sqrt 9)
; 3.00009155413138     => 9.0054940860

(sqrt 2)
; 1.4142156862745097   => 2.0000060073

(sqrt 0.001)
; 0.04124542607499115  => 0.0017011851

(sqrt 0.0001)
; 0.03230844833048122  => 0.0010438358

(sqrt 0.0000001)
; 0.03125106561775382  => 0.0009766291

; The accuracy of the square root gets worse with smaller numbers,
;   unless the "good enough" threshold is adjusted to be more precise (.001 -> .00001)
; We're comparing the diff of the square of the current guess to the original number we're
;   trying to find the square root of, and seeing if it's within the specified tolerance.
; Very small numbers are immediately within that threshold, so the result is wrong.

;; Testing large values

(sqrt 42099323432)
; 205181.19658487226   => 42099323431.99999597  (.000004 off)

(sqrt 942099323432)
; 970618.011079539     => 942099323432.0000930  (.000093 off)

(sqrt 3942099323432)
; 1985472.0656387992   => 3942099323432.000159  (.000159 off)

(sqrt 23942099323432)
; never completes, unless .001 is made less accurate, like .01 or .1

; The accuracy of the square root gets worse with large numbers,
;   unless the "good enough" threshold is adjusted to be less precise (.001 -> .1)
; We're comparing the diff of the square of the current guess to the original number we're
;   trying to find the square root of, and seeing if it's within the specified tolerance.
; Very large numbers don't have enough space to hold the number of decimals required,
;   so the result is inaccurate or we just never reach a result, because we lose decimals
;   precision and so never reach a result unless the "guess" is exactly right-on. (Even a
;   difference of 1 is not enough precision.)

;; Alternate strategy for good-enough, watching how "guess" changes from one iteration to the next,
;;   and stopping when the change is a very small fraction of the guess.

(define (square x) (* x x))

(define (average x y)
  (/ (+ x y) 2))

(define (improve guess x)
  (average guess (/ x guess)))

(define (good-enough? lastguess guess)
  (< (abs (- lastguess guess)) 0.001))

(define (sqrt-iter lastguess guess x)
  (if (good-enough? lastguess guess)
      guess
      (sqrt-iter guess (improve guess x)
                 x)))

(define (sqrt x)
  (sqrt-iter x 1.0 x))

;; Testing small values (same as before - threshold .001)

(sqrt 9)
; 3.000000001396984       => 9.0000000083

(sqrt 2)
; 1.4142135623746899      => 2.0000000000045

(sqrt 0.001)
; 0.03162278245070105     => 0.0010000003699

(sqrt 0.0001)
; 0.010000714038711746    => 0.0001000142813

(sqrt 0.0000001)
; 0.0010104595507340792   => 0.0000010210285

(sqrt 0.0000001) ; (same as previous, but threshold changed to .0000001)
; 0.00031622776664863746  => 0.0000001000000

;; Testing large values (same as before - threshold .001)

(sqrt 42099323432)
; 205181.19658487226      => 42099323431.99999597  (.000004 off - same as before)

(sqrt 942099323432)
; 970618.011079539        => 942099323432.0000930  (.000093 off - same as before)

(sqrt 3942099323432)
; 1985472.0656387992      => 3942099323432.000159  (.000159 off - same as before)

(sqrt 23942099323432)
; 4893066.454017563       => 23942099323432.00797  (.007968 off - previously, this didn't even complete)

(sqrt 23942099323432)  ; (same as previous, but threshold changed to .0000001) 
; 4893066.454017563

; The alternate strategy is more accurate for smaller numbers, even with the same threshold.
; It also works better with larger numbers, returning a value whereas before it wouldn't finish.

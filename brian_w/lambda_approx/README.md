# An Adventure in Approximation
## with Lambda expressions and Closures

### Getting Started

We start with the basic approximation of square roots, as described in the book/lectures. It goes something like this

```scheme
(define (sqrt guess x)
  (if (good-enough? guess x)
      guess
      (sqrt (improve-guess guess x) x)
      )
  )
```

Now, we need to provide the two functions `good-enough?` and `improve-guess`, and their supporting functions `abs` and `avg`. The whole think winds up looking like this

```scheme
(define (abs x)
  (if (< x 0)
      (- x)
      x))
(define (avg a b)
  (/ (+ a b) 2))
(define (good-enough? guess x)
  (< (abs (- guess (/ x guess))) 0.0001))
(define (improve-guess guess x)
  (avg guess (/ x guess)))
(define (sqrt guess x)
  (if (good-enough? guess x)
      guess
      (sqrt (improve-guess guess x) x)
      )
  )
```

You can see this version of the code [here](version1.scm).

### Getting Closure

Now, take a moment to move some of the code inside the `sqrt` function and create a closure that alleviates the need to constantly pass around `x` (*which never changes*). The refactoring make the code look like this

```scheme
(define (abs x)
  (if (< x 0)
      (- x)
      x))
(define (avg a b)
  (/ (+ a b) 2))
(define (sqrt x)
  (define (good-enough? guess)
    (< (abs (- guess (/ x guess))) 0.0001))
  (define (improve-guess guess)
    (avg guess (/ x guess)))
  (define (try guess)
    (if (good-enough? guess)
	guess
	(try (improve-guess guess))))
  (try 1)
  )
```

You can see this version of the code [here](version2.scm).

At this point, the `sqrt` function takes only one argument, as we'd expect. This guess is provided within, where first `(try 1)` and then keep *improving*.

Now for something completely different....

### Extracting the approximate function

Now we take a moment to recognize that the `try` function is a *generic* mechanism for refining a guess -- once we have been given the fuctions `improve-guess` and `good-enough?`. We want to continue to use closure magic on these functions, but our engine for executing them is now devoid of all knowledge of the particular domain of square root approximation.

```scheme
(define (abs x)
  (if (< x 0)
      (- x)
      x))
(define (avg a b)
  (/ (+ a b) 2))


(define (approximate good-enough? improve-guess)
  (define (try guess)
    (if (good-enough? guess)
	guess
	(try (improve-guess guess))))
  (try 1)
  )

(define (sqrt x)
  (define (good-enough? guess)
    (< (abs (- guess (/ x guess))) 0.0001))
  (define (improve-guess guess)
    (avg guess (/ x guess)))
  (approximate good-enough? improve-guess)
  )
```

You can see this version of the code [here](version3.scm).

Let's take another quick moment to rewrite *just* the `sqrt` function using the `lambda` variant of define. This will ease the transition into the final versions of the code.

```scheme
(define (sqrt x)
  (define good-enough? (lambda (guess)
    (< (abs (- guess (/ x guess))) 0.0001)))
  (define improve-guess (lambda (guess)
    (avg guess (/ x guess))))
  (approximate good-enough? improve-guess)
  )
```

You can see the whole version of the code [here](version4.scm).

This has cleared the way for our final version, which strips away the defines for `good-enough?` and `improve-guess`. You see, we don't really need them; we just need to pass the lambda expressions they represent into our approximation routine. So, here's the final version of the `sqrt` function.

```scheme
(define (abs x)
  (if (< x 0)
      (- x)
      x))

(define (avg a b)
  (/ (+ a b) 2))

(define (approximate good-enough? improve-guess)
  (define (try guess)
    (if (good-enough? guess)
	guess
	(try (improve-guess guess))))
  (try 1)
  )

(define (sqrt x)
  (approximate
   (lambda (guess)
     (< (abs (- guess (/ x guess))) 0.0001))
   (lambda (guess)
     (avg guess (/ x guess)))
   )
  )
```

You can see this version of the code [here](version5.scm).

### But why?!?

Is this just an exercise of obfuscation? Well, maybe. No, wait. Not really. There actually is a point to this. And, here it is. Now that we've conquered *generic* approximation, we can implement other approximations trivially. Let's take the cube root approximation.

Newton says we can improve on a guess (`y`) of the cube root of `x`, by applying the following operations (given here in all their Lisp/Scheme beauty).

```scheme
(/ (+ (/ x (* y y)) (* 2 y)) 3)
```

And, we should be able to fathom an expression for `good-enough?` function that looks something like

```scheme
(< (abs (- y (/ (/ x y) y))) 0.0001)
```

So, we'll introduce a bonus version of the `sqrt` code that also performs `cubert`.

```scheme
(define (cubert x)
  (approximate
   (lambda (guess)
     (< (abs (- guess (/ (/ x guess) guess))) 0.0001))
   (lambda (guess)
     (/ (+ (/ x (* guess guess)) (* 2 guess)) 3))
   )
  )
```

This final version of this code is [here](version6.scm).

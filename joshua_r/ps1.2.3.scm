(define (pow x y)
  (cond ((= y 0) 1)
	((< y 0) (/ (pow x (+ y 1)) x))
	(else (* x (pow x (- y 1))))))
(define shared
  (lambda (a b c)
    (sqrt (- (pow b 2)
	     (* 4.0 a c)))))
(define quadratic-root
  (lambda (a b c)
    (/ (+ (- b) (shared a b c))
       (* 2.0 a))))
(define neg-quadratic-root
  (lambda (a b c)
    (/ (- (- b) (shared a b c))
       (* 2.0 a))))

(and (= (quadratic-root 1 3 -4) 1)
     (= (neg-quadratic-root 1 3 -4) -4))
(and (= (quadratic-root 2 -4 -3) 2.58113883008419)
     (= (neg-quadratic-root 2 -4 -3) -0.5811388300841898))

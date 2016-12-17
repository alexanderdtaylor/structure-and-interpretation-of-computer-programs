; Exercise 1.7

; good-enough? test used in computing square roots will not be very effective for finding the square roots of very small numbers. 
; Also, in real computers, arithmetic operations are almost always performed with limited precision. This makes our test inadequate 
; for very large numbers. Explain these statements, with examples showing how the test fails for small and large numbers. 

;;; For small numbers, the algorithm has limited precision because of the tolerance	
;;; For example,
;;;	(sqrt-iter .220000 .10000000000000)
;;;	produces .3168843420730213 which is close to .31622776601684, but still significantly different in the 4th, 5th and 6th places.

;;; For large algorithms, accuracy is also bounded by tolerance, but it may cause the recursive calls to fail to reach a base case.
;;; For example, 
;;;   (sqrt-iter 3160000.0 10000000000000)
;;; does not truncate because the tolerance is never able to get within 0.001. The function fails to select small enough values in each 
;;; recursive step leading to a process that will not end as it "bounces" back and forth, but never below the local minimum.

; An alternative strategy for implementing good-enough? is to watch how guess changes from one iteration to the next and to 
; stop when the change is a very small fraction of the guess. Design a square-root procedure that uses this kind of end test. 
; Does this work better for small and large numbers?

;;; Yes. 

; Below, outlines a recursive function to compute square roots takes a guess and an x. 
; We guess '4' where x is '25'
; if good-enough = true, where good enough is a function that takes the x ('25') and the guess ('4')
; and returns the square of the guess ('4' x '4' = '16') and then subtracts x from that number ('16'-'25' = '-9').
; And converts it to an absolute value ('9'). If 9 is less than the tolerance, then it evaluates true. 
; Otherwise a new guess if formulated, where the guess ('4')
; and the result of x divided by guess ('25/4' = '6.25') are averaged (('4' + '6.25')/ '2' = '5.125')
; then sqrt-iter is computed again until the results is less than the hard-coded tolerance.

; In this new code, we want to instead compare '5.125' and '4' (and set that bound to a given toleraance)

(define (square x) (* x x))

(define (sum-of-squares x y)
  (+ (square x) (square y)))

(define (abs x)
  (cond ((> x 0) x)
        ((= x 0) 0)
        ((< x 0) (- x))))

(define (sqrt-iter guess x)
  (if (good-enough-2? guess x)
      guess
      (sqrt-iter (improve guess x)
                 x)))
				 
(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))
  
(define (improve guess x)
  (average guess (/ x guess)))

(define (good-enough-2? guess x)
  (< (abs(- guess (/ x guess))) (/ guess 10000)))
 				 
(define (average x y)
  (/ (+ x y) 2))

(define (sqrt x)
  (sqrt-iter 1.0 x))
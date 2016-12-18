; Exercise 1.10.  The following procedure computes a 
; mathematical function called Ackermann's function.

(define (A x y)
  (cond ((= y 0) 0)
        ((= x 0) (* 2 y))
        ((= y 1) 2)
        (else (A (- x 1)
                 (A x (- y 1))))))

; What are the values of the following expressions?
; (A 1 10)

(A 1 10)
 (cond: does y equal zero? No.
		does x equal zero? No.
		does y equal 1? print 2. 
		else:
			(A 0 (A 1 9))
		...
			(A 0 (A 0 (A 1 8)))
		...
			(A 0 (A 0 (A 0 (A 1 7))))
		...
			(A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (- 2 1))))))))))
		...
			1024, or 2^10 power.
			
; (A 2 4)
		does y equal zero? No.
		does x equal zero? No.
		does y equal 1? print 2.
		else:
			(A 1 (A 2 3))
			(A 1 (A 1 (A 2 2)))
			(A 1 (A 1 (A 1 (A 2 1))))
			(A 1 (A 1 (A 1 2)))
			(A 1 (A 1 (A 0 (A 1 1))))
			(A 1 (A 1 (A 0 2)))
			(A 1 (A 1 4))
			(A 1 (A 0 (A 1 3)))
			
			
			
			65536, or 2^16
			
; (A 3 3)
		...
			65536, or 2^16
			
		
; Consider the following procedures, where A is the procedure defined above:

; (define (f n) (A 0 n))

;;; This equals 2n.

; (define (g n) (A 1 n)) 

;;; This equals 2^n

; (define (h n) (A 2 n))

;;; 2 and the power tower of order n  
;;; https://en.wikipedia.org/wiki/Tetration

; (define (k n) (* 5 n n))
; Give concise mathematical definitions for the functions computed by the procedures 
; f, g, and h for positive integer values of n. For example, (k n) computes 5n^2.
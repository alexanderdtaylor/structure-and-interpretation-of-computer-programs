; Exercise 1.5
; Recall the example

(define (p) (p))

(define (test x y)
	(if (= x 0)
		0
		y))
		
(test 0 (p))

; Unfortunately, normal-order evaluation expands all terms before evaluation.

(if (= 0 0)
	0
	(p))
	
; As shown above, p is a function that when called return a function with itself as an
; argument. This is an infinite loop. The resulting functions would be "piled up".
; Specifically, repeatingly trying to expand (p) leads to an expansion ((p(p(p)(p...)))

; Applicative-order evaluation will not evaluate the second argument
; of the "if" expression because the expression is never needs to be
; evaluated. 

; Under applicative-order evalution, the function terminates and produces the 
; desired output.
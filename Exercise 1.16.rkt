; It is also possible to use the idea of successive squaring to devise an 
; iterative algorithm that computes exponentials with a logarithmic number of steps 
; (see exercise 1.16), although, as is often the case with iterative algorithms, 
; this is not written down so straightforwardly as the recursive algorithm

; Exercise 1.16.  Design a procedure that evolves an iterative exponentiation 
; process that uses successive squaring and uses a logarithmic number of steps, 
; as does fast-expt. (Hint: Using the observation that (bn/2)2 = (b2)n/2, 
; keep, along with the exponent n and the base b, an additional state variable a, 
; and define the state transformation in such a way that the product a bn is unchanged 
; from state to state. 

; At the beginning of the process a is taken to be 1, and the answer is given by the value 
; of a at the end of the process. In general, the technique of defining an invariant quantity 
; that remains unchanged from state to state is a powerful way to think about the design of 
; iterative algorithms.) 

; Recall fast-expt:

(define (fast-expt b n)
  (cond ((= n 0) 1)
        ((even? n) (square (fast-expt b (/ n 2))))
        (else (* b (fast-expt b (- n 1))))))
		
(define (even? n)
  (= (remainder n 2) 0))
  
  
; Here's a potential solution:
; To make it iterative, we include count variable.
; and push the value to 'a'; in each period.
; We initialize 'a' at 1, as discussed in the Hint.

(define (exponent-iter b n)
  (exponent-iterative b n 1))

(define (exponent-iterative b n a)
  (cond ((= n 0) a)
        ((even? n) (exponent-iterative b (- n 2) (* b b a))) 
        (else (exponent-iterative b (- n 1) (* b a)))))

(define (even? n)
  (= (remainder n 2) 0))

(exponent-iter 3 2)

; We didn't include the invariant, although we easily could 
; add it as another variable.
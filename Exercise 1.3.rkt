; Exercise 1.3 
; Define a procedure that takes three numbers as arguments 
; and returns the sum of the squares of the two larger numbers.

(define (square x) (* x x))

(define (sum-of-squares x y)
  (+ (square x) (square y)))

(define (big-two a b c) 
	(if (> a b) 
		(if (> b c) 
			(sum-of-squares a b) 
			(sum-of-squares a c)) 
		(if (> a c)
			(sum-of-squares a b) 
			(sum-of-squares b c))))

; psedo-code for Exercise 1.3
;   if a > b
;				then a,b are biggest
;				sum-of-squares(a b)
;			if c > b
;				then a,c are biggest
;				sum-of-squares(a c)
;	
;	if a =< b
;		
;			if a >= c
;				then a,b are biggest
;				sum-of-squares(a b)
;			if c > a
;				then b,c are biggest
;				sum-of-squares(a b)
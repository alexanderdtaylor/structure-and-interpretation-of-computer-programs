; Exercise 1.12.  The following pattern of numbers is called Pascal's triangle.
; The numbers at the edge of the triangle are all 1, and each number inside the 
; triangle is the sum of the two numbers above it.35 Write a procedure that computes 
; elements of Pascal's triangle by means of a recursive process.

; Let any element of the triangle equal its row (n) and column (m) index.
; Therefore, the third row's second element would be given by (3,2)
; 
; Therefore, we have two sets of basic cases.
; Left-edges can be demarked 
; (1,1)
; (2,1)
; (3,1)
; ...
; whenever m=1, the function should equal one.
; Concertely, pascal(n,1) = 1.

; Also, right-edges return '1' whenever (n=m)
; (1,1)
; (2,2)
; (3,3)
; Concretely, when m=n, pascal(m,n) = 1

; With these two conditions in place, we can define the recursive
; condition for all other elements. 
; For elements in row n, column m, look at row n-1, m-1 and row n-1,m-1
; add these two values.
; Concretely, pascal(n,m) = pascal(n-1,m-1) + pascal(n-1,m-1)


(define (pascal n m)
  (cond ((= n 1) 1)
		((= n m) 1)
		else (+ pascal((- n 1) (- m 1)) pascal((- n 1),(- m 1)))
	
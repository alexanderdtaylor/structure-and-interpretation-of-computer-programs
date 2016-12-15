; Exercise 1.4

(define (a-plus-abs-b a b)
	((if (> b 0) + -) a b))
	
; The expression will return the value of 'a' added to the absolute value of b.
; Starting with the conditional, if b > 0, then the '+' operator will be returned.
; Otherwise, if b =< 0, then the '-' operator will be returned. These operators, 
; once returned give (+ a b) or (- a b). Then these expressions are applied to 
; produce the scalar result.
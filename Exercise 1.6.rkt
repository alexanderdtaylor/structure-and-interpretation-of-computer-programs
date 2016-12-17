; Exercise 1.6

; The funciton is defined as follows:

(define (sqrt-iter guess x)
	(new-if (good-enough? guess x)
			guess
			(sqrt-iter (improve guess x)
				x)))
				
; Here new-if takes three arguments. The three arguments are:
;	(1) (good-enough? guess x)
;	(2) guess
;	(3) (sqrt-iter (improve guess x) x))

; The first thing Scheme does is evaluate the arguments, which is fine for (1) and (2) but not (3)
; Another way to see this is imagine that argument z is a recusive call and you have applicative-order evaluation. 
;
; Again, in psedo-code: 
;
; function int sqrt-iter (guess x)
; {
;	function new-if (x y z)
;		....
;	}
;  }
;
; Imagine z continuing to expand during the application step -- e.g. 
; new-if (x y new-if (... new-if(... new-if(... new-if(...))))).
;
; As a result, the function never stops evalating the arguments.
;
; A good discussion is found here.
; http://stackoverflow.com/questions/1171252/whats-the-explanation-for-exercise-1-6-in-sicp
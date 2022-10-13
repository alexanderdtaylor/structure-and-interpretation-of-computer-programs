Exercise 1.1.

Exercise 1.1 
Below is a sequence of expressions. What is the result printed by the
interpreter in response to each expression? Assume that the sequence
is to be evaluated in the order in which it is presented.

(a) 10
> 10

(b) (+ 5 3 4)
> 12

(c) (- 9 1)
> -8

(d) (/ 6 2)
> 3

(e) (+ ( 2 4) (- 4 6))
> 4

(f) (define a 3)
> No response. 'a' = 3.

(g) (define b (+ a 1))
> No response. 'b' = a + 1.

(h) (+ a b (* a b)) 
> 19.

(i) (= a b)
> False.

(j) (if (and (> b a) (< b (* a b)))
    b
    a)
> 4.

(k) (cond ((= a 4) 6)
      ((= b 4) (+ 6 7 a))
      (else 25))
> 16.  
	  
(+ 2 (if (> b a) b a))
> 6.

(m) (* (cond ((> a b) a)
         ((< a b) b)
         (else -1))
   (+ a 1))  
> 16.
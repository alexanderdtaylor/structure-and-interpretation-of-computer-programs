(define (product term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (* result (term a)))))
  (iter a 1))

;factorial
(define (identity x) x)
(define (inc n) (+ n 1))
(define (factorial x)
  (product identity 1 inc x))

(factorial 5)  ;120

;calculate pi
(define (inc2 n) (+ n 2))
(define (calculate-pi n)
  (* (/ (* 2 (product identity 4 inc2 (- n 2)) (product identity 4 inc2 (- n 2)) n) 
        (*(product identity 3 inc2 (- n 1)) (product identity 3 inc2 (- n 1)))) 4.0))
(calculate-pi 10000)

;b
(define (product term a next b)
  (if (> a b)
      1
      (* (term a)
         (product term (next a) next b))))

(define (sum term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (+ result (term a)))))
  (iter a 0))

;test
(define (identity x) x)
(define (inc n) (+ n 1))
(define (sum-integers a b)
  (sum identity a inc b))
;add up the integers from 1 to 10:
(sum-integers 1 10)  ;55
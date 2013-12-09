(define (func-r n m)
  (cond ((= n 1) 1)
        ((= n 2) 1)
        ((= m 1) 1)
        ((= m n) 1)
        (else (+ (func-r (- n 1) (- m 1)) (func-r (- n 1)  m)))))

(func-r 5 3)
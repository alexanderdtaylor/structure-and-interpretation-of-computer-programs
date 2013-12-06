(define (func n)
  (if (< n 3)
      n
     (func-iter 2 1 0 n)))

(define (func-iter a b c count)
  (if(= count 0)
      c
      (func-iter (+ (* 3 c) (* 2 b) a) a b (- count 1))))

(func 4)
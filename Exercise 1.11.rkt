(define (func n)
  (if (< n 3)
      n
     (func-iter 2 1 0 n)))

(define (func-iter a b c count)
  (if(= count 0)
      c
      (func-iter (+ (* 3 c) (* 2 b) a) a b (- count 1))))

(func 4)

(define (func-recursive n)
  (if (< n 3)
      n
      (+ (func-recursive (- n 1)) (* 2 (func-recursive (- n 2)))  
         (* 3 (func-recursive (- n 3))))))

(func-recursive 4)
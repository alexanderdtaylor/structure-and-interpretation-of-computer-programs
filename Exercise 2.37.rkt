(define nil '())
(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))
(define (accumulate-n op init seqs)
  (if (null? (car seqs))
      nil
      (cons (accumulate op init (map car seqs))
            (accumulate-n op init (map cdr seqs)))))

(define (dot-product v w)
  (accumulate + 0 (map * v w)))

(define m (list (list 1 2) (list 1 2)))
(define n (list (list 1 3) (list 1 3)))
(define v (list 1 2))

;Fill in the missing expressions in the following procedures for computing the other matrix operations
;matrix-*-vector
(define (matrix-*-vector m v)
  (map (lambda (x)
         (dot-product v x))
       m))

(matrix-*-vector m v)

;transpose
(define (transpose mat)
  (accumulate-n cons nil mat))

(transpose m)

;matrix-*-matrix
(define (matrix-*-matrix m n)
  (let ((cols (transpose n)))
    (map (lambda (x)
         (matrix-*-vector cols x))
         m)))
(matrix-*-matrix m n)

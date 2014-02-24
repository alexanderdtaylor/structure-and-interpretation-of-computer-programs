;Fill in the missing expressions to complete the following definitions of some basic list-manipulation operations as accumulations

(define nil '())
(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

;map
(define (map2 p sequence)
  (accumulate (lambda (x y) 
                (cons (p x) y)) 
              nil 
              sequence))

(define (square x)
  (* x x))
(map square (list 1 2 3 4))
(map2 square (list 1 2 3 4)) 

;append
(define (append2 seq1 seq2)
  (accumulate cons seq2 seq1))

(append (list 1 2 3) (list 4 5 6))
(append2 (list 1 2 3) (list 4 5 6))

;length
(define (length2 sequence)
  (accumulate (lambda (x y) 
                (+ 1 y))
              0 
              sequence))

(length (list 1 2 3 4 5 6))
(length2 (list 1 2 3 4 5 6))
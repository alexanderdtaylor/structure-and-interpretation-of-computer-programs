;Define a procedure square-tree analogous to the square-list procedure of exercise 2.21
(define nil '())

;test tree
(define x (list 1 (list 2 (list 3 4) 5) (list 6 7)))

x

;define directly
(define (square-tree tree)
  (cond ((null? tree) nil)
        ((not (pair? tree)) (* tree tree))
        (else (cons (square-tree (car tree))
                    (square-tree (cdr tree))))))
(square-tree x)

;define by using map
(define (square-tree2 tree)
  (map (lambda (sub-tree)
         (if (pair? sub-tree)
             (square-tree2 sub-tree)
             (* sub-tree sub-tree)))
       tree))
(square-tree2 x)
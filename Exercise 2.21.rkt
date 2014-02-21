;Here are two different definitions of square-list. Complete both of them by filling in the missing expressions:
(define nil '())

(define (square-list items)
  (if (null? items)
      nil
      (cons (* (car items) (car items)) (square-list (cdr items)))))
(square-list (list 1 2 3 4))

(define (square-list2 items)
  (map (lambda (x) (* x x)) items))
(square-list2 (list 1 2 3 4))
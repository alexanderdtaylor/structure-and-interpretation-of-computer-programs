;Write a procedure fringe that takes as argument a tree (represented as a list) and returns a list whose elements are all the leaves of the tree arranged in left-to-right order. 

(define x (list (list 1 2) (list 3 4 (list 5 6) 7)))

(define nil '())

(define (fringe item)
  (if (null? item)
      nil
      (if (pair? (car item))
          (append (fringe (car item)) (fringe (cdr item)))
          (append (list (car item)) (fringe (cdr item))))))

(fringe x)
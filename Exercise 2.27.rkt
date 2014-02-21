;Modify your reverse procedure of exercise 2.18 to produce a deep-reverse procedure that takes a list as argument and returns as its value the list with its elements reversed and with all sublists deep-reversed as well.
(define x (list (list 1 2) (list 3 4) (list 5 6)))

;reverse
x
(reverse x)

(define nil '())
;deep-reverse
(define (deep-reverse item)
  (if (null? item)
      nil
      (if (pair? (car item))
          (append (deep-reverse (cdr item)) (list (deep-reverse (car item))))
          (append (deep-reverse (cdr item)) (list (car item))))))

(deep-reverse x)

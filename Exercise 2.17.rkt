(define test-list (list 1 4 9 16 25))

(define (list-length items)
  (if (null? items)
      0
      (+ 1 (length (cdr items)))))
(list-length test-list)

; returns the list that contains only the last element of a given (nonempty) list:
(define (last-pair items)
  (if (= (list-length items) 1)
      (car items)
      (last-pair (cdr items))))

(last-pair test-list)
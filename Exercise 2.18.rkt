(define test-list (list 1 4 9 16 25))

;(cons 1 test-list)
;(append test-list (list 1 2))
;(length test-list)


;takes a list as argument and returns a list of the same elements in reverse order
(define (list-reverse items)
  (if (= (length items) 1)
      items
      (append (reverse (cdr items)) (list (car items)))))

;(reverse test-list)
(list-reverse test-list)
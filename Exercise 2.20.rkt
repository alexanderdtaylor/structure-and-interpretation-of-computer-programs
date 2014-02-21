;write a procedure same-parity that takes one or more integers and returns a list of all the arguments that have the same even-odd parity as the first argument

(define (same-parity x . y)
  (define (iter-list result remains)
    (if (null? remains)
        result
        (if (= (remainder x 2) (remainder (car remains) 2))
             (iter-list  (append result (list (car remains))) (cdr remains))
             (iter-list  result (cdr remains)))))
  (iter-list (list x) y))

(same-parity 1 2 3 4 5 6 7)

(same-parity 2 3 4 5 6 7)
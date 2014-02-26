(define nil '())
(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define (filter predicate sequence s)
  (cond ((null? sequence) nil)
        ((predicate (car sequence) s)
         (cons (car sequence)
               (filter predicate (cdr sequence) s)))
        (else (filter predicate (cdr sequence) s))))

(define (enumerate-interval low high)
  (if (> low high)
      nil
      (cons low (enumerate-interval (+ low 1) high))))

(define (flatmap proc seq)
  (accumulate append nil (map proc seq)))

(define (sum-s? triple s)
  (= s (+ (car triple) (cadr triple) (cadr (cdr triple)))))

(define (make-triple-sum triple)
  (list (car triple) (cadr triple) (cadr (cdr triple)) (+ (car triple) (cadr triple) (cadr (cdr triple)))))


;Write a procedure to find all ordered triples of distinct positive integers i, j, and k less than or equal to a given integer n that sum to a given integer s.
(define (unique-triples n)
  (flatmap (lambda(i)
             (map (lambda(pair)
                    (cons i pair))
                  (flatmap (lambda(j)
                             (map (lambda(k) (list j k))
                                  (enumerate-interval 1 (- j 1))))
                           (enumerate-interval 1 (- i 1)))))
           (enumerate-interval 1 n)))
(unique-triples 4)


(define (sum-s-triples n s)
  (map make-triple-sum
       (filter sum-s? (unique-triples n) s)))

(sum-s-triples 6 6)
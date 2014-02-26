(define nil '())
(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define (filter predicate sequence)
  (cond ((null? sequence) nil)
        ((predicate (car sequence))
         (cons (car sequence)
               (filter predicate (cdr sequence))))
        (else (filter predicate (cdr sequence)))))

(define (enumerate-interval low high)
  (if (> low high)
      nil
      (cons low (enumerate-interval (+ low 1) high))))

(define (flatmap proc seq)
  (accumulate append nil (map proc seq)))

(define (prime-sum? pair)
  (odd? (+ (car pair) (cadr pair))))  ;I changed prime? to odd? because prime? because prime? doesn't work for my DrRacket

(define (make-pair-sum pair)
  (list (car pair) (cadr pair) (+ (car pair) (cadr pair))))

(define (prime-sum-pairs n)
  (map make-pair-sum
       (filter prime-sum?
               (flatmap
                (lambda (i)
                  (map (lambda (j) (list i j))
                       (enumerate-interval 1 (- i 1))))
                (enumerate-interval 1 n)))))

(prime-sum-pairs 6)

;Define a procedure unique-pairs that, given an integer n, generates the sequence of pairs (i,j) with 1< j< i< n. 
(define (unique-pairs n)
  (flatmap (lambda(i)
         (map (lambda(j) (list i j))
              (enumerate-interval 1 (- i 1))))
       (enumerate-interval 1 n)))
(unique-pairs 2)

;Use unique-pairs to simplify the definition of prime-sum-pairs given above.
(define (prime-sum-pairs2 n)
  (map make-pair-sum
       (filter prime-sum? (unique-pairs n))))

(prime-sum-pairs2 6)
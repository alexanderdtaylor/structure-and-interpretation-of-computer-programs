(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))

(define (integral f a b n)
  (define (inc-h x) (+ x (/ (- b a) n)))
  (define (nf x)
    (cond ((= (/(- x a) (/ (- b a) n)) 0) (f x))
          ((= (/(- x a) (/ (- b a) n)) n) (f x))
          ((odd? (/(- x a) (/ (- b a) n))) (* (f x) 4))
          ((even? (/(- x a) (/ (- b a) n))) (* (f x) 2))))
  (/ (* (sum nf a inc-h b) (/ (- b a) n)) 3.0))


(define (cube x)
  (* x x x))
(integral cube 0 1 10000)
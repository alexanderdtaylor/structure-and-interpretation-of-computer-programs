;Exercise 2.29.  A binary mobile consists of two branches, a left branch and a right branch. Each branch is a rod of a certain length, from which hangs either a weight or another binary mobile. We can represent a binary mobile using compound data by constructing it from two branches (for example, using list):
;
;(define (make-mobile left right)
;  (list left right))
;
;A branch is constructed from a length (which must be a number) together with a structure, which may be either a number (representing a simple weight) or another mobile:
;
;(define (make-branch length structure)
;  (list length structure))


;test list
(define x (list (list 1 2) (list 1 2)))
(define y (list (list 1 2) (list 3 x)))

;a
(define (left-branch mobile)
  (car mobile))
(define (right-branch mobile)
  (car (cdr mobile)))
(define (branch-length branch)
  (car branch))
(define (branch-structure branch)
  (car (cdr branch)))

;b total-weight
(define (total-weight mobile)
  (+(branch-weight (left-branch mobile))
    (branch-weight (right-branch mobile))))
(define (branch-weight branch)
  (if (pair? (branch-structure branch))
      (total-weight (branch-structure branch))
      (branch-structure branch)))

(total-weight x)
(total-weight y)

;c
(define (mobile-balanced? mobile)
  (and (= (* (branch-length (left-branch mobile)) (branch-weight (left-branch mobile)))
          (* (branch-length (right-branch mobile)) (branch-weight (right-branch mobile))))
       (branch-balanced? (left-branch mobile))
       (branch-balanced? (right-branch mobile))))

(define (branch-balanced? branch)
  (if (pair? (branch-structure branch))
      (mobile-balanced? (branch-structure branch))
      #t))

(mobile-balanced? x)
(mobile-balanced? y)

;d.  
;Suppose we change the representation of mobiles so that the constructors are
;(define (make-mobile left right)
;  (cons left right))
;(define (make-branch length structure)
;  (cons length structure)
;)
;We only need to change
;(define (right-branch mobile)
;  (cdr mobile))
;(define (branch-structure branch)
;  (cdr branch))

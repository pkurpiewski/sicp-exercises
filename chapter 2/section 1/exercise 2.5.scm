;; Exercise 2.5

;; Show that we can represent pairs of nonnegative integers
;; using only numbers and arithmetic operations if we represent
;; the pair a and b as the integer that is the product of
;; 2^(a) * 3^(b). Give the corresponding definitions of the 
;; procedures cons, car, and cdr.

(define (cons a b)
  (* (expt 2 a) (expt 3 b)))

;; so, for instance, (cons 2 8) is equal to (* (expt 2 2) (expt 3 8))
;; = (* 4 6561)
;; = 26244

;; how do we get it back out, though? we have a number that is a composite of
;; 2 raised to what we want multiplied by 3 raised to something we don't know. 
;; 
;; 2 and 3 are prime factors: so divide out 2 or 3 until you get a remainder
;; the number of clean divisions is the exponent

(define (factor-division n f count)
  (if (= (remainder n f) 0)
      (factor-division n (/ n f) (+ count 1))
      (count)))

(define (car l)
  (factor-division l 2 0))

(define (cdr l)
  (factor-division l 3 0))


(car (cons 3 9))
(cdr (cons 5 420))

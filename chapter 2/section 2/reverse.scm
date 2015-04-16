(define testlist (list 1 4 9 16 25))

;; What does reverse need to accomplish? Well, first
;; we want to take each item off of the list, and then 
;; put it in to a new list in reverse order. Not so bad.
;; So what is the base case of our recursive procedure?
;; The base case of the recursive procedure is when our
;; input list, items, is null. That means we've popped off every element.
;; How do we pop them off? We could:
;; car items, then pass the cdr of items back to reverse
;; this repeats until items is '(). How do the items get put back together?
;; Is a recursive procedure the right way to go about this? Would we have more
;; luck with an iterator?
;; What would an iterative procedure for reversing look like?
;; Let's shelve that line of reasoning for now and go back to the recursive
;; procedure. Is the base case correct? I think so. What do we return at that
;; point? A new list, defined within the procedure? So when we cons or append, 
;; on the else call, we will return that. 

;; By returning the cons of reverse with cdr items and car items, we get the right numbers
;; in the right order, but it creates multiple nested lists. Which is not formatted right.
;; ex. => (((((() . 25) . 16) . 9) . 4) . 1)
;; The base case I'm using returns an empty list at the end, which is no bueno.\
;; So the trick was to use append instead of cons. However, append requires, as arguments,
;; two lists. Returning the car of the list of items is just a primative, so we wrap it in
;; to a list in order to pass it as an argument to append.
;; The base case returning the empty list, or nil, works because append, when confronted with
;; the empty list as a first argument, simply returns the second list.

(define (reverse items)

  (if (null? items)
      '()
      (append (reverse (cdr items))
	      (list (car items)))))

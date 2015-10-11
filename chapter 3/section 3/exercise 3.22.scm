(define (make-queue)
  (let ((front-ptr '())
	(rear-ptr '()))
    (define (set-front-ptr! item)
      (set! front-ptr item)
      front-ptr)
    (define (set-rear-ptr! item)
      (set! rear-ptr item)
      rear-ptr)
    (define (empty-queue?)
      (null? front-ptr))
    (define (front-queue)
      (if (empty-queue?)
	  (error "FRONT cannot be called with an empty queue.")
	  (car front-ptr)))
    (define (print-queue)
      front-ptr)
    (define (insert-queue! item)
      (let ((new-pair (cons item '())))
	(cond ((empty-queue?)
	       (set-front-ptr! new-pair)
	       (set-rear-ptr! new-pair)
	       (print-queue))
	      (else
	       (set-cdr! rear-ptr new-pair)
	       (set-rear-ptr! new-pair)
	       (print-queue)))))
    (define (delete-queue!)
      (cond ((empty-queue?)
	     (error "DELETE cannot be called with an empty queue."))
	    (else
	     (set-front-ptr! (cdr front-ptr))
	     (print-queue))))
    
    (define (dispatch m)
      (cond ((eq? m 'print) (print-queue))
	    ((eq? m 'empty?) (empty-queue?))
	    ((eq? m 'insert) insert-queue!)
	    ((eq? m 'delete) (delete-queue!))
	    ((eq? m 'front) (front-queue))
	    ((eq? m 'set-front) set-front-ptr!)
	    ((eq? m 'set-rear) set-rear-ptr!)
	    ((eq? m 'front-ptr) front-ptr)
	    ((eq? m 'rear-ptr) rear-ptr)
	    (else
	     (error "Invalid argument:" m))))
    dispatch))

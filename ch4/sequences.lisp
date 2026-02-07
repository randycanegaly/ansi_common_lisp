(defun mirror? (s)
  (let ((len (length s)))
    (and (evenp len)
	 (do ((forward 0 (+ forward 1))
	      (back (- len 1) (- back 1)))
	     ((or (> forward back)
		  (not (eql (elt s forward) (elt s back))));this is the two-part or test
	      (> forward back);this is "result", this gets executed when the test = true. Test will be true if forward and back pass each other or what forward points to doesn't match what back points to, or both. So, if we hit a mismatch before forward and back pass each other then the result returned --> (> forward back) will be nil. If we haven't seen a mismatch (front character and back characters match as forward and back walk toward each other and then forward and back pass each other, then result (> forward back) returns T and we are confirmed to have a palindrome
	      );this is the end of the (test result*) list, there is no body for this do, but if there was, it would go here
	   ))))

(defun tokens (str test start)
 )

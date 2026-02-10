;;;parsing text dates into day, month, year integer representation

;;a function to create tokens from a sequence
;;parameters: str sequence to parse, test a function to use to test each element, start the position in the sequence to start the parsing
;;logic:
;;find a p1 where the test function is first true
;;if no p1, function returns nil
;;find a p2 where the test function is next/first false
;;the non-nil case return value is a cons whose car is the substring p1 to p2
;;and whose cdr is either the return value of a recursive call to tokens, passing p2 as start
;;or whose cdr is nil if no p2
(defun tokens (str test start)
  (let ((p1 (position-if test str :start start)));bind p1 to position of first character of the string where the test function returns true
    (if p1;if we found one element where the test function returned true
	(let ((p2 (position-if #'(lambda (c);start at p1, bind p2 to next position of a character where the test function returns false
				   (not (funcall test c)))
			       str :start p1)))
					;within this inner let, with p1 and p2 bound as per above ...
	  (cons (subseq str p1 p2);create a substring from p1 to p2-1 as the car of a new cons
		(if p2;do this only if we have a value for p2
		    (tokens str test p2);recursive call, make the cdr the return value of the function starting at p2
		    nil));if no p2, set cdr to nil
	  );end of inner let
	nil));end of outer let, return value is nil if no p1
  )



;;a function to return only the characters we can see, excluding the space character
;;takes a character
(defun constituent (c)
  (and (graphic-char-p c)
       (not (char= c #\ ))));returns true only if the character is both a graphic character and not the space character


;;a function to parse a date into day, month, year integer representation
(defun parse-date (str)
  (let ((toks (tokens str #'constituent 0)));call tokens and bind the result to tokens
    (list (parse-integer (first toks));build a list of the elements of tokens, all converted to integers
	  (parse-month (second toks))
	  (parse-integer (third toks)))))

(defparameter  *month-names*
  #("jan" "feb" "mar" "apr" "may" "jun" "jul" "aug" "sep" "oct" "nov" "dec"))

(defun parse-month (str)
  (let ((p (position str *month-names*
		     :test #'string-equal)));find the position of the month string in month-names where string-equal is true
    (if p
	(+ p 1);add one to p - zero indexing if there is a p
	nil)));otherwise, nil

(defun read-integer (str);take a string and return the integer it represents
  (if (every #'digit-char-p str);if every character in the string is a digit
      (let ((accum 0));set accum to zero
	(dotimes (pos (length str));using pos as the variable for each character, do this as many times as the length of str 
	  (setf accum (+ (* accum 10)
			 (digit-char-p (char str pos))))
	  (format t "accum: ~A~%" accum)
	  );returns the integer corresponding to char
	accum)
      nil))
	

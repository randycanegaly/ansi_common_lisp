(defvar *last-input* nil
  "A global variable to hold the last value read by the ASKEM function.")

(defun askem (prompt)
  "Prints the prompt and reads one Lisp object (the user's age) from the input."
  (format t "~A " prompt)
  (read))

(defun show-squares (start end)
  (do ((i start (+ i 1)))
    ((> i end) 'done)
    (format t "~A ~A~%" i (* i i))))

(defun show-squares-b (i end)
  (if (> i end) ;if block, tests if i is greater than end
      'done ;if i is greater than end, return the done symbol
      (progn ;takes any number of expressions, evaluates them and returns the value of the last one
	(format t "~A ~A~%" i (* i i)) ;writes out i squared
	(show-squares-b (+ i 1) end)))) ;recursive call giving a new span of numbers with the starting one advanced by one


(defun our-length (lst)
  (let ((len 0))
    (dolist (obj lst) ;iterate through the list returned by lst, assign that element in the list to obj 
      (setf len (+ len 1))) ;increment len 
    len)) ;the return value of the let is the value of the last expression -- len 

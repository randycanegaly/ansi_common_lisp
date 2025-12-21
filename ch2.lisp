;; (defvar *last-input* nil
;;   "A global variable to hold the last value read by the ASKEM function.")

;; (defun askem (prompt)
;;   "Prints the prompt and reads one Lisp object (the user's age) from the input."
;;   (format t "~A " prompt)
;;   (read))

;; (defun show-squares (start end)
;;   (do ((i start (+ i 1)))
;;     ((> i end) 'done)
;;     (format t "~A ~A~%" i (* i i))))

;; (defun show-squares-b (i end)
;;   (if (> i end) ;if block, tests if i is greater than end
;;       'done ;if i is greater than end, return the done symbol
;;       (progn ;takes any number of expressions, evaluates them and returns the value of the last one
;; 	(format t "~A ~A~%" i (* i i)) ;writes out i squared
;; 	(show-squares-b (+ i 1) end)))) ;recursive call giving a new span of numbers with the starting one advanced by one


;; (defun our-length (lst)
;;   (let ((len 0))
;;     (dolist (obj lst) ;iterate through the list returned by lst, assign that element in the list to obj 
;;       (setf len (+ len 1))) ;increment len 
;;     len)) ;the return value of the let is the value of the last expression -- len 
;; )

;; 					;Ex1 a) - 5 1 is evaluated to 4, + 3 7 is evaluated to 10, + 4 10 i evaluated --> 14
;; 					;b) creates this list (1 5)
;; 					;c) always returns 7
;; 					;d) (NIL 3


;; (defun my-greater (x y)
;; (if (> x y)
;;     x
;;     y)
;)

#|
enigma ...
expects a list
returns t or NIL
assume x is a list
if x is not null and either car x or enigma on cdr returns true then enigma returns true
if x is null then enigma returns NIL
if x is not null but both car x and enigma on cdr x return NIL then enigma returns NIL
|#


;; (defun enigma (x)
;;   (and (not (null x))
;;        (or (null (car x))
;; 	   (enigma (cdr x)))))

;; (defun mystery (x y);takes an element and a list
;;   (if (null y);if the list is null, return false
;;       nil
;;       (if (eql (car y) x);if the first element of y is exactly x, return 0
;; 	  0
;; 	  (let ((z (mystery x (cdr y))));recursively call mystery on the remainder of y, using x for checking
;; 	    (and z (+ z 1))))))
;; ;mystery returns the index of the first occurrence of x in y


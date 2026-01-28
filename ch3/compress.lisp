(defun compress (x)
  (if (consp x)
      (compr (car x) 1 (cdr x));call compr if x is a cons
      x));otherwise return x

(defun compr (elt n lst)
  (if (null lst)
      (list (n-elts elt n));list is empty, nothing more to examine
      (let ((next (car lst)));set next to the first element of lst
	(if (eql next elt);see a repeated element
	    (compr elt (+ n 1) (cdr lst));recurse into compr, having seen n+1 of elt
	    (cons (n-elts elt n)
		  (compr next 1 (cdr lst)))))));otherwise, new cons made up of a description of string of elements and a new recursive call to process the rest of lst

(defun n-elts (elt n);"n of elt seen"
  (if (> n 1);if more than one of n seen
      (list n elt);return a new list consisting of n and the element
      elt));if n is 0, no repeats, return the element

(defun uncompress (lst)
  (if (null lst)
      nil
      (let ((elt (car lst));set elt to the first element
	    (rest (uncompress (cdr lst))));set rest to recursive call to uncompress on cdr
	(if (consp elt);body of let, if elt is a cons
	    (append (apply #'list-of elt);build a new list of list-of applied to every element of elt + rest
		    rest)
	    (cons elt rest)))));otherwise, elt is not a cons, build a new cons of elt and rest

(defun list-of (n elt);pass n elts
  (if (zerop n);if n is zero
      nil;return nil
      (cons elt (list-of (- n 1) elt))));otherwise build a new cons of elt and recursive call to list-of, winding up with a list of n elts


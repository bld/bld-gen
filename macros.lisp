;; Macros & functions used to generate code in gen.lisp

(in-package :bld-gen)

(defun to-cl (n)
  (find-symbol (symbol-name n) :cl-user))

(defun two-fun (op)
  (intern (concatenate 'string "TWO" (symbol-name op)) :bld-gen))

(defun one-fun (op)
  (intern (concatenate 'string "ONE" (symbol-name op)) :bld-gen))

(defun two-fun-gen (op)
  (find-symbol (concatenate 'string "TWO" (symbol-name op)) :bld-gen))

(defun one-fun-gen (op)
  (find-symbol (concatenate 'string "ONE" (symbol-name op)) :bld-gen))

(defmacro defarithn (op &optional min-one-arg?)
  "Define generic arithmetic function for arbitrary argument number. Second argument, if T, indicates a minimum of one argument is required."
  (let ((two-fun (two-fun op))
	(one-fun (when min-one-arg?
		   (one-fun op)))
	(cl-op (to-cl op)))
    `(progn
       (defgeneric ,two-fun (arg1 arg2))
       (defmethod ,two-fun ((arg1 number) (arg2 number))
	 (,cl-op arg1 arg2))
       (defmethod ,two-fun (arg1 arg2)
	 (simp (list ',op arg1 arg2)))
       ,@(when min-one-arg?
	       (list `(defgeneric ,one-fun (arg))
		     `(defmethod ,one-fun ((arg number))
			(,cl-op arg))
		     `(defmethod ,one-fun (arg)
			(simp (list ',op arg)))))
       (defun ,op (,@(when min-one-arg? '(arg1)) &rest args)
	 (if args (reduce (function ,two-fun) 
			  ,(if min-one-arg? 
			       '(cons arg1 args)
			       'args))
	     ,(if min-one-arg? 
		  `(,one-fun arg1)
		  (funcall cl-op)))))))

(defmacro defarith2 (op)
  "Define generic arithmetic function of 2 arguments"
  `(progn
     (defgeneric ,op (arg1 arg2))
     (defmethod ,op ((arg1 number) (arg2 number))
       (,(to-cl op) arg1 arg2))
     (defmethod ,op (arg1 arg2)
       (simp (list ',op arg1 arg2)))))

(defmacro defarith1 (op)
  "Define generic arithmetic function of 1 argument"
  `(progn
     (defgeneric ,op (arg))
     (defmethod ,op ((arg number))
       (,(to-cl op) arg))
     (defmethod ,op (arg)
       (simp (list ',op arg)))))

(defmacro defarith2opt (op)
  "Define generic arithmetic function with 1 required argument and 2nd optional argument"
  (let ((two-fun (two-fun op))
	(one-fun (one-fun op))
	(cl-op (to-cl op)))
    `(progn
       (defgeneric ,two-fun (arg1 arg2))
       (defmethod ,two-fun ((arg1 number) (arg2 number))
	 (,cl-op arg1 arg2))
       (defmethod ,two-fun (arg1 arg2)
	 (simp (list ',op arg1 arg2)))
       (defgeneric ,one-fun (arg))
       (defmethod ,one-fun ((arg number))
	 (,cl-op arg))
       (defmethod ,one-fun (arg)
	 (simp (list ',op arg)))
       (defun ,op (arg1 &optional arg2)
	 (if arg2 (,two-fun arg1 arg2)
	     (,one-fun arg1))))))

(defmacro defarith (op nargs &optional min1arg)
  "Define an arithmetic function
OP: name of the arithmetic function
NARGS: number of arguments: 1, 2, 'N
MIN1ARG: T if OP can take a single argument, NIL if it doesn't"
  (cond
    ((equal nargs 1) `(defarith1 ,op))
    ((and (equal nargs 2) min1arg) `(defarith2opt ,op))
    ((and (equal nargs 2) (null min1arg) `(defarith2 ,op)))
    ((equal nargs 'n) `(defarithn ,op ,min1arg))
    (t (error "Invalid arguments."))))

(defmacro defops ()
  `(progn
     ,@(loop for op in *ops*
	  collect `(defarith ,@op))))

(defmacro defmeth2 (op ((arg1 type1) (arg2 type2)) &body body)
  (let ((two-fun (two-fun op)))
    `(defmethod ,two-fun ((,arg1 ,type1) (,arg2 ,type2))
       ,@body)))

(defmacro defmeth1 (op ((arg type)) &body body)
  (let ((one-fun (one-fun op)))
    `(defmethod ,one-fun ((,arg ,type))
       ,@body)))


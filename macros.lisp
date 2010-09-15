;; Macros & functions used to generate code in gen.lisp

(in-package :bld-gen)

(defclass ma ()
  ((e :initarg :e :reader e :initform 0)))

(defmethod print-object ((m ma) stream)
  (format stream "~a" (e m)))

(defgeneric ma (form))
(defmethod ma (form)
  (make-instance 'ma :e form))

(defun to-cl (n)
  (find-symbol (symbol-name n) :cl-user))

(defun two-fun (op)
  (intern (concatenate 'string "TWO" (symbol-name op)) :bld-gen))

(defun one-fun (op)
  (intern (concatenate 'string "ONE" (symbol-name op)) :bld-gen))

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
       (defmethod ,two-fun ((arg1 ma) (arg2 ma))
	 (make-instance (type-of arg1) :e (simp (list ',op (e arg1) (e arg2)))))
       ,@(when min-one-arg?
	       (list `(defgeneric ,one-fun (arg))
		     `(defmethod ,one-fun ((arg number))
			(,cl-op arg))
		     `(defmethod ,one-fun ((arg ma))
			(make-instance (type-of arg) :e (simp (list ',op (e arg)))))))
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
     (defmethod ,op ((arg1 ma) (arg2 ma))
       (make-instance (type-of arg1) :e (simp (list ',op (e arg1) (e arg2)))))))

(defmacro defarith1 (op)
  "Define generic arithmetic function of 1 argument"
  `(progn
     (defgeneric ,op (arg))
     (defmethod ,op ((arg number))
       (,(to-cl op) arg))
     (defmethod ,op ((arg ma))
       (make-instance (type-of arg) :e (simp (list ',op (e arg)))))))

(defmacro defarith2opt (op)
  "Define generic arithmetic function with 1 required argument and 2nd optional argument"
  (let ((two-fun (two-fun op))
	(one-fun (one-fun op))
	(cl-op (to-cl op)))
    `(progn
       (defgeneric ,two-fun (arg1 arg2))
       (defmethod ,two-fun ((arg1 number) (arg2 number))
	 (,cl-op arg1 arg2))
       (defmethod ,two-fun ((arg1 ma) (arg2 ma))
	 (make-instance (type-of arg1) :e (simp (list ',op (e arg1) (e arg2)))))
       (defgeneric ,one-fun (arg))
       (defmethod ,one-fun ((arg number))
	 (,cl-op arg))
       (defmethod ,one-fun ((arg ma))
	 (make-instance (type-of arg) :e (simp (list ',op (e arg)))))
       (defun ,op (arg1 &optional arg2)
	 (if arg2 (,two-fun arg1 arg2)
	     (,one-fun arg1))))))

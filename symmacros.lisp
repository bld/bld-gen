(in-package :bld-gensym)

(defmacro defsymmeth (op nargs &optional min1arg)
  (cond
    ((equal op '/) nil)
    ((equal nargs 1) 
     `(progn
	(defmethod ,op ((arg t)) (simp (list ',op arg)))
	(defmethod ,op ((arg rational)) (simp (list ',op arg)))))
    ((and (or (equal nargs 2) (equal nargs 'bld-gen::n)) min1arg)
     `(progn
	(defmeth12 ,op ((arg1 t) (arg2 t))
	  ((simp (list ',op arg1)))
	  ((simp (list ',op arg1 arg2))))
	(defmeth12 ,op ((arg1 rational) (arg2 t))
	  ((simp (list ',op arg1)))
	  ((simp (list ',op arg1 arg2))))
	(defmeth12 ,op ((arg1 t) (arg2 rational))
	  ((simp (list ',op arg1)))
	  ((simp (list ',op arg1 arg2))))))
    ((and (equal nargs 2) (null min1arg))
     `(progn
	(defmethod ,op ((arg1 t) (arg2 t)) (simp (list ',op arg1 arg2)))
	(defmethod ,op ((arg1 rational) (arg2 t)) (simp (list ',op arg1 arg2)))
	(defmethod ,op ((arg1 t) (arg2 rational)) (simp (list ',op arg1 arg2)))))
    ((and (equal nargs 'bld-gen::n) (null min1arg))
     `(progn
	(defmeth2 ,op ((arg1 t) (arg2 t)) (simp (list ',op arg1 arg2)))
	(defmeth2 ,op ((arg1 rational) (arg2 t)) (simp (list ',op arg1 arg2)))
	(defmeth2 ,op ((arg1 t) (arg2 rational)) (simp (list ',op arg1 arg2)))))
    (t (error "Invalid arguments."))))

(defmacro defsymops ()
  `(progn
     ,@(loop for op in *ops*
	  collect `(defsymmeth ,@op))))

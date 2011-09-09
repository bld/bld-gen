(in-package :bld-gensym)

(defmacro defsymmeth (op nargs &optional min1arg)
  (cond
    ((equal nargs 1) `(defmeth1 ,op ((arg t)) (simp arg)))
    ((and (or (equal nargs 2) (equal nargs 'n)) min1arg) 
     `(defmeth12 ,op ((arg1 t) (arg2 t))
	((simp ,op arg1))
	((simp ,op arg1 arg2))))
    ((and (or (equal nargs 2) (equal nargs 'n)) (null min1arg)) 
     `(defmeth2 ,op ((arg1 t) (arg2 t)) (simp (arg1 arg2)))
    (t (error "Invalid arguments."))))

(defmacro defsymops ()
  `(progn
     ,@(loop for op in *ops*
	  collect `(defsymmeth ,@op))))




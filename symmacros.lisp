(in-package :bld-gensym)

(defmacro defsymmeth (op nargs &optional min1arg)
  (cond
    ((equal op '/) nil)
    ((equal nargs 1) `(defmethod ,op ((arg t)) (simp-socket (list ',op arg))))
    ((and (or (equal nargs 2) (equal nargs 'bld-gen::n)) min1arg)
     `(defmeth12 ,op ((arg1 t) (arg2 t))
	((simp-socket (list ',op arg1)))
	((simp-socket (list ',op arg1 arg2)))))
    ((and (equal nargs 2) (null min1arg))
     `(defmethod ,op ((arg1 t) (arg2 t)) (simp-socket (list ',op arg1 arg2))))
    ((and (equal nargs 'bld-gen::n) (null min1arg))
     `(defmeth2 ,op ((arg1 t) (arg2 t)) (simp-socket (list ',op arg1 arg2))))
    (t (error "Invalid arguments."))))

(defmacro defsymops ()
  `(progn
     ,@(loop for op in *ops*
	  collect `(defsymmeth ,@op))))

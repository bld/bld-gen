(in-package :bld-gensym)

(defmacro defsymmeth (op nargs &optional min1arg)
  "Define symbolic method given operator, number of args, and -
optionally - specify with T or NIL whether the method has a minimum of
1 arg. E.g. for (- a)."
  (cond
    ;; Handle division a little differentlyDon't define symbolic method for division: already handled by bld-gen
    ((equal op '/) nil)
    ;; Single argument
    ((equal nargs 1) `(defmethod ,op ((arg t)) (simp (list ',op arg))))
    ;; 1, 2, or more arguments
    ((and (or (equal nargs 2) (equal nargs 'bld-gen::n)) min1arg)
     `(defmeth12 ,op ((arg1 t) (arg2 t))
	((simp (list ',op arg1)))
	((simp (list ',op arg1 arg2)))))
    ;; 2 arguments
    ((and (equal nargs 2) (null min1arg))
     `(defmethod ,op ((arg1 t) (arg2 t)) (simp (list ',op arg1 arg2))))
    ;; 2 or more arguments
    ((and (equal nargs 'bld-gen::n) (null min1arg))
     `(defmeth2 ,op ((arg1 t) (arg2 t)) (simp (list ',op arg1 arg2))))
    (t (error "Invalid arguments."))))

(defmacro defsymops ()
  "Define all symbolic operations from *ops* table"
  `(progn
     ,@(loop for op in *ops*
	  collect `(defsymmeth ,@op))))

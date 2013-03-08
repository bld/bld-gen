(in-package :bld-gensym)

(defun simp (expr)
  "Simplify lisp arithmetic expression using updated table with symbols in BLD-GENSYM"
  (let ((bld-maxima::*maxima-lisp-table-intern* *maxima-lisp-table-gensym*))
    (bld-maxima:simp expr)))

(defsymops)

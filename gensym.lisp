(in-package :bld-gensym)

(defun simp (expr)
  "Simplify lisp arithmetic expression using updated table with symbols in BLD-GENSYM"
  (let ((bld-maxima::*maxima-lisp-table-intern* *maxima-lisp-table-gensym*))
    (bld-maxima:simp expr)))

(defun simp-exprs (&rest exprs)
  (let ((bld-maxima::*maxima-lisp-table-intern* *maxima-lisp-table-gensym*))
    (apply #'bld-maxima:simp-exprs exprs)))

(defsymops)

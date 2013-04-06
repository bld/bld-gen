(in-package :bld-gensym)

(defun simp (expr)
  "Simplify lisp arithmetic expression using updated table with symbols in BLD-GENSYM"
  (let ((bld-maxima::*maxima-lisp-table-intern* *maxima-lisp-table-gensym*))
    (bld-maxima:simp expr)))

(defun simp-exprs (&rest exprs)
  "Simplify lisp arithmetic expressions using updated table with symbols in BLD-GENSYM"
  (let ((bld-maxima::*maxima-lisp-table-intern* *maxima-lisp-table-gensym*))
    (apply #'bld-maxima:simp-exprs exprs)))

(defsymops)

;;; Define division methods on rational numbers

(defmethod bld-gen::one/ ((arg rational))
  (simp (list 'expt arg -1)))

(defmethod bld-gen::two/ ((arg1 rational) (arg2 rational))
  (simp (list '/ arg1 arg2)))




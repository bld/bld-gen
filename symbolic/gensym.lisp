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

;;; Atan

(defmethod bld-gen::oneatan ((arg t))
  (simp (list 'atan arg)))

(defmethod bld-gen::oneatan ((arg rational))
  (simp (list 'atan arg)))

(defmethod bld-gen::twoatan ((arg1 t) (arg2 t))
  (simp (list 'atan2 arg1 arg2)))

(defmethod bld-gen::twoatan ((arg1 t) (arg2 rational))
  (simp (list 'atan2 arg1 arg2)))

(defmethod bld-gen::twoatan ((arg1 rational) (arg2 t))
  (simp (list 'atan2 arg1 arg2)))

(defmethod bld-gen::twoatan ((arg1 rational) (arg2 rational))
  (simp (list 'atan2 arg1 arg2)))

;;; Log

(defmethod bld-gen::onelog ((arg t))
  (simp (list 'log arg)))

(defmethod bld-gen::onelog ((arg rational))
  (simp (list 'log arg)))

(defmethod bld-gen::twolog ((num t)(base t))
  (/ (log num)
     (log base)))

(defmethod bld-gen::twolog ((num rational)(base t))
  (/ (log num)
     (log base)))

(defmethod bld-gen::twolog ((num t)(base rational))
  (/ (log num)
     (log base)))

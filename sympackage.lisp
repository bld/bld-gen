;; Symbolic generic arithmetic
;; Following the example of Fateman

(defpackage :bld-gensym
  (:use cl bld-gen)
  (:import-from bld-gen defmeth1 defmeth2 defmeth12 *ops*)
  (:shadowing-import-from bld-gen
			  + - * / expt
			  sin cos tan
			  atan asin acos
			  sinh cosh tanh 
			  asinh acosh atanh
			  log exp sqrt abs
			  min max signum))

(in-package :bld-gensym)

(defparameter *maxima-lisp-table-gensym*
  (loop for (m l) in bld-maxima::*maxima-lisp-table-intern*
     collect (list m (intern (format nil "~a" l) :bld-gensym))))

(in-package :bld-gensym)

(defsymops)

;; Maxima doesn't interpret / function the same as lisp
;; redefine ONE/ & TWO/ to work correctly using EXPT
(defmethod bld-gen::one/ ((arg1 t))
  (simp (list 'cl:/ arg1)))
(defmethod bld-gen::two/ ((arg1 t) (arg2 t))
  (simp (list 'cl:/ arg1 arg2)))

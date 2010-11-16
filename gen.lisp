;; Generic arithmetic
;; Following the example of Fateman

(in-package :bld-gen)

(defarithn +)
(defarithn - t)
(defarithn / t)
(defarithn *)
(defarithn max t)
(defarithn min t)

(defarith2 expt)

;; Maxima doesn't interpret / function the same as lisp
;; redefine ONE/ & TWO/ to work correctly using EXPT
(defmethod one/ (arg1)
  (expt arg1 -1))
(defmethod two/ (arg1 arg2)
  (* arg1 (expt arg2 -1)))

(defarith1 abs)
(defarith1 sin)
(defarith1 cos)
(defarith1 tan)
(defarith1 exp)
(defarith1 sqrt)
(defarith1 sinh)
(defarith1 tanh)
(defarith1 cosh)
(defarith1 signum)

(defarith2opt atan)
(defarith2opt log)

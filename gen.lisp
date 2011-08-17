;; Generic arithmetic
;; Following the example of Fateman

(in-package :bld-gen)

;; Define ops in the *OPS* parameter
(defops)

;; Maxima doesn't interpret / function the same as lisp
;; redefine ONE/ & TWO/ to work correctly using EXPT
(defmethod one/ (arg1)
  (expt arg1 -1))
(defmethod two/ (arg1 arg2)
  (* arg1 (expt arg2 -1)))


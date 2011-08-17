;; Generic arithmetic
;; Following the example of Fateman

(in-package :bld-gen)

(defarith + n)
(defarith - n t)
(defarith / n t)
(defarith * n)
(defarith expt 2)
(defarith abs 1)
(defarith sin 1)
(defarith cos 1)
(defarith tan 1)
(defarith asin 1)
(defarith acos 1)
(defarith atan 2 t)
(defarith sinh 1)
(defarith cosh 1)
(defarith tanh 1)
(defarith asinh 1)
(defarith acosh 1)
(defarith atanh 1)
(defarith log 2 t)
(defarith exp 1)
(defarith sqrt 1)
(defarith max n t)
(defarith min n t)
(defarith signum 1)


;; Maxima doesn't interpret / function the same as lisp
;; redefine ONE/ & TWO/ to work correctly using EXPT
(defmethod one/ (arg1)
  (expt arg1 -1))
(defmethod two/ (arg1 arg2)
  (* arg1 (expt arg2 -1)))


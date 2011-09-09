;; Generic arithmetic
;; Following the example of Fateman

(defpackage :bld-gen
  (:use cl)
  (:shadow + - * / expt
	   sin cos tan
	   atan asin acos
	   sinh cosh tanh 
	   asinh acosh atanh
	   log exp sqrt abs
	   min max signum)
  (:export + - * / expt
	   sin cos tan
	   atan asin acos
	   sinh cosh tanh 
	   asinh acosh atanh
	   log exp sqrt abs
	   min max signum
	   defmeth2
	   defmeth1
	   defmeth12
	   *ops*))

(in-package :bld-gen)

(defparameter *ops*
  '((+ n)
    (- n t)
    (/ n t)
    (* n)
    (expt 2)
    (abs 1)
    (sin 1)
    (cos 1)
    (tan 1)
    (asin 1)
    (acos 1)
    (atan 2 t)
    (sinh 1)
    (cosh 1)
    (tanh 1)
    (asinh 1)
    (acosh 1)
    (atanh 1)
    (log 2 t)
    (exp 1)
    (sqrt 1)
    (max n t)
    (min n t)
    (signum 1)))

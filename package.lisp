;; Generic arithmetic
;; Following the example of Fateman

(defpackage :bld-gen
  (:use cl)
  (:import-from bld-maxima simp delay)
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
	   min max signum))


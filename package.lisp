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

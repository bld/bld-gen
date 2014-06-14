;; Symbolic generic arithmetic
;; Following the example of Fateman

(defpackage :bld-gensym
  (:use cl bld-gen)
  (:import-from bld-maxima simp-socket with-maxima delay)
  (:import-from bld-gen defmeth1 defmeth2 defmeth12 *ops*)
  (:shadowing-import-from bld-gen
			  + - * / expt
			  sin cos tan
			  atan asin acos
			  sinh cosh tanh 
			  asinh acosh atanh
			  log exp sqrt abs
			  min max signum)
  (:export with-maxima delay))

(in-package :bld-gensym)

(defparameter *maxima-lisp-gen-table*
  (loop for (m l) in bld-maxima::*maxima-lisp-table*
     collect (list (intern (symbol-name m)) (intern (symbol-name l)))))

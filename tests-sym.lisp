(defpackage :bld-gensym-tests
  (:use :cl :5am :bld-gensym)
  (:shadowing-import-from :bld-gen
			  + - * / expt
			  sin cos tan
			  atan asin acos
			  sinh cosh tanh
			  asinh acosh atanh
			  log exp sqrt abs
			  min max signum))

(in-package :bld-gensym-tests)

(defun almost= (a b &optional (tol 1d-6))
  "Two numbers are almost equal to the specified tolerance"
  (< (abs (- a b)) tol))

(def-suite :bld-gensym)

(in-suite :bld-gensym)

(test +
  (is (equal (+ 'a 'a) '(* 2 a)))
  (is (equal (+ 'a 0) 'a))
  (is (equal (+ 'a 'b) '(+ a b)))
  (is (equal (+ 'b 'a) '(+ a b)))
  (is (equal (+ '(foo bar) '(foo bar)) '(* 2 (foo bar)))))

(test -
  (is (= (- 'a 'a) 0))
  (is (equal (- 'a) '(* -1 a)))
  (is (= (- '(foo bar) '(foo bar)) 0)))

(test *
  (is (= (* 'a 0) 0))
  (is (equal (* 'a 1) 'a))
  (is (equal (* 'a 'a) '(expt a 2)))
  (is (equal (* 'a 'b) '(* a b)))
  (is (equal (* '(foo bar) '(foo bar)) '(expt (foo bar) 2))))

(test /
  (is (= (/ 'a 'a) 1))
  (is (equal (/ 'a 1) 'a))
  (is (equal (/ (/ 'a)) 'a)))

(test expt
  (is (equal (expt 'a 2) '(expt a 2)))
  (is (= (expt 'a 0) 1))
  (is (equal (expt 'a 1) 'a)))

(test sin
  (is (= (sin %pi) 0))
  (is (= (sin (* 2 %pi)) 0))
  (is (equal (sin 'a) '(sin a))))

(test cos
  (is (= (cos %pi) -1))
  (is (= (cos (* 2 %pi)) 1))
  (is (equal (cos 'a) '(cos a))))

(test tan
  (is (equal (tan 'a) '(tan a)))
  (is (= (tan %pi) 0)))

;;; Updated to here

(test atan
)

(test asin
)

(test acos
)

(test sinh
)

(test cosh
)

(test tanh
)

(test asinh
)

(test acosh
)

(test atanh
)

(test log
)

(test exp
)

(test sqrt
)

(test abs
)

(test min
)

(test max
)

(test signum
)

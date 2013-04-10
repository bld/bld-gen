(defpackage :bld-gensym-tests
  (:shadowing-import-from :bld-gen
			  + - * / expt
			  sin cos tan
			  atan asin acos
			  sinh cosh tanh
			  asinh acosh atanh
			  log exp sqrt abs
			  min max signum)
  (:use :cl :5am :bld-gensym))

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
  (is (equal (/ (/ 'a)) 'a))
  (is (equal (/ 1 2) '(/ 1 2)))
  (is (equal (/ 2) '(/ 1 2))))

(test expt
  (is (equal (expt 'a 2) '(expt a 2)))
  (is (= (expt 'a 0) 1))
  (is (equal (expt 'a 1) 'a))
  (is (equal (expt 2 -1) '(/ 1 2))))

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

(test atan
 (is (equal (atan 1) (/ %pi 4)))
 (is (equal (atan (sqrt 3)) (/ %pi 3))))

(test asin
  (is (equal (asin (/ (sqrt 3) 2)) (/ %pi 3)))
  (is (equal (asin (/ 1 2)) (/ %pi 6)))
  (is (equal (asin (/ (sqrt 2) 2)) (/ %pi 4))))

(test acos
  (is (equal (acos (/ (sqrt 3) 2)) (/ %pi 6)))
  (is (equal (acos (/ 1 2)) (/ %pi 3)))
  (is (equal (acos (/ (sqrt 2) 2)) (/ %pi 4))))

;; Suggestions for hyperbolic?
(test sinh
  (is (equal (sinh 'a) '(sinh a)))
  (is (equal (sinh 0) 0)))

(test cosh
  (is (equal (cosh 'a) '(cosh a)))
  (is (equal (cosh 0) 1)))

(test tanh
  (is (equal (tanh 'a) '(tanh a)))
  (is (equal (tanh 0) 0)))

(test asinh
  (is (equal (asinh 'a) '(asinh a))))

(test acosh
  (is (equal (acosh 'a) '(acosh a))))

(test atanh
  (is (equal (atanh 'a) '(atanh a))))

(test log
  (is (equal (log 'a) '(log a)))
  (is (equal (log (exp 'a)) 'a))
  (is (equal (log (expt %e 2)) 2))
  (is (equal (log (sqrt %e)) (/ 1 2))))

(test exp
  (is (equal (exp 0) 1))
  (is (equal (exp 1) %e))
  (is (equal (exp 2) `(expt ,%e 2))))

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

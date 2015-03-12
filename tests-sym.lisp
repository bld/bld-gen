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
  (is (= (sin '$%pi) 0))
  (is (= (sin (* 2 '$%pi)) 0))
  (is (equal (sin 'a) '(sin a))))

(test cos
  (is (= (cos '$%pi) -1))
  (is (= (cos (* 2 '$%pi)) 1))
  (is (equal (cos 'a) '(cos a))))

(test tan
  (is (equal (tan 'a) '(tan a)))
  (is (= (tan '$%pi) 0)))

(test atan
  (is (= (atan 0) (identity (cl:atan 0))))
  (is (= (atan 1) (identity (cl:atan 1))))
  (is (= (atan 10) (identity (cl:atan 10)))))

(test asin
  (is (= (asin 0) (cl:asin 0)))
  (is (= (asin 1) (cl:asin 1)))
  (is (= (asin (/ (sqrt 2) 2)) (cl:asin (/ (sqrt 2) 2)))))

(test acos
  (is (= (acos 0) (cl:acos 0)))
  (is (= (acos 1) (cl:acos 1)))
  (is (= (acos (/ (sqrt 2) 2)) (cl:acos (/ (sqrt 2) 2)))))

(test sinh
  (is (= (sinh 0d0) (cl:sinh 0d0)))
  (is (= (sinh 1d0) (cl:sinh 1d0)))
  (is (= (sinh 10d0) (cl:sinh 10d0))))

(test cosh
  (is (= (cosh 0d0) (cl:cosh 0d0)))
  (is (= (cosh 1d0) (cl:cosh 1d0)))
  (is (= (cosh 10d0) (cl:cosh 10d0))))

(test tanh
  (is (= (tanh 0d0) (cl:tanh 0d0)))
  (is (= (tanh 1d0) (cl:tanh 1d0)))
  (is (= (tanh 10d0) (cl:tanh 10d0))))

(test asinh
  (is (= (asinh 0d0) (cl:asinh 0d0)))
  (is (= (asinh 1d0) (cl:asinh 1d0)))
  (is (= (asinh 10d0) (cl:asinh 10d0))))

(test acosh
  (is (= (acosh 0d0) (cl:acosh 0d0)))
  (is (= (acosh 1d0) (cl:acosh 1d0)))
  (is (= (acosh 10d0) (cl:acosh 10d0))))


(test atanh
  (is (= (atanh 0d0) (cl:atanh 0d0)))
  (is (= (atanh 0.5d0) (cl:atanh 0.5d0)))
  (is (= (atanh 10d0) (cl:atanh 10d0))))

(test log
  (is (= (log 1) (cl:log 1)))
  (is (= (log (cl:exp 1d0)) (cl:log (cl:exp 1d0)))))

(test exp
  (is (= (exp 0d0) (cl:exp 0d0)))
  (is (= (exp 1d0) (cl:exp 1d0))))

(test sqrt
  (is (= (sqrt 0d0) (cl:sqrt 0d0)))
  (is (= (sqrt 1d0) (cl:sqrt 1d0)))
  (is (= (sqrt -1d0) (cl:sqrt -1d0))))

(test abs
  (is (= (abs 0d0) (cl:abs 0d0)))
  (is (= (abs 1d0) (cl:abs 1d0)))
  (is (= (abs -1d0) (cl:abs 1d0)))
  (is (= (abs #C(1d0 2d0)) (cl:abs #C(1d0 2d0)))))

(test min
  (is (= (min 1 2 3 -10 4 5) -10)))

(test max
  (is (= (max 1 2 6 3 4 5) 6)))

(test signum
  (is (= (signum 0) (cl:signum 0)))
  (is (= (signum 0d0) (cl:signum 0d0)))
  (is (= (signum 2) (cl:signum 1)))
  (is (= (signum 2d0) (cl:signum 1d0))))


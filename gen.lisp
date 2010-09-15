;; Generic arithmetic
;; Following the example of Fateman

(in-package :bld-gen)

(defarithn +)
(defarithn - t)
(defarithn *)
(defarithn / t)
(defarithn max t)
(defarithn min t)

(defarith2 expt)

(defarith1 abs)
(defarith1 sin)
(defarith1 cos)
(defarith1 tan)
(defarith1 exp)
(defarith1 sqrt)
(defarith1 sinh)
(defarith1 tanh)
(defarith1 cosh)
(defarith1 signum)

(defarith2opt atan)
(defarith2opt log)

BLD's Generic Arithmetic Library
================================

Generic arithmetic library, following the example of [Dr. Richard
Fateman's "Building Algebra Systems by Overloading Lisp: Automatic
Differentiation"](http://www.cs.berkeley.edu/~fateman/papers/overload-AD.pdf).
Shadows the native arithmetic functions and re-defines them as generic
functions. Methods are then defined for numeric arguments to call the
CL package functions. Methods can be defined for whatever classes you
wish (e.g. symbols, vectors, matrices).

To use the generic arithmetic functions in this package, you need to
shadow out the native functions and import the corresponding generic
functions you want to use. For example, in a symbolic algebra package
you might define:

    (defpackage :my-package
      (:use :common-lisp)
      (:shadowing-import-from :bld-gen
        + - * / expt
        sin cos tan
        atan asin acos
        sinh cosh tanh
        asinh acosh atanh
        log exp sqrt abs
        min max signum))

Then, you can use DEFMETHOD to overload them with the definitions you
want. 

Symbolic Simplification with BLD-SYMBOLIC
-----------------------------------------

Implementation of symbolic simplification using MAXIMA as a backend
has been moved to the BLD-SYMBOLIC repository.

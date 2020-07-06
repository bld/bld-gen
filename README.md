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

Defining Methods
----------------

Three macros allow overloading arithmetic operations (generic
functions). They do not need to be in the list of those included in
this package, so that a custom algebra with any other function names
can be defined.

### DEFMETH1

Defines method on an operator that only takes a single argument,
e.g. abs, sin/cos/tan, exp, signum

#### Usage

    (defmeth1 operator ((argument type)) body)

#### Example
Define absolute value over elements of a list:

    (defmeth1 abs ((l list)) (mapcar #'abs l))

### DEFMETH2

Defines method on an operator that takes only two arguments, e.g. expt

#### Usage

    (defmeth2 operator ((argument type) (n integer)) body)

### DEFMETH12

Defines methods for an operator that takes one or two arguments,
e.g. atan and log. Also used to define methods for functions of one or
any number of arguments, e.g. +, -, /, *, max, and min.

#### Usage

    (defmeth12 operator ((argument1 type1) (argument2 type2))
        (body1)  ; Method body for one-argument method
        (body2)) ; Method body for two-argument method

#### Example

Define '-' methods for vectors:

    (defmeth12 - ((a vector) (b vector))
        ((map 'vector #'- a))
        ((map 'vector #'- a b)))

Symbolic Simplification with BLD-SYMBOLIC
-----------------------------------------

Implementation of symbolic simplification using MAXIMA as a backend
has been moved to the BLD-SYMBOLIC repository.

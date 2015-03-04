(asdf:defsystem :bld-gen
    :name "bld-gen"
    :author "Benjamin L. Diedrich <ben@solarsails.info>"
    :license "MIT"
    :description "Generic function based arithmetic. Shadows arithmetic functions from package CL and redefines them as generic functions. Default behavior preserved by defining methods on numeric arguments to call the original CL functions. Follows Fateman's example from \"Building Algebra Systems by Overloading Lisp: Automatic Differentiation (2006)\": http://www.cs.berkeley.edu/~fateman/generic/overload-AD.pdf"
    :serial t
    :components 
    ((:file "package")
     (:file "ops")
     (:file "macros")
     (:file "gen")))

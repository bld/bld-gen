(asdf:defsystem :bld-gensym
    :author "Benjamin L. Diedrich <ben@solarsails.info>"
    :license "LLGPL"
    :description "Generic function arithmetic with symbolic evaluation of symbols using Maxima"
    :serial t
    :components ((:file "package")
		 (:file "macros")
		 (:file "gensym"))
    :depends-on ("bld-gen" "bld-maxima"))

(asdf:defsystem :bld-gensym
    :author "Benjamin L. Diedrich <ben@solarsails.info>"
    :license "MIT"
    :description "Generic function arithmetic with symbolic evaluation of symbols using Maxima"
    :components ((:file "sympackage")
		 (:file "symmacros" :depends-on ("sympackage"))
		 (:file "gensym" :depends-on ("symmacros")))
    :depends-on ("bld-gen" "bld-maxima"))

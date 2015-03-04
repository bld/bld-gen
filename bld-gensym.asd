(asdf:defsystem :bld-gensym
    :author "Benjamin L. Diedrich <ben@solarsails.info>"
    :license "MIT"
    :description "Generic function arithmetic with symbolic evaluation of symbols using Maxima"
    :serial t
    :components ((:file "sympackage")
		 (:file "symmacros")
		 (:file "gensym"))
    :depends-on ("bld-gen" "bld-maxima"))

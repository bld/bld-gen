(asdf:defsystem :bld-gensym
    :author "Benjamin L. Diedrich <ben@solarsails.info>"
    :license "LLGPL"
    :description "Generic function arithmetic with symbolic evaluation of symbols using Maxima"
    :components ((:file "symmacros")
		 (:file "gensym" :depends-on ("symmacros")))
    :depends-on ("bld-gen" "bld-maxima"))

(asdf:defsystem :bld-gensym-tests
  :components ((:file "tests-sym"))
  :depends-on (:bld-gen :bld-gensym :FiveAM))

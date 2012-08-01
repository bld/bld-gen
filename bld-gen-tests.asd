(asdf:defsystem :bld-gen-tests
  :components ((:file "tests"))
  :depends-on (:bld-gen :FiveAM))

(asdf:defsystem :bld-gen
    :name "bld-gen"
    :author "Benjamin L. Diedrich <ben@solarsails.info>"
    :version "0.0.1"
    :maintainer "Benjamin L. Diedrich <ben@solarsails.info>"
    :license "MIT"
    :description "Generic function based arithmetic following the example of Fateman, including symbolic arithmetic using Maxima as back-end"
    :components 
    ((:file "package")
     (:file "macros" :depends-on ("package"))
     (:file "gen" :depends-on ("package" "macros")))
    :depends-on ("bld-maxima"))

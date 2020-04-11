(defsystem :rp-parser
  :depends-on (:rephrase2)
  :around-compile (lambda (next)
                    (proclaim '(optimize (debug 3)
                                         (safety 3)
                                         (speed 0)))
                    (funcall next))
  :components ((:module "source"
                        :pathname "./"
                        :components ((:file "package")
                                     (:file "rp-parse" :depends-on ("package"))
                                     (:file "mechanisms" :depends-on ("package" "rp-parse"))
                                     (:file "unexported-mechanisms" :depends-on ("package" "rp-parse"))
                                     (:file "parse" :depends-on ("package" "rp-parse"))
                                     (:file "parser" :depends-on ("package" "rp-parse"
									    "mechanisms" "unexported-mechanisms"))
                                     (:file "test" :depends-on ("package" "rp-parse" 
								"mechanisms" "unexported-mechanisms"
								"parse"
								"parser"))
				     ))))


(defpackage :rp-parser
  (:use :cl :rephrase)
  (:nicknames "RPA")
  (:export
   #:parser
   #:output-string-stream
   #:parse
   #:scan-and-parse

   #:initially
   #:lookahead-char?
   #:lookahead-symbol?
   #:lookahead?
   #:input-char
   #:input-symbol
   #:input
   #:emit-string
   #:parser-success?
   #:+succeed+
   #:+fail+
   #:next-token
   #:accepted-token
   #:call-rule
   #:call-predicate
   #:call-external
   #:accept

   #:token-stream
   #:output-string-stream
   #:next-token
   #:accepted-token))
   

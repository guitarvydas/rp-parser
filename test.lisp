(in-package :rp-parser)

;; the test *test-string* produces gibberish Lisp, and is
;; only used to view the emission for each kind of RPA
;; operation (see READING.txt)
(defparameter *test-string*
"
% test rp DSL

= junk-rule
  'a'
  ?'a'
  AAA
  ?BBB
  CCC/ddd
  ?EEE/fff
  @rule
  &pred
  external-call
  {[ &pred @rule
   | &pred @rule
   | * >
  ]}
  
= delete-whitespace
  [ ?SPACE % if lookahead is a space
    SPACE  % accept it and don't emit anything
  | * accept-and-emit-token
]
")

;; mini-test ... (total nonsense in meaning, but legal syntax)
(defparameter *str* "= junk-rule CCC/ddd")

(defun test ()
  (let ((p (make-instance 'parser)))
    (let ((scanned (rephrase:scanner *test-string*)))
      (rp-parser:parse p scanned)
      (cl:get-output-stream-string (rpa:output-string-stream p)))))

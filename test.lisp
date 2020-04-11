(in-package :rp-parser)

(defparameter *test-string*
"
% test rp DSL

= junk-rule
'a'
?'a'
AAA
?BBB
CCC/ccc
?DDD/ddd
@rule
&pred
external-call
{[ &pred @rule
 | &pred @rule
 | * >
]}

= delete-whitespace
  [ ?SPACE % if lookahead is a space
    SPACE  % acdept it and don't emit anything
  | * accept-and-emit-token
]
")

(defparameter *str* "= junk-rul CCC/ddd")

(defun test ()
  (let ((p (make-instance 'parser)))
    (let ((scanned (rephrase:scanner *str*)))
      (parse p scanned)
      :done)))

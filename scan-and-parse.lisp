(in-package :rp-parser)

(defun scan-and-parse (str)
  (let ((p (make-instance 'parser)))
    (let ((scanned (rephrase:scanner str)))
      (rp-parser:parse p scanned)
      (cl:get-output-stream-string (rpa:output-string-stream p)))))

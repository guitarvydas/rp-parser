(in-package :rp-parser)

(defmethod input-upcase-symbol ((p parser))
  (let ((tok (next-token p)))
    (if (and (eq :symbol (token-kind tok))
	     (all-upcase? (token-text tok)))
       (accept p)
      (rp-parse-error p "expected upcase symbol"))))

(defmethod look-upcase-symbol? ((p parser))
  (let ((tok (next-token p)))
    (if (and (eq :symbol (token-kind tok))
	     (all-upcase? (token-text tok)))
	rpa:+succeed+
      rpa:+fail+)))

(defun all-upcase? (str)
  (string= str (string-upcase str)))

(defmethod lookahead-any-char? ((self parser))
  (let ((tok (rpa:next-token self)))
    (if (or
	 (eq :character (rephrase:token-kind tok))
	 (and (eq :symbol (rephrase:token-kind tok))
	      (= 1 (length (rephrase:token-text tok)))))
       rpa:+succeed+
      rpa:+fail+)))

(defmethod input-any-character ((p parser))
  (if (eq rpa:+succeed+ (lookahead-any-char? p))
      (accept p)
     (rp-parse-error p (format nil "expected any character (or a symbol of length 1)"))))

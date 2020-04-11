(in-package :rp-parser)

(defconstant +succeed+ :success)
(defconstant +fail+ nil)

(defun parser-success? (x)
  (eq x +succeed+))

(defclass parser (rephrase:rephrase) 
  ((token-stream :accessor token-stream :initarg :token-stream :initform nil) ;; actually, just a list
   (output-string-stream :accessor output-string-stream :initarg :output-stream 
			 :initform (make-string-output-stream))
   (next-token :accessor next-token :initform nil)
   (accepted-token :accessor accepted-token :initform nil)
   (state :accessor state :initform :idle)
   (current-rule :accessor current-rule :initform nil)
   ))

;; a parser must support:

(defgeneric initially (self token-stream))

(defgeneric accept (self))
(defgeneric rpa-error (self message))

(defgeneric input-char (self c))

(defgeneric emit-string (self str &rest args))

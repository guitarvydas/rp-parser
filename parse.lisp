(in-package :rp-parser)

(defmethod parse ((self parser) token-stream)
  (initially self token-stream)
  (<rp> self))

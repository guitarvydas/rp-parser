(in-package :rp-parser)

(defmethod parse ((self parser) token-stream)
  (rpa:initially self token-stream)
  (rp-parser::<rp> self))

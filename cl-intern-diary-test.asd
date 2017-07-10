#|
  This file is a part of cl-intern-diary project.
|#

(in-package :cl-user)
(defpackage cl-intern-diary-test-asd
  (:use :cl :asdf))
(in-package :cl-intern-diary-test-asd)

(defsystem cl-intern-diary-test
  :author ""
  :license ""
  :depends-on (:cl-intern-diary
               :prove)
  :components ((:module "t"
                :components
                ((:test-file "cl-intern-diary"))))
  :description "Test system for cl-intern-diary"

  :defsystem-depends-on (:prove-asdf)
  :perform (test-op :after (op c)
                    (funcall (intern #.(string :run-test-system) :prove-asdf) c)
                    (asdf:clear-system c)))

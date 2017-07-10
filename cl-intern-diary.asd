#|
  This file is a part of cl-intern-diary project.
|#

(in-package :cl-user)
(defpackage cl-intern-diary-asd
  (:use :cl :asdf))
(in-package :cl-intern-diary-asd)

(defsystem cl-intern-diary
  :version "0.1"
  :author ""
  :license ""
  :depends-on (:cl-dbi)
  :components ((:module "src"
                :components
                ((:file "cl-intern-diary"))))
  :description ""
  :long-description
  #.(with-open-file (stream (merge-pathnames
                             #p"README.markdown"
                             (or *load-pathname* *compile-file-pathname*))
                            :if-does-not-exist nil
                            :direction :input)
      (when stream
        (let ((seq (make-array (file-length stream)
                               :element-type 'character
                               :fill-pointer t)))
          (setf (fill-pointer seq) (read-sequence seq stream))
          seq)))
  :in-order-to ((test-op (test-op cl-intern-diary-test))))

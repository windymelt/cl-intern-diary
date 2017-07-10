(in-package :cl-user)
(defpackage cl-intern-diary
  (:use :cl)
  (:export :hello))
(in-package :cl-intern-diary)

(defun hello () (print "Hello, World!"))

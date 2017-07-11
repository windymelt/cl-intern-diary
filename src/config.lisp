(in-package :cl-intern-diary)
(defpackage :config
  (:use :cl)
  (:export
   :config-property
   :cl-intern-diary-config))
(in-package :config)

(defparameter *configuration-file-path* (merge-pathnames *default-pathname-defaults* #p"config.txt"))

(defstruct cl-intern-diary-config
  (:db-type :mysql)
  (:db-name "cl-intern-diary")
  (:db-host "localhost")
  (:db-username "nobody")
  (:db-password "nobody"))

(defun serialize-config (config)
  `(:db-type ,(cl-intern-diary-config-db-type config)
    :db-name ,(cl-intern-diary-config-db-name config)
    :db-host ,(cl-intern-diary-config-db-host config)
    :db-username ,(cl-intern-diary-config-db-username config)
    :db-password ,(cl-intern-diary-config-db-password config)))

(defun config-property (key)
  (with-open-file (in *configuration-file-path*)
    (defvar config-content (read in))
    (unless (cl-intern-diary-config-p config-content)
      (error "invalid config file."))
    (getf (serialize-config config-content) key)))

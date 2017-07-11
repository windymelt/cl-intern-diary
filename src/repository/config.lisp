(in-package :cl-intern-diary)
(defpackage config
  (use :cl)
  (export :config-property))
(in-package :config)

(defconstant +configuration-file-path+ #p"config.txt")

(defstruct cl-intern-diary-config
  (:db-type :mysql)
  (:db-name "cl-intern-diary")
  (:db-host "localhost")
  (:db-username "nobody")
  (:db-password "nobody"))

(defmacro config-property (key)
  `(with-open-file (in +configuration-file-path+)
    (defvar config-content (read in))
    (unless (cl-intern-diary-config-p config-content)
      (error "invalid config file."))
     (,(intern (format nil "CL-INTERN-DIARY-CONFIG-~a" (symbol-name key))) config-content)))

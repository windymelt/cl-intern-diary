(in-package :cl-intern-diary)
(defpackage context
  (use :cl :cl-dbi)
  (export :with-context))
(in-package :context)

                                        ;TODO: configure
(defconstant *dbname* "cl-intern-diary")
(defconstant *dbusername* "nobody")
(defconstant *dbpass* "nobody")

(defun with-context (body)
  (dbi:with-connection
      (conn :mysql
            :host "127.0.0.1"
            :database-name *dbname*
            :username *dbusername*
            :password *dbpass*)
    (body conn)))

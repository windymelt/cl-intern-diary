(in-package :cl-intern-diary)
(defpackage :cl-intern-diary.context
  (:use :cl :cl-dbi :config)
  (:export :with-context))
(in-package :cl-intern-diary.context)

(defparameter *db-connection* nil)

(defmacro with-context (body)
  `(dbi:with-connection
       (conn (config:config-property :db-type)
             :host (config:config-property :db-host)
             :database-name (config:config-property :db-name)
             :username (config:config-property :db-username)
             :password (config:config-property :db-password))
     (defparameter *db-connection* conn)
     ,body))

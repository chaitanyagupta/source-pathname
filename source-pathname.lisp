;;;; source-pathname.lisp

(defpackage #:source-pathname
  (:use #:cl)
  (:export #:source-pathname #:source-truename #:source-directory))

(in-package #:source-pathname)

(defmacro source-pathname ()
  (let ((compile-file-pathname *compile-file-pathname*))
    `(or ,compile-file-pathname (load-time-value *load-pathname*))))

(defmacro source-truename ()
  (let ((compile-file-truename *compile-file-truename*))
    `(or ,compile-file-truename (load-time-value *load-truename*))))

(defmacro source-directory (&optional pathname)
  (let ((directory (gensym "DIRECTORY-"))
        (pathname-value (gensym "PATHNAME-")))
    `(let ((,directory (make-pathname :defaults (source-truename)
                                      :name nil :type nil))
           (,pathname-value ,pathname))
       (if ,pathname-value
           (merge-pathnames ,pathname-value ,directory)
           ,directory))))


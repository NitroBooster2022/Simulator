
(cl:in-package :asdf)

(defsystem "utils-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "Localization" :depends-on ("_package_Localization"))
    (:file "_package_Localization" :depends-on ("_package"))
    (:file "dotted" :depends-on ("_package_dotted"))
    (:file "_package_dotted" :depends-on ("_package"))
    (:file "get_direction" :depends-on ("_package_get_direction"))
    (:file "_package_get_direction" :depends-on ("_package"))
    (:file "nav" :depends-on ("_package_nav"))
    (:file "_package_nav" :depends-on ("_package"))
  ))
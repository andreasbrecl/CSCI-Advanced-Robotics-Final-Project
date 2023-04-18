
(cl:in-package :asdf)

(defsystem "pololu_maestro_ros-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "set_servo" :depends-on ("_package_set_servo"))
    (:file "_package_set_servo" :depends-on ("_package"))
  ))
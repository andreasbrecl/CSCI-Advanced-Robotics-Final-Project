;; Auto-generated. Do not edit!


(when (boundp 'pololu_maestro_ros::set_servo)
  (if (not (find-package "POLOLU_MAESTRO_ROS"))
    (make-package "POLOLU_MAESTRO_ROS"))
  (shadow 'set_servo (find-package "POLOLU_MAESTRO_ROS")))
(unless (find-package "POLOLU_MAESTRO_ROS::SET_SERVO")
  (make-package "POLOLU_MAESTRO_ROS::SET_SERVO"))
(unless (find-package "POLOLU_MAESTRO_ROS::SET_SERVOREQUEST")
  (make-package "POLOLU_MAESTRO_ROS::SET_SERVOREQUEST"))
(unless (find-package "POLOLU_MAESTRO_ROS::SET_SERVORESPONSE")
  (make-package "POLOLU_MAESTRO_ROS::SET_SERVORESPONSE"))

(in-package "ROS")





(defclass pololu_maestro_ros::set_servoRequest
  :super ros::object
  :slots (_channel _target ))

(defmethod pololu_maestro_ros::set_servoRequest
  (:init
   (&key
    ((:channel __channel) 0)
    ((:target __target) 0)
    )
   (send-super :init)
   (setq _channel (round __channel))
   (setq _target (round __target))
   self)
  (:channel
   (&optional __channel)
   (if __channel (setq _channel __channel)) _channel)
  (:target
   (&optional __target)
   (if __target (setq _target __target)) _target)
  (:serialization-length
   ()
   (+
    ;; uint8 _channel
    1
    ;; uint16 _target
    2
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint8 _channel
       (write-byte _channel s)
     ;; uint16 _target
       (write-word _target s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint8 _channel
     (setq _channel (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint16 _target
     (setq _target (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;;
   self)
  )

(defclass pololu_maestro_ros::set_servoResponse
  :super ros::object
  :slots ())

(defmethod pololu_maestro_ros::set_servoResponse
  (:init
   (&key
    )
   (send-super :init)
   self)
  (:serialization-length
   ()
   (+
    0
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;;
   self)
  )

(defclass pololu_maestro_ros::set_servo
  :super ros::object
  :slots ())

(setf (get pololu_maestro_ros::set_servo :md5sum-) "cacdc30924dce4f90463bf4f4695d124")
(setf (get pololu_maestro_ros::set_servo :datatype-) "pololu_maestro_ros/set_servo")
(setf (get pololu_maestro_ros::set_servo :request) pololu_maestro_ros::set_servoRequest)
(setf (get pololu_maestro_ros::set_servo :response) pololu_maestro_ros::set_servoResponse)

(defmethod pololu_maestro_ros::set_servoRequest
  (:response () (instance pololu_maestro_ros::set_servoResponse :init)))

(setf (get pololu_maestro_ros::set_servoRequest :md5sum-) "cacdc30924dce4f90463bf4f4695d124")
(setf (get pololu_maestro_ros::set_servoRequest :datatype-) "pololu_maestro_ros/set_servoRequest")
(setf (get pololu_maestro_ros::set_servoRequest :definition-)
      "uint8 channel
uint16 target
---


")

(setf (get pololu_maestro_ros::set_servoResponse :md5sum-) "cacdc30924dce4f90463bf4f4695d124")
(setf (get pololu_maestro_ros::set_servoResponse :datatype-) "pololu_maestro_ros/set_servoResponse")
(setf (get pololu_maestro_ros::set_servoResponse :definition-)
      "uint8 channel
uint16 target
---


")



(provide :pololu_maestro_ros/set_servo "cacdc30924dce4f90463bf4f4695d124")



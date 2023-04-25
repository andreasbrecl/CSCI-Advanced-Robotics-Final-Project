;; Auto-generated. Do not edit!


(when (boundp 'pololu_maestro_ros::pwm)
  (if (not (find-package "POLOLU_MAESTRO_ROS"))
    (make-package "POLOLU_MAESTRO_ROS"))
  (shadow 'pwm (find-package "POLOLU_MAESTRO_ROS")))
(unless (find-package "POLOLU_MAESTRO_ROS::PWM")
  (make-package "POLOLU_MAESTRO_ROS::PWM"))

(in-package "ROS")
;;//! \htmlinclude pwm.msg.html


(defclass pololu_maestro_ros::pwm
  :super ros::object
  :slots (_channel _target ))

(defmethod pololu_maestro_ros::pwm
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

(setf (get pololu_maestro_ros::pwm :md5sum-) "cacdc30924dce4f90463bf4f4695d124")
(setf (get pololu_maestro_ros::pwm :datatype-) "pololu_maestro_ros/pwm")
(setf (get pololu_maestro_ros::pwm :definition-)
      "uint8 channel
uint16 target

")



(provide :pololu_maestro_ros/pwm "cacdc30924dce4f90463bf4f4695d124")



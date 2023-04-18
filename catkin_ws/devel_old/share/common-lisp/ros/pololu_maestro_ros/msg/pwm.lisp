; Auto-generated. Do not edit!


(cl:in-package pololu_maestro_ros-msg)


;//! \htmlinclude pwm.msg.html

(cl:defclass <pwm> (roslisp-msg-protocol:ros-message)
  ((channel
    :reader channel
    :initarg :channel
    :type cl:fixnum
    :initform 0)
   (target
    :reader target
    :initarg :target
    :type cl:fixnum
    :initform 0))
)

(cl:defclass pwm (<pwm>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <pwm>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'pwm)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name pololu_maestro_ros-msg:<pwm> is deprecated: use pololu_maestro_ros-msg:pwm instead.")))

(cl:ensure-generic-function 'channel-val :lambda-list '(m))
(cl:defmethod channel-val ((m <pwm>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pololu_maestro_ros-msg:channel-val is deprecated.  Use pololu_maestro_ros-msg:channel instead.")
  (channel m))

(cl:ensure-generic-function 'target-val :lambda-list '(m))
(cl:defmethod target-val ((m <pwm>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pololu_maestro_ros-msg:target-val is deprecated.  Use pololu_maestro_ros-msg:target instead.")
  (target m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <pwm>) ostream)
  "Serializes a message object of type '<pwm>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'channel)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'target)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'target)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <pwm>) istream)
  "Deserializes a message object of type '<pwm>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'channel)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'target)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'target)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<pwm>)))
  "Returns string type for a message object of type '<pwm>"
  "pololu_maestro_ros/pwm")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'pwm)))
  "Returns string type for a message object of type 'pwm"
  "pololu_maestro_ros/pwm")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<pwm>)))
  "Returns md5sum for a message object of type '<pwm>"
  "cacdc30924dce4f90463bf4f4695d124")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'pwm)))
  "Returns md5sum for a message object of type 'pwm"
  "cacdc30924dce4f90463bf4f4695d124")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<pwm>)))
  "Returns full string definition for message of type '<pwm>"
  (cl:format cl:nil "uint8 channel~%uint16 target~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'pwm)))
  "Returns full string definition for message of type 'pwm"
  (cl:format cl:nil "uint8 channel~%uint16 target~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <pwm>))
  (cl:+ 0
     1
     2
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <pwm>))
  "Converts a ROS message object to a list"
  (cl:list 'pwm
    (cl:cons ':channel (channel msg))
    (cl:cons ':target (target msg))
))

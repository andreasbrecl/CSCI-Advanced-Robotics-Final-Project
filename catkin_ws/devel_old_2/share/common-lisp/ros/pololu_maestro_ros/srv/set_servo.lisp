; Auto-generated. Do not edit!


(cl:in-package pololu_maestro_ros-srv)


;//! \htmlinclude set_servo-request.msg.html

(cl:defclass <set_servo-request> (roslisp-msg-protocol:ros-message)
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

(cl:defclass set_servo-request (<set_servo-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <set_servo-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'set_servo-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name pololu_maestro_ros-srv:<set_servo-request> is deprecated: use pololu_maestro_ros-srv:set_servo-request instead.")))

(cl:ensure-generic-function 'channel-val :lambda-list '(m))
(cl:defmethod channel-val ((m <set_servo-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pololu_maestro_ros-srv:channel-val is deprecated.  Use pololu_maestro_ros-srv:channel instead.")
  (channel m))

(cl:ensure-generic-function 'target-val :lambda-list '(m))
(cl:defmethod target-val ((m <set_servo-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pololu_maestro_ros-srv:target-val is deprecated.  Use pololu_maestro_ros-srv:target instead.")
  (target m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <set_servo-request>) ostream)
  "Serializes a message object of type '<set_servo-request>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'channel)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'target)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'target)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <set_servo-request>) istream)
  "Deserializes a message object of type '<set_servo-request>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'channel)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'target)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'target)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<set_servo-request>)))
  "Returns string type for a service object of type '<set_servo-request>"
  "pololu_maestro_ros/set_servoRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'set_servo-request)))
  "Returns string type for a service object of type 'set_servo-request"
  "pololu_maestro_ros/set_servoRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<set_servo-request>)))
  "Returns md5sum for a message object of type '<set_servo-request>"
  "cacdc30924dce4f90463bf4f4695d124")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'set_servo-request)))
  "Returns md5sum for a message object of type 'set_servo-request"
  "cacdc30924dce4f90463bf4f4695d124")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<set_servo-request>)))
  "Returns full string definition for message of type '<set_servo-request>"
  (cl:format cl:nil "uint8 channel~%uint16 target~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'set_servo-request)))
  "Returns full string definition for message of type 'set_servo-request"
  (cl:format cl:nil "uint8 channel~%uint16 target~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <set_servo-request>))
  (cl:+ 0
     1
     2
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <set_servo-request>))
  "Converts a ROS message object to a list"
  (cl:list 'set_servo-request
    (cl:cons ':channel (channel msg))
    (cl:cons ':target (target msg))
))
;//! \htmlinclude set_servo-response.msg.html

(cl:defclass <set_servo-response> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass set_servo-response (<set_servo-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <set_servo-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'set_servo-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name pololu_maestro_ros-srv:<set_servo-response> is deprecated: use pololu_maestro_ros-srv:set_servo-response instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <set_servo-response>) ostream)
  "Serializes a message object of type '<set_servo-response>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <set_servo-response>) istream)
  "Deserializes a message object of type '<set_servo-response>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<set_servo-response>)))
  "Returns string type for a service object of type '<set_servo-response>"
  "pololu_maestro_ros/set_servoResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'set_servo-response)))
  "Returns string type for a service object of type 'set_servo-response"
  "pololu_maestro_ros/set_servoResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<set_servo-response>)))
  "Returns md5sum for a message object of type '<set_servo-response>"
  "cacdc30924dce4f90463bf4f4695d124")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'set_servo-response)))
  "Returns md5sum for a message object of type 'set_servo-response"
  "cacdc30924dce4f90463bf4f4695d124")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<set_servo-response>)))
  "Returns full string definition for message of type '<set_servo-response>"
  (cl:format cl:nil "~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'set_servo-response)))
  "Returns full string definition for message of type 'set_servo-response"
  (cl:format cl:nil "~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <set_servo-response>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <set_servo-response>))
  "Converts a ROS message object to a list"
  (cl:list 'set_servo-response
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'set_servo)))
  'set_servo-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'set_servo)))
  'set_servo-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'set_servo)))
  "Returns string type for a service object of type '<set_servo>"
  "pololu_maestro_ros/set_servo")
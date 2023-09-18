; Auto-generated. Do not edit!


(cl:in-package utils-msg)


;//! \htmlinclude odometry.msg.html

(cl:defclass <odometry> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (odomX
    :reader odomX
    :initarg :odomX
    :type cl:float
    :initform 0.0)
   (odomY
    :reader odomY
    :initarg :odomY
    :type cl:float
    :initform 0.0)
   (odomYaw
    :reader odomYaw
    :initarg :odomYaw
    :type cl:float
    :initform 0.0))
)

(cl:defclass odometry (<odometry>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <odometry>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'odometry)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name utils-msg:<odometry> is deprecated: use utils-msg:odometry instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <odometry>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader utils-msg:header-val is deprecated.  Use utils-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'odomX-val :lambda-list '(m))
(cl:defmethod odomX-val ((m <odometry>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader utils-msg:odomX-val is deprecated.  Use utils-msg:odomX instead.")
  (odomX m))

(cl:ensure-generic-function 'odomY-val :lambda-list '(m))
(cl:defmethod odomY-val ((m <odometry>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader utils-msg:odomY-val is deprecated.  Use utils-msg:odomY instead.")
  (odomY m))

(cl:ensure-generic-function 'odomYaw-val :lambda-list '(m))
(cl:defmethod odomYaw-val ((m <odometry>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader utils-msg:odomYaw-val is deprecated.  Use utils-msg:odomYaw instead.")
  (odomYaw m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <odometry>) ostream)
  "Serializes a message object of type '<odometry>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'odomX))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'odomY))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'odomYaw))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <odometry>) istream)
  "Deserializes a message object of type '<odometry>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'odomX) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'odomY) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'odomYaw) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<odometry>)))
  "Returns string type for a message object of type '<odometry>"
  "utils/odometry")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'odometry)))
  "Returns string type for a message object of type 'odometry"
  "utils/odometry")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<odometry>)))
  "Returns md5sum for a message object of type '<odometry>"
  "5a51da1ea6b66db5cbffc01f7341d40f")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'odometry)))
  "Returns md5sum for a message object of type 'odometry"
  "5a51da1ea6b66db5cbffc01f7341d40f")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<odometry>)))
  "Returns full string definition for message of type '<odometry>"
  (cl:format cl:nil "std_msgs/Header header~%float32 odomX~%float32 odomY~%float32 odomYaw~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'odometry)))
  "Returns full string definition for message of type 'odometry"
  (cl:format cl:nil "std_msgs/Header header~%float32 odomX~%float32 odomY~%float32 odomYaw~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <odometry>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     4
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <odometry>))
  "Converts a ROS message object to a list"
  (cl:list 'odometry
    (cl:cons ':header (header msg))
    (cl:cons ':odomX (odomX msg))
    (cl:cons ':odomY (odomY msg))
    (cl:cons ':odomYaw (odomYaw msg))
))

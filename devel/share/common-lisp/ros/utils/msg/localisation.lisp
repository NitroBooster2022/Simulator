; Auto-generated. Do not edit!


(cl:in-package utils-msg)


;//! \htmlinclude localisation.msg.html

(cl:defclass <localisation> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (timestamp
    :reader timestamp
    :initarg :timestamp
    :type cl:float
    :initform 0.0)
   (posA
    :reader posA
    :initarg :posA
    :type cl:float
    :initform 0.0)
   (posB
    :reader posB
    :initarg :posB
    :type cl:float
    :initform 0.0)
   (rotA
    :reader rotA
    :initarg :rotA
    :type cl:float
    :initform 0.0)
   (rotB
    :reader rotB
    :initarg :rotB
    :type cl:float
    :initform 0.0))
)

(cl:defclass localisation (<localisation>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <localisation>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'localisation)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name utils-msg:<localisation> is deprecated: use utils-msg:localisation instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <localisation>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader utils-msg:header-val is deprecated.  Use utils-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'timestamp-val :lambda-list '(m))
(cl:defmethod timestamp-val ((m <localisation>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader utils-msg:timestamp-val is deprecated.  Use utils-msg:timestamp instead.")
  (timestamp m))

(cl:ensure-generic-function 'posA-val :lambda-list '(m))
(cl:defmethod posA-val ((m <localisation>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader utils-msg:posA-val is deprecated.  Use utils-msg:posA instead.")
  (posA m))

(cl:ensure-generic-function 'posB-val :lambda-list '(m))
(cl:defmethod posB-val ((m <localisation>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader utils-msg:posB-val is deprecated.  Use utils-msg:posB instead.")
  (posB m))

(cl:ensure-generic-function 'rotA-val :lambda-list '(m))
(cl:defmethod rotA-val ((m <localisation>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader utils-msg:rotA-val is deprecated.  Use utils-msg:rotA instead.")
  (rotA m))

(cl:ensure-generic-function 'rotB-val :lambda-list '(m))
(cl:defmethod rotB-val ((m <localisation>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader utils-msg:rotB-val is deprecated.  Use utils-msg:rotB instead.")
  (rotB m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <localisation>) ostream)
  "Serializes a message object of type '<localisation>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'timestamp))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'posA))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'posB))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'rotA))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'rotB))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <localisation>) istream)
  "Deserializes a message object of type '<localisation>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'timestamp) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'posA) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'posB) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'rotA) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'rotB) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<localisation>)))
  "Returns string type for a message object of type '<localisation>"
  "utils/localisation")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'localisation)))
  "Returns string type for a message object of type 'localisation"
  "utils/localisation")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<localisation>)))
  "Returns md5sum for a message object of type '<localisation>"
  "0e01c9857a211b8dd03cd47d1c82eef9")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'localisation)))
  "Returns md5sum for a message object of type 'localisation"
  "0e01c9857a211b8dd03cd47d1c82eef9")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<localisation>)))
  "Returns full string definition for message of type '<localisation>"
  (cl:format cl:nil "std_msgs/Header header~%float64 timestamp~%float32 posA~%float32 posB~%float32 rotA~%float32 rotB~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'localisation)))
  "Returns full string definition for message of type 'localisation"
  (cl:format cl:nil "std_msgs/Header header~%float64 timestamp~%float32 posA~%float32 posB~%float32 rotA~%float32 rotB~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <localisation>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     8
     4
     4
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <localisation>))
  "Converts a ROS message object to a list"
  (cl:list 'localisation
    (cl:cons ':header (header msg))
    (cl:cons ':timestamp (timestamp msg))
    (cl:cons ':posA (posA msg))
    (cl:cons ':posB (posB msg))
    (cl:cons ':rotA (rotA msg))
    (cl:cons ':rotB (rotB msg))
))

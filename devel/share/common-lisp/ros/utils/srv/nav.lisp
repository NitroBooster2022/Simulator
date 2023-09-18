; Auto-generated. Do not edit!


(cl:in-package utils-srv)


;//! \htmlinclude nav-request.msg.html

(cl:defclass <nav-request> (roslisp-msg-protocol:ros-message)
  ((speed
    :reader speed
    :initarg :speed
    :type cl:float
    :initform 0.0)
   (steering
    :reader steering
    :initarg :steering
    :type cl:float
    :initform 0.0)
   (time
    :reader time
    :initarg :time
    :type cl:float
    :initform 0.0))
)

(cl:defclass nav-request (<nav-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <nav-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'nav-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name utils-srv:<nav-request> is deprecated: use utils-srv:nav-request instead.")))

(cl:ensure-generic-function 'speed-val :lambda-list '(m))
(cl:defmethod speed-val ((m <nav-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader utils-srv:speed-val is deprecated.  Use utils-srv:speed instead.")
  (speed m))

(cl:ensure-generic-function 'steering-val :lambda-list '(m))
(cl:defmethod steering-val ((m <nav-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader utils-srv:steering-val is deprecated.  Use utils-srv:steering instead.")
  (steering m))

(cl:ensure-generic-function 'time-val :lambda-list '(m))
(cl:defmethod time-val ((m <nav-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader utils-srv:time-val is deprecated.  Use utils-srv:time instead.")
  (time m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <nav-request>) ostream)
  "Serializes a message object of type '<nav-request>"
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'speed))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'steering))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'time))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <nav-request>) istream)
  "Deserializes a message object of type '<nav-request>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'speed) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'steering) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'time) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<nav-request>)))
  "Returns string type for a service object of type '<nav-request>"
  "utils/navRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'nav-request)))
  "Returns string type for a service object of type 'nav-request"
  "utils/navRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<nav-request>)))
  "Returns md5sum for a message object of type '<nav-request>"
  "03b8a544594cfde8979006d334ffaf52")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'nav-request)))
  "Returns md5sum for a message object of type 'nav-request"
  "03b8a544594cfde8979006d334ffaf52")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<nav-request>)))
  "Returns full string definition for message of type '<nav-request>"
  (cl:format cl:nil "float32 speed~%float32 steering~%float32 time~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'nav-request)))
  "Returns full string definition for message of type 'nav-request"
  (cl:format cl:nil "float32 speed~%float32 steering~%float32 time~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <nav-request>))
  (cl:+ 0
     4
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <nav-request>))
  "Converts a ROS message object to a list"
  (cl:list 'nav-request
    (cl:cons ':speed (speed msg))
    (cl:cons ':steering (steering msg))
    (cl:cons ':time (time msg))
))
;//! \htmlinclude nav-response.msg.html

(cl:defclass <nav-response> (roslisp-msg-protocol:ros-message)
  ((dir
    :reader dir
    :initarg :dir
    :type cl:string
    :initform ""))
)

(cl:defclass nav-response (<nav-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <nav-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'nav-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name utils-srv:<nav-response> is deprecated: use utils-srv:nav-response instead.")))

(cl:ensure-generic-function 'dir-val :lambda-list '(m))
(cl:defmethod dir-val ((m <nav-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader utils-srv:dir-val is deprecated.  Use utils-srv:dir instead.")
  (dir m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <nav-response>) ostream)
  "Serializes a message object of type '<nav-response>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'dir))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'dir))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <nav-response>) istream)
  "Deserializes a message object of type '<nav-response>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'dir) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'dir) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<nav-response>)))
  "Returns string type for a service object of type '<nav-response>"
  "utils/navResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'nav-response)))
  "Returns string type for a service object of type 'nav-response"
  "utils/navResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<nav-response>)))
  "Returns md5sum for a message object of type '<nav-response>"
  "03b8a544594cfde8979006d334ffaf52")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'nav-response)))
  "Returns md5sum for a message object of type 'nav-response"
  "03b8a544594cfde8979006d334ffaf52")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<nav-response>)))
  "Returns full string definition for message of type '<nav-response>"
  (cl:format cl:nil "string dir~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'nav-response)))
  "Returns full string definition for message of type 'nav-response"
  (cl:format cl:nil "string dir~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <nav-response>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'dir))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <nav-response>))
  "Converts a ROS message object to a list"
  (cl:list 'nav-response
    (cl:cons ':dir (dir msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'nav)))
  'nav-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'nav)))
  'nav-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'nav)))
  "Returns string type for a service object of type '<nav>"
  "utils/nav")
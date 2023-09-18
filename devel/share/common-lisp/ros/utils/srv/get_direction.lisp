; Auto-generated. Do not edit!


(cl:in-package utils-srv)


;//! \htmlinclude get_direction-request.msg.html

(cl:defclass <get_direction-request> (roslisp-msg-protocol:ros-message)
  ((x
    :reader x
    :initarg :x
    :type cl:float
    :initform 0.0)
   (y
    :reader y
    :initarg :y
    :type cl:float
    :initform 0.0)
   (r
    :reader r
    :initarg :r
    :type cl:float
    :initform 0.0)
   (dest
    :reader dest
    :initarg :dest
    :type cl:string
    :initform ""))
)

(cl:defclass get_direction-request (<get_direction-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <get_direction-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'get_direction-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name utils-srv:<get_direction-request> is deprecated: use utils-srv:get_direction-request instead.")))

(cl:ensure-generic-function 'x-val :lambda-list '(m))
(cl:defmethod x-val ((m <get_direction-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader utils-srv:x-val is deprecated.  Use utils-srv:x instead.")
  (x m))

(cl:ensure-generic-function 'y-val :lambda-list '(m))
(cl:defmethod y-val ((m <get_direction-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader utils-srv:y-val is deprecated.  Use utils-srv:y instead.")
  (y m))

(cl:ensure-generic-function 'r-val :lambda-list '(m))
(cl:defmethod r-val ((m <get_direction-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader utils-srv:r-val is deprecated.  Use utils-srv:r instead.")
  (r m))

(cl:ensure-generic-function 'dest-val :lambda-list '(m))
(cl:defmethod dest-val ((m <get_direction-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader utils-srv:dest-val is deprecated.  Use utils-srv:dest instead.")
  (dest m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <get_direction-request>) ostream)
  "Serializes a message object of type '<get_direction-request>"
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'x))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'y))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'r))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'dest))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'dest))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <get_direction-request>) istream)
  "Deserializes a message object of type '<get_direction-request>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'x) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'y) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'r) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'dest) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'dest) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<get_direction-request>)))
  "Returns string type for a service object of type '<get_direction-request>"
  "utils/get_directionRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'get_direction-request)))
  "Returns string type for a service object of type 'get_direction-request"
  "utils/get_directionRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<get_direction-request>)))
  "Returns md5sum for a message object of type '<get_direction-request>"
  "e06bd54dc49cad3c7c3e45a6cc5ec3c7")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'get_direction-request)))
  "Returns md5sum for a message object of type 'get_direction-request"
  "e06bd54dc49cad3c7c3e45a6cc5ec3c7")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<get_direction-request>)))
  "Returns full string definition for message of type '<get_direction-request>"
  (cl:format cl:nil "float32 x~%float32 y~%float32 r~%string dest~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'get_direction-request)))
  "Returns full string definition for message of type 'get_direction-request"
  (cl:format cl:nil "float32 x~%float32 y~%float32 r~%string dest~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <get_direction-request>))
  (cl:+ 0
     4
     4
     4
     4 (cl:length (cl:slot-value msg 'dest))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <get_direction-request>))
  "Converts a ROS message object to a list"
  (cl:list 'get_direction-request
    (cl:cons ':x (x msg))
    (cl:cons ':y (y msg))
    (cl:cons ':r (r msg))
    (cl:cons ':dest (dest msg))
))
;//! \htmlinclude get_direction-response.msg.html

(cl:defclass <get_direction-response> (roslisp-msg-protocol:ros-message)
  ((dir
    :reader dir
    :initarg :dir
    :type cl:string
    :initform ""))
)

(cl:defclass get_direction-response (<get_direction-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <get_direction-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'get_direction-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name utils-srv:<get_direction-response> is deprecated: use utils-srv:get_direction-response instead.")))

(cl:ensure-generic-function 'dir-val :lambda-list '(m))
(cl:defmethod dir-val ((m <get_direction-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader utils-srv:dir-val is deprecated.  Use utils-srv:dir instead.")
  (dir m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <get_direction-response>) ostream)
  "Serializes a message object of type '<get_direction-response>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'dir))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'dir))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <get_direction-response>) istream)
  "Deserializes a message object of type '<get_direction-response>"
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<get_direction-response>)))
  "Returns string type for a service object of type '<get_direction-response>"
  "utils/get_directionResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'get_direction-response)))
  "Returns string type for a service object of type 'get_direction-response"
  "utils/get_directionResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<get_direction-response>)))
  "Returns md5sum for a message object of type '<get_direction-response>"
  "e06bd54dc49cad3c7c3e45a6cc5ec3c7")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'get_direction-response)))
  "Returns md5sum for a message object of type 'get_direction-response"
  "e06bd54dc49cad3c7c3e45a6cc5ec3c7")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<get_direction-response>)))
  "Returns full string definition for message of type '<get_direction-response>"
  (cl:format cl:nil "string dir~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'get_direction-response)))
  "Returns full string definition for message of type 'get_direction-response"
  (cl:format cl:nil "string dir~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <get_direction-response>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'dir))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <get_direction-response>))
  "Converts a ROS message object to a list"
  (cl:list 'get_direction-response
    (cl:cons ':dir (dir msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'get_direction)))
  'get_direction-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'get_direction)))
  'get_direction-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'get_direction)))
  "Returns string type for a service object of type '<get_direction>"
  "utils/get_direction")
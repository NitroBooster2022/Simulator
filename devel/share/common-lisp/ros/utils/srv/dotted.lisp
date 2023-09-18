; Auto-generated. Do not edit!


(cl:in-package utils-srv)


;//! \htmlinclude dotted-request.msg.html

(cl:defclass <dotted-request> (roslisp-msg-protocol:ros-message)
  ((req
    :reader req
    :initarg :req
    :type cl:string
    :initform ""))
)

(cl:defclass dotted-request (<dotted-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <dotted-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'dotted-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name utils-srv:<dotted-request> is deprecated: use utils-srv:dotted-request instead.")))

(cl:ensure-generic-function 'req-val :lambda-list '(m))
(cl:defmethod req-val ((m <dotted-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader utils-srv:req-val is deprecated.  Use utils-srv:req instead.")
  (req m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <dotted-request>) ostream)
  "Serializes a message object of type '<dotted-request>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'req))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'req))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <dotted-request>) istream)
  "Deserializes a message object of type '<dotted-request>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'req) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'req) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<dotted-request>)))
  "Returns string type for a service object of type '<dotted-request>"
  "utils/dottedRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'dotted-request)))
  "Returns string type for a service object of type 'dotted-request"
  "utils/dottedRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<dotted-request>)))
  "Returns md5sum for a message object of type '<dotted-request>"
  "e314c20a3feea19c202c5fb6355f6614")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'dotted-request)))
  "Returns md5sum for a message object of type 'dotted-request"
  "e314c20a3feea19c202c5fb6355f6614")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<dotted-request>)))
  "Returns full string definition for message of type '<dotted-request>"
  (cl:format cl:nil "string req~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'dotted-request)))
  "Returns full string definition for message of type 'dotted-request"
  (cl:format cl:nil "string req~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <dotted-request>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'req))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <dotted-request>))
  "Converts a ROS message object to a list"
  (cl:list 'dotted-request
    (cl:cons ':req (req msg))
))
;//! \htmlinclude dotted-response.msg.html

(cl:defclass <dotted-response> (roslisp-msg-protocol:ros-message)
  ((dotted
    :reader dotted
    :initarg :dotted
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass dotted-response (<dotted-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <dotted-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'dotted-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name utils-srv:<dotted-response> is deprecated: use utils-srv:dotted-response instead.")))

(cl:ensure-generic-function 'dotted-val :lambda-list '(m))
(cl:defmethod dotted-val ((m <dotted-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader utils-srv:dotted-val is deprecated.  Use utils-srv:dotted instead.")
  (dotted m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <dotted-response>) ostream)
  "Serializes a message object of type '<dotted-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'dotted) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <dotted-response>) istream)
  "Deserializes a message object of type '<dotted-response>"
    (cl:setf (cl:slot-value msg 'dotted) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<dotted-response>)))
  "Returns string type for a service object of type '<dotted-response>"
  "utils/dottedResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'dotted-response)))
  "Returns string type for a service object of type 'dotted-response"
  "utils/dottedResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<dotted-response>)))
  "Returns md5sum for a message object of type '<dotted-response>"
  "e314c20a3feea19c202c5fb6355f6614")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'dotted-response)))
  "Returns md5sum for a message object of type 'dotted-response"
  "e314c20a3feea19c202c5fb6355f6614")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<dotted-response>)))
  "Returns full string definition for message of type '<dotted-response>"
  (cl:format cl:nil "bool dotted~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'dotted-response)))
  "Returns full string definition for message of type 'dotted-response"
  (cl:format cl:nil "bool dotted~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <dotted-response>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <dotted-response>))
  "Converts a ROS message object to a list"
  (cl:list 'dotted-response
    (cl:cons ':dotted (dotted msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'dotted)))
  'dotted-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'dotted)))
  'dotted-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'dotted)))
  "Returns string type for a service object of type '<dotted>"
  "utils/dotted")
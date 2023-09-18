; Auto-generated. Do not edit!


(cl:in-package utils-msg)


;//! \htmlinclude ImgInfo.msg.html

(cl:defclass <ImgInfo> (roslisp-msg-protocol:ros-message)
  ((colorImg
    :reader colorImg
    :initarg :colorImg
    :type (cl:vector cl:integer)
   :initform (cl:make-array 0 :element-type 'cl:integer :initial-element 0))
   (depImg
    :reader depImg
    :initarg :depImg
    :type (cl:vector cl:integer)
   :initform (cl:make-array 0 :element-type 'cl:integer :initial-element 0)))
)

(cl:defclass ImgInfo (<ImgInfo>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ImgInfo>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ImgInfo)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name utils-msg:<ImgInfo> is deprecated: use utils-msg:ImgInfo instead.")))

(cl:ensure-generic-function 'colorImg-val :lambda-list '(m))
(cl:defmethod colorImg-val ((m <ImgInfo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader utils-msg:colorImg-val is deprecated.  Use utils-msg:colorImg instead.")
  (colorImg m))

(cl:ensure-generic-function 'depImg-val :lambda-list '(m))
(cl:defmethod depImg-val ((m <ImgInfo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader utils-msg:depImg-val is deprecated.  Use utils-msg:depImg instead.")
  (depImg m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ImgInfo>) ostream)
  "Serializes a message object of type '<ImgInfo>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'colorImg))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:write-byte (cl:ldb (cl:byte 8 0) ele) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) ele) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) ele) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) ele) ostream))
   (cl:slot-value msg 'colorImg))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'depImg))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:write-byte (cl:ldb (cl:byte 8 0) ele) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) ele) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) ele) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) ele) ostream))
   (cl:slot-value msg 'depImg))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ImgInfo>) istream)
  "Deserializes a message object of type '<ImgInfo>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'colorImg) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'colorImg)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:aref vals i)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:aref vals i)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:aref vals i)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:aref vals i)) (cl:read-byte istream)))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'depImg) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'depImg)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:aref vals i)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:aref vals i)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:aref vals i)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:aref vals i)) (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ImgInfo>)))
  "Returns string type for a message object of type '<ImgInfo>"
  "utils/ImgInfo")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ImgInfo)))
  "Returns string type for a message object of type 'ImgInfo"
  "utils/ImgInfo")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ImgInfo>)))
  "Returns md5sum for a message object of type '<ImgInfo>"
  "40615b7689d240b97498f576ebe96a97")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ImgInfo)))
  "Returns md5sum for a message object of type 'ImgInfo"
  "40615b7689d240b97498f576ebe96a97")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ImgInfo>)))
  "Returns full string definition for message of type '<ImgInfo>"
  (cl:format cl:nil "uint32[] colorImg~%uint32[] depImg~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ImgInfo)))
  "Returns full string definition for message of type 'ImgInfo"
  (cl:format cl:nil "uint32[] colorImg~%uint32[] depImg~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ImgInfo>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'colorImg) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'depImg) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ImgInfo>))
  "Converts a ROS message object to a list"
  (cl:list 'ImgInfo
    (cl:cons ':colorImg (colorImg msg))
    (cl:cons ':depImg (depImg msg))
))

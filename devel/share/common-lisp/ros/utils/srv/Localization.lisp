; Auto-generated. Do not edit!


(cl:in-package utils-srv)


;//! \htmlinclude Localization-request.msg.html

(cl:defclass <Localization-request> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass Localization-request (<Localization-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Localization-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Localization-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name utils-srv:<Localization-request> is deprecated: use utils-srv:Localization-request instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Localization-request>) ostream)
  "Serializes a message object of type '<Localization-request>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Localization-request>) istream)
  "Deserializes a message object of type '<Localization-request>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Localization-request>)))
  "Returns string type for a service object of type '<Localization-request>"
  "utils/LocalizationRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Localization-request)))
  "Returns string type for a service object of type 'Localization-request"
  "utils/LocalizationRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Localization-request>)))
  "Returns md5sum for a message object of type '<Localization-request>"
  "d41d8cd98f00b204e9800998ecf8427e")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Localization-request)))
  "Returns md5sum for a message object of type 'Localization-request"
  "d41d8cd98f00b204e9800998ecf8427e")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Localization-request>)))
  "Returns full string definition for message of type '<Localization-request>"
  (cl:format cl:nil "~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Localization-request)))
  "Returns full string definition for message of type 'Localization-request"
  (cl:format cl:nil "~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Localization-request>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Localization-request>))
  "Converts a ROS message object to a list"
  (cl:list 'Localization-request
))
;//! \htmlinclude Localization-response.msg.html

(cl:defclass <Localization-response> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass Localization-response (<Localization-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Localization-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Localization-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name utils-srv:<Localization-response> is deprecated: use utils-srv:Localization-response instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Localization-response>) ostream)
  "Serializes a message object of type '<Localization-response>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Localization-response>) istream)
  "Deserializes a message object of type '<Localization-response>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Localization-response>)))
  "Returns string type for a service object of type '<Localization-response>"
  "utils/LocalizationResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Localization-response)))
  "Returns string type for a service object of type 'Localization-response"
  "utils/LocalizationResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Localization-response>)))
  "Returns md5sum for a message object of type '<Localization-response>"
  "d41d8cd98f00b204e9800998ecf8427e")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Localization-response)))
  "Returns md5sum for a message object of type 'Localization-response"
  "d41d8cd98f00b204e9800998ecf8427e")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Localization-response>)))
  "Returns full string definition for message of type '<Localization-response>"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Localization-response)))
  "Returns full string definition for message of type 'Localization-response"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Localization-response>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Localization-response>))
  "Converts a ROS message object to a list"
  (cl:list 'Localization-response
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'Localization)))
  'Localization-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'Localization)))
  'Localization-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Localization)))
  "Returns string type for a service object of type '<Localization>"
  "utils/Localization")
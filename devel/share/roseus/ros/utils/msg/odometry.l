;; Auto-generated. Do not edit!


(when (boundp 'utils::odometry)
  (if (not (find-package "UTILS"))
    (make-package "UTILS"))
  (shadow 'odometry (find-package "UTILS")))
(unless (find-package "UTILS::ODOMETRY")
  (make-package "UTILS::ODOMETRY"))

(in-package "ROS")
;;//! \htmlinclude odometry.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass utils::odometry
  :super ros::object
  :slots (_header _odomX _odomY _odomYaw ))

(defmethod utils::odometry
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:odomX __odomX) 0.0)
    ((:odomY __odomY) 0.0)
    ((:odomYaw __odomYaw) 0.0)
    )
   (send-super :init)
   (setq _header __header)
   (setq _odomX (float __odomX))
   (setq _odomY (float __odomY))
   (setq _odomYaw (float __odomYaw))
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:odomX
   (&optional __odomX)
   (if __odomX (setq _odomX __odomX)) _odomX)
  (:odomY
   (&optional __odomY)
   (if __odomY (setq _odomY __odomY)) _odomY)
  (:odomYaw
   (&optional __odomYaw)
   (if __odomYaw (setq _odomYaw __odomYaw)) _odomYaw)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; float32 _odomX
    4
    ;; float32 _odomY
    4
    ;; float32 _odomYaw
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; float32 _odomX
       (sys::poke _odomX (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _odomY
       (sys::poke _odomY (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _odomYaw
       (sys::poke _odomYaw (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; float32 _odomX
     (setq _odomX (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _odomY
     (setq _odomY (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _odomYaw
     (setq _odomYaw (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get utils::odometry :md5sum-) "5a51da1ea6b66db5cbffc01f7341d40f")
(setf (get utils::odometry :datatype-) "utils/odometry")
(setf (get utils::odometry :definition-)
      "std_msgs/Header header
float32 odomX
float32 odomY
float32 odomYaw
================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
string frame_id

")



(provide :utils/odometry "5a51da1ea6b66db5cbffc01f7341d40f")



;; Auto-generated. Do not edit!


(when (boundp 'utils::Sign)
  (if (not (find-package "UTILS"))
    (make-package "UTILS"))
  (shadow 'Sign (find-package "UTILS")))
(unless (find-package "UTILS::SIGN")
  (make-package "UTILS::SIGN"))

(in-package "ROS")
;;//! \htmlinclude Sign.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass utils::Sign
  :super ros::object
  :slots (_header _objects _box1 _box2 _box3 _box4 _num _confidence ))

(defmethod utils::Sign
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:objects __objects) (make-array 0 :initial-element 0 :element-type :integer))
    ((:box1 __box1) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:box2 __box2) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:box3 __box3) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:box4 __box4) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:num __num) 0)
    ((:confidence __confidence) (make-array 0 :initial-element 0.0 :element-type :float))
    )
   (send-super :init)
   (setq _header __header)
   (setq _objects __objects)
   (setq _box1 __box1)
   (setq _box2 __box2)
   (setq _box3 __box3)
   (setq _box4 __box4)
   (setq _num (round __num))
   (setq _confidence __confidence)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:objects
   (&optional __objects)
   (if __objects (setq _objects __objects)) _objects)
  (:box1
   (&optional __box1)
   (if __box1 (setq _box1 __box1)) _box1)
  (:box2
   (&optional __box2)
   (if __box2 (setq _box2 __box2)) _box2)
  (:box3
   (&optional __box3)
   (if __box3 (setq _box3 __box3)) _box3)
  (:box4
   (&optional __box4)
   (if __box4 (setq _box4 __box4)) _box4)
  (:num
   (&optional __num)
   (if __num (setq _num __num)) _num)
  (:confidence
   (&optional __confidence)
   (if __confidence (setq _confidence __confidence)) _confidence)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; int32[] _objects
    (* 4    (length _objects)) 4
    ;; float32[] _box1
    (* 4    (length _box1)) 4
    ;; float32[] _box2
    (* 4    (length _box2)) 4
    ;; float32[] _box3
    (* 4    (length _box3)) 4
    ;; float32[] _box4
    (* 4    (length _box4)) 4
    ;; int32 _num
    4
    ;; float32[] _confidence
    (* 4    (length _confidence)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; int32[] _objects
     (write-long (length _objects) s)
     (dotimes (i (length _objects))
       (write-long (elt _objects i) s)
       )
     ;; float32[] _box1
     (write-long (length _box1) s)
     (dotimes (i (length _box1))
       (sys::poke (elt _box1 i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;; float32[] _box2
     (write-long (length _box2) s)
     (dotimes (i (length _box2))
       (sys::poke (elt _box2 i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;; float32[] _box3
     (write-long (length _box3) s)
     (dotimes (i (length _box3))
       (sys::poke (elt _box3 i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;; float32[] _box4
     (write-long (length _box4) s)
     (dotimes (i (length _box4))
       (sys::poke (elt _box4 i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;; int32 _num
       (write-long _num s)
     ;; float32[] _confidence
     (write-long (length _confidence) s)
     (dotimes (i (length _confidence))
       (sys::poke (elt _confidence i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; int32[] _objects
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _objects (instantiate integer-vector n))
     (dotimes (i n)
     (setf (elt _objects i) (sys::peek buf ptr- :integer)) (incf ptr- 4)
     ))
   ;; float32[] _box1
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _box1 (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _box1 i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     ))
   ;; float32[] _box2
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _box2 (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _box2 i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     ))
   ;; float32[] _box3
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _box3 (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _box3 i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     ))
   ;; float32[] _box4
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _box4 (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _box4 i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     ))
   ;; int32 _num
     (setq _num (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; float32[] _confidence
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _confidence (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _confidence i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     ))
   ;;
   self)
  )

(setf (get utils::Sign :md5sum-) "b9c82d37a6d896a910746afbdbd99b7a")
(setf (get utils::Sign :datatype-) "utils/Sign")
(setf (get utils::Sign :definition-)
      "std_msgs/Header header

int32[] objects
float32[] box1
float32[] box2
float32[] box3
float32[] box4
int32 num
float32[] confidence
# int32 obj1
# float32 left1
# float32 top1
# float32 width1
# float32 height1

# int32 obj2
# float32 left2
# float32 top2
# float32 width2
# float32 height2


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



(provide :utils/Sign "b9c82d37a6d896a910746afbdbd99b7a")



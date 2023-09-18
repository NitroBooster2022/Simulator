;; Auto-generated. Do not edit!


(when (boundp 'utils::get_direction)
  (if (not (find-package "UTILS"))
    (make-package "UTILS"))
  (shadow 'get_direction (find-package "UTILS")))
(unless (find-package "UTILS::GET_DIRECTION")
  (make-package "UTILS::GET_DIRECTION"))
(unless (find-package "UTILS::GET_DIRECTIONREQUEST")
  (make-package "UTILS::GET_DIRECTIONREQUEST"))
(unless (find-package "UTILS::GET_DIRECTIONRESPONSE")
  (make-package "UTILS::GET_DIRECTIONRESPONSE"))

(in-package "ROS")





(defclass utils::get_directionRequest
  :super ros::object
  :slots (_x _y _r _dest ))

(defmethod utils::get_directionRequest
  (:init
   (&key
    ((:x __x) 0.0)
    ((:y __y) 0.0)
    ((:r __r) 0.0)
    ((:dest __dest) "")
    )
   (send-super :init)
   (setq _x (float __x))
   (setq _y (float __y))
   (setq _r (float __r))
   (setq _dest (string __dest))
   self)
  (:x
   (&optional __x)
   (if __x (setq _x __x)) _x)
  (:y
   (&optional __y)
   (if __y (setq _y __y)) _y)
  (:r
   (&optional __r)
   (if __r (setq _r __r)) _r)
  (:dest
   (&optional __dest)
   (if __dest (setq _dest __dest)) _dest)
  (:serialization-length
   ()
   (+
    ;; float32 _x
    4
    ;; float32 _y
    4
    ;; float32 _r
    4
    ;; string _dest
    4 (length _dest)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32 _x
       (sys::poke _x (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _y
       (sys::poke _y (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _r
       (sys::poke _r (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; string _dest
       (write-long (length _dest) s) (princ _dest s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _x
     (setq _x (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _y
     (setq _y (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _r
     (setq _r (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; string _dest
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _dest (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass utils::get_directionResponse
  :super ros::object
  :slots (_dir ))

(defmethod utils::get_directionResponse
  (:init
   (&key
    ((:dir __dir) "")
    )
   (send-super :init)
   (setq _dir (string __dir))
   self)
  (:dir
   (&optional __dir)
   (if __dir (setq _dir __dir)) _dir)
  (:serialization-length
   ()
   (+
    ;; string _dir
    4 (length _dir)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _dir
       (write-long (length _dir) s) (princ _dir s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _dir
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _dir (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass utils::get_direction
  :super ros::object
  :slots ())

(setf (get utils::get_direction :md5sum-) "e06bd54dc49cad3c7c3e45a6cc5ec3c7")
(setf (get utils::get_direction :datatype-) "utils/get_direction")
(setf (get utils::get_direction :request) utils::get_directionRequest)
(setf (get utils::get_direction :response) utils::get_directionResponse)

(defmethod utils::get_directionRequest
  (:response () (instance utils::get_directionResponse :init)))

(setf (get utils::get_directionRequest :md5sum-) "e06bd54dc49cad3c7c3e45a6cc5ec3c7")
(setf (get utils::get_directionRequest :datatype-) "utils/get_directionRequest")
(setf (get utils::get_directionRequest :definition-)
      "float32 x
float32 y
float32 r
string dest
---
string dir
")

(setf (get utils::get_directionResponse :md5sum-) "e06bd54dc49cad3c7c3e45a6cc5ec3c7")
(setf (get utils::get_directionResponse :datatype-) "utils/get_directionResponse")
(setf (get utils::get_directionResponse :definition-)
      "float32 x
float32 y
float32 r
string dest
---
string dir
")



(provide :utils/get_direction "e06bd54dc49cad3c7c3e45a6cc5ec3c7")



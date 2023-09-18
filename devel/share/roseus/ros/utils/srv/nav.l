;; Auto-generated. Do not edit!


(when (boundp 'utils::nav)
  (if (not (find-package "UTILS"))
    (make-package "UTILS"))
  (shadow 'nav (find-package "UTILS")))
(unless (find-package "UTILS::NAV")
  (make-package "UTILS::NAV"))
(unless (find-package "UTILS::NAVREQUEST")
  (make-package "UTILS::NAVREQUEST"))
(unless (find-package "UTILS::NAVRESPONSE")
  (make-package "UTILS::NAVRESPONSE"))

(in-package "ROS")





(defclass utils::navRequest
  :super ros::object
  :slots (_speed _steering _time ))

(defmethod utils::navRequest
  (:init
   (&key
    ((:speed __speed) 0.0)
    ((:steering __steering) 0.0)
    ((:time __time) 0.0)
    )
   (send-super :init)
   (setq _speed (float __speed))
   (setq _steering (float __steering))
   (setq _time (float __time))
   self)
  (:speed
   (&optional __speed)
   (if __speed (setq _speed __speed)) _speed)
  (:steering
   (&optional __steering)
   (if __steering (setq _steering __steering)) _steering)
  (:time
   (&optional __time)
   (if __time (setq _time __time)) _time)
  (:serialization-length
   ()
   (+
    ;; float32 _speed
    4
    ;; float32 _steering
    4
    ;; float32 _time
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32 _speed
       (sys::poke _speed (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _steering
       (sys::poke _steering (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _time
       (sys::poke _time (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _speed
     (setq _speed (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _steering
     (setq _steering (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _time
     (setq _time (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(defclass utils::navResponse
  :super ros::object
  :slots (_dir ))

(defmethod utils::navResponse
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

(defclass utils::nav
  :super ros::object
  :slots ())

(setf (get utils::nav :md5sum-) "03b8a544594cfde8979006d334ffaf52")
(setf (get utils::nav :datatype-) "utils/nav")
(setf (get utils::nav :request) utils::navRequest)
(setf (get utils::nav :response) utils::navResponse)

(defmethod utils::navRequest
  (:response () (instance utils::navResponse :init)))

(setf (get utils::navRequest :md5sum-) "03b8a544594cfde8979006d334ffaf52")
(setf (get utils::navRequest :datatype-) "utils/navRequest")
(setf (get utils::navRequest :definition-)
      "float32 speed
float32 steering
float32 time
---
string dir
")

(setf (get utils::navResponse :md5sum-) "03b8a544594cfde8979006d334ffaf52")
(setf (get utils::navResponse :datatype-) "utils/navResponse")
(setf (get utils::navResponse :definition-)
      "float32 speed
float32 steering
float32 time
---
string dir
")



(provide :utils/nav "03b8a544594cfde8979006d334ffaf52")



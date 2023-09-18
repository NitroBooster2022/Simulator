;; Auto-generated. Do not edit!


(when (boundp 'utils::Sensors)
  (if (not (find-package "UTILS"))
    (make-package "UTILS"))
  (shadow 'Sensors (find-package "UTILS")))
(unless (find-package "UTILS::SENSORS")
  (make-package "UTILS::SENSORS"))

(in-package "ROS")
;;//! \htmlinclude Sensors.msg.html


(defclass utils::Sensors
  :super ros::object
  :slots (_yaw _speed ))

(defmethod utils::Sensors
  (:init
   (&key
    ((:yaw __yaw) 0.0)
    ((:speed __speed) 0.0)
    )
   (send-super :init)
   (setq _yaw (float __yaw))
   (setq _speed (float __speed))
   self)
  (:yaw
   (&optional __yaw)
   (if __yaw (setq _yaw __yaw)) _yaw)
  (:speed
   (&optional __speed)
   (if __speed (setq _speed __speed)) _speed)
  (:serialization-length
   ()
   (+
    ;; float32 _yaw
    4
    ;; float32 _speed
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32 _yaw
       (sys::poke _yaw (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _speed
       (sys::poke _speed (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _yaw
     (setq _yaw (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _speed
     (setq _speed (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get utils::Sensors :md5sum-) "0708b47c61ea53e7faa2ee55ab9e77b7")
(setf (get utils::Sensors :datatype-) "utils/Sensors")
(setf (get utils::Sensors :definition-)
      "float32 yaw
float32 speed
")



(provide :utils/Sensors "0708b47c61ea53e7faa2ee55ab9e77b7")



;; Auto-generated. Do not edit!


(when (boundp 'utils::ImgInfo)
  (if (not (find-package "UTILS"))
    (make-package "UTILS"))
  (shadow 'ImgInfo (find-package "UTILS")))
(unless (find-package "UTILS::IMGINFO")
  (make-package "UTILS::IMGINFO"))

(in-package "ROS")
;;//! \htmlinclude ImgInfo.msg.html


(defclass utils::ImgInfo
  :super ros::object
  :slots (_colorImg _depImg ))

(defmethod utils::ImgInfo
  (:init
   (&key
    ((:colorImg __colorImg) (make-array 0 :initial-element 0 :element-type :integer))
    ((:depImg __depImg) (make-array 0 :initial-element 0 :element-type :integer))
    )
   (send-super :init)
   (setq _colorImg __colorImg)
   (setq _depImg __depImg)
   self)
  (:colorImg
   (&optional __colorImg)
   (if __colorImg (setq _colorImg __colorImg)) _colorImg)
  (:depImg
   (&optional __depImg)
   (if __depImg (setq _depImg __depImg)) _depImg)
  (:serialization-length
   ()
   (+
    ;; uint32[] _colorImg
    (* 4    (length _colorImg)) 4
    ;; uint32[] _depImg
    (* 4    (length _depImg)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint32[] _colorImg
     (write-long (length _colorImg) s)
     (dotimes (i (length _colorImg))
       (write-long (elt _colorImg i) s)
       )
     ;; uint32[] _depImg
     (write-long (length _depImg) s)
     (dotimes (i (length _depImg))
       (write-long (elt _depImg i) s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint32[] _colorImg
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _colorImg (instantiate integer-vector n))
     (dotimes (i n)
     (setf (elt _colorImg i) (sys::peek buf ptr- :integer)) (incf ptr- 4)
     ))
   ;; uint32[] _depImg
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _depImg (instantiate integer-vector n))
     (dotimes (i n)
     (setf (elt _depImg i) (sys::peek buf ptr- :integer)) (incf ptr- 4)
     ))
   ;;
   self)
  )

(setf (get utils::ImgInfo :md5sum-) "40615b7689d240b97498f576ebe96a97")
(setf (get utils::ImgInfo :datatype-) "utils/ImgInfo")
(setf (get utils::ImgInfo :definition-)
      "uint32[] colorImg
uint32[] depImg
")



(provide :utils/ImgInfo "40615b7689d240b97498f576ebe96a97")



;; Auto-generated. Do not edit!


(when (boundp 'utils::Localization)
  (if (not (find-package "UTILS"))
    (make-package "UTILS"))
  (shadow 'Localization (find-package "UTILS")))
(unless (find-package "UTILS::LOCALIZATION")
  (make-package "UTILS::LOCALIZATION"))
(unless (find-package "UTILS::LOCALIZATIONREQUEST")
  (make-package "UTILS::LOCALIZATIONREQUEST"))
(unless (find-package "UTILS::LOCALIZATIONRESPONSE")
  (make-package "UTILS::LOCALIZATIONRESPONSE"))

(in-package "ROS")





(defclass utils::LocalizationRequest
  :super ros::object
  :slots ())

(defmethod utils::LocalizationRequest
  (:init
   (&key
    )
   (send-super :init)
   self)
  (:serialization-length
   ()
   (+
    0
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;;
   self)
  )

(defclass utils::LocalizationResponse
  :super ros::object
  :slots ())

(defmethod utils::LocalizationResponse
  (:init
   (&key
    )
   (send-super :init)
   self)
  (:serialization-length
   ()
   (+
    0
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;;
   self)
  )

(defclass utils::Localization
  :super ros::object
  :slots ())

(setf (get utils::Localization :md5sum-) "d41d8cd98f00b204e9800998ecf8427e")
(setf (get utils::Localization :datatype-) "utils/Localization")
(setf (get utils::Localization :request) utils::LocalizationRequest)
(setf (get utils::Localization :response) utils::LocalizationResponse)

(defmethod utils::LocalizationRequest
  (:response () (instance utils::LocalizationResponse :init)))

(setf (get utils::LocalizationRequest :md5sum-) "d41d8cd98f00b204e9800998ecf8427e")
(setf (get utils::LocalizationRequest :datatype-) "utils/LocalizationRequest")
(setf (get utils::LocalizationRequest :definition-)
      "
---
")

(setf (get utils::LocalizationResponse :md5sum-) "d41d8cd98f00b204e9800998ecf8427e")
(setf (get utils::LocalizationResponse :datatype-) "utils/LocalizationResponse")
(setf (get utils::LocalizationResponse :definition-)
      "
---
")



(provide :utils/Localization "d41d8cd98f00b204e9800998ecf8427e")



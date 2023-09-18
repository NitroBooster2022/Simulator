;; Auto-generated. Do not edit!


(when (boundp 'utils::dotted)
  (if (not (find-package "UTILS"))
    (make-package "UTILS"))
  (shadow 'dotted (find-package "UTILS")))
(unless (find-package "UTILS::DOTTED")
  (make-package "UTILS::DOTTED"))
(unless (find-package "UTILS::DOTTEDREQUEST")
  (make-package "UTILS::DOTTEDREQUEST"))
(unless (find-package "UTILS::DOTTEDRESPONSE")
  (make-package "UTILS::DOTTEDRESPONSE"))

(in-package "ROS")





(defclass utils::dottedRequest
  :super ros::object
  :slots (_req ))

(defmethod utils::dottedRequest
  (:init
   (&key
    ((:req __req) "")
    )
   (send-super :init)
   (setq _req (string __req))
   self)
  (:req
   (&optional __req)
   (if __req (setq _req __req)) _req)
  (:serialization-length
   ()
   (+
    ;; string _req
    4 (length _req)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _req
       (write-long (length _req) s) (princ _req s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _req
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _req (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass utils::dottedResponse
  :super ros::object
  :slots (_dotted ))

(defmethod utils::dottedResponse
  (:init
   (&key
    ((:dotted __dotted) nil)
    )
   (send-super :init)
   (setq _dotted __dotted)
   self)
  (:dotted
   (&optional (__dotted :null))
   (if (not (eq __dotted :null)) (setq _dotted __dotted)) _dotted)
  (:serialization-length
   ()
   (+
    ;; bool _dotted
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _dotted
       (if _dotted (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _dotted
     (setq _dotted (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(defclass utils::dotted
  :super ros::object
  :slots ())

(setf (get utils::dotted :md5sum-) "e314c20a3feea19c202c5fb6355f6614")
(setf (get utils::dotted :datatype-) "utils/dotted")
(setf (get utils::dotted :request) utils::dottedRequest)
(setf (get utils::dotted :response) utils::dottedResponse)

(defmethod utils::dottedRequest
  (:response () (instance utils::dottedResponse :init)))

(setf (get utils::dottedRequest :md5sum-) "e314c20a3feea19c202c5fb6355f6614")
(setf (get utils::dottedRequest :datatype-) "utils/dottedRequest")
(setf (get utils::dottedRequest :definition-)
      "string req
---
bool dotted
")

(setf (get utils::dottedResponse :md5sum-) "e314c20a3feea19c202c5fb6355f6614")
(setf (get utils::dottedResponse :datatype-) "utils/dottedResponse")
(setf (get utils::dottedResponse :definition-)
      "string req
---
bool dotted
")



(provide :utils/dotted "e314c20a3feea19c202c5fb6355f6614")



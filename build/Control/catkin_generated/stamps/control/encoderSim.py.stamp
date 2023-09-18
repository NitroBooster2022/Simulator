#!/usr/bin/env python3

import rospy
import numpy as alex
from std_msgs.msg import Header, Float32
from message_filters import ApproximateTimeSynchronizer
from gazebo_msgs.msg import ModelStates, LinkStates
import math
from utils.msg import encoder, IMU
import message_filters
import tf2_ros
import geometry_msgs.msg
from geometry_msgs.msg import TransformStamped
from tf.transformations import quaternion_multiply, quaternion_inverse

class EncoderNode():
    def __init__(self):
        print("init encoder node")
        rospy.init_node('encoder_node', anonymous=True)
        self.model_sub = message_filters.Subscriber("/gazebo/model_states", ModelStates, queue_size=3)
        self.link_sub = message_filters.Subscriber("/gazebo/link_states", LinkStates, queue_size=3)
        self.imu_sub = message_filters.Subscriber("/automobile/IMU", IMU, queue_size=3)
        self.pub = rospy.Publisher("/automobile/encoder", encoder, queue_size = 3)
        self.steer_pub = rospy.Publisher("/automobile/steer", Float32, queue_size = 3)
        self.p = encoder()
        self.rate = rospy.Rate(15)
        self.yaw = 0
        self.br = tf2_ros.TransformBroadcaster()

        self.subscribers = []
        self.subscribers.append(self.model_sub)
        self.subscribers.append(self.link_sub)
        self.subscribers.append(self.imu_sub)
        
        # Create an instance of TimeSynchronizer
        ts = ApproximateTimeSynchronizer(self.subscribers, queue_size=3, slop=0.0015)
        ts.registerCallback(self.callback)

    def callback(self, model, link, imu):
        self.yaw = imu.yaw #between pi to -pi

        try:
            wheel_front_left_idx = link.name.index("automobile::wheel_front_left::link_rim")
            wheel_front_right_idx = link.name.index("automobile::wheel_front_right::link_rim")
        except ValueError:
            return

        wheel_front_left_pose = link.pose[wheel_front_left_idx]
        wheel_front_right_pose = link.pose[wheel_front_right_idx]
        wheel_front_right_inertial = link.twist[wheel_front_right_idx]
        wheel_front_left_inertial = link.twist[wheel_front_left_idx]
        # print("left: ", wheel_front_left_pose, wheel_front_left_inertial)
        # print("right: ", wheel_front_right_pose, wheel_front_right_inertial)

        header = Header()
        header.frame_id = 'encoder'
        header.stamp = rospy.Time.now()
        self.p.header = header

        try:
            car_idx = model.name.index("automobile")
        except ValueError:
            return

        car_speed = model.twist[car_idx]
        car_pose = model.pose[car_idx]
        x_speed = car_speed.linear.x
        y_speed = car_speed.linear.y
        syaw = math.atan2(y_speed, x_speed)
        speed = math.sqrt(x_speed**2 + y_speed**2)
        # print("car speed: ", speed)
        error = abs(syaw - self.yaw)
        if error >= 5.73:
            error -= 6.28
        if abs(error) < 1.57:
            self.p.speed = speed
        else:
            self.p.speed = -speed

        self.pub.publish(self.p)

        # tf
        dynamic_transforms = []

        # Compute the relative position of the car with respect to the world

        tCar = TransformStamped()
        tCar.header.stamp = rospy.Time.now()
        tCar.header.frame_id = "world"
        tCar.child_frame_id = "chassis"
        tCar.transform.translation.x = car_pose.position.x
        tCar.transform.translation.y = car_pose.position.y
        tCar.transform.translation.z = car_pose.position.z
        tCar.transform.rotation.x = car_pose.orientation.x
        tCar.transform.rotation.y = car_pose.orientation.y
        tCar.transform.rotation.z = car_pose.orientation.z
        tCar.transform.rotation.w = car_pose.orientation.w

        dynamic_transforms.append(tCar)

        # Compute the relative position of the left wheel with respect to the chassis
        rel_x = wheel_front_left_pose.position.x - car_pose.position.x
        rel_y = wheel_front_left_pose.position.y - car_pose.position.y
        rel_z = wheel_front_left_pose.position.z - car_pose.position.z

        # Compute the relative orientation of the left wheel with respect to the chassis
        # This assumes that the orientations are given as quaternions in the form [x, y, z, w]
        inv_car_orientation = quaternion_inverse([car_pose.orientation.x, car_pose.orientation.y, car_pose.orientation.z, car_pose.orientation.w])
        rel_orientation = quaternion_multiply(inv_car_orientation, [wheel_front_left_pose.orientation.x, wheel_front_left_pose.orientation.y, wheel_front_left_pose.orientation.z, wheel_front_left_pose.orientation.w])

        # Populate the transform message
        tLeft = TransformStamped()
        tLeft.header.stamp = rospy.Time.now()
        tLeft.header.frame_id = "chassis"
        tLeft.child_frame_id = "wheel_front_left"
        tLeft.transform.translation.x = rel_x
        tLeft.transform.translation.y = rel_y
        tLeft.transform.translation.z = rel_z
        tLeft.transform.rotation.x = rel_orientation[0]
        tLeft.transform.rotation.y = rel_orientation[1]
        tLeft.transform.rotation.z = rel_orientation[2]
        tLeft.transform.rotation.w = rel_orientation[3]

        dynamic_transforms.append(tLeft)

        # Compute the relative position of the right wheel with respect to the chassis
        rel_x = wheel_front_right_pose.position.x - car_pose.position.x
        rel_y = wheel_front_right_pose.position.y - car_pose.position.y
        rel_z = wheel_front_right_pose.position.z - car_pose.position.z

        # Compute the relative orientation of the right wheel with respect to the chassis
        # This assumes that the orientations are given as quaternions in the form [x, y, z, w]
        inv_car_orientation = quaternion_inverse([car_pose.orientation.x, car_pose.orientation.y, car_pose.orientation.z, car_pose.orientation.w])
        rel_orientation = quaternion_multiply(inv_car_orientation, [wheel_front_right_pose.orientation.x, wheel_front_right_pose.orientation.y, wheel_front_right_pose.orientation.z, wheel_front_right_pose.orientation.w])

        # Populate the transform message
        tRight = TransformStamped()
        tRight.header.stamp = rospy.Time.now()
        tRight.header.frame_id = "chassis"
        tRight.child_frame_id = "wheel_front_left"
        tRight.transform.translation.x = rel_x
        tRight.transform.translation.y = rel_y
        tRight.transform.translation.z = rel_z
        tRight.transform.rotation.x = rel_orientation[0]
        tRight.transform.rotation.y = rel_orientation[1]
        tRight.transform.rotation.z = rel_orientation[2]
        tRight.transform.rotation.w = rel_orientation[3]

        dynamic_transforms.append(tRight)
        self.br.sendTransform(dynamic_transforms)

if __name__ == '__main__':
    import rospy
    while not rospy.is_shutdown():
        try:
            node = EncoderNode()
            node.rate.sleep()
            rospy.spin()
        except rospy.ROSInterruptException:
            pass
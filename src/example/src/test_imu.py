#!/usr/bin/env python3

import sys
sys.path.append('.')
import os.path
import time
import math
import serial

import rospy
from sensor_msgs.msg import Imu
from std_msgs.msg import Header
from tf.transformations import quaternion_from_euler

class IMUNode():
    def __init__(self):
        rospy.init_node('imu_node', anonymous=False)

        self.ser = serial.Serial(
            # port='/dev/serial_device',
            port='/dev/ttyACM0',
            baudrate=19200,
            parity=serial.PARITY_NONE,
            stopbits=serial.STOPBITS_ONE,
            bytesize=serial.EIGHTBITS,
            timeout=1
        )

        # IMU publisher object
        self.rate = rospy.Rate(30)
        self.imu_publisher = rospy.Publisher("/automobile/imu", Imu, queue_size=3)

    # =================================== RUN ========================================
    def run(self):
        rospy.loginfo("Starting IMU Node")
        self.getting()

    # =================================== GETTING ========================================
    def getting(self):
        while not rospy.is_shutdown():
            self.ser.write('#7:1;;\r\n'.encode('ascii'))
            line = self.ser.readline().decode("utf-8").strip()
            # print(line)
            if line.startswith('@7'):
                imu_data = self.parse_imu_data(line)
                if imu_data:
                    self.imu_publisher.publish(imu_data)
            self.rate.sleep()

    # =================================== PARSING IMU DATA ========================================
    def parse_imu_data(self, data):
        try:
            imu_msg = Imu()
            imu_msg.header = Header()
            imu_msg.header.stamp = rospy.Time.now()
            imu_msg.header.frame_id = "imu_frame"

            parts = data[3:].split(';')

            print(parts)

            # Extracting roll, pitch, yaw, accelx, accely, accelz
            # roll, pitch, yaw, accelx, accely, accelz = map(float, parts[0].split(':')[1].split(','))
            roll = float(parts[0])
            pitch = float(parts[1])
            yaw = float(parts[2])
            accelx = float(parts[3])
            accely = float(parts[4])
            accelz = float(parts[5])

            # Convert roll, pitch, yaw to quaternion
            quat = quaternion_from_euler(math.radians(roll), math.radians(pitch), math.radians(yaw))

            # Set orientation
            # imu_msg.orientation.x = quat[0]
            # imu_msg.orientation.y = quat[1]
            # imu_msg.orientation.z = quat[2]
            # imu_msg.orientation.w = quat[3]

            imu_msg.orientation.x = roll
            imu_msg.orientation.y = pitch
            imu_msg.orientation.z = yaw
            imu_msg.orientation.w = 0

            # Assuming the received values are in m/s^2 for linear acceleration
            imu_msg.linear_acceleration.x = accelx
            imu_msg.linear_acceleration.y = accely
            imu_msg.linear_acceleration.z = accelz

            # Assuming the received values are in radians/s for angular velocity
            imu_msg.angular_velocity.x = 0.0
            imu_msg.angular_velocity.y = 0.0
            imu_msg.angular_velocity.z = 0.0

            return imu_msg
        except Exception as e:
            rospy.logerr("Error parsing IMU data: %s", str(e))
            return None

if __name__ == "__main__":
    imu_node = IMUNode()
    imu_node.run()

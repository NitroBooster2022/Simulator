cmake_minimum_required(VERSION 3.0.2)
project(example)

find_package(catkin REQUIRED COMPONENTS
  rospy
  std_msgs
  utils
  roscpp
  sensor_msgs
  tf2_geometry_msgs
)

catkin_package(
  LIBRARIES
  CATKIN_DEPENDS
    roscpp
    sensor_msgs
    tf2_geometry_msgs
  DEPENDS
)

include_directories(
# include
  ${catkin_INCLUDE_DIRS}
)

add_executable(serial_imu_publisher src/serial_imu_reader.cpp)
target_link_libraries(serial_imu_publisher ${catkin_LIBRARIES})

## Install
install(TARGETS serial_imu_publisher
  RUNTIME DESTINATION ${CATKIN_PACKAGE_BIN_DESTINATION}
)
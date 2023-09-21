#include "bno055_plugin.hpp"
#include <random> 
#define DEBUG false

namespace gazebo
{
    namespace bno055
    {   
        BNO055::BNO055():ModelPlugin() {
            prev_linear_velocity = ignition::math::Vector3d(0, 0, 0);  // Assuming you're using Gazebo 9 or newer
            prev_time = ros::Time::now();
        }

        void BNO055::Load(physics::ModelPtr model_ptr, sdf::ElementPtr sdf_ptr)
        {
            nh = boost::make_shared<ros::NodeHandle>();	
            timer = nh->createTimer(ros::Duration(0.01), std::bind(&BNO055::OnUpdate, this));
	    	
      			// Save a pointer to the model for later use
      			this->m_model = model_ptr;

      			// ignition::Vector3 prev_linear_velocity;
            // ros::Time prev_time;

          	// Create topic name        	
          	std::string topic_name = "/automobile/IMU";
	        

            // Initialize ros, if it has not already bee initialized.
      			if (!ros::isInitialized())
      			{
        			  int argc = 0;
        			  char **argv = NULL;
        			  ros::init(argc, argv, "gazebo_client_bno", ros::init_options::NoSigintHandler);
      			}

            this->m_ros_node.reset(new ::ros::NodeHandle("/bnoNODEvirt"));
          	this->m_pubBNO = this->m_ros_node->advertise<utils::IMU>(topic_name, 2);
            this->m_pubIMU = this->m_ros_node->advertise<sensor_msgs::Imu>("/imu0", 2);

            if(DEBUG)
            {
                std::cerr << "\n\n";
                ROS_INFO_STREAM("====================================================================");
                ROS_INFO_STREAM("[bno055_plugin] attached to: " << this->m_model->GetName());
                ROS_INFO_STREAM("[bno055_plugin] publish to: "  << topic_name);
                ROS_INFO_STREAM("[bno055_plugin] Usefull data: linear z, angular x, angular y, angular z");
                ROS_INFO_STREAM("====================================================================");
            }
        }

        // Publish the updated values
        void BNO055::OnUpdate()
        {        
            this->m_bno055_pose.header.stamp = ros::Time::now();
            this->m_bno055_pose.header.frame_id = "bno055";
           	this->m_bno055_pose.roll = this->m_model->RelativePose().Rot().Roll();
		        this->m_bno055_pose.pitch = this->m_model->RelativePose().Rot().Pitch();
           	this->m_bno055_pose.yaw = this->m_model->RelativePose().Rot().Yaw();
            this->m_pubBNO.publish(this->m_bno055_pose);

            std::default_random_engine generator;
            std::normal_distribution<double> distribution(0.0, 1.0);  // mean=0, standard deviation=1


            

            this->m_imu_msg.header.stamp = ros::Time::now();
            this->m_imu_msg.header.frame_id = "bno055_imu";

            // orientation
            this->m_imu_msg.orientation.x = this->m_model->RelativePose().Rot().X() ;//+ 0.05 * distribution(generator);  // Added Gaussian noise
            this->m_imu_msg.orientation.y = this->m_model->RelativePose().Rot().Y() ;//+ 0.05 * distribution(generator);
            this->m_imu_msg.orientation.z = this->m_model->RelativePose().Rot().Z() ;//+ 0.05 * distribution(generator);
            this->m_imu_msg.orientation.w = this->m_model->RelativePose().Rot().W() ;//+ 0.05 * distribution(generator);
            double orientation_variance = 0.0025;  // 0.05^2
            this->m_imu_msg.orientation_covariance = {orientation_variance, 0, 0, 
                                                      0, orientation_variance, 0, 
                                                      0, 0, orientation_variance};

            // angular velocity
            ignition::math::Vector3d angular_velocity = this->m_model->WorldAngularVel();
            this->m_imu_msg.angular_velocity.x = angular_velocity.X() ;//+ 0.1 * distribution(generator);
            this->m_imu_msg.angular_velocity.y = angular_velocity.Y() ;//+ 0.1 * distribution(generator);
            this->m_imu_msg.angular_velocity.z = angular_velocity.Z() ;//+ 0.1 * distribution(generator);
            double angular_velocity_variance = 0.01;  // 0.1^2
            this->m_imu_msg.angular_velocity_covariance = {angular_velocity_variance, 0, 0, 
                                                           0, angular_velocity_variance, 0, 
                                                           0, 0, angular_velocity_variance};

            // linear acceleration
            ros::Time current_time = ros::Time::now();
            double dt = (current_time - prev_time).toSec();
            ignition::math::Vector3d current_linear_velocity = this->m_model->WorldLinearVel();
            ignition::math::Vector3d linear_acceleration = (current_linear_velocity - prev_linear_velocity) / dt;  // Using ignition::math::Vector3d
            prev_linear_velocity = current_linear_velocity;
            prev_time = current_time;
            this->m_imu_msg.linear_acceleration.x = linear_acceleration.X();
            this->m_imu_msg.linear_acceleration.y = linear_acceleration.Y();
            this->m_imu_msg.linear_acceleration.z = linear_acceleration.Z();
            double linear_acceleration_variance = 0.01;  // 0.1^2
            this->m_imu_msg.linear_acceleration_covariance = {linear_acceleration_variance, 0, 0, 
                                                              0, linear_acceleration_variance, 0, 
                                                              0, 0, linear_acceleration_variance};

            // Publish the sensor_msgs/Imu message
            this->m_pubIMU.publish(this->m_imu_msg);
        };      
    }; //namespace trafficLight
    GZ_REGISTER_MODEL_PLUGIN(bno055::BNO055)
}; // namespace gazebo

#include "pololu_maestro_ros/set_servo.h"
#include "ros/ros.h"
#include <cstdlib>
#include <chrono>
#include <thread>
#include <string.h>
#include <regex>
#include "std_msgs/String.h"

// Set global condition variables
int steering_angle = 0;
int movement_value = 0;

void chatterCallback(const std_msgs::String::ConstPtr& msg)
{
  // Pull string data
  std::string input = msg->data.c_str();

  std::regex pattern("\\[a:(-?\\d+),s:(-?\\d+)\\]"); // Define regex pattern
  std::smatch matches;

  // Update global variable
  if (std::regex_search(input, matches, pattern)) {
    steering_angle = std::stoi(matches[1]);
    movement_value = std::stoi(matches[2]);
  }
}


int main(int argc, char **argv)
{
  // Set channel vars
  int driver_channel = 1;
  int servo_channel = 0;

  // Initialize node
  ros::init(argc, argv, "set_servo_movement");

  // Create node handle
  ros::NodeHandle n;
  ros::NodeHandle n_pololu;
  ros::ServiceClient client = n_pololu.serviceClient<pololu_maestro_ros::set_servo>("set_servo");

  // Pull steering angle and speed value from publisher
  ros::Subscriber sub = n.subscribe("control_cmd", 1000, chatterCallback);

  while (1){
    // Calculate driver target output
    float driver_temp = movement_value*(-2000/10)+6000;
    int driver_target = static_cast<int>(driver_temp);

    // Calculate servo target output
    float servo_temp = steering_angle*1000/25+6000;
    int servo_target = static_cast<int>(servo_temp);

    // Create and send service request to servo
    pololu_maestro_ros::set_servo srv;
    
    // Send servo signal
    srv.request.channel = servo_channel;
    srv.request.target = servo_target;
    client.call(srv);

    // Create and send service request to wheel motor
    srv.request.channel = driver_channel;
    srv.request.target = driver_target;
    client.call(srv);

    // Check if it works
    std::cout << servo_channel;
    std::cout << "\n";
    std::cout << servo_target;
    std::cout << "\n";
    std::cout << driver_channel;
    std::cout << "\n";
    std::cout << driver_target;

    // Loop the node
    ros::spinOnce();
  }

  return 0;
}


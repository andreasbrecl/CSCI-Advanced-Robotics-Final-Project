#include "pololu_maestro_ros/set_servo.h"
#include "ros/ros.h"
#include <cstdlib>
#include <chrono>
#include <thread>
#include <string.h>


int main(int argc, char **argv)
{

  int driver_channel = 1;
  int servo_channel = 0;
  // convert the angle/movement inputs into integers and capture if we're doing time or distance
  int steering_angle = atoll(argv[1]);
  float movement_value = atof(argv[2]);
  char time_distance = argv[3];
  int driver_target = 0;
  int duration = 0;
  int milliseconds = 1000;
  float scalar = 0.5; 
  //Initialize node
  ros::init(argc, argv, "set_servo_movement");
 
  //Check if channel and target were passed to node
  if (argc != 4)
  {
        ROS_INFO("usage: set_servo_movement steering_angle movement_value time/distance");
        return 1;
  }
  
  //create node handle
  ros::NodeHandle n;
  ros::ServiceClient client = n.serviceClient<pololu_maestro_ros::set_servo>("set_servo");
  
  if (movement_value > 0)
  {
    driver_target = 8000;
  }
  else if(movement_value < 0)
  {
    driver_target = 4000;
  }
  if (strcmp(time_distance, 't') == 0) {
    // if using time
    wait_time = milliseconds*movement_value;
    duration = static_cast<int>(wait_time);
    ...
} else {
    //  not using time
    wait_time = movement_value*scalar*milliseconds;
    duration = static_cast<int>(wait_time);
}

  float servo_temp = steering_angle*22.2;
  int servo_target = static_cast<int>(servo_temp);

  //Create and send service request to servo
  pololu_maestro_ros::set_servo srv;
  srv.request.channel = servo_channel;
  srv.request.target = servo_target;
  client.call(srv);


  //Create and send service request to wheel motor
  pololu_maestro_ros::set_servo srv;
  srv.request.channel = driver_channel;
  srv.request.target = driver_target;
  client.call(srv);
 

  // wait some time
  sleep_for(milliseconds(duration));

  //Create and send service request to servo
  servo_target = 6000;
  driver_target = 6000;
  pololu_maestro_ros::set_servo srv;
  srv.request.channel = servo_channel;
  srv.request.target = servo_target;
  client.call(srv);


  //Create and send service request to wheel motor
  pololu_maestro_ros::set_servo srv;
  srv.request.channel = driver_channel;
  srv.request.target = driver_target;
  client.call(srv);

  return 0;
}


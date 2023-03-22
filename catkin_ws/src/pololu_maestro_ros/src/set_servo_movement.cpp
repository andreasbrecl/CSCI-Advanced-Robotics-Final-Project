#include "pololu_maestro_ros/set_servo.h"
#include "ros/ros.h"
#include <cstdlib>
#include <chrono>
#include <thread>
#include <string.h>


int main(int argc, char **argv)
{


if (argc != 5)
  {
        ROS_INFO("usage: set_servo_movement steering_angle movement_value time/distance direction, usage: Use 0 for Time, 1 for distance, 0 for forward, 1 for backward");

        return 1;
  }
  int driver_channel = 1;
  int servo_channel = 0;
  // convert the angle/movement inputs into integers and capture if we're doing time or distance
  int steering_angle = atoll(argv[1]);
  float movement_value = atof(argv[2]);
  int time_distance = atoll(argv[3]);
  int direction = atof(argv[4]);
  int driver_target = 0;
  int duration = 0;
  int mills = 1000; 
  int wait_time = 0;
  float speed = 2.06; //2.06 m/s
  float scalar = 0.5;
  //Initialize node
  ros::init(argc, argv, "set_servo_movement");
 
  //Check if channel and target were passed to node
  
  
  //create node handle
  ros::NodeHandle n;
  ros::ServiceClient client = n.serviceClient<pololu_maestro_ros::set_servo>("set_servo");
  
  if (direction == 1)
  {
    //backward
    driver_target = 7000;
  }
  else if(direction == 0)
  {
    //forward
    driver_target = 5000;
  }
  if (time_distance == 0) {
    // if using time
    wait_time = mills*movement_value;
    duration = static_cast<int>(wait_time);
} else {
    //  not using time
    wait_time = movement_value*mills/speed   ;
    duration = static_cast<int>(wait_time);
}

  float servo_temp = steering_angle*9 +6000;
  int servo_target = static_cast<int>(servo_temp);

  //Create and send service request to servo
  pololu_maestro_ros::set_servo srv;
  
  
  srv.request.channel = servo_channel;
  srv.request.target = servo_target;
  client.call(srv);


  //Create and send service request to wheel motor
  srv.request.channel = driver_channel;
  srv.request.target = driver_target;
  client.call(srv);
 

  // wait some time
  std::this_thread::sleep_for(std::chrono::milliseconds(duration));

  //Create and send service request to servo
  servo_target = 6000;
  driver_target = 6000;
  srv.request.channel = servo_channel;
  srv.request.target = servo_target;
  client.call(srv);


  //Create and send service request to wheel motor
  srv.request.channel = driver_channel;
  srv.request.target = driver_target;
  client.call(srv);

  return 0;
}


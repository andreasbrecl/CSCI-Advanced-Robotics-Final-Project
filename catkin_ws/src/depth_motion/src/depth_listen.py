#!/usr/bin/env python

"""
This file handles the motion planning logic based on the depth cam output
from the D435 camera. It outputs a angle and a velocity that is then send 
to the servo controller.

Authors: Daniel Mathews, Andreas Brecl

Date: 04/25/2023
"""

import rospy
import cv2
from sensor_msgs.msg import Image as msg_Image
from sensor_msgs.msg import Imu
from sensor_msgs.msg import CameraInfo
from std_msgs.msg import String, Bool
from cv_bridge import CvBridge, CvBridgeError
from tf.transformations import euler_from_quaternion
import numpy as np
import time
import math


class ImageListener:
    def __init__(self, depth_image_topic):
        """
        Constructor for image listener class.
        """

        # Open CV bridge
        self.bridge = CvBridge()

        # Subscribe to camera topic
        self.imu_sub = rospy.Subscriber('/imu/data', Imu, self.imu_callback, queue_size=1)
        self.sub = rospy.Subscriber(depth_image_topic, msg_Image, self.image_depth_callback)
        self.stop_sub = rospy.Subscriber('stop_sign', Bool, self.stop_callback, queue_size=1)

        # Create published topics
        self.pub_cmd = rospy.Publisher('control_cmd', String, queue_size=1)
        self.pub_w = rospy.Publisher('contour_w', String, queue_size=1)
        self.pub_plot = rospy.Publisher('contourPlot', msg_Image, queue_size=1)
        self.diff_angle = rospy.Publisher('control_diff', String, queue_size=1)

        # Define iterators for logic
        self.stop_sign_bool = False
        self.stop_count = 0
        self.count = 0
        self.turn_counter = 0
        self.turn_timer = time.time()
        self.in_turn_bool = False
        self.in_straight_bool = False
        self.hit_obj_bool = False
        self.hit_rev_bool = False
        self.in_wait_bool = False
        self.stop_timer = 0

        # Define IMU variables
        self.imu_yaw_check = 0
        self.imu_yaw_current = 0
        self.imu_yaw_no_block = 0
        self.imu_yaw_block = 0
        self.imu_yaw_block_current = 0
        self.turn_angle = 65

    def imu_callback(self, imu_data):
        """
        Initialize the Imu.
        
        Inputs:  imu_data <array> - Imu data

        Outputs: None
        """
        self.imu_data_current = imu_data
        self.calculate_motion()

    def stop_callback(self, stop_bool):
        """
        Initialize the Imu.
        
        Inputs:  imu_data <array> - Imu data

        Outputs: None
        """
        self.stop_bool = stop_bool
        self.calculate_motion()

    def image_depth_callback(self, data):
        """
        Initialize the image.
        
        Inputs:  data <array> - Image data

        Outputs: None
        """
        self.camera_data_current = data
        self.calculate_motion()

    def calculate_motion(self):
        """
        This function determines the logic for location and motion.

        Inputs:  None

        Outputs: None
        """
        # Check if data is present
        #if self.imu_data_current is None or self.camera_data_current is None or self.stop_bool is None:
        #    return

        try:
            # Convert data image via open cv
            cv_image = self.bridge.imgmsg_to_cv2(self.camera_data_current, self.camera_data_current.encoding)

            # Crop the immage
            #crop_image = cv_image[240:480,0:848]
            crop_image = cv_image[240:360,0:848]
            depth_image = cv2.convertScaleAbs(crop_image, alpha=.02, beta=0)

            # Adjust cv threshold
            ret, thresh = cv2.threshold(depth_image, 127,255,cv2.THRESH_BINARY)

            # Find and draw contour values 
            _, contours, _ = cv2.findContours(thresh, cv2.RETR_EXTERNAL, cv2.CHAIN_APPROX_SIMPLE)
            msgImg = cv2.drawContours(depth_image, contours, -1, (0, 255, 0), 3)

            # Check if contour values exist
            if contours:

                # Pull max value and pull information from its
                c = max(contours, key = cv2.contourArea)
                x,y,w,h = cv2.boundingRect(c)
                center_pt = int(np.floor(x+w/2))
                msgImg = cv2.line(msgImg, (center_pt,0),(center_pt,480),(0,255,0),4)
                contImage = self.bridge.cv2_to_imgmsg(msgImg)

                # Calculate command angle and velocity
                cmdAng = round(-17+(30*int(center_pt)/848)) # degrees min: -25, max: 25
                cmdVel = 3 # velocity min: 0, max: 9

                # Check for stopsign outputs
                print(self.stop_bool)
                if self.stop_bool == True:
                    self.stop_count += 1
                    if self.stop_count > 10:
                        self.stop_sign_bool = True
                else: 
                    self.stop_count = 0

                if self.stop_sign_bool == True and (time.time() - self.stop_timer) > 10:
                    print("Im here1")
                    timer = time.time()
                    while time.time() - timer < 3:
                        cmdAng = 0
                        cmdVel = 0
                        self.sendCommand(cmdAng, cmdVel, contImage, w, 'NA')
                    self.stop_timer = time.time()
                    self.stop_sign_bool = False
                    self.stop_count = 0
                    self.in_straight_bool = False
                    self.in_turn_bool = False

                # Handle straight condition
                if self.in_straight_bool == True:
                    print("Im here2")
                    # Set speed values
                    cmdVel = 3

                    # Check if time has passed
                    if (time.time() - self.turn_timer) < .6:
                        
                        # Send command
                        cmdAng = 0
                        self.sendCommand(cmdAng, cmdVel, contImage, w, 'NA')

                    else:

                        # Reset boolean values
                        self.in_straight_bool = False
                        self.in_turn_bool = True

                        # Pull current IMU data
                        quaternion = (
                            self.imu_data_current.orientation.x,
                            self.imu_data_current.orientation.y,
                            self.imu_data_current.orientation.z,
                            self.imu_data_current.orientation.w
                        )
                        _, _, yaw = euler_from_quaternion(quaternion)
                        yaw = math.degrees(yaw)
                        self.imu_yaw_check = yaw

                        # Send turn command
                        cmdAng = 15
                        self.sendCommand(cmdAng, cmdVel, contImage, w, 'NA')

                # Handle turn condition
                elif self.in_turn_bool == True:
                    print("Im here3")
                    # Set speed values
                    cmdVel = 3

                    # Check current angle
                    quaternion = (
                        self.imu_data_current.orientation.x,
                        self.imu_data_current.orientation.y,
                        self.imu_data_current.orientation.z,
                        self.imu_data_current.orientation.w
                    )
                    _, _, yaw = euler_from_quaternion(quaternion)
                    yaw = math.degrees(yaw)
                    self.imu_yaw_current = yaw

                    # Check if can has fully turned
                    diff = abs((self.imu_yaw_current - self.imu_yaw_check + 180) % 360 - 180)
                    if diff > self.turn_angle:

                        # Send straight command and reset boolean
                        self.in_turn_bool = False
                        cmdAng = 0
                        self.sendCommand(cmdAng, cmdVel, contImage, w, str(diff))

                    else:
                        
                        # Send turn command
                        cmdAng = 15
                        self.sendCommand(cmdAng, cmdVel, contImage, w, str(diff))

                # Check if vehicle is approaching wall
                elif w < 100:
                    print("Im here4")
                    # Set speed values
                    cmdVel = 3

                    # Iterate counter
                    self.count += 1

                    # Check if wall conditions is met
                    if self.count > 2:
                            
                        # Set straight to true
                        self.turn_timer = time.time()
                        self.in_straight_bool = True

                        # Send commmand
                        cmdAng = 0
                        self.sendCommand(cmdAng, cmdVel, contImage, w, 'NA')

                        # Reset counter
                        self.count = 0

                    # If not near wall operate normal operation
                    else:
                        print("Im here5")
                        # Send movement command
                        self.sendCommand(cmdAng, cmdVel, contImage, w, 'NA')

                # Normal operations
                else:
                    # Set speed values
                    cmdVel = 3

                    # Send movement command
                    self.sendCommand(cmdAng, cmdVel, contImage, w, 'NA')

        except CvBridgeError as e:
            print(e)
            return
        except ValueError as e:
            return

    def sendCommand(self, cmdAng, cmdVel, contImage, w, diff):
        """
        This function handels sending commands for angle and velocity

        Inputs:  cmdAng <float> - Turn angle of vehicle
                 cmdVel <float> - Velocity of vehicle
                 contImage <array> - Contour plot during time
                 w <int> - Width value of contour

        Outputs: None
        """
        # Create string message
        control_str = '[a:%d,s:%d]' % (cmdAng, cmdVel)

        # Publish topics
        self.pub_cmd.publish(control_str)
        self.pub_w.publish(str(w))
        self.pub_plot.publish(contImage)
        self.diff_angle.publish(diff)

def main():
    """
    This initalize the functionality of the file.

    Inputs:  None

    Outputs: None
    """

    # Define depth topic
    depth_image_topic = '/camera/depth/image_rect_raw'

    # Send indiciation of mode starding
    print ('')
    print ('Starting Depth MP Node...')
    print ('--------------------')

    # Create image object
    listener = ImageListener(depth_image_topic)
    
    # Spin ros functionality
    rospy.spin()

if __name__ == '__main__':
    rospy.init_node('depth_listener')
    main()
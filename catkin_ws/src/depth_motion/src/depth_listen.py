#!/usr/bin/env python

"""
This file handles the motion planning logic based on the depth cam output
from the D450 camera. It outputs a angle and a velocity that is then send 
to the servo controller.

Authors: Daniel Mathews, Andreas Brecl

Date: 04/25/2023
"""

import rospy
import cv2
from sensor_msgs.msg import Image as msg_Image
from sensor_msgs.msg import CameraInfo
from std_msgs.msg import String
from cv_bridge import CvBridge, CvBridgeError
import numpy as np
import time


class ImageListener:
    def __init__(self, depth_image_topic):
        """
        Constructor for image listener class.
        """

        # Open CV bridge
        self.bridge = CvBridge()

        # Subscribe to camera topic
        self.sub = rospy.Subscriber(depth_image_topic, msg_Image, self.imageDepthCallback)

        # Create published topics
        self.pub_cmd = rospy.Publisher('control_cmd', String, queue_size=1)
        self.pub_w = rospy.Publisher('contour_w', String, queue_size=1)
        self.pub_depth = rospy.Publisher('contourDepth', String, queue_size=1)
        self.pub_plot = rospy.Publisher('contourPlot', msg_Image, queue_size=1)

        # Define iterators for logic
        self.count = 0
        self.w_check_bool = False

    def imageDepthCallback(self, data):
        """
        This function determines the logic for location and motion.

        Inputs:  data <array> - Depth image information from D450

        Outputs: None
        """
        try:
            # Convert data image via open cv
            cv_image = self.bridge.imgmsg_to_cv2(data, data.encoding)

            # Crop the immage
            crop_image = cv_image[240:480,0:848]
            depth_image = cv2.convertScaleAbs(crop_image, alpha=.02, beta=0)

            # Adjust cv threshold
            ret, thresh = cv2.threshold(depth_image, 127,255,cv2.THRESH_BINARY)

            # Find and draw contour values 
            _, contours, _ = cv2.findContours(thresh, cv2.RETR_EXTERNAL, cv2.CHAIN_APPROX_SIMPLE)
            msgImg = cv2.drawContours(depth_image, contours, -1, (0, 255, 0), 3)

            # Check if contour values exist
            if contours:

                # Pull max value and pull information from it
                c = max(contours, key = cv2.contourArea)
                x,y,w,h = cv2.boundingRect(c)
                center_pt = int(np.floor(x+w/2))
                msgImg = cv2.line(msgImg, (center_pt,0),(center_pt,480),(0,255,0),4)
                contImage = self.bridge.cv2_to_imgmsg(msgImg)

                # Calculate command angle and velocity
                cmdAng = round(-15+(30*int(center_pt)/848)) # degrees min: -25, max: 25
                cmdVel = 3 # velocity min: 0, max: 9

                # Check if vehicle is approaching wall
                if w < 100 and (len(cv_image[355:365,(center_pt-5):(center_pt+5)]) != 0):
                    self.pub_depth.publish(str(np.mean(cv_image[355:365,(center_pt-5):(center_pt+5)])))
                    # Check if the depth is greater than 1.5m
                    if np.mean(cv_image[355:365,(center_pt-5):(center_pt+5)]) > 1500:
                        cmdAng = round(-30+(60*int(center_pt)/848))
                        cmdVel = 2
                        self.sendCommand(cmdAng, cmdVel, contImage, w)
                    # If not greater than 2m, go into turn logic
                    else:
                        # Iterate counter
                        self.count += 1

                        # See if turn just occured 
                        if self.w_check_bool == False:

                            # Check if close value is not random
                            if self.count > 2:

                                # Go straight for time before turning
                                startTime = time.time()
                                while time.time() - startTime < .3:
                                    cmdAng = 0
                                    self.sendCommand(cmdAng, cmdVel, contImage, w)
                                
                                # Seconds turn time
                                startTime = time.time()
                                while time.time() - startTime < .75:
                                
                                    # Command turn
                                    cmdAng = 15
                                    self.sendCommand(cmdAng, cmdVel, contImage, w)
                                
                                # Reset turn logic variables
                                self.count = 0
                                self.w_check_bool = True

                            # If close value check not passed act normal
                            else:
                                self.sendCommand(cmdAng, cmdVel, contImage, w)

                        # If turn condition just happened turn normally
                        else:
                            self.sendCommand(cmdAng, cmdVel, contImage, w)

                # If not near wall operate normal operation
                else:

                    # Reset turn condition if hallway is seen
                    if w > 150:
                        self.w_check_bool = False
                    self.count = 0

                    # Send movement command
                    self.sendCommand(cmdAng, cmdVel, contImage, w)

        except CvBridgeError as e:
            print(e)
            return
        except ValueError as e:
            return

    def sendCommand(self, cmdAng, cmdVel, contImage, w):
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
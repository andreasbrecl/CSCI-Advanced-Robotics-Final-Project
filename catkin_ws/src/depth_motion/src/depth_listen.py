#!/usr/bin/env python

import rospy
import cv2
from sensor_msgs.msg import Image as msg_Image
from sensor_msgs.msg import CameraInfo
from std_msgs.msg import String
from cv_bridge import CvBridge, CvBridgeError
import sys
import numpy as np
import time

class ImageListener:
    def __init__(self, depth_image_topic, depth_info_topic):
        self.bridge = CvBridge()
        self.sub = rospy.Subscriber(depth_image_topic, msg_Image, self.imageDepthCallback)
        self.pub_cmd = rospy.Publisher('control_cmd', String, queue_size=1)
        self.pub_plot = rospy.Publisher('contourPlot', msg_Image, queue_size=1)
        confidence_topic = depth_image_topic.replace('depth', 'confidence')
        self.sub_conf = rospy.Subscriber(confidence_topic, msg_Image, self.confidenceCallback)
        self.intrinsics = None
        self.pix = None
        self.pix_grade = None

    def imageDepthCallback(self, data):
        try:
            cv_image = self.bridge.imgmsg_to_cv2(data, data.encoding)

            depth_image = cv2.convertScaleAbs(cv_image, alpha=.02, beta=0)

            ret, thresh = cv2.threshold(depth_image, 127,255,cv2.THRESH_BINARY)

            _, contours, _ = cv2.findContours(thresh, cv2.RETR_EXTERNAL, cv2.CHAIN_APPROX_SIMPLE)
            msgImg = cv2.drawContours(depth_image, contours, -1, (0, 255, 0), 3)

            if contours:
                c = max(contours, key = cv2.contourArea)
                x,y,w,h = cv2.boundingRect(c)
                center_pt = int(np.floor(x+w/2))
                msgImg = cv2.line(msgImg, (center_pt,0),(center_pt,400),(0,255,0),4)
                contImage = self.bridge.cv2_to_imgmsg(msgImg)

                cmdAng = round(-15+(30*int(center_pt)/848)) # degrees min: -25, max: 25
                cmdVel = 2 # velocity min: 0, max: 9
                if w > 700:
                    cmdAng = cmdAng + 15
                    startTime = time.time()
                    while time.time() - startTime < 2.0:
                        control_str = '[a:%d,s:%d]' % (cmdAng, cmdVel)
                        self.pub_cmd.publish(control_str)
                        self.pub_plot.publish(contImage)
                else:
                    control_str = '[a:%d,s:%d]' % (cmdAng, cmdVel)
                    self.pub_cmd.publish(control_str)
                    self.pub_plot.publish(contImage)

        except CvBridgeError as e:
            print(e)
            return
        except ValueError as e:
            return

    def confidenceCallback(self, data):
        try:
            cv_image = self.bridge.imgmsg_to_cv2(data, data.encoding)
            grades = np.bitwise_and(cv_image >> 4, 0x0f)
            if (self.pix):
                self.pix_grade = grades[self.pix[1], self.pix[0]]
        except CvBridgeError as e:
            print(e)
            return

def main():
    depth_image_topic = '/camera/depth/image_rect_raw'
    depth_info_topic = '/camera/depth/camera_info'

    print ('')
    print ('return_depth.py')
    print ('--------------------')
    print ('App to demontrate the usage of the /camera/depth topics.')

    listener = ImageListener(depth_image_topic, depth_info_topic)
    rospy.spin()

if __name__ == '__main__':
    rospy.init_node('depth_listener')
    main()
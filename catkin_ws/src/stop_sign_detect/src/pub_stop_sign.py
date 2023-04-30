#!/usr/bin/env python

import rospy
import cv2
import numpy as np
from cv_bridge import CvBridge
from sensor_msgs.msg import Image

def stop_sign_pub():
    pub = rospy.Publisher('image_raw', Image, queue_size=10)
    rospy.init_node('stop_sign_pub', anonymous=True)
    rate = rospy.Rate(1)
    while not rospy.is_shutdown():
        # hello_str = "hello world %s" % rospy.get_time()
        bridge = CvBridge()
        image_path = np.random.choice(["/mnt/d/School/Robotics/CSCI-Advanced-Robotics-Final-Project/catkin_ws/src/stop_sign_detect/src/stop.jpg", 
                                       "/mnt/d/School/Robotics/CSCI-Advanced-Robotics-Final-Project/catkin_ws/src/stop_sign_detect/src/Blank_Square.jpg"])
        image_path = "/mnt/d/School/Robotics/CSCI-Advanced-Robotics-Final-Project/catkin_ws/src/stop_sign_detect/src/stop.jpg"
        stop_sign = cv2.imread(image_path)

        if not stop_sign.any():
            print(type(stop_sign))
            print("check image path")

        image_message = bridge.cv2_to_imgmsg(stop_sign, encoding="bgr8")
        pub.publish(image_message)
        rate.sleep()

if __name__ == '__main__':
    try:
        stop_sign_pub()
    except rospy.ROSInterruptException:
        pass
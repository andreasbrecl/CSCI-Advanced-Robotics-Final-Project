#!/usr/bin/env python

import rospy
import cv2
import numpy as np
from cv_bridge import CvBridge
from sensor_msgs.msg import Image

def stop_sign_pub():
    pub = rospy.Publisher('stop_sign', Image, queue_size=10)
    rospy.init_node('stop_sign_pub', anonymous=True)
    rate = rospy.Rate(1)
    while not rospy.is_shutdown():
        # hello_str = "hello world %s" % rospy.get_time()
        bridge = CvBridge()
        image_path = np.random.choice(["/mnt/c/Users/bencs/Documents/Robotics/CSCI-Advanced-Robotics-Final-Project/catkin_ws/src/stop_sign_detect/src/stop.jpg", 
                                       "/mnt/c/Users/bencs/Documents/Robotics/CSCI-Advanced-Robotics-Final-Project/catkin_ws/src/stop_sign_detect/src/Blank_Square.jpg"])
        print(image_path)
        stop_sign = cv2.imread(image_path)
        # cv2.imshow("win", stop_sign)
        image_message = bridge.cv2_to_imgmsg(stop_sign, encoding="bgr8")
        # rospy.loginfo(hello_str)
        pub.publish(image_message)
        rate.sleep()

if __name__ == '__main__':
    try:
        stop_sign_pub()
        # image_path = r"/mnt/c/Users/bencs/Documents/Robotics/CSCI-Advanced-Robotics-Final-Project/catkin_ws/src/stop_sign_detect/src/stop.jpg"
        # stop_sign = cv2.imread(image_path)
        # cv2.imshow("win", stop_sign)
        # cv2.waitKey(0)
        # cv2.destroyAllWindows()
    except rospy.ROSInterruptException:
        pass
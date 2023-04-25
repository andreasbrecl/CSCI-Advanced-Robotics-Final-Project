#!/usr/bin/env python2

import rospy
import cv2
import numpy as np
from sensor_msgs.msg import Image
from cv_bridge import CvBridge, CvBridgeError

class StopSignDetector:
    def __init__(self):
        self.bridge = CvBridge()
        # self.image_sub = rospy.Subscriber("/camera/color/image_raw", Image, self.callback)
        self.image_sub = rospy.Subscriber("stop_sign", Image, self.callback)

    def callback(self, data):
        try:
            cv_image = self.bridge.imgmsg_to_cv2(data, "bgr8")
        except CvBridgeError as e:
            print(e)

        stop_sign_detected = self.detect_stop_sign(cv_image)

        if stop_sign_detected:
            rospy.loginfo("Stop sign detected: True")
        else:
            rospy.loginfo("Stop sign detected: False")

    def detect_stop_sign(self, img):
        # Load stop sign cascade file
        # stop_cascade = cv2.CascadeClassifier('path/to/stop_sign_cascade.xml')

        # # Convert image to grayscale
        # gray = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)

        # Detect stop signs in the image
        # stop_signs = stop_cascade.detectMultiScale(gray, scaleFactor=1.1, minNeighbors=5, minSize=(30, 30))
        red_lower = (50, 0, 0)
        red_upper = (255, 150, 150)
        mask = cv2.inRange(img, red_lower, red_upper)
        cv2.imshow("Win", mask)
        # mask = cv2.erode(mask, None, iterations=0)
        # mask = cv2.dilate(mask, None, iterations=0)
        # frame = cv2.bitwise_and(frame,frame,mask = mask)
        # Set up the SimpleBlobDetector with default parameters
        params = cv2.SimpleBlobDetector_Params()

        # Set the threshold
        params.minThreshold = 10
        params.maxThreshold = 200

        # # Set the area filter
        params.filterByArea = True
        params.minArea = 100
        params.maxArea = 1000

        # # Set the circularity filter
        params.filterByCircularity = True
        params.minCircularity = 0.1
        params.maxCircularity = 1

        # # Set the convexity filter
        params.filterByConvexity = True
        params.minConvexity = 0.87
        params.maxConvexity = 1

        # # Set the inertia filter
        # params.filterByInertia = True
        # params.minInertiaRatio = 0.01
        # params.maxInertiaRatio = 1

        detector = cv2.SimpleBlobDetector_create()
        keypoints = detector.detect(img)
        # print(keypoints)
        blank = np.zeros((1,1))
        blobs = cv2.drawKeypoints(img, keypoints, blank, (0,255,255), cv2.DRAW_MATCHES_FLAGS_DEFAULT)
        cv2.imshow("blobs", blobs)
        return len(keypoints) > 0
        # Check if stop signs were detected
        # if len(stop_signs) > 0:
        #     return True
        # else:
        #     return False

def main():
    rospy.init_node('stop_sign_detector', anonymous=True)
    detector = StopSignDetector()
    try:
        rospy.spin()
    except KeyboardInterrupt:
        print("Shutting down")

if __name__ == '__main__':
    main()
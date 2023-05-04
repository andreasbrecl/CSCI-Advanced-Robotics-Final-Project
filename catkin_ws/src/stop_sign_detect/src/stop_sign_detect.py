#!/usr/bin/env python2

import rospy
import cv2
import numpy as np
from sensor_msgs.msg import Image
from std_msgs.msg import Bool
from cv_bridge import CvBridge, CvBridgeError

pub = rospy.Publisher('stop_sign', Bool, queue_size=10)

def detect(img):
    debug = False
    mode = "dog"
    
    bridge = CvBridge()

    try:
        cv_image = bridge.imgmsg_to_cv2(img, "bgr8")
    except CvBridgeError as e:
        print(e)

    # mask only red pixels
    red_lower = np.array([0, 0, 50]) # BGR
    red_upper = np.array([150, 150, 255]) # BGR
    mask = cv2.inRange(cv_image, red_lower, red_upper)
    detected_output = cv2.bitwise_and(cv_image, cv_image, mask=mask)

    # difference of gaussians
    if mode == "lap":
        blobs_log = cv2.Laplacian(detected_output, cv2.CV_64F)
        processed = np.uint8(np.absolute(blobs_log))
    elif mode == "dog":
        processed = cv2.GaussianBlur(detected_output, (5,5), 0) - cv2.GaussianBlur(detected_output, (15,15), 0)
    
    kernel = np.ones((5, 5), np.uint8)
    processed = cv2.dilate(processed, kernel, iterations=0)

    if debug:
        cv2.imshow("processed", processed)
        cv2.waitKey()
        cv2.destroyAllWindows()

    # Set up the SimpleBlobDetector with default parameters
    params = cv2.SimpleBlobDetector_Params()

    # params.filterByColor = True
    # params.blobColor = 0

    # Set the threshold
    params.minThreshold = 0
    params.maxThreshold = 255

    # # Set the area filter
    params.filterByArea = True
    scale = 0.3
    height = processed.shape[0]
    width = processed.shape[1]
    size = height * width
    params.minArea = size*scale
    print(size*scale)
    params.maxArea = np.inf

    # Set the circularity filter
    params.filterByCircularity = True
    params.minCircularity = .3
    params.maxCircularity = 1

    # Set the convexity filter
    params.filterByConvexity = True
    params.minConvexity = 0.2
    params.maxConvexity = 1

    # Set the inertia filter
    params.filterByInertia = True
    params.minInertiaRatio = 0.1
    params.maxInertiaRatio = 1

    detector = cv2.SimpleBlobDetector_create(params)
    keypoints = detector.detect(processed)
    
    if debug:
        blobs = cv2.drawKeypoints(cv_image, keypoints, np.array([]), (0,255,255), cv2.DRAW_MATCHES_FLAGS_DRAW_RICH_KEYPOINTS)
        cv2.imshow("blobs", blobs)
        cv2.waitKey()
        cv2.destroyAllWindows()

    pub.publish(Bool(len(keypoints) > 0))


def stop_sign_detector():
    rospy.init_node('stop_sign_detector', anonymous=True)
    sub = rospy.Subscriber("image_raw", Image, detect)
    while not rospy.is_shutdown():
        rospy.spin()


def main():
    try:
        stop_sign_detector()
    except rospy.ROSInterruptException:
        pass

if __name__ == '__main__':
    main()
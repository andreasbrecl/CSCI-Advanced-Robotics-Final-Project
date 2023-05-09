#!/usr/bin/env python2

import rospy
import cv2
import numpy as np
from sensor_msgs.msg import Image
from std_msgs.msg import Bool
from cv_bridge import CvBridge, CvBridgeError

debug = True
pub = rospy.Publisher('stop_sign', Bool, queue_size=1)
if debug:
    fourcc = cv2.VideoWriter_fourcc(*'DIVX')
    video = cv2.VideoWriter('video.avi', fourcc, 30, (640,480))
 
def detect(img):
    mode = "none"
    
    bridge = CvBridge()

    try:
        cv_image = bridge.imgmsg_to_cv2(img, "bgr8")
        img_scale = 0.35
        cv_image = cv2.resize(cv_image, (int(cv_image.shape[1]*img_scale), int(cv_image.shape[0]*img_scale)))
    except CvBridgeError as e:
        print(e)

    # mask only red pixels
    red_lower = np.array([0, 0, 130]) # BGR
    red_upper = np.array([120, 120, 255]) # BGR
    mask = cv2.inRange(cv_image, red_lower, red_upper)

    processed = mask
    kernel = np.array([
        [0, 1, 1, 0],
        [1, 1, 1, 1],
        [1, 1, 1, 1],
        [0, 1, 1, 0],
        ], dtype=np.uint8)
    processed = cv2.erode(processed, kernel, iterations=1)
    processed = cv2.dilate(processed, kernel, iterations=3)
    processed = cv2.erode(processed, kernel, iterations=5)
    processed = cv2.dilate(processed, kernel, iterations=7)

    # difference of gaussians
    if mode == "lap":
        blobs_log = cv2.Laplacian(processed, cv2.CV_64F)
        processed = np.uint8(np.absolute(blobs_log))
    elif mode == "dog":
        processed = cv2.GaussianBlur(processed, (5,5), 0) - cv2.GaussianBlur(processed, (15,15), 0)
    
    # Set up the SimpleBlobDetector with default parameters
    params = cv2.SimpleBlobDetector_Params()

    params.filterByColor = True
    params.blobColor = 255

    # Set the threshold
    params.minThreshold = 0
    params.maxThreshold = 255

    # # Set the area filter
    params.filterByArea = True
    min_scale = 0.015
    max_scale = 1
    size = processed.shape[0] * processed.shape[1]
    params.minArea = size*min_scale
    params.maxArea = size*max_scale

    # Set the circularity filter
    params.filterByCircularity = True
    params.minCircularity = .4
    params.maxCircularity = 1

    # Set the convexity filter
    params.filterByConvexity = False
    params.minConvexity = 0.2
    params.maxConvexity = 1

    # Set the inertia filter
    params.filterByInertia = False
    params.minInertiaRatio = 0.15
    params.maxInertiaRatio = 1

    detector = cv2.SimpleBlobDetector_create(params)
    keypoints = detector.detect(processed)
    
    if debug:
        blobs = cv2.drawKeypoints(cv_image, keypoints, np.array([]), (0,255,255), cv2.DRAW_MATCHES_FLAGS_DRAW_RICH_KEYPOINTS)
        video.write(blobs)
        # print(rospy.get_time())
        cv2.imshow("processed ", processed)
        cv2.imshow("blobs ", blobs)
        cv2.waitKey(1)

    pub.publish(Bool(len(keypoints) > 0))


def stop_sign_detector():
    rospy.init_node('stop_sign_detector', anonymous=True)
    sub = rospy.Subscriber("camera/color/image_raw", Image, detect)
    print("stop_sign_detect setup DONE")
    while not rospy.is_shutdown():
        rospy.spin()
    if debug: video.release()


def main():
    try:
        stop_sign_detector()
    except rospy.ROSInterruptException:
        pass

if __name__ == '__main__':
    main()
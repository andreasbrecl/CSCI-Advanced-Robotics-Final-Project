import rospy
import cv2
from sensor_msgs.msg import Image as msg_Image
from sensor_msgs.msg import CameraInfo
from std_msgs.msg import String
from cv_bridge import CvBridge, CvBridgeError
import sys
import numpy as np

class ImageListener:
    def __init__(self, depth_image_topic, depth_info_topic):
        self.bridge = CvBridge()
        self.sub = rospy.Subscriber(depth_image_topic, msg_Image, self.imageDepthCallback)
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

            if contours: 
                c = max(contours, key = cv2.contourArea)
                x,y,w,h = cv2.boundingRect(c)
                center_pt = np.floor((x+w)/2)
                cmdAng = -25+(50/255)*center_pt # degrees min: -25, max: 25

            cmdVel = 5 # velocity min: 0, max: 9

            sys.stdout.write('Published Command: V: '+str(cmdVel)+' Angle: '+str(cmdAng)+'\n')
            sys.stdout.flush()
            control_str = '[a:%1d,s:%1d]' % (cmdAng, cmdVel)
            pub = rospy.Publisher('control_cmd', String, queue_size=1)
            pub.publish(control_str)

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
    print ('show_center_depth.py')
    print ('--------------------')
    print ('App to demontrate the usage of the /camera/depth topics.')

    listener = ImageListener(depth_image_topic, depth_info_topic)
    rospy.spin()

if __name__ == '__main__':
    rospy.init_node('depth_listener')
    main()
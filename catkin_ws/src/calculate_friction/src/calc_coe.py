#!/usr/bin/env python

"""
This file will calculate the coefficient of friction that the robot car
feels while running.

Authors: Andreas Brecl

Date: 04/30/2023
"""

import rospy
from sensor_msgs.msg import Imu
from std_msgs.msg import String
from std_msgs.msg import Float64
import numpy as np

class CoefficientCalculator:
    def __init__(self):
        """
        Constructor for coe calc class.
        """

        # Init the node
        rospy.init_node('friction_coefficient_calculator')
        
        # Define the subscriber and publisher
        self.imu_sub = rospy.Subscriber('/imu/data', Imu, self.imu_callback)
        self.friction_coeff_pub = rospy.Publisher('/friction_coefficient', Float64, queue_size=1)
        
        # Define mass
        self.mass = 1.5  # Vehicle mass in kg
        self.g = 9.81  # Acceleration due to gravity in m/s^2

    def imu_callback(self, imu_data):
        """
        This function calculates the coefficient values.

        Inputs:  data <arra> - IMU data

        Outputs: None
        """
        ax = imu_data.linear_acceleration.x
        ay = imu_data.linear_acceleration.y

        Fx = self.mass * ax
        Fy = self.mass * ay

        Ft = (Fx ** 2 + Fy ** 2) ** 0.5
        Fn = self.mass * self.g

        friction_coefficient = Ft / Fn
        friction_coeff_msg = Float64()
        friction_coeff_msg.data = friction_coefficient

        self.friction_coeff_pub.publish(friction_coeff_msg)

    def run(self):
        rospy.spin()

if __name__ == '__main__':
    try:
        calculator = CoefficientCalculator()
        calculator.run()
    except rospy.ROSInterruptException:
        pass

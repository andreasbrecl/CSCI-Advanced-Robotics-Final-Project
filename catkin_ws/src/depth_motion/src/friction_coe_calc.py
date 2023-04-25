#!/usr/bin/env python

import rospy
from std_msgs.msg import String
import sys
import numpy as np

class FrictionCoefficientCalculator:
    def __init__(self):
        rospy.init_node('friction_coefficient_calculator')
        
        self.imu_sub = rospy.Subscriber('/imu/data', Imu, self.imu_callback)
        self.friction_coeff_pub = rospy.Publisher('/friction_coefficient', Float64, queue_size=1)
        
        self.mass = 2.5 # Vehicle mass in kg
        self.g = 9.81  # Acceleration due to gravity in m/s^2

    def imu_callback(self, imu_data):
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
        calculator = FrictionCoefficientCalculator()
        calculator.run()
    except rospy.ROSInterruptException:
        pass
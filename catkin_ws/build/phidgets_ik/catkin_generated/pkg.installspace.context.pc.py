# generated from catkin/cmake/template/pkg.context.pc.in
CATKIN_PACKAGE_PREFIX = ""
PROJECT_PKG_CONFIG_INCLUDE_DIRS = "${prefix}/include".split(';') if "${prefix}/include" != "" else []
PROJECT_CATKIN_DEPENDS = "nodelet;phidgets_api;phidgets_msgs;pluginlib;roscpp;sensor_msgs;std_msgs".replace(';', ' ')
PKG_CONFIG_LIBRARIES_WITH_PREFIX = "-lphidgets_ik".split(';') if "-lphidgets_ik" != "" else []
PROJECT_NAME = "phidgets_ik"
PROJECT_SPACE_DIR = "/home/odroid/Code/catkin_ws/install"
PROJECT_VERSION = "0.7.11"
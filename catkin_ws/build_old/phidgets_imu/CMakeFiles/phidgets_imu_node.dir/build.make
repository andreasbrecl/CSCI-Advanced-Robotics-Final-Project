# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.10

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/odroid/Code/catkin_ws/src

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/odroid/Code/catkin_ws/build

# Include any dependencies generated for this target.
include phidgets_imu/CMakeFiles/phidgets_imu_node.dir/depend.make

# Include the progress variables for this target.
include phidgets_imu/CMakeFiles/phidgets_imu_node.dir/progress.make

# Include the compile flags for this target's objects.
include phidgets_imu/CMakeFiles/phidgets_imu_node.dir/flags.make

phidgets_imu/CMakeFiles/phidgets_imu_node.dir/src/phidgets_imu_node.cpp.o: phidgets_imu/CMakeFiles/phidgets_imu_node.dir/flags.make
phidgets_imu/CMakeFiles/phidgets_imu_node.dir/src/phidgets_imu_node.cpp.o: /home/odroid/Code/catkin_ws/src/phidgets_imu/src/phidgets_imu_node.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/odroid/Code/catkin_ws/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object phidgets_imu/CMakeFiles/phidgets_imu_node.dir/src/phidgets_imu_node.cpp.o"
	cd /home/odroid/Code/catkin_ws/build/phidgets_imu && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/phidgets_imu_node.dir/src/phidgets_imu_node.cpp.o -c /home/odroid/Code/catkin_ws/src/phidgets_imu/src/phidgets_imu_node.cpp

phidgets_imu/CMakeFiles/phidgets_imu_node.dir/src/phidgets_imu_node.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/phidgets_imu_node.dir/src/phidgets_imu_node.cpp.i"
	cd /home/odroid/Code/catkin_ws/build/phidgets_imu && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/odroid/Code/catkin_ws/src/phidgets_imu/src/phidgets_imu_node.cpp > CMakeFiles/phidgets_imu_node.dir/src/phidgets_imu_node.cpp.i

phidgets_imu/CMakeFiles/phidgets_imu_node.dir/src/phidgets_imu_node.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/phidgets_imu_node.dir/src/phidgets_imu_node.cpp.s"
	cd /home/odroid/Code/catkin_ws/build/phidgets_imu && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/odroid/Code/catkin_ws/src/phidgets_imu/src/phidgets_imu_node.cpp -o CMakeFiles/phidgets_imu_node.dir/src/phidgets_imu_node.cpp.s

phidgets_imu/CMakeFiles/phidgets_imu_node.dir/src/phidgets_imu_node.cpp.o.requires:

.PHONY : phidgets_imu/CMakeFiles/phidgets_imu_node.dir/src/phidgets_imu_node.cpp.o.requires

phidgets_imu/CMakeFiles/phidgets_imu_node.dir/src/phidgets_imu_node.cpp.o.provides: phidgets_imu/CMakeFiles/phidgets_imu_node.dir/src/phidgets_imu_node.cpp.o.requires
	$(MAKE) -f phidgets_imu/CMakeFiles/phidgets_imu_node.dir/build.make phidgets_imu/CMakeFiles/phidgets_imu_node.dir/src/phidgets_imu_node.cpp.o.provides.build
.PHONY : phidgets_imu/CMakeFiles/phidgets_imu_node.dir/src/phidgets_imu_node.cpp.o.provides

phidgets_imu/CMakeFiles/phidgets_imu_node.dir/src/phidgets_imu_node.cpp.o.provides.build: phidgets_imu/CMakeFiles/phidgets_imu_node.dir/src/phidgets_imu_node.cpp.o


# Object files for target phidgets_imu_node
phidgets_imu_node_OBJECTS = \
"CMakeFiles/phidgets_imu_node.dir/src/phidgets_imu_node.cpp.o"

# External object files for target phidgets_imu_node
phidgets_imu_node_EXTERNAL_OBJECTS =

/home/odroid/Code/catkin_ws/devel/lib/phidgets_imu/phidgets_imu_node: phidgets_imu/CMakeFiles/phidgets_imu_node.dir/src/phidgets_imu_node.cpp.o
/home/odroid/Code/catkin_ws/devel/lib/phidgets_imu/phidgets_imu_node: phidgets_imu/CMakeFiles/phidgets_imu_node.dir/build.make
/home/odroid/Code/catkin_ws/devel/lib/phidgets_imu/phidgets_imu_node: /opt/ros/melodic/lib/libdiagnostic_updater.so
/home/odroid/Code/catkin_ws/devel/lib/phidgets_imu/phidgets_imu_node: /opt/ros/melodic/lib/libnodeletlib.so
/home/odroid/Code/catkin_ws/devel/lib/phidgets_imu/phidgets_imu_node: /opt/ros/melodic/lib/libbondcpp.so
/home/odroid/Code/catkin_ws/devel/lib/phidgets_imu/phidgets_imu_node: /usr/lib/arm-linux-gnueabihf/libuuid.so
/home/odroid/Code/catkin_ws/devel/lib/phidgets_imu/phidgets_imu_node: /opt/ros/melodic/lib/libclass_loader.so
/home/odroid/Code/catkin_ws/devel/lib/phidgets_imu/phidgets_imu_node: /usr/lib/libPocoFoundation.so
/home/odroid/Code/catkin_ws/devel/lib/phidgets_imu/phidgets_imu_node: /usr/lib/arm-linux-gnueabihf/libdl.so
/home/odroid/Code/catkin_ws/devel/lib/phidgets_imu/phidgets_imu_node: /opt/ros/melodic/lib/libroslib.so
/home/odroid/Code/catkin_ws/devel/lib/phidgets_imu/phidgets_imu_node: /opt/ros/melodic/lib/librospack.so
/home/odroid/Code/catkin_ws/devel/lib/phidgets_imu/phidgets_imu_node: /usr/lib/arm-linux-gnueabihf/libpython2.7.so
/home/odroid/Code/catkin_ws/devel/lib/phidgets_imu/phidgets_imu_node: /usr/lib/arm-linux-gnueabihf/libboost_program_options.so
/home/odroid/Code/catkin_ws/devel/lib/phidgets_imu/phidgets_imu_node: /usr/lib/arm-linux-gnueabihf/libtinyxml2.so
/home/odroid/Code/catkin_ws/devel/lib/phidgets_imu/phidgets_imu_node: /home/odroid/Code/catkin_ws/devel/lib/libphidget21.so
/home/odroid/Code/catkin_ws/devel/lib/phidgets_imu/phidgets_imu_node: /opt/ros/melodic/lib/libroscpp.so
/home/odroid/Code/catkin_ws/devel/lib/phidgets_imu/phidgets_imu_node: /usr/lib/arm-linux-gnueabihf/libboost_filesystem.so
/home/odroid/Code/catkin_ws/devel/lib/phidgets_imu/phidgets_imu_node: /opt/ros/melodic/lib/librosconsole.so
/home/odroid/Code/catkin_ws/devel/lib/phidgets_imu/phidgets_imu_node: /opt/ros/melodic/lib/librosconsole_log4cxx.so
/home/odroid/Code/catkin_ws/devel/lib/phidgets_imu/phidgets_imu_node: /opt/ros/melodic/lib/librosconsole_backend_interface.so
/home/odroid/Code/catkin_ws/devel/lib/phidgets_imu/phidgets_imu_node: /usr/lib/arm-linux-gnueabihf/liblog4cxx.so
/home/odroid/Code/catkin_ws/devel/lib/phidgets_imu/phidgets_imu_node: /usr/lib/arm-linux-gnueabihf/libboost_regex.so
/home/odroid/Code/catkin_ws/devel/lib/phidgets_imu/phidgets_imu_node: /opt/ros/melodic/lib/libxmlrpcpp.so
/home/odroid/Code/catkin_ws/devel/lib/phidgets_imu/phidgets_imu_node: /opt/ros/melodic/lib/libroscpp_serialization.so
/home/odroid/Code/catkin_ws/devel/lib/phidgets_imu/phidgets_imu_node: /opt/ros/melodic/lib/librostime.so
/home/odroid/Code/catkin_ws/devel/lib/phidgets_imu/phidgets_imu_node: /opt/ros/melodic/lib/libcpp_common.so
/home/odroid/Code/catkin_ws/devel/lib/phidgets_imu/phidgets_imu_node: /usr/lib/arm-linux-gnueabihf/libboost_system.so
/home/odroid/Code/catkin_ws/devel/lib/phidgets_imu/phidgets_imu_node: /usr/lib/arm-linux-gnueabihf/libboost_thread.so
/home/odroid/Code/catkin_ws/devel/lib/phidgets_imu/phidgets_imu_node: /usr/lib/arm-linux-gnueabihf/libboost_chrono.so
/home/odroid/Code/catkin_ws/devel/lib/phidgets_imu/phidgets_imu_node: /usr/lib/arm-linux-gnueabihf/libboost_date_time.so
/home/odroid/Code/catkin_ws/devel/lib/phidgets_imu/phidgets_imu_node: /usr/lib/arm-linux-gnueabihf/libboost_atomic.so
/home/odroid/Code/catkin_ws/devel/lib/phidgets_imu/phidgets_imu_node: /usr/lib/arm-linux-gnueabihf/libpthread.so
/home/odroid/Code/catkin_ws/devel/lib/phidgets_imu/phidgets_imu_node: /usr/lib/arm-linux-gnueabihf/libconsole_bridge.so.0.4
/home/odroid/Code/catkin_ws/devel/lib/phidgets_imu/phidgets_imu_node: /home/odroid/Code/catkin_ws/devel/lib/libphidgets_imu.so
/home/odroid/Code/catkin_ws/devel/lib/phidgets_imu/phidgets_imu_node: /opt/ros/melodic/lib/libdiagnostic_updater.so
/home/odroid/Code/catkin_ws/devel/lib/phidgets_imu/phidgets_imu_node: /opt/ros/melodic/lib/libnodeletlib.so
/home/odroid/Code/catkin_ws/devel/lib/phidgets_imu/phidgets_imu_node: /opt/ros/melodic/lib/libbondcpp.so
/home/odroid/Code/catkin_ws/devel/lib/phidgets_imu/phidgets_imu_node: /usr/lib/arm-linux-gnueabihf/libuuid.so
/home/odroid/Code/catkin_ws/devel/lib/phidgets_imu/phidgets_imu_node: /opt/ros/melodic/lib/libclass_loader.so
/home/odroid/Code/catkin_ws/devel/lib/phidgets_imu/phidgets_imu_node: /usr/lib/libPocoFoundation.so
/home/odroid/Code/catkin_ws/devel/lib/phidgets_imu/phidgets_imu_node: /usr/lib/arm-linux-gnueabihf/libdl.so
/home/odroid/Code/catkin_ws/devel/lib/phidgets_imu/phidgets_imu_node: /opt/ros/melodic/lib/libroslib.so
/home/odroid/Code/catkin_ws/devel/lib/phidgets_imu/phidgets_imu_node: /opt/ros/melodic/lib/librospack.so
/home/odroid/Code/catkin_ws/devel/lib/phidgets_imu/phidgets_imu_node: /usr/lib/arm-linux-gnueabihf/libpython2.7.so
/home/odroid/Code/catkin_ws/devel/lib/phidgets_imu/phidgets_imu_node: /usr/lib/arm-linux-gnueabihf/libboost_program_options.so
/home/odroid/Code/catkin_ws/devel/lib/phidgets_imu/phidgets_imu_node: /usr/lib/arm-linux-gnueabihf/libtinyxml2.so
/home/odroid/Code/catkin_ws/devel/lib/phidgets_imu/phidgets_imu_node: /home/odroid/Code/catkin_ws/devel/lib/libphidgets_api.so
/home/odroid/Code/catkin_ws/devel/lib/phidgets_imu/phidgets_imu_node: /home/odroid/Code/catkin_ws/devel/lib/libphidget21.so
/home/odroid/Code/catkin_ws/devel/lib/phidgets_imu/phidgets_imu_node: /opt/ros/melodic/lib/libroscpp.so
/home/odroid/Code/catkin_ws/devel/lib/phidgets_imu/phidgets_imu_node: /usr/lib/arm-linux-gnueabihf/libboost_filesystem.so
/home/odroid/Code/catkin_ws/devel/lib/phidgets_imu/phidgets_imu_node: /opt/ros/melodic/lib/librosconsole.so
/home/odroid/Code/catkin_ws/devel/lib/phidgets_imu/phidgets_imu_node: /opt/ros/melodic/lib/librosconsole_log4cxx.so
/home/odroid/Code/catkin_ws/devel/lib/phidgets_imu/phidgets_imu_node: /opt/ros/melodic/lib/librosconsole_backend_interface.so
/home/odroid/Code/catkin_ws/devel/lib/phidgets_imu/phidgets_imu_node: /usr/lib/arm-linux-gnueabihf/liblog4cxx.so
/home/odroid/Code/catkin_ws/devel/lib/phidgets_imu/phidgets_imu_node: /usr/lib/arm-linux-gnueabihf/libboost_regex.so
/home/odroid/Code/catkin_ws/devel/lib/phidgets_imu/phidgets_imu_node: /opt/ros/melodic/lib/libxmlrpcpp.so
/home/odroid/Code/catkin_ws/devel/lib/phidgets_imu/phidgets_imu_node: /opt/ros/melodic/lib/libroscpp_serialization.so
/home/odroid/Code/catkin_ws/devel/lib/phidgets_imu/phidgets_imu_node: /opt/ros/melodic/lib/librostime.so
/home/odroid/Code/catkin_ws/devel/lib/phidgets_imu/phidgets_imu_node: /opt/ros/melodic/lib/libcpp_common.so
/home/odroid/Code/catkin_ws/devel/lib/phidgets_imu/phidgets_imu_node: /usr/lib/arm-linux-gnueabihf/libboost_system.so
/home/odroid/Code/catkin_ws/devel/lib/phidgets_imu/phidgets_imu_node: /usr/lib/arm-linux-gnueabihf/libboost_thread.so
/home/odroid/Code/catkin_ws/devel/lib/phidgets_imu/phidgets_imu_node: /usr/lib/arm-linux-gnueabihf/libboost_chrono.so
/home/odroid/Code/catkin_ws/devel/lib/phidgets_imu/phidgets_imu_node: /usr/lib/arm-linux-gnueabihf/libboost_date_time.so
/home/odroid/Code/catkin_ws/devel/lib/phidgets_imu/phidgets_imu_node: /usr/lib/arm-linux-gnueabihf/libboost_atomic.so
/home/odroid/Code/catkin_ws/devel/lib/phidgets_imu/phidgets_imu_node: /usr/lib/arm-linux-gnueabihf/libpthread.so
/home/odroid/Code/catkin_ws/devel/lib/phidgets_imu/phidgets_imu_node: /usr/lib/arm-linux-gnueabihf/libconsole_bridge.so.0.4
/home/odroid/Code/catkin_ws/devel/lib/phidgets_imu/phidgets_imu_node: phidgets_imu/CMakeFiles/phidgets_imu_node.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/odroid/Code/catkin_ws/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable /home/odroid/Code/catkin_ws/devel/lib/phidgets_imu/phidgets_imu_node"
	cd /home/odroid/Code/catkin_ws/build/phidgets_imu && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/phidgets_imu_node.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
phidgets_imu/CMakeFiles/phidgets_imu_node.dir/build: /home/odroid/Code/catkin_ws/devel/lib/phidgets_imu/phidgets_imu_node

.PHONY : phidgets_imu/CMakeFiles/phidgets_imu_node.dir/build

phidgets_imu/CMakeFiles/phidgets_imu_node.dir/requires: phidgets_imu/CMakeFiles/phidgets_imu_node.dir/src/phidgets_imu_node.cpp.o.requires

.PHONY : phidgets_imu/CMakeFiles/phidgets_imu_node.dir/requires

phidgets_imu/CMakeFiles/phidgets_imu_node.dir/clean:
	cd /home/odroid/Code/catkin_ws/build/phidgets_imu && $(CMAKE_COMMAND) -P CMakeFiles/phidgets_imu_node.dir/cmake_clean.cmake
.PHONY : phidgets_imu/CMakeFiles/phidgets_imu_node.dir/clean

phidgets_imu/CMakeFiles/phidgets_imu_node.dir/depend:
	cd /home/odroid/Code/catkin_ws/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/odroid/Code/catkin_ws/src /home/odroid/Code/catkin_ws/src/phidgets_imu /home/odroid/Code/catkin_ws/build /home/odroid/Code/catkin_ws/build/phidgets_imu /home/odroid/Code/catkin_ws/build/phidgets_imu/CMakeFiles/phidgets_imu_node.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : phidgets_imu/CMakeFiles/phidgets_imu_node.dir/depend


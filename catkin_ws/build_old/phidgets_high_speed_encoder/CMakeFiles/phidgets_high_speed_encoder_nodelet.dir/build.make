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
include phidgets_high_speed_encoder/CMakeFiles/phidgets_high_speed_encoder_nodelet.dir/depend.make

# Include the progress variables for this target.
include phidgets_high_speed_encoder/CMakeFiles/phidgets_high_speed_encoder_nodelet.dir/progress.make

# Include the compile flags for this target's objects.
include phidgets_high_speed_encoder/CMakeFiles/phidgets_high_speed_encoder_nodelet.dir/flags.make

phidgets_high_speed_encoder/CMakeFiles/phidgets_high_speed_encoder_nodelet.dir/src/phidgets_high_speed_encoder_nodelet.cpp.o: phidgets_high_speed_encoder/CMakeFiles/phidgets_high_speed_encoder_nodelet.dir/flags.make
phidgets_high_speed_encoder/CMakeFiles/phidgets_high_speed_encoder_nodelet.dir/src/phidgets_high_speed_encoder_nodelet.cpp.o: /home/odroid/Code/catkin_ws/src/phidgets_high_speed_encoder/src/phidgets_high_speed_encoder_nodelet.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/odroid/Code/catkin_ws/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object phidgets_high_speed_encoder/CMakeFiles/phidgets_high_speed_encoder_nodelet.dir/src/phidgets_high_speed_encoder_nodelet.cpp.o"
	cd /home/odroid/Code/catkin_ws/build/phidgets_high_speed_encoder && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/phidgets_high_speed_encoder_nodelet.dir/src/phidgets_high_speed_encoder_nodelet.cpp.o -c /home/odroid/Code/catkin_ws/src/phidgets_high_speed_encoder/src/phidgets_high_speed_encoder_nodelet.cpp

phidgets_high_speed_encoder/CMakeFiles/phidgets_high_speed_encoder_nodelet.dir/src/phidgets_high_speed_encoder_nodelet.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/phidgets_high_speed_encoder_nodelet.dir/src/phidgets_high_speed_encoder_nodelet.cpp.i"
	cd /home/odroid/Code/catkin_ws/build/phidgets_high_speed_encoder && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/odroid/Code/catkin_ws/src/phidgets_high_speed_encoder/src/phidgets_high_speed_encoder_nodelet.cpp > CMakeFiles/phidgets_high_speed_encoder_nodelet.dir/src/phidgets_high_speed_encoder_nodelet.cpp.i

phidgets_high_speed_encoder/CMakeFiles/phidgets_high_speed_encoder_nodelet.dir/src/phidgets_high_speed_encoder_nodelet.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/phidgets_high_speed_encoder_nodelet.dir/src/phidgets_high_speed_encoder_nodelet.cpp.s"
	cd /home/odroid/Code/catkin_ws/build/phidgets_high_speed_encoder && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/odroid/Code/catkin_ws/src/phidgets_high_speed_encoder/src/phidgets_high_speed_encoder_nodelet.cpp -o CMakeFiles/phidgets_high_speed_encoder_nodelet.dir/src/phidgets_high_speed_encoder_nodelet.cpp.s

phidgets_high_speed_encoder/CMakeFiles/phidgets_high_speed_encoder_nodelet.dir/src/phidgets_high_speed_encoder_nodelet.cpp.o.requires:

.PHONY : phidgets_high_speed_encoder/CMakeFiles/phidgets_high_speed_encoder_nodelet.dir/src/phidgets_high_speed_encoder_nodelet.cpp.o.requires

phidgets_high_speed_encoder/CMakeFiles/phidgets_high_speed_encoder_nodelet.dir/src/phidgets_high_speed_encoder_nodelet.cpp.o.provides: phidgets_high_speed_encoder/CMakeFiles/phidgets_high_speed_encoder_nodelet.dir/src/phidgets_high_speed_encoder_nodelet.cpp.o.requires
	$(MAKE) -f phidgets_high_speed_encoder/CMakeFiles/phidgets_high_speed_encoder_nodelet.dir/build.make phidgets_high_speed_encoder/CMakeFiles/phidgets_high_speed_encoder_nodelet.dir/src/phidgets_high_speed_encoder_nodelet.cpp.o.provides.build
.PHONY : phidgets_high_speed_encoder/CMakeFiles/phidgets_high_speed_encoder_nodelet.dir/src/phidgets_high_speed_encoder_nodelet.cpp.o.provides

phidgets_high_speed_encoder/CMakeFiles/phidgets_high_speed_encoder_nodelet.dir/src/phidgets_high_speed_encoder_nodelet.cpp.o.provides.build: phidgets_high_speed_encoder/CMakeFiles/phidgets_high_speed_encoder_nodelet.dir/src/phidgets_high_speed_encoder_nodelet.cpp.o


# Object files for target phidgets_high_speed_encoder_nodelet
phidgets_high_speed_encoder_nodelet_OBJECTS = \
"CMakeFiles/phidgets_high_speed_encoder_nodelet.dir/src/phidgets_high_speed_encoder_nodelet.cpp.o"

# External object files for target phidgets_high_speed_encoder_nodelet
phidgets_high_speed_encoder_nodelet_EXTERNAL_OBJECTS =

/home/odroid/Code/catkin_ws/devel/lib/libphidgets_high_speed_encoder_nodelet.so: phidgets_high_speed_encoder/CMakeFiles/phidgets_high_speed_encoder_nodelet.dir/src/phidgets_high_speed_encoder_nodelet.cpp.o
/home/odroid/Code/catkin_ws/devel/lib/libphidgets_high_speed_encoder_nodelet.so: phidgets_high_speed_encoder/CMakeFiles/phidgets_high_speed_encoder_nodelet.dir/build.make
/home/odroid/Code/catkin_ws/devel/lib/libphidgets_high_speed_encoder_nodelet.so: /opt/ros/melodic/lib/libnodeletlib.so
/home/odroid/Code/catkin_ws/devel/lib/libphidgets_high_speed_encoder_nodelet.so: /opt/ros/melodic/lib/libbondcpp.so
/home/odroid/Code/catkin_ws/devel/lib/libphidgets_high_speed_encoder_nodelet.so: /usr/lib/arm-linux-gnueabihf/libuuid.so
/home/odroid/Code/catkin_ws/devel/lib/libphidgets_high_speed_encoder_nodelet.so: /home/odroid/Code/catkin_ws/devel/lib/libphidget21.so
/home/odroid/Code/catkin_ws/devel/lib/libphidgets_high_speed_encoder_nodelet.so: /opt/ros/melodic/lib/libclass_loader.so
/home/odroid/Code/catkin_ws/devel/lib/libphidgets_high_speed_encoder_nodelet.so: /usr/lib/libPocoFoundation.so
/home/odroid/Code/catkin_ws/devel/lib/libphidgets_high_speed_encoder_nodelet.so: /usr/lib/arm-linux-gnueabihf/libdl.so
/home/odroid/Code/catkin_ws/devel/lib/libphidgets_high_speed_encoder_nodelet.so: /opt/ros/melodic/lib/libroslib.so
/home/odroid/Code/catkin_ws/devel/lib/libphidgets_high_speed_encoder_nodelet.so: /opt/ros/melodic/lib/librospack.so
/home/odroid/Code/catkin_ws/devel/lib/libphidgets_high_speed_encoder_nodelet.so: /usr/lib/arm-linux-gnueabihf/libpython2.7.so
/home/odroid/Code/catkin_ws/devel/lib/libphidgets_high_speed_encoder_nodelet.so: /usr/lib/arm-linux-gnueabihf/libboost_program_options.so
/home/odroid/Code/catkin_ws/devel/lib/libphidgets_high_speed_encoder_nodelet.so: /usr/lib/arm-linux-gnueabihf/libtinyxml2.so
/home/odroid/Code/catkin_ws/devel/lib/libphidgets_high_speed_encoder_nodelet.so: /opt/ros/melodic/lib/libroscpp.so
/home/odroid/Code/catkin_ws/devel/lib/libphidgets_high_speed_encoder_nodelet.so: /usr/lib/arm-linux-gnueabihf/libboost_filesystem.so
/home/odroid/Code/catkin_ws/devel/lib/libphidgets_high_speed_encoder_nodelet.so: /opt/ros/melodic/lib/librosconsole.so
/home/odroid/Code/catkin_ws/devel/lib/libphidgets_high_speed_encoder_nodelet.so: /opt/ros/melodic/lib/librosconsole_log4cxx.so
/home/odroid/Code/catkin_ws/devel/lib/libphidgets_high_speed_encoder_nodelet.so: /opt/ros/melodic/lib/librosconsole_backend_interface.so
/home/odroid/Code/catkin_ws/devel/lib/libphidgets_high_speed_encoder_nodelet.so: /usr/lib/arm-linux-gnueabihf/liblog4cxx.so
/home/odroid/Code/catkin_ws/devel/lib/libphidgets_high_speed_encoder_nodelet.so: /usr/lib/arm-linux-gnueabihf/libboost_regex.so
/home/odroid/Code/catkin_ws/devel/lib/libphidgets_high_speed_encoder_nodelet.so: /opt/ros/melodic/lib/libxmlrpcpp.so
/home/odroid/Code/catkin_ws/devel/lib/libphidgets_high_speed_encoder_nodelet.so: /opt/ros/melodic/lib/libroscpp_serialization.so
/home/odroid/Code/catkin_ws/devel/lib/libphidgets_high_speed_encoder_nodelet.so: /opt/ros/melodic/lib/librostime.so
/home/odroid/Code/catkin_ws/devel/lib/libphidgets_high_speed_encoder_nodelet.so: /opt/ros/melodic/lib/libcpp_common.so
/home/odroid/Code/catkin_ws/devel/lib/libphidgets_high_speed_encoder_nodelet.so: /usr/lib/arm-linux-gnueabihf/libboost_system.so
/home/odroid/Code/catkin_ws/devel/lib/libphidgets_high_speed_encoder_nodelet.so: /usr/lib/arm-linux-gnueabihf/libboost_thread.so
/home/odroid/Code/catkin_ws/devel/lib/libphidgets_high_speed_encoder_nodelet.so: /usr/lib/arm-linux-gnueabihf/libboost_chrono.so
/home/odroid/Code/catkin_ws/devel/lib/libphidgets_high_speed_encoder_nodelet.so: /usr/lib/arm-linux-gnueabihf/libboost_date_time.so
/home/odroid/Code/catkin_ws/devel/lib/libphidgets_high_speed_encoder_nodelet.so: /usr/lib/arm-linux-gnueabihf/libboost_atomic.so
/home/odroid/Code/catkin_ws/devel/lib/libphidgets_high_speed_encoder_nodelet.so: /usr/lib/arm-linux-gnueabihf/libpthread.so
/home/odroid/Code/catkin_ws/devel/lib/libphidgets_high_speed_encoder_nodelet.so: /usr/lib/arm-linux-gnueabihf/libconsole_bridge.so.0.4
/home/odroid/Code/catkin_ws/devel/lib/libphidgets_high_speed_encoder_nodelet.so: /home/odroid/Code/catkin_ws/devel/lib/libphidgets_high_speed_encoder.so
/home/odroid/Code/catkin_ws/devel/lib/libphidgets_high_speed_encoder_nodelet.so: /opt/ros/melodic/lib/libnodeletlib.so
/home/odroid/Code/catkin_ws/devel/lib/libphidgets_high_speed_encoder_nodelet.so: /opt/ros/melodic/lib/libbondcpp.so
/home/odroid/Code/catkin_ws/devel/lib/libphidgets_high_speed_encoder_nodelet.so: /usr/lib/arm-linux-gnueabihf/libuuid.so
/home/odroid/Code/catkin_ws/devel/lib/libphidgets_high_speed_encoder_nodelet.so: /home/odroid/Code/catkin_ws/devel/lib/libphidgets_api.so
/home/odroid/Code/catkin_ws/devel/lib/libphidgets_high_speed_encoder_nodelet.so: /home/odroid/Code/catkin_ws/devel/lib/libphidget21.so
/home/odroid/Code/catkin_ws/devel/lib/libphidgets_high_speed_encoder_nodelet.so: /opt/ros/melodic/lib/libclass_loader.so
/home/odroid/Code/catkin_ws/devel/lib/libphidgets_high_speed_encoder_nodelet.so: /usr/lib/libPocoFoundation.so
/home/odroid/Code/catkin_ws/devel/lib/libphidgets_high_speed_encoder_nodelet.so: /usr/lib/arm-linux-gnueabihf/libdl.so
/home/odroid/Code/catkin_ws/devel/lib/libphidgets_high_speed_encoder_nodelet.so: /opt/ros/melodic/lib/libroslib.so
/home/odroid/Code/catkin_ws/devel/lib/libphidgets_high_speed_encoder_nodelet.so: /opt/ros/melodic/lib/librospack.so
/home/odroid/Code/catkin_ws/devel/lib/libphidgets_high_speed_encoder_nodelet.so: /usr/lib/arm-linux-gnueabihf/libpython2.7.so
/home/odroid/Code/catkin_ws/devel/lib/libphidgets_high_speed_encoder_nodelet.so: /usr/lib/arm-linux-gnueabihf/libboost_program_options.so
/home/odroid/Code/catkin_ws/devel/lib/libphidgets_high_speed_encoder_nodelet.so: /usr/lib/arm-linux-gnueabihf/libtinyxml2.so
/home/odroid/Code/catkin_ws/devel/lib/libphidgets_high_speed_encoder_nodelet.so: /opt/ros/melodic/lib/libroscpp.so
/home/odroid/Code/catkin_ws/devel/lib/libphidgets_high_speed_encoder_nodelet.so: /usr/lib/arm-linux-gnueabihf/libboost_filesystem.so
/home/odroid/Code/catkin_ws/devel/lib/libphidgets_high_speed_encoder_nodelet.so: /opt/ros/melodic/lib/librosconsole.so
/home/odroid/Code/catkin_ws/devel/lib/libphidgets_high_speed_encoder_nodelet.so: /opt/ros/melodic/lib/librosconsole_log4cxx.so
/home/odroid/Code/catkin_ws/devel/lib/libphidgets_high_speed_encoder_nodelet.so: /opt/ros/melodic/lib/librosconsole_backend_interface.so
/home/odroid/Code/catkin_ws/devel/lib/libphidgets_high_speed_encoder_nodelet.so: /usr/lib/arm-linux-gnueabihf/liblog4cxx.so
/home/odroid/Code/catkin_ws/devel/lib/libphidgets_high_speed_encoder_nodelet.so: /usr/lib/arm-linux-gnueabihf/libboost_regex.so
/home/odroid/Code/catkin_ws/devel/lib/libphidgets_high_speed_encoder_nodelet.so: /opt/ros/melodic/lib/libxmlrpcpp.so
/home/odroid/Code/catkin_ws/devel/lib/libphidgets_high_speed_encoder_nodelet.so: /opt/ros/melodic/lib/libroscpp_serialization.so
/home/odroid/Code/catkin_ws/devel/lib/libphidgets_high_speed_encoder_nodelet.so: /opt/ros/melodic/lib/librostime.so
/home/odroid/Code/catkin_ws/devel/lib/libphidgets_high_speed_encoder_nodelet.so: /opt/ros/melodic/lib/libcpp_common.so
/home/odroid/Code/catkin_ws/devel/lib/libphidgets_high_speed_encoder_nodelet.so: /usr/lib/arm-linux-gnueabihf/libboost_system.so
/home/odroid/Code/catkin_ws/devel/lib/libphidgets_high_speed_encoder_nodelet.so: /usr/lib/arm-linux-gnueabihf/libboost_thread.so
/home/odroid/Code/catkin_ws/devel/lib/libphidgets_high_speed_encoder_nodelet.so: /usr/lib/arm-linux-gnueabihf/libboost_chrono.so
/home/odroid/Code/catkin_ws/devel/lib/libphidgets_high_speed_encoder_nodelet.so: /usr/lib/arm-linux-gnueabihf/libboost_date_time.so
/home/odroid/Code/catkin_ws/devel/lib/libphidgets_high_speed_encoder_nodelet.so: /usr/lib/arm-linux-gnueabihf/libboost_atomic.so
/home/odroid/Code/catkin_ws/devel/lib/libphidgets_high_speed_encoder_nodelet.so: /usr/lib/arm-linux-gnueabihf/libpthread.so
/home/odroid/Code/catkin_ws/devel/lib/libphidgets_high_speed_encoder_nodelet.so: /usr/lib/arm-linux-gnueabihf/libconsole_bridge.so.0.4
/home/odroid/Code/catkin_ws/devel/lib/libphidgets_high_speed_encoder_nodelet.so: phidgets_high_speed_encoder/CMakeFiles/phidgets_high_speed_encoder_nodelet.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/odroid/Code/catkin_ws/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX shared library /home/odroid/Code/catkin_ws/devel/lib/libphidgets_high_speed_encoder_nodelet.so"
	cd /home/odroid/Code/catkin_ws/build/phidgets_high_speed_encoder && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/phidgets_high_speed_encoder_nodelet.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
phidgets_high_speed_encoder/CMakeFiles/phidgets_high_speed_encoder_nodelet.dir/build: /home/odroid/Code/catkin_ws/devel/lib/libphidgets_high_speed_encoder_nodelet.so

.PHONY : phidgets_high_speed_encoder/CMakeFiles/phidgets_high_speed_encoder_nodelet.dir/build

phidgets_high_speed_encoder/CMakeFiles/phidgets_high_speed_encoder_nodelet.dir/requires: phidgets_high_speed_encoder/CMakeFiles/phidgets_high_speed_encoder_nodelet.dir/src/phidgets_high_speed_encoder_nodelet.cpp.o.requires

.PHONY : phidgets_high_speed_encoder/CMakeFiles/phidgets_high_speed_encoder_nodelet.dir/requires

phidgets_high_speed_encoder/CMakeFiles/phidgets_high_speed_encoder_nodelet.dir/clean:
	cd /home/odroid/Code/catkin_ws/build/phidgets_high_speed_encoder && $(CMAKE_COMMAND) -P CMakeFiles/phidgets_high_speed_encoder_nodelet.dir/cmake_clean.cmake
.PHONY : phidgets_high_speed_encoder/CMakeFiles/phidgets_high_speed_encoder_nodelet.dir/clean

phidgets_high_speed_encoder/CMakeFiles/phidgets_high_speed_encoder_nodelet.dir/depend:
	cd /home/odroid/Code/catkin_ws/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/odroid/Code/catkin_ws/src /home/odroid/Code/catkin_ws/src/phidgets_high_speed_encoder /home/odroid/Code/catkin_ws/build /home/odroid/Code/catkin_ws/build/phidgets_high_speed_encoder /home/odroid/Code/catkin_ws/build/phidgets_high_speed_encoder/CMakeFiles/phidgets_high_speed_encoder_nodelet.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : phidgets_high_speed_encoder/CMakeFiles/phidgets_high_speed_encoder_nodelet.dir/depend


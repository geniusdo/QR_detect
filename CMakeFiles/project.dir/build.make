# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.16

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
CMAKE_SOURCE_DIR = /home/liuchuangye/c++/QR_detect

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/liuchuangye/c++/QR_detect

# Include any dependencies generated for this target.
include CMakeFiles/project.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/project.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/project.dir/flags.make

CMakeFiles/project.dir/src/main.cpp.o: CMakeFiles/project.dir/flags.make
CMakeFiles/project.dir/src/main.cpp.o: src/main.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/liuchuangye/c++/QR_detect/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/project.dir/src/main.cpp.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/project.dir/src/main.cpp.o -c /home/liuchuangye/c++/QR_detect/src/main.cpp

CMakeFiles/project.dir/src/main.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/project.dir/src/main.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/liuchuangye/c++/QR_detect/src/main.cpp > CMakeFiles/project.dir/src/main.cpp.i

CMakeFiles/project.dir/src/main.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/project.dir/src/main.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/liuchuangye/c++/QR_detect/src/main.cpp -o CMakeFiles/project.dir/src/main.cpp.s

# Object files for target project
project_OBJECTS = \
"CMakeFiles/project.dir/src/main.cpp.o"

# External object files for target project
project_EXTERNAL_OBJECTS =

bin/project: CMakeFiles/project.dir/src/main.cpp.o
bin/project: CMakeFiles/project.dir/build.make
bin/project: /usr/lib/x86_64-linux-gnu/libboost_system.so.1.71.0
bin/project: /usr/lib/x86_64-linux-gnu/libboost_thread.so.1.71.0
bin/project: /usr/lib/x86_64-linux-gnu/libboost_date_time.so.1.71.0
bin/project: /usr/local/lib/libopencv_gapi.so.4.5.5
bin/project: /usr/local/lib/libopencv_highgui.so.4.5.5
bin/project: /usr/local/lib/libopencv_ml.so.4.5.5
bin/project: /usr/local/lib/libopencv_objdetect.so.4.5.5
bin/project: /usr/local/lib/libopencv_photo.so.4.5.5
bin/project: /usr/local/lib/libopencv_stitching.so.4.5.5
bin/project: /usr/local/lib/libopencv_video.so.4.5.5
bin/project: /usr/local/lib/libopencv_videoio.so.4.5.5
bin/project: /usr/lib/x86_64-linux-gnu/libboost_atomic.so.1.71.0
bin/project: /usr/local/lib/libopencv_imgcodecs.so.4.5.5
bin/project: /usr/local/lib/libopencv_dnn.so.4.5.5
bin/project: /usr/local/lib/libopencv_calib3d.so.4.5.5
bin/project: /usr/local/lib/libopencv_features2d.so.4.5.5
bin/project: /usr/local/lib/libopencv_flann.so.4.5.5
bin/project: /usr/local/lib/libopencv_imgproc.so.4.5.5
bin/project: /usr/local/lib/libopencv_core.so.4.5.5
bin/project: CMakeFiles/project.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/liuchuangye/c++/QR_detect/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable bin/project"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/project.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/project.dir/build: bin/project

.PHONY : CMakeFiles/project.dir/build

CMakeFiles/project.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/project.dir/cmake_clean.cmake
.PHONY : CMakeFiles/project.dir/clean

CMakeFiles/project.dir/depend:
	cd /home/liuchuangye/c++/QR_detect && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/liuchuangye/c++/QR_detect /home/liuchuangye/c++/QR_detect /home/liuchuangye/c++/QR_detect /home/liuchuangye/c++/QR_detect /home/liuchuangye/c++/QR_detect/CMakeFiles/project.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/project.dir/depend


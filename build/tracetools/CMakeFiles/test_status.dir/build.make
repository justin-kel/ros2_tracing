# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.26

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /home/justin/.local/lib/python3.10/site-packages/cmake/data/bin/cmake

# The command to remove a file.
RM = /home/justin/.local/lib/python3.10/site-packages/cmake/data/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/justin/ros2_tracing_humble_demo_ws/src/ros2_tracing/tracetools

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/justin/ros2_tracing_humble_demo_ws/src/ros2_tracing/build/tracetools

# Include any dependencies generated for this target.
include CMakeFiles/test_status.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include CMakeFiles/test_status.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/test_status.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/test_status.dir/flags.make

CMakeFiles/test_status.dir/test/test_status.cpp.o: CMakeFiles/test_status.dir/flags.make
CMakeFiles/test_status.dir/test/test_status.cpp.o: /home/justin/ros2_tracing_humble_demo_ws/src/ros2_tracing/tracetools/test/test_status.cpp
CMakeFiles/test_status.dir/test/test_status.cpp.o: CMakeFiles/test_status.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/justin/ros2_tracing_humble_demo_ws/src/ros2_tracing/build/tracetools/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/test_status.dir/test/test_status.cpp.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/test_status.dir/test/test_status.cpp.o -MF CMakeFiles/test_status.dir/test/test_status.cpp.o.d -o CMakeFiles/test_status.dir/test/test_status.cpp.o -c /home/justin/ros2_tracing_humble_demo_ws/src/ros2_tracing/tracetools/test/test_status.cpp

CMakeFiles/test_status.dir/test/test_status.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/test_status.dir/test/test_status.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/justin/ros2_tracing_humble_demo_ws/src/ros2_tracing/tracetools/test/test_status.cpp > CMakeFiles/test_status.dir/test/test_status.cpp.i

CMakeFiles/test_status.dir/test/test_status.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/test_status.dir/test/test_status.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/justin/ros2_tracing_humble_demo_ws/src/ros2_tracing/tracetools/test/test_status.cpp -o CMakeFiles/test_status.dir/test/test_status.cpp.s

# Object files for target test_status
test_status_OBJECTS = \
"CMakeFiles/test_status.dir/test/test_status.cpp.o"

# External object files for target test_status
test_status_EXTERNAL_OBJECTS =

test_status: CMakeFiles/test_status.dir/test/test_status.cpp.o
test_status: CMakeFiles/test_status.dir/build.make
test_status: gtest/libgtest_main.a
test_status: gtest/libgtest.a
test_status: libtracetools_status.so
test_status: libtracetools.so
test_status: CMakeFiles/test_status.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/justin/ros2_tracing_humble_demo_ws/src/ros2_tracing/build/tracetools/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable test_status"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/test_status.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/test_status.dir/build: test_status
.PHONY : CMakeFiles/test_status.dir/build

CMakeFiles/test_status.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/test_status.dir/cmake_clean.cmake
.PHONY : CMakeFiles/test_status.dir/clean

CMakeFiles/test_status.dir/depend:
	cd /home/justin/ros2_tracing_humble_demo_ws/src/ros2_tracing/build/tracetools && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/justin/ros2_tracing_humble_demo_ws/src/ros2_tracing/tracetools /home/justin/ros2_tracing_humble_demo_ws/src/ros2_tracing/tracetools /home/justin/ros2_tracing_humble_demo_ws/src/ros2_tracing/build/tracetools /home/justin/ros2_tracing_humble_demo_ws/src/ros2_tracing/build/tracetools /home/justin/ros2_tracing_humble_demo_ws/src/ros2_tracing/build/tracetools/CMakeFiles/test_status.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/test_status.dir/depend


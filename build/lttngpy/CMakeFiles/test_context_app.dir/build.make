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
CMAKE_SOURCE_DIR = /home/justin/ros2_tracing_humble_demo_ws/src/ros2_tracing/lttngpy

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/justin/ros2_tracing_humble_demo_ws/src/ros2_tracing/build/lttngpy

# Include any dependencies generated for this target.
include CMakeFiles/test_context_app.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include CMakeFiles/test_context_app.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/test_context_app.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/test_context_app.dir/flags.make

CMakeFiles/test_context_app.dir/test/test_context_app.cpp.o: CMakeFiles/test_context_app.dir/flags.make
CMakeFiles/test_context_app.dir/test/test_context_app.cpp.o: /home/justin/ros2_tracing_humble_demo_ws/src/ros2_tracing/lttngpy/test/test_context_app.cpp
CMakeFiles/test_context_app.dir/test/test_context_app.cpp.o: CMakeFiles/test_context_app.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/justin/ros2_tracing_humble_demo_ws/src/ros2_tracing/build/lttngpy/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/test_context_app.dir/test/test_context_app.cpp.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/test_context_app.dir/test/test_context_app.cpp.o -MF CMakeFiles/test_context_app.dir/test/test_context_app.cpp.o.d -o CMakeFiles/test_context_app.dir/test/test_context_app.cpp.o -c /home/justin/ros2_tracing_humble_demo_ws/src/ros2_tracing/lttngpy/test/test_context_app.cpp

CMakeFiles/test_context_app.dir/test/test_context_app.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/test_context_app.dir/test/test_context_app.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/justin/ros2_tracing_humble_demo_ws/src/ros2_tracing/lttngpy/test/test_context_app.cpp > CMakeFiles/test_context_app.dir/test/test_context_app.cpp.i

CMakeFiles/test_context_app.dir/test/test_context_app.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/test_context_app.dir/test/test_context_app.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/justin/ros2_tracing_humble_demo_ws/src/ros2_tracing/lttngpy/test/test_context_app.cpp -o CMakeFiles/test_context_app.dir/test/test_context_app.cpp.s

CMakeFiles/test_context_app.dir/src/lttngpy/context_app.cpp.o: CMakeFiles/test_context_app.dir/flags.make
CMakeFiles/test_context_app.dir/src/lttngpy/context_app.cpp.o: /home/justin/ros2_tracing_humble_demo_ws/src/ros2_tracing/lttngpy/src/lttngpy/context_app.cpp
CMakeFiles/test_context_app.dir/src/lttngpy/context_app.cpp.o: CMakeFiles/test_context_app.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/justin/ros2_tracing_humble_demo_ws/src/ros2_tracing/build/lttngpy/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object CMakeFiles/test_context_app.dir/src/lttngpy/context_app.cpp.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/test_context_app.dir/src/lttngpy/context_app.cpp.o -MF CMakeFiles/test_context_app.dir/src/lttngpy/context_app.cpp.o.d -o CMakeFiles/test_context_app.dir/src/lttngpy/context_app.cpp.o -c /home/justin/ros2_tracing_humble_demo_ws/src/ros2_tracing/lttngpy/src/lttngpy/context_app.cpp

CMakeFiles/test_context_app.dir/src/lttngpy/context_app.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/test_context_app.dir/src/lttngpy/context_app.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/justin/ros2_tracing_humble_demo_ws/src/ros2_tracing/lttngpy/src/lttngpy/context_app.cpp > CMakeFiles/test_context_app.dir/src/lttngpy/context_app.cpp.i

CMakeFiles/test_context_app.dir/src/lttngpy/context_app.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/test_context_app.dir/src/lttngpy/context_app.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/justin/ros2_tracing_humble_demo_ws/src/ros2_tracing/lttngpy/src/lttngpy/context_app.cpp -o CMakeFiles/test_context_app.dir/src/lttngpy/context_app.cpp.s

# Object files for target test_context_app
test_context_app_OBJECTS = \
"CMakeFiles/test_context_app.dir/test/test_context_app.cpp.o" \
"CMakeFiles/test_context_app.dir/src/lttngpy/context_app.cpp.o"

# External object files for target test_context_app
test_context_app_EXTERNAL_OBJECTS =

test_context_app: CMakeFiles/test_context_app.dir/test/test_context_app.cpp.o
test_context_app: CMakeFiles/test_context_app.dir/src/lttngpy/context_app.cpp.o
test_context_app: CMakeFiles/test_context_app.dir/build.make
test_context_app: gtest/libgtest_main.a
test_context_app: gtest/libgtest.a
test_context_app: CMakeFiles/test_context_app.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/justin/ros2_tracing_humble_demo_ws/src/ros2_tracing/build/lttngpy/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Linking CXX executable test_context_app"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/test_context_app.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/test_context_app.dir/build: test_context_app
.PHONY : CMakeFiles/test_context_app.dir/build

CMakeFiles/test_context_app.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/test_context_app.dir/cmake_clean.cmake
.PHONY : CMakeFiles/test_context_app.dir/clean

CMakeFiles/test_context_app.dir/depend:
	cd /home/justin/ros2_tracing_humble_demo_ws/src/ros2_tracing/build/lttngpy && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/justin/ros2_tracing_humble_demo_ws/src/ros2_tracing/lttngpy /home/justin/ros2_tracing_humble_demo_ws/src/ros2_tracing/lttngpy /home/justin/ros2_tracing_humble_demo_ws/src/ros2_tracing/build/lttngpy /home/justin/ros2_tracing_humble_demo_ws/src/ros2_tracing/build/lttngpy /home/justin/ros2_tracing_humble_demo_ws/src/ros2_tracing/build/lttngpy/CMakeFiles/test_context_app.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/test_context_app.dir/depend


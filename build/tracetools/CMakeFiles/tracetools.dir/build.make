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
include CMakeFiles/tracetools.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include CMakeFiles/tracetools.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/tracetools.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/tracetools.dir/flags.make

CMakeFiles/tracetools.dir/src/tracetools.c.o: CMakeFiles/tracetools.dir/flags.make
CMakeFiles/tracetools.dir/src/tracetools.c.o: /home/justin/ros2_tracing_humble_demo_ws/src/ros2_tracing/tracetools/src/tracetools.c
CMakeFiles/tracetools.dir/src/tracetools.c.o: CMakeFiles/tracetools.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/justin/ros2_tracing_humble_demo_ws/src/ros2_tracing/build/tracetools/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object CMakeFiles/tracetools.dir/src/tracetools.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/tracetools.dir/src/tracetools.c.o -MF CMakeFiles/tracetools.dir/src/tracetools.c.o.d -o CMakeFiles/tracetools.dir/src/tracetools.c.o -c /home/justin/ros2_tracing_humble_demo_ws/src/ros2_tracing/tracetools/src/tracetools.c

CMakeFiles/tracetools.dir/src/tracetools.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/tracetools.dir/src/tracetools.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/justin/ros2_tracing_humble_demo_ws/src/ros2_tracing/tracetools/src/tracetools.c > CMakeFiles/tracetools.dir/src/tracetools.c.i

CMakeFiles/tracetools.dir/src/tracetools.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/tracetools.dir/src/tracetools.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/justin/ros2_tracing_humble_demo_ws/src/ros2_tracing/tracetools/src/tracetools.c -o CMakeFiles/tracetools.dir/src/tracetools.c.s

CMakeFiles/tracetools.dir/src/utils.cpp.o: CMakeFiles/tracetools.dir/flags.make
CMakeFiles/tracetools.dir/src/utils.cpp.o: /home/justin/ros2_tracing_humble_demo_ws/src/ros2_tracing/tracetools/src/utils.cpp
CMakeFiles/tracetools.dir/src/utils.cpp.o: CMakeFiles/tracetools.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/justin/ros2_tracing_humble_demo_ws/src/ros2_tracing/build/tracetools/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object CMakeFiles/tracetools.dir/src/utils.cpp.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/tracetools.dir/src/utils.cpp.o -MF CMakeFiles/tracetools.dir/src/utils.cpp.o.d -o CMakeFiles/tracetools.dir/src/utils.cpp.o -c /home/justin/ros2_tracing_humble_demo_ws/src/ros2_tracing/tracetools/src/utils.cpp

CMakeFiles/tracetools.dir/src/utils.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/tracetools.dir/src/utils.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/justin/ros2_tracing_humble_demo_ws/src/ros2_tracing/tracetools/src/utils.cpp > CMakeFiles/tracetools.dir/src/utils.cpp.i

CMakeFiles/tracetools.dir/src/utils.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/tracetools.dir/src/utils.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/justin/ros2_tracing_humble_demo_ws/src/ros2_tracing/tracetools/src/utils.cpp -o CMakeFiles/tracetools.dir/src/utils.cpp.s

CMakeFiles/tracetools.dir/src/tp_call.c.o: CMakeFiles/tracetools.dir/flags.make
CMakeFiles/tracetools.dir/src/tp_call.c.o: /home/justin/ros2_tracing_humble_demo_ws/src/ros2_tracing/tracetools/src/tp_call.c
CMakeFiles/tracetools.dir/src/tp_call.c.o: CMakeFiles/tracetools.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/justin/ros2_tracing_humble_demo_ws/src/ros2_tracing/build/tracetools/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building C object CMakeFiles/tracetools.dir/src/tp_call.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/tracetools.dir/src/tp_call.c.o -MF CMakeFiles/tracetools.dir/src/tp_call.c.o.d -o CMakeFiles/tracetools.dir/src/tp_call.c.o -c /home/justin/ros2_tracing_humble_demo_ws/src/ros2_tracing/tracetools/src/tp_call.c

CMakeFiles/tracetools.dir/src/tp_call.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/tracetools.dir/src/tp_call.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/justin/ros2_tracing_humble_demo_ws/src/ros2_tracing/tracetools/src/tp_call.c > CMakeFiles/tracetools.dir/src/tp_call.c.i

CMakeFiles/tracetools.dir/src/tp_call.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/tracetools.dir/src/tp_call.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/justin/ros2_tracing_humble_demo_ws/src/ros2_tracing/tracetools/src/tp_call.c -o CMakeFiles/tracetools.dir/src/tp_call.c.s

# Object files for target tracetools
tracetools_OBJECTS = \
"CMakeFiles/tracetools.dir/src/tracetools.c.o" \
"CMakeFiles/tracetools.dir/src/utils.cpp.o" \
"CMakeFiles/tracetools.dir/src/tp_call.c.o"

# External object files for target tracetools
tracetools_EXTERNAL_OBJECTS =

libtracetools.so: CMakeFiles/tracetools.dir/src/tracetools.c.o
libtracetools.so: CMakeFiles/tracetools.dir/src/utils.cpp.o
libtracetools.so: CMakeFiles/tracetools.dir/src/tp_call.c.o
libtracetools.so: CMakeFiles/tracetools.dir/build.make
libtracetools.so: CMakeFiles/tracetools.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/justin/ros2_tracing_humble_demo_ws/src/ros2_tracing/build/tracetools/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Linking CXX shared library libtracetools.so"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/tracetools.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/tracetools.dir/build: libtracetools.so
.PHONY : CMakeFiles/tracetools.dir/build

CMakeFiles/tracetools.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/tracetools.dir/cmake_clean.cmake
.PHONY : CMakeFiles/tracetools.dir/clean

CMakeFiles/tracetools.dir/depend:
	cd /home/justin/ros2_tracing_humble_demo_ws/src/ros2_tracing/build/tracetools && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/justin/ros2_tracing_humble_demo_ws/src/ros2_tracing/tracetools /home/justin/ros2_tracing_humble_demo_ws/src/ros2_tracing/tracetools /home/justin/ros2_tracing_humble_demo_ws/src/ros2_tracing/build/tracetools /home/justin/ros2_tracing_humble_demo_ws/src/ros2_tracing/build/tracetools /home/justin/ros2_tracing_humble_demo_ws/src/ros2_tracing/build/tracetools/CMakeFiles/tracetools.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/tracetools.dir/depend

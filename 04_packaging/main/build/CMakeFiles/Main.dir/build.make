# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.27

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
CMAKE_COMMAND = /opt/homebrew/Cellar/cmake/3.27.6/bin/cmake

# The command to remove a file.
RM = /opt/homebrew/Cellar/cmake/3.27.6/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /Users/yuanchieh-at/Desktop/cmake_tutorial/04_packaging/main

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /Users/yuanchieh-at/Desktop/cmake_tutorial/04_packaging/main/build

# Include any dependencies generated for this target.
include CMakeFiles/Main.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include CMakeFiles/Main.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/Main.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/Main.dir/flags.make

CMakeFiles/Main.dir/main.cc.o: CMakeFiles/Main.dir/flags.make
CMakeFiles/Main.dir/main.cc.o: /Users/yuanchieh-at/Desktop/cmake_tutorial/04_packaging/main/main.cc
CMakeFiles/Main.dir/main.cc.o: CMakeFiles/Main.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/Users/yuanchieh-at/Desktop/cmake_tutorial/04_packaging/main/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/Main.dir/main.cc.o"
	/Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/Main.dir/main.cc.o -MF CMakeFiles/Main.dir/main.cc.o.d -o CMakeFiles/Main.dir/main.cc.o -c /Users/yuanchieh-at/Desktop/cmake_tutorial/04_packaging/main/main.cc

CMakeFiles/Main.dir/main.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/Main.dir/main.cc.i"
	/Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/yuanchieh-at/Desktop/cmake_tutorial/04_packaging/main/main.cc > CMakeFiles/Main.dir/main.cc.i

CMakeFiles/Main.dir/main.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/Main.dir/main.cc.s"
	/Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/yuanchieh-at/Desktop/cmake_tutorial/04_packaging/main/main.cc -o CMakeFiles/Main.dir/main.cc.s

# Object files for target Main
Main_OBJECTS = \
"CMakeFiles/Main.dir/main.cc.o"

# External object files for target Main
Main_EXTERNAL_OBJECTS =

Main: CMakeFiles/Main.dir/main.cc.o
Main: CMakeFiles/Main.dir/build.make
Main: /Users/yuanchieh-at/Desktop/cmake_tutorial/04_packaging/main/../shared_lib/build/libMyMath.dylib
Main: CMakeFiles/Main.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --bold --progress-dir=/Users/yuanchieh-at/Desktop/cmake_tutorial/04_packaging/main/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable Main"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/Main.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/Main.dir/build: Main
.PHONY : CMakeFiles/Main.dir/build

CMakeFiles/Main.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/Main.dir/cmake_clean.cmake
.PHONY : CMakeFiles/Main.dir/clean

CMakeFiles/Main.dir/depend:
	cd /Users/yuanchieh-at/Desktop/cmake_tutorial/04_packaging/main/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/yuanchieh-at/Desktop/cmake_tutorial/04_packaging/main /Users/yuanchieh-at/Desktop/cmake_tutorial/04_packaging/main /Users/yuanchieh-at/Desktop/cmake_tutorial/04_packaging/main/build /Users/yuanchieh-at/Desktop/cmake_tutorial/04_packaging/main/build /Users/yuanchieh-at/Desktop/cmake_tutorial/04_packaging/main/build/CMakeFiles/Main.dir/DependInfo.cmake "--color=$(COLOR)"
.PHONY : CMakeFiles/Main.dir/depend

# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.17

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
RM = /usr/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /mnt/c/Users/sluzhynskyi/Documents/ClionProjects/word_count2

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /mnt/c/Users/sluzhynskyi/Documents/ClionProjects/word_count2/cmake-build-debug

# Include any dependencies generated for this target.
include CMakeFiles/word_count.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/word_count.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/word_count.dir/flags.make

CMakeFiles/word_count.dir/src/main.cpp.o: CMakeFiles/word_count.dir/flags.make
CMakeFiles/word_count.dir/src/main.cpp.o: ../src/main.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/mnt/c/Users/sluzhynskyi/Documents/ClionProjects/word_count2/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/word_count.dir/src/main.cpp.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/word_count.dir/src/main.cpp.o -c /mnt/c/Users/sluzhynskyi/Documents/ClionProjects/word_count2/src/main.cpp

CMakeFiles/word_count.dir/src/main.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/word_count.dir/src/main.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /mnt/c/Users/sluzhynskyi/Documents/ClionProjects/word_count2/src/main.cpp > CMakeFiles/word_count.dir/src/main.cpp.i

CMakeFiles/word_count.dir/src/main.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/word_count.dir/src/main.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /mnt/c/Users/sluzhynskyi/Documents/ClionProjects/word_count2/src/main.cpp -o CMakeFiles/word_count.dir/src/main.cpp.s

CMakeFiles/word_count.dir/lib/read_write.cpp.o: CMakeFiles/word_count.dir/flags.make
CMakeFiles/word_count.dir/lib/read_write.cpp.o: ../lib/read_write.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/mnt/c/Users/sluzhynskyi/Documents/ClionProjects/word_count2/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object CMakeFiles/word_count.dir/lib/read_write.cpp.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/word_count.dir/lib/read_write.cpp.o -c /mnt/c/Users/sluzhynskyi/Documents/ClionProjects/word_count2/lib/read_write.cpp

CMakeFiles/word_count.dir/lib/read_write.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/word_count.dir/lib/read_write.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /mnt/c/Users/sluzhynskyi/Documents/ClionProjects/word_count2/lib/read_write.cpp > CMakeFiles/word_count.dir/lib/read_write.cpp.i

CMakeFiles/word_count.dir/lib/read_write.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/word_count.dir/lib/read_write.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /mnt/c/Users/sluzhynskyi/Documents/ClionProjects/word_count2/lib/read_write.cpp -o CMakeFiles/word_count.dir/lib/read_write.cpp.s

CMakeFiles/word_count.dir/lib/sort.cpp.o: CMakeFiles/word_count.dir/flags.make
CMakeFiles/word_count.dir/lib/sort.cpp.o: ../lib/sort.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/mnt/c/Users/sluzhynskyi/Documents/ClionProjects/word_count2/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building CXX object CMakeFiles/word_count.dir/lib/sort.cpp.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/word_count.dir/lib/sort.cpp.o -c /mnt/c/Users/sluzhynskyi/Documents/ClionProjects/word_count2/lib/sort.cpp

CMakeFiles/word_count.dir/lib/sort.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/word_count.dir/lib/sort.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /mnt/c/Users/sluzhynskyi/Documents/ClionProjects/word_count2/lib/sort.cpp > CMakeFiles/word_count.dir/lib/sort.cpp.i

CMakeFiles/word_count.dir/lib/sort.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/word_count.dir/lib/sort.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /mnt/c/Users/sluzhynskyi/Documents/ClionProjects/word_count2/lib/sort.cpp -o CMakeFiles/word_count.dir/lib/sort.cpp.s

# Object files for target word_count
word_count_OBJECTS = \
"CMakeFiles/word_count.dir/src/main.cpp.o" \
"CMakeFiles/word_count.dir/lib/read_write.cpp.o" \
"CMakeFiles/word_count.dir/lib/sort.cpp.o"

# External object files for target word_count
word_count_EXTERNAL_OBJECTS =

word_count: CMakeFiles/word_count.dir/src/main.cpp.o
word_count: CMakeFiles/word_count.dir/lib/read_write.cpp.o
word_count: CMakeFiles/word_count.dir/lib/sort.cpp.o
word_count: CMakeFiles/word_count.dir/build.make
word_count: /usr/lib/x86_64-linux-gnu/libicuuc.so
word_count: /usr/lib/x86_64-linux-gnu/libicui18n.so
word_count: /usr/lib/x86_64-linux-gnu/libboost_locale.so
word_count: /usr/lib/x86_64-linux-gnu/libboost_filesystem.so
word_count: /usr/lib/x86_64-linux-gnu/libboost_system.so
word_count: /usr/lib/x86_64-linux-gnu/libboost_program_options.so
word_count: /usr/lib/x86_64-linux-gnu/libarchive.so
word_count: CMakeFiles/word_count.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/mnt/c/Users/sluzhynskyi/Documents/ClionProjects/word_count2/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Linking CXX executable word_count"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/word_count.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/word_count.dir/build: word_count

.PHONY : CMakeFiles/word_count.dir/build

CMakeFiles/word_count.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/word_count.dir/cmake_clean.cmake
.PHONY : CMakeFiles/word_count.dir/clean

CMakeFiles/word_count.dir/depend:
	cd /mnt/c/Users/sluzhynskyi/Documents/ClionProjects/word_count2/cmake-build-debug && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /mnt/c/Users/sluzhynskyi/Documents/ClionProjects/word_count2 /mnt/c/Users/sluzhynskyi/Documents/ClionProjects/word_count2 /mnt/c/Users/sluzhynskyi/Documents/ClionProjects/word_count2/cmake-build-debug /mnt/c/Users/sluzhynskyi/Documents/ClionProjects/word_count2/cmake-build-debug /mnt/c/Users/sluzhynskyi/Documents/ClionProjects/word_count2/cmake-build-debug/CMakeFiles/word_count.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/word_count.dir/depend


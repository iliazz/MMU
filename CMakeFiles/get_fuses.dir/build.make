# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.5

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
CMAKE_SOURCE_DIR = /media/johu/data/Projekte/newco/firmware/MMU

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /media/johu/data/Projekte/newco/firmware/MMU-build

# Utility rule file for get_fuses.

# Include the progress variables for this target.
include CMakeFiles/get_fuses.dir/progress.make

CMakeFiles/get_fuses:
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/media/johu/data/Projekte/newco/firmware/MMU-build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Get fuses from atmega88p"
	avrdude -p atmega88p -c avrispmkII -P usb -n -U lfuse:r:-:b -U hfuse:r:-:b

get_fuses: CMakeFiles/get_fuses
get_fuses: CMakeFiles/get_fuses.dir/build.make

.PHONY : get_fuses

# Rule to build all files generated by this target.
CMakeFiles/get_fuses.dir/build: get_fuses

.PHONY : CMakeFiles/get_fuses.dir/build

CMakeFiles/get_fuses.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/get_fuses.dir/cmake_clean.cmake
.PHONY : CMakeFiles/get_fuses.dir/clean

CMakeFiles/get_fuses.dir/depend:
	cd /media/johu/data/Projekte/newco/firmware/MMU-build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /media/johu/data/Projekte/newco/firmware/MMU /media/johu/data/Projekte/newco/firmware/MMU /media/johu/data/Projekte/newco/firmware/MMU-build /media/johu/data/Projekte/newco/firmware/MMU-build /media/johu/data/Projekte/newco/firmware/MMU-build/CMakeFiles/get_fuses.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/get_fuses.dir/depend

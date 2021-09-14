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

# Utility rule file for upload_MMU.

# Include the progress variables for this target.
include CMakeFiles/upload_MMU.dir/progress.make

CMakeFiles/upload_MMU: MMU-atmega88p.hex
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/media/johu/data/Projekte/newco/firmware/MMU-build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Uploading MMU-atmega88p.hex to atmega88p using avrispmkII"
	avrdude -p atmega88p -c avrispmkII -U flash:w:MMU-atmega88p.hex -P usb

MMU-atmega88p.hex: MMU-atmega88p.elf
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/media/johu/data/Projekte/newco/firmware/MMU-build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Generating MMU-atmega88p.hex"
	/usr/bin/avr-objcopy -j .bootloader -j .text -j .data -O ihex MMU-atmega88p.elf MMU-atmega88p.hex
	/usr/bin/avr-size -C --mcu=atmega88p MMU-atmega88p.elf

upload_MMU: CMakeFiles/upload_MMU
upload_MMU: MMU-atmega88p.hex
upload_MMU: CMakeFiles/upload_MMU.dir/build.make

.PHONY : upload_MMU

# Rule to build all files generated by this target.
CMakeFiles/upload_MMU.dir/build: upload_MMU

.PHONY : CMakeFiles/upload_MMU.dir/build

CMakeFiles/upload_MMU.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/upload_MMU.dir/cmake_clean.cmake
.PHONY : CMakeFiles/upload_MMU.dir/clean

CMakeFiles/upload_MMU.dir/depend:
	cd /media/johu/data/Projekte/newco/firmware/MMU-build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /media/johu/data/Projekte/newco/firmware/MMU /media/johu/data/Projekte/newco/firmware/MMU /media/johu/data/Projekte/newco/firmware/MMU-build /media/johu/data/Projekte/newco/firmware/MMU-build /media/johu/data/Projekte/newco/firmware/MMU-build/CMakeFiles/upload_MMU.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/upload_MMU.dir/depend

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

# Include any dependencies generated for this target.
include CMakeFiles/MMU-atmega88p.elf.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/MMU-atmega88p.elf.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/MMU-atmega88p.elf.dir/flags.make

CMakeFiles/MMU-atmega88p.elf.dir/main.c.obj: CMakeFiles/MMU-atmega88p.elf.dir/flags.make
CMakeFiles/MMU-atmega88p.elf.dir/main.c.obj: /media/johu/data/Projekte/newco/firmware/MMU/main.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/media/johu/data/Projekte/newco/firmware/MMU-build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object CMakeFiles/MMU-atmega88p.elf.dir/main.c.obj"
	/usr/bin/avr-gcc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/MMU-atmega88p.elf.dir/main.c.obj   -c /media/johu/data/Projekte/newco/firmware/MMU/main.c

CMakeFiles/MMU-atmega88p.elf.dir/main.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/MMU-atmega88p.elf.dir/main.c.i"
	/usr/bin/avr-gcc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /media/johu/data/Projekte/newco/firmware/MMU/main.c > CMakeFiles/MMU-atmega88p.elf.dir/main.c.i

CMakeFiles/MMU-atmega88p.elf.dir/main.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/MMU-atmega88p.elf.dir/main.c.s"
	/usr/bin/avr-gcc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /media/johu/data/Projekte/newco/firmware/MMU/main.c -o CMakeFiles/MMU-atmega88p.elf.dir/main.c.s

CMakeFiles/MMU-atmega88p.elf.dir/main.c.obj.requires:

.PHONY : CMakeFiles/MMU-atmega88p.elf.dir/main.c.obj.requires

CMakeFiles/MMU-atmega88p.elf.dir/main.c.obj.provides: CMakeFiles/MMU-atmega88p.elf.dir/main.c.obj.requires
	$(MAKE) -f CMakeFiles/MMU-atmega88p.elf.dir/build.make CMakeFiles/MMU-atmega88p.elf.dir/main.c.obj.provides.build
.PHONY : CMakeFiles/MMU-atmega88p.elf.dir/main.c.obj.provides

CMakeFiles/MMU-atmega88p.elf.dir/main.c.obj.provides.build: CMakeFiles/MMU-atmega88p.elf.dir/main.c.obj


CMakeFiles/MMU-atmega88p.elf.dir/media/johu/data/Projekte/newco/firmware/common/sercom.c.obj: CMakeFiles/MMU-atmega88p.elf.dir/flags.make
CMakeFiles/MMU-atmega88p.elf.dir/media/johu/data/Projekte/newco/firmware/common/sercom.c.obj: /media/johu/data/Projekte/newco/firmware/common/sercom.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/media/johu/data/Projekte/newco/firmware/MMU-build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building C object CMakeFiles/MMU-atmega88p.elf.dir/media/johu/data/Projekte/newco/firmware/common/sercom.c.obj"
	/usr/bin/avr-gcc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/MMU-atmega88p.elf.dir/media/johu/data/Projekte/newco/firmware/common/sercom.c.obj   -c /media/johu/data/Projekte/newco/firmware/common/sercom.c

CMakeFiles/MMU-atmega88p.elf.dir/media/johu/data/Projekte/newco/firmware/common/sercom.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/MMU-atmega88p.elf.dir/media/johu/data/Projekte/newco/firmware/common/sercom.c.i"
	/usr/bin/avr-gcc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /media/johu/data/Projekte/newco/firmware/common/sercom.c > CMakeFiles/MMU-atmega88p.elf.dir/media/johu/data/Projekte/newco/firmware/common/sercom.c.i

CMakeFiles/MMU-atmega88p.elf.dir/media/johu/data/Projekte/newco/firmware/common/sercom.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/MMU-atmega88p.elf.dir/media/johu/data/Projekte/newco/firmware/common/sercom.c.s"
	/usr/bin/avr-gcc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /media/johu/data/Projekte/newco/firmware/common/sercom.c -o CMakeFiles/MMU-atmega88p.elf.dir/media/johu/data/Projekte/newco/firmware/common/sercom.c.s

CMakeFiles/MMU-atmega88p.elf.dir/media/johu/data/Projekte/newco/firmware/common/sercom.c.obj.requires:

.PHONY : CMakeFiles/MMU-atmega88p.elf.dir/media/johu/data/Projekte/newco/firmware/common/sercom.c.obj.requires

CMakeFiles/MMU-atmega88p.elf.dir/media/johu/data/Projekte/newco/firmware/common/sercom.c.obj.provides: CMakeFiles/MMU-atmega88p.elf.dir/media/johu/data/Projekte/newco/firmware/common/sercom.c.obj.requires
	$(MAKE) -f CMakeFiles/MMU-atmega88p.elf.dir/build.make CMakeFiles/MMU-atmega88p.elf.dir/media/johu/data/Projekte/newco/firmware/common/sercom.c.obj.provides.build
.PHONY : CMakeFiles/MMU-atmega88p.elf.dir/media/johu/data/Projekte/newco/firmware/common/sercom.c.obj.provides

CMakeFiles/MMU-atmega88p.elf.dir/media/johu/data/Projekte/newco/firmware/common/sercom.c.obj.provides.build: CMakeFiles/MMU-atmega88p.elf.dir/media/johu/data/Projekte/newco/firmware/common/sercom.c.obj


CMakeFiles/MMU-atmega88p.elf.dir/terminal.c.obj: CMakeFiles/MMU-atmega88p.elf.dir/flags.make
CMakeFiles/MMU-atmega88p.elf.dir/terminal.c.obj: /media/johu/data/Projekte/newco/firmware/MMU/terminal.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/media/johu/data/Projekte/newco/firmware/MMU-build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building C object CMakeFiles/MMU-atmega88p.elf.dir/terminal.c.obj"
	/usr/bin/avr-gcc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/MMU-atmega88p.elf.dir/terminal.c.obj   -c /media/johu/data/Projekte/newco/firmware/MMU/terminal.c

CMakeFiles/MMU-atmega88p.elf.dir/terminal.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/MMU-atmega88p.elf.dir/terminal.c.i"
	/usr/bin/avr-gcc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /media/johu/data/Projekte/newco/firmware/MMU/terminal.c > CMakeFiles/MMU-atmega88p.elf.dir/terminal.c.i

CMakeFiles/MMU-atmega88p.elf.dir/terminal.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/MMU-atmega88p.elf.dir/terminal.c.s"
	/usr/bin/avr-gcc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /media/johu/data/Projekte/newco/firmware/MMU/terminal.c -o CMakeFiles/MMU-atmega88p.elf.dir/terminal.c.s

CMakeFiles/MMU-atmega88p.elf.dir/terminal.c.obj.requires:

.PHONY : CMakeFiles/MMU-atmega88p.elf.dir/terminal.c.obj.requires

CMakeFiles/MMU-atmega88p.elf.dir/terminal.c.obj.provides: CMakeFiles/MMU-atmega88p.elf.dir/terminal.c.obj.requires
	$(MAKE) -f CMakeFiles/MMU-atmega88p.elf.dir/build.make CMakeFiles/MMU-atmega88p.elf.dir/terminal.c.obj.provides.build
.PHONY : CMakeFiles/MMU-atmega88p.elf.dir/terminal.c.obj.provides

CMakeFiles/MMU-atmega88p.elf.dir/terminal.c.obj.provides.build: CMakeFiles/MMU-atmega88p.elf.dir/terminal.c.obj


CMakeFiles/MMU-atmega88p.elf.dir/terminal_prj.c.obj: CMakeFiles/MMU-atmega88p.elf.dir/flags.make
CMakeFiles/MMU-atmega88p.elf.dir/terminal_prj.c.obj: /media/johu/data/Projekte/newco/firmware/MMU/terminal_prj.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/media/johu/data/Projekte/newco/firmware/MMU-build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building C object CMakeFiles/MMU-atmega88p.elf.dir/terminal_prj.c.obj"
	/usr/bin/avr-gcc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/MMU-atmega88p.elf.dir/terminal_prj.c.obj   -c /media/johu/data/Projekte/newco/firmware/MMU/terminal_prj.c

CMakeFiles/MMU-atmega88p.elf.dir/terminal_prj.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/MMU-atmega88p.elf.dir/terminal_prj.c.i"
	/usr/bin/avr-gcc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /media/johu/data/Projekte/newco/firmware/MMU/terminal_prj.c > CMakeFiles/MMU-atmega88p.elf.dir/terminal_prj.c.i

CMakeFiles/MMU-atmega88p.elf.dir/terminal_prj.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/MMU-atmega88p.elf.dir/terminal_prj.c.s"
	/usr/bin/avr-gcc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /media/johu/data/Projekte/newco/firmware/MMU/terminal_prj.c -o CMakeFiles/MMU-atmega88p.elf.dir/terminal_prj.c.s

CMakeFiles/MMU-atmega88p.elf.dir/terminal_prj.c.obj.requires:

.PHONY : CMakeFiles/MMU-atmega88p.elf.dir/terminal_prj.c.obj.requires

CMakeFiles/MMU-atmega88p.elf.dir/terminal_prj.c.obj.provides: CMakeFiles/MMU-atmega88p.elf.dir/terminal_prj.c.obj.requires
	$(MAKE) -f CMakeFiles/MMU-atmega88p.elf.dir/build.make CMakeFiles/MMU-atmega88p.elf.dir/terminal_prj.c.obj.provides.build
.PHONY : CMakeFiles/MMU-atmega88p.elf.dir/terminal_prj.c.obj.provides

CMakeFiles/MMU-atmega88p.elf.dir/terminal_prj.c.obj.provides.build: CMakeFiles/MMU-atmega88p.elf.dir/terminal_prj.c.obj


CMakeFiles/MMU-atmega88p.elf.dir/uart.c.obj: CMakeFiles/MMU-atmega88p.elf.dir/flags.make
CMakeFiles/MMU-atmega88p.elf.dir/uart.c.obj: /media/johu/data/Projekte/newco/firmware/MMU/uart.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/media/johu/data/Projekte/newco/firmware/MMU-build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Building C object CMakeFiles/MMU-atmega88p.elf.dir/uart.c.obj"
	/usr/bin/avr-gcc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/MMU-atmega88p.elf.dir/uart.c.obj   -c /media/johu/data/Projekte/newco/firmware/MMU/uart.c

CMakeFiles/MMU-atmega88p.elf.dir/uart.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/MMU-atmega88p.elf.dir/uart.c.i"
	/usr/bin/avr-gcc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /media/johu/data/Projekte/newco/firmware/MMU/uart.c > CMakeFiles/MMU-atmega88p.elf.dir/uart.c.i

CMakeFiles/MMU-atmega88p.elf.dir/uart.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/MMU-atmega88p.elf.dir/uart.c.s"
	/usr/bin/avr-gcc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /media/johu/data/Projekte/newco/firmware/MMU/uart.c -o CMakeFiles/MMU-atmega88p.elf.dir/uart.c.s

CMakeFiles/MMU-atmega88p.elf.dir/uart.c.obj.requires:

.PHONY : CMakeFiles/MMU-atmega88p.elf.dir/uart.c.obj.requires

CMakeFiles/MMU-atmega88p.elf.dir/uart.c.obj.provides: CMakeFiles/MMU-atmega88p.elf.dir/uart.c.obj.requires
	$(MAKE) -f CMakeFiles/MMU-atmega88p.elf.dir/build.make CMakeFiles/MMU-atmega88p.elf.dir/uart.c.obj.provides.build
.PHONY : CMakeFiles/MMU-atmega88p.elf.dir/uart.c.obj.provides

CMakeFiles/MMU-atmega88p.elf.dir/uart.c.obj.provides.build: CMakeFiles/MMU-atmega88p.elf.dir/uart.c.obj


CMakeFiles/MMU-atmega88p.elf.dir/media/johu/data/Projekte/newco/firmware/common/utils.c.obj: CMakeFiles/MMU-atmega88p.elf.dir/flags.make
CMakeFiles/MMU-atmega88p.elf.dir/media/johu/data/Projekte/newco/firmware/common/utils.c.obj: /media/johu/data/Projekte/newco/firmware/common/utils.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/media/johu/data/Projekte/newco/firmware/MMU-build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_6) "Building C object CMakeFiles/MMU-atmega88p.elf.dir/media/johu/data/Projekte/newco/firmware/common/utils.c.obj"
	/usr/bin/avr-gcc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/MMU-atmega88p.elf.dir/media/johu/data/Projekte/newco/firmware/common/utils.c.obj   -c /media/johu/data/Projekte/newco/firmware/common/utils.c

CMakeFiles/MMU-atmega88p.elf.dir/media/johu/data/Projekte/newco/firmware/common/utils.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/MMU-atmega88p.elf.dir/media/johu/data/Projekte/newco/firmware/common/utils.c.i"
	/usr/bin/avr-gcc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /media/johu/data/Projekte/newco/firmware/common/utils.c > CMakeFiles/MMU-atmega88p.elf.dir/media/johu/data/Projekte/newco/firmware/common/utils.c.i

CMakeFiles/MMU-atmega88p.elf.dir/media/johu/data/Projekte/newco/firmware/common/utils.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/MMU-atmega88p.elf.dir/media/johu/data/Projekte/newco/firmware/common/utils.c.s"
	/usr/bin/avr-gcc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /media/johu/data/Projekte/newco/firmware/common/utils.c -o CMakeFiles/MMU-atmega88p.elf.dir/media/johu/data/Projekte/newco/firmware/common/utils.c.s

CMakeFiles/MMU-atmega88p.elf.dir/media/johu/data/Projekte/newco/firmware/common/utils.c.obj.requires:

.PHONY : CMakeFiles/MMU-atmega88p.elf.dir/media/johu/data/Projekte/newco/firmware/common/utils.c.obj.requires

CMakeFiles/MMU-atmega88p.elf.dir/media/johu/data/Projekte/newco/firmware/common/utils.c.obj.provides: CMakeFiles/MMU-atmega88p.elf.dir/media/johu/data/Projekte/newco/firmware/common/utils.c.obj.requires
	$(MAKE) -f CMakeFiles/MMU-atmega88p.elf.dir/build.make CMakeFiles/MMU-atmega88p.elf.dir/media/johu/data/Projekte/newco/firmware/common/utils.c.obj.provides.build
.PHONY : CMakeFiles/MMU-atmega88p.elf.dir/media/johu/data/Projekte/newco/firmware/common/utils.c.obj.provides

CMakeFiles/MMU-atmega88p.elf.dir/media/johu/data/Projekte/newco/firmware/common/utils.c.obj.provides.build: CMakeFiles/MMU-atmega88p.elf.dir/media/johu/data/Projekte/newco/firmware/common/utils.c.obj


CMakeFiles/MMU-atmega88p.elf.dir/updater.c.obj: CMakeFiles/MMU-atmega88p.elf.dir/flags.make
CMakeFiles/MMU-atmega88p.elf.dir/updater.c.obj: /media/johu/data/Projekte/newco/firmware/MMU/updater.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/media/johu/data/Projekte/newco/firmware/MMU-build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_7) "Building C object CMakeFiles/MMU-atmega88p.elf.dir/updater.c.obj"
	/usr/bin/avr-gcc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/MMU-atmega88p.elf.dir/updater.c.obj   -c /media/johu/data/Projekte/newco/firmware/MMU/updater.c

CMakeFiles/MMU-atmega88p.elf.dir/updater.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/MMU-atmega88p.elf.dir/updater.c.i"
	/usr/bin/avr-gcc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /media/johu/data/Projekte/newco/firmware/MMU/updater.c > CMakeFiles/MMU-atmega88p.elf.dir/updater.c.i

CMakeFiles/MMU-atmega88p.elf.dir/updater.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/MMU-atmega88p.elf.dir/updater.c.s"
	/usr/bin/avr-gcc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /media/johu/data/Projekte/newco/firmware/MMU/updater.c -o CMakeFiles/MMU-atmega88p.elf.dir/updater.c.s

CMakeFiles/MMU-atmega88p.elf.dir/updater.c.obj.requires:

.PHONY : CMakeFiles/MMU-atmega88p.elf.dir/updater.c.obj.requires

CMakeFiles/MMU-atmega88p.elf.dir/updater.c.obj.provides: CMakeFiles/MMU-atmega88p.elf.dir/updater.c.obj.requires
	$(MAKE) -f CMakeFiles/MMU-atmega88p.elf.dir/build.make CMakeFiles/MMU-atmega88p.elf.dir/updater.c.obj.provides.build
.PHONY : CMakeFiles/MMU-atmega88p.elf.dir/updater.c.obj.provides

CMakeFiles/MMU-atmega88p.elf.dir/updater.c.obj.provides.build: CMakeFiles/MMU-atmega88p.elf.dir/updater.c.obj


# Object files for target MMU-atmega88p.elf
MMU__atmega88p_elf_OBJECTS = \
"CMakeFiles/MMU-atmega88p.elf.dir/main.c.obj" \
"CMakeFiles/MMU-atmega88p.elf.dir/media/johu/data/Projekte/newco/firmware/common/sercom.c.obj" \
"CMakeFiles/MMU-atmega88p.elf.dir/terminal.c.obj" \
"CMakeFiles/MMU-atmega88p.elf.dir/terminal_prj.c.obj" \
"CMakeFiles/MMU-atmega88p.elf.dir/uart.c.obj" \
"CMakeFiles/MMU-atmega88p.elf.dir/media/johu/data/Projekte/newco/firmware/common/utils.c.obj" \
"CMakeFiles/MMU-atmega88p.elf.dir/updater.c.obj"

# External object files for target MMU-atmega88p.elf
MMU__atmega88p_elf_EXTERNAL_OBJECTS =

MMU-atmega88p.elf: CMakeFiles/MMU-atmega88p.elf.dir/main.c.obj
MMU-atmega88p.elf: CMakeFiles/MMU-atmega88p.elf.dir/media/johu/data/Projekte/newco/firmware/common/sercom.c.obj
MMU-atmega88p.elf: CMakeFiles/MMU-atmega88p.elf.dir/terminal.c.obj
MMU-atmega88p.elf: CMakeFiles/MMU-atmega88p.elf.dir/terminal_prj.c.obj
MMU-atmega88p.elf: CMakeFiles/MMU-atmega88p.elf.dir/uart.c.obj
MMU-atmega88p.elf: CMakeFiles/MMU-atmega88p.elf.dir/media/johu/data/Projekte/newco/firmware/common/utils.c.obj
MMU-atmega88p.elf: CMakeFiles/MMU-atmega88p.elf.dir/updater.c.obj
MMU-atmega88p.elf: CMakeFiles/MMU-atmega88p.elf.dir/build.make
MMU-atmega88p.elf: CMakeFiles/MMU-atmega88p.elf.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/media/johu/data/Projekte/newco/firmware/MMU-build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_8) "Linking C executable MMU-atmega88p.elf"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/MMU-atmega88p.elf.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/MMU-atmega88p.elf.dir/build: MMU-atmega88p.elf

.PHONY : CMakeFiles/MMU-atmega88p.elf.dir/build

CMakeFiles/MMU-atmega88p.elf.dir/requires: CMakeFiles/MMU-atmega88p.elf.dir/main.c.obj.requires
CMakeFiles/MMU-atmega88p.elf.dir/requires: CMakeFiles/MMU-atmega88p.elf.dir/media/johu/data/Projekte/newco/firmware/common/sercom.c.obj.requires
CMakeFiles/MMU-atmega88p.elf.dir/requires: CMakeFiles/MMU-atmega88p.elf.dir/terminal.c.obj.requires
CMakeFiles/MMU-atmega88p.elf.dir/requires: CMakeFiles/MMU-atmega88p.elf.dir/terminal_prj.c.obj.requires
CMakeFiles/MMU-atmega88p.elf.dir/requires: CMakeFiles/MMU-atmega88p.elf.dir/uart.c.obj.requires
CMakeFiles/MMU-atmega88p.elf.dir/requires: CMakeFiles/MMU-atmega88p.elf.dir/media/johu/data/Projekte/newco/firmware/common/utils.c.obj.requires
CMakeFiles/MMU-atmega88p.elf.dir/requires: CMakeFiles/MMU-atmega88p.elf.dir/updater.c.obj.requires

.PHONY : CMakeFiles/MMU-atmega88p.elf.dir/requires

CMakeFiles/MMU-atmega88p.elf.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/MMU-atmega88p.elf.dir/cmake_clean.cmake
.PHONY : CMakeFiles/MMU-atmega88p.elf.dir/clean

CMakeFiles/MMU-atmega88p.elf.dir/depend:
	cd /media/johu/data/Projekte/newco/firmware/MMU-build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /media/johu/data/Projekte/newco/firmware/MMU /media/johu/data/Projekte/newco/firmware/MMU /media/johu/data/Projekte/newco/firmware/MMU-build /media/johu/data/Projekte/newco/firmware/MMU-build /media/johu/data/Projekte/newco/firmware/MMU-build/CMakeFiles/MMU-atmega88p.elf.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/MMU-atmega88p.elf.dir/depend


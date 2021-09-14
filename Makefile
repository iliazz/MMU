# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.5

# Default target executed when no arguments are given to make.
default_target: all

.PHONY : default_target

# Allow only one "make -f Makefile2" at a time, but pass parallelism.
.NOTPARALLEL:


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
CMAKE_SOURCE_DIR = /home/johu/Projekte/e-umbau/firmware/MMU

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/johu/Projekte/e-umbau/firmware/MMU/Release

#=============================================================================
# Targets provided globally by CMake.

# Special rule for the target edit_cache
edit_cache:
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --cyan "No interactive CMake dialog available..."
	/usr/bin/cmake -E echo No\ interactive\ CMake\ dialog\ available.
.PHONY : edit_cache

# Special rule for the target edit_cache
edit_cache/fast: edit_cache

.PHONY : edit_cache/fast

# Special rule for the target rebuild_cache
rebuild_cache:
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --cyan "Running CMake to regenerate build system..."
	/usr/bin/cmake -H$(CMAKE_SOURCE_DIR) -B$(CMAKE_BINARY_DIR)
.PHONY : rebuild_cache

# Special rule for the target rebuild_cache
rebuild_cache/fast: rebuild_cache

.PHONY : rebuild_cache/fast

# The main all target
all: cmake_check_build_system
	$(CMAKE_COMMAND) -E cmake_progress_start /home/johu/Projekte/e-umbau/firmware/MMU/CMakeFiles /home/johu/Projekte/e-umbau/firmware/MMU/CMakeFiles/progress.marks
	$(MAKE) -f CMakeFiles/Makefile2 all
	$(CMAKE_COMMAND) -E cmake_progress_start /home/johu/Projekte/e-umbau/firmware/MMU/CMakeFiles 0
.PHONY : all

# The main clean target
clean:
	$(MAKE) -f CMakeFiles/Makefile2 clean
.PHONY : clean

# The main clean target
clean/fast: clean

.PHONY : clean/fast

# Prepare targets for installation.
preinstall: all
	$(MAKE) -f CMakeFiles/Makefile2 preinstall
.PHONY : preinstall

# Prepare targets for installation.
preinstall/fast:
	$(MAKE) -f CMakeFiles/Makefile2 preinstall
.PHONY : preinstall/fast

# clear depends
depend:
	$(CMAKE_COMMAND) -H$(CMAKE_SOURCE_DIR) -B$(CMAKE_BINARY_DIR) --check-build-system CMakeFiles/Makefile.cmake 1
.PHONY : depend

#=============================================================================
# Target rules for targets named upload_eeprom

# Build rule for target.
upload_eeprom: cmake_check_build_system
	$(MAKE) -f CMakeFiles/Makefile2 upload_eeprom
.PHONY : upload_eeprom

# fast build rule for target.
upload_eeprom/fast:
	$(MAKE) -f CMakeFiles/upload_eeprom.dir/build.make CMakeFiles/upload_eeprom.dir/build
.PHONY : upload_eeprom/fast

#=============================================================================
# Target rules for targets named MMU

# Build rule for target.
MMU: cmake_check_build_system
	$(MAKE) -f CMakeFiles/Makefile2 MMU
.PHONY : MMU

# fast build rule for target.
MMU/fast:
	$(MAKE) -f CMakeFiles/MMU.dir/build.make CMakeFiles/MMU.dir/build
.PHONY : MMU/fast

#=============================================================================
# Target rules for targets named upload_MMU

# Build rule for target.
upload_MMU: cmake_check_build_system
	$(MAKE) -f CMakeFiles/Makefile2 upload_MMU
.PHONY : upload_MMU

# fast build rule for target.
upload_MMU/fast:
	$(MAKE) -f CMakeFiles/upload_MMU.dir/build.make CMakeFiles/upload_MMU.dir/build
.PHONY : upload_MMU/fast

#=============================================================================
# Target rules for targets named MMU-atmega88p.elf

# Build rule for target.
MMU-atmega88p.elf: cmake_check_build_system
	$(MAKE) -f CMakeFiles/Makefile2 MMU-atmega88p.elf
.PHONY : MMU-atmega88p.elf

# fast build rule for target.
MMU-atmega88p.elf/fast:
	$(MAKE) -f CMakeFiles/MMU-atmega88p.elf.dir/build.make CMakeFiles/MMU-atmega88p.elf.dir/build
.PHONY : MMU-atmega88p.elf/fast

#=============================================================================
# Target rules for targets named set_calibration

# Build rule for target.
set_calibration: cmake_check_build_system
	$(MAKE) -f CMakeFiles/Makefile2 set_calibration
.PHONY : set_calibration

# fast build rule for target.
set_calibration/fast:
	$(MAKE) -f CMakeFiles/set_calibration.dir/build.make CMakeFiles/set_calibration.dir/build
.PHONY : set_calibration/fast

#=============================================================================
# Target rules for targets named disassemble_MMU

# Build rule for target.
disassemble_MMU: cmake_check_build_system
	$(MAKE) -f CMakeFiles/Makefile2 disassemble_MMU
.PHONY : disassemble_MMU

# fast build rule for target.
disassemble_MMU/fast:
	$(MAKE) -f CMakeFiles/disassemble_MMU.dir/build.make CMakeFiles/disassemble_MMU.dir/build
.PHONY : disassemble_MMU/fast

#=============================================================================
# Target rules for targets named get_calibration

# Build rule for target.
get_calibration: cmake_check_build_system
	$(MAKE) -f CMakeFiles/Makefile2 get_calibration
.PHONY : get_calibration

# fast build rule for target.
get_calibration/fast:
	$(MAKE) -f CMakeFiles/get_calibration.dir/build.make CMakeFiles/get_calibration.dir/build
.PHONY : get_calibration/fast

#=============================================================================
# Target rules for targets named get_status

# Build rule for target.
get_status: cmake_check_build_system
	$(MAKE) -f CMakeFiles/Makefile2 get_status
.PHONY : get_status

# fast build rule for target.
get_status/fast:
	$(MAKE) -f CMakeFiles/get_status.dir/build.make CMakeFiles/get_status.dir/build
.PHONY : get_status/fast

#=============================================================================
# Target rules for targets named get_fuses

# Build rule for target.
get_fuses: cmake_check_build_system
	$(MAKE) -f CMakeFiles/Makefile2 get_fuses
.PHONY : get_fuses

# fast build rule for target.
get_fuses/fast:
	$(MAKE) -f CMakeFiles/get_fuses.dir/build.make CMakeFiles/get_fuses.dir/build
.PHONY : get_fuses/fast

#=============================================================================
# Target rules for targets named set_fuses

# Build rule for target.
set_fuses: cmake_check_build_system
	$(MAKE) -f CMakeFiles/Makefile2 set_fuses
.PHONY : set_fuses

# fast build rule for target.
set_fuses/fast:
	$(MAKE) -f CMakeFiles/set_fuses.dir/build.make CMakeFiles/set_fuses.dir/build
.PHONY : set_fuses/fast

main.obj: main.c.obj

.PHONY : main.obj

# target to build an object file
main.c.obj:
	$(MAKE) -f CMakeFiles/MMU-atmega88p.elf.dir/build.make CMakeFiles/MMU-atmega88p.elf.dir/main.c.obj
.PHONY : main.c.obj

main.i: main.c.i

.PHONY : main.i

# target to preprocess a source file
main.c.i:
	$(MAKE) -f CMakeFiles/MMU-atmega88p.elf.dir/build.make CMakeFiles/MMU-atmega88p.elf.dir/main.c.i
.PHONY : main.c.i

main.s: main.c.s

.PHONY : main.s

# target to generate assembly for a file
main.c.s:
	$(MAKE) -f CMakeFiles/MMU-atmega88p.elf.dir/build.make CMakeFiles/MMU-atmega88p.elf.dir/main.c.s
.PHONY : main.c.s

media/johu/data/Projekte/newco/firmware/common/sercom.obj: media/johu/data/Projekte/newco/firmware/common/sercom.c.obj

.PHONY : media/johu/data/Projekte/newco/firmware/common/sercom.obj

# target to build an object file
media/johu/data/Projekte/newco/firmware/common/sercom.c.obj:
	$(MAKE) -f CMakeFiles/MMU-atmega88p.elf.dir/build.make CMakeFiles/MMU-atmega88p.elf.dir/media/johu/data/Projekte/newco/firmware/common/sercom.c.obj
.PHONY : media/johu/data/Projekte/newco/firmware/common/sercom.c.obj

media/johu/data/Projekte/newco/firmware/common/sercom.i: media/johu/data/Projekte/newco/firmware/common/sercom.c.i

.PHONY : media/johu/data/Projekte/newco/firmware/common/sercom.i

# target to preprocess a source file
media/johu/data/Projekte/newco/firmware/common/sercom.c.i:
	$(MAKE) -f CMakeFiles/MMU-atmega88p.elf.dir/build.make CMakeFiles/MMU-atmega88p.elf.dir/media/johu/data/Projekte/newco/firmware/common/sercom.c.i
.PHONY : media/johu/data/Projekte/newco/firmware/common/sercom.c.i

media/johu/data/Projekte/newco/firmware/common/sercom.s: media/johu/data/Projekte/newco/firmware/common/sercom.c.s

.PHONY : media/johu/data/Projekte/newco/firmware/common/sercom.s

# target to generate assembly for a file
media/johu/data/Projekte/newco/firmware/common/sercom.c.s:
	$(MAKE) -f CMakeFiles/MMU-atmega88p.elf.dir/build.make CMakeFiles/MMU-atmega88p.elf.dir/media/johu/data/Projekte/newco/firmware/common/sercom.c.s
.PHONY : media/johu/data/Projekte/newco/firmware/common/sercom.c.s

media/johu/data/Projekte/newco/firmware/common/utils.obj: media/johu/data/Projekte/newco/firmware/common/utils.c.obj

.PHONY : media/johu/data/Projekte/newco/firmware/common/utils.obj

# target to build an object file
media/johu/data/Projekte/newco/firmware/common/utils.c.obj:
	$(MAKE) -f CMakeFiles/MMU-atmega88p.elf.dir/build.make CMakeFiles/MMU-atmega88p.elf.dir/media/johu/data/Projekte/newco/firmware/common/utils.c.obj
.PHONY : media/johu/data/Projekte/newco/firmware/common/utils.c.obj

media/johu/data/Projekte/newco/firmware/common/utils.i: media/johu/data/Projekte/newco/firmware/common/utils.c.i

.PHONY : media/johu/data/Projekte/newco/firmware/common/utils.i

# target to preprocess a source file
media/johu/data/Projekte/newco/firmware/common/utils.c.i:
	$(MAKE) -f CMakeFiles/MMU-atmega88p.elf.dir/build.make CMakeFiles/MMU-atmega88p.elf.dir/media/johu/data/Projekte/newco/firmware/common/utils.c.i
.PHONY : media/johu/data/Projekte/newco/firmware/common/utils.c.i

media/johu/data/Projekte/newco/firmware/common/utils.s: media/johu/data/Projekte/newco/firmware/common/utils.c.s

.PHONY : media/johu/data/Projekte/newco/firmware/common/utils.s

# target to generate assembly for a file
media/johu/data/Projekte/newco/firmware/common/utils.c.s:
	$(MAKE) -f CMakeFiles/MMU-atmega88p.elf.dir/build.make CMakeFiles/MMU-atmega88p.elf.dir/media/johu/data/Projekte/newco/firmware/common/utils.c.s
.PHONY : media/johu/data/Projekte/newco/firmware/common/utils.c.s

terminal.obj: terminal.c.obj

.PHONY : terminal.obj

# target to build an object file
terminal.c.obj:
	$(MAKE) -f CMakeFiles/MMU-atmega88p.elf.dir/build.make CMakeFiles/MMU-atmega88p.elf.dir/terminal.c.obj
.PHONY : terminal.c.obj

terminal.i: terminal.c.i

.PHONY : terminal.i

# target to preprocess a source file
terminal.c.i:
	$(MAKE) -f CMakeFiles/MMU-atmega88p.elf.dir/build.make CMakeFiles/MMU-atmega88p.elf.dir/terminal.c.i
.PHONY : terminal.c.i

terminal.s: terminal.c.s

.PHONY : terminal.s

# target to generate assembly for a file
terminal.c.s:
	$(MAKE) -f CMakeFiles/MMU-atmega88p.elf.dir/build.make CMakeFiles/MMU-atmega88p.elf.dir/terminal.c.s
.PHONY : terminal.c.s

terminal_prj.obj: terminal_prj.c.obj

.PHONY : terminal_prj.obj

# target to build an object file
terminal_prj.c.obj:
	$(MAKE) -f CMakeFiles/MMU-atmega88p.elf.dir/build.make CMakeFiles/MMU-atmega88p.elf.dir/terminal_prj.c.obj
.PHONY : terminal_prj.c.obj

terminal_prj.i: terminal_prj.c.i

.PHONY : terminal_prj.i

# target to preprocess a source file
terminal_prj.c.i:
	$(MAKE) -f CMakeFiles/MMU-atmega88p.elf.dir/build.make CMakeFiles/MMU-atmega88p.elf.dir/terminal_prj.c.i
.PHONY : terminal_prj.c.i

terminal_prj.s: terminal_prj.c.s

.PHONY : terminal_prj.s

# target to generate assembly for a file
terminal_prj.c.s:
	$(MAKE) -f CMakeFiles/MMU-atmega88p.elf.dir/build.make CMakeFiles/MMU-atmega88p.elf.dir/terminal_prj.c.s
.PHONY : terminal_prj.c.s

uart.obj: uart.c.obj

.PHONY : uart.obj

# target to build an object file
uart.c.obj:
	$(MAKE) -f CMakeFiles/MMU-atmega88p.elf.dir/build.make CMakeFiles/MMU-atmega88p.elf.dir/uart.c.obj
.PHONY : uart.c.obj

uart.i: uart.c.i

.PHONY : uart.i

# target to preprocess a source file
uart.c.i:
	$(MAKE) -f CMakeFiles/MMU-atmega88p.elf.dir/build.make CMakeFiles/MMU-atmega88p.elf.dir/uart.c.i
.PHONY : uart.c.i

uart.s: uart.c.s

.PHONY : uart.s

# target to generate assembly for a file
uart.c.s:
	$(MAKE) -f CMakeFiles/MMU-atmega88p.elf.dir/build.make CMakeFiles/MMU-atmega88p.elf.dir/uart.c.s
.PHONY : uart.c.s

updater.obj: updater.c.obj

.PHONY : updater.obj

# target to build an object file
updater.c.obj:
	$(MAKE) -f CMakeFiles/MMU-atmega88p.elf.dir/build.make CMakeFiles/MMU-atmega88p.elf.dir/updater.c.obj
.PHONY : updater.c.obj

updater.i: updater.c.i

.PHONY : updater.i

# target to preprocess a source file
updater.c.i:
	$(MAKE) -f CMakeFiles/MMU-atmega88p.elf.dir/build.make CMakeFiles/MMU-atmega88p.elf.dir/updater.c.i
.PHONY : updater.c.i

updater.s: updater.c.s

.PHONY : updater.s

# target to generate assembly for a file
updater.c.s:
	$(MAKE) -f CMakeFiles/MMU-atmega88p.elf.dir/build.make CMakeFiles/MMU-atmega88p.elf.dir/updater.c.s
.PHONY : updater.c.s

# Help Target
help:
	@echo "The following are some of the valid targets for this Makefile:"
	@echo "... all (the default if no target is provided)"
	@echo "... clean"
	@echo "... depend"
	@echo "... edit_cache"
	@echo "... rebuild_cache"
	@echo "... upload_eeprom"
	@echo "... MMU"
	@echo "... upload_MMU"
	@echo "... MMU-atmega88p.elf"
	@echo "... set_calibration"
	@echo "... disassemble_MMU"
	@echo "... get_calibration"
	@echo "... get_status"
	@echo "... get_fuses"
	@echo "... set_fuses"
	@echo "... main.obj"
	@echo "... main.i"
	@echo "... main.s"
	@echo "... media/johu/data/Projekte/newco/firmware/common/sercom.obj"
	@echo "... media/johu/data/Projekte/newco/firmware/common/sercom.i"
	@echo "... media/johu/data/Projekte/newco/firmware/common/sercom.s"
	@echo "... media/johu/data/Projekte/newco/firmware/common/utils.obj"
	@echo "... media/johu/data/Projekte/newco/firmware/common/utils.i"
	@echo "... media/johu/data/Projekte/newco/firmware/common/utils.s"
	@echo "... terminal.obj"
	@echo "... terminal.i"
	@echo "... terminal.s"
	@echo "... terminal_prj.obj"
	@echo "... terminal_prj.i"
	@echo "... terminal_prj.s"
	@echo "... uart.obj"
	@echo "... uart.i"
	@echo "... uart.s"
	@echo "... updater.obj"
	@echo "... updater.i"
	@echo "... updater.s"
.PHONY : help



#=============================================================================
# Special targets to cleanup operation of make.

# Special rule to run CMake to check the build system integrity.
# No rule that depends on this can have commands that come from listfiles
# because they might be regenerated.
cmake_check_build_system:
	$(CMAKE_COMMAND) -H$(CMAKE_SOURCE_DIR) -B$(CMAKE_BINARY_DIR) --check-build-system CMakeFiles/Makefile.cmake 0
.PHONY : cmake_check_build_system

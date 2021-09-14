##################################################################################
# "THE ANY BEVERAGE-WARE LICENSE" (Revision 42 - based on beer-ware
# license):
# <dev@layer128.net> wrote this file. As long as you retain this notice
# you can do whatever you want with this stuff. If we meet some day, and
# you think this stuff is worth it, you can buy me a be(ve)er(age) in
# return. (I don't like beer much.)
#
# Matthias Kleemann
##################################################################################

##################################################################################
# Sample CMakeLists.txt for a simple AVR project based on the toolchain
##################################################################################

cmake_minimum_required(VERSION 2.8)

### TOOLCHAIN SETUP AREA #################################################
# Set any variables used in the toolchain prior project() call. In that
# case they are already set and used.
##########################################################################

##################################################################################
# tools to be used for programming the AVR
##################################################################################
set(AVR_UPLOADTOOL avrdude)
set(AVR_PROGRAMMER avrispmkII)
set(AVR_UPLOADTOOL_PORT usb)
# AVR and fuses needs to be set
set(AVR_MCU atmega88p)
# Not used start
set(AVR_H_FUSE 0xd4)
set(AVR_L_FUSE 0xff)
set(AVR_E_FUSE 0x02)
# Not used end

### END TOOLCHAIN SETUP AREA #############################################

##########################################################################
# name your project
##########################################################################
project(MMU)

##################################################################################
# status messages
##################################################################################
message(STATUS "Current uploadtool is: ${AVR_UPLOADTOOL}")
message(STATUS "Current programmer is: ${AVR_PROGRAMMER}")
message(STATUS "Current upload port is: ${AVR_UPLOADTOOL_PORT}")
message(STATUS "Current uploadtool options are: ${AVR_UPLOADTOOL_OPTIONS}")
message(STATUS "Current MCU is set to: ${AVR_MCU}")
message(STATUS "Current H_FUSE is set to: ${AVR_H_FUSE}")
message(STATUS "Current L_FUSE is set to: ${AVR_L_FUSE}")
message(status "Current E_FUSE is set to: ${AVR_E_FUSE}")

##################################################################################
# set build type, if not already set at cmake command line
##################################################################################
if(NOT CMAKE_BUILD_TYPE)
   set(CMAKE_BUILD_TYPE Release)
endif(NOT CMAKE_BUILD_TYPE)

##################################################################################
# needs to be defined for AVR toolchain
##################################################################################
set(MCU_SPEED "11059200UL")

##################################################################################
# some cmake cross-compile necessities
##################################################################################
if(DEFINED ENV{AVR_FIND_ROOT_PATH})
    set(CMAKE_FIND_ROOT_PATH $ENV{AVR_FIND_ROOT_PATH})
else(DEFINED ENV{AVR_FIND_ROOT_PATH})
    if(EXISTS "/opt/local/avr")
      set(CMAKE_FIND_ROOT_PATH "/opt/local/avr")
    elseif(EXISTS "/usr/avr")
      set(CMAKE_FIND_ROOT_PATH "/usr/avr")
    elseif(EXISTS "/usr/lib/avr")
      set(CMAKE_FIND_ROOT_PATH "/usr/lib/avr")
    else(EXISTS "/opt/local/avr")
      message(FATAL_ERROR "Please set AVR_FIND_ROOT_PATH in your environment.")
    endif(EXISTS "/opt/local/avr")
endif(DEFINED ENV{AVR_FIND_ROOT_PATH})
set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)
# not added automatically, since CMAKE_SYSTEM_NAME is "generic"
set(CMAKE_SYSTEM_INCLUDE_PATH "${CMAKE_FIND_ROOT_PATH}/include")
set(CMAKE_SYSTEM_LIBRARY_PATH "${CMAKE_FIND_ROOT_PATH}/lib")

##################################################################################
# status messages for generating
##################################################################################
message(STATUS "Set CMAKE_FIND_ROOT_PATH to ${CMAKE_FIND_ROOT_PATH}")
message(STATUS "Set CMAKE_SYSTEM_INCLUDE_PATH to ${CMAKE_SYSTEM_INCLUDE_PATH}")
message(STATUS "Set CMAKE_SYSTEM_LIBRARY_PATH to ${CMAKE_SYSTEM_LIBRARY_PATH}")

##################################################################################
# set compiler options for build types
##################################################################################
if(CMAKE_BUILD_TYPE MATCHES Release)
   set(CMAKE_C_FLAGS_RELEASE "-Os")
   set(CMAKE_CXX_FLAGS_RELEASE "-Os")
endif(CMAKE_BUILD_TYPE MATCHES Release)

if(CMAKE_BUILD_TYPE MATCHES RelWithDebInfo)
   set(CMAKE_C_FLAGS_RELWITHDEBINFO "-Os -save-temps -g -gdwarf-3 -gstrict-dwarf")
   set(CMAKE_CXX_FLAGS_RELWITHDEBINFO "-Os -save-temps -g -gdwarf-3 -gstrict-dwarf")
endif(CMAKE_BUILD_TYPE MATCHES RelWithDebInfo)

if(CMAKE_BUILD_TYPE MATCHES Debug)
   set(CMAKE_C_FLAGS_DEBUG "-Os -save-temps -g -gdwarf-3 -gstrict-dwarf")
   set(CMAKE_CXX_FLAGS_DEBUG "-Os -save-temps -g -gdwarf-3 -gstrict-dwarf")
endif(CMAKE_BUILD_TYPE MATCHES Debug)

##################################################################################
# compiler options for all build types
##################################################################################
add_definitions("-DF_CPU=${MCU_SPEED}")
add_definitions("-fpack-struct")
add_definitions("-fshort-enums")
add_definitions("-Wall")
add_definitions("-Werror")
# http://gcc.gnu.org/onlinedocs/gcc-4.8.2/gcc/Alternate-Keywords.html#Alternate-Keywords
# [...]-pedantic and other options cause warnings for many GNU C extensions. You can prevent such warnings within
# one expression by writing __extension__ before the expression. __extension__ has no effect aside from this.[...] 
#add_definitions("-pedantic")
#add_definitions("-pedantic-errors")
#add_definitions("-funsigned-char")
add_definitions("-funsigned-bitfields")
add_definitions("-ffunction-sections")
add_definitions("-fdata-sections")
add_definitions("-c")
add_definitions("-std=gnu99")

##################################################################################
# our source definitions
##################################################################################
include_directories(
   AFTER
   SYSTEM
   ../common
   stub
   .
)
set (
   bms
   ../common/bms_shared.h
)
set (
   hwdef
   hwdefs.h
)
set (
   sercom
   ../common/sercom.h
   ../common/sercom.c
)
set (
   stub
   stub/stubs.h
   stub/stubs.cpp
)
set (
   terminal
   terminal.h
   terminal.c
   terminal_prj.c
)
set (
   uart
   uart.h
   uart.c
)
set (
   hamming
   hamming.h
   hamming.c
)
set (
   updater
   updater-uart.c
   updater-uart.h
)
set (
   utils
   ../common/utils.h
   ../common/utils.c
)

##################################################################################
# add AVR executable
##################################################################################
#if(DEFINED BuildAvr)
add_avr_executable(
   MMU
   main.c
   ${bms}
   ${hwdef}
   ${sercom}
   ${terminal}
   ${uart}
   ${hamming}
   ${utils}
   ${updater}
)
#endif(DEFINED BuildAvr)

if(DEFINED BuildLinux)
   include_directories(/usr/lib/avr/include)
   set (CMAKE_C_FLAGS_DEBUG "${CMAKE_C_FLAGS_DEBUG} __AVR_ATmega88P__")
   set (CMAKE_CXX_FLAGS_DEBUG "${CMAKE_CXX_FLAGS_DEBUG} __AVR_ATmega88P__")
   add_executable(
      MMU
      main.c
      ${bms}
      ${hwdef}
      ${sercom}
      ${terminal}
      ${uart}
      ${utils}
   )
endif(DEFINED BuildLinux)

##################################################################################
# add AVR library
##################################################################################
#add_avr_library(
#   MMU-lib
#   <sources> <headers>
#)

##################################################################################
# link library to executable
# NOTE: It needs to be the elf target.
##################################################################################
# target_link_libraries(<executable-name>-${AVR_MCU}.elf <library-name>-${AVR_MCU})
# OR easier
#target_link_libraries(CMU ${CMAKE_THREAD_LIBS_INIT})


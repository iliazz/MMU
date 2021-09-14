SET(CMAKE_SYSTEM_NAME Linux)

SET(CMAKE_C_COMPILER /usr/bin/gcc)
SET(CMAKE_CXX_COMPILER /usr/bin/g++)
SET(CMAKE_STRIP /usr/bin/strip)

MESSAGE(STATUS "normal compilation")

SET(CMAKE_CXX_FLAGS_DEBUG "-std=c++11 -O0 -Wall -fmessage-length=0 -g")
SET(CMAKE_CXX_FLAGS_RELEASE "-std=c++11 -O2 -Wall -fmessage-length=0 -g")
MESSAGE(STATUS "${CMAKE_CXX_FLAGS}")

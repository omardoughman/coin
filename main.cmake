cmake_minimum_required(VERSION 3.15)
project(ComprendoSystem C CXX)

set(CMAKE_C_STANDARD 11)
set(CMAKE_CXX_STANDARD 17)

# Include Nanopb and Firebase
include_directories(${CMAKE_CURRENT_SOURCE_DIR}/nanopb)
include_directories(${CMAKE_CURRENT_SOURCE_DIR})

# Add the Control Panel logic
include(controlpanel.cmake)

add_executable(comprendo_engine 
    main.cpp 
    main.c 
    cntrl.c
    main.pb.c 
    nanopb/pb_common.c 
    nanopb/pb_encode.c 
    nanopb/pb_decode.c
)

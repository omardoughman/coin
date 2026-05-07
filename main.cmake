cmake_minimum_required(VERSION 3.10)
project(CoinSystem)
set(CMAKE_C_STANDARD 11)
include_directories(.) 
add_executable(coin_engine main.c cntrl.c main.cpp)

# 1. Find the Java headers on the system
find_package(JNI REQUIRED)
include_directories(${JNI_INCLUDE_DIRS} .)

# 2. Create the shared library (the link Java looks for)
add_library(coin_engine SHARED 
    main.c 
    cntrl.c 
    main.cpp
)

# 3. Ensure the library name matches System.loadLibrary("coin_engine")
set_target_properties(coin_engine PROPERTIES PREFIX "")

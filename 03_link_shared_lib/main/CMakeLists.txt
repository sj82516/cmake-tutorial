cmake_minimum_required(VERSION 3.11)
project(03Project VERSION 0.1)

add_executable(Main main.cc)

add_library(MyMath SHARED "IMPORTED")
set(SHARED_LIB_DIR "${CMAKE_HOME_DIRECTORY}/../shared_lib")
set_target_properties(MyMath PROPERTIES IMPORTED_LOCATION "${SHARED_LIB_DIR}/build/libMyMath.dylib")
include_directories("${SHARED_LIB_DIR}")
target_link_libraries(Main MyMath)
cmake_minimum_required(VERSION 3.11)
project(helloworld)
add_executable(${PROJECT_NAME} main.cpp)
target_link_directories(${PROJECT_NAME} PRIVATE ${CMAKE_SOURCE_DIR}/../somelib/build)
target_include_directories(${PROJECT_NAME} PRIVATE ${CMAKE_SOURCE_DIR}/../somelib)

target_link_libraries(${PROJECT_NAME} mymathlib)
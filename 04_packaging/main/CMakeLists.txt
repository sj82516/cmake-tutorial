cmake_minimum_required(VERSION 3.11)
project(03Project VERSION 0.1)

set(CMAKE_INSTALL_RPATH "@loader_path/../lib")
# set(CMAKE_INSTALL_RPATH "$ORIGIN/../lib")

add_executable(Main main.cc)

add_library(MyMath SHARED "IMPORTED")
set(SHARED_LIB_DIR "${CMAKE_HOME_DIRECTORY}/../shared_lib")
set_target_properties(MyMath PROPERTIES IMPORTED_LOCATION "${SHARED_LIB_DIR}/build/libMyMath.dylib")
include_directories("${SHARED_LIB_DIR}")
target_link_libraries(Main MyMath)

#-----
install(TARGETS Main DESTINATION bin)
install(IMPORTED_RUNTIME_ARTIFACTS MyMath DESTINATION lib)
set(CPACK_PACKAGE_NAME "hello_cpack")
set(CPACK_PACKAGE_FILE_NAME "hello_cpack_file")
include(CPack)
cmake_minimum_required(VERSION 3.18)

project(main)

find_package(Calc REQUIRED HINTS ${EXTERNAL_CALC_INSTALL_DIR})

include(CMakePrintHelpers)
message("CMAKE_PREFIX_PATH: ${CMAKE_PREFIX_PATH}")
message("CALC_FOUND: ${Calc_FOUND}")
cmake_print_properties(TARGETS "Calc::calc" PROPERTIES
  IMPORTED_CONFIGURATIONS
  INTERFACE_INCLUDE_DIRECTORIES
)

add_executable(main)

target_sources(main
PRIVATE
    main.cc)

target_link_libraries(main
    Calc::calc)

install(TARGETS main)
cmake_minimum_required (VERSION 3.7)
project(adv7
LANGUAGES Fortran)
enable_testing()

include(cmake/compilers.cmake)

set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR})

add_subdirectory(src)

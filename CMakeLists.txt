cmake_minimum_required (VERSION 3.13)
project(adv7
LANGUAGES Fortran)
enable_testing()

include(cmake/compilers.cmake)

set(CMAKE_Fortran_MODULE_DIRECTORY ${PROJECT_BINARY_DIR}/include)
include_directories(${PROJECT_BINARY_DIR}/include)

add_executable(advgen)
add_executable(adventure)
add_executable(testsound)

add_subdirectory(src)

cmake_minimum_required(VERSION 3.14...3.22)
project(adv7
LANGUAGES Fortran)
enable_testing()

include(cmake/compilers.cmake)

set(CMAKE_Fortran_MODULE_DIRECTORY ${PROJECT_BINARY_DIR}/include)
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${PROJECT_BINARY_DIR})

configure_file(adv.txt adv.txt COPYONLY)

add_subdirectory(src)

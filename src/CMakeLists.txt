cmake_minimum_required (VERSION 3.7)
project(adv7 Fortran)
enable_testing()

set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ..)

if(CMAKE_BUILD_TYPE STREQUAL Debug)
  add_compile_options(-g -O0)
else()
  add_compile_options(-O3)
endif()

if(${CMAKE_Fortran_COMPILER_ID} STREQUAL GNU)
  add_compile_options(-march=native -Wall -Wextra -Wpedantic -Werror=array-bounds -fbacktrace -fcheck=all
  -fexceptions -ffpe-trap=invalid,zero,overflow 
  -finit-real=nan -Wconversion -fimplicit-none
  -Wline-truncation  -Wno-unused-dummy-argument) #-Warray-temporaries
  
#  link_libraries(-fsanitize=address) Only for Linux, don't bother on CI for now.
  
  if(NOT CYGWIN AND NOT WIN32)
    add_compile_options(-fstack-protector-all)
  endif()
  
  if(${CMAKE_Fortran_COMPILER_VERSION} VERSION_GREATER_EQUAL 8.1)
    add_compile_options(-std=f2018)
  else()
     add_compile_options(-std=f2008ts)
  endif()
elseif(${CMAKE_Fortran_COMPILER_ID} STREQUAL Intel)
  add_compile_options(-warn -fpe0 -traceback -debug extended -check all)
elseif(${CMAKE_Fortran_COMPILER_ID} STREQUAL Flang)  # https://github.com/flang-compiler/flang/wiki/Fortran-2008
  add_compile_options(-Mallocatable=03 -nomp)
  set(FFLAGS -static-flang-libs)
elseif(${CMAKE_Fortran_COMPILER_ID} STREQUAL PGI)
  set(FFLAGS -Mallocatable=03)
endif()

set(okcomp GNU Intel)

#--------------

add_library(wait wait.f90)
if(${CMAKE_Fortran_COMPILER_ID} STREQUAL GNU)
  target_compile_options(wait PRIVATE -fall-intrinsics)
endif()

add_library(advmods advmods.f90)

if(CMAKE_Fortran_COMPILER_ID IN_LIST okcomp)
  add_library(sound sound.f90)
  add_library(bug bug.f90)
else()
  add_library(sound sound_legacy.f90)
  add_library(bug bug_legacy.f90)
endif()
target_link_libraries(sound PRIVATE advmods)

add_executable(adventure class.f90 rating.f90 treasure.f90 vocabx.f90  clrlin.f90 val.f90 drop.f90 insert.f90 carry.f90  asubs.f90 athand.f90 toting.f90 move.f90 remove.f90 speak.f90 upper_case.f90 poof.f90 pspeak.f90 not_toting_spk.f90 yes.f90 color.f90 burden.f90 lookin.f90 getlin.f90 replace.f90 ljust.f90 travl.f90 getwds.f90 getobj.f90 adventure.f90)
target_link_libraries(adventure PRIVATE wait sound bug advmods ${FFLAGS})

add_executable(advgen class.f90 rating.f90 treasure.f90 vocabx.f90 advgendat.f90 clrlin.f90 val.f90 drop.f90 insert.f90 carry.f90)
target_link_libraries(advgen PRIVATE bug advmods ${FFLAGS})

add_executable(testsound TestSound.f90)
target_link_libraries(testsound PRIVATE sound advmods)

add_test(NAME Generate COMMAND advgen WORKING_DIRECTORY ${CMAKE_RUNTIME_OUTPUT_DIRECTORY})

if (NOT WIN32)
  add_test(NAME ShortGame COMMAND sh -c "./adventure -nosound < testinput.txt"
          WORKING_DIRECTORY ${CMAKE_RUNTIME_OUTPUT_DIRECTORY})
  set_tests_properties(ShortGame  PROPERTIES FIXTURES_SETUP Generate)
else()
 # TODO
endif()


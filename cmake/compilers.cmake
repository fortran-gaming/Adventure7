
if(CMAKE_BUILD_TYPE STREQUAL Debug)
  add_compile_options(-g -O0)
else()
  add_compile_options(-O3)
endif()

if(CMAKE_Fortran_COMPILER_ID STREQUAL GNU)
  add_compile_options(-march=native -Wall -Wextra -Wpedantic -Werror=array-bounds -fcheck=all
  -fexceptions -ffpe-trap=invalid,zero,overflow 
  -finit-real=nan -Wconversion -fimplicit-none -fall-intrinsics
  -Wline-truncation  -Wno-unused-dummy-argument) #-Warray-temporaries
  
#  link_libraries(-fsanitize=address) Only for Linux, don't bother on CI for now.
  
  if(UNIX AND NOT APPLE)
    add_compile_options(-fstack-protector-all)
  endif()
  
  if(CMAKE_Fortran_COMPILER_VERSION VERSION_GREATER_EQUAL 8)
    add_compile_options(-std=f2018)
  endif()
elseif(CMAKE_Fortran_COMPILER_ID STREQUAL Intel)
  add_compile_options(-warn -fpe0 -traceback -debug extended -check all)
elseif(CMAKE_Fortran_COMPILER_ID STREQUAL Flang)  # https://github.com/flang-compiler/flang/wiki/Fortran-2008
  add_compile_options(-Mallocatable=03 -nomp)
  set(FFLAGS -static-flang-libs)
elseif(CMAKE_Fortran_COMPILER_ID STREQUAL PGI)

endif()

include(CheckFortranSourceCompiles)

check_fortran_source_compiles("program cm; call execute_command_line(''); end" f2008
                              SRC_EXT f90)



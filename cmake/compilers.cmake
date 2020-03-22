if(CMAKE_Fortran_COMPILER_ID STREQUAL GNU)
  add_compile_options(-mtune=native -Wall -Wextra -Werror=array-bounds -fcheck=all
  -fexceptions -ffpe-trap=invalid,zero,overflow
  -finit-real=nan -Wconversion -fimplicit-none -fall-intrinsics
  -Wline-truncation  -Wno-unused-dummy-argument) #-Warray-temporaries

  if(CMAKE_Fortran_COMPILER_VERSION VERSION_GREATER_EQUAL 8)
    add_compile_options(-std=f2018)
  endif()
elseif(CMAKE_Fortran_COMPILER_ID STREQUAL Intel)
  if(WIN32)

  else()
  add_compile_options(-warn -fpe0 -traceback -debug extended -check all -implicitnone)
  endif()
endif()

include(CheckFortranSourceCompiles)

check_fortran_source_compiles("program cm; call execute_command_line(''); end" f2008
                              SRC_EXT f90)



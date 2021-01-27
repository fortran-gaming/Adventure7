if(CMAKE_Fortran_COMPILER_ID STREQUAL GNU)
  add_compile_options(-fall-intrinsics -mtune=native -Wall -Wextra -Wline-truncation -fimplicit-none)

  set(CMAKE_Fortran_FLAGS_DEBUG " -Werror=array-bounds -fcheck=all
  -fexceptions -ffpe-trap=invalid,zero,overflow
  -finit-real=nan -Wconversion -Wno-unused-dummy-argument") #-Warray-temporaries

  if(CMAKE_Fortran_COMPILER_VERSION VERSION_GREATER_EQUAL 8)
    add_compile_options(-std=f2018)
  endif()
elseif(CMAKE_Fortran_COMPILER_ID STREQUAL Intel)
  if(WIN32)

  else()
    add_compile_options(-warn -traceback)
    set(CMAKE_Fortran_FLAGS_DEBUG " -fpe0 -debug extended -check all")
  endif()
endif()

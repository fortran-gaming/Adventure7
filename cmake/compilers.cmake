if(CMAKE_Fortran_COMPILER_ID STREQUAL GNU)
  add_compile_options(-fall-intrinsics -mtune=native -Wall -Wextra -Wline-truncation -fimplicit-none
  "$<$<CONFIG:Debug>:-Werror=array-bounds;-fcheck=all;-fexceptions;-ffpe-trap=invalid,zero,overflow;-finit-real=nan;-Wconversion;-Wno-unused-dummy-argument>"
  )
   #-Warray-temporaries
elseif(CMAKE_Fortran_COMPILER_ID MATCHES "^Intel")
  add_compile_options(-warn
  "$<$<CONFIG:Debug>:-traceback;-fpe0;-debug;-check>"
  )
endif()

SUBROUTINE BUG(MSG)
use, intrinsic:: iso_fortran_env, only: error_unit
implicit none


CHARACTER(*), Intent(in) :: MSG

WRITE(error_unit,*) msg

error stop 'FATAL ERROR'
END Subroutine Bug
program testsound
! consumes command line list of sound file stems
use, intrinsic:: iso_fortran_env, only: input_unit
use allcom, only: debug
implicit none

integer :: ios=0
character(32) :: argv

debug=.false.

print *,'Type (case senstive) sound name and press Enter.   Ctrl-C to exit'

do while (ios==0)
  read(input_unit,'(A)', iostat=ios) argv  ! '(A)' needed to pass whole string if spaces inside
  call sound(argv)
enddo

end program

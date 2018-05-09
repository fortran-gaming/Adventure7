SUBROUTINE SOUND(WHAT)
  use allcom,only: debug,usesound
  use,intrinsic:: iso_fortran_env,only:error_unit
  IMPLICIT NONE

  INTEGER :: ret, cret
  CHARACTER(*), intent(in) :: WHAT
  character(*),parameter :: playexe='ffplay', &
                            cmdopts='-autoexit -loglevel quiet -nodisp', &
                            sounddir='sounds/'

  character(:),allocatable :: fn,cmd
  character(80) :: emsg

  if (.not. usesound) return

  FN = '"'//sounddir//trim(WHAT)//'.wav'//'"' ! double-quotes necessary for filename with spaces.

  cmd = playexe//' '//cmdopts//' '//fn
  if (debug) print *,cmd

  call system(cmd, ret)

  if (debug) print *,'sound player return code',ret

  if (ret /= 0) then
    write(error_unit,*) 'could not invoke sound player ',cmd
    write(error_unit,*) emsg
    usesound=.false.
  endif

END subroutine sound

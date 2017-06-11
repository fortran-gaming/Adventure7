SUBROUTINE SOUND(WHAT)
  use allcom,only: debug,usesound
  use,intrinsic:: iso_fortran_env,only:error_unit
  IMPLICIT NONE

  INTEGER :: RET
  CHARACTER(*), intent(in) :: WHAT
  character(*),parameter :: playexe='ffplay'
  character(*),parameter :: cmdopts='-autoexit -loglevel quiet -nodisp'
  character(160) :: FN
  character(160) :: cmd

  if (.not. usesound) return

  FN='"sounds/'//WHAT//'.wav"'//CHAR(0)
  cmd = playexe//' '//cmdopts//' '//fn
  if (debug) print *,cmd

  call execute_command_line(cmd, wait=.false.,exitstat=ret)

  if (ret/=0) then
    write(error_unit,*) 'could not invoke sound player ',cmd
    usesound=.false.
  endif

END subroutine sound

SUBROUTINE SOUND(WHAT)
  use,intrinsic:: iso_fortran_env,only:error_unit
  IMPLICIT NONE

  INTEGER :: RET
  CHARACTER(*), intent(in) :: WHAT
  character(*),parameter :: playexe='ffplay'
  character(160) :: FN
  character(160) :: cmd

  FN='"sounds/'//WHAT//'.wav"'//CHAR(0)
  cmd = playexe//' '//fn
  print *,cmd
  call execute_command_line('pwd')

  call execute_command_line(cmd, exitstat=ret)

  if (ret/=0) write(error_unit,*) 'could not invoke sound player ',cmd

END subroutine sound
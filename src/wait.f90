SUBROUTINE WAIT(TIME)
  IMPLICIT NONE
  REAL, intent(in) :: TIME
  real TIME_BEGIN, TIME_END, t

  t=time
  if (t>1) then ! use intrinsic sleep for integer part
    call sleep(int(t))
    t = t - int(t)
  endif

  CALL CPU_TIME(TIME_BEGIN)
  DO
     CALL CPU_TIME(TIME_END)
     IF (TIME_END-TIME_BEGIN > t) EXIT
  END DO
END subroutine wait
recursive LOGICAL FUNCTION YES(X,Y,Z) result(yesorno)
  USE ALLCOM
  use, intrinsic:: iso_fortran_env,only: input_unit,output_unit,error_unit
  implicit none
!     PRINT MESSAGE X, WAIT FOR YES/NO ANSWER.
  INTEGER, intent(in) :: X,Y,Z
  CHARACTER(3) :: REPLY
  integer :: ios

  CALL SPEAK(RTEXT(X))

  WRITE(output_unit,'(A)',advance='no') ' >'
  flush(output_unit)

  READ(input_unit,"(A)", iostat=ios) REPLY
  if (ios/=0) backspace(input_unit)  ! ctrl D

  CALL UPPER_CASE(REPLY)
  IF (REPLY=='YES' .OR. REPLY=='Y') THEN
     yesorno = .TRUE.
     CALL SPEAK(RTEXT(Y))
     IF (Y==82 .OR. Y==84) THEN
        CALL WAIT(.5)
        CALL POOF(0)
        CALL COLOR(3)
     ENDIF
  ELSEIF (REPLY == 'NO' .OR. REPLY == 'N') THEN
     yesorno = .FALSE.
     CALL SPEAK(RTEXT(Z))
  ELSE
     print *,"Please answer the question."
     yesorno = yes(x,y,z)
  ENDIF
  END function yes
SUBROUTINE POOF(k)
 ! NOTE: This can be done with NCURSES
 !
 !     USE IFQWIN
IMPLICIT NONE
integer, intent(in) :: k

!INTEGER, PARAMETER:: ORANGE=Z'00008CFF',BWHITE=Z'FFFFFF'

!      INTEGER(4) I
!      IF (K.EQ.1) THEN
!         I=SETBKCOLORRGB(BWHITE)
!         CALL CLEARSCREEN($GCLEARSCREEN)
 CALL WAIT(.2)
!      ENDIF
!      I=SETBKCOLORRGB(ORANGE)
!      CALL CLEARSCREEN($GCLEARSCREEN)
!      CALL SOUND('POOF')
WRITE(*,"(///////////////////////T38,'POOF!!')")
CALL WAIT(1.)
!      I=SETBKCOLOR(0)
!      CALL CLEARSCREEN($GCLEARSCREEN)
END subroutine poof
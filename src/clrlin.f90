SUBROUTINE CLRLIN
USE ALLCOM
implicit none
!     CLEARS OUT ALL CURRENT SYNTAX ARGS IN PREPARATION FOR A NEW INPUT LINE

CHARACTER(12), parameter :: ALLZERO = REPEAT(CHAR(0),12)
OBJS=0
VERBS=0
VTXT=ALLZERO

IOBJS=0
IOTXT=ALLZERO
OTXT=ALLZERO

VRBX=0
OBJX=0
IOBX=0
PREP=0

END Subroutine CLRLIN

INTEGER FUNCTION BURDEN(OBJECT)
  USE ALLCOM
  implicit none
!     IF OBJECT=0, CALCULATE THE TOTAL WEIGHT OF THE ADVENTURER'S BURDEN, INCLUDING EVERYTHING IN ALL CONTAINERS EXCEPT THE BOAT.
!     ONLY CALCULATE WEIGHTS OF CONTAINED CONTAINERS ONE LEVEL DOWN.  IF OBJECT=0 AND OBJECT IS A CONTAINER, CALCULATE THE WEIGHT OF
!     EVERYTHING INSIDE CONTAINER, INCLUDING CONTAINER ITSELF.  THE ONLY SERIOUS CONTAINED CONTAINER WOULD BE THE SACK ONLY
!     THINGS MISSED WILL BE FILLED VS EMPTY BOTTLE OR CAGE. IF OBJECT NOT 0 AND ISN'T A CONTAINER, RETURN ITS WEIGHT.

  INTEGER, intent(in) :: OBJECT
  integer TEMP,I

  LOGICAL TOTING

  BURDEN=0
  IF (OBJECT==0) THEN
     DO I=1,MAXOBJ
        IF (TOTING(I).AND.PLACE(I).NE.-BOAT) BURDEN=BURDEN+WEIGHT(I)
     END DO
  ELSE
     BURDEN=WEIGHT(OBJECT)
     IF (OBJECT/=BOAT) THEN
        TEMP=HOLDER(OBJECT)
        DO WHILE (TEMP/=0)
           BURDEN=BURDEN+WEIGHT(TEMP)
           TEMP=HLINK(TEMP)
        END DO
     ENDIF
  ENDIF

END function burden
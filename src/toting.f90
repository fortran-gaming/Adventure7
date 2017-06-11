   LOGICAL FUNCTION TOTING(OBJECT)
      USE ALLCOM
      implicit none

!     TRUE IF THE OBJECT IS BEING CARRIED IN HAND OR CONTAINER. OBJECT MAY NOT BE REACHABLE. SEE ALSO: ENCLSD, ATHAND, HOLDNG.

      INTEGER,intent(in) :: OBJECT
      integer CONTNR,OUTER,OUTER2

      LOGICAL,external :: HOLDNG

      TOTING = .FALSE.
      CONTNR=-PLACE(OBJECT)

      IF (HOLDNG(OBJECT)) THEN
         TOTING = .TRUE.
      ELSEIF (CONTNR.GT.0) THEN
         IF (HOLDNG(CONTNR)) THEN
            TOTING = .TRUE.
         ELSE
            OUTER=-PLACE(CONTNR)
            IF (OUTER.GT.0) THEN
               IF (HOLDNG(OUTER)) THEN
                  TOTING = .TRUE.
               ELSE
                  OUTER2=-PLACE(OUTER)
                  IF (OUTER2.GT.0) TOTING = HOLDNG(OUTER2)
               ENDIF
            ENDIF
         ENDIF
      ENDIF

      END
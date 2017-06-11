   SUBROUTINE COLOR(LOCATION)
      USE ALLCOM; USE IFQWIN
      IMPLICIT NONE
      
      INTEGER, PARAMETER:: BLACK=0,BLUE=Z'FF0000',GREEN=Z'008000',GRAY=Z'808080',LTBLUE=Z'EBCE87',LTGREEN=Z'00FA9A',RED=Z'2222B2',&
                           BWHITE=Z'FFFFFF',INDIA_RED=Z'5C5CCD',ROYAL_BLUE=Z'E16941',BRIGHT_RED=Z'FF',TAN=Z'8CB4D2'
                           
      INTEGER(4) I,NEW_COLOR,CUR_COLOR,LOCATION,TEXT_COLOR
      
      LOGICAL OUTSID,DARK
      
      DATA CUR_COLOR/BLACK/
      
      NEW_COLOR=CUR_COLOR; TEXT_COLOR=BWHITE
      IF (LOCATION.GT.0) THEN
         IF (OUTSID(LOCATION).OR.LOCATION.EQ.1) THEN
            NEW_COLOR=GREEN
         ELSE
            NEW_COLOR=BLACK
         ENDIF
         SELECT CASE (LOCATION)
            CASE (3,9,99,238)
                  NEW_COLOR=GRAY                 
            CASE (100)
                  NEW_COLOR=LTGREEN
                  TEXT_COLOR=BLACK
            CASE (126)
                  NEW_COLOR=BRIGHT_RED
            CASE (155,239,240)
                  NEW_COLOR=BLUE
            CASE (200)
                  NEW_COLOR=BWHITE
                  TEXT_COLOR=BLUE
            CASE (166,167,168)
                  NEW_COLOR=LTBLUE
            CASE (192)
                  NEW_COLOR=ROYAL_BLUE
            CASE (207)
                  NEW_COLOR=INDIA_RED
         END SELECT
      ENDIF
      IF (DARK()) NEW_COLOR=BLACK
      IF (CUR_COLOR.NE.NEW_COLOR) THEN
         I=SETBKCOLORRGB(NEW_COLOR)
         I=SETTEXTCOLORRGB(TEXT_COLOR)
         CALL CLEARSCREEN($GCLEARSCREEN)
      ENDIF
         
      CUR_COLOR=NEW_COLOR
      
      END
   INTEGER(4) FUNCTION LJUST(LINE,QUOTE)
   
      IMPLICIT NONE
      
      INTEGER(4) I,L

!     SQUEEZES OUT BLANKS EXCEPT THOSE WITHIN QUOTES. IF QUOTE IS BLANK, ONLY SQUEEZES OUT LEADING AND EXTRA BLANKS

      CHARACTER(LEN=*) LINE, QUOTE*1

      LOGICAL PRIME

      LJUST=0
      PRIME = .FALSE.
      L=LEN_TRIM(LINE)
      DO I=1,L
         IF (LINE(I:I).EQ.QUOTE .AND. QUOTE.NE.' ') PRIME = .NOT. PRIME
         IF (LINE(I:I) .NE. ' ' .OR. PRIME) THEN
            LJUST=LJUST+1
            IF (LJUST.NE.I) LINE(LJUST:LJUST)=LINE(I:I)
            IF (QUOTE .EQ. ' ') PRIME=LINE(I:I) .NE. ' '
         ENDIF
      END DO
      IF (LJUST.LT. L) LINE(LJUST+1:L)=' '
   10 I=INDEX(LINE,' ,')
      IF (I.GT.0) THEN
         LINE(I:)=LINE(I+1:)
         GO TO 10
      ENDIF      
      END
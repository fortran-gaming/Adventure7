   SUBROUTINE GETLIN
      USE ALLCOM
      
      INTEGER I,J,INDX,LJUST
      
      CHARACTER TXT2(35)*12,XC*12,CHRS*150

      TXT2=' '
      TXT=' '

20    IF (BLKLIN) WRITE(*,*) '  '
      WRITE (*,"(' >',$)")
      READ (*,"(A)") CHRS
      IF (LEN_TRIM(CHRS).EQ.0) GO TO 20
      
      CALL UPPER_CASE(CHRS)
      CALL REPLACE(CHRS,';',' AND ')
      CALL REPLACE(CHRS,',',' AND ')
      
      INDX=LJUST(CHRS,' ')

      WDX = 1
      J = 1
      XC=' '
      DO I=1,INDX        
         IF (CHRS(I:I).NE.' ') THEN
            IF (J.LE.12) XC(J:J)=CHRS(I:I)
            J = J+1
         ELSE
            J = 1
            TXT2(WDX)=XC
            XC=' '
            WDX = WDX + 1
         ENDIF
      END DO
      TXT2(WDX)=XC
      WDX = WDX + 1

      TXT(1) = TXT2(1)
      J = 1
      DO I=2,35
         IF (TXT(J).NE.'AND'.OR.TXT2(I).NE.'AND')THEN
            J = J+1
            TXT(J) = TXT2(I)
         ELSE
            WDX = WDX - 1
         ENDIF
      END DO

      END
   SUBROUTINE GETLIN
      USE ALLCOM
      use,intrinsic:: iso_fortran_env, only: input_unit,output_unit
      implicit none

      INTEGER I,J,INDX,LJUST,ios

      CHARACTER TXT2(35)*12,XC*12,CHRS*150

      TXT2=' '
      TXT=' '

20    IF (BLKLIN) print *, '  '

      WRITE(output_unit,'(A)',advance='no') ' >'
      flush(output_unit)

      READ(input_unit,"(A)", iostat=ios) CHRS
      if (ios/=0) backspace(input_unit)  ! ctrl D

      IF (LEN_TRIM(CHRS) == 0) GO TO 20

      CALL UPPER_CASE(CHRS)
      CALL REPLACE(CHRS,';',' AND ')
      CALL REPLACE(CHRS,',',' AND ')

      INDX=LJUST(CHRS,' ')

      WDX = 1
      J = 1
      XC=' '
      DO I=1,INDX
         IF (CHRS(I:I).NE.' ') THEN
            IF (J<=12) XC(J:J)=CHRS(I:I)
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
         IF (TXT(J)/='AND'.OR.TXT2(I)/='AND')THEN
            J = J+1
            TXT(J) = TXT2(I)
         ELSE
            WDX = WDX - 1
         ENDIF
      END DO

      END subroutine getlin
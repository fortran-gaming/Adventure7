   SUBROUTINE UPPER_CASE(STRING)
   
      IMPLICIT NONE
     
      INTEGER(4) I,K

      CHARACTER(LEN=*) STRING
      
      DO I=1,LEN(STRING)
         K=ICHAR(STRING(I:I))
         IF (K.GT.96.AND.K.LT.123) STRING(I:I)=CHAR(K-32)
      END DO
      END
      
   SUBROUTINE LOWER_CASE(STRING)
      
      IMPLICIT NONE
      
      INTEGER(4) I,K
      
      CHARACTER(LEN=*) STRING
      
      DO I=1,LEN(STRING)
         K=ICHAR(STRING(I:I))
         IF (K.GT.64.AND.K.LT.91) STRING(I:I)=CHAR(K+32)
      END DO
      END
         
      
         
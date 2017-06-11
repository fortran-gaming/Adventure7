   SUBROUTINE REPLACE(STRING,IN,OUT)
   
      IMPLICIT NONE
      
      INTEGER(4) L1,L2,I,L,K
      
      CHARACTER STRING*(*), IN*(*),OUT*(*)
      
      L1=LEN(IN)
      L2=LEN(OUT)
      IF (L2.LE.L1) THEN
   10    L=LEN_TRIM(STRING)
         I=INDEX(STRING(1:L),IN)
         IF (I.GT.0) THEN
           STRING(I:)=OUT//STRING(I+L1:L)
           GO TO 10
         ENDIF
      ELSE
         K=1
   20    L=LEN_TRIM(STRING)
         I=INDEX(STRING(K:L),IN)
         IF (I.GT.0) THEN
            STRING(I+K-1:)=OUT//STRING(I+K-1+L1:L)
            K=K+L2+I-1
            GO TO 20
         ENDIF
      ENDIF      
      END   
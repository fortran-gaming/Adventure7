SUBROUTINE REPLACE(STRING,INn,OUTt)

  IMPLICIT NONE

  INTEGER(4) L1,L2,I,L,K

  CHARACTER(*), intent(inout) :: STRING
  character(*), intent(in) :: INn,OUTt

  L1=LEN(INn)
  L2=LEN(OUTt)
  IF (L2.LE.L1) THEN
10    L=LEN_TRIM(STRING)
     I=INDEX(STRING(1:L),INn)
     IF (I.GT.0) THEN
       STRING(I:)=OUTt//STRING(I+L1:L)
       GO TO 10
     ENDIF
  ELSE
     K=1
20    L=LEN_TRIM(STRING)
     I=INDEX(STRING(K:L),INn)
     IF (I.GT.0) THEN
        STRING(I+K-1:)=OUTt//STRING(I+K-1+L1:L)
        K=K+L2+I-1
        GO TO 20
     ENDIF
  ENDIF
END subroutine replace
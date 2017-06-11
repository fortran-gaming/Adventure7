   LOGICAL FUNCTION YES(X,Y,Z)
      USE ALLCOM
      
!     PRINT MESSAGE X, WAIT FOR YES/NO ANSWER.

      INTEGER X,Y,Z
      CHARACTER(3) REPLY

1     CALL SPEAK(RTEXT(X))
      WRITE(*,"(/,' >',$)")
      READ(*,"(A)") REPLY
      CALL UPPER_CASE(REPLY)
      IF (REPLY.EQ.'YES'.OR.REPLY.EQ.'Y') THEN
         YES=.TRUE.
         CALL SPEAK(RTEXT(Y))
         IF (Y.EQ.82.OR.Y.EQ.84) THEN
            CALL WAIT(.5)
            CALL POOF(0)
            CALL COLOR(3)
         ENDIF
      ELSEIF (REPLY.EQ.'NO'.OR.REPLY.EQ.'N') THEN
         YES=.FALSE.
         CALL SPEAK(RTEXT(Z))
      ELSE
         WRITE(*,"(' Please answer the question.')")
         GO TO 1
      ENDIF
      END
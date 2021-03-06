SUBROUTINE RATING(MYSCORE,EXTRA,GAVE_UP,SCORING,CLOSING,IS_CLOSED)
USE ALLCOM
implicit none
!     CALCULATE WHAT SCORE WOULD BE IF ADVENTURER QUIT NOW. MAY BE THE END OF THE GAME, OR PROGRESS INQUIRY.

LOGICAL TREASURE,GAVE_UP,CLOSING,IS_CLOSED,SCORING

INTEGER MYSCORE,OBJECT,K,ASCORE,EXTRA,I

!     THE PRESENT SCORING ALGORITHM IS AS FOLLOWS:
!     (TREASURE POINTS ARE EXPLAINED IN A FOLLOWING COMMENT)
!        OBJECTIVE:          POINTS:        PRESENT TOTAL POSSIBLE:
!     GETTING WELL INTO CAVE   25                    25
!     TOTAL POSSIBLE FOR TREASURES (+MAG)           451
!     SURVIVING             (MAX-NUM)*10             30
!     NOT QUITTING              4                     4
!     REACHING "CLOSING"        20                    20
!     "IS_CLOSED": QUIT/KILLED    10
!              KLUTZED         20
!              WRONG WAY       25
!              SUCCESS         30                    30
!     ROUND OUT THE TOTAL      16                    16
!                                       TOTAL:      576
!     POINTS ARE DEDUCTED FOR USING HINTS.

MYSCORE=0
MXSCOR=0

!  FIRST TALLY UP THE TREASURES.  MUST BE IN BUILDING AND NOT BROKEN. GIVE PARTIAL SCORE JUST FOR FINDING EACH TREASURE.
!  GETS FULL SCORE, QK(3), FOR OBJECT IF OBJECT IS AT LOC QK(1) AND HAS PROP VALUE OF QK(2)

!               WEIGHT  TOTAL POSSIBLE
!  MAGAZINE     1             1

!  ALL THE FOLLOWING ARE MULTIPLIED BY 5 (RANGE 5-25):
!  BOOK         2
!  CASK         3 (WITH WINE ONLY)
!  CHAIN        4 (MUST ENTER VIA STYX)
!  CHEST        5
!  CLOAK        3
!  CLOVER       1
!  COINS        5
!  CROWN        2
!  CRYSTAL-BALL 2
!  DIAMONDS     2
!  EGGS         3
!  EMERALD      3
!  GRAIL        2
!  HORN         2
!  JEWELS       1
!  LYRE         1
!  NUGGET       2
!  PEARL        4
!  PYRAMID      4
!  RADIUM       4
!  RING         4
!  RUG          3
!  SAPPHIRE     1
!  SHOES        3
!  SPICES       1
!  SWORD        4
!  TRIDENT      2
!  VASE         2
!  DROPLET      5
!  TREE         5
!  RUBY YACHT   3
!  GLASS        2
!       TOTAL: 90 * 5 + 1 ==> 451

DO OBJECT=1,MAXOBJ
 IF (POINTS(OBJECT)%VAL/=0) THEN
    K=0
    I=POINTS(OBJECT)%VAL
    IF (TREASURE(OBJECT)) THEN
       K=POINTS(OBJECT)%VAL*2
       IF (PROP(OBJECT)>=0) MYSCORE=MYSCORE+K      !DEFAULT TWICE POINT VALUE IF HAVE IT
       I=I*5
    ENDIF
    IF (PLACE(OBJECT)==POINTS(OBJECT)%LOC.AND.PROP(OBJECT)==POINTS(OBJECT)%PROP.OR.&
       (PLACE(OBJECT)== -CHEST.AND.PLACE(CHEST)==3).OR.&
       (PLACE(OBJECT)== -SHIELD.AND.PLACE(SHIELD)==3)) THEN
          MYSCORE=MYSCORE+I-K  !INCREASE FOR CORRECT LOC
    ENDIF
    MXSCOR=MXSCOR+I
 ENDIF
END DO

!     NOW LOOK AT HOW FINISHED AND HOW FAR ADVENTURER GOT.  MAXDIE AND NUMDIE TELL US HOW WELL ADVNETURER SURVIVED. GAVE_UP TRUE IF
!     QUIT. DFLAG NOT 0 IF ADVENTURER REACHED THE ENDGAME. IF GOT AS FAR AS "CAVE CLOSED" (INDICATED BY "CLOSED"), EXTRA IS ZERO FOR
!     MUNDANE EXITS OR 133, 134, 135 IF ADVENTURER BLEW IT (SO TO SPEAK).

ASCORE=0
IF (DFLAG.NE.0) ASCORE=(MAXDIE-NUMDIE)*10+25
MXSCOR=MXSCOR+MAXDIE*10+25
IF (.NOT.(SCORING.OR.GAVE_UP)) ASCORE=ASCORE+4
MXSCOR=MXSCOR+4
IF (CLOSING) ASCORE=ASCORE+20
MXSCOR=MXSCOR+20
IF (IS_CLOSED) THEN
 IF (EXTRA==0) ASCORE=ASCORE+10
 IF (EXTRA==135) ASCORE=ASCORE+20
 IF (EXTRA==134) ASCORE=ASCORE+25
 IF (EXTRA==133) ASCORE=ASCORE+30
ENDIF
MXSCOR=MXSCOR+30

!     DEDUCT POINTS FOR HINTS.  HINTS < HNTMIN ARE SPECIAL; SEE DATABASE DESCRIPTIO

DO I=1,HNTMAX
 IF (HINTED(I)) MYSCORE=MYSCORE-HINTS(I,2)
END DO
MYSCORE=MYSCORE+ASCORE
IF (MYSCORE.LT.0) MYSCORE=0
END subroutine rating
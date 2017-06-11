   SUBROUTINE SETSCREEN(PAGE_WIDTH,PAGE_LENGTH,BACK)
      USE IFQWIN
      
      IMPLICIT NONE
      
      INTEGER(4) PAGE_WIDTH,PAGE_LENGTH,I,IRET,IRES,BACK
      INTEGER(2) FORE

      LOGICAL RESULT
            
      type (windowconfig) wc
      type (qwinfo) winfo

!     SET CHARACTERISTICS OF CHILD WINDOW

      FORE=15
      WINFO.TYPE=QWIN$SET
      WC.NUMXPIXELS=-1
      WC.NUMYPIXELS=-1
      WC.NUMCOLORS=-1
      WC.TITLE=' '
      WC.FONTSIZE=-1
      WC.NUMTEXTCOLS=PAGE_WIDTH
      WC.NUMTEXTROWS=PAGE_LENGTH+6
      wc%mode = QWIN$SCROLLDOWN
      RESULT=SETWINDOWCONFIG(WC)
      IF (.NOT. RESULT) RESULT=SETWINDOWCONFIG(WC)
      I=SETBKCOLOR(BACK)
      I=SETCOLOR(FORE)
      WINFO.H=WC.NUMTEXTROWS
      WINFO.W=WC.NUMTEXTCOLS
      WINFO.X=0
      WINFO.Y=0
      IRET=SETWSIZEQQ(0,WINFO)

!     SET WINDOW FRAME SIZE

      WINFO%X = 0
      WINFO%Y = 0
      WINFO%W = WC.NUMXPIXELS
      WINFO%H = WC.NUMYPIXELS
      I = SETWSIZEQQ(QWIN$FRAMEWINDOW,WINFO)
      WINFO.TYPE=QWIN$MAX
      WC.NUMTEXTROWS=PAGE_LENGTH           
      IRET=SETWSIZEQQ(0,WINFO)
      CALL CLEARSCREEN($GCLEARSCREEN)
      IRES=DISPLAYCURSOR($GCURSORON)
      END
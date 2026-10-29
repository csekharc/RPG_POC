     H/TITLE  select box
      * ProGen WebSmart Revision 28963
      * File overrides for compile command
      *__OV OVRDBF KWP_DATA   KWP_DATA
      *__OV OVRDBF KWS_DATA   KWS_DATA
      *__   Following values are used to create the server program
      *__RO Pgm  lib KWWEB      Pgm  SELBOX3
      *__AG          WEBSMART
      *__CL          *OBJLIBNAM
      *__BD ECRTBND204
      *===============================================================*
      * Path:   SELBOX3.pdw
      * System: DESKTOP-HRQ4U30
      * Project:Kwik-Loan
      * Set:    Sean KW
      * User:   seanp
      * Date Last Generated:   2018-12-14   10:30:54
      * Last Generated CRC: F22B5C1C E7A60D36 37D56B30 67282EC8
      *===============================================================*
      */CPY *LIBL/PW_CSRC CPYRIGHT
      * File specifications
     FKWP_DATA  IF   E           K DISK    USROPN
     F                                     INFDS(FID001_   )
     F                                     RENAME(RKWPDATA     :RKWPLOOK    )
     FKWS_DATA  IF   E           K DISK    USROPN
     F                                     INFDS(FID002_   )

     D PTL__           S             50    DIM(1) CTDATA PERRCD(1)
     D RTLLA__         S             11    DIM(180)

     D*+FLDDCL Field declarations


     D boxname         S             10A
     D boxid           S             10A
     D type            S             10A
     D jvalidation     S            120A
     D blank           S              1A
     D classes         S           1024A

     D RS001_          S              1A
     D AM001_          S              1A
     D RS002_          S              1A
     D AM002_          S              1A


      * Global variables:
     D firstls__       S              1A   INZ(*ON)
     D flush__         S              1A   INZ(*ON)
     D wfrtn__         S              1A
     D slrtn__         S              1A
     D rpml__          S              5I 0
     D msgdta__        S             70A
     D n30pm__         S             30A
     D voidrtn__a      S              1A
     D voidrtn__n      S              5P 0
     D persists__      S              1A   INZ(*OFF)

     D pltfrm__        S             10A   INZ('RPGFREE')
     D pgsizelm__      S              9P 0 IMPORT('PGSIZELM')

     D Up__            C                   'ABCDEFGHIJKLMNOPQRSTUVWXYZ'
     D Lo__            C                   'abcdefghijklmnopqrstuvwxyz'

     D arclr__         S              8A
     D rwcolor1__      S             32A   INZ('F0F0FF')
     D rwcolor2__      S             32A   INZ('FFFFFF')


     D TASKRAN__       S              1    INZ(*ON)



     D* File info DS for each file
     D FID001_         DS
     D  RR_001_              397    400B 0
     D FID002_         DS
     D  RR_002_              397    400B 0


     D Open_File_      PR             1A
     D OpnFile__                     10A   value
     D OpnMbr__                      10A   value
     D erropen__                      1A   value

     D Pgm_Init_       PR

     D Dfn_Klsts_      PR
     D Dfn_Pgmfs_      PR

     D UpdateRcd_      PR             1A
     D UpdRfmt__                     10A   value

     D DeleteRcd_      PR             1A
     D DltRfmt__                     10A   value

     D main__          PR

     D  True           S              1    INZ(*ON)
     D  False          S              1    INZ(*OFF)
     D  FirstTime      S              1    INZ(*ON)
     D  CV_ByKey       C                   CONST(*ON)
     D  CV_ByRrn       C                   CONST(*OFF)
     D  CV_Amp         C                   CONST('&')
     D  ovrflag__      S              1A   inz('0')

     D  QPNM__         S             32
     D  TASK__         S             32
     D  OWRTN__        S              1
     D  JOBTYPE__      S              1

      * Common indicators - subfield start/end positions = *IN value
     DComm_Ind__       DS                  Based(Cmin_Ptr__)
     D  GNERRSTS__            60     60
     D  VLDINARR__            60     89
     D  DBFIOERR__            93     93
     D  DBFSTS__              93     95

     DCmin_Ptr__       S               *   Inz(%addr(*IN))

      * Pointer to Condition Handler procedure:
     D CndHdlrPtr      S               *   ProcPtr Inz(%Paddr('RTMCNDHAND'))

     D CnlPtr__        S               *   ProcPtr Inz(%Paddr('PGM_CNL_'))

      * Pointer to Pgm status ds:
     D PSPtr__         S               *   inz(%addr(PSDS__))

     D PSDSSV__        S                   LIKE(PSDS__)
     D HTTPHEADERS__   S           4096A   import

     D generic0...
     D                 PR

     D selected        S                   LIKE(p_zkeya       )

      /COPY *LIBL/PW_CSRC,SUBPROT204
      /COPY *LIBL/PW_CSRC,GDPROTO
      /COPY *LIBL/PW_CSRC,JPROTO002

     D/COPY *LIBL/PW_USRC,usubproto

      * field renames


      /free
       // Register the condition handler. Provide pointer to Pgm status
       // data structure
       RegCndHdlr_(CndHdlrPtr: PSPtr__:  *omit);
       Pgm_Init_();
       Dfn_Pgmfs_();

      /end-free
     C     *ENTRY        PLIST
     C                   PARM                    p_ztype
     C                   PARM                    boxname
     C                   PARM                    boxid
     C                   PARM                    selected
     C                   PARM                    type
     C                   PARM                    jvalidation
     C                   PARM                    blank
     C                   PARM                    classes
      /free
       main__();
       UnRegCndHdlr_(CndHdlrPtr : *omit);

       //  Close all files and shut down program:  -not persisent: close all.
       if ovrflag__ = '1';
        ExecCmd2_('dltovr file(*all)':17);
       endif;
       if  Persists__ = *OFF;
        *INLR = *ON;
       else;
        return;
       endif;

       // *PSSR  - Program exception/error handler.
       BEGSR *PSSR;
       // error handler closes error page HTML and writes it to browser:
       CALLP     ErrHandlr_('CLOSE' : PSDS__);
       // Exit program immediately:
       *INLR = *ON;
       RETURN;
       ENDSR;

      /end-free

      *--------------------------------------------------------------------------------------------*
      * Klistdcl__ - Subroutine to globally declare all KLISTS.
      *--------------------------------------------------------------------------------------------*
     C     Klistdcl__    BEGSR

     C     DL001_        KLIST
     C                   KFLD                    p_ztype
     C     DL002_        KLIST
     C                   KFLD                    p_ztype
     C                   ENDSR


      * Subprocedures follow:
      *--------------------------------------------------------------------------------------------*
      * main__ - Contains the main function source code from the PML
      *--------------------------------------------------------------------------------------------*
     P main__          B
     D main__          PI

      /free
       // PML Start ----------------------------------
       Open_File_('*ALL': '*FIRST':  'Y');
       generic0();

       // PML End   ----------------------------------

      /end-free
     c     *PSSR         begsr
     c                   endsr
     P main__          E



     P*---------------------------------------------------------------------
     P* generic0...                 - User defined function
     P*---------------------------------------------------------------------
     P generic0...
     P                 B
     D generic0...
     D                 PI




      /free
       OutWeb_('<select type="select-one" name="');
       OutWeb_(%trimr( %trim(boxname)));
       OutWeb_('"');
       OutWeb_(' id="');
       OutWeb_(%trimr( %trim(boxid)));
       OutWeb_('"');
       if ((( %trim(jvalidation) <> '') and ( %trim(boxname) <> 'MEFTPMT')));
        OutWeb_(%trimr( 'onblur="' + %trim(jvalidation) + '"'));
       endif;
       if (((eprmcnt__> 7) and (classes <> '')));
        OutWeb_(%trimr( ' class="' + %trim(classes) + '" '));
       endif;
       OutWeb_(' size="1"');
       OutWeb_('>');
       if (((eprmcnt__< 7) or (blank = 'Y')));
        OutWeb_('<option value=""></option>');
       endif;
       if (type = '');
        SETLL  DL001_ RKWPLOOK;
        RS001_ = RcdSts2_('POSRCD':%error:%equal:%eof);
        if (RS001_ = '3');
         type = 'USER';
        else;
         type = 'SYSTEM';
        endif;
       endif;
       if (type = 'SYSTEM');
        SETLL  DL002_ RKWSDATA;
        RS002_ = RcdSts2_('POSRCD':%error:%equal:%eof);
        READE(NE) DL002_ RKWSDATA;
        RS002_ = RcdSts2_('GETNXTRCD':%error:%found:%eof);
        AM002_ = CV_ByKey;
        dow (RS002_ = '1');
        select;
        when ((S_ZKEYN <> 0) and (boxname <> 'PUPROFILE'));
        OutWeb_('<option value="');
        OutWeb_(%trimr( %trim(%editc(S_ZKEYN:'P'))));
        OutWeb_('"');
        other;
        OutWeb_('<option value="');
        OutWeb_(%trimr( %trim(s_zkeya)));
        OutWeb_('"');
        endsl;
        select;
        when (s_zdef = 'Y' and selected = ' ');
        OutWeb_(' selected');
        when (s_zkeya <> ' ');
        if (selected = s_zkeya);
         OutWeb_(' selected');
        endif;
        when (S_ZKEYN <> 0);
        if ( %dec(aton_(selected:46:16):46:16) = S_ZKEYN);
         OutWeb_(' selected');
        endif;
        endsl;
        OutWeb_('>');
        OutWeb_(%trimr( %trim(s_zdesc)));
        OutWeb_('</option>');
        READE(NE) DL002_ RKWSDATA;
        RS002_ = RcdSts2_('GETNXTRCD':%error:%found:%eof);
        AM002_ = CV_ByKey;
        enddo;
        OutWeb_('</select>');
       endif;
       if (type <> 'SYSTEM');
        SETLL  DL001_ RKWPLOOK;
        RS001_ = RcdSts2_('POSRCD':%error:%equal:%eof);
        READE(NE) DL001_ RKWPLOOK;
        RS001_ = RcdSts2_('GETNXTRCD':%error:%found:%eof);
        AM001_ = CV_ByKey;
        dow (RS001_ = '1');
        select;
        when (P_ZKEYN <> 0);
        OutWeb_('<option value="');
        OutWeb_(%trimr( %trim(%editc(P_ZKEYN:'P'))));
        OutWeb_('"');
        other;
        OutWeb_('<option value="');
        OutWeb_(%trimr( %trim(p_zkeya)));
        OutWeb_('"');
        endsl;
        select;
        when (p_zdef = 'Y' and selected = ' ');
        OutWeb_(' selected');
        when (p_zkeya <> ' ');
        if (selected = p_zkeya);
         OutWeb_(' selected');
        endif;
        when (P_ZKEYN <> 0);
        if ( %dec(aton_(selected:46:16):46:16) = P_ZKEYN);
         OutWeb_(' selected');
        endif;
        endsl;
        if (type = 'PGM');
         OutWeb_('>');
         OutWeb_(%trimr( %trim(p_zkeya)));
         OutWeb_('</option>');
        else;
         OutWeb_('>');
         OutWeb_(%trimr( %trim(p_zdesc)));
         OutWeb_('</option>');
        endif;
        READE(NE) DL001_ RKWPLOOK;
        RS001_ = RcdSts2_('GETNXTRCD':%error:%found:%eof);
        AM001_ = CV_ByKey;
        enddo;
        OutWeb_('</select>');
       endif;
      /end-free
     c     *PSSR         begsr
     c                   endsr
     P                 E


      *--------------------------------------------------------------------------------------------*
      * Pgm_Init_ - Program initialization
      *--------------------------------------------------------------------------------------------*
     P Pgm_Init_       B
     D Pgm_Init_       PI
      /free

       // Initialize library list array for current job to find files
       rtlla__(1) = 'KWDB';
       rtlla__(2) = 'KWSYS';

       // Set the runtime library for support object references.
       // Also, determine job type
       jobtype__ = SetRtLib_('XL_WEBSPT');

       // Register the condition handler. Use a pointer to the
       // pgm status data structure
       RegCndHdlr_(CndHdlrPtr:  PSPtr__: *omit);
       task__ = 'DEFAULT';

      /end-free
     P Pgm_Init_       E


      *--------------------------------------------------------------------------------------------*
      * Pgm_Cnl_  - Program cancellation initiated by Condition Handler
      *--------------------------------------------------------------------------------------------*
     P Pgm_Cnl_        B
      *   Call error handler to close error page HTML properly, and write it to browser:
     C                   CALLP     ErrHandlr_('CLOSE')
      /free

      /end-free
      *   Shutdown program immediately:
     C                   CALLP     Shutdown_
     P Pgm_Cnl_        E


      *----------------------------------------------------------------
      * Open_File_  - Open a specified file
      *----------------------------------------------------------------
     P Open_File_      B
     D Open_File_      PI             1A
      * Parameters: HTML string to write, and its calculated length:
     D file__                        10    value
     D mbr__                         10    value
     D erropen__                      1    value

     C                   eval      *in90 = *off

      /free
       // Open database files
       if   ((file__='KWP_DATA' or file__='*ALL') and NOT %OPEN(KWP_DATA));
        if (mbr__ <> '*FIRST');
         ovrdbf_(ovrflag__:'KWP_DATA':'KWP_DATA' : '*LIBL' : mbr__);
        elseif ('KWP_DATA' <> 'KWP_DATA');
         ovrdbf_(ovrflag__:'KWP_DATA':'KWP_DATA' : '*LIBL');
        endif;
        if    erropen__ = 'Y';
         OPEN(E) KWP_DATA;                //    KWP_DATA
         if        %error;
          return %error;
         endif;
        else;
         OPEN KWP_DATA;                //    KWP_DATA
        endif;
       endif;
       if   ((file__='KWS_DATA' or file__='*ALL') and NOT %OPEN(KWS_DATA));
        if (mbr__ <> '*FIRST');
         ovrdbf_(ovrflag__:'KWS_DATA':'KWS_DATA' : '*LIBL' : mbr__);
        elseif ('KWS_DATA' <> 'KWS_DATA');
         ovrdbf_(ovrflag__:'KWS_DATA':'KWS_DATA' : '*LIBL');
        endif;
        if    erropen__ = 'Y';
         OPEN(E) KWS_DATA;                //    KWS_DATA
         if        %error;
          return %error;
         endif;
        else;
         OPEN KWS_DATA;                //    KWS_DATA
        endif;
       endif;
      /end-free

     C                   return    *in90
     P Open_File_      E


      *--------------------------------------------------------------------------------------------*
      * UpdateRcd_  - Update a specified record format
      *--------------------------------------------------------------------------------------------*
     P UpdateRcd_      B
     D UpdateRcd_      PI             1A
      * Parameters: Record format name to Update
     D rcdfmt__                      10    value

     D UpdateRcdSts    S              1

      /free
       select;
       endsl;
      /end-free

     C                   EVAL      UpdateRcdSts= RcdSts2_('UPDRCD'
     C                             :%error:%found:%eof)
     C                   RETURN    UpdateRcdSts

     P UpdateRcd_      E



      *--------------------------------------------------------------------------------------------*
      * DeleteRcd_  - Delete a specified record format
      *--------------------------------------------------------------------------------------------*
     P DeleteRcd_      B
     D DeleteRcd_      PI             1A
      * Parameters: Record format name to delete
     D rcdfmt__                      10    value

     D DeleteRcdSts    S              1

      /free
       select;
       endsl;
      /end-free

     C                   EVAL      DeleteRcdSts= RcdSts2_('DELRCD'
     C                             :%error:%found:%eof)
     C                   RETURN    DeleteRcdSts

     P DeleteRcd_      E


      *--------------------------------------------------------------------------------------------*
      * Dfn_Pgmfs_ - Define Program Fields for use in any program
      *--------------------------------------------------------------------------------------------*
     P Dfn_Pgmfs_      B
     D Dfn_Pgmfs_      PI
      *+DFNPGF

     P Dfn_Pgmfs_      E

      *--------------------------------------------------------------------------------------------*
      * Flip_Rc_ - Flip the alternating row colors
      *--------------------------------------------------------------------------------------------*
     P Flip_Rc_        B
     D Flip_Rc_        PI
      /free
       if ARCLR__ = RWCOLOR1__;
        ARCLR__ = RWCOLOR2__;
       else;
        ARCLR__ = RWCOLOR1__;
       endif;

      /end-free
     P Flip_Rc_        E

      *--------------------------------------------------------------------------------------------*
      * Exit_Immed_ - Exit program immediately. Flush current HTML buffer.
      *--------------------------------------------------------------------------------------------*
     P Exit_Immed_     B
     D Exit_Immed_     PI
      /free

       // Close all files and shut down program:
       if ovrflag__ = '1';
        ExecCmd2_('dltovr file(*all)':17);
       endif;
       Shutdown_();                          //     Shut down completely

      /end-free
     P Exit_Immed_     E







      *+CTARRS Compile-time Arrays go here:
**CTDATA PTL__      Program title contents
select box

     H/TITLE  Clover Reports List
      * ProGen WebSmart Revision 21923
      * File overrides for compile command
      *__OV OVRDBF KW_CLOVER  KW_CLOVER
      *__OV OVRDBF F__ARR001  KW_CLOVER
      *__OV OVRDBF PW_REGF    PW_REGF
      *__OV OVRDBF KW_CLOVERD KW_CLOVERD
      *__OV OVRDBF F__ARR003  KW_CLOVERD
      *__   Following values are used to create the server program
      *__RO Pgm  lib KWWEB      Pgm  RPTLIST
      *__AG          WEBSMART
      *__CL          *OBJLIBNAM
      *__BD ECRTBND195
      *===============================================================*
      * Path:   rptlist.pdw
      * System: LAPTOP-Q2C0JE89
      * Project:Kwik-Loan
      * Set:    Development
      * User:   tvrba
      * Date Last Generated:   2017-07-17   08:48:44
      * Last Generated CRC: 113D9162 EF6FF4BF 48085C06 C79BF90A
      *===============================================================*
      */CPY *LIBL/PW_CSRC CPYRIGHT
      * File specifications
     FKW_CLOVER IF   E           K DISK    USROPN
     F                                     INFDS(FID001_   )
     FF__ARR001 IF   E             DISK    USROPN
     F                                     RENAME(RKWCLOVER    :R__ARR001   )
     FPW_REGF   IF   E           K DISK    USROPN
     F                                     INFDS(FID002_   )
     FKW_CLOVERDIF   E           K DISK    USROPN
     F                                     INFDS(FID003_   )
     F                                     RENAME(RKWCLOVER    :R__FMT01    )
     FF__ARR003 IF   E             DISK    USROPN
     F                                     RENAME(RKWCLOVER    :R__ARR003   )

     D PTL__           S             50    DIM(1) CTDATA PERRCD(1)
     D RTLLA__         S             11    DIM(180)

     D*+FLDDCL Field declarations

     Duserdata         DS                  INZ
     D client                         5A
     D userid                        32A
     D location                       5A

     D rnd             S              6A
     D startrrn        S              9P 0
     D endrrn          S              9P 0
     D rcdcnt          S              5P 0
     D prevstate       S              5P 0
     D nextstate       S              5P 0
     D listsize        S              5P 0
     D rrn             S              9P 0
     D savedrrn        S              9A
     D rptlib          S             10A
     D dftlist         S              1A
     D artncod         S              5A
     D url1            S             10A
     D security        S              1A

     D RS001_          S              1A
     D AM001_          S              1A
     D RS002_          S              1A
     D AM002_          S              1A
     D RS003_          S              1A
     D AM003_          S              1A


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
     D rwcolor1__      S             32A   INZ('altcol1')
     D rwcolor2__      S             32A   INZ('altcol2')


     D TASKRAN__       S              1    INZ(*OFF)


     D H__1            S             80    PERRCD(1) CTDATA DIM(31          )

     D H__2            S             80    PERRCD(1) CTDATA DIM(2           )

     D H__3            S             80    PERRCD(1) CTDATA DIM(9           )

     D H__4            S             80    PERRCD(1) CTDATA DIM(1           )


     D* File info DS for each file
     D FID001_         DS
     D  RR_001_              397    400B 0
     D FID002_         DS
     D  RR_002_              397    400B 0
     D FID003_         DS
     D  RR_003_              397    400B 0


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

     D displist0...
     D                 PR
     D prev0...
     D                 PR
     D CURTIME__       S              6P 0
     D QPGMNAM__       S             20A
     D SmurfChk__      S              1A   INZ(*ON)
     D Smurf_ID__      S             64A   IMPORT
     D Smurf_Rw__      S              9B 0 IMPORT


      /COPY *LIBL/PW_CSRC,SUBPROT195
      /COPY *LIBL/PW_CSRC,GDPROTO
      /COPY *LIBL/PW_CSRC,JPROTO002

     D/COPY *LIBL/PW_USRC,usubproto

      * field renames


      /free
       // Register the condition handler. Provide pointer to Pgm status
       // data structure
       RegCndHdlr_(CndHdlrPtr: PSPtr__:  *omit);
       WasInit_();
       Pgm_Init_();
       Dfn_Pgmfs_();
       main__();

       // Flush HTML buffer
       if  flush__ = *ON;
        outweb_('');
       endif;
       Pgm_Cleanup_();
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

     C     pfklist       KLIST
     C                   KFLD                    clovname
     C     pfklist1      KLIST
     C                   KFLD                    rgpgm
     C                   ENDSR


      * Subprocedures follow:
      *--------------------------------------------------------------------------------------------*
      * main__ - Contains the main function source code from the PML
      *--------------------------------------------------------------------------------------------*
     P main__          B
     D main__          PI

      /free
       // PML Start ----------------------------------
       rnd = %trim(%editc(CURTIME__:'P'));
       listsize = 19;
       artncod = HasItExpired_(SMURF_ID__);
       if (artncod <> '0');
        Redirect2_('login.pgm':'*SAME');
        return ;
       else;
        userdata = GetSmurf2_('KWIKLOAN');
        if (((client = '') or (userid = '')));
         Redirect2_('login.pgm':'*SAME');
         return ;
        endif;
       endif;
       if ((((client = '903')) or ((client = '103'))));
        url1 = 'kwikrpt/';
       else;
        url1 = 'kwik/';
       endif;
       ExecCmd2_('ADDLIBLE QGPL':%len(%trimr('ADDLIBLE QGPL')));
       dftlist = getparm3_('dftlist':'*OPT');
       ExecCmd2_( 'KWSET ' + %trim(client):%len(%trimr( 'KWSET ' + %trim(
       client))));
       ExecCmd2_('ADDLIBLE XL_WEBLIB':%len(%trimr('ADDLIBLE XL_WEBLIB')));
       Open_File_('*ALL': '*FIRST':  'Y');
       security = kw_security(userid:'RPTLIST.PGM');
       if (security = '0');
        ExecCmd2_('CHGLIBL LIBL(QTEMP QGPL)':%len(%trimr('CHGLIBL LIBL(QTEMP -
       QGPL)')));
        Redirect2_('dash.pgm':'*SAME');
        return ;
       endif;
       startrrn = %dec(aton_( getparm3_('rrn':'*OPT'):46:16):9:0);
       if (task__ = 'DEFAULT');
        taskran__ = *ON;
        displist0();
       endif ;
       if (task__ = 'PREV');
        taskran__ = *ON;
        prev0();
       endif ;
       ExecCmd2_('CHGLIBL LIBL(QTEMP QGPL)':%len(%trimr('CHGLIBL LIBL(QTEMP Q-
       GPL)')));

       // PML End   ----------------------------------
       if (taskran__ = *OFF and Jobtype__ ='0');

        // Write page for missing/incorrect TASK parm
        WriteNoTaskPg_();
       endif;
      /end-free
     c     *PSSR         begsr
     c                   endsr
     P main__          E



     P*---------------------------------------------------------------------
     P* displist0...                - User defined function
     P*---------------------------------------------------------------------
     P displist0...
     P                 B
     D displist0...
     D                 PI




      /free
       clovname = ' ';
       outweb_(%subst(%str(%addr(H__1(1))):1:939));
       wfrtn__ = AfToPage_(QPGMNAM__);
       outweb_(%subst(%str(%addr(H__1(12))):60:15));
       AfToPage_(%trim(%editc(STARTRRN:'X')));
       outweb_(%subst(%str(%addr(H__1(12))):75:9));
       wfrtn__ = AfToPage_(DFTLIST);
       outweb_(%subst(%str(%addr(H__1(13))):4:140));
       wfrtn__ = AfToPage_(QPGMNAM__);
       outweb_(%subst(%str(%addr(H__1(14))):64:5));
       AfToPage_(%trim(%editc(ENDRRN:'X')));
       outweb_(%subst(%str(%addr(H__1(14))):69:9));
       wfrtn__ = AfToPage_(DFTLIST);
       outweb_(%subst(%str(%addr(H__1(14))):78:179));
       wfrtn__ = AfToPage_(QPGMNAM__);
       outweb_(%subst(%str(%addr(H__1(17))):17:1129));
       rcdcnt = 0;
       if (dftlist = 'Y');
        if (startrrn> 0);
         RR_003_ = startrrn;
         AM003_ = CV_BYRRN;
         CHAIN(NE) RR_003_ R__ARR003;
         RS003_ = RcdSts2_('GETRCD': %error: %found: %eof);
        endif;
        SETLL  pfklist R__FMT01;
        RS003_ = RcdSts2_('POSRCD':%error:%equal:%eof);
        READ(E)  R__FMT01;
        RS003_ = RcdSts2_('GETNXTRCD':%error:%found:%eof);
        AM003_ = CV_ByKey;
        if (RS003_ <> '1');
         SETLL  *HIVAL R__FMT01;
         RS003_ = RcdSts2_('POSRCD':%error:%equal:%eof);
         READ(E)  R__FMT01;
         RS003_ = RcdSts2_('GETNXTRCD':%error:%found:%eof);
         AM003_ = CV_ByKey;
        endif;
        dow ((((RS003_ = '1')) and ((rcdcnt< listsize))));
        rrn = RR_003_;
        if (rcdcnt = 0);
         startrrn = RR_003_;
        endif;
        outweb_(%subst(%str(%addr(H__2(1))):1:35));
        wfrtn__ = AfToPage_(URL1);
        wfrtn__ = AfToPage_(CLOVNAME);
        outweb_(%subst(%str(%addr(H__2(1))):36:20));
        wfrtn__ = AfToPage_(CLOVDESC);
        outweb_(%subst(%str(%addr(H__2(1))):56:29));
        wfrtn__ = AfToPage_(CLOVCAT);
        outweb_(%subst(%str(%addr(H__2(2))):5:12));
        endrrn = RR_003_;
        rcdcnt = rcdcnt + 1;
        READ(E)  R__FMT01;
        RS003_ = RcdSts2_('GETNXTRCD':%error:%found:%eof);
        AM003_ = CV_ByKey;
        enddo;
        RR_003_ = startrrn;
        AM003_ = CV_BYRRN;
        CHAIN(NE) RR_003_ R__ARR003;
        RS003_ = RcdSts2_('GETRCD': %error: %found: %eof);
        SETLL  pfklist R__FMT01;
        RS003_ = RcdSts2_('POSRCD':%error:%equal:%eof);
        READP(E)  R__FMT01;
        RS003_ = RcdSts2_('GETPRVRCD': %error: %found: %eof);
        AM003_ = CV_ByKey;
        if (RS003_ = '1');
         prevstate = 1;
        endif;
        if (rcdcnt = listsize);
         RR_003_ = endrrn;
         AM003_ = CV_BYRRN;
         CHAIN(NE) RR_003_ R__ARR003;
         RS003_ = RcdSts2_('GETRCD': %error: %found: %eof);
         SETGT  pfklist R__FMT01;
         RS003_ = RcdSts2_('POSRCD':%error:%equal:%eof);
         READ(E)  R__FMT01;
         RS003_ = RcdSts2_('GETNXTRCD':%error:%found:%eof);
         AM003_ = CV_ByKey;
         if (RS003_ = '1');
          endrrn = RR_003_;
          nextstate = 1;
         endif;
        endif;
       else;
        if (startrrn> 0);
         RR_001_ = startrrn;
         AM001_ = CV_BYRRN;
         CHAIN(NE) RR_001_ R__ARR001;
         RS001_ = RcdSts2_('GETRCD': %error: %found: %eof);
        endif;
        SETLL  pfklist RKWCLOVER;
        RS001_ = RcdSts2_('POSRCD':%error:%equal:%eof);
        READ(E)  RKWCLOVER;
        RS001_ = RcdSts2_('GETNXTRCD':%error:%found:%eof);
        AM001_ = CV_ByKey;
        if (RS001_ <> '1');
         SETLL  *HIVAL RKWCLOVER;
         RS001_ = RcdSts2_('POSRCD':%error:%equal:%eof);
         READ(E)  RKWCLOVER;
         RS001_ = RcdSts2_('GETNXTRCD':%error:%found:%eof);
         AM001_ = CV_ByKey;
        endif;
        dow ((((RS001_ = '1')) and ((rcdcnt< listsize))));
        rrn = RR_001_;
        if (rcdcnt = 0);
         startrrn = RR_001_;
        endif;
        outweb_(%subst(%str(%addr(H__2(1))):1:35));
        wfrtn__ = AfToPage_(URL1);
        wfrtn__ = AfToPage_(CLOVNAME);
        outweb_(%subst(%str(%addr(H__2(1))):36:20));
        wfrtn__ = AfToPage_(CLOVDESC);
        outweb_(%subst(%str(%addr(H__2(1))):56:29));
        wfrtn__ = AfToPage_(CLOVCAT);
        outweb_(%subst(%str(%addr(H__2(2))):5:12));
        endrrn = RR_001_;
        rcdcnt = rcdcnt + 1;
        READ(E)  RKWCLOVER;
        RS001_ = RcdSts2_('GETNXTRCD':%error:%found:%eof);
        AM001_ = CV_ByKey;
        enddo;
        RR_001_ = startrrn;
        AM001_ = CV_BYRRN;
        CHAIN(NE) RR_001_ R__ARR001;
        RS001_ = RcdSts2_('GETRCD': %error: %found: %eof);
        SETLL  pfklist RKWCLOVER;
        RS001_ = RcdSts2_('POSRCD':%error:%equal:%eof);
        READP(E)  RKWCLOVER;
        RS001_ = RcdSts2_('GETPRVRCD': %error: %found: %eof);
        AM001_ = CV_ByKey;
        if (RS001_ = '1');
         prevstate = 1;
        endif;
        if (rcdcnt = listsize);
         RR_001_ = endrrn;
         AM001_ = CV_BYRRN;
         CHAIN(NE) RR_001_ R__ARR001;
         RS001_ = RcdSts2_('GETRCD': %error: %found: %eof);
         SETGT  pfklist RKWCLOVER;
         RS001_ = RcdSts2_('POSRCD':%error:%equal:%eof);
         READ(E)  RKWCLOVER;
         RS001_ = RcdSts2_('GETNXTRCD':%error:%found:%eof);
         AM001_ = CV_ByKey;
         if (RS001_ = '1');
          endrrn = RR_001_;
          nextstate = 1;
         endif;
        endif;
       endif;
       outweb_(%subst(%str(%addr(H__3(1))):1:260));
       AfToPage_(%trim(%editc(STARTRRN:'P')));
       outweb_(%subst(%str(%addr(H__3(4))):21:118));
       wfrtn__ = AfToPage_(QPGMNAM__);
       outweb_(%subst(%str(%addr(H__3(5))):59:15));
       AfToPage_(%trim(%editc(STARTRRN:'X')));
       outweb_(%subst(%str(%addr(H__3(5))):74:9));
       wfrtn__ = AfToPage_(DFTLIST);
       outweb_(%subst(%str(%addr(H__3(6))):3:52));
       AfToPage_(%trim(%editc(ENDRRN:'P')));
       outweb_(%subst(%str(%addr(H__3(6))):55:119));
       wfrtn__ = AfToPage_(QPGMNAM__);
       outweb_(%subst(%str(%addr(H__3(8))):14:18));
       AfToPage_(%trim(%editc(ENDRRN:'X')));
       outweb_(%subst(%str(%addr(H__3(8))):32:9));
       wfrtn__ = AfToPage_(DFTLIST);
       outweb_(%subst(%str(%addr(H__3(8))):41:96));

      /end-free
     c     *PSSR         begsr
     c                   endsr
     P                 E


     P*---------------------------------------------------------------------
     P* prev0...                    - User defined function
     P*---------------------------------------------------------------------
     P prev0...
     P                 B
     D prev0...
     D                 PI




      /free
       RR_001_ = startrrn;
       AM001_ = CV_BYRRN;
       CHAIN(NE) RR_001_ R__ARR001;
       RS001_ = RcdSts2_('GETRCD': %error: %found: %eof);
       SETLL  pfklist RKWCLOVER;
       RS001_ = RcdSts2_('POSRCD':%error:%equal:%eof);
       READP(E)  RKWCLOVER;
       RS001_ = RcdSts2_('GETPRVRCD': %error: %found: %eof);
       AM001_ = CV_ByKey;
       rcdcnt = 1;
       dow ((((RS001_ = '1')) and ((rcdcnt< listsize))));
       rcdcnt = rcdcnt + 1;
       READP(E)  RKWCLOVER;
       RS001_ = RcdSts2_('GETPRVRCD': %error: %found: %eof);
       AM001_ = CV_ByKey;
       enddo;
       startrrn = RR_001_;
       displist0();
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

      /end-free
     C                   TIME                    CURTIME__
      /free
      /end-free
      /free
       QPGMNAM__=%trim(PGMNAME__) + '.pgm';

       // Initialize library list array for current job to find files
       rtlla__(1) = 'KWDB';
       rtlla__(2) = 'XL_WEBLIB';
       rtlla__(3) = 'KWDB108';

       // Set the runtime library for support object references.
       // Also, determine job type
       jobtype__ = SetRtLib_('XL_WEBSPT');

       // Register the condition handler. Use a pointer to the
       // pgm status data structure
       RegCndHdlr_(CndHdlrPtr:  PSPtr__: *omit);

      /end-free
      /free
       SmurfChk__ = *OFF;

       // If Smurfid parm is missing, or value is blank, write error page:
       if  ChkSmurfID_(SmurfChk__)=*ON;
        UnRegCndHdlr_(CndHdlrPtr : *omit);

        // Close all files and shut down program:
        if   Persists__ = *OFF;
         *inlr = *ON;
        endif;
        ShutDown_();
       endif;

       // Set minimum page size limit to 2Mb.
       if PgSizeLm__ < 2000000;
        PgSizeLm__ = 2000000;
       endif;

       //  Get the task. If none provided, use the default:
       task__ = getparm3_('TASK');
       if  task__ = '';
        task__ = 'DEFAULT';
       else;
        //  Convert the parameter value to upper case:
        task__ = %XLATE(lo__: up__  :task__);
       endif;

       // Clear the HTTP Headers
       HTTPHEADERS__ = '';

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
       if   ((file__='KW_CLOVER' or file__='*ALL') and NOT %OPEN(KW_CLOVER));
        if (mbr__ <> '*FIRST');
         ovrdbf_(ovrflag__:'KW_CLOVER':'KW_CLOVER' : '*LIBL' : mbr__);
        elseif ('KW_CLOVER' <> 'KW_CLOVER');
         ovrdbf_(ovrflag__:'KW_CLOVER':'KW_CLOVER' : '*LIBL');
        endif;
        if    erropen__ = 'Y';
         OPEN(E) KW_CLOVER;             //    KW_CLOVER
         if        %error;
          return %error;
         endif;
        else;
         OPEN KW_CLOVER;                //    KW_CLOVER
        endif;
       endif;
       if   (file__='KW_CLOVER' or file__='*ALL')  and NOT %OPEN(F__ARR001);
        ovrdbf_(ovrflag__:'F__ARR001':'KW_CLOVER' : '*LIBL' : mbr__);
        if   erropen__ = 'Y';
         OPEN(E) F__ARR001;          //   KW_CLOVER
         if        %error;
          return %error;
         endif;
        else;
         OPEN F__ARR001;            //    KW_CLOVER
        endif;
       endif;
       if   ((file__='PW_REGF' or file__='*ALL') and NOT %OPEN(PW_REGF));
        if (mbr__ <> '*FIRST');
         ovrdbf_(ovrflag__:'PW_REGF':'PW_REGF' : '*LIBL' : mbr__);
        elseif ('PW_REGF' <> 'PW_REGF');
         ovrdbf_(ovrflag__:'PW_REGF':'PW_REGF' : '*LIBL');
        endif;
        if    erropen__ = 'Y';
         OPEN(E) PW_REGF;                //    PW_REGF
         if        %error;
          return %error;
         endif;
        else;
         OPEN PW_REGF;                //    PW_REGF
        endif;
       endif;
       if   ((file__='KW_CLOVERD' or file__='*ALL') and NOT %OPEN(KW_CLOVERD));
        if (mbr__ <> '*FIRST');
         ovrdbf_(ovrflag__:'KW_CLOVERD':'KW_CLOVERD' : '*LIBL' : mbr__);
        elseif ('KW_CLOVERD' <> 'KW_CLOVERD');
         ovrdbf_(ovrflag__:'KW_CLOVERD':'KW_CLOVERD' : '*LIBL');
        endif;
        if    erropen__ = 'Y';
         OPEN(E) KW_CLOVERD;             //    KW_CLOVERD
         if        %error;
          return %error;
         endif;
        else;
         OPEN KW_CLOVERD;                //    KW_CLOVERD
        endif;
       endif;
       if   (file__='KW_CLOVERD' or file__='*ALL')  and NOT %OPEN(F__ARR003);
        ovrdbf_(ovrflag__:'F__ARR003':'KW_CLOVERD' : '*LIBL' : mbr__);
        if   erropen__ = 'Y';
         OPEN(E) F__ARR003;          //   KW_CLOVERD
         if        %error;
          return %error;
         endif;
        else;
         OPEN F__ARR003;            //    KW_CLOVERD
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
       outweb_('');
       Pgm_Cleanup_();

       // Close all files and shut down program:
       if ovrflag__ = '1';
        ExecCmd2_('dltovr file(*all)':17);
       endif;
       Shutdown_();                          //     Shut down completely

      /end-free
     P Exit_Immed_     E







      *+CTARRS Compile-time Arrays go here:
**CTDATA PTL__      Program title contents
Clover Reports List
**CTDATA H__1        ListHeader                       2425
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.or
g/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>
    <meta name="genera
tor" content="WebSmart" />
    <meta http-equiv="Pragma" content="no-cache" />

   <title>Custom Reports</title>
    <link rel="stylesheet" type="text/css" href
="/websmart/kwikloan/styles/klstylei.css" media="screen, tv, projection" />

<link rel="stylesheet" type="text/css" href="/websmart/kwikloan/styles/klstyleIn
quiryList.css" media="screen, tv, projection" />
    <script type="text/javascri
pt" src="/websmart/kwikloan/javascript/klscripts.js"></script>
  </head>
  <body
>
    <div id="wrapping">
      <div id="everything">
        <div id="pagetitle
">
          <span>Custom Reports</span>
        </div>  
        <div id="white
bg" class="whitebg">
          <div class="left">
            <table class="acti
onsTable">
              <tr><td><a id="prevlinkbot" href="?task=prev&rrn=&dftli
st=" class="nonDisplay"><img src="/websmart/kwikloan/images/loanInqLSpp.png"> </
a></td></tr> 
              <tr><td> <a id="nextlinkbot" href="?rrn=&dftlist=" c
lass="nonDisplay"><img src="/websmart/kwikloan/images/loanInqLSnp.png"></a> </td
></tr>
              
            </table> 
            
            <form metho
d="get" action="">
              <table class="accountInfo" id="loanSearchTable"
>
                
                <tr>
                  <td id="Lname"><span c
lass="LSlabel">Category:</span><br><select name="CATEGORY" size="1">

         <option value="REPORT" selected>Report</option>
                    <op
tion value="TEMPLATE">Template</option>
                    </select></td>

           </tr>
                <tr>
                  <td><br><br><input type=
"submit" value="Filter Results"><br>
                  </td>
                </t
r>
              </table> 
            </form>
            
          </div><!--
left-->
          <div class="right">
            <div id="scroller">

    <div id="sections">
                <ul>
                <li>

  
                <table class="mainlist">
                  <tr>

       
                    
                    
                    <th width=
"200"> Report Description</th>
                    <th width="50">Category</th>

                    
                    
                    

 </tr>

**CTDATA H__2        ListDetails                      96
<tr>
  <td class="text"> <a href="/" target = "_blank"></a></td>
  <td class="te
xt"></td>
</tr>

**CTDATA H__3        ListFooter                       696
</table>
</form>
</li>
</ul>
</div><!--sections-->
</div><!--scroller-->
</div><
!--right-->
</div><!--whitebg-->
</div><!--everything-->
</div><!--wrapping-->
<
script type="text/javascript">

function handleButtons() {
	// write the PREV li
nk if necessary
	if( > 0)
	{
	 
		document.getElementById("prevlinkbot").classNa
me ="";
	 
		document.getElementById("prevlinkbot").href="?task=prev&rrn=&dftlis
t=";
		
	}
	
	// write the NEXT link if necessary
	if( > 0)
	{
	 
		document.get
ElementById("nextlinkbot").className ="";
		 
		document.getElementById("nextlin
kbot").href="?task=DEFAULT&rrn=&dftlist=";
	}
}
	
</script>
<script type="text/j
avascript">
handleButtons();
</script>

</body>
</html>

**CTDATA H__4        RtnToList                        65
<button onClick="javascript:location.href='?rrn=;'">Back</button>

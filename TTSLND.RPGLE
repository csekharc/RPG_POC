     H/TITLE  The Tire Store landing page
      * ProGen WebSmart Revision 28963
      * File overrides for compile command
      *__OV OVRDBF KWPDBASE   KWPDBASE
      *__OV OVRDBF KWPDLOC    KWPDLOC
      *__   Following values are used to create the server program
      *__RO Pgm  lib KWWEB      Pgm  TTSLND
      *__AG          WEBSMART
      *__CL          *OBJLIBNAM
      *__SQ
      *__BD ECRTBND204
      *===============================================================*
      * Path:   ttslnd.pdw
      * System: L-IT-SPROVOST
      * Project:Kwik-Loan
      * Set:    Landing Pages
      * User:   sprovost
      * Date Last Generated:   2019-02-11   10:33:14
      * Last Generated CRC: A4532038 0F19B020 CBB73877 00B69120
      *===============================================================*
      */CPY *LIBL/PW_CSRC CPYRIGHT
      * File specifications
     FKWPDBASE  IF   E           K DISK    USROPN
     F                                     INFDS(FID001_   )
     FKWPDLOC   IF   E           K DISK    USROPN
     F                                     INFDS(FID002_   )

     D PTL__           S             50    DIM(1) CTDATA PERRCD(1)
     D RTLLA__         S             11    DIM(180)

     D*+FLDDCL Field declarations


     D clid            S              3A
     D zip_hld         S              9A
     D zip5            S              5A
     D zip_hld2        S              9A
     D zip52           S              5A
     D shortname       S              1A
     D dealer_nums     S          32000A   varying
     D query           S          32000A   varying

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


     D TASKRAN__       S              1    INZ(*OFF)


     D H__1            S             80    PERRCD(1) CTDATA DIM(86          )


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

     D output0...
     D                 PR
     D ks_box0...
     D                 PR
     D ne_box0...
     D                 PR
     D co_box0...
     D                 PR
     D ok_box0...
     D                 PR
     D tx_box0...
     D                 PR

     D pdmod           S                   LIKE(pdloc         )

      /COPY *LIBL/PW_CSRC,SUBPROT204
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

     C     DL002_        KLIST
     C                   KFLD                    pdno
     C     DL001_        KLIST
     C                   KFLD                    pdno
     C                   ENDSR


      * Subprocedures follow:
      *--------------------------------------------------------------------------------------------*
      * main__ - Contains the main function source code from the PML
      *--------------------------------------------------------------------------------------------*
     P main__          B
     D main__          PI

      /free
       // PML Start ----------------------------------
       clid = '108';
       ExecCmd2_('ADDLIBLE QGPL':%len(%trimr('ADDLIBLE QGPL')));
       ExecCmd2_( 'KWSET ' + %trim(clid):%len(%trimr( 'KWSET ' + %trim(clid))));
       Open_File_('*ALL': '*FIRST':  'Y');
       if (task__ = 'DEFAULT');
        taskran__ = *ON;
        output0();
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
     P* output0...                  - User defined function
     P*---------------------------------------------------------------------
     P output0...
     P                 B
     D output0...
     D                 PI




      /free
       AM001_ = CV_BYKEY;
       CHAIN(NE) DL001_ RKWPDBASE;
       RS001_ = RcdSts2_('GETRCD': %error: %found: %eof);
       outweb_(%subst(%str(%addr(H__1(1))):1:4170));
       ks_box0();
       outweb_(%subst(%str(%addr(H__1(53))):11:136));
       ne_box0();
       outweb_(%subst(%str(%addr(H__1(54))):67:136));
       co_box0();
       outweb_(%subst(%str(%addr(H__1(56))):43:201));
       ok_box0();
       outweb_(%subst(%str(%addr(H__1(59))):4:133));
       tx_box0();
       outweb_(%subst(%str(%addr(H__1(60))):57:2059));

      /end-free
     c     *PSSR         begsr
     c                   endsr
     P                 E


     P*---------------------------------------------------------------------
     P* ks_box0...                  - User defined function
     P*---------------------------------------------------------------------
     P ks_box0...
     P                 B
     D ks_box0...
     D                 PI




      /free
       OutWeb_('<select class="form-control office-sel" type="select-one" sty-
       le="width: 100%;">');
       OutWeb_('<option value="">Select a Location....</option>');
       dealer_nums = '''996'', ''997'', ''1000'', ''1001'', ''1007'', ''1009-
       '', ''1010'', ''1012'', ''1013'', ''1014'', ''1017'', ''1018-
       '', ''1020'', ''1021'', ''1022'', ''1023'', ''1027'', ''1028'', ''1029-
       '', ''1034'', ''1035'', ''1036'',''2997''';
       query = 'select PDNO, PDLOC, PDNAM1, PDNAM2, PDADR1, PDCITY, PDST, PDZ-
       IP from KWPDLOC where PDLOC <> 0 AND PDNO IN (' + dealer_nums + ') ORD-
       ER BY PDADR1 ASC';
      /end-free
     C/Exec SQL
     C+            Declare DEALERS Scroll Cursor
     C+            For DEALERS
     C/End-Exec
     C/Exec SQL
     C+            Prepare DEALERS
     C+            From :query
     C/End-Exec
      /free
       if (sqlcod >= 0);
      /end-free
     C/Exec SQL
     C+            Open DEALERS
     C/End-Exec
      /free
       endif;
      /end-free
     C/Exec SQL
     C+  FETCH NEXT FROM DEALERS INTO :PDNO, :PDLOC, :PDNAM1, :PDNAM2, :PDADR1,
     C+ :PDCITY, :PDST, :PDZIP
     C/End-Exec
      /free
       dow ((((sqlcod <> 100)) and ((sqlcod >= 0))));
       shortname = %subst(pdnam2:1:1);
       if (shortname <> 'X');
        zip_hld2 = %trim(%editc(PDZIP:'P'));
        zip52 = %subst(zip_hld2:1:5);
        pdadr1 = %trim(pdadr1);
        OutWeb_(%trimr( '<option value="' + %trim(%editc(PDLOC:'P')) + '-' +
       %trim(%editc(PDMOD:'P')) + '" data-dealer="' + %trim(pdno) + '">' +
       %trim(pdadr1) + ' ' + %trim(pdcity) + ', ' + pdst + ' ' + zip52 + '</o-
       ption>'));
        PDMOD = PDMOD + 1;
       else;
       endif;
      /end-free
     C/Exec SQL
     C+  FETCH NEXT FROM DEALERS INTO :PDNO, :PDLOC, :PDNAM1, :PDNAM2, :PDADR1,
     C+ :PDCITY, :PDST, :PDZIP
     C/End-Exec
      /free
       enddo;
      /end-free
     C/Exec SQL
     C+  CLOSE DEALERS
     C/End-Exec
      /free
       OutWeb_('</select>');
      /end-free
     c     *PSSR         begsr
     c                   endsr
     P                 E


     P*---------------------------------------------------------------------
     P* ne_box0...                  - User defined function
     P*---------------------------------------------------------------------
     P ne_box0...
     P                 B
     D ne_box0...
     D                 PI




      /free
       OutWeb_('<select class="form-control office-sel" type="select-one" sty-
       le="width: 100%;">');
       OutWeb_('<option value="">Select a Location....</option>');
       dealer_nums = '''1002'', ''1005'', ''1006'', ''1025'', ''1026'', ''103-
       0'', ''1031'', ''1032'', ''1033'',''1979''';
       query = 'select PDNO, PDLOC, PDNAM1, PDNAM2, PDADR1, PDCITY, PDST, PDZ-
       IP from KWPDLOC where PDLOC <> 0 AND PDNO IN (' + dealer_nums + ') ORD-
       ER BY PDADR1 ASC';
      /end-free
     C/Exec SQL
     C+            Declare DEALERS2 Scroll Cursor
     C+            For DEALERS2
     C/End-Exec
     C/Exec SQL
     C+            Prepare DEALERS2
     C+            From :query
     C/End-Exec
      /free
       if (sqlcod >= 0);
      /end-free
     C/Exec SQL
     C+            Open DEALERS2
     C/End-Exec
      /free
       endif;
      /end-free
     C/Exec SQL
     C+  FETCH NEXT FROM DEALERS2 INTO :PDNO, :PDLOC, :PDNAM1, :PDNAM2, :PDADR1,
     C+  :PDCITY, :PDST, :PDZIP
     C/End-Exec
      /free
       dow ((((sqlcod <> 100)) and ((sqlcod >= 0))));
       shortname = %subst(pdnam2:1:1);
       if (shortname <> 'X');
        zip_hld2 = %trim(%editc(PDZIP:'P'));
        zip52 = %subst(zip_hld2:1:5);
        pdadr1 = %trim(pdadr1);
        OutWeb_(%trimr( '<option value="' + %trim(%editc(PDLOC:'P')) + '-' +
       %trim(%editc(PDMOD:'P')) + '" data-dealer="' + %trim(pdno) + '">' +
       %trim(pdadr1) + ' ' + %trim(pdcity) + ', ' + pdst + ' ' + zip52 + '</o-
       ption>'));
        PDMOD = PDMOD + 1;
       else;
       endif;
      /end-free
     C/Exec SQL
     C+  FETCH NEXT FROM DEALERS2 INTO :PDNO, :PDLOC, :PDNAM1, :PDNAM2, :PDADR1,
     C+  :PDCITY, :PDST, :PDZIP
     C/End-Exec
      /free
       enddo;
      /end-free
     C/Exec SQL
     C+  CLOSE DEALERS2
     C/End-Exec
      /free
       OutWeb_('</select>');
      /end-free
     c     *PSSR         begsr
     c                   endsr
     P                 E


     P*---------------------------------------------------------------------
     P* co_box0...                  - User defined function
     P*---------------------------------------------------------------------
     P co_box0...
     P                 B
     D co_box0...
     D                 PI




      /free
       OutWeb_('<select class="form-control office-sel" type="select-one" sty-
       le="width: 100%;">');
       OutWeb_('<option value="">Select a Location....</option>');
       dealer_nums = '''998'', ''999'', ''1003'', ''1004'', ''1008'', ''1015-
       '', ''1016'', ''1024''';
       query = 'select PDNO, PDLOC, PDNAM1, PDNAM2, PDADR1, PDCITY, PDST, PDZ-
       IP from KWPDLOC where PDLOC <> 0 AND PDNO IN (' + dealer_nums + ') ORD-
       ER BY PDADR1 ASC';
      /end-free
     C/Exec SQL
     C+            Declare DEALERS3 Scroll Cursor
     C+            For DEALERS3
     C/End-Exec
     C/Exec SQL
     C+            Prepare DEALERS3
     C+            From :query
     C/End-Exec
      /free
       if (sqlcod >= 0);
      /end-free
     C/Exec SQL
     C+            Open DEALERS3
     C/End-Exec
      /free
       endif;
      /end-free
     C/Exec SQL
     C+  FETCH NEXT FROM DEALERS3 INTO :PDNO, :PDLOC, :PDNAM1, :PDNAM2, :PDADR1,
     C+  :PDCITY, :PDST, :PDZIP
     C/End-Exec
      /free
       dow ((((sqlcod <> 100)) and ((sqlcod >= 0))));
       shortname = %subst(pdnam2:1:1);
       if (shortname <> 'X');
        zip_hld2 = %trim(%editc(PDZIP:'P'));
        zip52 = %subst(zip_hld2:1:5);
        pdadr1 = %trim(pdadr1);
        OutWeb_(%trimr( '<option value="' + %trim(%editc(PDLOC:'P')) + '-' +
       %trim(%editc(PDMOD:'P')) + '" data-dealer="' + %trim(pdno) + '">' +
       %trim(pdadr1) + ' ' + %trim(pdcity) + ', ' + pdst + ' ' + zip52 + '</o-
       ption>'));
        PDMOD = PDMOD + 1;
       else;
       endif;
      /end-free
     C/Exec SQL
     C+  FETCH NEXT FROM DEALERS3 INTO :PDNO, :PDLOC, :PDNAM1, :PDNAM2, :PDADR1,
     C+  :PDCITY, :PDST, :PDZIP
     C/End-Exec
      /free
       enddo;
      /end-free
     C/Exec SQL
     C+  CLOSE DEALERS3
     C/End-Exec
      /free
       OutWeb_('</select>');
      /end-free
     c     *PSSR         begsr
     c                   endsr
     P                 E


     P*---------------------------------------------------------------------
     P* ok_box0...                  - User defined function
     P*---------------------------------------------------------------------
     P ok_box0...
     P                 B
     D ok_box0...
     D                 PI




      /free
       OutWeb_('<select class="form-control office-sel" type="select-one" sty-
       le="width: 100%;">');
       OutWeb_('<option value="">Select a Location....</option>');
       dealer_nums = '''1104''';
       query = 'select PDNO, PDLOC, PDNAM1, PDNAM2, PDADR1, PDCITY, PDST, PDZ-
       IP from KWPDLOC where PDLOC <> 0 AND PDNO IN (' + dealer_nums + ') ORD-
       ER BY PDADR1 ASC';
      /end-free
     C/Exec SQL
     C+            Declare DEALERS4 Scroll Cursor
     C+            For DEALERS4
     C/End-Exec
     C/Exec SQL
     C+            Prepare DEALERS4
     C+            From :query
     C/End-Exec
      /free
       if (sqlcod >= 0);
      /end-free
     C/Exec SQL
     C+            Open DEALERS4
     C/End-Exec
      /free
       endif;
      /end-free
     C/Exec SQL
     C+  FETCH NEXT FROM DEALERS4 INTO :PDNO, :PDLOC, :PDNAM1, :PDNAM2, :PDADR1,
     C+  :PDCITY, :PDST, :PDZIP
     C/End-Exec
      /free
       dow ((((sqlcod <> 100)) and ((sqlcod >= 0))));
       shortname = %subst(pdnam2:1:1);
       if (shortname <> 'X');
        zip_hld2 = %trim(%editc(PDZIP:'P'));
        zip52 = %subst(zip_hld2:1:5);
        pdadr1 = %trim(pdadr1);
        OutWeb_(%trimr( '<option value="' + %trim(%editc(PDLOC:'P')) + '-' +
       %trim(%editc(PDMOD:'P')) + '" data-dealer="' + %trim(pdno) + '">' +
       %trim(pdadr1) + ' ' + %trim(pdcity) + ', ' + pdst + ' ' + zip52 + '</o-
       ption>'));
        PDMOD = PDMOD + 1;
       else;
       endif;
      /end-free
     C/Exec SQL
     C+  FETCH NEXT FROM DEALERS4 INTO :PDNO, :PDLOC, :PDNAM1, :PDNAM2, :PDADR1,
     C+  :PDCITY, :PDST, :PDZIP
     C/End-Exec
      /free
       enddo;
      /end-free
     C/Exec SQL
     C+  CLOSE DEALERS4
     C/End-Exec
      /free
       OutWeb_('</select>');
      /end-free
     c     *PSSR         begsr
     c                   endsr
     P                 E


     P*---------------------------------------------------------------------
     P* tx_box0...                  - User defined function
     P*---------------------------------------------------------------------
     P tx_box0...
     P                 B
     D tx_box0...
     D                 PI




      /free
       OutWeb_('<select class="form-control office-sel" type="select-one" sty-
       le="width: 100%;">');
       OutWeb_('<option value="">Select a Location....</option>');
       dealer_nums = '''1573''';
       query = 'select PDNO, PDLOC, PDNAM1, PDNAM2, PDADR1, PDCITY, PDST, PDZ-
       IP from KWPDLOC where PDLOC <> 0 AND PDNO IN (' + dealer_nums + ') ORD-
       ER BY PDADR1 ASC';
      /end-free
     C/Exec SQL
     C+            Declare DEALERS5 Scroll Cursor
     C+            For DEALERS5
     C/End-Exec
     C/Exec SQL
     C+            Prepare DEALERS5
     C+            From :query
     C/End-Exec
      /free
       if (sqlcod >= 0);
      /end-free
     C/Exec SQL
     C+            Open DEALERS5
     C/End-Exec
      /free
       endif;
      /end-free
     C/Exec SQL
     C+  FETCH NEXT FROM DEALERS5 INTO :PDNO, :PDLOC, :PDNAM1, :PDNAM2, :PDADR1,
     C+  :PDCITY, :PDST, :PDZIP
     C/End-Exec
      /free
       dow ((((sqlcod <> 100)) and ((sqlcod >= 0))));
       shortname = %subst(pdnam2:1:1);
       if (shortname <> 'X');
        zip_hld2 = %trim(%editc(PDZIP:'P'));
        zip52 = %subst(zip_hld2:1:5);
        pdadr1 = %trim(pdadr1);
        OutWeb_(%trimr( '<option value="' + %trim(%editc(PDLOC:'P')) + '-' +
       %trim(%editc(PDMOD:'P')) + '" data-dealer="' + %trim(pdno) + '">' +
       %trim(pdadr1) + ' ' + %trim(pdcity) + ', ' + pdst + ' ' + zip52 + '</o-
       ption>'));
        PDMOD = PDMOD + 1;
       else;
       endif;
      /end-free
     C/Exec SQL
     C+  FETCH NEXT FROM DEALERS5 INTO :PDNO, :PDLOC, :PDNAM1, :PDNAM2, :PDADR1,
     C+  :PDCITY, :PDST, :PDZIP
     C/End-Exec
      /free
       enddo;
      /end-free
     C/Exec SQL
     C+  CLOSE DEALERS5
     C/End-Exec
      /free
       OutWeb_('</select>');
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
       rtlla__(1) = 'KWDB108';

       // Set the runtime library for support object references.
       // Also, determine job type
       jobtype__ = SetRtLib_('XL_WEBSPT');

       // Register the condition handler. Use a pointer to the
       // pgm status data structure
       RegCndHdlr_(CndHdlrPtr:  PSPtr__: *omit);

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
       if   ((file__='KWPDBASE' or file__='*ALL') and NOT %OPEN(KWPDBASE));
        if (mbr__ <> '*FIRST');
         ovrdbf_(ovrflag__:'KWPDBASE':'KWPDBASE' : '*LIBL' : mbr__);
        elseif ('KWPDBASE' <> 'KWPDBASE');
         ovrdbf_(ovrflag__:'KWPDBASE':'KWPDBASE' : '*LIBL');
        endif;
        if    erropen__ = 'Y';
         OPEN(E) KWPDBASE;                //    KWPDBASE
         if        %error;
          return %error;
         endif;
        else;
         OPEN KWPDBASE;                //    KWPDBASE
        endif;
       endif;
       if   ((file__='KWPDLOC' or file__='*ALL') and NOT %OPEN(KWPDLOC));
        if (mbr__ <> '*FIRST');
         ovrdbf_(ovrflag__:'KWPDLOC':'KWPDLOC' : '*LIBL' : mbr__);
        elseif ('KWPDLOC' <> 'KWPDLOC');
         ovrdbf_(ovrflag__:'KWPDLOC':'KWPDLOC' : '*LIBL');
        endif;
        if    erropen__ = 'Y';
         OPEN(E) KWPDLOC;                //    KWPDLOC
         if        %error;
          return %error;
         endif;
        else;
         OPEN KWPDLOC;                //    KWPDLOC
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
The Tire Store landing page
**CTDATA H__1        page                             6835
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.or
g/TR/xhtml1/DTD/xhtml1-transitional.dtd" >
<html>
<head>
	<meta name="generator"
 content="Bluefish 2.0.2" />
	<meta http-equiv="Pragma" content="no-cache" />
	<
title>
		The Tire Store Credit Application
	</title>
	<!-- standard stack.  thes
e filese should be included in every program -->
	<link rel="stylesheet" type="t
ext/css" href="/k_com/bsLatest.css" ><!-- bootstrap -->
	<link rel="stylesheet"
type="text/css" href="/k_com/bs-rLatest.css" ><!-- bootstrap responsive file -->

	<link rel="stylesheet" type="text/css" href="/k_com/bsCorrect.css" ><!-- compa
ss technologies modification file -->
	<link rel="stylesheet" type="text/css" hr
ef="/k_com/faLatest.css" ><!-- font awesome -->
	<link rel="stylesheet" type="te
xt/css" href="//ajax.googleapis.com/ajax/libs/jqueryui/1.10.3/themes/smoothness/
jquery-ui.css" >
	<script type="text/javascript" src="/k_com/jqLatest.js" ></scr
ipt><!-- jquery -->
	<script src="//ajax.googleapis.com/ajax/libs/jqueryui/1.10.
3/jquery-ui.min.js" ></script><!--datepicker-->
	<script type="text/javascript"
src="/k_com/bsLatest.js" ></script><!-- bootstrap jquery file -->
	<style type="
text/css">
		body{
			padding: 0px 20px;	
		}
		.sectNav{
			line-height: 40px;	

		}
		.ul-std{
			font-size: 16px;
			margin-bottom: 40px;
		}
		.ul-std li{
		
	margin-bottom: 5px;		
		}
		.emph{
			font-size: 18px;	
		}
		.emph-l{
			font-
size: 16px;	
		}
		.text-red{
			color: #f02a3b;
		}
		.text-blue{
			color: #14
2140;
		}
	</style>
	<script type="text/javascript">
	$(document).ready(function
(){
		
		$('.office-sel').change(function(){
			$('.office-sel').not(this).each(
function() {
				$(this).prop('selectedIndex', 0);
			});
			//get variables fro
m select element
			var sel = $(this).find('option:selected');
       		var dlr
= sel.data('dealer'); 
       		var off = $(this).val();
			
			//set .dlr field
, which is used when the "go" button is clicked
			$('.dlr').val(dlr);
			
			//
if this is a multi entity dealer, check to see if there is a dash (-) 
			//in t
he value retrieved (returns -1 if there is no dash (-))
			offsub = off.search('
-');
			
			//check if this is, or is not, an additional entity, and set office
field accordingly
			if(offsub >= 0){
				//is sub entity
				offnew = off.subst
r(0,Number(offsub));
				$('.office').val(offnew);	
			} else {
				//main entit
y
				$('.office').val(off);
			}
		});
		
		$(document).on('click','.go',functi
on(){
			var dlr = $('.dlr').val();
			var office = $('.office').val();
			if(of
fice == "" || dlr == ""){
				alert("Please select an office before moving on to
 the application.");
			} else {
				location.href="https://sv1.americanfirstfin
ance.com:8158/kwik/AFF_APP.PGM?fromweb=Y&clid=108&wdlr="+dlr+"&office_dlr="+dlr+
"&office_loc="+office+"&agent=WebLanding";
			}	
		});
	});
	</script>
</head>


 
<body>
	<div id="wrapper" >
		<div class="container-fluid">
			
			<div class
="row-fluid">
				<div class="span8">
			
					<div class="page-header" style="m
argin-bottom: 15px;">
						<table style="width: 100%">
							<tr>
								<td
style="width: 210px;"><img src="/k_dealer/i/tts_logo.jpg"></td>
								<td>
			
						<h2>
										The Tire Store<br>
										<small>Applying for financing
with American First Finance</small>
									</h2>
								</td>
							</tr>
		
				</table>
					</div>
					
					<div class="row-fluid">
						<div class="sp
an12">
							<p>American First Finance offers high approval amounts, no money d
own options, and 101 days Same as Cash.  Credit is not required for approval.</p
>

							<p>Simply select the store location you would like to shop at and clic
k Start Application to begin.</p>
						</div>
					</div>
				
					<div class=
"row-fluid">
						<div class="span12 sect">
				            <div class="sectNav
">
				            	Please choose a location to apply with <strong>American Firs
t Finance</strong>
				            </div>
				            <div class="sectInner"
 >
				            	
				            	<div class="row-fluid">
				            		
<div class="span3">
										<label><strong>Kansas Locations:</strong></label>

										
				            		</div>
				            		<div class="span3">
						
				<label><strong>Nebraska Locations:</strong></label>
										
				
   		</div>
				            		<div class="span3">
										<label><strong>Color
ado Locations:</strong></label>
										
				            		</div>
				
    	</div>
				            	<div class="row-fluid">
				            		<div clas
s="span3">
										<label><strong>Oklahoma Locations:</strong></label>
							
			
				            		</div>
				            		<div class="span3">
										<la
bel><strong>Texas Locations:</strong></label>
										
				            		</div
>
				            		<input type="hidden" value="" class="dlr">
				            	
	<input type="hidden" value="" class="office">
				            	</div>
				
       </div>
				        </div>
				    </div>
				    
				    <div class="row
-fluid">
						<div class="span12">
				        	<button type="button" class="bt
n go">Start Application</button>
				        </div>
				    </div>
		    	
		
 	</div>
		    	<div class="span4">
		    		<div class="page-header" style="marg
in-bottom: 15px;">
						<img src="/k_dealer/i/afflogo.png">
					</div>
					
	
				<div class="row-fluid">
						<div class="span12">
							<p><span class="em
ph">Take your merchandise home for <strong>$0 down</strong> with:</span></p>  
	
						
							<ul class="ul-std"><li>Terms up to 24 months</li><li>High approval
 amounts</li><li>101 days same as cash</li></ul> 
							
							<p><span class=
"emph">Make equal payments that fit your income schedule</span></p>  
							
		
					<ul class="ul-std" style="margin-bottom: 20px;"><li>Weekly Payments Availab
le</li><li>Bi-Weekly Payments Available</li><li>Monthly Payments Available</li><
li>Semi-Monthly Payments Available</li></ul> 
							
							<p style="margin-to
p: 30px;">
							<span class="emph-l"><strong>Have Questions?</strong></span><b
r>
							Get more info from American First Finance at:
							</p>
							
				
			<p><span class="emph-l">
							1-855-721-1188<br>
							info@americanfirstf
inance.com<br>
							<a href="https://www.americanfirstfinance.com/contact-us.h
tml">www.americanfirstfinance.com</a>
							</span>
							</p>
							
							
<p style="margin-top: 30px;">
							<span class="emph-l"><strong>Already have a
n account?</strong></span><br>
							Manage your American First Finance account
 at:
							</p>
							
							<p><span class="emph-l">
							<a href="https:/
/sv1.americanfirstfinance.com:8158/k_dealer/f/AFFkv.html">Customer Login</a>
			
				</span>
							</p>
							 
						</div>
					</div>
		    	</div>
		    </
div>
		</div>
	    
	</div>
</body>

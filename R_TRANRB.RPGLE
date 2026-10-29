     H/TITLE  WebSmart Report
      * ProGen WebSmart Revision 9484
      * File overrides for compile command
      *__OV OVRDBF KWLBASE    KWLBASE
      *__OV OVRDBF KWCDATA    KWCDATA
      *__OV OVRDBF KWPPBASE   KWPPBASE
      *__OV OVRDBF KWLDATA    KWLDATA
      *__OV OVRDBF KWSHGRP    KWSHGRP
      *__OV OVRDBF KWSHGRPR   KWSHGRPR
      *__OV OVRDBF KWSHIST    KWSHIST
      *__OV OVRDBF KWHLOAN    KWHLOAN
      *__OV OVRDBF KWHBASE    KWHBASE
      *__OV OVRDBF KWPLBASE   KWPLBASE
      *__OV OVRDBF KWPDBASE   KWPDBASE
      *__OV OVRDBF KWPRULE    KWPRULE
      *__OV OVRDBF KWHRTO     KWHRTO
      *__   Following values are used to create the server program
      *__RO Pgm  lib KWWEB      Pgm  R_TRANRB
      *__AG          WEBSMART
      *__CL          *OBJLIBNAM
      *__SQ
      *__BD ECRTBND115
      *===============================================================*
      * Path:   r_tran.pdw
      * System: REGGIEBRITT25F9
      * Project:Kwik-Loan
      * Set:    Development
      * User:   Administrator
      * Date Last Generated:   2014-06-19   14:18:42
      * Last Generated CRC: D6B01B00 249B7A79 7F1FABB7 5E044647
      *===============================================================*
      */CPY *LIBL/PW_CSRC CPYRIGHT
      * File specifications
     FKWLBASE   IF   E           K DISK    USROPN
     F                                     INFDS(FID001_   )
     FKWCDATA   IF   E           K DISK    USROPN
     F                                     INFDS(FID002_   )
     FKWPPBASE  IF   E           K DISK    USROPN
     F                                     INFDS(FID003_   )
     FKWLDATA   IF   E           K DISK    USROPN
     F                                     INFDS(FID004_   )
     FKWSHGRP   IF   E           K DISK    USROPN
     F                                     INFDS(FID005_   )
     FKWSHGRPR  IF   E           K DISK    USROPN
     F                                     INFDS(FID006_   )
     FKWSHIST   IF   E           K DISK    USROPN
     F                                     INFDS(FID007_   )
     FKWHLOAN   IF   E           K DISK    USROPN
     F                                     INFDS(FID008_   )
     FKWHBASE   IF   E           K DISK    USROPN
     F                                     INFDS(FID009_   )
     FKWPLBASE  IF   E           K DISK    USROPN
     F                                     INFDS(FID010_   )
     FKWPDBASE  IF   E           K DISK    USROPN
     F                                     INFDS(FID011_   )
     FKWPRULE   IF   E           K DISK    USROPN
     F                                     INFDS(FID012_   )
     FKWHRTO    IF   E           K DISK    USROPN
     F                                     INFDS(FID013_   )

     D PTL__           S             50    DIM(1) CTDATA PERRCD(1)
     D RTLLA__         S             11    DIM(180)

     D*+FLDDCL Field declarations

     Duserdata         DS                  INZ
     D client                         5A
     D userid                        32A
     D location                       5A
     Dnewrpt_          DS                  INZ
     D ww_orddir                      1A
     D ww_ordby                      64A
     D ww_pagea                       5A
     D ww_floca                      10A
     D ww_ftranta                     5A
     D ww_fdate                      10A
     D ww_tdate                      10A

     D spreadsheet     S              1A
     D print           S              1A
     D selstring       S           3200A   varying
     D selstring2      S           3200A   varying
     D rrn             S              9P 0
     D nx              S              5P 0
     D pagenum         S              5P 0
     D listsize        S             13P 0
     D rnd             S              5P 0
     D total           S              9P 2
     D subttl          S              9P 2
     D totalcrd        S              9P 2
     D totaldbt        S              9P 2
     D ni              S              1B 0
     D whrclause       S           1000A
     D whrlink         S              7A
     D x               S              5P 0
     D tmploca         S              5A
     D artncod         S              5A
     D p_ztype         S             15A
     D boxname         S             10A
     D boxid           S             10A
     D boxselect       S             25A
     D boxtype         S             10A
     D jvalidation     S             30A
     D ww_fdlr         S             25A
     D isodate         S               D   DATFMT(*ISO      )
     D inputdate       S             10A
     D security        S              1A

     D RS001_          S              1A
     D AM001_          S              1A
     D RS002_          S              1A
     D AM002_          S              1A
     D RS003_          S              1A
     D AM003_          S              1A
     D RS004_          S              1A
     D AM004_          S              1A
     D RS005_          S              1A
     D AM005_          S              1A
     D RS006_          S              1A
     D AM006_          S              1A
     D RS007_          S              1A
     D AM007_          S              1A
     D RS008_          S              1A
     D AM008_          S              1A
     D RS009_          S              1A
     D AM009_          S              1A
     D RS010_          S              1A
     D AM010_          S              1A
     D RS011_          S              1A
     D AM011_          S              1A
     D RS012_          S              1A
     D AM012_          S              1A
     D RS013_          S              1A
     D AM013_          S              1A


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
     D prmreq__        S              5A
     D pgsizelm__      S              9P 0 IMPORT('PGSIZELM')

     D Up__            C                   'ABCDEFGHIJKLMNOPQRSTUVWXYZ'
     D Lo__            C                   'abcdefghijklmnopqrstuvwxyz'

     D arclr__         S              8A
     D rwcolor1__      S             32A   INZ('altcol1')
     D rwcolor2__      S             32A   INZ('altcol2')


     D TASKRAN__       S              1    INZ(*OFF)


     D H__1            S              1    PERRCD(80) CTDATA DIM(5934     )

     D H__2            S              1    PERRCD(80) CTDATA DIM(285      )

     D H__3            S              1    PERRCD(80) CTDATA DIM(1506     )

     D H__4            S              1    PERRCD(80) CTDATA DIM(66       )

     D H__5            S              1    PERRCD(80) CTDATA DIM(527      )

     D H__6            S              1    PERRCD(80) CTDATA DIM(195      )

     D H__7            S              1    PERRCD(80) CTDATA DIM(3204     )

     D H__8            S              1    PERRCD(80) CTDATA DIM(856      )

     D H__9            S              1    PERRCD(80) CTDATA DIM(383      )

     D H__10           S              1    PERRCD(80) CTDATA DIM(958      )

     D H__11           S              1    PERRCD(80) CTDATA DIM(153      )

     D H__12           S              1    PERRCD(80) CTDATA DIM(110      )


     D* File info DS for each file
     D FID001_         DS
     D  RR_001_              397    400B 0
     D FID002_         DS
     D  RR_002_              397    400B 0
     D FID003_         DS
     D  RR_003_              397    400B 0
     D FID004_         DS
     D  RR_004_              397    400B 0
     D FID005_         DS
     D  RR_005_              397    400B 0
     D FID006_         DS
     D  RR_006_              397    400B 0
     D FID007_         DS
     D  RR_007_              397    400B 0
     D FID008_         DS
     D  RR_008_              397    400B 0
     D FID009_         DS
     D  RR_009_              397    400B 0
     D FID010_         DS
     D  RR_010_              397    400B 0
     D FID011_         DS
     D  RR_011_              397    400B 0
     D FID012_         DS
     D  RR_012_              397    400B 0
     D FID013_         DS
     D  RR_013_              397    400B 0


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

     D display0        PR
     D bldpage0        PR
     D mimetype__      S           4096A   import
     D bldselstr0      PR
     D fetchrel0       PR
     D fetchnext0      PR
     D filter0         PR
     D locbox0         PR
     D htcbox0         PR
     D dlrbox0         PR
     D PipeLen__       S             10p 0 IMPORT
     D QPGMNAM__       S             20A
     D SmurfChk__      S              1A   INZ(*ON)
     D Smurf_ID__      S             64A   IMPORT
     D Smurf_Rw__      S              9B 0 IMPORT

     D tmploc          S                   LIKE(hbr           )
     D tmplnam         S                   LIKE(plnam1        )
     D prevpage        S                   LIKE(pagenum       )
     D nextpage        S                   LIKE(pagenum       )
     D isnextpage      S                   LIKE(SQLCOD        )
     D ww_floc         S                   LIKE(hbr           )
     D ww_ftrant       S                   LIKE(htc           )
     D renttoown       S                   LIKE(pruleyesno    )

      /COPY *LIBL/PW_CSRC,SUBPROT115
      /COPY *LIBL/PW_CSRC,GDPROTO
      /COPY *LIBL/PW_CSRC,JPROTO001

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

     C     DL011_        KLIST
     C                   KFLD                    pdno
     C     DL012_        KLIST
     C                   KFLD                    pruletype
     C                   KFLD                    prulename
     C     DL013_        KLIST
     C                   KFLD                    hdate
     C                   KFLD                    hseq
     C                   ENDSR


      * Subprocedures follow:
      *--------------------------------------------------------------------------------------------*
      * main__ - Contains the main function source code from the PML
      *--------------------------------------------------------------------------------------------*
     P main__          B
     D main__          PI

      /free
       // PML Start ----------------------------------

      /end-free
     C/Exec SQL
     C+  SET OPTION DATFMT = *ISO
     C/End-Exec
      /free
       PGSIZELM__ = 999999999;
       MCUST = %dec(aton_( GetSmurf2_('MCUST'):9:0):9:0);
       MACCT = %dec(aton_( GetSmurf2_('MACCT'):5:0):5:0);
       listsize = 20;
       rnd = GenRand_(99999);
       spreadsheet = getparm2_('spreadsheet':'*OPT');
       print = getparm2_('print':'*OPT');
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
       ExecCmd2_('ADDLIBLE QGPL':%len(%trimr('ADDLIBLE QGPL')));
       ExecCmd2_( 'KWSET ' + %trim(client):%len(%trimr( 'KWSET ' + %trim(
       client))));
       Open_File_('*ALL': '*FIRST':  'Y');
       pruletype = 'SYSTEM';
       prulename = 'RENTTOOWN';
       AM012_ = CV_BYKEY;
       CHAIN(E) DL012_ RKWPRULE;
       RS012_ = RcdSts2_('GETRCD': %error: %found: %eof);
       if (RS012_ = '1');
        renttoown = pruleyesno;
       endif;
       security = kw_security(userid:'R_TRAN.PGM');
       if (security = '0');
        ExecCmd2_('CHGLIBL LIBL(QTEMP QGPL)':%len(%trimr('CHGLIBL LIBL(QTEMP -
       QGPL)')));
        Redirect2_('dash.pgm':'*SAME');
        return ;
       endif;
       NEWRPT_ = getcookie2_('NEWRPT_tran');
       ww_ftrant = %dec(aton_(ww_ftranta:5:0):5:0);
       if (task__ = 'DEFAULT');
        taskran__ = *ON;
        display0();
       endif ;
       if (task__ = 'FILTER');
        taskran__ = *ON;
        filter0();
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
     P* display0                    - User defined function
     P*---------------------------------------------------------------------
     P display0        B
     D display0        PI




      /free
       ww_fdate = rplstr_(ww_fdate:%trim(''''):%trim('_'));
       ww_tdate = rplstr_(ww_tdate:%trim(''''):%trim('_'));
       pagenum = %dec(aton_( getparm2_('page':'*OPT'):5:0):5:0);
       if (pagenum = 0);
        pagenum = 1;
       endif;
       prevpage = pagenum - 1;
       nextpage = pagenum + 1;
       nx = ( ( ( pagenum - 1) * listsize) + 1);
       bldselstr0();
       ww_pagea = %trim(%editc(pagenum:'P'));
       ww_ftranta = %trim(%editc(ww_ftrant:'P'));
       Setcookie_('NEWRPT_tran':NEWRPT_:'*TEMP':'/':'*HOST':'0');
       bldpage0();
      /end-free
     c     *PSSR         begsr
     c                   endsr
     P display0        E


     P*---------------------------------------------------------------------
     P* bldpage0                    - User defined function
     P*---------------------------------------------------------------------
     P bldpage0        B
     D bldpage0        PI


     D tmpdta          S          32000A   varying
     D header          S            500A

     D sqlrescod       S                   LIKE(SQLCOD        )
     D y               S                   LIKE(x             )

      /free
       if (spreadsheet = 'Y');
        listsize = 1000000;
        header = 'application/vnd.ms-excel'+x'25'+' Content-Disposition: inli-
       ne; filename="' +
        %trim(PGMNAME__) + '.xls"';
      /end-free
     C                   EVAL      mimetype__ = header
      /free
        SetPipe_('*ON':1000000);
       endif;
       if (print = 'Y');
        listsize = 9999;
       endif;
       selstring = %trim(selstring) + ' FOR FETCH ONLY';
      /end-free
     C/Exec SQL
     C+            Declare MC Scroll Cursor
     C+            For MC
     C/End-Exec
     C/Exec SQL
     C+            Prepare MC
     C+            From :selstring
     C/End-Exec
      /free
       if (sqlcod >= 0);
      /end-free
     C/Exec SQL
     C+            Open MC
     C/End-Exec
      /free
       endif;
       if (spreadsheet = 'Y');
        WrtCTASeg_(H__7(1):1:3189);
        if (renttoown = 'Y');
         OutWeb_('<Cell ss:StyleID="s21"><Data ss:Type="String">RTO Tax</Data-
       ></Cell>');
        endif;
        WrtCTASeg_(H__7(1):3190:15);
       else;
        if (print = 'Y');
         WrtCTASeg_(H__10(1):1:958);
        else;
         WrtCTASeg_(H__1(1):1:3016);
         wfrtn__ = AfToPage_(QPGMNAM__);
         WrtCTASeg_(H__1(1):3017:278);
         locbox0();
         WrtCTASeg_(H__1(1):3295:225);
         htcbox0();
         WrtCTASeg_(H__1(1):3520:232);
         dlrbox0();
         WrtCTASeg_(H__1(1):3752:267);
         wfrtn__ = AfToPage_(WW_FDATE);
         WrtCTASeg_(H__1(1):4019:273);
         wfrtn__ = AfToPage_(WW_TDATE);
         WrtCTASeg_(H__1(1):4292:555);
         OutWeb_(%trimr( %trim(%editc( prevpage + 1:'P'))));
         WrtCTASeg_(H__1(1):4847:244);
         wfrtn__ = AfToPage_(QPGMNAM__);
         WrtCTASeg_(H__1(1):5091:6);
         AfToPage_(%trim(%editc(PREVPAGE:'X')));
         WrtCTASeg_(H__1(1):5097:5);
         AfToPage_(%trim(%editc(RND:'X')));
         WrtCTASeg_(H__1(1):5102:169);
         wfrtn__ = AfToPage_(QPGMNAM__);
         WrtCTASeg_(H__1(1):5271:6);
         AfToPage_(%trim(%editc(NEXTPAGE:'X')));
         WrtCTASeg_(H__1(1):5277:5);
         AfToPage_(%trim(%editc(RND:'X')));
         WrtCTASeg_(H__1(1):5282:653);
        endif;
       endif;
       x = 1;
       fetchrel0();
       tmpLoc = 0;
       tmploca = '';
       sqlrescod = SQLCOD;
       dow (((((sqlrescod <> 100)) and ((sqlrescod >= 0)) and ((x <=
       listsize)))));
       if (tmploca <> %trim(%editc(HBR:'P')));
        if (spreadsheet <> 'Y');
         WrtCTASeg_(H__5(1):1:79);
         wfrtn__ = AfToPage_(PLNAM1);
         WrtCTASeg_(H__5(1):80:438);
         if (renttoown = 'Y');
          OutWeb_('<th width="100"> + ');
          WrtCTASeg_(H__5(1):518:10);
         endif;
         subttl = 0;
        endif;
        if (shdesc = '');
         shdesc = 'N/A';
        endif;
        if ( %XLATE(lo__:up__:hdrcr) <> 'D');
         HAMT = HAMT * -1;
        endif;
        if (spreadsheet = 'Y');
         WrtCTASeg_(H__8(1):1:59);
         wfrtn__ = AfToPage_(SHDESC);
         WrtCTASeg_(H__8(1):60:70);
         wfrtn__ = AfToPage_(%char(HDATE: *USA));
         WrtCTASeg_(H__8(1):130:70);
         wfrtn__ = AfToPage_(ICNA1);
         WrtCTASeg_(H__8(1):200:70);
         wfrtn__ = AfToPage_(MFMTACCT);
         WrtCTASeg_(H__8(1):270:70);
         wfrtn__ = AfToPage_(MDLR);
         WrtCTASeg_(H__8(1):340:70);
         wfrtn__ = AfToPage_(HDRCR);
         WrtCTASeg_(H__8(1):410:70);
         wfrtn__ = AfToPage_(HAFECT);
         WrtCTASeg_(H__8(1):480:69);
         AfToPage_(%trim(%editc(HAMT:'N')));
         WrtCTASeg_(H__8(1):549:69);
         AfToPage_(%trim(%editc(HBAL:'N')));
         WrtCTASeg_(H__8(1):618:69);
         AfToPage_(%trim(%editc(HINT:'N')));
         WrtCTASeg_(H__8(1):687:69);
         AfToPage_(%trim(%editc(HLCHG:'N')));
         WrtCTASeg_(H__8(1):756:69);
         AfToPage_(%trim(%editc(HEXP1:'N')));
         WrtCTASeg_(H__8(1):825:18);
         if (renttoown = 'Y');
          OutWeb_(%trimr( '<Cell ss:StyleID="Currency"><Data ss:Type="Number"-
       > ' + %editc(hrtopmt:'N') + ' </Data></Cell>'));
         endif;
         WrtCTASeg_(H__8(1):843:14);
         if (PIPELEN__ >= 500000);
          SetPipe_('*OFF':1000000);
          tmpdta = GetPipeDta_(32000);
          dow ( %len(%trimr(tmpdta))> 0);
          tmpdta = tranapi_(tmpdta: '*CUSTOM': 37: 437);
          OutWeb_(tmpdta);
          tmpdta = GetPipeDta_(32000);
          enddo;
          SetPipe_('*ON':1000000);
         endif;
        else;
         Flip_Rc_();
         WrtCTASeg_(H__2(1):1:11);
         wfrtn__ = AfToPage_(ARCLR__);
         WrtCTASeg_(H__2(1):12:28);
         wfrtn__ = AfToPage_(SHDESC);
         WrtCTASeg_(H__2(1):40:26);
         wfrtn__ = AfToPage_(%char(HDATE: *USA));
         WrtCTASeg_(H__2(1):66:25);
         wfrtn__ = AfToPage_(ICNA1);
         WrtCTASeg_(H__2(1):91:25);
         wfrtn__ = AfToPage_(MFMTACCT);
         WrtCTASeg_(H__2(1):116:25);
         wfrtn__ = AfToPage_(MDLR);
         WrtCTASeg_(H__2(1):141:25);
         if (hdrcr = 'C');
          OutWeb_('Credit');
         else;
          OutWeb_('Debit');
         endif;
         WrtCTASeg_(H__2(1):166:25);
         wfrtn__ = AfToPage_(HAFECT);
         WrtCTASeg_(H__2(1):191:26);
         AfToPage_(%trim(%editc(HAMT:'J')));
         WrtCTASeg_(H__2(1):217:12);
         AfToPage_(%trim(%editc(HBAL:'J')));
         WrtCTASeg_(H__2(1):229:12);
         AfToPage_(%trim(%editc(HINT:'J')));
         WrtCTASeg_(H__2(1):241:12);
         AfToPage_(%trim(%editc(HLCHG:'J')));
         WrtCTASeg_(H__2(1):253:12);
         AfToPage_(%trim(%editc(HEXP1:'J')));
         WrtCTASeg_(H__2(1):265:8);
         if (renttoown = 'Y');
          OutWeb_(%trimr( '<td> ' + %editc(hrtopmt:'J') + ' </td>'));
         endif;
         WrtCTASeg_(H__2(1):273:13);
        endif;
        x = x + 1;
        tmpLoc = HBR;
        tmploca = %trim(%editc(HBR:'P'));
        tmplnam = plnam1;
        fetchnext0();
        sqlrescod = SQLCOD;
        isnextpage = SQLCOD;
        if (tmploca <> %trim(%editc(HBR:'P')));
         selstring2 = 'select SUM(HAMT)'+x'0D'+''+x'25'+'				FROM KWHLOAN 		'
       +x'0D'+''+x'25'+'			inner join KWHBASE on '+x'0D'+''+x'25'+'				KWHBAS-
       E.HDATE = KWHLOAN.HDATE and'+x'0D'+''+x'25'+'				KWHBASE.HSEQ = KWHLOA-
       N.HSEQ				'+x'0D'+''+x'25'+'			inner join KWLBASE on '+x'0D'+''+x'25'
       +'				KWLBASE.MCUST = KWHLOAN.HCUST and'+x'0D'+''+x'25'+'				KWLBASE.M-
       ACCT = KWHLOAN.HACCT' + ' ' + %trim(whrclause) + whrlink + 'HBR = ' +
       tmploca + 'and upper(HDRCR) = ''C''';
      /end-free
     C/Exec SQL
     C+            Declare crdtotal1 Scroll Cursor
     C+            For crdtotal1
     C/End-Exec
     C/Exec SQL
     C+            Prepare crdtotal1
     C+            From :selstring2
     C/End-Exec
      /free
         if (sqlcod >= 0);
      /end-free
     C/Exec SQL
     C+            Open crdtotal1
     C/End-Exec
      /free
         endif;
      /end-free
     C/Exec SQL
     C+  FETCH FIRST FROM crdtotal1 INTO :totalCRD
     C/End-Exec
      /free
      /end-free
     C/Exec SQL
     C+  close crdtotal1
     C/End-Exec
      /free
         selstring2 = 'select SUM(HAMT)'+x'0D'+''+x'25'+'				FROM KWHLOAN 		'
       +x'0D'+''+x'25'+'			inner join KWHBASE on '+x'0D'+''+x'25'+'				KWHBAS-
       E.HDATE = KWHLOAN.HDATE and'+x'0D'+''+x'25'+'				KWHBASE.HSEQ = KWHLOA-
       N.HSEQ				'+x'0D'+''+x'25'+'			inner join KWLBASE on '+x'0D'+''+x'25'
       +'				KWLBASE.MCUST = KWHLOAN.HCUST and'+x'0D'+''+x'25'+'				KWLBASE.M-
       ACCT = KWHLOAN.HACCT' + ' ' + %trim(whrclause) + whrlink + 'HBR = ' +
       tmploca + 'and upper(HDRCR) <> ''C''';
      /end-free
     C/Exec SQL
     C+            Declare dbttotal1 Scroll Cursor
     C+            For dbttotal1
     C/End-Exec
     C/Exec SQL
     C+            Prepare dbttotal1
     C+            From :selstring2
     C/End-Exec
      /free
         if (sqlcod >= 0);
      /end-free
     C/Exec SQL
     C+            Open dbttotal1
     C/End-Exec
      /free
         endif;
      /end-free
     C/Exec SQL
     C+  FETCH FIRST FROM dbttotal1 INTO :totalDBT
     C/End-Exec
      /free
      /end-free
     C/Exec SQL
     C+  close dbttotal1
     C/End-Exec
      /free
         subttl = totalcrd - totaldbt;
         if (spreadsheet <> 'Y');
          WrtCTASeg_(H__6(1):1:77);
          wfrtn__ = AfToPage_(TMPLNAM);
          WrtCTASeg_(H__6(1):78:36);
          AfToPage_(%trim(%editc(SUBTTL:'J')));
          WrtCTASeg_(H__6(1):114:82);
         endif;
        endif;
        enddo;
        if (tmploca = %trim(%editc(HBR:'P')));
         selstring2 = 'select SUM(HAMT)'+x'0D'+''+x'25'+'				FROM KWHLOAN 		'
       +x'0D'+''+x'25'+'			inner join KWHBASE on '+x'0D'+''+x'25'+'				KWHBAS-
       E.HDATE = KWHLOAN.HDATE and'+x'0D'+''+x'25'+'				KWHBASE.HSEQ = KWHLOA-
       N.HSEQ				'+x'0D'+''+x'25'+'			inner join KWLBASE on '+x'0D'+''+x'25'
       +'				KWLBASE.MCUST = KWHLOAN.HCUST and'+x'0D'+''+x'25'+'				KWLBASE.M-
       ACCT = KWHLOAN.HACCT' + ' ' + %trim(whrclause) + whrlink + 'HBR = ' +
       tmploca + 'and upper(HDRCR) = ''C''';
      /end-free
     C/Exec SQL
     C+            Declare crdtotal2 Scroll Cursor
     C+            For crdtotal2
     C/End-Exec
     C/Exec SQL
     C+            Prepare crdtotal2
     C+            From :selstring2
     C/End-Exec
      /free
         if (sqlcod >= 0);
      /end-free
     C/Exec SQL
     C+            Open crdtotal2
     C/End-Exec
      /free
         endif;
      /end-free
     C/Exec SQL
     C+  FETCH FIRST FROM crdtotal2 INTO :totalCRD
     C/End-Exec
      /free
      /end-free
     C/Exec SQL
     C+  close crdtotal2
     C/End-Exec
      /free
         selstring2 = 'select SUM(HAMT)'+x'0D'+''+x'25'+'				FROM KWHLOAN 		'
       +x'0D'+''+x'25'+'			inner join KWHBASE on '+x'0D'+''+x'25'+'				KWHBAS-
       E.HDATE = KWHLOAN.HDATE and'+x'0D'+''+x'25'+'				KWHBASE.HSEQ = KWHLOA-
       N.HSEQ				'+x'0D'+''+x'25'+'			inner join KWLBASE on '+x'0D'+''+x'25'
       +'				KWLBASE.MCUST = KWHLOAN.HCUST and'+x'0D'+''+x'25'+'				KWLBASE.M-
       ACCT = KWHLOAN.HACCT' + ' ' + %trim(whrclause) + whrlink + 'HBR = ' +
       tmploca + 'and upper(HDRCR) <> ''C''';
      /end-free
     C/Exec SQL
     C+            Declare dbttotal2 Scroll Cursor
     C+            For dbttotal2
     C/End-Exec
     C/Exec SQL
     C+            Prepare dbttotal2
     C+            From :selstring2
     C/End-Exec
      /free
         if (sqlcod >= 0);
      /end-free
     C/Exec SQL
     C+            Open dbttotal2
     C/End-Exec
      /free
         endif;
      /end-free
     C/Exec SQL
     C+  FETCH FIRST FROM dbttotal2 INTO :totalDBT
     C/End-Exec
      /free
      /end-free
     C/Exec SQL
     C+  close dbttotal2
     C/End-Exec
      /free
         subttl = totalcrd - totaldbt;
         if (spreadsheet <> 'Y');
          WrtCTASeg_(H__6(1):1:77);
          wfrtn__ = AfToPage_(TMPLNAM);
          WrtCTASeg_(H__6(1):78:36);
          AfToPage_(%trim(%editc(SUBTTL:'J')));
          WrtCTASeg_(H__6(1):114:82);
         endif;
        endif;
        if (spreadsheet = 'Y');
         WrtCTASeg_(H__9(1):1:383);
        else;
         if (print = 'Y');
          WrtCTASeg_(H__11(1):1:12);
          if (isnextpage <> 100);
           OutWeb_('List exceeded 10,000 record limit. Please use the filters-
        to reduce your results.');
          endif;
          WrtCTASeg_(H__11(1):13:141);
         else;
          WrtCTASeg_(H__3(1):1:99);
          wfrtn__ = AfToPage_(QPGMNAM__);
          WrtCTASeg_(H__3(1):100:6);
          AfToPage_(%trim(%editc(PREVPAGE:'X')));
          WrtCTASeg_(H__3(1):106:5);
          AfToPage_(%trim(%editc(RND:'X')));
          WrtCTASeg_(H__3(1):111:153);
          wfrtn__ = AfToPage_(QPGMNAM__);
          WrtCTASeg_(H__3(1):264:6);
          AfToPage_(%trim(%editc(NEXTPAGE:'X')));
          WrtCTASeg_(H__3(1):270:5);
          AfToPage_(%trim(%editc(RND:'X')));
          WrtCTASeg_(H__3(1):275:292);
          AfToPage_(%trim(%editc(PREVPAGE:'P')));
          WrtCTASeg_(H__3(1):567:116);
          AfToPage_(%trim(%editc(ISNEXTPAGE:'P')));
          WrtCTASeg_(H__3(1):683:824);
         endif;
        endif;
      /end-free
     C/Exec SQL
     C+  close MC
     C/End-Exec
      /free
        if (spreadsheet = 'Y');
         SetPipe_('*OFF':1000000);
         tmpdta = GetPipeDta_(32000);
         dow ( %len(%trimr(tmpdta))> 0);
         tmpdta = tranapi_(tmpdta: '*CUSTOM': 37: 437);
         OutWeb_(tmpdta);
         tmpdta = GetPipeDta_(32000);
         enddo;
        endif;
      /end-free
     c     *PSSR         begsr
     c                   endsr
     P bldpage0        E


     P*---------------------------------------------------------------------
     P* bldselstr0                  - User defined function
     P*---------------------------------------------------------------------
     P bldselstr0      B
     D bldselstr0      PI


     D ordby           S            128A


      /free
        selstring = ''+x'0D'+''+x'25'+'		SELECT KWLBASE.MFMTACCT, KWCDATA.ICN-
       A1, KWHLOAN.HDATE, HTC, HAMT, SHDESC, HDRCR, HAFECT, HBR, PLNAM1, MDLR-
       , HBAL, HINT, HLCHG, HEXP1'+x'0D'+''+x'25'+'		FROM KWHLOAN 		'+x'0D'+'-
       '+x'25'+'			inner join KWHBASE on '+x'0D'+''+x'25'+'				KWHBASE.HDATE -
       = KWHLOAN.HDATE and'+x'0D'+''+x'25'+'				KWHBASE.HSEQ = KWHLOAN.HSEQ		-
       		'+x'0D'+''+x'25'+'			inner join KWLBASE on '+x'0D'+''+x'25'+'				KWL-
       BASE.MCUST = KWHLOAN.HCUST and'+x'0D'+''+x'25'+'				KWLBASE.MACCT = KW-
       HLOAN.HACCT				'+x'0D'+''+x'25'+'			left join KWCDATA on '+x'0D'+''+x'-
       25'+'				KWCDATA.CCUST = KWHLOAN.HCUST '+x'0D'+''+x'25'+'			inner join-
        KWSHIST on'+x'0D'+''+x'25'+'				KWSHIST.SHCODE = KWHBASE.HTC'+x'0D'+'-
       '+x'25'+'			left join KWPLBASE on'+x'0D'+''+x'25'+'				PLNO = HBR';
        whrclause = ' where HBR > 0 and HACCT > 0 and HSTAT <> ''R'' ';
        whrlink = ' and';
        if (ww_floc> 0);
         whrclause = %trim(whrclause) + whrlink + ' KWHBASE.HBR = ' + %trim(
       %editc(ww_floc:'P')) + '';
         whrlink = ' and';
        endif;
        if (ww_ftrant <> HTC);
         whrclause = %trim(whrclause) + whrlink + ' KWHBASE.HTC = ' + %trim(
       %editc(ww_ftrant:'P')) + '';
         whrlink = ' and';
        endif;
        if (ww_fdlr <> '');
         whrclause = %trim(whrclause) + whrlink + ' MDLR = ''' + %trim(
       ww_fdlr) + '''';
         whrlink = ' and';
        endif;
        inputdate = ww_fdate;
        isodate = AlpToDate_(inputdate:'*USA');
        if (inputdate <> '');
         whrclause = %trim(whrclause) + whrlink + ' KWHBASE.HDATE >= ''' +
       %char(isodate:*ISO) + '''';
         whrlink = ' and';
        endif;
        inputdate = ww_tdate;
        isodate = AlpToDate_(inputdate:'*USA');
        if (inputdate <> '');
         whrclause = %trim(whrclause) + whrlink + ' KWHBASE.HDATE <= ''' +
       %char(isodate:*ISO) + '''';
         whrlink = ' and';
        endif;
        selstring = %trim(selstring) + ' ' + whrclause;
        ww_ordby = 'HBR, HTC, KWHBASE.HDATE DESC';
        selstring = %trim(selstring) + ' order by ' + ww_ordby;
        if (ww_orddir = 'D');
         selstring = %trim(selstring) + ' DESC';
        endif;
      /end-free
     c     *PSSR         begsr
     c                   endsr
     P bldselstr0      E


     P*---------------------------------------------------------------------
     P* fetchrel0                   - User defined function
     P*---------------------------------------------------------------------
     P fetchrel0       B
     D fetchrel0       PI




      /free

      /end-free
     C/Exec SQL
     C+  FETCH RELATIVE :nx  FROM MC INTO :MFMTACCT, :ICNA1, :HDATE, :HTC, :HAMT
     C+  :NI, :SHDESC :NI, :HDRCR :NI, :HAFECT :NI, :HBR :NI, :PLNAM1 :NI, :MDLR
     C+ , :HBAL :NI, :HINT :NI, :HLCHG :NI, :HEXP1 :NI
     C/End-Exec
      /free
        if (renttoown = 'Y');
         HRTOPMT = 0;
         AM013_ = CV_BYKEY;
         CHAIN(E) DL013_ RKWHRTO;
         RS013_ = RcdSts2_('GETRCD': %error: %found: %eof);
        endif;
      /end-free
     c     *PSSR         begsr
     c                   endsr
     P fetchrel0       E


     P*---------------------------------------------------------------------
     P* fetchnext0                  - User defined function
     P*---------------------------------------------------------------------
     P fetchnext0      B
     D fetchnext0      PI




      /free

      /end-free
     C/Exec SQL
     C+  FETCH NEXT FROM MC INTO :MFMTACCT, :ICNA1, :HDATE, :HTC, :HAMT :NI, :SH
     C+ DESC :NI, :HDRCR :NI, :HAFECT :NI, :HBR :NI, :PLNAM1  :NI, :MDLR, :HBAL
     C+ :NI, :HINT :NI, :HLCHG :NI, :HEXP1 :NI
     C/End-Exec
      /free
        if (renttoown = 'Y');
         HRTOPMT = 0;
         AM013_ = CV_BYKEY;
         CHAIN(E) DL013_ RKWHRTO;
         RS013_ = RcdSts2_('GETRCD': %error: %found: %eof);
        endif;
      /end-free
     c     *PSSR         begsr
     c                   endsr
     P fetchnext0      E


     P*---------------------------------------------------------------------
     P* filter0                     - User defined function
     P*---------------------------------------------------------------------
     P filter0         B
     D filter0         PI




      /free
        ww_floc = %dec(aton_( getparm2_('ww_floc':'*OPT'):5:0):5:0);
        ww_ftrant = %dec(aton_( getparm2_('ww_ftrant':'*OPT'):5:0):5:0);
        ww_fdate = getparm2_('ww_fdate':'*OPT');
        ww_tdate = getparm2_('ww_tdate':'*OPT');
        ww_fdlr = getparm2_('ww_fdlr':'*OPT');
        ww_floca = %trim(%editc(ww_floc:'P'));
        display0();
      /end-free
     c     *PSSR         begsr
     c                   endsr
     P filter0         E


     P*---------------------------------------------------------------------
     P* locbox0                     - User defined function
     P*---------------------------------------------------------------------
     P locbox0         B
     D locbox0         PI


     D selstring2      S           3200A   varying


      /free
        OutWeb_('<select name="ww_fLOC" ');
        OutWeb_('id="ww_fLOC" ');
        OutWeb_('size="1"');
        OutWeb_('>');
        selstring2 = 'select PLNO, PLNAM1 from KWPLBASE';
      /end-free
     C/Exec SQL
     C+            Declare LOCBOX Scroll Cursor
     C+            For LOCBOX
     C/End-Exec
     C/Exec SQL
     C+            Prepare LOCBOX
     C+            From :selstring2
     C/End-Exec
      /free
        if (sqlcod >= 0);
      /end-free
     C/Exec SQL
     C+            Open LOCBOX
     C/End-Exec
      /free
        endif;
      /end-free
     C/Exec SQL
     C+  FETCH FIRST FROM LOCBOX INTO :PLNO, :PLNAM1
     C/End-Exec
      /free
        OutWeb_('<option>All Locations</option>');
        dow ((((sqlcod <> 100)) and ((sqlcod >= 0))));
        if (shloan <> 'N');
         OutWeb_('<option value="');
         OutWeb_(%trimr( %trim(%editc(PLNO:'P'))));
         OutWeb_('"');
         if (ww_fLOC = PLNO);
          OutWeb_(' selected');
         endif;
         OutWeb_('>');
         OutWeb_(%trimr(plnam1));
         OutWeb_('</option>');
        endif;
      /end-free
     C/Exec SQL
     C+  FETCH NEXT FROM LOCBOX INTO :PLNO, :PLNAM1
     C/End-Exec
      /free
        enddo;
      /end-free
     C/Exec SQL
     C+  close LOCBOX
     C/End-Exec
      /free
        OutWeb_('</select>');
      /end-free
     c     *PSSR         begsr
     c                   endsr
     P locbox0         E


     P*---------------------------------------------------------------------
     P* htcbox0                     - User defined function
     P*---------------------------------------------------------------------
     P htcbox0         B
     D htcbox0         PI


     D selstring2      S           3200A   varying


      /free
        OutWeb_('<select name="ww_ftrant" ');
        OutWeb_('id="ww_ftrant" ');
        OutWeb_('size="1"');
        OutWeb_('>');
        selstring2 = 'select KWSHIST.SHDESC, KWSHIST.SHCODE, KWSHIST.SHLOAN f-
       rom KWSHIST join KWSHGRPR on KWSHIST.SHCODE = KWSHGRPR.SHCODE where KW-
       SHGRPR.SHGROUP <> ''''';
      /end-free
     C/Exec SQL
     C+            Declare HTCBOX Scroll Cursor
     C+            For HTCBOX
     C/End-Exec
     C/Exec SQL
     C+            Prepare HTCBOX
     C+            From :selstring2
     C/End-Exec
      /free
        if (sqlcod >= 0);
      /end-free
     C/Exec SQL
     C+            Open HTCBOX
     C/End-Exec
      /free
        endif;
      /end-free
     C/Exec SQL
     C+  FETCH FIRST FROM HTCBOX INTO :SHDESC, :SHCODE, :SHLOAN
     C/End-Exec
      /free
        OutWeb_('<option>All Types</option>');
        dow ((((sqlcod <> 100)) and ((sqlcod >= 0))));
        if (shloan <> 'N');
         OutWeb_('<option value="');
         OutWeb_(%trimr( %trim(%editc(SHCODE:'P'))));
         OutWeb_('"');
         if (ww_ftrant = SHCODE);
          OutWeb_(' selected');
         endif;
         OutWeb_('>');
         OutWeb_(%trimr(shdesc));
         OutWeb_('</option>');
        endif;
      /end-free
     C/Exec SQL
     C+  FETCH NEXT FROM HTCBOX INTO :SHDESC, :SHCODE, :SHLOAN
     C/End-Exec
      /free
        enddo;
      /end-free
     C/Exec SQL
     C+  close HTCBOX
     C/End-Exec
      /free
        OutWeb_('</select>');
      /end-free
     c     *PSSR         begsr
     c                   endsr
     P htcbox0         E


     P*---------------------------------------------------------------------
     P* dlrbox0                     - User defined function
     P*---------------------------------------------------------------------
     P dlrbox0         B
     D dlrbox0         PI




      /free
        p_ztype = 'KWPDBASE';
        boxname = 'ww_fdlr';
        boxid = 'ww_fdlr';
        boxselect = ww_fdlr;
        boxtype = 'OTHER';
        OutWeb_('<select name="');
        OutWeb_(%trimr(boxname));
        OutWeb_('"');
        OutWeb_(' id="');
        OutWeb_(%trimr(boxid));
        OutWeb_('" onchange="doAjax();get_dlrloc();" onblur="');
        OutWeb_(%trimr(jvalidation));
        OutWeb_('"');
        OutWeb_(' size="1"');
        OutWeb_('>');
        OutWeb_('<option value=""></option>');
        pdno = ' ';
        SETLL  DL011_ RKWPDBASE;
        RS011_ = RcdSts2_('POSRCD':%error:%equal:%eof);
        READ(NE)  RKWPDBASE;
        RS011_ = RcdSts2_('GETNXTRCD':%error:%found:%eof);
        AM011_ = CV_ByKey;
        dow (RS011_ = '1');
        OutWeb_('<option value="');
        OutWeb_(%trimr(pdno));
        OutWeb_('"');
        if (mdlr = pdno);
         OutWeb_(' selected');
        endif;
        OutWeb_('>');
        OutWeb_(%trimr(pdno));
        OutWeb_('</option>');
        READ(NE)  RKWPDBASE;
        RS011_ = RcdSts2_('GETNXTRCD':%error:%found:%eof);
        AM011_ = CV_ByKey;
        enddo;
        OutWeb_('</select>');
      /end-free
     c     *PSSR         begsr
     c                   endsr
     P dlrbox0         E


      *--------------------------------------------------------------------------------------------*
      * Pgm_Init_ - Program initialization
      *--------------------------------------------------------------------------------------------*
     P Pgm_Init_       B
     D Pgm_Init_       PI
      /free

      /end-free
      /free
      /end-free
      /free
        QPGMNAM__=%trim(PGMNAME__) + '.pgm';

        // Initialize library list array for current job to find files
        rtlla__(1) = 'KWDB';
        rtlla__(2) = 'KWSYS';

        // Set the runtime library for support object references.
        // Also, determine job type
        jobtype__ = SetRtLib_('XL_WEBSPT');
        if  jobtype__ = '1';
         prmreq__ = '*DAA';
        endif;

        // Register the condition handler. Use a pointer to the
        // pgm status data structure
        RegCndHdlr_(CndHdlrPtr:  PSPtr__: *omit);

      /end-free
      /free
        SmurfChk__ = *OFF;

        // If Smurfid parm is missing, or value is blank, write error page:
        if  ChkSmurfID_(SmurfChk__ : prmreq__)=*ON;
         UnRegCndHdlr_(CndHdlrPtr : *omit);

         // Close all files and shut down program:
         if   Persists__ = *OFF;
          *inlr = *ON;
         endif;
         ShutDown_();
        endif;

        // Set default page size limit to 2Mb.
        if PgSizeLm__ = 0;
         PgSizeLm__ = 2000000;
        endif;

        //  Get the task. If none provided, use the default:
        task__ = getparm2_('TASK':prmreq__);
        if  task__ = '';
         task__ = 'DEFAULT';
        else;
         //  Convert the parameter value to upper case:
         task__ = %XLATE(lo__: up__  :task__);
        endif;

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
        if   ((file__='KWLBASE' or file__='*ALL') and NOT %OPEN(KWLBASE));
         if   (mbr__ <>'*FIRST');
          ovrdbf_(ovrflag__:'KWLBASE':'KWLBASE' : '*LIBL' : mbr__);
         endif;
         if    erropen__ = 'Y';
          OPEN(E) KWLBASE;                //    KWLBASE
          if        %error;
           return %error;
          endif;
         else;
          OPEN KWLBASE;                //    KWLBASE
         endif;
        endif;
        if   ((file__='KWCDATA' or file__='*ALL') and NOT %OPEN(KWCDATA));
         if   (mbr__ <>'*FIRST');
          ovrdbf_(ovrflag__:'KWCDATA':'KWCDATA' : '*LIBL' : mbr__);
         endif;
         if    erropen__ = 'Y';
          OPEN(E) KWCDATA;                //    KWCDATA
          if        %error;
           return %error;
          endif;
         else;
          OPEN KWCDATA;                //    KWCDATA
         endif;
        endif;
        if   ((file__='KWPPBASE' or file__='*ALL') and NOT %OPEN(KWPPBASE));
         if   (mbr__ <>'*FIRST');
          ovrdbf_(ovrflag__:'KWPPBASE':'KWPPBASE' : '*LIBL' : mbr__);
         endif;
         if    erropen__ = 'Y';
          OPEN(E) KWPPBASE;                //    KWPPBASE
          if        %error;
           return %error;
          endif;
         else;
          OPEN KWPPBASE;                //    KWPPBASE
         endif;
        endif;
        if   ((file__='KWLDATA' or file__='*ALL') and NOT %OPEN(KWLDATA));
         if   (mbr__ <>'*FIRST');
          ovrdbf_(ovrflag__:'KWLDATA':'KWLDATA' : '*LIBL' : mbr__);
         endif;
         if    erropen__ = 'Y';
          OPEN(E) KWLDATA;                //    KWLDATA
          if        %error;
           return %error;
          endif;
         else;
          OPEN KWLDATA;                //    KWLDATA
         endif;
        endif;
        if   ((file__='KWSHGRP' or file__='*ALL') and NOT %OPEN(KWSHGRP));
         if   (mbr__ <>'*FIRST');
          ovrdbf_(ovrflag__:'KWSHGRP':'KWSHGRP' : '*LIBL' : mbr__);
         endif;
         if    erropen__ = 'Y';
          OPEN(E) KWSHGRP;                //    KWSHGRP
          if        %error;
           return %error;
          endif;
         else;
          OPEN KWSHGRP;                //    KWSHGRP
         endif;
        endif;
        if   ((file__='KWSHGRPR' or file__='*ALL') and NOT %OPEN(KWSHGRPR));
         if   (mbr__ <>'*FIRST');
          ovrdbf_(ovrflag__:'KWSHGRPR':'KWSHGRPR' : '*LIBL' : mbr__);
         endif;
         if    erropen__ = 'Y';
          OPEN(E) KWSHGRPR;                //    KWSHGRPR
          if        %error;
           return %error;
          endif;
         else;
          OPEN KWSHGRPR;                //    KWSHGRPR
         endif;
        endif;
        if   ((file__='KWSHIST' or file__='*ALL') and NOT %OPEN(KWSHIST));
         if   (mbr__ <>'*FIRST');
          ovrdbf_(ovrflag__:'KWSHIST':'KWSHIST' : '*LIBL' : mbr__);
         endif;
         if    erropen__ = 'Y';
          OPEN(E) KWSHIST;                //    KWSHIST
          if        %error;
           return %error;
          endif;
         else;
          OPEN KWSHIST;                //    KWSHIST
         endif;
        endif;
        if   ((file__='KWHLOAN' or file__='*ALL') and NOT %OPEN(KWHLOAN));
         if   (mbr__ <>'*FIRST');
          ovrdbf_(ovrflag__:'KWHLOAN':'KWHLOAN' : '*LIBL' : mbr__);
         endif;
         if    erropen__ = 'Y';
          OPEN(E) KWHLOAN;                //    KWHLOAN
          if        %error;
           return %error;
          endif;
         else;
          OPEN KWHLOAN;                //    KWHLOAN
         endif;
        endif;
        if   ((file__='KWHBASE' or file__='*ALL') and NOT %OPEN(KWHBASE));
         if   (mbr__ <>'*FIRST');
          ovrdbf_(ovrflag__:'KWHBASE':'KWHBASE' : '*LIBL' : mbr__);
         endif;
         if    erropen__ = 'Y';
          OPEN(E) KWHBASE;                //    KWHBASE
          if        %error;
           return %error;
          endif;
         else;
          OPEN KWHBASE;                //    KWHBASE
         endif;
        endif;
        if   ((file__='KWPLBASE' or file__='*ALL') and NOT %OPEN(KWPLBASE));
         if   (mbr__ <>'*FIRST');
          ovrdbf_(ovrflag__:'KWPLBASE':'KWPLBASE' : '*LIBL' : mbr__);
         endif;
         if    erropen__ = 'Y';
          OPEN(E) KWPLBASE;                //    KWPLBASE
          if        %error;
           return %error;
          endif;
         else;
          OPEN KWPLBASE;                //    KWPLBASE
         endif;
        endif;
        if   ((file__='KWPDBASE' or file__='*ALL') and NOT %OPEN(KWPDBASE));
         if   (mbr__ <>'*FIRST');
          ovrdbf_(ovrflag__:'KWPDBASE':'KWPDBASE' : '*LIBL' : mbr__);
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
        if   ((file__='KWPRULE' or file__='*ALL') and NOT %OPEN(KWPRULE));
         if   (mbr__ <>'*FIRST');
          ovrdbf_(ovrflag__:'KWPRULE':'KWPRULE' : '*LIBL' : mbr__);
         endif;
         if    erropen__ = 'Y';
          OPEN(E) KWPRULE;                //    KWPRULE
          if        %error;
           return %error;
          endif;
         else;
          OPEN KWPRULE;                //    KWPRULE
         endif;
        endif;
        if   ((file__='KWHRTO' or file__='*ALL') and NOT %OPEN(KWHRTO));
         if   (mbr__ <>'*FIRST');
          ovrdbf_(ovrflag__:'KWHRTO':'KWHRTO' : '*LIBL' : mbr__);
         endif;
         if    erropen__ = 'Y';
          OPEN(E) KWHRTO;                //    KWHRTO
          if        %error;
           return %error;
          endif;
         else;
          OPEN KWHRTO;                //    KWHRTO
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

        // Close all files and shut down program:
        if ovrflag__ = '1';
         ExecCmd2_('dltovr file(*all)':17);
        endif;
        Shutdown_();                          //     Shut down completely

      /end-free
     P Exit_Immed_     E







      *+CTARRS Compile-time Arrays go here:
**CTDATA PTL__      Program title contents
WebSmart Report
**CTDATA H__1        ListHeader                       5934
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.or
g/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>
    <meta name="genera
tor" content="WebSmart" />
    <meta http-equiv="Pragma" content="no-cache" />

   <title>WebSmart Report</title>
    <link rel="stylesheet" type="text/css" hre
f="/websmart/kwikloan/styles/klDFtheme.css" media="screen, tv, projection" title
="default"/>
    <link rel="alternate stylesheet" type="text/css" href="/websmar
t/kwikloan/styles/klBStheme.css" media="screen, tv, projection" title="bluesky"/
>
    <link rel="alternate stylesheet" type="text/css" href="/websmart/kwikloan/
styles/klRDtheme.css" media="screen, tv, projection" title="reddevil"/>
    <lin
k rel="alternate stylesheet" type="text/css" href="/websmart/kwikloan/styles/klO
Ctheme.css" media="screen, tv, projection" title="orangecrush"/>
    <link rel="
stylesheet" type="text/css" href="/websmart/kwikloan/styles/klstylei.css" media=
"screen, tv, projection" />
    <script type="text/javascript" src="/websmart/kw
ikloan/javascript/klscripts.js"></script>
    <script type="text/javascript" src
="/websmart/kwikloan/javascript/klthemes.js"></script>
    
    <script type="te
xt/javascript" src="/websmart/kwikloan/javascript/KLapp.js"></script> 
    <scri
pt type="text/javascript" src="https://www.google.com/jsapi"></script>
    <scri
pt type="text/javascript">
  
 	 google.load("jquery", "1.6.4");
 	 google.load(
"jqueryui", "1.8.16");
 	 google.setOnLoadCallback(function() {
 	 	 $("#ww_fDAT
E").datepicker({dateFormat: 'mm/dd/yy'})
 	 	 $("#ww_tDATE").datepicker({dateFor
mat: 'mm/dd/yy'})
 	 });
	</script>
      <link rel="stylesheet" type="text/css"
 href="/websmart/kwikloan/styles/jquery-ui.css" />	
    
    
    <style type="t
ext/css">
    
    #report_buttons
    {
    text-align: right;	
    float: righ
t;
    }
    
    .breakhead    
    {
    	border-left: none !important;
    	b
order-bottom: none !important;
    	border-right: 1px solid #C1DAD7;
    }
    

    .nosides
    {
    	border-left: none !important;
    	border-right: none !i
mportant;
    }
    
    
    .first
    {
    	border-left: 1px solid #C1DAD7;

    }
    
    #report_buttons img
    {
    width: 20px;
    }	
    
    .left

    {
    	text-align: left !important;	
    }
    
    .right
    {
    	text-a
lign: right !important;	
    }
    
    .nondisp
    {
    	display: none;	

}
    
    #pageno
    {
    	font-size: 12px;
    	padding-bottom: 5px;	
    }

    
    </style>
    
 
    
  </head>
  <body onload="onload_handler();">


    <div id="wrapping">
      <div id="everything">
        
        
        <
div id="pagetitle">
          <span>Transaction Report</span>
        </div>

     
        <div id="whitebg">
          <div id="EDITtitle"><span>Search Crit
eria</span><span class="ShowHideText"><a href="#" onclick="toggledispA();">Click
 to expand or contract this area</a></span></div>
          <div id="EDITcontent
s">
            
            
            <form action="" method="POST">

       <input type="hidden" name="task" value="filter">
              <table cla
ss="keys" id="showhideA">
                <tr>
                  <td class="left
">Location</td>
                  <td class="right">
                    

              
                    
                  </td>
                </tr
>
                <tr>
                  <td class="left">Transaction Type:</td>

                  <td class="right">
                    
                    

                    
                  </td>
                </tr>

   
                 <tr>
                  <td class="left">Dealer</td>

           <td class="right">
                    
                    

            
                  </td>
                </tr>
                

            <tr>
                  <td class="left">From Date</td>

     
                  <td class="right"><input type="text" name="ww_fDATE" id=
"ww_fDATE" value="" onkeyup="mask(this.value,this,'2,5','/');" ></td>

        
                </tr>
                <tr>
                  <td class=
"left">To Date</td>
                  
                  <td class="right"><inpu
t type="text" name="ww_tDATE" id="ww_tDATE" value="" onkeyup="mask(this.value,th
is,'2,5','/');" ></td>
                  
                </tr>


                <tr>
                  <td class="left">&nbsp;</td><td class="r
ight"><input type="submit" value="Filter"></td>
                </tr>

    </table>
            </form>
          </div><!--editcontents-->
        </d
iv><!--whitebg-->

        <div id="whitebg">
          <div id="EDITtitle"><spa
n>Search Results</span><span class="ShowHideText"></div>
            <div id="co
ntents">
              <div id="pageno">Page: </div>
              <!-- Katie Ba
teman - modified listtopcontrol to make room for spreadsheet and print buttons -
->
              <div id="listtopcontrol" style="width: 50%;">
                <
a id="prevlinktop" class="prevlink nondisp" href="?page=&rnd="><img src="/websma
rt/v7.2/Idaho/images/arrow_left.gif" style="border: none;" /></a>

  
                <a id="nextlinktop" class="nextlink nondisp" href="?page=&rnd
="><img src="/websmart/v7.2/Idaho/images/arrow_right.gif" style="border: none;"
/></a>
              </div> 
              
              <!-- Katie Bateman - a
dded div for print buttons -->
              <div id="report_buttons">

        <a id="xlLink" href="?spreadsheet=Y" target="_blank"><img src="/websmart
/kwikloan/images/icons/excel_icon.jpg" style="border: none;" /></a>

    <a id="printLink" href="?print=Y" target="_blank"><img src="/websmart/kwiklo
an/images/icons/printdocuments.png" style="border: none;" /></a>

 
              </div>
              
              <table class="mainlist">



**CTDATA H__2        ListDetails                      285
<tr class="">
  <td class="first left"></td>
  <td class="right"></td>
  <td cla
ss="left"></td>
  <td class="left"></td>
  <td class="left"></td>
  <td class="l
eft"></td>
  <td class="left"></td>
  <td class="right"></td>
  <td></td>
  <td>
</td>
  <td></td>
  <td></td>
  </td>
</tr>


**CTDATA H__3        ListFooter                       1506


</table>
<div id="listbottomcontrol">
        <a id="prevlinkbot" class="prevl
ink nondisp" href="?page=&rnd="><img src="/websmart/v7.2/Idaho/images/arrow_left
.gif" style="border: none;" /></a>
        
        <a id="nextlinkbot" class="n
extlink nondisp" href="?page=&rnd="><img src="/websmart/v7.2/Idaho/images/arrow_
right.gif" style="border: none;" /></a>
</div>
</div><!--contents-->
</div><!--
whitebg-->

</div><!--everything-->
<div id="everything"></div>
</div><!--wrappi
ng-->

<script type="text/javascript">
	// Control display of Prev and Next link
s
	if( > 0)
	{
		xl_GetObj("prevlinktop").className ="prevlink";
		xl_GetObj("pr
evlinkbot").className ="prevlink";
	}
	if( != 100)
	{
		xl_GetObj("nextlinktop")
.className ="nextlink";
		xl_GetObj("nextlinkbot").className ="nextlink";
	}
</s
cript>
<script type="text/javascript">
	function bldLinks()
	{
		var floc = docu
ment.getElementById('ww_fLOC').value;
		var ftrant =document.getElementById('ww_
ftrant').value;
		var fdate = document.getElementById('ww_fDATE').value;
		var t
date =	document.getElementById('ww_tDATE').value;
		
		$('#printLink').attr("hre
f","?print=Y&ww_fDATE="+fdate+"&ww_tDATE="+tdate+"&ww_floc="+floc+"&ww_ftrant="+
ftrant+"");
		$('#xlLink').attr("href","?spreadsheet=Y&ww_fDATE="+fdate+"&ww_tDA
TE="+tdate+"&ww_floc="+floc+"&ww_ftrant="+ftrant+"");
		
	}
	//run bldLinks on p
age load (in case they filter once and the dates they choose return automaticall
y into the input fields)
	bldLinks();
</script>

</body>
</html>


**CTDATA H__4        RtnToList                        66
<button onClick="javascript:location.href='?page=;'">Back</button>
**CTDATA H__5        SubHeader                        527
<tr><td class="breakhead nosides" colspan="7">
    Transactions for location : 

  </td></tr>
<tr>
  
  <th width="300" class="first">Transaction Type</th>
  <th
 width="150">Date</th>
  <th width="200">Name</th>
  <th width="100">Account No<
/th>
  <th width="100">Dealer</th>
  <th width="50">Debit/Credit</th>
  <th widt
h="50">Affects</th>
  <th width="100">Amount</th>
  <th width="100">Principal</t
h>
  <th width="100">Interest</th>
  <th width="100">Late Charge</th>
  <th widt
h="100" class="last">Expense</th>
    
</tr>



**CTDATA H__6        SubTotal                         195
<tr class="subtotal"><td class="breakhead" colspan="7">
Totals for location: 
</
td>
	<td class="text last right"></td>
</tr>
<tr class="blank">
	<td colspan="7"
 class="nosides">&nbsp;</td>
</tr>

**CTDATA H__7        xlHeader                         3204
<?xml version="1.0"?>
	<Workbook xmlns="urn:schemas-microsoft-com:office:spreads
heet"
	xmlns:o="urn:schemas-microsoft-com:office:office"
	xmlns:x="urn:schemas-m
icrosoft-com:office:excel"
	xmlns:ss="urn:schemas-microsoft-com:office:spreadshe
et"
	xmlns:html="http://www.w3.org/TR/REC-html40">
	<DocumentProperties xmlns="u
rn:schemas-microsoft-com:office:office">
	<Author>MDRT</Author>
	<LastAuthor>MDR
T</LastAuthor>
</DocumentProperties>	
<ExcelWorkbook xmlns="urn:schemas-microsof
t-com:office:excel">
  <WindowHeight>8700</WindowHeight>
  <WindowWidth>11355</W
indowWidth>
  <WindowTopX>480</WindowTopX>
  <WindowTopY>120</WindowTopY>
  <Pro
tectStructure>False</ProtectStructure>
  <ProtectWindows>False</ProtectWindows>

 </ExcelWorkbook>
 <Styles>
  <Style ss:ID="Default" ss:Name="Normal">
   <Align
ment ss:Vertical="Bottom"/>
   <Borders/>
   <Font/>
   <Interior/>
   <NumberFo
rmat/>
   <Protection/>
  </Style>
  
  <Style ss:ID="s21">
   <Font x:Family="S
wiss" ss:Bold="1"/>
  </Style>

  
  <Style ss:ID="style1">
   <Alignment ss:Ver
tical="Bottom" ss:WrapText="0"/>
   <Font ss:Size="10" ss:Bold="1" />
  </Style>

  
  <Style ss:ID="style2">
   <Alignment ss:Vertical="Bottom" ss:WrapText="0"/
>
   <Font ss:Size="10" ss:Italic="1" ss:Bold="1" />
  </Style>
  
  <Style ss:I
D="kwik_data">
   <Alignment ss:Vertical="Bottom" ss:WrapText="0"/>
   <Font x:F
amily="Swiss" ss:Size="8"/>
  </Style>
  
    <Style ss:ID="Currency">
    <Numb
erFormat ss:Format="Currency" />
</Style>
  
 </Styles>
 <Worksheet ss:Name="Loa
n Register">
  <Table x:FullColumns="1" x:FullRows="1">
	
	
	<Column ss:Index="1
" ss:AutoFitWidth="1" ss:Width="150"/>
	<Column ss:Index="2" ss:AutoFitWidth="1"
 ss:Width="75"/>
	<Column ss:Index="3" ss:AutoFitWidth="1" ss:Width="100"/>
	<Co
lumn ss:Index="4" ss:AutoFitWidth="1" ss:Width="75"/>
	<Column ss:Index="5" ss:A
utoFitWidth="1" ss:Width="75"/>
	<Column ss:Index="6" ss:AutoFitWidth="1" ss:Wid
th="50"/>
	<Column ss:Index="7" ss:AutoFitWidth="1" ss:Width="50"/>
	<Column ss:
Index="8" ss:AutoFitWidth="1" ss:Width="50"/>
	<Column ss:Index="9" ss:AutoFitWi
dth="1" ss:Width="50"/>
	<Column ss:Index="10" ss:AutoFitWidth="1" ss:Width="50"
/>
	<Column ss:Index="11" ss:AutoFitWidth="1" ss:Width="50"/>
	<Column ss:Index=
"12" ss:AutoFitWidth="1" ss:Width="50"/>
	
	<Row ss:AutoFitHeight="0" ss:Height=
"15.75">
		<Cell ss:StyleID="s21"><Data ss:Type="String">Transaction Type</Data>
</Cell>
		<Cell ss:StyleID="s21"><Data ss:Type="String">Date</Data></Cell>
		<Ce
ll ss:StyleID="s21"><Data ss:Type="String">Name</Data></Cell>
		<Cell ss:StyleID
="s21"><Data ss:Type="String">Account No</Data></Cell>
		<Cell ss:StyleID="s21">
<Data ss:Type="String">Dealer</Data></Cell>
		<Cell ss:StyleID="s21"><Data ss:Ty
pe="String">Debt/Credit</Data></Cell>
		<Cell ss:StyleID="s21"><Data ss:Type="St
ring">Affects</Data></Cell>
		<Cell ss:StyleID="s21"><Data ss:Type="String">Amou
nt</Data></Cell>
		<Cell ss:StyleID="s21"><Data ss:Type="String">Principal</Data
></Cell>
		<Cell ss:StyleID="s21"><Data ss:Type="String">Interest</Data></Cell>

		<Cell ss:StyleID="s21"><Data ss:Type="String">Late Charge</Data></Cell>
		<Cel
l ss:StyleID="s21"><Data ss:Type="String">Expense</Data></Cell>
		  	

	</Row>

   

**CTDATA H__8        xlDetails                        856
<Row>
	<Cell ss:StyleID="kwik_data"><Data ss:Type="String"></Data></Cell>
  	<Ce
ll ss:StyleID="kwik_data"><Data ss:Type="String"></Data></Cell>
  	<Cell ss:Styl
eID="kwik_data"><Data ss:Type="String"></Data></Cell>
  	<Cell ss:StyleID="kwik_
data"><Data ss:Type="String"></Data></Cell>
  	<Cell ss:StyleID="kwik_data"><Dat
a ss:Type="String"></Data></Cell>
  	<Cell ss:StyleID="kwik_data"><Data ss:Type=
"String"></Data></Cell>
  	<Cell ss:StyleID="kwik_data"><Data ss:Type="String"><
/Data></Cell>
  	<Cell ss:StyleID="Currency"><Data ss:Type="Number"></Data></Cel
l>
  	<Cell ss:StyleID="Currency"><Data ss:Type="Number"></Data></Cell>
  	<Cell
 ss:StyleID="Currency"><Data ss:Type="Number"></Data></Cell>
  	<Cell ss:StyleID
="Currency"><Data ss:Type="Number"></Data></Cell>
  	<Cell ss:StyleID="Currency"
><Data ss:Type="Number"></Data></Cell>
  	
</Row>



  

**CTDATA H__9        xlFooter                         383

</Table>
  <WorksheetOptions xmlns="urn:schemas-microsoft-com:office:excel">

 <FreezePanes/>
   <FrozenNoSplit/>
   <SplitHorizontal>1</SplitHorizontal>
   <
TopRowBottomPane>1</TopRowBottomPane>
   <ActivePane>2</ActivePane>
   
   <Sele
cted/>
   <ProtectObjects>False</ProtectObjects>
   <ProtectScenarios>False</Pro
tectScenarios>
  </WorksheetOptions>
 </Worksheet>
</Workbook>

**CTDATA H__10       printHeader                      958
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.or
g/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>
    <meta name="genera
tor" content="WebSmart" />
    <meta http-equiv="Pragma" content="no-cache" />

   <title>WebSmart Report</title>
	<link rel="stylesheet" type="text/css" href="
/websmart/kwikloan/styles/print.css"  title="default"/>

    <script type="text/
javascript" src="/websmart/kwikloan/javascript/klscripts.js"></script>
    <scri
pt type="text/javascript" src="/websmart/kwikloan/javascript/klthemes.js"></scri
pt>


    
  </head>
  <body onload="onload_handler();">

    <div id="wrapping"
>
  <div id="everything">
  
  
  <div id="pagetitle">
  	<span>Transaction Repo
rt</span>
  	
  	
  </div>
  
  	<input type="button" value="Print" id="print_bt
n" onclick="window.print();" />
      
      <div id="whitebg">

    <div id="co
ntents">
      
      
      <table class="mainlist" cellspacing="0">

**CTDATA H__11       printFooter                      153


</table>



</div><!--contents-->
</div><!-- whitebg-->

</div><!--everything-
->
<div id="everything"></div>
</div><!--wrapping-->



</body>
</html>


**CTDATA H__12       TotalSeg                         110
<tr class="subtotal"><td class="breakhead" colspan="6">
Total: 
</td>
	<td class
="text last right"></td>
</tr>

     H/TITLE  WebSmart Report
      * ProGen WebSmart Revision 9484
      * File overrides for compile command
      *__OV OVRDBF KWLBASE    KWLBASE
      *__OV OVRDBF KWCDATA    KWCDATA
      *__OV OVRDBF KWPPBASE   KWPPBASE
      *__OV OVRDBF KWLDATA    KWLDATA
      *__OV OVRDBF KWPDBASE   KWPDBASE
      *__   Following values are used to create the server program
      *__RO Pgm  lib KWWEB      Pgm  R_NEW
      *__AG          WEBSMART
      *__CL          *OBJLIBNAM
      *__SQ
      *__BD ECRTBND115
      *===============================================================*
      * Path:   r_new.pdw
      * System: LEIFPERRY7B1F
      * Project:Kwik-Loan
      * Set:    Development
      * User:   leif
      * Date Last Generated:   2014-09-02   12:24:48
      * Last Generated CRC: 269A3E2A 94B140FC 36FB3AC4 FF2704B8
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
     FKWPDBASE  IF   E           K DISK    USROPN
     F                                     INFDS(FID005_   )

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
     D ww_floc                       10A
     D ww_fprod                      25A
     D ww_fdate                      10A
     D ww_tdate                      10A
     D ww_fdlr                       25A

     D spreadsheet     S              1A
     D print           S              1A
     D artncod         S              5A
     D security        S              1A
     D p_ztype         S             15A
     D boxname         S             10A
     D boxid           S             10A
     D boxselect       S             25A
     D boxtype         S             10A
     D jvalidation     S             30A
     D selstring       S           3200A   varying
     D rrn             S              9P 0
     D nx              S              5P 0
     D pagenum         S              5P 0
     D listsize        S             11P 0
     D rnd             S              5P 0
     D total           S              9P 0
     D isodate         S               D   DATFMT(*ISO      )
     D inputdate       S             10A
     D tmpdta          S          32000A   varying
     D header          S            500A
     D x               S              5P 0
     D ordby           S            128A
     D whrclause       S           1000A
     D whrlink         S              7A

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


     D H__1            S              1    PERRCD(80) CTDATA DIM(5318     )

     D H__2            S              1    PERRCD(80) CTDATA DIM(151      )

     D H__3            S              1    PERRCD(80) CTDATA DIM(1571     )

     D H__4            S              1    PERRCD(80) CTDATA DIM(66       )

     D H__5            S              1    PERRCD(80) CTDATA DIM(408      )

     D H__6            S              1    PERRCD(80) CTDATA DIM(344      )

     D H__7            S              1    PERRCD(80) CTDATA DIM(2795     )

     D H__8            S              1    PERRCD(80) CTDATA DIM(615      )

     D H__9            S              1    PERRCD(80) CTDATA DIM(1081     )

     D H__10           S              1    PERRCD(80) CTDATA DIM(960      )

     D H__11           S              1    PERRCD(80) CTDATA DIM(149      )

     D H__12           S              1    PERRCD(80) CTDATA DIM(71       )


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
     D count0          PR
     D bldpage0        PR
     D mimetype__      S           4096A   import
     D bldselstr0      PR
     D fetchrel0       PR
     D fetchnext0      PR
     D filter0         PR
     D locbox0         PR
     D QPGM__          S             21A
     D LstPmlErr_      S              4P 0 IMPORT
     D prodbox0        PR
     D dlrbox0         PR
     D PipeLen__       S             10p 0 IMPORT
     D QPGMNAM__       S             20A
     D SmurfChk__      S              1A   INZ(*ON)
     D Smurf_ID__      S             64A   IMPORT
     D Smurf_Rw__      S              9B 0 IMPORT

     D rcdcnt          S                   LIKE(rrn           )
     D prevpage        S                   LIKE(pagenum       )
     D nextpage        S                   LIKE(pagenum       )
     D tmobal          S                   LIKE(mobal         )
     D tmpprod         S                   LIKE(mprod         )
     D query           S                   LIKE(selstring     )

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

     C     DL004_        KLIST
     C                   KFLD                    mcust
     C                   KFLD                    macct
     C     DL005_        KLIST
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

      /end-free
     C/Exec SQL
     C+  SET OPTION DATFMT = *ISO
     C/End-Exec
      /free
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
       security = kw_security(userid:'R_NEW.PGM');
       if (security = '0');
        ExecCmd2_('CHGLIBL LIBL(QTEMP QGPL)':%len(%trimr('CHGLIBL LIBL(QTEMP -
       QGPL)')));
        Redirect2_('dash.pgm':'*SAME');
        return ;
       endif;
       NEWRPT_ = getcookie2_('NEWRPT_state');
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
       ww_floc = rplstr_(ww_floc:%trim(''''):%trim('_'));
       ww_fprod = rplstr_(ww_fprod:%trim(''''):%trim('_'));
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
       count0();
       ww_pagea = %trim(%editc(pagenum:'P'));
       Setcookie_('NEWRPT_state':NEWRPT_:'*TEMP':'/':'*HOST':'0');
       bldpage0();
      /end-free
     c     *PSSR         begsr
     c                   endsr
     P display0        E


     P*---------------------------------------------------------------------
     P* count0                      - User defined function
     P*---------------------------------------------------------------------
     P count0          B
     D count0          PI




      /free
       query = 'select count(*) from kwlbase ' + %trim(whrclause);
      /end-free
     C/Exec SQL
     C+            Declare CNT Scroll Cursor
     C+            For CNT
     C/End-Exec
     C/Exec SQL
     C+            Prepare CNT
     C+            From :query
     C/End-Exec
      /free
       if (sqlcod >= 0);
      /end-free
     C/Exec SQL
     C+            Open CNT
     C/End-Exec
      /free
       endif;
      /end-free
     C/Exec SQL
     C+  fetch next from cnt into :rcdcnt
     C/End-Exec
      /free
      /end-free
     C/Exec SQL
     C+  close CNT
     C/End-Exec
      /free
      /end-free
     c     *PSSR         begsr
     c                   endsr
     P count0          E


     P*---------------------------------------------------------------------
     P* bldpage0                    - User defined function
     P*---------------------------------------------------------------------
     P bldpage0        B
     D bldpage0        PI




      /free
       if (spreadsheet = 'Y');
        listsize = 9999999;
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
        WrtCTASeg_(H__7(1):1:2115);
        if (((client <> '107') and (client <> '907')));
         OutWeb_('<Column ss:Index="12" ss:AutoFitWidth="1" ss:Width="100"/>');
        endif;
        WrtCTASeg_(H__7(1):2116:183);
        if (((client <> '107') and (client <> '907')));
         OutWeb_('<Cell ss:StyleID="s21"><Data ss:Type="String">Product</Data-
       ></Cell>');
        endif;
        WrtCTASeg_(H__7(1):2299:497);
       else;
        if (print = 'Y');
         WrtCTASeg_(H__10(1):1:960);
        else;
         WrtCTASeg_(H__1(1):1:2433);
         wfrtn__ = AfToPage_(QPGMNAM__);
         WrtCTASeg_(H__1(1):2434:278);
         locbox0();
         WrtCTASeg_(H__1(1):2712:215);
         prodbox0();
         WrtCTASeg_(H__1(1):2927:215);
         dlrbox0();
         WrtCTASeg_(H__1(1):3142:284);
         wfrtn__ = AfToPage_(WW_FDATE);
         WrtCTASeg_(H__1(1):3426:273);
         wfrtn__ = AfToPage_(WW_TDATE);
         WrtCTASeg_(H__1(1):3699:778);
         wfrtn__ = AfToPage_(QPGMNAM__);
         WrtCTASeg_(H__1(1):4477:6);
         AfToPage_(%trim(%editc(PREVPAGE:'X')));
         WrtCTASeg_(H__1(1):4483:5);
         AfToPage_(%trim(%editc(RND:'X')));
         WrtCTASeg_(H__1(1):4488:169);
         wfrtn__ = AfToPage_(QPGMNAM__);
         WrtCTASeg_(H__1(1):4657:6);
         AfToPage_(%trim(%editc(NEXTPAGE:'X')));
         WrtCTASeg_(H__1(1):4663:5);
         AfToPage_(%trim(%editc(RND:'X')));
         WrtCTASeg_(H__1(1):4668:651);
        endif;
       endif;
       x = 1;
       fetchrel0();
       dow (((((SQLCOD <> 100)) and ((SQLCOD >= 0)) and ((x <= listsize)))));
       if (tmpprod <> mprod);
        if (spreadsheet <> 'Y');
         WrtCTASeg_(H__5(1):1:58);
         wfrtn__ = AfToPage_(PPDESC);
         WrtCTASeg_(H__5(1):59:100);
         if (((client <> '107') and (client <> '907')));
          OutWeb_('<th width="100">Product</th>');
         endif;
         WrtCTASeg_(H__5(1):159:250);
        endif;
       endif;
       if (spreadsheet = 'Y');
        WrtCTASeg_(H__8(1):1:58);
        wfrtn__ = AfToPage_(ICNA1);
        WrtCTASeg_(H__8(1):59:67);
        wfrtn__ = AfToPage_(MFMTACCT);
        WrtCTASeg_(H__8(1):126:15);
        if (((client <> '107') and (client <> '907')));
         OutWeb_('<Cell ss:StyleID="kwik_data"><Data ss:Type="String">');
         OutWeb_( %trim(mprod));
         OutWeb_('</Data></Cell>');
        endif;
        WrtCTASeg_(H__8(1):141:53);
        wfrtn__ = AfToPage_(MDLR);
        WrtCTASeg_(H__8(1):194:67);
        wfrtn__ = AfToPage_(%char(MODATE));
        WrtCTASeg_(H__8(1):261:67);
        AfToPage_(%trim(%editc(MNOPMT:'Z')));
        WrtCTASeg_(H__8(1):328:66);
        AfToPage_(%trim(%editc(MPMT:'N')));
        WrtCTASeg_(H__8(1):394:66);
        AfToPage_(%trim(%editc(MOBAL:'N')));
        WrtCTASeg_(H__8(1):460:67);
        AfToPage_(%trim(%editc(MRATE:'3')));
        WrtCTASeg_(H__8(1):527:67);
        wfrtn__ = AfToPage_(ICOL01);
        WrtCTASeg_(H__8(1):594:22);
        if (PIPELEN__ >= 500000);
         SetPipe_('*OFF':1000000);
         dou (PIPELEN__ = 0);
         tmpdta = GetPipeDta_(32000);
         tmpdta = tranapi_(tmpdta: '*CUSTOM': 37: 819);
         OutWeb_(tmpdta);
         enddo;
         SetPipe_('*ON':1000000);
        endif;
       else;
        chain(N) DL004_ RKWLDATA;
        RS004_ = RcdSts2_('GETRCDN':%error: %found: %eof);
        Flip_Rc_();
        WrtCTASeg_(H__2(1):1:11);
        wfrtn__ = AfToPage_(ARCLR__);
        WrtCTASeg_(H__2(1):12:26);
        wfrtn__ = AfToPage_(ICNA1);
        WrtCTASeg_(H__2(1):38:12);
        wfrtn__ = AfToPage_(MFMTACCT);
        WrtCTASeg_(H__2(1):50:8);
        if (((client <> '107') and (client <> '907')));
         OutWeb_('<td>');
         OutWeb_(%trimr( %trim(mprod)));
         OutWeb_('</td>');
        endif;
        WrtCTASeg_(H__2(1):58:7);
        wfrtn__ = AfToPage_(MDLR);
        WrtCTASeg_(H__2(1):65:12);
        wfrtn__ = AfToPage_(%char(MODATE));
        WrtCTASeg_(H__2(1):77:12);
        AfToPage_(%trim(%editc(MNOPMT:'Z')));
        WrtCTASeg_(H__2(1):89:12);
        AfToPage_(%trim(%editc(MPMT:'J')));
        WrtCTASeg_(H__2(1):101:12);
        AfToPage_(%trim(%editc(MOBAL:'J')));
        WrtCTASeg_(H__2(1):113:12);
        AfToPage_(%trim(%editc(MRATE:'3')));
        WrtCTASeg_(H__2(1):125:12);
        wfrtn__ = AfToPage_(ICOL01);
        WrtCTASeg_(H__2(1):137:15);
       endif;
       x = x + 1;
       total = total + MOBAL;
       tmpprod = mprod;
       fetchnext0();
       if (tmpprod <> mprod);
        if (print = 'Y');
         WrtCTASeg_(H__6(1):1:79);
         wfrtn__ = AfToPage_(PPDESC);
         WrtCTASeg_(H__6(1):80:72);
         if (((client <> '107') and (client <> '907')));
          OutWeb_('<td></td>');
         endif;
         WrtCTASeg_(H__6(1):152:73);
         AfToPage_(%trim(%editc(TOTAL:'J')));
         WrtCTASeg_(H__6(1):225:120);
        endif;
       endif;
       enddo;
       if (print = 'Y');
        WrtCTASeg_(H__6(1):1:79);
        wfrtn__ = AfToPage_(PPDESC);
        WrtCTASeg_(H__6(1):80:72);
        if (((client <> '107') and (client <> '907')));
         OutWeb_('<td></td>');
        endif;
        WrtCTASeg_(H__6(1):152:73);
        AfToPage_(%trim(%editc(TOTAL:'J')));
        WrtCTASeg_(H__6(1):225:120);
       endif;
       selstring = 'select sum(mobal) from kwlbase ' + %trim(whrclause);
      /end-free
     C/Exec SQL
     C+            Declare TMOBAL Scroll Cursor
     C+            For TMOBAL
     C/End-Exec
     C/Exec SQL
     C+            Prepare TMOBAL
     C+            From :selstring
     C/End-Exec
      /free
       if (sqlcod >= 0);
      /end-free
     C/Exec SQL
     C+            Open TMOBAL
     C/End-Exec
      /free
       endif;
      /end-free
     C/Exec SQL
     C+  fetch next from tmobal into :tmobal
     C/End-Exec
      /free
      /end-free
     C/Exec SQL
     C+  close tmobal
     C/End-Exec
      /free
       if (spreadsheet = 'Y');
        WrtCTASeg_(H__9(1):1:67);
        AfToPage_(%trim(%editc(RCDCNT:'3')));
        WrtCTASeg_(H__9(1):68:222);
        if (((client <> '107') and (client <> '907')));
         OutWeb_('<Cell ss:StyleID="kwik_data"><Data ss:Type="String"></Data>-
       </Cell>');
        endif;
        WrtCTASeg_(H__9(1):290:186);
        AfToPage_(%trim(%editc(TMOBAL:'N')));
        WrtCTASeg_(H__9(1):476:606);
       else;
        if (print = 'Y');
         WrtCTASeg_(H__11(1):1:149);
        else;
         WrtCTASeg_(H__12(1):1:7);
         if (((client = '107') or (client = '907')));
          OutWeb_('<td colspan="6">');
         else;
          OutWeb_('<td colspan="7">');
         endif;
         WrtCTASeg_(H__12(1):8:11);
         AfToPage_(%trim(%editc(RCDCNT:'3')));
         WrtCTASeg_(H__12(1):19:18);
         AfToPage_(%trim(%editc(TMOBAL:'J')));
         WrtCTASeg_(H__12(1):37:35);
         WrtCTASeg_(H__3(1):1:91);
         wfrtn__ = AfToPage_(QPGMNAM__);
         WrtCTASeg_(H__3(1):92:6);
         AfToPage_(%trim(%editc(PREVPAGE:'X')));
         WrtCTASeg_(H__3(1):98:5);
         AfToPage_(%trim(%editc(RND:'X')));
         WrtCTASeg_(H__3(1):103:141);
         wfrtn__ = AfToPage_(QPGMNAM__);
         WrtCTASeg_(H__3(1):244:6);
         AfToPage_(%trim(%editc(NEXTPAGE:'X')));
         WrtCTASeg_(H__3(1):250:5);
         AfToPage_(%trim(%editc(RND:'X')));
         WrtCTASeg_(H__3(1):255:292);
         AfToPage_(%trim(%editc(PREVPAGE:'P')));
         WrtCTASeg_(H__3(1):547:116);
         AfToPage_(%trim(%editc(SQLCOD:'P')));
         WrtCTASeg_(H__3(1):663:909);
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
        tmpdta = tranapi_(tmpdta: '*CUSTOM': 37: 819);
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




      /free
       selstring = 'SELECT RRN(KWLBASE), KWCDATA.ICNA1, KWLBASE.MFMTACCT, KWL-
       BASE.MPROD, KWLBASE.MODATE, KWLBASE.MNOPMT, KWLBASE.MPMT, KWLBASE.MOBA-
       L, KWLBASE.MRATE, KWLDATA.ICOL01, KWPPBASE.PPDESC, KWLBASE.MDLR FROM K-
       WLBASE inner join KWCDATA on KWLBASE.MCUST = KWCDATA.CCUST inner join -
       KWLDATA on KWLBASE.MCUST = KWLDATA.MCUST and KWLBASE.MACCT = KWLDATA.M-
       ACCT  inner join KWPPBASE on KWLBASE.MPROD = KWPPBASE.PPROD';
       whrclause = '';
       whrlink = ' where';
       if (ww_floc <> '');
        whrclause = %trim(whrclause) + whrlink + ' MBR = ''' + %trim(ww_floc)
        + '''';
        whrlink = ' and';
       endif;
       if (ww_fprod <> '');
        whrclause = %trim(whrclause) + whrlink + ' MPROD = ''' + %trim(
       ww_fprod) + '''';
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
        whrclause = %trim(whrclause) + whrlink + ' MFDATE >= ''' + %char(
       isodate:*ISO) + '''';
        whrlink = ' and';
       endif;
       inputdate = ww_tdate;
       isodate = AlpToDate_(inputdate:'*USA');
       if (inputdate <> '');
        whrclause = %trim(whrclause) + whrlink + ' MFDATE <= ''' + %char(
       isodate:*ISO) + '''';
        whrlink = ' and';
       endif;
       whrclause = %trim(whrclause) + whrlink + ' MSTAT <> ''P'' and MSTAT <>-
        ''X'' and MSTAT <> ''D'' and MSTAT <> ''Q'' ';
       whrlink = ' and';
       selstring = %trim(selstring) + ' ' + whrclause;
       if (ordby <> '');
        if (ww_ordby = ordby);
         if (ww_orddir = 'A');
          ww_orddir = 'D';
         else;
          ww_orddir = 'A';
         endif;
        else;
         ww_ordby = ordby;
         ww_orddir = 'A';
        endif;
       else;
        if (ww_orddir = '');
         ww_orddir = 'A';
        endif;
       endif;
       if (ww_ordby = '');
        ww_ordby = 'MBR, MPROD, MLNAME, MFNAME';
       endif;
       ww_ordby = 'MBR, MPROD, MLNAME, MFNAME';
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
     C+  FETCH RELATIVE :nx  FROM MC INTO :rrn, :ICNA1, :MFMTACCT, :MPROD, :MODA
     C+ TE, :MNOPMT, :MPMT, :MOBAL, :MRATE, :ICOL01, :PPDESC, :MDLR
     C/End-Exec
      /free
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
     C+  FETCH NEXT FROM MC INTO :rrn, :ICNA1, :MFMTACCT, :MPROD, :MODATE, :MNOP
     C+ MT, :MPMT, :MOBAL, :MRATE, :ICOL01, :PPDESC, :MDLR
     C/End-Exec
      /free
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
       ww_floc = getparm2_('ww_floc':'*OPT');
       ww_fprod = getparm2_('ww_fprod':'*OPT');
       ww_fdate = getparm2_('ww_fdate':'*OPT');
       ww_tdate = getparm2_('ww_tdate':'*OPT');
       ww_fdlr = getparm2_('ww_fdlr':'*OPT');
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




      /free
       p_ztype = 'KWPLBASE';
       boxname = 'ww_fLOC';
       boxid = 'ww_fLOC';
       boxselect = ww_floc;
       boxtype = ' ';
      /end-free
     C                   EVAL      QPGM__=%trim('KWWEB'     ) + '/' + 'SELBOX'
     C                   CALL      QPGM__                               90
     C                   PARM                    p_ztype
     C                   PARM                    boxname
     C                   PARM                    boxid
     C                   PARM                    boxselect
     C                   PARM                    boxtype
     C                   PARM                    jvalidation
     C                   IF        *IN90 = '1'
     C                   EVAL      LstPmlErr_ = 1
     C                   ELSE
     C                   EVAL      LstPmlErr_ = 0
     C                   ENDIF
      /free
      /end-free
     c     *PSSR         begsr
     c                   endsr
     P locbox0         E


     P*---------------------------------------------------------------------
     P* prodbox0                    - User defined function
     P*---------------------------------------------------------------------
     P prodbox0        B
     D prodbox0        PI




      /free
       p_ztype = 'KWPPBASE';
       boxname = 'ww_fPROD';
       boxid = 'ww_fPROD';
       boxselect = ww_fprod;
       boxtype = ' ';
      /end-free
     C                   EVAL      QPGM__=%trim('KWWEB'     ) + '/' + 'SELBOX'
     C                   CALL      QPGM__                               90
     C                   PARM                    p_ztype
     C                   PARM                    boxname
     C                   PARM                    boxid
     C                   PARM                    boxselect
     C                   PARM                    boxtype
     C                   PARM                    jvalidation
     C                   IF        *IN90 = '1'
     C                   EVAL      LstPmlErr_ = 1
     C                   ELSE
     C                   EVAL      LstPmlErr_ = 0
     C                   ENDIF
      /free
      /end-free
     c     *PSSR         begsr
     c                   endsr
     P prodbox0        E


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
       SETLL  DL005_ RKWPDBASE;
       RS005_ = RcdSts2_('POSRCD':%error:%equal:%eof);
       READ(NE)  RKWPDBASE;
       RS005_ = RcdSts2_('GETNXTRCD':%error:%found:%eof);
       AM005_ = CV_ByKey;
       dow (RS005_ = '1');
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
       RS005_ = RcdSts2_('GETNXTRCD':%error:%found:%eof);
       AM005_ = CV_ByKey;
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
**CTDATA H__1        ListHeader                       5318
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
pt type="text/javascript" src="http://www.google.com/jsapi"></script>
    <scrip
t type="text/javascript">
  
 	 google.load("jquery", "1");
 	 google.load("jque
ryui", "1.7.2");
 	 google.setOnLoadCallback(function() {
 	 	 $("#ww_fDATE").da
tepicker({dateFormat: 'mm/dd/yy'})
 	 	 $("#ww_tDATE").datepicker({dateFormat: '
mm/dd/yy'})
 	 });
	</script>
      <link rel="stylesheet" type="text/css" href=
"/websmart/kwikloan/styles/jquery-ui.css" />	
    
    
    <style type="text/cs
s">
    
    #report_buttons
    {
    text-align: right;	
    float: right;

 }
    
    #report_buttons img
    {
    width: 20px;
    }	
    
    </style>

    
    
  </head>
  <body onload="onload_handler();">
    
    <div id="wrappi
ng">
      <div id="everything">
        
        
        <div id="pagetitle">

          <span>New Loan Report</span>
        </div>
        
        <div id="
whitebg">
          <div id="EDITtitle"><span>Search Criteria</span><span class=
"ShowHideText"><a href="#" onclick="toggledispA();">Click to expand or contract
this area</a></span></div>
          <div id="EDITcontents">
            

      
            <form action="" method="POST">
              <input type="hid
den" name="task" value="filter">
              <table class="keys" id="showhideA
">
                <tr>
                  <td class="left">Location</td>

           <td class="right">
                    
                    

            
                  </td>
                </tr>
                <tr>

                  <td class="left">Product</td>
                  <td class="rig
ht">
                    
                    
                    

      </td>
                </tr>
                 <tr>
                  <td cl
ass="left">Dealer</td>
                  <td class="right">


                    
                    
                  </td>

   </tr>
                
                
                <tr>

  <td class="left">From Date</td>
                  
                  <td class
="right"><input type="text" name="ww_fDATE" id="ww_fDATE" value="" onkeyup="mask
(this.value,this,'2,5','/');" ></td>
                  
                </tr>

              <tr>
                  <td class="left">To Date</td>

     
                  <td class="right"><input type="text" name="ww_tDATE" id=
"ww_tDATE" value="" onkeyup="mask(this.value,this,'2,5','/');" ></td>

        
                </tr>
                
                <tr>

       <td class="left">&nbsp;</td><td class="right"><input type="submit" value=
"Filter"></td>
                </tr>
              </table>
            </form>

          </div><!--editcontents-->
        </div><!--whitebg-->
        

  <div id="whitebg">
          <div id="EDITtitle"><span>Search Results</span><s
pan class="ShowHideText"></div>
            <div id="contents">
              

             <!-- Katie Bateman - modified listtopcontrol to make room for sprea
dsheet and print buttons -->
              <div id="listtopcontrol" style="width
: 50%;">
                <a id="prevlinktop" class="prevlink nondisp" href="?pag
e=&rnd="><img src="/websmart/v7.2/Idaho/images/arrow_left.gif" style="border: no
ne;" /></a>
                
                <a id="nextlinktop" class="nextlink
 nondisp" href="?page=&rnd="><img src="/websmart/v7.2/Idaho/images/arrow_right.g
if" style="border: none;" /></a>
              </div> 
              

    <!-- Katie Bateman - added div for print buttons -->
              <div id="
report_buttons">
                <a id="xlLink" href="?spreadsheet=Y" target="_b
lank"><img src="/websmart/kwikloan/images/icons/excel_icon.jpg" style="border: n
one;" /></a>
                <a id="printLink" href="?print=Y" target="_blank"><
img src="/websmart/kwikloan/images/icons/printdocuments.png" style="border: none
;" /></a>
                
              </div>
              
              <ta
ble class="mainlist">

**CTDATA H__2        ListDetails                      151
<tr class="">
  
  <td class="first"></td>
  <td></td>
  
  <td></td>
  <td></td
>
  <td></td>
  <td></td>
  <td></td>
  <td></td>
  <td></td>
  
</tr>

**CTDATA H__3        ListFooter                       1571
</table>
<div id="listbottomcontrol">
  <a id="prevlinkbot" class="prevlink nond
isp" href="?page=&rnd="><img src="/websmart/v7.2/Idaho/images/arrow_left.gif" st
yle="border: none;" /></a>
  
  <a id="nextlinkbot" class="nextlink nondisp" hre
f="?page=&rnd="><img src="/websmart/v7.2/Idaho/images/arrow_right.gif" style="bo
rder: none;" /></a>
</div>
</div><!--contents-->
</div><!-- whitebg-->

</div><!
--everything-->
<div id="everything"></div>
</div><!--wrapping-->

<script type=
"text/javascript">
	// Control display of Prev and Next links
	if( > 0)
	{
		xl_
GetObj("prevlinktop").className ="prevlink";
		xl_GetObj("prevlinkbot").classNam
e ="prevlink";
	}
	if( != 100)
	{
		xl_GetObj("nextlinktop").className ="nextlin
k";
		xl_GetObj("nextlinkbot").className ="nextlink";
	}
</script>
<script type=
"text/javascript" src="/websmart/kwikloan/javascript/1.6.1.min.js"></script>
<sc
ript type="text/javascript">
	function bldLinks()
	{
		var floc = document.getEl
ementById('ww_fLOC').value;
		var fprod =	document.getElementById('ww_fPROD').va
lue;
		var fdate = document.getElementById('ww_fDATE').value;
		var tdate =	docu
ment.getElementById('ww_tDATE').value;
		
		$('#printLink').attr("href","?print=
Y&ww_fDATE="+fdate+"&ww_tDATE="+tdate+"&ww_floc="+floc+"&ww_fprod="+fprod+"");
	
	$('#xlLink').attr("href","?spreadsheet=Y&ww_fDATE="+fdate+"&ww_tDATE="+tdate+"&
ww_floc="+floc+"&ww_fprod="+fprod+"");
		
	}
	//run bldLinks on page load (in ca
se they filter once and the dates they choose return automatically into the inpu
t fields)
	bldLinks();
</script>

</body>
</html>


**CTDATA H__4        RtnToList                        66
<button onClick="javascript:location.href='?page=;'">Back</button>
**CTDATA H__5        SubHeader                        408
<tr><td class="breakhead" colspan="11">
    Loan Product: 
  </td></tr>
<tr>
  

  <th width="150" class="first">Name</th>
  <th width="200">Account No</th>
  

  <th width="100">Dealer</th>
  <th width="800">Loan Date</th>
  <th width="100"
># of Pmts</th>
  <th width="100">Pmt Amount</th>
  <th width="800">Orig Balance
</th>
  <th width="800">Rate</th>
  <th width="800">Collateral</th>
   
  
 
  

</tr>



**CTDATA H__6        SubTotal                         344
<tr class="subtotal"><td class="breakhead first last" colspan="11">
Totals for 

</td></tr>
<tr class="subtotal_val">
<td class="first"></td>
<td></td>

<td></td
>
<td></td>
<td class="text right"></td>
<td class="text right"></td>
<td></td>

<td></td>
<td></td>
<td class="last"></td>
</tr>
<tr class="blank">
	<td colspan
="11">&nbsp;</td>
</tr>

**CTDATA H__7        xlHeader                         2795
<?xml version="1.0"?>
<Workbook xmlns="urn:schemas-microsoft-com:office:spreadsh
eet"
xmlns:o="urn:schemas-microsoft-com:office:office"
xmlns:x="urn:schemas-micr
osoft-com:office:excel"
xmlns:ss="urn:schemas-microsoft-com:office:spreadsheet"

xmlns:html="http://www.w3.org/TR/REC-html40">
<DocumentProperties xmlns="urn:sch
emas-microsoft-com:office:office">
<Author>MDRT</Author>
<LastAuthor>MDRT</LastA
uthor>
</DocumentProperties>	
<ExcelWorkbook xmlns="urn:schemas-microsoft-com:of
fice:excel">
<WindowHeight>8700</WindowHeight>
<WindowWidth>11355</WindowWidth>

<WindowTopX>480</WindowTopX>
<WindowTopY>120</WindowTopY>
<ProtectStructure>Fals
e</ProtectStructure>
<ProtectWindows>False</ProtectWindows>
</ExcelWorkbook>
<St
yles>
<Style ss:ID="Default" ss:Name="Normal">
<Alignment ss:Vertical="Bottom"/>

<Borders/>
<Font/>
<Interior/>
<NumberFormat/>
<Protection/>
</Style>

<Style s
s:ID="s21">
<Font x:Family="Swiss" ss:Bold="1"/>
</Style>


<Style ss:ID="style1
">
<Alignment ss:Vertical="Bottom" ss:WrapText="0"/>
<Font ss:Size="10" ss:Bold=
"1" />
</Style>

<Style ss:ID="style2">
<Alignment ss:Vertical="Bottom" ss:WrapT
ext="0"/>
<Font ss:Size="10" ss:Italic="1" ss:Bold="1" />
</Style>

<Style ss:ID
="kwik_data">
<Alignment ss:Vertical="Bottom" ss:WrapText="0"/>
<Font x:Family="
Swiss" ss:Size="10"/>
</Style>

  <Style ss:ID="Currency">
    <NumberFormat ss:
Format="Currency" />
</Style>

</Styles>
<Worksheet ss:Name="Loan Register">
<Ta
ble x:FullColumns="1" x:FullRows="1">


<Column ss:Index="1" ss:AutoFitWidth="1"
 ss:Width="200"/>
<Column ss:Index="2" ss:AutoFitWidth="1" ss:Width="100"/>
<Col
umn ss:Index="3" ss:AutoFitWidth="1" ss:Width="30"/>
<Column ss:Index="4" ss:Aut
oFitWidth="1" ss:Width="30"/>
<Column ss:Index="5" ss:AutoFitWidth="1" ss:Width=
"100"/>
<Column ss:Index="6" ss:AutoFitWidth="1" ss:Width="50"/>
<Column ss:Inde
x="7" ss:AutoFitWidth="1" ss:Width="100"/>
<Column ss:Index="8" ss:AutoFitWidth=
"1" ss:Width="100"/>
<Column ss:Index="9" ss:AutoFitWidth="1" ss:Width="100"/>
<
Column ss:Index="10" ss:AutoFitWidth="1" ss:Width="50"/>
<Column ss:Index="11" s
s:AutoFitWidth="1" ss:Width="50"/>


<Row ss:AutoFitHeight="0" ss:Height="15.75"
>
<Cell ss:StyleID="s21"><Data ss:Type="String">Name</Data></Cell>
<Cell ss:Styl
eID="s21"><Data ss:Type="String">Account No</Data></Cell>

<Cell ss:StyleID="s21
"><Data ss:Type="String">Dealer</Data></Cell>
<Cell ss:StyleID="s21"><Data ss:Ty
pe="String">Loan Date</Data></Cell>
<Cell ss:StyleID="s21"><Data ss:Type="String
"># of Pmts</Data></Cell>
<Cell ss:StyleID="s21"><Data ss:Type="String">Pmt Amou
nt</Data></Cell>
<Cell ss:StyleID="s21"><Data ss:Type="String">Orig Balance</Dat
a></Cell>
<Cell ss:StyleID="s21"><Data ss:Type="String">Rate</Data></Cell>
<Cell
 ss:StyleID="s21"><Data ss:Type="String">Collateral</Data></Cell>

</Row>


**CTDATA H__8        xlDetails                        615
<Row>
<Cell ss:StyleID="kwik_data"><Data ss:Type="String"></Data></Cell>
<Cell s
s:StyleID="kwik_data"><Data ss:Type="String"></Data></Cell>

<Cell ss:StyleID="k
wik_data"><Data ss:Type="String"></Data></Cell>
<Cell ss:StyleID="kwik_data"><Da
ta ss:Type="String"></Data></Cell>
<Cell ss:StyleID="kwik_data"><Data ss:Type="N
umber"></Data></Cell>
<Cell ss:StyleID="Currency"><Data ss:Type="Number"></Data>
</Cell>
<Cell ss:StyleID="Currency"><Data ss:Type="Number"></Data></Cell>
<Cell
ss:StyleID="kwik_data"><Data ss:Type="Number"></Data></Cell>
<Cell ss:StyleID="k
wik_data"><Data ss:Type="String"></Data></Cell>
</Row>

**CTDATA H__9        xlFooter                         1081

<Row>
<Cell ss:StyleID="style1"><Data ss:Type="String">Totals for  loans</Data>
</Cell>
<Cell ss:StyleID="kwik_data"><Data ss:Type="String"></Data></Cell>
<Cell
 ss:StyleID="kwik_data"><Data ss:Type="String"></Data></Cell>
<Cell ss:StyleID="
kwik_data"><Data ss:Type="String"></Data></Cell>

<Cell ss:StyleID="kwik_data"><
Data ss:Type="String"></Data></Cell>
<Cell ss:StyleID="kwik_data"><Data ss:Type=
"String"></Data></Cell>
<Cell ss:StyleID="Currency"><Data ss:Type="Number"></Dat
a></Cell>
<Cell ss:StyleID="kwik_data"><Data ss:Type="String"></Data></Cell>
<Ce
ll ss:StyleID="kwik_data"><Data ss:Type="String"></Data></Cell>
<Cell ss:StyleID
="kwik_data"><Data ss:Type="String"></Data></Cell>
</Row>

</Table>
  <Worksheet
Options xmlns="urn:schemas-microsoft-com:office:excel">
   <FreezePanes/>
   <Fr
ozenNoSplit/>
   <SplitHorizontal>1</SplitHorizontal>
   <TopRowBottomPane>1</To
pRowBottomPane>
   <ActivePane>2</ActivePane>
   
   <Selected/>
   <ProtectObje
cts>False</ProtectObjects>
   <ProtectScenarios>False</ProtectScenarios>
  </Wor
ksheetOptions>
 </Worksheet>
</Workbook>

**CTDATA H__10       printHeader                      960
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
  	<span>Loan Register Re
port</span>
  	
  	
  </div>
  
  	<input type="button" value="Print" id="print_
btn" onclick="window.print();" />
      
      <div id="whitebg">

    <div id="
contents">
      
      
      <table class="mainlist" cellspacing="0">

**CTDATA H__11       printFooter                      149
</table>

</div><!--contents-->
</div><!-- whitebg-->

</div><!--everything-->
<
div id="everything"></div>
</div><!--wrapping-->



</body>
</html>


**CTDATA H__12       totals                           71
<tr>
  Totals for  loans</td>
  <td></td>
  <td colspan="2"></td>
</tr>

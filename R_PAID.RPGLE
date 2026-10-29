     H/TITLE  WebSmart Report
      * ProGen WebSmart Revision 9484
      * File overrides for compile command
      *__OV OVRDBF KWLBASE    KWLBASE
      *__OV OVRDBF KWCDATA    KWCDATA
      *__OV OVRDBF KWPPBASE   KWPPBASE
      *__OV OVRDBF KWPDBASE   KWPDBASE
      *__OV OVRDBF KWCADDR    KWCADDR
      *__OV OVRDBF KWLAPPL    KWLAPPL
      *__   Following values are used to create the server program
      *__RO Pgm  lib KWWEB      Pgm  R_PAID
      *__AG          WEBSMART
      *__CL          *OBJLIBNAM
      *__SQ
      *__BD ECRTBND115
      *===============================================================*
      * Path:   r_paid.pdw
      * System: LEIFPERRY7B1F
      * Project:Kwik-Loan
      * Set:    Development
      * User:   leif
      * Date Last Generated:   2014-09-05   10:07:58
      * Last Generated CRC: D5C632B3 92D5CFA2 F2ADA663 85080B71
      *===============================================================*
      */CPY *LIBL/PW_CSRC CPYRIGHT
      * File specifications
     FKWLBASE   IF   E           K DISK    USROPN
     F                                     INFDS(FID001_   )
     FKWCDATA   IF   E           K DISK    USROPN
     F                                     INFDS(FID002_   )
     FKWPPBASE  IF   E           K DISK    USROPN
     F                                     INFDS(FID003_   )
     FKWPDBASE  IF   E           K DISK    USROPN
     F                                     INFDS(FID004_   )
     FKWCADDR   IF   E           K DISK    USROPN
     F                                     INFDS(FID005_   )
     FKWLAPPL   IF   E           K DISK    USROPN
     F                                     INFDS(FID006_   )

     D PTL__           S             50    DIM(1) CTDATA PERRCD(1)
     D RTLLA__         S             11    DIM(180)

     D*+FLDDCL Field declarations

     Duserdata         DS                  INZ
     D client                         5A
     D userid                        32A
     D location                       5A
     Dwbstrpt_         DS                  INZ
     D ww_pagea                       5A
     D ww_orddir                      4A
     D ww_ordby                      64A
     D lntype                        15A
     D oloan                          1A
     D cloan                          1A
     D dlrcode                       25A
     D dlrcode1                      25A
     D dlrcode2                      25A
     D alphdatece                    12A
     D alphdate1ce                   12A
     D alphdate2ce                   12A
     D alphdaterv                    12A
     D alphdate1rv                   12A
     D alphdate2rv                   12A
     D state                          2A

     D spreadsheet     S              1A
     D print           S              1A
     D mstatus         S             10A
     D datedesc        S             12A
     D artncod         S              5A
     D p_ztype         S             15A
     D boxname         S             10A
     D boxid           S             10A
     D boxselect       S             25A
     D boxtype         S             10A
     D jvalidation     S             30A
     D ucc_filed       S            200A
     D ucc_date        S            200A
     D selstring       S           3500A   varying
     D rrn             S              9P 0
     D nx              S              5P 0
     D pagenum         S              5P 0
     D listsize        S              5P 0
     D rnd             S              5P 0
     D index           S             15P 0
     D ww_floc         S             10A
     D ww_fprod        S             10A
     D total           S              7P 0
     D tmpdays         S             15P 0
     D rflag           S              1A
     D tmpdta          S          32000A   varying
     D header          S            500A
     D x               S              5P 0
     D tmpzip          S              5A
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
     D RS006_          S              1A
     D AM006_          S              1A


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
     D rwcolor1__      S             32A   INZ('altcolm1')
     D rwcolor2__      S             32A   INZ('altcolm2')


     D TASKRAN__       S              1    INZ(*OFF)


     D H__1            S              1    PERRCD(80) CTDATA DIM(11061    )

     D H__2            S              1    PERRCD(80) CTDATA DIM(728      )

     D H__3            S              1    PERRCD(80) CTDATA DIM(621      )

     D H__4            S              1    PERRCD(80) CTDATA DIM(386      )

     D H__5            S              1    PERRCD(80) CTDATA DIM(809      )

     D H__6            S              1    PERRCD(80) CTDATA DIM(388      )

     D H__7            S              1    PERRCD(80) CTDATA DIM(3246     )

     D H__8            S              1    PERRCD(80) CTDATA DIM(1025     )

     D H__9            S              1    PERRCD(80) CTDATA DIM(383      )

     D H__10           S              1    PERRCD(80) CTDATA DIM(1195     )

     D H__11           S              1    PERRCD(80) CTDATA DIM(149      )

     D H__12           S              1    PERRCD(80) CTDATA DIM(66       )


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
     D bldcntstr0      PR
     D fetchrel0       PR
     D fetchnext0      PR
     D filter0         PR
     D locbox0         PR
     D QPGM__          S             21A
     D LstPmlErr_      S              4P 0 IMPORT
     D prodbox0        PR
     D statebox0       PR
     D orddirbox0      PR
     D dlrbox0         PR
     D CURISOD__       S               D   DATFMT(*ISO) INZ(*SYS)
     D PipeLen__       S             10p 0 IMPORT
     D QPGMNAM__       S             20A
     D SmurfChk__      S              1A   INZ(*ON)
     D Smurf_ID__      S             64A   IMPORT
     D Smurf_Rw__      S              9B 0 IMPORT

     D cldate          S                   LIKE(datedesc      )
     D rcdcnt          S                   LIKE(total         )
     D prevpage        S                   LIKE(pagenum       )
     D nextpage        S                   LIKE(pagenum       )
     D pagemax         S                   LIKE(pagenum       )
     D totalrec        S                   LIKE(x             )
     D selstr          S                   LIKE(selstring     )
     D modclause       S                   LIKE(whrclause     )
     D sort            S                   LIKE(ww_ordby      )
     D tmpprod         S                   LIKE(mprod         )
     D ww_date1        S                   LIKE(mmdate        )
     D ww_date2        S                   LIKE(mmdate        )
     D tmpdesc         S                   LIKE(ppdesc        )
     D orddir          S                   LIKE(ww_orddir     )
     D curpage         S                   LIKE(ww_pagea      )

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
     C                   KFLD                    pdno
     C     DL005_        KLIST
     C                   KFLD                    ccust
     C     DL003_        KLIST
     C                   KFLD                    pprod
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
       WBSTRPT_ = getcookie2_('WBSTRPT_paid');
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
       pagenum = %dec(aton_( getparm2_('pagenum':'*OPT'):5:0):5:0);
       pagemax = %dec(aton_( getparm2_('pagemax':'*OPT'):5:0):5:0);
       if ((((((TASK__ = 'DEFAULT') and (spreadsheet <> 'Y') and (print <> 'Y-
       ') and (pagemax = 0) and ( getparm2_('page':'*OPT') = ''))))));
        WBSTRPT_ = '';
        pagenum = 1;
        pagemax = 1;
        WrtCTASeg_(H__1(1):1:5848);
        wfrtn__ = AfToPage_(QPGMNAM__);
        WrtCTASeg_(H__1(1):5849:464);
        wfrtn__ = AfToPage_(LNTYPE);
        WrtCTASeg_(H__1(1):6313:442);
        wfrtn__ = AfToPage_(OLOAN);
        WrtCTASeg_(H__1(1):6755:75);
        wfrtn__ = AfToPage_(CLOAN);
        WrtCTASeg_(H__1(1):6830:385);
        dlrbox0();
        WrtCTASeg_(H__1(1):7215:109);
        wfrtn__ = AfToPage_(DLRCODE1);
        WrtCTASeg_(H__1(1):7324:86);
        wfrtn__ = AfToPage_(DLRCODE2);
        WrtCTASeg_(H__1(1):7410:368);
        wfrtn__ = AfToPage_(ALPHDATECE);
        WrtCTASeg_(H__1(1):7778:138);
        wfrtn__ = AfToPage_(ALPHDATE1CE);
        WrtCTASeg_(H__1(1):7916:97);
        wfrtn__ = AfToPage_(ALPHDATE2CE);
        WrtCTASeg_(H__1(1):8013:398);
        wfrtn__ = AfToPage_(ALPHDATERV);
        WrtCTASeg_(H__1(1):8411:138);
        wfrtn__ = AfToPage_(ALPHDATE1RV);
        WrtCTASeg_(H__1(1):8549:97);
        wfrtn__ = AfToPage_(ALPHDATE2RV);
        WrtCTASeg_(H__1(1):8646:146);
        statebox0();
        WrtCTASeg_(H__1(1):8792:876);
        wfrtn__ = AfToPage_(QPGMNAM__);
        WrtCTASeg_(H__1(1):9668:70);
        wfrtn__ = AfToPage_(QPGMNAM__);
        WrtCTASeg_(H__1(1):9738:6);
        AfToPage_(%trim(%editc(PREVPAGE:'X')));
        WrtCTASeg_(H__1(1):9744:5);
        AfToPage_(%trim(%editc(RND:'X')));
        WrtCTASeg_(H__1(1):9749:7);
        wfrtn__ = AfToPage_(WW_ORDBY);
        WrtCTASeg_(H__1(1):9756:161);
        wfrtn__ = AfToPage_(QPGMNAM__);
        WrtCTASeg_(H__1(1):9917:6);
        AfToPage_(%trim(%editc(NEXTPAGE:'X')));
        WrtCTASeg_(H__1(1):9923:5);
        AfToPage_(%trim(%editc(RND:'X')));
        WrtCTASeg_(H__1(1):9928:7);
        wfrtn__ = AfToPage_(WW_ORDBY);
        WrtCTASeg_(H__1(1):9935:249);
        AfToPage_(%trim(%editc(PAGENUM:'J')));
        WrtCTASeg_(H__1(1):10184:29);
        AfToPage_(%trim(%editc(PAGEMAX:'J')));
        WrtCTASeg_(H__1(1):10213:60);
        wfrtn__ = AfToPage_(WW_ORDBY);
        WrtCTASeg_(H__1(1):10273:64);
        AfToPage_(%trim(%editc(PAGEMAX:'J')));
        WrtCTASeg_(H__1(1):10337:725);
        OutWeb_('Please apply at least one filter to run this report.');
        WrtCTASeg_(H__5(1):1:97);
        wfrtn__ = AfToPage_(QPGMNAM__);
        WrtCTASeg_(H__5(1):98:6);
        AfToPage_(%trim(%editc(PREVPAGE:'X')));
        WrtCTASeg_(H__5(1):104:5);
        AfToPage_(%trim(%editc(RND:'X')));
        WrtCTASeg_(H__5(1):109:7);
        wfrtn__ = AfToPage_(WW_ORDBY);
        WrtCTASeg_(H__5(1):116:153);
        wfrtn__ = AfToPage_(QPGMNAM__);
        WrtCTASeg_(H__5(1):269:6);
        AfToPage_(%trim(%editc(NEXTPAGE:'X')));
        WrtCTASeg_(H__5(1):275:5);
        AfToPage_(%trim(%editc(RND:'X')));
        WrtCTASeg_(H__5(1):280:7);
        wfrtn__ = AfToPage_(WW_ORDBY);
        WrtCTASeg_(H__5(1):287:264);
        AfToPage_(%trim(%editc(PREVPAGE:'P')));
        WrtCTASeg_(H__5(1):551:116);
        AfToPage_(%trim(%editc(SQLCOD:'P')));
        WrtCTASeg_(H__5(1):667:143);
        Exit_Immed_();
       endif;
       if (pagenum = 0);
        pagenum = %dec(aton_( getparm2_('page':'*OPT'):5:0):5:0);
        if (pagenum = 0);
         pagenum = 1;
        endif;
       endif;
       if (pagemax <> 0);
        if (pagenum> pagemax);
         pagenum = pagemax;
        endif;
       endif;
       prevpage = pagenum - 1;
       nextpage = pagenum + 1;
       nx = ( ( ( pagenum - 1) * listsize) + 1);
       bldcntstr0();
      /end-free
     C/Exec SQL
     C+            Declare NC Scroll Cursor
     C+            For NC
     C/End-Exec
     C/Exec SQL
     C+            Prepare NC
     C+            From :selstring
     C/End-Exec
      /free
       if (sqlcod >= 0);
      /end-free
     C/Exec SQL
     C+            Open NC
     C/End-Exec
      /free
       endif;
      /end-free
     C/Exec SQL
     C+  FETCH NEXT FROM NC INTO :rcdcnt
     C/End-Exec
      /free
      /end-free
     C/Exec SQL
     C+  close NC
     C/End-Exec
      /free
      /end-free
     C                   EVAL(H)   pagemax = rcdcnt / listsize
      /free
       if ((rcdcnt / listsize)> pagemax);
        pagemax = pagemax + 1;
       endif;
       if (pagemax = 0);
        pagemax = 1;
       endif;
       if (pagenum = pagemax);
        nextpage = pagemax;
       endif;
       bldselstr0();
       ww_pagea = %trim(%editc(pagenum:'P'));
       ww_ordby = getparm2_('ordby':'*OPT');
       Setcookie_('WBSTRPT_paid':WBSTRPT_:'*TEMP':'/':'*HOST':'0');
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




      /free
       if (spreadsheet = 'Y');
        listsize = 9999;
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
        WrtCTASeg_(H__7(1):1:3246);
       else;
        if (print = 'Y');
         WrtCTASeg_(H__10(1):1:815);
         if (lntype <> '');
          OutWeb_('Loan Type: ');
          OutWeb_(%trimr(lntype));
          OutWeb_('<br>');
         endif;
         WrtCTASeg_(H__10(1):816:3);
         if (((oloan <> '') or (cloan <> '')));
          OutWeb_('Loan Status: ');
          OutWeb_(%trimr(oloan));
          OutWeb_(' ');
          OutWeb_(%trimr(cloan));
          OutWeb_('<br>');
         endif;
         WrtCTASeg_(H__10(1):819:3);
         if (dlrcode <> '');
          OutWeb_('Dealer Code :');
          OutWeb_(%trimr(dlrcode));
          OutWeb_('<br>');
         endif;
         WrtCTASeg_(H__10(1):822:3);
         if (((dlrcode1 <> '') and (dlrcode2 <> '')));
          OutWeb_('Dealer Range: ');
          OutWeb_(%trimr(dlrcode1));
          OutWeb_(' to ');
          OutWeb_(%trimr(dlrcode2));
          OutWeb_('<br>');
         endif;
         WrtCTASeg_(H__10(1):825:3);
         if (state <> '');
          OutWeb_('State: ');
          OutWeb_(%trimr(state));
          OutWeb_('<br>');
         endif;
         WrtCTASeg_(H__10(1):828:24);
         if (alphdatece <> '');
          OutWeb_('Loan Closed Date: ');
          OutWeb_(%trimr(alphdatece));
         endif;
         WrtCTASeg_(H__10(1):852:3);
         if (((alphdate1ce <> '') and (alphdate2ce <> '')));
          OutWeb_('Loan Closed Range: ');
          OutWeb_(%trimr(alphdate1ce));
          OutWeb_(' to ');
          OutWeb_(%trimr(alphdate2ce));
          OutWeb_('<br>');
         endif;
         WrtCTASeg_(H__10(1):855:7);
         if (alphdaterv <> '');
          OutWeb_('Paid Off Date: ');
          OutWeb_(%trimr(alphdaterv));
         endif;
         WrtCTASeg_(H__10(1):862:3);
         if (((alphdate1rv <> '') and (alphdate2rv <> '')));
          OutWeb_('Paid Off Range: ');
          OutWeb_(%trimr(alphdate1rv));
          OutWeb_(' to ');
          OutWeb_(%trimr(alphdate2rv));
         endif;
         WrtCTASeg_(H__10(1):865:331);
        else;
         WrtCTASeg_(H__1(1):1:5848);
         wfrtn__ = AfToPage_(QPGMNAM__);
         WrtCTASeg_(H__1(1):5849:464);
         wfrtn__ = AfToPage_(LNTYPE);
         WrtCTASeg_(H__1(1):6313:442);
         wfrtn__ = AfToPage_(OLOAN);
         WrtCTASeg_(H__1(1):6755:75);
         wfrtn__ = AfToPage_(CLOAN);
         WrtCTASeg_(H__1(1):6830:385);
         dlrbox0();
         WrtCTASeg_(H__1(1):7215:109);
         wfrtn__ = AfToPage_(DLRCODE1);
         WrtCTASeg_(H__1(1):7324:86);
         wfrtn__ = AfToPage_(DLRCODE2);
         WrtCTASeg_(H__1(1):7410:368);
         wfrtn__ = AfToPage_(ALPHDATECE);
         WrtCTASeg_(H__1(1):7778:138);
         wfrtn__ = AfToPage_(ALPHDATE1CE);
         WrtCTASeg_(H__1(1):7916:97);
         wfrtn__ = AfToPage_(ALPHDATE2CE);
         WrtCTASeg_(H__1(1):8013:398);
         wfrtn__ = AfToPage_(ALPHDATERV);
         WrtCTASeg_(H__1(1):8411:138);
         wfrtn__ = AfToPage_(ALPHDATE1RV);
         WrtCTASeg_(H__1(1):8549:97);
         wfrtn__ = AfToPage_(ALPHDATE2RV);
         WrtCTASeg_(H__1(1):8646:146);
         statebox0();
         WrtCTASeg_(H__1(1):8792:876);
         wfrtn__ = AfToPage_(QPGMNAM__);
         WrtCTASeg_(H__1(1):9668:70);
         wfrtn__ = AfToPage_(QPGMNAM__);
         WrtCTASeg_(H__1(1):9738:6);
         AfToPage_(%trim(%editc(PREVPAGE:'X')));
         WrtCTASeg_(H__1(1):9744:5);
         AfToPage_(%trim(%editc(RND:'X')));
         WrtCTASeg_(H__1(1):9749:7);
         wfrtn__ = AfToPage_(WW_ORDBY);
         WrtCTASeg_(H__1(1):9756:161);
         wfrtn__ = AfToPage_(QPGMNAM__);
         WrtCTASeg_(H__1(1):9917:6);
         AfToPage_(%trim(%editc(NEXTPAGE:'X')));
         WrtCTASeg_(H__1(1):9923:5);
         AfToPage_(%trim(%editc(RND:'X')));
         WrtCTASeg_(H__1(1):9928:7);
         wfrtn__ = AfToPage_(WW_ORDBY);
         WrtCTASeg_(H__1(1):9935:249);
         AfToPage_(%trim(%editc(PAGENUM:'J')));
         WrtCTASeg_(H__1(1):10184:29);
         AfToPage_(%trim(%editc(PAGEMAX:'J')));
         WrtCTASeg_(H__1(1):10213:60);
         wfrtn__ = AfToPage_(WW_ORDBY);
         WrtCTASeg_(H__1(1):10273:64);
         AfToPage_(%trim(%editc(PAGEMAX:'J')));
         WrtCTASeg_(H__1(1):10337:725);
        endif;
       endif;
       x = 1;
       fetchrel0();
       dow (((((SQLCOD <> 100)) and ((SQLCOD >= 0)) and ((x <= listsize)))));
       if ('Y' = %trim(ucc_filed));
        ucc_filed = 'Yes';
        ucc_date = %trim(ucc_date);
       else;
        ucc_filed = 'No';
        ucc_date = '';
       endif;
       if (tmpprod <> mprod);
        if (spreadsheet <> 'Y');
         WrtCTASeg_(H__2(1):1:58);
         wfrtn__ = AfToPage_(PPDESC);
         WrtCTASeg_(H__2(1):59:78);
         wfrtn__ = AfToPage_(QPGMNAM__);
         WrtCTASeg_(H__2(1):137:20);
         AfToPage_(%trim(%editc(RND:'X')));
         WrtCTASeg_(H__2(1):157:6);
         AfToPage_(%trim(%editc(PAGENUM:'X')));
         WrtCTASeg_(H__2(1):163:65);
         wfrtn__ = AfToPage_(QPGMNAM__);
         WrtCTASeg_(H__2(1):228:18);
         AfToPage_(%trim(%editc(RND:'X')));
         WrtCTASeg_(H__2(1):246:6);
         AfToPage_(%trim(%editc(PAGENUM:'X')));
         WrtCTASeg_(H__2(1):252:117);
         wfrtn__ = AfToPage_(QPGMNAM__);
         WrtCTASeg_(H__2(1):369:15);
         AfToPage_(%trim(%editc(RND:'X')));
         WrtCTASeg_(H__2(1):384:6);
         AfToPage_(%trim(%editc(PAGENUM:'X')));
         WrtCTASeg_(H__2(1):390:339);
        endif;
        tmpdesc = ppdesc;
       endif;
       pdno = mdlr;
       AM004_ = CV_BYKEY;
       CHAIN(NE) DL004_ RKWPDBASE;
       RS004_ = RcdSts2_('GETRCD': %error: %found: %eof);
       CCUST = MCUST;
       AM005_ = CV_BYKEY;
       CHAIN(NE) DL005_ RKWCADDR;
       RS005_ = RcdSts2_('GETRCD': %error: %found: %eof);
       if ((( %len(%trimr( %trim(%editc(CZIP:'P'))))< 5) and (CZIP <> 0)));
        tmpzip = '0' + %subst( %trim(%editc(CZIP:'P')):1:4);
       else;
        if (CZIP <> 0);
         tmpzip = %subst( %trim(%editc(CZIP:'P')):1:5);
        endif;
       endif;
       if (mstat = 'C');
        tmpdays = DateDif_(CURISOD__:MLDATE:'*D');
        if (((tmpdays <= 0) or (tmpdays >= 734722)));
         tmpdays = 0;
        endif;
       endif;
       if (mstat = 'O');
        mstatus = 'Open';
        cldate = 'N/A';
       endif;
       if (mstat = 'C');
        mstatus = 'Closed';
        cldate = %char(MLDATE:*USA);
       endif;
       if ( %char(MQDATE:*USA) = '01/01/0001');
        datedesc = 'N/A';
       else;
        datedesc = %char(MQDATE:*USA);
       endif;
       if (spreadsheet = 'Y');
        chain(N) DL005_ RKWCADDR;
        RS005_ = RcdSts2_('GETRCDN':%error: %found: %eof);
        chain(N) DL004_ RKWPDBASE;
        RS004_ = RcdSts2_('GETRCDN':%error: %found: %eof);
        WrtCTASeg_(H__8(1):1:58);
        wfrtn__ = AfToPage_(MFMTACCT);
        WrtCTASeg_(H__8(1):59:67);
        wfrtn__ = AfToPage_(ICNA1);
        WrtCTASeg_(H__8(1):126:67);
        wfrtn__ = AfToPage_(CADDR1);
        WrtCTASeg_(H__8(1):193:1);
        wfrtn__ = AfToPage_(CADDR2);
        WrtCTASeg_(H__8(1):194:2);
        wfrtn__ = AfToPage_(CCITY);
        WrtCTASeg_(H__8(1):196:67);
        wfrtn__ = AfToPage_(CST);
        WrtCTASeg_(H__8(1):263:1);
        wfrtn__ = AfToPage_(TMPZIP);
        WrtCTASeg_(H__8(1):264:67);
        wfrtn__ = AfToPage_(MSTATUS);
        WrtCTASeg_(H__8(1):331:67);
        wfrtn__ = AfToPage_(%char(MODATE));
        WrtCTASeg_(H__8(1):398:67);
        wfrtn__ = AfToPage_(%char(MMDATE));
        WrtCTASeg_(H__8(1):465:67);
        AfToPage_(%trim(%editc(MLPMT:'J')));
        WrtCTASeg_(H__8(1):532:67);
        wfrtn__ = AfToPage_(DATEDESC);
        WrtCTASeg_(H__8(1):599:67);
        AfToPage_(%trim(%editc(TMPDAYS:'3')));
        WrtCTASeg_(H__8(1):666:67);
        wfrtn__ = AfToPage_(CLDATE);
        WrtCTASeg_(H__8(1):733:67);
        wfrtn__ = AfToPage_(MDLR);
        WrtCTASeg_(H__8(1):800:67);
        wfrtn__ = AfToPage_(PDNAME);
        WrtCTASeg_(H__8(1):867:67);
        wfrtn__ = AfToPage_(UCC_FILED);
        WrtCTASeg_(H__8(1):934:67);
        wfrtn__ = AfToPage_(UCC_DATE);
        WrtCTASeg_(H__8(1):1001:25);
        if (PIPELEN__ >= 500000);
         SetPipe_('*OFF':1000000);
         tmpdta = GetPipeDta_(32000);
         dow ( %len(%trimr(tmpdta))> 0);
         tmpdta = tranapi_(tmpdta: '*CUSTOM': 37: 819);
         OutWeb_(tmpdta);
         tmpdta = GetPipeDta_(32000);
         enddo;
         SetPipe_('*ON':1000000);
        endif;
       else;
        chain(N) DL005_ RKWCADDR;
        RS005_ = RcdSts2_('GETRCDN':%error: %found: %eof);
        chain(N) DL004_ RKWPDBASE;
        RS004_ = RcdSts2_('GETRCDN':%error: %found: %eof);
        Flip_Rc_();
        WrtCTASeg_(H__3(1):1:11);
        wfrtn__ = AfToPage_(ARCLR__);
        WrtCTASeg_(H__3(1):12:56);
        wfrtn__ = AfToPage_(MFMTACCT);
        WrtCTASeg_(H__3(1):68:39);
        wfrtn__ = AfToPage_(ICNA1);
        WrtCTASeg_(H__3(1):107:39);
        wfrtn__ = AfToPage_(CADDR1);
        WrtCTASeg_(H__3(1):146:1);
        wfrtn__ = AfToPage_(CADDR2);
        WrtCTASeg_(H__3(1):147:2);
        wfrtn__ = AfToPage_(CCITY);
        WrtCTASeg_(H__3(1):149:61);
        wfrtn__ = AfToPage_(CST);
        WrtCTASeg_(H__3(1):210:1);
        wfrtn__ = AfToPage_(TMPZIP);
        WrtCTASeg_(H__3(1):211:58);
        wfrtn__ = AfToPage_(MSTATUS);
        WrtCTASeg_(H__3(1):269:58);
        wfrtn__ = AfToPage_(%char(MODATE: *USA));
        WrtCTASeg_(H__3(1):327:4);
        wfrtn__ = AfToPage_(%char(MMDATE: *USA));
        WrtCTASeg_(H__3(1):331:56);
        AfToPage_(%trim(%editc(MLPMT:'J')));
        WrtCTASeg_(H__3(1):387:39);
        wfrtn__ = AfToPage_(DATEDESC);
        WrtCTASeg_(H__3(1):426:39);
        wfrtn__ = AfToPage_(CLDATE);
        WrtCTASeg_(H__3(1):465:4);
        AfToPage_(%trim(%editc(TMPDAYS:'J')));
        WrtCTASeg_(H__3(1):469:58);
        wfrtn__ = AfToPage_(MDLR);
        WrtCTASeg_(H__3(1):527:4);
        wfrtn__ = AfToPage_(PDNAME);
        WrtCTASeg_(H__3(1):531:48);
        wfrtn__ = AfToPage_(UCC_FILED);
        WrtCTASeg_(H__3(1):579:4);
        if (ucc_filed = 'Yes');
         OutWeb_('<br>');
         OutWeb_(%trimr(ucc_date));
        endif;
        WrtCTASeg_(H__3(1):583:39);
       endif;
       x = x + 1;
       tmpprod = mprod;
       fetchnext0();
       if (((tmpprod <> mprod) and (spreadsheet <> 'Y')));
        index = scanstr_('%''': whrclause: 1);
        modclause = %subst(whrclause: index + 2: %len(%trimr(whrclause)));
        modclause = ' WHERE MPROD = ''' + %trim(tmpprod) + ''' ' + %trim(
       modclause);
        selstr = 'SELECT COUNT(MCUST), SUM(MCBAL) FROM KWLBASE ' + %trim(
       modclause);
      /end-free
     C/Exec SQL
     C+            Declare ZC Scroll Cursor
     C+            For ZC
     C/End-Exec
     C/Exec SQL
     C+            Prepare ZC
     C+            From :selstr
     C/End-Exec
      /free
        if (sqlcod >= 0);
      /end-free
     C/Exec SQL
     C+            Open ZC
     C/End-Exec
      /free
        endif;
      /end-free
     C/Exec SQL
     C+  FETCH NEXT FROM ZC into :totalrec, :total
     C/End-Exec
      /free
      /end-free
     C/Exec SQL
     C+  close ZC
     C/End-Exec
      /free
        WrtCTASeg_(H__4(1):1:83);
        wfrtn__ = AfToPage_(TMPDESC);
        WrtCTASeg_(H__4(1):84:177);
        AfToPage_(%trim(%editc(TOTALREC:'J')));
        WrtCTASeg_(H__4(1):261:58);
        AfToPage_(%trim(%editc(TOTAL:'J')));
        WrtCTASeg_(H__4(1):319:68);
       endif;
       enddo;
       if (((SQLCOD = 100) and (x = 1)));
        OutWeb_('<tr><td>No records found</td></tr>');
       else;
        if ((((tmpprod = mprod) and (SQLCOD = 100) and (spreadsheet <> 'Y'))));
         index = scanstr_('%''': whrclause: 1);
         modclause = %subst(whrclause: index + 2: %len(%trimr(whrclause)));
         modclause = ' WHERE MPROD = ''' + %trim(tmpprod) + ''' ' + %trim(
       modclause);
         selstr = 'SELECT COUNT(MCUST), SUM(MCBAL) FROM KWLBASE ' + %trim(
       modclause);
      /end-free
     C/Exec SQL
     C+            Declare RC Scroll Cursor
     C+            For RC
     C/End-Exec
     C/Exec SQL
     C+            Prepare RC
     C+            From :selstr
     C/End-Exec
      /free
         if (sqlcod >= 0);
      /end-free
     C/Exec SQL
     C+            Open RC
     C/End-Exec
      /free
         endif;
      /end-free
     C/Exec SQL
     C+  FETCH NEXT FROM RC into :totalrec, :total
     C/End-Exec
      /free
      /end-free
     C/Exec SQL
     C+  close RC
     C/End-Exec
      /free
         WrtCTASeg_(H__4(1):1:83);
         wfrtn__ = AfToPage_(TMPDESC);
         WrtCTASeg_(H__4(1):84:177);
         AfToPage_(%trim(%editc(TOTALREC:'J')));
         WrtCTASeg_(H__4(1):261:58);
         AfToPage_(%trim(%editc(TOTAL:'J')));
         WrtCTASeg_(H__4(1):319:68);
        endif;
       endif;
       if (spreadsheet = 'Y');
        WrtCTASeg_(H__9(1):1:383);
       else;
        if (print = 'Y');
         WrtCTASeg_(H__11(1):1:149);
        else;
         WrtCTASeg_(H__5(1):1:97);
         wfrtn__ = AfToPage_(QPGMNAM__);
         WrtCTASeg_(H__5(1):98:6);
         AfToPage_(%trim(%editc(PREVPAGE:'X')));
         WrtCTASeg_(H__5(1):104:5);
         AfToPage_(%trim(%editc(RND:'X')));
         WrtCTASeg_(H__5(1):109:7);
         wfrtn__ = AfToPage_(WW_ORDBY);
         WrtCTASeg_(H__5(1):116:153);
         wfrtn__ = AfToPage_(QPGMNAM__);
         WrtCTASeg_(H__5(1):269:6);
         AfToPage_(%trim(%editc(NEXTPAGE:'X')));
         WrtCTASeg_(H__5(1):275:5);
         AfToPage_(%trim(%editc(RND:'X')));
         WrtCTASeg_(H__5(1):280:7);
         wfrtn__ = AfToPage_(WW_ORDBY);
         WrtCTASeg_(H__5(1):287:264);
         AfToPage_(%trim(%editc(PREVPAGE:'P')));
         WrtCTASeg_(H__5(1):551:116);
         AfToPage_(%trim(%editc(SQLCOD:'P')));
         WrtCTASeg_(H__5(1):667:143);
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
       selstring = 'SELECT RRN(KWLBASE), KWLBASE.MCUST, KWLBASE.MSTAT, KWLBAS-
       E.MQDATE, KWLBASE.MMDATE, KWLBASE.MLDATE, KWCDATA.ICNA1, KWLBASE.MFMTA-
       CCT, '+x'0D'+''+x'25'+'	KWLBASE.MDLR, KWLBASE.MPROD,  KWLBASE.MFDATE, -
       KWLBASE.MPMT, KWLBASE.MCBAL, KWLBASE.MRATE, KWLBASE.MDDATE, KWLBASE.ML-
       DATE, KWLBASE.MLPMT, '+x'0D'+''+x'25'+'	KWPPBASE.PPDESC, IFNULL(KWXUCC-
       FILE.KXDATA,''N''), IFNULL(KWXUCCDATE.KXDATA,'''')'+x'0D'+''+x'25'+'	F-
       ROM KWLBASE '+x'0D'+''+x'25'+'	inner join KWCDATA on KWLBASE.MCUST = K-
       WCDATA.CCUST '+x'0D'+''+x'25'+'	inner join KWPPBASE on KWLBASE.MPROD =-
        KWPPBASE.PPROD'+x'0D'+''+x'25'+'	left join KW_XDATA KWXUCCFILE ON KWL-
       BASE.MCUST=KWXUCCFILE.WCUST AND KWLBASE.MACCT=KWXUCCFILE.WACCT AND KWX-
       UCCFILE.KXID=''UCC_FILED'''+x'0D'+''+x'25'+'	left join KW_XDATA KWXUCC-
       DATE ON KWLBASE.MCUST=KWXUCCDATE.WCUST AND KWLBASE.MACCT=KWXUCCDATE.WA-
       CCT AND KWXUCCDATE.KXID=''UCC_DATE''';
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
       if (lntype <> '');
        whrclause = %trim(whrclause) + whrlink + 'MPROD like ''' + %trim(
       lntype) + '%''';
        whrlink = ' and';
       endif;
       if (lntype = '');
        whrclause = %trim(whrclause) + whrlink + 'MPROD = ''''';
        whrlink = ' and';
       endif;
       if (dlrcode <> '');
        whrclause = %trim(whrclause) + whrlink + ' MDLR = ''' + %trim(
       dlrcode) + '''';
        whrlink = ' and';
       endif;
       if (((dlrcode1 <> '') and (dlrcode2 <> '')));
        whrclause = %trim(whrclause) + whrlink + ' MDLR * 1 >= ''' + %trim(
       dlrcode1) + ''' and ' + 'MDLR * 1 <= ''' + %trim(dlrcode2) + '''';
        whrlink = ' and';
       endif;
       if (alphdatece <> '');
        ww_date1 = AlpToDate_(alphdatece:'*USA');
        whrclause = %trim(whrclause) + whrlink + ' MQDATE = DATE ''' + %trim(
        %char(ww_date1:*ISO)) + '''';
        whrlink = ' and';
       endif;
       if (((alphdate1ce <> '') and (alphdate2ce <> '')));
        ww_date1 = AlpToDate_(alphdate1ce:'*USA');
        ww_date2 = AlpToDate_(alphdate2ce:'*USA');
        whrclause = %trim(whrclause) + whrlink + ' MQDATE >= DATE ''' +
       %trim( %char(ww_date1:*ISO)) + ''' AND MQDATE <= DATE ''' + %trim(
       %char(ww_date2:*ISO)) + '''';
        whrlink = ' and';
       endif;
       if (alphdaterv <> '');
        ww_date1 = AlpToDate_(alphdaterv:'*USA');
        whrclause = %trim(whrclause) + whrlink + ' MLDATE = DATE ''' + %trim(
        %char(ww_date1:*ISO)) + ''' AND MCBAL = 0';
        whrlink = ' and';
       endif;
       if (((alphdate1rv <> '') and (alphdate2rv <> '')));
        ww_date1 = AlpToDate_(alphdate1rv:'*USA');
        ww_date2 = AlpToDate_(alphdate2rv:'*USA');
        whrclause = %trim(whrclause) + whrlink + ' MLDATE >= DATE ''' +
       %trim( %char(ww_date1:*ISO)) + ''' AND MLDATE <= DATE ''' + %trim(
       %char(ww_date2:*ISO)) + ''' AND MCBAL = 0';
        whrlink = ' and';
       endif;
       if ( %trim(state) <> '');
        whrclause = %trim(whrclause) + whrlink + ' MST = ''' + %trim(state)
       + '''';
        whrlink = ' and';
       endif;
       if (((oloan <> '') and (cloan <> '')));
        whrclause = %trim(whrclause) + whrlink + ' (MSTAT = ''O'' or MSTAT = -
       ''C'')';
        whrlink = ' and';
       endif;
       if (((oloan = '') and (cloan = '')));
        whrclause = %trim(whrclause) + whrlink + ' MSTAT = ''''';
        whrlink = ' and';
       endif;
       if (((oloan <> '') and (cloan = '')));
        whrclause = %trim(whrclause) + whrlink + ' MSTAT = ''' + %trim(oloan)
        + '''';
        whrlink = ' and';
       endif;
       if (((cloan <> '') and (oloan = '')));
        whrclause = %trim(whrclause) + whrlink + ' MSTAT = ''' + %trim(cloan)
        + '''';
        whrlink = ' and';
       endif;
       whrclause = %trim(whrclause) + whrlink + ' MCHGOF = ''' + 'N' + '''';
       whrlink = ' and';
       selstring = %trim(selstring) + ' ' + whrclause;
       curpage = getparm2_('page':'*OPT');
       ordby = getparm2_('ordby':'*OPT');
       if (ordby <> '');
        select;
        when (ww_ordby = ordby and %dec(aton_(ww_pagea:30:9):30:9) = %dec(
       aton_(curpage:30:9):30:9));
        if (ww_orddir = 'A');
         ww_orddir = 'D';
        else;
         ww_orddir = 'A';
        endif;
        when (ww_ordby = ordby and %dec(aton_(ww_pagea:30:9):30:9) <> %dec(
       aton_(curpage:30:9):30:9));
        ww_ordby = ordby;
        when (ww_ordby <> ordby);
        ww_ordby = ordby;
        ww_orddir = 'A';
        endsl;
       else;
        if (ww_orddir = '');
         ww_orddir = 'A';
        endif;
       endif;
       if (ww_ordby = 'MFMTACCT');
        if (ww_orddir = 'D');
         ww_ordby = 'MCUST DESC, MACCT';
        else;
         ww_ordby = ' MCUST,MACCT';
        endif;
       endif;
       if (ww_ordby = '');
        ww_ordby = 'MBR, MPROD, MLNAME, MFNAME';
        selstring = %trim(selstring) + ' order by ' + ww_ordby;
       else;
        selstring = %trim(selstring) + ' order by MPROD,' + %trim(ww_ordby);
       endif;
       if (ww_orddir = 'D');
        selstring = %trim(selstring) + ' DESC';
       endif;
      /end-free
     c     *PSSR         begsr
     c                   endsr
     P bldselstr0      E


     P*---------------------------------------------------------------------
     P* bldcntstr0                  - User defined function
     P*---------------------------------------------------------------------
     P bldcntstr0      B
     D bldcntstr0      PI




      /free
       selstring = 'SELECT COUNT(KWLBASE.MCUST) FROM KWLBASE inner join KWCDA-
       TA on KWLBASE.MCUST = KWCDATA.CCUST inner join KWPPBASE on KWLBASE.MPR-
       OD = KWPPBASE.PPROD';
       whrclause = '';
       whrlink = ' where';
       if (ww_floc <> '');
        whrclause = %trim(whrclause) + whrlink + ' MBR = ''' + %trim(ww_floc)
        + '''';
        whrlink = ' and';
       endif;
       if (lntype <> '');
        whrclause = %trim(whrclause) + whrlink + 'MPROD like ''' + %trim(
       lntype) + '%''';
        whrlink = ' and';
       endif;
       if (lntype = '');
        whrclause = %trim(whrclause) + whrlink + 'MPROD = ''''';
        whrlink = ' and';
       endif;
       if (alphdatece <> '');
        ww_date1 = AlpToDate_(alphdatece:'*USA');
        whrclause = %trim(whrclause) + whrlink + ' MQDATE = DATE ''' + %trim(
        %char(ww_date1:*ISO)) + '''';
        whrlink = ' and';
       endif;
       if (((alphdate1ce <> '') and (alphdate2ce <> '')));
        ww_date1 = AlpToDate_(alphdate1ce:'*USA');
        ww_date2 = AlpToDate_(alphdate2ce:'*USA');
        whrclause = %trim(whrclause) + whrlink + ' MQDATE >= DATE ''' +
       %trim( %char(ww_date1:*ISO)) + ''' AND MQDATE <= DATE ''' + %trim(
       %char(ww_date2:*ISO)) + '''';
        whrlink = ' and';
       endif;
       if (alphdaterv <> '');
        ww_date1 = AlpToDate_(alphdaterv:'*USA');
        whrclause = %trim(whrclause) + whrlink + ' MLDATE = DATE ''' + %trim(
        %char(ww_date1:*ISO)) + '''';
        whrlink = ' and';
       endif;
       if (((alphdate1rv <> '') and (alphdate2rv <> '')));
        ww_date1 = AlpToDate_(alphdate1rv:'*USA');
        ww_date2 = AlpToDate_(alphdate2rv:'*USA');
        whrclause = %trim(whrclause) + whrlink + ' MLDATE >= DATE ''' +
       %trim( %char(ww_date1:*ISO)) + ''' AND MLDATE <= DATE ''' + %trim(
       %char(ww_date2:*ISO)) + '''';
        whrlink = ' and';
       endif;
       if (dlrcode <> '');
        whrclause = %trim(whrclause) + whrlink + ' MDLR = ''' + %trim(
       dlrcode) + '''';
        whrlink = ' and';
       endif;
       if (((dlrcode1 <> '') and (dlrcode2 <> '')));
        whrclause = %trim(whrclause) + whrlink + ' MDLR * 1 >= ''' + %trim(
       dlrcode1) + ''' and ' + 'MDLR * 1 <= ''' + %trim(dlrcode2) + '''';
        whrlink = ' and';
       endif;
       if ( %trim(state) <> '');
        whrclause = %trim(whrclause) + whrlink + ' MST = ''' + %trim(state)
       + '''';
        whrlink = ' and';
       endif;
       if (((oloan <> '') and (cloan <> '')));
        whrclause = %trim(whrclause) + whrlink + ' (MSTAT = ''O'' or MSTAT = -
       ''C'')';
        whrlink = ' and';
       endif;
       if (((oloan = '') and (cloan = '')));
        whrclause = %trim(whrclause) + whrlink + ' MSTAT = ''''';
        whrlink = ' and';
       endif;
       if (((oloan <> '') and (cloan = '')));
        whrclause = %trim(whrclause) + whrlink + ' MSTAT = ''' + %trim(oloan)
        + '''';
        whrlink = ' and';
       endif;
       if (((cloan <> '') and (oloan = '')));
        whrclause = %trim(whrclause) + whrlink + ' MSTAT = ''' + %trim(cloan)
        + '''';
        whrlink = ' and';
       endif;
       whrclause = %trim(whrclause) + whrlink + ' MCHGOF = ''' + 'N' + '''';
       whrlink = ' and';
       selstring = %trim(selstring) + ' ' + whrclause;
      /end-free
     c     *PSSR         begsr
     c                   endsr
     P bldcntstr0      E


     P*---------------------------------------------------------------------
     P* fetchrel0                   - User defined function
     P*---------------------------------------------------------------------
     P fetchrel0       B
     D fetchrel0       PI




      /free

      /end-free
     C/Exec SQL
     C+  FETCH RELATIVE :nx  FROM MC INTO :rrn, :MCUST, :MSTAT, :MQDATE, :MMDATE
     C+ , :MLDATE, :ICNA1, :MFMTACCT, :MDLR, :MPROD, :MODATE, :MPMT, :MCBAL, :MR
     C+ ATE, :MDDATE, :MLDATE, :MLPMT, :PPDESC, :UCC_FILED, :UCC_DATE
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
     C+  FETCH NEXT FROM MC INTO :rrn, :MCUST, :MSTAT, :MQDATE, :MMDATE, :MLDATE
     C+ , :ICNA1, :MFMTACCT, :MDLR, :MPROD, :MODATE, :MPMT, :MCBAL, :MRATE, :MDD
     C+ ATE, :MLDATE, :MLPMT, :PPDESC, :UCC_FILED, :UCC_DATE
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
       oloan = getparm2_('oloan':'*OPT');
       cloan = getparm2_('cloan':'*OPT');
       dlrcode = getparm2_('dlrcode':'*OPT');
       dlrcode1 = getparm2_('dlrcode1':'*OPT');
       dlrcode2 = getparm2_('dlrcode2':'*OPT');
       alphdatece = getparm2_('alphdatece':'*OPT');
       alphdate1ce = getparm2_('alphdate1ce':'*OPT');
       alphdate2ce = getparm2_('alphdate2ce':'*OPT');
       alphdaterv = getparm2_('alphdaterv':'*OPT');
       alphdate1rv = getparm2_('alphdate1rv':'*OPT');
       alphdate2rv = getparm2_('alphdate2rv':'*OPT');
       state = getparm2_('state':'*OPT');
       lntype = getparm2_('lntype[1][]':'*OPT');
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
     P* statebox0                   - User defined function
     P*---------------------------------------------------------------------
     P statebox0       B
     D statebox0       PI




      /free
       boxtype = 'SYSTEM';
       p_ztype = 'STATECODE';
       boxname = 'state';
       boxid = 'state';
       boxselect = state;
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
     P statebox0       E


     P*---------------------------------------------------------------------
     P* orddirbox0                  - User defined function
     P*---------------------------------------------------------------------
     P orddirbox0      B
     D orddirbox0      PI




      /free
       orddir = getparm2_('orddir':'*OPT');
       OutWeb_('<select name="orddir" id="orddir" onchange="">');
       OutWeb_('<option value=""></option>');
       if (orddir = 'ASC');
        OutWeb_('<option selected value="ASC">Ascending</option>');
       else;
        OutWeb_('<option value="ASC">Ascending</option>');
       endif;
       if (orddir = 'DESC');
        OutWeb_('<option selected value="DESC">Descending</option>');
       else;
        OutWeb_('<option  value="DESC">Descending</option>');
       endif;
       OutWeb_('</select>');
      /end-free
     c     *PSSR         begsr
     c                   endsr
     P orddirbox0      E


     P*---------------------------------------------------------------------
     P* dlrbox0                     - User defined function
     P*---------------------------------------------------------------------
     P dlrbox0         B
     D dlrbox0         PI




      /free
       dlrcode = getparm2_('dlrcode':'*OPT');
       selstring = 'SELECT PDNO, PDNAME FROM KWPDBASE ORDER BY PDNO * 1 ASC F-
       OR FETCH ONLY';
      /end-free
     C/Exec SQL
     C+            Declare DLR Scroll Cursor
     C+            For DLR
     C/End-Exec
     C/Exec SQL
     C+            Prepare DLR
     C+            From :selstring
     C/End-Exec
      /free
       if (sqlcod >= 0);
      /end-free
     C/Exec SQL
     C+            Open DLR
     C/End-Exec
      /free
       endif;
      /end-free
     C/Exec SQL
     C+  FETCH NEXT FROM DLR INTO :PDNO, :PDNAME
     C/End-Exec
      /free
       OutWeb_('<select name="DLRCODE" id="DLRCODE" onchange="clear_range();"-
       >');
       OutWeb_('<option value="">All</option>');
       dow (((SQLCOD <> 100) and (SQLCOD >= 0)));
       if (dlrcode = pdno);
        OutWeb_('<option selected value="');
        OutWeb_(%trimr(pdno));
        OutWeb_('">');
        OutWeb_(%trimr(pdno));
        OutWeb_('</option>');
       else;
        OutWeb_('<option value="');
        OutWeb_(%trimr(pdno));
        OutWeb_('">');
        OutWeb_(%trimr(pdno));
        OutWeb_('</option>');
       endif;
      /end-free
     C/Exec SQL
     C+  FETCH NEXT FROM DLR INTO :PDNO, :PDNAME
     C/End-Exec
      /free
       enddo;
       OutWeb_('</select>');
      /end-free
     C/Exec SQL
     C+  close DLR
     C/End-Exec
      /free
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
       CURISOD__ = %date();
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
       if   ((file__='KWCADDR' or file__='*ALL') and NOT %OPEN(KWCADDR));
        if   (mbr__ <>'*FIRST');
         ovrdbf_(ovrflag__:'KWCADDR':'KWCADDR' : '*LIBL' : mbr__);
        endif;
        if    erropen__ = 'Y';
         OPEN(E) KWCADDR;                //    KWCADDR
         if        %error;
          return %error;
         endif;
        else;
         OPEN KWCADDR;                //    KWCADDR
        endif;
       endif;
       if   ((file__='KWLAPPL' or file__='*ALL') and NOT %OPEN(KWLAPPL));
        if   (mbr__ <>'*FIRST');
         ovrdbf_(ovrflag__:'KWLAPPL':'KWLAPPL' : '*LIBL' : mbr__);
        endif;
        if    erropen__ = 'Y';
         OPEN(E) KWLAPPL;                //    KWLAPPL
         if        %error;
          return %error;
         endif;
        else;
         OPEN KWLAPPL;                //    KWLAPPL
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
**CTDATA H__1        ListHeader                       11061
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
    <link rel="stylesheet" type="text/css" href="/we
bsmart/kwikloan/styles/jquery-ui.css" />
    <script type="text/javascript" src=
"/websmart/kwikloan/javascript/klscripts.js"></script>
    <script type="text/ja
vascript" src="https://www.google.com/jsapi"></script>
    <script type="text/ja
vascript" src="/k_dealer/jq/172.js" ></script>
    <script type="text/javascript
">
		 google.load("jqueryui", "1.7.2");
 	 	google.setOnLoadCallback(function()
{
         $("#alphdatece").datepicker({dateFormat: 'mm/dd/yy'})
 	 	 $("#alphda
te1ce").datepicker({dateFormat: 'mm/dd/yy'})
 	 	 $("#alphdate2ce").datepicker({
dateFormat: 'mm/dd/yy'})
 	 	  $("#alphdaterv").datepicker({dateFormat: 'mm/dd/y
y'})
 	 	 $("#alphdate1rv").datepicker({dateFormat: 'mm/dd/yy'})
 	 	 $("#alphda
te2rv").datepicker({dateFormat: 'mm/dd/yy'})
 	 	  
 	 });
 	 
 	 $(document).re
ady(function(){
 	 	
 	 	//default oloan checke
			
			$("#clrfilt").click(funct
ion(){
 	 		$("#DLRCODE").val("");
 	 		$("#dlrcode1").val('');
 	 		$("#dlrcode
2").val('');
 	 		$("#alphdatece").val('');
 	 		$("#alphdate1ce").val('');
 	 	
	$("#alphdate2ce").val('');
 	 		$("#alphdaterv").val('');
 	 		$("#alphdate1rv"
).val('');
 	 		$("#alphdate2rv").val('');
 	 		$("#state").val('');
 	 			
 	 	
});
 	 	 	$("input:checkbox.radio").click(function ()
		{
			if ($(this).is(":ch
ecked") == true)
			{
				var group = "input:checkbox[name='" + $(this).attr("na
me") + "']";
				$(group).attr("checked", false);
				$(this).attr("checked", tr
ue);
			}
			else
			{
				$(this).is(":checked", false);
			}
		}
		);
 	 	$("#
celoan, #rvloan").click(
 	 		function()
 	 		{
 	 			if ($("#celoan").prop("che
cked") == true && $("#rvloan").prop("checked") == false)
 	 				$("#cedate").css
("display", "");
 	 			else
 	 				$("#cedate").css("display", "none");	
 	 				

 	 			if ($("#rvloan").prop("checked") == true && $("#celoan").prop("checked")
== false)
 	 				$("#rvdate").css("display", "");
 	 			else
 	 				$("#rvdate")
.css("display", "none");	
 	 		}
 	 		);
 	 		
 	
 	 		
 	 }); //doc.ready
 	 

	 function clear_range()
 	 {
 	 $("#dlrcode1").val('');
 	 $("#dlrcode2").val('
');	 		
 	 }
 	 
 	 function clear_dlrbox()
 	 {
 	 $("#DLRCODE").val('');	
 	 	

 	 }
 	 
 	 function clear_cedaterange()
 	 {
 	 $("#alphdate1ce").val('');
 	
$("#alphdate2ce").val('');
 	 	
 	 }
 	 
 	  function clear_rvdaterange()
 	 {

	 $("#alphdate1rv").val('');
 	 $("#alphdate2rv").val('');
 	 	
 	 }
 	 
 	 func
tion clear_cedate()
 	 {
 	 $("#alphdatece").val('');	
 	 	
 	 }
 	 
 	  functio
n clear_rvdate()
 	 {
 	 $("#alphdaterv").val('');	
 	 	
 	 }
 	 
 	 function on
load_handler()
 	 {
 	 	
 	 
 	 	
 	 if ($("#lntype1").val() == "RV")
 	 	$("#rv
loan").prop("checked", true);
 	 	
 	 if ($("#lntype1").val() == "CE")
 	 	$("#c
eloan").prop("checked", true);
 	 	
 	 	if ($("#rvloan").prop("checked") == fals
e && $("#celoan").prop("checked") == true)
 	 		$("#cedate").css("display", "");

 	 	else
			$("#cedate").css("display", "none");
			
		if ($("#celoan").prop("c
hecked") == false && $("#rvloan").prop("checked") == true)
 	 		$("#rvdate").css
("display", "");
 	 	else
			$("#rvdate").css("display", "none");
 	 
 	 if ($("
#oloan1").val() == "O")
 	 	$("#oloan").prop("checked", true);
 	 	
 	 if ($("#c
loan1").val() == "C")
 	 	$("#cloan").prop("checked", true);
 	 	
 	if ($("#oloa
n").prop("checked") != true && $("#cloan").prop("checked") != true)
 	 		$("#olo
an").attr("checked", true);
 	 		
 	 		
 	 $("#oloan, #cloan").click(function()

 	 {
 	 if ($("#oloan").prop("checked") != true && $("#cloan").prop("checked") !
= true)
 	 	$(this).attr("checked", true);
	});
 	 	
 	 //filters
 	 if ($("#sor
t1").val() == "MST")
 	 	$("#stsort").attr("checked", "checked");
 	 	
 	if ($("
#sort1").val() == "MCUST")
 	 	$("#cnsort").attr("checked", "checked");
 	 	
 	
if ($("#sort1").val() == "MLNAME, MFNAME")
 	 	$("#bnsort").attr("checked", "che
cked");
 	 	
 	 if ($("#sort1").val() == "MFMTACCT")	
 	 	$("#lnsort").attr("che
cked", "checked");
 	 
 	 
 	 }
 	 </script>
    <style type="text/css">
    

  #report_buttons
    {
    text-align: right;	
    float: right;
    }
    

 #report_buttons img
    {
    width: 20px;
    }	
    .altcolm1
    {
    backg
round-color:#D3F5F5;	
    
    }
    .altcolm2
    {
    background-color:white;
	
    
    }
    
    </style>
    
    
  </head>
  <body onload="onload_handle
r();">
    
    <div id="wrapping">
      <div id="everything">
        

 
        <div id="pagetitle">
          <span>Paid Off / Paid In Full Report</s
pan>
        </div>
        
        <div id="whitebg" style="">
          <div
id="EDITtitle"><span>Search Criteria</span><span class="ShowHideText"><a href="#
" onclick="toggledispA();">Click to expand or contract this area</a></span></div
>
          <div id="EDITcontents">
            
            
            <form
action="" method="POST">
              <input type="hidden" name="task" value="f
ilter">
              <table class="keys" id="showhideA" style="width:100%">

             <tr>
                  <th width="20%">
                  </th>

               <th width="80%">
                  </th>
                  

           </tr>
                <!--CE/RV checkboxes-->
                <tr>

                <input type="hidden" name="lntype1" id="lntype1" value="">

             <td class="left">Loan Type</td><td class="right">Installment &nbsp;
&nbsp;<input type="checkbox" class="radio" name="lntype[1][]" id="celoan" value=
"CE"> Revolving&nbsp;&nbsp;<input type="checkbox" class="radio" name="lntype[1][
]" id="rvloan" value="RV"></td>
                </tr>
                <!-- Open/
Closed checkboxes-->
                <tr>
                  <input type="hidden"
 name="oloan1" id="oloan1" value="">
                  <input type="hidden" name
="cloan1" id="cloan1" value="">
                  <td class="left">Loan Status</
td><td class="right">Open &nbsp;&nbsp;<input type="checkbox" name="oloan" id="ol
oan" value="O"> Closed&nbsp;&nbsp;<input type="checkbox" name="cloan" id="cloan"
 value="C"></td>
                </tr>
                <!--Dealer Codes - selbox
-->
                <tr>
                  <td class="left">Dealer Code</td><td
class="right"> &nbsp;&nbsp;Dealer Range: <input type="text" onfocus="clear_dlrbo
x();" name="dlrcode1" id="dlrcode1" value=""> <input type ="text" onfocus="clear
_dlrbox();" name="dlrcode2" id="dlrcode2" value=""></td>
                </tr>

               <!--CE Closed Date Range-->
                <tr id="cedate" style
="display:none">
                  <td class="left">Loan Closed Date: </td>

              <td class="right" style="width:300px">
                    Single
Date: <input type="text" name="alphdatece" id="alphdatece" onfocus="clear_cedate
range();" value="">  &nbsp; &nbsp;
                    Date Range: <input type="
text" name="alphdate1ce" id="alphdate1ce" onfocus="clear_cedate();" value=""> &n
bsp;<input type="text" onfocus="clear_cedate();" name="alphdate2ce" id="alphdate
2ce" value="">												
                  </td>
                </tr>

         <!--RV Paid off Date Range-->
                <tr id="rvdate" style="di
splay:none">
                  <td class="left">Paid Off Date: </td>

       <td class="right" style="width:300px">
                    Single Date: <
input type="text" name="alphdaterv" id="alphdaterv" onfocus="clear_rvdaterange()
;" value="">  &nbsp; &nbsp;
                    Date Range: <input type="text" n
ame="alphdate1rv" id="alphdate1rv" onfocus="clear_rvdate();" value=""> &nbsp;<in
put type="text" onfocus="clear_rvdate();" name="alphdate2rv" id="alphdate2rv" va
lue="">												
                  </td>
                </tr>

  <tr>
                  <td class="left">State:</td><td class="right">&nbsp;&nb
sp;&nbsp;
                    <input type="submit" id="srch" value="Search">&nbs
p;&nbsp;&nbsp;<input type="button" value="Clear Filters" id="clrfilt"></td>

            </tr>
                <!--Sorting Options-->
                

          
              </table>
            </form>
          </div><!--editco
ntents-->
        </div><!--whitebg-->
        
        <div id="whitebg" style=
"width:95%;">
          <div id="EDITtitle" style="width:98%"><span>Search Resul
ts</span><span class="ShowHideText"></div>
            <div id="contents" style=
"width:100%;">
              
              <!-- Katie Bateman - modified listto
pcontrol to make room for spreadsheet and print buttons -->
              <div i
d="listtopcontrol" style="width: 50%; white-space: nowrap;">
                <!-
-Leif Perry--paging functionality-->
                <form action="" method="POS
T">
                  <a id="prevlinktop" class="" href="?page=&rnd=&ordby="><im
g src="/websmart/v7.2/Idaho/images/arrow_left.gif" style="border: none; vertical
-align:middle;" /></a>
                  <a id="nextlinktop" class="" href="?pag
e=&rnd=&ordby="><img src="/websmart/v7.2/Idaho/images/arrow_right.gif" style="bo
rder: none; vertical-align:middle;"  /></a>
                  <input type="hidde
n" name="task" value="DEFAULT">
                  Page <input type="text" name="
page" id="page" value="" size="1" maxlength="2"> of 
                  <input ty
pe="hidden" name="ordby" value="">
                  <input type="hidden" name="
pagemax" value="">
                  <input type="submit" value="Go">

      </form>
                
              </div> 
              

  <!-- Katie Bateman - added div for print buttons -->
              <div id="re
port_buttons">
                <!--Excel button; will add back in later-->

           <a href="?spreadsheet=Y" target="_blank"><img src="/websmart/kwikloan
/images/icons/excel_icon.jpg" style="border: none;" /></a>
                <a hr
ef="?print=Y" target="_blank"><img src="/websmart/kwikloan/images/icons/printdoc
uments.png" style="border: none;" /></a>
                
              </div>

             
              <table class="mainlist" id="mainTab" style="width:75
%;">

**CTDATA H__2        SubHeader                        728
<tr>
  <td class="breakhead" colspan="11">
	Loan Product: 
  </td>
</tr>
<tr>  

  <th style="white-space:nowrap" class="first"><a href="?ordby=MFMTACCT&rnd=&pag
e=">Loan Number</a></th>
  <th style="white-space:nowrap"><a href="?ordby=MLNAME
&rnd=&page=">Customer Name</a></th>
  <th style="white-space:nowrap">Street/City
</th>
  <th style="white-space:nowrap"><a href="?ordby=MST&rnd=&page=">State/Zip
</a></th>
  <th style="white-space:nowrap">Loan Status</th>
  <th>Funded Date<br
>Maturity Date</th>
  <th width="30">Last <br>Pmt<br> Amt</th>
  <th style="whit
e-space:nowrap">Closed Date</th>
  <th width="120">Date Paid In Full<br>#Days Pa
id in Full</th>
  <th>Dealer Code<br>Dealer Name</th>
  <th>UCC Filed<br>Date</t
h>
</tr>
**CTDATA H__3        ListDetails                      621
<tr class="">
  
  
  <td style="white-space:nowrap" class="first"></td>
  <td s
tyle="white-space:nowrap"></td>
  <td style="white-space:nowrap"> , </td> <!--st
reet, city -->
  <td style="white-space:nowrap">  </td> <!-- state, zip-->
  <td
 style="white-space:nowrap"></td> <!--loan status-->
  <td style="white-space:no
wrap"><br></td> <!--Open Date-->
  <td style="white-space:nowrap"></td>
  <td st
yle="white-space:nowrap"></td>
  <td style="white-space:nowrap"><br></td> <!--de
aler code-->
  <td style="white-space:nowrap"><br></td> <!--dealer name-->
  <td
 class="last">
  	
  	
  </td><!-- UCC Information -->
</tr>

**CTDATA H__4        SubTotal                         386
<tr class="subtotal"><td class="breakhead first last" colspan="11">
Sub-totals f
or 
</td></tr>
<tr class="subtotal_val">
<td class="first"></td>
<td></td>
<td><
/td>
<td></td>
<td></td>
<td></td>
<td </td>
<td></td>
<td></td>
<td class="text
 right">Loan Count: </td>
<td class="right text last">Sub-Total Loan Balance:  <
/td>
</tr>
<tr class="blank">
	<td colspan="11">&nbsp;</td>
</tr>

**CTDATA H__5        ListFooter                       809
</table>
<div id="listbottomcontrol">
        <a id="prevlinkbot" class="prevlin
k nondisp" href="?page=&rnd=&ordby="><img src="/websmart/v7.2/Idaho/images/arrow
_left.gif" style="border: none;" /></a>
        
        <a id="nextlinkbot" cla
ss="nextlink nondisp" href="?page=&rnd=&ordby="><img src="/websmart/v7.2/Idaho/i
mages/arrow_right.gif" style="border: none;" /></a>
</div>
</div><!--contents-->

</div><!-- whitebg-->

</div><!--everything-->
</div><!--wrapping-->

<script t
ype="text/javascript">
	// Control display of Prev and Next links
	if( > 0)
	{
	
	xl_GetObj("prevlinktop").className ="prevlink";
		xl_GetObj("prevlinkbot").clas
sName ="prevlink";
	}
	if( != 100)
	{
		xl_GetObj("nextlinktop").className ="nex
tlink";
		xl_GetObj("nextlinkbot").className ="nextlink";
	}
</script>

</body>

</html>


**CTDATA H__6        Totals                           388
<tr class="subtotal"><td class="breakhead first last" colspan="11">
Totals
</td>
</tr>
<tr class="subtotal_val">
<td class="first"></td>
<td></td>
<td></td>
<td>
</td>
<td></td>
<td></td>
<td class="text right">Total Loan Count: </td>
<td </t
d>
<td></td>
<td class="right text">Total Loan Balance:  </td>
<td class="last">
 </td>
</tr>
<tr class="blank">
	<td colspan="11">&nbsp;</td>
</tr>

**CTDATA H__7        xlHeader                         3246
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
Swiss" ss:Size="8"/>
</Style>


</Styles>
<Worksheet ss:Name="Loan Register">
<T
able x:FullColumns="1" x:FullRows="1">


<Column ss:Index="1" ss:AutoFitWidth="1
" ss:Width="200"/>
<Column ss:Index="2" ss:AutoFitWidth="1" ss:Width="100"/>
<Co
lumn ss:Index="3" ss:AutoFitWidth="1" ss:Width="100"/>
<Column ss:Index="4" ss:A
utoFitWidth="1" ss:Width="100"/>
<Column ss:Index="5" ss:AutoFitWidth="1" ss:Wid
th="100"/>
<Column ss:Index="6" ss:AutoFitWidth="1" ss:Width="100"/>
<Column ss:
Index="7" ss:AutoFitWidth="1" ss:Width="100"/>
<Column ss:Index="8" ss:AutoFitWi
dth="1" ss:Width="100"/>
<Column ss:Index="9" ss:AutoFitWidth="1" ss:Width="100"
/>
<Column ss:Index="10" ss:AutoFitWidth="1" ss:Width="100"/>
<Column ss:Index="
11" ss:AutoFitWidth="1" ss:Width="100"/>
<Column ss:Index="12" ss:AutoFitWidth="
1" ss:Width="100"/>

<Row ss:AutoFitHeight="0" ss:Height="15.75">
<Cell ss:Style
ID="s21"><Data ss:Type="String">Loan Number</Data></Cell>
<Cell ss:StyleID="s21"
><Data ss:Type="String">Customer Name</Data></Cell>
<Cell ss:StyleID="s21"><Data
 ss:Type="String">Street/City</Data></Cell>
<Cell ss:StyleID="s21"><Data ss:Type
="String">State/Zip</Data></Cell>
<Cell ss:StyleID="s21"><Data ss:Type="String">
Loan Status</Data></Cell>
<Cell ss:StyleID="s21"><Data ss:Type="String">Funded D
ate</Data></Cell>
<Cell ss:StyleID="s21"><Data ss:Type="String">Maturity Date</D
ata></Cell>
<Cell ss:StyleID="s21"><Data ss:Type="String">Last Pmt Amt</Data></C
ell>
<Cell ss:StyleID="s21"><Data ss:Type="String">Closed Date</Data></Cell>
<Ce
ll ss:StyleID="s21"><Data ss:Type="String">Date Paid in Full</Data></Cell>
<Cell
 ss:StyleID="s21"><Data ss:Type="String"># Days Paid In Full</Data></Cell>
<Cell
 ss:StyleID="s21"><Data ss:Type="String">Dealer Code</Data></Cell>
<Cell ss:Styl
eID="s21"><Data ss:Type="String">Dealer Name</Data></Cell>
<Cell ss:StyleID="s21
"><Data ss:Type="String">UCC Filed</Data></Cell>
<Cell ss:StyleID="s21"><Data ss
:Type="String">UCC Date</Data></Cell>
</Row>


**CTDATA H__8        xlDetails                        1025
<Row>
<Cell ss:StyleID="kwik_data"><Data ss:Type="String"></Data></Cell>
<Cell s
s:StyleID="kwik_data"><Data ss:Type="String"></Data></Cell>
<Cell ss:StyleID="kw
ik_data"><Data ss:Type="String"> , </Data></Cell>
<Cell ss:StyleID="kwik_data"><
Data ss:Type="String"> </Data></Cell>
<Cell ss:StyleID="kwik_data"><Data ss:Type
="String"></Data></Cell>
<Cell ss:StyleID="kwik_data"><Data ss:Type="String"></D
ata></Cell>
<Cell ss:StyleID="kwik_data"><Data ss:Type="String"></Data></Cell>
<
Cell ss:StyleID="kwik_data"><Data ss:Type="String"></Data></Cell>
<Cell ss:Style
ID="kwik_data"><Data ss:Type="String"></Data></Cell>
<Cell ss:StyleID="kwik_data
"><Data ss:Type="String"></Data></Cell>
<Cell ss:StyleID="kwik_data"><Data ss:Ty
pe="String"></Data></Cell>
<Cell ss:StyleID="kwik_data"><Data ss:Type="String"><
/Data></Cell>
<Cell ss:StyleID="kwik_data"><Data ss:Type="String"></Data></Cell>

<Cell ss:StyleID="kwik_data"><Data ss:Type="String"></Data></Cell>
<Cell ss:Sty
leID="kwik_data"><Data ss:Type="String"></Data></Cell>
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

**CTDATA H__10       printHeader                      1195
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.or
g/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>
    <meta name="genera
tor" content="WebSmart" />
    <meta http-equiv="Pragma" content="no-cache" />

   <title>WebSmart Report</title>
    <link rel="stylesheet" type="text/css" hre
f="/websmart/kwikloan/styles/print.css"  title="default" media="print,screen"/>


    <script type="text/javascript" src="/websmart/kwikloan/javascript/klscripts
.js"></script>

<style type="text/css">
	    .altcolm1
    {
    background-colo
r:#D3F5F5;	
    
    }
    .altcolm2
    {
    background-color:white;	
    

 }
    td
    {
    	text-align:center;
    }
    </style>

    
  </head>
  <bo
dy onload="">

    <div id="wrapping">
  <div id="everything">
  <b>Filters Used
</b> <br>
  
  
  
  
  
  
  <!--date ranges-->
  
  
  
   
  

  
  
  <div i
d="pagetitle">
  	<span style="margin-left:-10%">Paid Off / Paid in Full Report<
/span>
  	
  	
  </div>
  
  	<input type="button" value="Print" id="print_btn"
onclick="window.print();" />
      
      <div id="whitebg">

    <div id="conte
nts">
      
      
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


**CTDATA H__12       RtnToList                        66
<button onClick="javascript:location.href='?page=;'">Back</button>

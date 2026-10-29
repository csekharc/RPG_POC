     H/TITLE  WebSmart Report
      * ProGen WebSmart Revision 28963
      * File overrides for compile command
      *__OV OVRDBF KWLBASE    KWLBASE
      *__OV OVRDBF KWCDATA    KWCDATA
      *__OV OVRDBF KWPPBASE   KWPPBASE
      *__OV OVRDBF KWPDBASE   KWPDBASE
      *__OV OVRDBF DS_GETNAME DS_GETNAME
      *__   Following values are used to create the server program
      *__RO Pgm  lib DEVWEBSMT  Pgm  R_LNREG
      *__AG          WEBSMART
      *__CL          *OBJLIBNAM
      *__SQ
      *__BD ECRTBND204
      *===============================================================*
      * Path:   r_lnreg.pdw
      * System: RAJASHEKAR
      * Project:Kwik-Loan
      * Set:    Dev Websmart
      * User:   rajashekhar.battu
      * Date Last Generated:   2020-07-07   13:38:50
      * Last Generated CRC: 85A4CC37 9223D196 52BAA144 BDFD5558
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

     D PTL__           S             50    DIM(1) CTDATA PERRCD(1)
     D RTLLA__         S             11    DIM(180)

     D*+FLDDCL Field declarations

     Duserdata         DS                  INZ
     D client                         5A
     D userid                        32A
     D location                       5A
     Dcustnameds     E DS                  EXTNAME(ds_getname   ) INZ
     Dwbstrpt_         DS                  INZ
     D ww_orddir                      1A
     D ww_ordby                      64A
     D ww_pagea                       5A
     D ww_floc                       10A
     D ww_fprod                      25A
     D ww_fdlr                       25A

     D spreadsheet     S              1A
     D print           S              1A
     D setlibraryflag  S              1A
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
     D listsize        S              5P 0
     D rnd             S              5P 0
     D total           S              7P 0
     D tmpdta          S          32000A   varying
     D header          S            500A
     D x               S              5P 0
     D rcdcnt          S              9P 0
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


     D H__1            S             80    PERRCD(1) CTDATA DIM(47          )

     D H__2            S             80    PERRCD(1) CTDATA DIM(3           )

     D H__3            S             80    PERRCD(1) CTDATA DIM(19          )

     D H__4            S             80    PERRCD(1) CTDATA DIM(1           )

     D H__5            S             80    PERRCD(1) CTDATA DIM(6           )

     D H__6            S             80    PERRCD(1) CTDATA DIM(5           )

     D H__7            S             80    PERRCD(1) CTDATA DIM(38          )

     D H__8            S             80    PERRCD(1) CTDATA DIM(10          )

     D H__9            S             80    PERRCD(1) CTDATA DIM(5           )

     D H__10           S             80    PERRCD(1) CTDATA DIM(12          )

     D H__11           S             80    PERRCD(1) CTDATA DIM(2           )

     D H__12           S             80    PERRCD(1) CTDATA DIM(2           )

     D H__13           S             80    PERRCD(1) CTDATA DIM(10          )


     D* File info DS for each file
     D FID001_         DS
     D  RR_001_              397    400B 0
     D FID002_         DS
     D  RR_002_              397    400B 0
     D FID003_         DS
     D  RR_003_              397    400B 0
     D FID004_         DS
     D  RR_004_              397    400B 0


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

     D display0...
     D                 PR
     D count0...
     D                 PR
     D bldpage0...
     D                 PR
     D bldselstr0...
     D                 PR
     D fetchrel0...
     D                 PR
     D fetchnext0...
     D                 PR
     D filter0...
     D                 PR
     D locbox0...
     D                 PR
     D QPGM__          S             21A
     D LstPmlErr_      S              4P 0 IMPORT
     D prodbox0...
     D                 PR
     D dlrbox0...
     D                 PR
     D QPGMNAM__       S             20A
     D SmurfChk__      S              1A   INZ(*ON)
     D Smurf_ID__      S             64A   IMPORT
     D Smurf_Rw__      S              9B 0 IMPORT

     D tmprate         S                   LIKE(mprocd        )
     D prevpage        S                   LIKE(pagenum       )
     D nextpage        S                   LIKE(pagenum       )
     D tmpprod         S                   LIKE(mprod         )
     D query           S                   LIKE(selstring     )
     D tmcbal          S                   LIKE(mcbal         )
     D tmpmt           S                   LIKE(mpmt          )
     D tmlpmt          S                   LIKE(mlpmt         )

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

     C     DL004_        KLIST
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
       spreadsheet = getparm3_('spreadsheet':'*OPT');
       print = getparm3_('print':'*OPT');
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
       setlibraryflag = 'N';
       setlibraryflag = rtmwrpa_('WEBSMART':'KWDB108':setlibraryflag:'*NOLOCK-
       ':'GET');
       if (setlibraryflag = 'Y');
        ExecCmd2_('ADDLIBLE QGPL':%len(%trimr('ADDLIBLE QGPL')));
        ExecCmd2_( 'KWSET ' + %trim(client):%len(%trimr( 'KWSET ' + %trim(
       client))));
       endif;
       Open_File_('*ALL': '*FIRST':  'Y');
       security = kw_security(userid:'R_LNREG.PGM');
       if (security = '0');
        if (setlibraryflag = 'Y');
         ExecCmd2_('CHGLIBL LIBL(QTEMP QGPL)':%len(%trimr('CHGLIBL LIBL(QTEMP-
        QGPL)')));
        endif;
        Redirect2_('dash.pgm':'*SAME');
        return ;
       endif;
       WBSTRPT_ = getcookie2_('WBSTRPT_state');
       if (task__ = 'DEFAULT');
        taskran__ = *ON;
        display0();
       endif ;
       if (task__ = 'FILTER');
        taskran__ = *ON;
        filter0();
       endif ;

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
     P* display0...                 - User defined function
     P*---------------------------------------------------------------------
     P display0...
     P                 B
     D display0...
     D                 PI




      /free
       ww_floc = rplstr_(ww_floc:%trim(''''):%trim('_'));
       ww_fprod = rplstr_(ww_fprod:%trim(''''):%trim('_'));
       pagenum = %dec(aton_( getparm3_('page':'*OPT'):46:16):5:0);
       if (pagenum = 0);
        pagenum = 1;
       endif;
       prevpage = pagenum - 1;
       nextpage = pagenum + 1;
       nx = ( ( ( pagenum - 1) * listsize) + 1);
       bldselstr0();
       count0();
       ww_pagea = %trim(%editc(pagenum:'P'));
       Setcookie_('WBSTRPT_state':WBSTRPT_:'*TEMP':'/':'*HOST':'0':'0');
       bldpage0();
      /end-free
     c     *PSSR         begsr
     c                   endsr
     P                 E


     P*---------------------------------------------------------------------
     P* count0...                   - User defined function
     P*---------------------------------------------------------------------
     P count0...
     P                 B
     D count0...
     D                 PI




      /free
       query = 'select count(*), sum(mpmt), sum(mcbal), sum(mlpmt) from kwlba-
       se ' + %trim(whrclause);
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
     C+  fetch next from cnt into :rcdcnt, :tmpmt, :tmcbal, :tmlpmt
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
     P                 E


     P*---------------------------------------------------------------------
     P* bldpage0...                 - User defined function
     P*---------------------------------------------------------------------
     P bldpage0...
     P                 B
     D bldpage0...
     D                 PI




      /free
       if (spreadsheet = 'Y');
        listsize = 9999;
        header = 'application/vnd.ms-excel'+x'25'+' Content-Disposition: inli-
       ne; filename="' +
        %trim(PGMNAME__) + '.xls"';
        HTTPHEADERS__ = %trim( 'Content-Type: ' + header) + x'15' + %trim(
       HTTPHEADERS__);
        SetPipe_('*ON':2000000:'*DFT');
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
        outweb_(%subst(%str(%addr(H__7(1))):1:2206));
        if (((client <> '107') and (client <> '907')));
         OutWeb_('<Column ss:Index="12" ss:AutoFitWidth="1" ss:Width="100"/>');
        endif;
        outweb_(%subst(%str(%addr(H__7(28))):47:250));
        if (((client <> '107') and (client <> '907')));
         OutWeb_('<Cell ss:StyleID="s21"><Data ss:Type="String">Product</Data-
       ></Cell>');
        endif;
        outweb_(%subst(%str(%addr(H__7(31))):57:569));
       else;
        if (print = 'Y');
         outweb_(%subst(%str(%addr(H__10(1))):1:960));
        else;
         outweb_(%subst(%str(%addr(H__1(1))):1:1755));
         wfrtn__ = AfToPage_(QPGMNAM__);
         outweb_(%subst(%str(%addr(H__1(22))):76:233));
         locbox0();
         outweb_(%subst(%str(%addr(H__1(25))):69:160));
         prodbox0();
         outweb_(%subst(%str(%addr(H__1(27))):69:188));
         dlrbox0();
         outweb_(%subst(%str(%addr(H__1(30))):17:669));
         wfrtn__ = AfToPage_(QPGMNAM__);
         outweb_(%subst(%str(%addr(H__1(38))):46:6));
         AfToPage_(%trim(%editc(PREVPAGE:'X')));
         outweb_(%subst(%str(%addr(H__1(38))):52:5));
         AfToPage_(%trim(%editc(RND:'X')));
         outweb_(%subst(%str(%addr(H__1(38))):57:153));
         wfrtn__ = AfToPage_(QPGMNAM__);
         outweb_(%subst(%str(%addr(H__1(40))):50:6));
         AfToPage_(%trim(%editc(NEXTPAGE:'X')));
         outweb_(%subst(%str(%addr(H__1(40))):56:5));
         AfToPage_(%trim(%editc(RND:'X')));
         outweb_(%subst(%str(%addr(H__1(40))):61:578));
        endif;
       endif;
       x = 1;
       fetchrel0();
       dow (((((SQLCOD <> 100)) and ((SQLCOD >= 0)) and ((x <= listsize)))));
      /end-free
     C/Exec SQL
     C+  select cname into :ICNA1 from table(FN_GetName(:mcust, :macct))
     C/End-Exec
      /free
       if (tmpprod <> mprod);
        if (spreadsheet <> 'Y');
         outweb_(%subst(%str(%addr(H__5(1))):1:58));
         wfrtn__ = AfToPage_(PPDESC);
         outweb_(%subst(%str(%addr(H__5(1))):59:100));
         if (((client <> '107') and (client <> '907')));
          OutWeb_('<th width="100">Product</th>');
         endif;
         outweb_(%subst(%str(%addr(H__5(2))):79:311));
        endif;
       endif;
       tmprate = mrate;
       if (spreadsheet = 'Y');
        outweb_(%subst(%str(%addr(H__8(1))):1:58));
        wfrtn__ = AfToPage_(ICNA1);
        outweb_(%subst(%str(%addr(H__8(1))):59:67));
        wfrtn__ = AfToPage_(MFMTACCT);
        outweb_(%subst(%str(%addr(H__8(2))):46:67));
        wfrtn__ = AfToPage_(MDLR);
        outweb_(%subst(%str(%addr(H__8(3))):33:15));
        if (((client <> '107') and (client <> '907')));
         OutWeb_('<Cell ss:StyleID="kwik_data"><Data ss:Type="String">');
         OutWeb_( %trim(mprod));
         OutWeb_('</Data></Cell>');
        endif;
        outweb_(%subst(%str(%addr(H__8(3))):48:53));
        wfrtn__ = AfToPage_(%char(MODATE));
        outweb_(%subst(%str(%addr(H__8(4))):21:67));
        AfToPage_(%trim(%editc(MNOPMT:'Z')));
        outweb_(%subst(%str(%addr(H__8(5))):8:66));
        AfToPage_(%trim(%editc(MPMT:'N')));
        outweb_(%subst(%str(%addr(H__8(5))):74:66));
        AfToPage_(%trim(%editc(MCBAL:'N')));
        outweb_(%subst(%str(%addr(H__8(6))):60:67));
        AfToPage_(%trim(%editc(TMPRATE:'3')));
        outweb_(%subst(%str(%addr(H__8(7))):47:67));
        wfrtn__ = AfToPage_(%char(MDDATE: *USA));
        outweb_(%subst(%str(%addr(H__8(8))):34:67));
        wfrtn__ = AfToPage_(%char(MLDATE: *USA));
        outweb_(%subst(%str(%addr(H__8(9))):21:66));
        AfToPage_(%trim(%editc(MLPMT:'N')));
        outweb_(%subst(%str(%addr(H__8(10))):7:22));
       else;
        Flip_Rc_();
        outweb_(%subst(%str(%addr(H__2(1))):1:11));
        wfrtn__ = AfToPage_(ARCLR__);
        outweb_(%subst(%str(%addr(H__2(1))):12:26));
        wfrtn__ = AfToPage_(ICNA1);
        outweb_(%subst(%str(%addr(H__2(1))):38:12));
        wfrtn__ = AfToPage_(MFMTACCT);
        outweb_(%subst(%str(%addr(H__2(1))):50:8));
        if (((client <> '107') and (client <> '907')));
         OutWeb_('<td>');
         OutWeb_(%trimr( %trim(mprod)));
         OutWeb_('</td>');
        endif;
        outweb_(%subst(%str(%addr(H__2(1))):58:9));
        wfrtn__ = AfToPage_(MDLR);
        outweb_(%subst(%str(%addr(H__2(1))):67:12));
        wfrtn__ = AfToPage_(%char(MODATE));
        outweb_(%subst(%str(%addr(H__2(1))):79:12));
        AfToPage_(%trim(%editc(MNOPMT:'Z')));
        outweb_(%subst(%str(%addr(H__2(2))):11:12));
        AfToPage_(%trim(%editc(MPMT:'J')));
        outweb_(%subst(%str(%addr(H__2(2))):23:12));
        AfToPage_(%trim(%editc(MCBAL:'J')));
        outweb_(%subst(%str(%addr(H__2(2))):35:12));
        AfToPage_(%trim(%editc(TMPRATE:'3')));
        outweb_(%subst(%str(%addr(H__2(2))):47:12));
        wfrtn__ = AfToPage_(%char(MDDATE: *USA));
        outweb_(%subst(%str(%addr(H__2(2))):59:12));
        wfrtn__ = AfToPage_(%char(MLDATE: *USA));
        outweb_(%subst(%str(%addr(H__2(2))):71:25));
        AfToPage_(%trim(%editc(MLPMT:'J')));
        outweb_(%subst(%str(%addr(H__2(3))):16:15));
       endif;
       x = x + 1;
       tmpprod = mprod;
       fetchnext0();
       if (tmpprod <> mprod);
        if (print = 'Y');
         outweb_(%subst(%str(%addr(H__6(1))):1:79));
         wfrtn__ = AfToPage_(PPDESC);
         outweb_(%subst(%str(%addr(H__6(1))):80:82));
         if (((client <> '107') and (client <> '907')));
          OutWeb_('<td></td>');
         endif;
         outweb_(%subst(%str(%addr(H__6(3))):2:63));
         AfToPage_(%trim(%editc(TOTAL:'J')));
         outweb_(%subst(%str(%addr(H__6(3))):65:120));
        endif;
       endif;
       enddo;
       if (print = 'Y');
        outweb_(%subst(%str(%addr(H__6(1))):1:79));
        wfrtn__ = AfToPage_(PPDESC);
        outweb_(%subst(%str(%addr(H__6(1))):80:82));
        if (((client <> '107') and (client <> '907')));
         OutWeb_('<td></td>');
        endif;
        outweb_(%subst(%str(%addr(H__6(3))):2:63));
        AfToPage_(%trim(%editc(TOTAL:'J')));
        outweb_(%subst(%str(%addr(H__6(3))):65:120));
       endif;
       if (spreadsheet <> 'Y');
        Flip_Rc_();
        outweb_(%subst(%str(%addr(H__12(1))):1:11));
        wfrtn__ = AfToPage_(ARCLR__);
        outweb_(%subst(%str(%addr(H__12(1))):12:44));
        AfToPage_(%trim(%editc(RCDCNT:'3')));
        outweb_(%subst(%str(%addr(H__12(1))):56:17));
        if (((client = '107') or (client = '907')));
         OutWeb_('<td colspan="3">');
        else;
         OutWeb_('<td colspan="4">');
        endif;
        outweb_(%subst(%str(%addr(H__12(1))):73:12));
        AfToPage_(%trim(%editc(TMPMT:'J')));
        outweb_(%subst(%str(%addr(H__12(2))):5:12));
        AfToPage_(%trim(%editc(TMCBAL:'J')));
        outweb_(%subst(%str(%addr(H__12(2))):17:38));
        AfToPage_(%trim(%editc(TMLPMT:'J')));
        outweb_(%subst(%str(%addr(H__12(2))):55:12));
       else;
        if (spreadsheet = 'Y');
         outweb_(%subst(%str(%addr(H__13(1))):1:66));
         AfToPage_(%trim(%editc(RCDCNT:'3')));
         outweb_(%subst(%str(%addr(H__13(1))):67:226));
         if (((client <> '107') and (client <> '907')));
          OutWeb_('<Cell ss:StyleID="kwik_data"><Data ss:Type="String"></Data-
       ></Cell>');
         endif;
         outweb_(%subst(%str(%addr(H__13(4))):53:119));
         AfToPage_(%trim(%editc(TMPMT:'N')));
         outweb_(%subst(%str(%addr(H__13(6))):12:66));
         AfToPage_(%trim(%editc(TMCBAL:'N')));
         outweb_(%subst(%str(%addr(H__13(6))):78:267));
         AfToPage_(%trim(%editc(TMLPMT:'N')));
         outweb_(%subst(%str(%addr(H__13(10))):25:21));
        endif;
       endif;
       if (spreadsheet = 'Y');
        outweb_(%subst(%str(%addr(H__9(1))):1:383));
       else;
        if (print = 'Y');
         outweb_(%subst(%str(%addr(H__11(1))):1:149));
        else;
         outweb_(%subst(%str(%addr(H__3(1))):1:97));
         wfrtn__ = AfToPage_(QPGMNAM__);
         outweb_(%subst(%str(%addr(H__3(2))):18:6));
         AfToPage_(%trim(%editc(PREVPAGE:'X')));
         outweb_(%subst(%str(%addr(H__3(2))):24:5));
         AfToPage_(%trim(%editc(RND:'X')));
         outweb_(%subst(%str(%addr(H__3(2))):29:153));
         wfrtn__ = AfToPage_(QPGMNAM__);
         outweb_(%subst(%str(%addr(H__3(4))):22:6));
         AfToPage_(%trim(%editc(NEXTPAGE:'X')));
         outweb_(%subst(%str(%addr(H__3(4))):28:5));
         AfToPage_(%trim(%editc(RND:'X')));
         outweb_(%subst(%str(%addr(H__3(4))):33:292));
         AfToPage_(%trim(%editc(PREVPAGE:'P')));
         outweb_(%subst(%str(%addr(H__3(8))):5:116));
         AfToPage_(%trim(%editc(SQLCOD:'P')));
         outweb_(%subst(%str(%addr(H__3(9))):41:593));
         wfrtn__ = AfToPage_(QPGMNAM__);
         outweb_(%subst(%str(%addr(H__3(16))):74:15));
         outweb_(%subst(%str(%addr(H__3(17))):9:9));
         AfToPage_(%trim(%editc(PAGENUM:'X')));
         outweb_(%subst(%str(%addr(H__3(17))):18:173));
        endif;
       endif;
      /end-free
     C/Exec SQL
     C+  close MC
     C/End-Exec
      /free
       if (spreadsheet = 'Y');
        SetPipe_('*OFF':1000000:'*DFT');
        tmpdta = GetPipeDta_(32000:'*DFT');
        dow ( %len(%trimr(tmpdta))> 0);
        tmpdta = tranapi_(tmpdta: '*CUSTOM': 37: 819);
        OutWeb_(tmpdta);
        tmpdta = GetPipeDta_(32000:'*DFT');
        enddo;
       endif;
      /end-free
     c     *PSSR         begsr
     c                   endsr
     P                 E


     P*---------------------------------------------------------------------
     P* bldselstr0...               - User defined function
     P*---------------------------------------------------------------------
     P bldselstr0...
     P                 B
     D bldselstr0...
     D                 PI




      /free
       selstring = 'SELECT RRN(KWLBASE), KWLBASE.MCUST, KWLBASE.MACCT, KWLBAS-
       E.MFMTACCT, KWLBASE.MPROD, KWLBASE.MODATE, KWLBASE.MNOPMT, KWLBASE.MPM-
       T, KWLBASE.MCBAL, KWLBASE.MRATE, KWLBASE.MDDATE, KWLBASE.MLDATE, KWLBA-
       SE.MLPMT, ifnull(KWPPBASE.PPDESC, ''''), KWLBASE.MDLR FROM KWLBASE lef-
       t join KWPPBASE on KWLBASE.MPROD = KWPPBASE.PPROD';
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
       whrclause = %trim(whrclause) + whrlink + ' MSTAT = ''' + 'O' + '''';
       whrlink = ' and';
       whrclause = %trim(whrclause) + whrlink + ' MCHGOF = ''' + 'N' + '''';
       whrlink = ' and';
       selstring = %trim(selstring) + ' ' + whrclause;
       ordby = getparm3_('ordby':'*OPT');
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
       selstring = %trim(selstring) + ' order by ' + ww_ordby;
       if (ww_orddir = 'D');
        selstring = %trim(selstring) + ' DESC';
       endif;
      /end-free
     c     *PSSR         begsr
     c                   endsr
     P                 E


     P*---------------------------------------------------------------------
     P* fetchrel0...                - User defined function
     P*---------------------------------------------------------------------
     P fetchrel0...
     P                 B
     D fetchrel0...
     D                 PI




      /free

      /end-free
     C/Exec SQL
     C+  FETCH RELATIVE :nx  FROM MC INTO :rrn, :MCUST, :MACCT, :MFMTACCT, :MPRO
     C+ D, :MODATE, :MNOPMT, :MPMT, :MCBAL, :MRATE, :MDDATE, :MLDATE, :MLPMT, :P
     C+ PDESC, :MDLR
     C/End-Exec
      /free
      /end-free
     c     *PSSR         begsr
     c                   endsr
     P                 E


     P*---------------------------------------------------------------------
     P* fetchnext0...               - User defined function
     P*---------------------------------------------------------------------
     P fetchnext0...
     P                 B
     D fetchnext0...
     D                 PI




      /free

      /end-free
     C/Exec SQL
     C+  FETCH NEXT FROM MC INTO :rrn, :MCUST, :MACCT, :MFMTACCT, :MPROD, :MODAT
     C+ E, :MNOPMT, :MPMT, :MCBAL, :MRATE, :MDDATE, :MLDATE, :MLPMT, :PPDESC, :M
     C+ DLR
     C/End-Exec
      /free
      /end-free
     c     *PSSR         begsr
     c                   endsr
     P                 E


     P*---------------------------------------------------------------------
     P* filter0...                  - User defined function
     P*---------------------------------------------------------------------
     P filter0...
     P                 B
     D filter0...
     D                 PI




      /free
       ww_floc = getparm3_('ww_floc':'*OPT');
       ww_fprod = getparm3_('ww_fprod':'*OPT');
       ww_fdlr = getparm3_('ww_fdlr':'*OPT');
       display0();
      /end-free
     c     *PSSR         begsr
     c                   endsr
     P                 E


     P*---------------------------------------------------------------------
     P* locbox0...                  - User defined function
     P*---------------------------------------------------------------------
     P locbox0...
     P                 B
     D locbox0...
     D                 PI




      /free
       p_ztype = 'KWPLBASE';
       boxname = 'ww_fLOC';
       boxid = 'ww_fLOC';
       boxselect = ww_floc;
      /end-free
     C                   EVAL      QPGM__=%trim('KWWEB'     ) + '/' + 'SELBOX4'
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
     P                 E


     P*---------------------------------------------------------------------
     P* prodbox0...                 - User defined function
     P*---------------------------------------------------------------------
     P prodbox0...
     P                 B
     D prodbox0...
     D                 PI




      /free
       p_ztype = 'KWPPBASE';
       boxname = 'ww_fPROD';
       boxid = 'ww_fPROD';
       boxselect = ww_fprod;
      /end-free
     C                   EVAL      QPGM__=%trim('KWWEB'     ) + '/' + 'SELBOX4'
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
     P                 E


     P*---------------------------------------------------------------------
     P* dlrbox0...                  - User defined function
     P*---------------------------------------------------------------------
     P dlrbox0...
     P                 B
     D dlrbox0...
     D                 PI




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
       SETLL  DL004_ RKWPDBASE;
       RS004_ = RcdSts2_('POSRCD':%error:%equal:%eof);
       READ(NE)  RKWPDBASE;
       RS004_ = RcdSts2_('GETNXTRCD':%error:%found:%eof);
       AM004_ = CV_ByKey;
       dow (RS004_ = '1');
       OutWeb_('<option value="');
       OutWeb_(%trimr(pdno));
       OutWeb_('"');
       if (ww_fdlr = pdno);
        OutWeb_(' selected');
       endif;
       OutWeb_('>');
       OutWeb_(%trimr(pdno));
       OutWeb_('</option>');
       READ(NE)  RKWPDBASE;
       RS004_ = RcdSts2_('GETNXTRCD':%error:%found:%eof);
       AM004_ = CV_ByKey;
       enddo;
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

      /end-free
      /free
       QPGMNAM__=%trim(PGMNAME__) + '.pgm';

       // Initialize library list array for current job to find files
       rtlla__(1) = 'KWDB';
       rtlla__(2) = 'KWDB108';

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
       if   ((file__='KWLBASE' or file__='*ALL') and NOT %OPEN(KWLBASE));
        if (mbr__ <> '*FIRST');
         ovrdbf_(ovrflag__:'KWLBASE':'KWLBASE' : '*LIBL' : mbr__);
        elseif ('KWLBASE' <> 'KWLBASE');
         ovrdbf_(ovrflag__:'KWLBASE':'KWLBASE' : '*LIBL');
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
        if (mbr__ <> '*FIRST');
         ovrdbf_(ovrflag__:'KWCDATA':'KWCDATA' : '*LIBL' : mbr__);
        elseif ('KWCDATA' <> 'KWCDATA');
         ovrdbf_(ovrflag__:'KWCDATA':'KWCDATA' : '*LIBL');
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
        if (mbr__ <> '*FIRST');
         ovrdbf_(ovrflag__:'KWPPBASE':'KWPPBASE' : '*LIBL' : mbr__);
        elseif ('KWPPBASE' <> 'KWPPBASE');
         ovrdbf_(ovrflag__:'KWPPBASE':'KWPPBASE' : '*LIBL');
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
WebSmart Report
**CTDATA H__1        ListHeader                       3758
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.or
g/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>
    <meta name="genera
tor" content="WebSmart" />
    <meta http-equiv="Pragma" content="no-cache" />

   <title>WebSmart Report</title>
	<link rel="stylesheet" type="text/css" href="
/websmart/kwikloan/styles/klDFtheme.css" media="screen, tv, projection" title="d
efault"/>
    <link rel="alternate stylesheet" type="text/css" href="/websmart/k
wikloan/styles/klBStheme.css" media="screen, tv, projection" title="bluesky"/>

   <link rel="alternate stylesheet" type="text/css" href="/websmart/kwikloan/sty
les/klRDtheme.css" media="screen, tv, projection" title="reddevil"/>
    <link r
el="alternate stylesheet" type="text/css" href="/websmart/kwikloan/styles/klOCth
eme.css" media="screen, tv, projection" title="orangecrush"/>
        <link rel=
"stylesheet" type="text/css" href="/websmart/kwikloan/styles/klstylei.css" media
="screen, tv, projection" />
    <script type="text/javascript" src="/websmart/k
wikloan/javascript/klscripts.js"></script>
    <script type="text/javascript" sr
c="/websmart/kwikloan/javascript/klthemes.js"></script>

	<style type="text/css"
>
	
	#report_buttons
	{
		text-align: right;	
		float: right;
	}
	
	#report_butt
ons img
	{
		width: 20px;
	}	
	
	</style>

    
  </head>
  <body onload="onload
_handler();">

    <div id="wrapping">
  <div id="everything">
  
  
  <div id="
pagetitle">
  	<span>Loan Register Report</span>
  </div>
  
  <div id="whitebg"
>
   	<div id="EDITtitle"><span>Search Criteria</span><span class="ShowHideText"
><a href="#" onclick="toggledispA();">Click to expand or contract this area</a><
/span></div>
    <div id="EDITcontents">
      
      
      <form action="" met
hod="POST">
        <input type="hidden" name="task" value="filter">
        <ta
ble class="keys" id="showhideA">
          <tr>
            <td class="left">Loc
ation</td>
             <td class="right">
												
												
											
	
											</td>
          </tr>
          <tr>
            <td class="left">P
roduct</td>
            <td class="right">
												
												
											
	
											</td>
          </tr>
           <tr>
                  <td class="
left">Dealer</td>
                  <td class="right">
                    

                
                    
                  </td>
                </
tr>
                
          <tr>
            <td class="left">&nbsp;</td><td
class="right"><input type="submit" value="Filter"></td>
          </tr>

</table>
      </form>
      </div><!--editcontents-->
      </div><!--whitebg--
>
      
      <div id="whitebg">
      <div id="EDITtitle"><span>Search Results
</span><span class="ShowHideText"></div>
    <div id="contents">
      
      <!
-- Katie Bateman - modified listtopcontrol to make room for spreadsheet and prin
t buttons -->
      <div id="listtopcontrol" style="width: 50%;">
        <a id=
"prevlinktop" class="prevlink nondisp" href="?page=&rnd="><img src="/websmart/v7
.2/Idaho/images/arrow_left.gif" style="border: none;" /></a>
        
        <a
 id="nextlinktop" class="nextlink nondisp" href="?page=&rnd="><img src="/websmar
t/v7.2/Idaho/images/arrow_right.gif" style="border: none;" /></a>
      </div> 

      
      <!-- Katie Bateman - added div for print buttons -->
      <div id=
"report_buttons">
       <a id="xlLink" href="?spreadsheet=Y" target="_blank"><i
mg src="/websmart/kwikloan/images/icons/excel_icon.jpg" style="border: none;" />
</a>
                <a id="printLink" href="?print=Y" target="_blank"><img src=
"/websmart/kwikloan/images/icons/printdocuments.png" style="border: none;" /></a
>
                
      </div>
      
      <table class="mainlist">

**CTDATA H__2        ListDetails                      190
<tr class="">
  
  <td class="first"></td>
  <td></td>
  
    <td></td>
  <td></
td>
  <td></td>
  <td></td>
  <td></td>
  <td></td>
  <td></td>
  <td></td>
  <t
d class="last"></td>
  
</tr>

**CTDATA H__3        ListFooter                       1470
</table>
<div id="listbottomcontrol">
        <a id="prevlinkbot" class="prevlin
k nondisp" href="?page=&rnd="><img src="/websmart/v7.2/Idaho/images/arrow_left.g
if" style="border: none;" /></a>
        
        <a id="nextlinkbot" class="nex
tlink nondisp" href="?page=&rnd="><img src="/websmart/v7.2/Idaho/images/arrow_ri
ght.gif" style="border: none;" /></a>
</div>
</div><!--contents-->
</div><!-- wh
itebg-->

</div><!--everything-->
<div id="everything"></div>
</div><!--wrapping
-->

<script type="text/javascript">
	// Control display of Prev and Next links

	if( > 0)
	{
		xl_GetObj("prevlinktop").className ="prevlink";
		xl_GetObj("prev
linkbot").className ="prevlink";
	}
	if( != 100)
	{
		xl_GetObj("nextlinktop").c
lassName ="nextlink";
		xl_GetObj("nextlinkbot").className ="nextlink";
	}
</scr
ipt>
<script type="text/javascript" src="/websmart/kwikloan/javascript/1.6.1.min
.js"></script>
<script type="text/javascript">
	function bldLinks()
	{
		var flo
c = document.getElementById('ww_fLOC').value;
		var fprod =	document.getElementB
yId('ww_fPROD').value;
	
		
		$('#printLink').attr("href","?print=Y&ww_floc="+fl
oc+"&ww_fprod="+fprod+"");
		$('#xlLink').attr("href","?spreadsheet=Y&ww_floc="+
floc+"&ww_fprod="+fprod+"");
		
		//jQuery(".prevlinktop").attr("href", "?task=p
rev&rrn=&pagenum=");
	}
	//run bldLinks on page load (in case they filter once a
nd the dates they choose return automatically into the input fields)
	bldLinks()
;
</script>

</body>
</html>


**CTDATA H__4        RtnToList                        66
<button onClick="javascript:location.href='?page=;'">Back</button>
**CTDATA H__5        SubHeader                        469
<tr><td class="breakhead" colspan="11">
    Loan Product: 
  </td></tr>
<tr>
  

  <th width="150" class="first">Name</th>
  <th width="200">Account No</th>
  

 <th width="100">Dealer</th>
  <th width="800">Loan Date</th>
  <th width="100">
# of Pmts</th>
  <th width="100">Pmt Amount</th>
  <th width="800">Balance</th>

  <th width="800">Rate</th>
  <th width="800">Due Date</th>
  <th width="800">La
st Pmt Date</th>
  <th width="800">Last Pmt Amt</th>
  
 
  
</tr>



**CTDATA H__6        SubTotal                         344
<tr class="subtotal"><td class="breakhead first last" colspan="11">
Totals for 

</td></tr>
<tr class="subtotal_val">
<td class="first"></td>
<td></td>
<td></td>


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

**CTDATA H__7        xlHeader                         3025
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
<Alignment ss:Horizontal="Center" ss:Vertical="Bottom" ss:WrapText="
1"/>
<Font x:Family="Swiss" ss:Bold="1"/>
</Style>


<Style ss:ID="style1">
<Ali
gnment ss:Vertical="Bottom" ss:WrapText="0"/>
<Font ss:Size="10" ss:Bold="1" />

</Style>

<Style ss:ID="style2">
<Alignment ss:Vertical="Bottom" ss:WrapText="0"
/>
<Font ss:Size="10" ss:Italic="1" ss:Bold="1" />
</Style>

<Style ss:ID="kwik_
data">
<Alignment ss:Vertical="Bottom" ss:Horizontal="Right" ss:WrapText="0"/>
<
Font x:Family="Swiss" ss:Size="8"/>
</Style>

<Style ss:ID="Currency">
<NumberFo
rmat ss:Format="Currency" />
</Style>


</Styles>
<Worksheet ss:Name="Loan Regis
ter">
<Table x:FullColumns="1" x:FullRows="1">


<Column ss:Index="1" ss:AutoFit
Width="1" ss:Width="200"/>
<Column ss:Index="2" ss:AutoFitWidth="1" ss:Width="10
0"/>
<Column ss:Index="3" ss:AutoFitWidth="1" ss:Width="100"/>
<Column ss:Index=
"4" ss:AutoFitWidth="1" ss:Width="100"/>
<Column ss:Index="5" ss:AutoFitWidth="1
" ss:Width="100"/>
<Column ss:Index="6" ss:AutoFitWidth="1" ss:Width="50"/>
<Col
umn ss:Index="7" ss:AutoFitWidth="1" ss:Width="100"/>
<Column ss:Index="8" ss:Au
toFitWidth="1" ss:Width="100"/>
<Column ss:Index="9" ss:AutoFitWidth="1" ss:Widt
h="100"/>
<Column ss:Index="10" ss:AutoFitWidth="1" ss:Width="50"/>
<Column ss:I
ndex="11" ss:AutoFitWidth="1" ss:Width="50"/>


<Row ss:AutoFitHeight="0" ss:Hei
ght="15.75">
<Cell ss:StyleID="s21"><Data ss:Type="String">Name</Data></Cell>
<C
ell ss:StyleID="s21"><Data ss:Type="String">Account No</Data></Cell>
<Cell ss:St
yleID="s21"><Data ss:Type="String">Dealer</Data></Cell>

<Cell ss:StyleID="s21">
<Data ss:Type="String">Loan Date</Data></Cell>
<Cell ss:StyleID="s21"><Data ss:T
ype="String"># of Pmts</Data></Cell>
<Cell ss:StyleID="s21"><Data ss:Type="Strin
g">Pmt Amount</Data></Cell>
<Cell ss:StyleID="s21"><Data ss:Type="String">Balanc
e</Data></Cell>
<Cell ss:StyleID="s21"><Data ss:Type="String">Rate</Data></Cell>

<Cell ss:StyleID="s21"><Data ss:Type="String">Due Date</Data></Cell>
<Cell ss:S
tyleID="s21"><Data ss:Type="String">Last Pmt Date</Data></Cell>
<Cell ss:StyleID
="s21"><Data ss:Type="String">Last Pmt Amt</Data></Cell>
</Row>


**CTDATA H__8        xlDetails                        748
<Row>
<Cell ss:StyleID="kwik_data"><Data ss:Type="String"></Data></Cell>
<Cell s
s:StyleID="kwik_data"><Data ss:Type="String"></Data></Cell>
<Cell ss:StyleID="kw
ik_data"><Data ss:Type="String"></Data></Cell>

<Cell ss:StyleID="kwik_data"><Da
ta ss:Type="String"></Data></Cell>
<Cell ss:StyleID="kwik_data"><Data ss:Type="N
umber"></Data></Cell>
<Cell ss:StyleID="Currency"><Data ss:Type="Number"></Data>
</Cell>
<Cell ss:StyleID="Currency"><Data ss:Type="Number"></Data></Cell>
<Cell
ss:StyleID="kwik_data"><Data ss:Type="String"></Data></Cell>
<Cell ss:StyleID="k
wik_data"><Data ss:Type="String"></Data></Cell>
<Cell ss:StyleID="kwik_data"><Da
ta ss:Type="String"></Data></Cell>
<Cell ss:StyleID="Currency"><Data ss:Type="Nu
mber"></Data></Cell>
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


**CTDATA H__12       totals                           146
<tr class="">
  
  <td class="first">Totals</td>
  <td> accounts</td>
  </td>

<td></td>
  <td></td>
  <td colspan="3"></td>  
  <td></td>
</tr>

**CTDATA H__13       xlTotals                         765
<Row>
<Cell ss:StyleID="style1"><Data ss:Type="String">Totals for  accounts:</Da
ta></Cell>
<Cell ss:StyleID="kwik_data"><Data ss:Type="String"></Data></Cell>
<C
ell ss:StyleID="kwik_data"><Data ss:Type="String"></Data></Cell>
<Cell ss:StyleI
D="kwik_data"><Data ss:Type="String"></Data></Cell>

<Cell ss:StyleID="kwik_data
"><Data ss:Type="String"></Data></Cell>
<Cell ss:StyleID="Currency"><Data ss:Typ
e="Number"></Data></Cell>
<Cell ss:StyleID="Currency"><Data ss:Type="Number"></D
ata></Cell>
<Cell ss:StyleID="kwik_data"><Data ss:Type="String"></Data></Cell>
<
Cell ss:StyleID="kwik_data"><Data ss:Type="String"></Data></Cell>
<Cell ss:Style
ID="kwik_data"><Data ss:Type="String"></Data></Cell>
<Cell ss:StyleID="Currency"
><Data ss:Type="Number"></Data></Cell>
</Row>

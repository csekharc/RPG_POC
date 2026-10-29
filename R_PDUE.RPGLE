     H/TITLE  WebSmart Report
      * ProGen WebSmart Revision 21923
      * File overrides for compile command
      *__OV OVRDBF KWLBASE    KWLBASE
      *__OV OVRDBF KWCDATA    KWCDATA
      *__OV OVRDBF KWSQUE     KWSQUE
      *__OV OVRDBF KWLQUE     KWLQUE
      *__OV OVRDBF KWPDBASE   KWPDBASE
      *__   Following values are used to create the server program
      *__RO Pgm  lib KWWEB      Pgm  R_PDUE
      *__AG          WEBSMART
      *__CL          *OBJLIBNAM
      *__SQ
      *__BD ECRTBND195
      *===============================================================*
      * Path:   r_pdue.pdw
      * System: MBERGMANN-LENOV
      * Project:Kwik-Loan
      * Set:    Development
      * User:   Jacob
      * Date Last Generated:   2017-01-13   12:03:07
      * Last Generated CRC: 4F488D7B 735C1AF0 4D910B8D 787FBE25
      *===============================================================*
      */CPY *LIBL/PW_CSRC CPYRIGHT
      * File specifications
     FKWLBASE   IF   E           K DISK    USROPN
     F                                     INFDS(FID001_   )
     FKWCDATA   IF   E           K DISK    USROPN
     F                                     INFDS(FID002_   )
     FKWSQUE    IF   E           K DISK    USROPN
     F                                     INFDS(FID003_   )
     FKWLQUE    IF   E           K DISK    USROPN
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
     Dpduerpt_         DS                  INZ
     D ww_orddir                      1A
     D ww_ordby                      64A
     D ww_pagea                       5A
     D ww_floc                       10A
     D ww_fqueue                     25A

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
     D listsize        S              5P 0
     D rnd             S              5P 0
     D ww_fdlr         S             25A
     D total           S              7P 0
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
     D pgsizelm__      S              9P 0 IMPORT('PGSIZELM')

     D Up__            C                   'ABCDEFGHIJKLMNOPQRSTUVWXYZ'
     D Lo__            C                   'abcdefghijklmnopqrstuvwxyz'

     D arclr__         S              8A
     D rwcolor1__      S             32A   INZ('altcol1')
     D rwcolor2__      S             32A   INZ('altcol2')


     D TASKRAN__       S              1    INZ(*OFF)


     D H__1            S             80    PERRCD(1) CTDATA DIM(62          )

     D H__2            S             80    PERRCD(1) CTDATA DIM(3           )

     D H__3            S             80    PERRCD(1) CTDATA DIM(18          )

     D H__4            S             80    PERRCD(1) CTDATA DIM(1           )

     D H__5            S             80    PERRCD(1) CTDATA DIM(7           )

     D H__6            S             80    PERRCD(1) CTDATA DIM(5           )

     D H__7            S             80    PERRCD(1) CTDATA DIM(40          )

     D H__8            S             80    PERRCD(1) CTDATA DIM(11          )

     D H__9            S             80    PERRCD(1) CTDATA DIM(5           )

     D H__10           S             80    PERRCD(1) CTDATA DIM(12          )

     D H__11           S             80    PERRCD(1) CTDATA DIM(2           )


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
     D HTTPHEADERS__   S           4096A   import

     D display0...
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
     D quebox0...
     D                 PR
     D dlrbox0...
     D                 PR
     D QPGMNAM__       S             20A
     D SmurfChk__      S              1A   INZ(*ON)
     D Smurf_ID__      S             64A   IMPORT
     D Smurf_Rw__      S              9B 0 IMPORT

     D subtsqdesc      S                   LIKE(sqdesc        )
     D prevpage        S                   LIKE(pagenum       )
     D nextpage        S                   LIKE(pagenum       )
     D tmpque          S                   LIKE(mqueue        )
     D ww_fdays        S                   LIKE(mpdday        )
     D ww_tdays        S                   LIKE(mpdday        )

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

     C     DL003_        KLIST
     C                   KFLD                    sqcode
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
       ExecCmd2_('ADDLIBLE QGPL':%len(%trimr('ADDLIBLE QGPL')));
       ExecCmd2_( 'KWSET ' + %trim(client):%len(%trimr( 'KWSET ' + %trim(
       client))));
       Open_File_('*ALL': '*FIRST':  'Y');
       security = kw_security(userid:'R_PDUE.PGM');
       if (security = '0');
        ExecCmd2_('CHGLIBL LIBL(QTEMP QGPL)':%len(%trimr('CHGLIBL LIBL(QTEMP -
       QGPL)')));
        Redirect2_('dash.pgm':'*SAME');
        return ;
       endif;
       PDUERPT_ = getcookie2_('WBSTRPT_state');
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
     P* display0...                 - User defined function
     P*---------------------------------------------------------------------
     P display0...
     P                 B
     D display0...
     D                 PI




      /free
       ww_floc = rplstr_(ww_floc:%trim(''''):%trim('_'));
       ww_fqueue = rplstr_(ww_fqueue:%trim(''''):%trim('_'));
       pagenum = %dec(aton_( getparm3_('page':'*OPT'):46:16):5:0);
       if (pagenum = 0);
        pagenum = 1;
       endif;
       prevpage = pagenum - 1;
       nextpage = pagenum + 1;
       nx = ( ( ( pagenum - 1) * listsize) + 1);
       bldselstr0();
       ww_pagea = %trim(%editc(pagenum:'P'));
       Setcookie_('PDUERPT_state':PDUERPT_:'*TEMP':'/':'*HOST':'0':'0');
       bldpage0();
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
        SetPipe_('*ON':9000000:'*DFT');
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
        outweb_(%subst(%str(%addr(H__7(1))):1:3188));
       else;
        if (print = 'Y');
         outweb_(%subst(%str(%addr(H__10(1))):1:955));
        else;
         outweb_(%subst(%str(%addr(H__1(1))):1:1877));
         wfrtn__ = AfToPage_(QPGMNAM__);
         outweb_(%subst(%str(%addr(H__1(24))):38:278));
         locbox0();
         outweb_(%subst(%str(%addr(H__1(27))):76:213));
         quebox0();
         outweb_(%subst(%str(%addr(H__1(30))):49:215));
         dlrbox0();
         outweb_(%subst(%str(%addr(H__1(33))):24:268));
         AfToPage_(%trim(%editc(WW_FDAYS:'4')));
         outweb_(%subst(%str(%addr(H__1(36))):52:228));
         AfToPage_(%trim(%editc(WW_TDAYS:'4')));
         outweb_(%subst(%str(%addr(H__1(39))):40:733));
         wfrtn__ = AfToPage_(QPGMNAM__);
         outweb_(%subst(%str(%addr(H__1(48))):53:6));
         AfToPage_(%trim(%editc(PREVPAGE:'X')));
         outweb_(%subst(%str(%addr(H__1(48))):59:5));
         AfToPage_(%trim(%editc(RND:'X')));
         outweb_(%subst(%str(%addr(H__1(48))):64:169));
         wfrtn__ = AfToPage_(QPGMNAM__);
         outweb_(%subst(%str(%addr(H__1(50))):73:6));
         AfToPage_(%trim(%editc(NEXTPAGE:'X')));
         outweb_(%subst(%str(%addr(H__1(50))):79:5));
         AfToPage_(%trim(%editc(RND:'X')));
         outweb_(%subst(%str(%addr(H__1(51))):4:943));
        endif;
       endif;
       x = 1;
       OutWeb_(%trimr( '<!--selstring:' + %trim(selstring) + '-->'));
       fetchrel0();
       dow (((((SQLCOD <> 100)) and ((SQLCOD >= 0)) and ((x <= listsize)))));
       if (tmpque <> mqueue);
        if (spreadsheet <> 'Y');
         outweb_(%subst(%str(%addr(H__5(1))):1:62));
         wfrtn__ = AfToPage_(SQDESC);
         outweb_(%subst(%str(%addr(H__5(1))):63:457));
        endif;
       endif;
       if (mprocd = 0);
        mprocd = mobal;
       endif;
       if (spreadsheet = 'Y');
        outweb_(%subst(%str(%addr(H__8(1))):1:58));
        wfrtn__ = AfToPage_(ICNA1);
        outweb_(%subst(%str(%addr(H__8(1))):59:67));
        wfrtn__ = AfToPage_(MFMTACCT);
        outweb_(%subst(%str(%addr(H__8(2))):46:67));
        wfrtn__ = AfToPage_(MQUEUE);
        outweb_(%subst(%str(%addr(H__8(3))):33:67));
        wfrtn__ = AfToPage_(MDLR);
        outweb_(%subst(%str(%addr(H__8(4))):20:66));
        AfToPage_(%trim(%editc(MPROCD:'N')));
        outweb_(%subst(%str(%addr(H__8(5))):6:66));
        AfToPage_(%trim(%editc(MCBAL:'N')));
        outweb_(%subst(%str(%addr(H__8(5))):72:66));
        AfToPage_(%trim(%editc(MPMT:'N')));
        outweb_(%subst(%str(%addr(H__8(6))):58:66));
        AfToPage_(%trim(%editc(MPDUE:'N')));
        outweb_(%subst(%str(%addr(H__8(7))):44:67));
        AfToPage_(%trim(%editc(MPDDAY:'3')));
        outweb_(%subst(%str(%addr(H__8(8))):31:67));
        wfrtn__ = AfToPage_(%char(MDDATE: *USA));
        outweb_(%subst(%str(%addr(H__8(9))):18:67));
        wfrtn__ = AfToPage_(%char(MLDATE: *USA));
        outweb_(%subst(%str(%addr(H__8(10))):5:66));
        AfToPage_(%trim(%editc(MLPMT:'N')));
        outweb_(%subst(%str(%addr(H__8(10))):71:23));
       else;
        Flip_Rc_();
        outweb_(%subst(%str(%addr(H__2(1))):1:11));
        wfrtn__ = AfToPage_(ARCLR__);
        outweb_(%subst(%str(%addr(H__2(1))):12:26));
        wfrtn__ = AfToPage_(ICNA1);
        outweb_(%subst(%str(%addr(H__2(1))):38:12));
        wfrtn__ = AfToPage_(MFMTACCT);
        outweb_(%subst(%str(%addr(H__2(1))):50:12));
        wfrtn__ = AfToPage_(MQUEUE);
        outweb_(%subst(%str(%addr(H__2(1))):62:12));
        wfrtn__ = AfToPage_(MDLR);
        outweb_(%subst(%str(%addr(H__2(1))):74:12));
        AfToPage_(%trim(%editc(MPROCD:'J')));
        outweb_(%subst(%str(%addr(H__2(2))):6:12));
        AfToPage_(%trim(%editc(MCBAL:'J')));
        outweb_(%subst(%str(%addr(H__2(2))):18:12));
        AfToPage_(%trim(%editc(MPMT:'J')));
        outweb_(%subst(%str(%addr(H__2(2))):30:12));
        AfToPage_(%trim(%editc(MPDUE:'J')));
        outweb_(%subst(%str(%addr(H__2(2))):42:12));
        AfToPage_(%trim(%editc(MPDDAY:'3')));
        outweb_(%subst(%str(%addr(H__2(2))):54:12));
        wfrtn__ = AfToPage_(%char(MDDATE: *USA));
        outweb_(%subst(%str(%addr(H__2(2))):66:12));
        wfrtn__ = AfToPage_(%char(MLDATE: *USA));
        outweb_(%subst(%str(%addr(H__2(2))):78:25));
        AfToPage_(%trim(%editc(MLPMT:'J')));
        outweb_(%subst(%str(%addr(H__2(3))):23:15));
       endif;
       x = x + 1;
       total = total + MPDUE;
       tmpque = mqueue;
       subtsqdesc = sqdesc;
       fetchnext0();
       if (((tmpque <> mqueue) or (SQLCOD = 100)));
        if (spreadsheet <> 'Y');
         outweb_(%subst(%str(%addr(H__6(1))):1:79));
         wfrtn__ = AfToPage_(SUBTSQDESC);
         outweb_(%subst(%str(%addr(H__6(1))):80:145));
         AfToPage_(%trim(%editc(TOTAL:'J')));
         outweb_(%subst(%str(%addr(H__6(3))):65:139));
        endif;
       endif;
       enddo;
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
         outweb_(%subst(%str(%addr(H__3(4))):33:264));
         AfToPage_(%trim(%editc(PREVPAGE:'P')));
         outweb_(%subst(%str(%addr(H__3(7))):57:116));
         AfToPage_(%trim(%editc(SQLCOD:'P')));
         outweb_(%subst(%str(%addr(H__3(9))):13:588));
         wfrtn__ = AfToPage_(QPGMNAM__);
         outweb_(%subst(%str(%addr(H__3(16))):41:15));
         outweb_(%subst(%str(%addr(H__3(16))):56:9));
         AfToPage_(%trim(%editc(PAGENUM:'X')));
         outweb_(%subst(%str(%addr(H__3(16))):65:172));
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
       selstring = 'SELECT RRN(KWLBASE), KWCDATA.ICNA1, KWLBASE.MCUST, KWLBAS-
       E.MACCT, KWLBASE.MFMTACCT, KWLQUE.MQUEUE, KWLBASE.MPMT, KWLBASE.MPDUE,-
        KWLBASE.MPDDAY, KWLBASE.MDDATE, KWLBASE.MLDATE, KWLBASE.MLPMT, KWSQUE-
       .SQDESC, KWLBASE.MDLR, KWLBASE.MPROCD, KWLBASE.MOBAL, KWLBASE.MCBAL FR-
       OM KWLBASE inner join KWLQUE on KWLBASE.MCUST = KWLQUE.MCUST and KWLBA-
       SE.MACCT = KWLQUE.MACCT inner join KWCDATA on KWLBASE.MCUST = KWCDATA.-
       CCUST inner join KWSQUE on KWLQUE.MQUEUE = KWSQUE.SQCODE';
       whrclause = '';
       whrlink = ' where';
       ww_floc = getparm3_('ww_floc':'*OPT');
       ww_fqueue = getparm3_('ww_fqueue':'*OPT');
       ww_fdays = %dec(aton_( getparm3_('ww_fdays':'*OPT'):46:16):7:0);
       ww_tdays = %dec(aton_( getparm3_('ww_tdays':'*OPT'):46:16):7:0);
       ww_fdlr = getparm3_('ww_fdlr':'*OPT');
       if (ww_floc <> '');
        whrclause = %trim(whrclause) + whrlink + ' MBR = ''' + %trim(ww_floc)
        + '''';
        whrlink = ' and';
       endif;
       if (ww_fqueue <> '');
        if (((ww_fqueue = '90') and (spreadsheet = 'Y')));
         ww_fqueue = '90+';
        endif;
        whrclause = %trim(whrclause) + whrlink + ' KWLQUE.MQUEUE = ''' +
       %trim(ww_fqueue) + '''';
        whrlink = ' and';
       endif;
       if (ww_fdlr <> '');
        whrclause = %trim(whrclause) + whrlink + ' MDLR = ''' + %trim(
       ww_fdlr) + '''';
        whrlink = ' and';
       endif;
       if (client = '122');
        whrclause = %trim(whrclause) + whrlink + ' MSTAT = ''' + 'O' + '''';
        whrlink = ' and';
       else;
        whrclause = %trim(whrclause) + whrlink + ' MSTAT = ''' + 'O' + ''' an-
       d KWLQUE.MQWORK <> ''Y''';
        whrlink = ' and';
       endif;
       if (ww_fdays <> 0);
        whrclause = %trim(whrclause) + whrlink + ' KWLBASE.MPDDAY >= ' +
       %editc(ww_fdays:'4');
        whrlink = ' and';
       endif;
       if (ww_tdays <> 0);
        whrclause = %trim(whrclause) + whrlink + ' KWLBASE.MPDDAY <= ' +
       %editc(ww_tdays:'4');
        whrlink = ' and';
       endif;
       selstring = %trim(selstring) + ' ' + whrclause;
       ww_ordby = 'MQUEUE';
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
     C+  FETCH RELATIVE :nx  FROM MC INTO :rrn, :ICNA1, :MCUST, :MACCT, :MFMTACC
     C+ T, :MQUEUE, :MPMT, :MPDUE, :MPDDAY, :MDDATE, :MLDATE, :MLPMT, :SQDESC, :
     C+ MDLR, :mprocd, :mobal, :mcbal
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
     C+  FETCH NEXT FROM MC INTO :rrn, :ICNA1, :MCUST, :MACCT, :MFMTACCT, :MQUEU
     C+ E,  :MPMT, :MPDUE, :MPDDAY, :MDDATE, :MLDATE, :MLPMT, :SQDESC, :MDLR, :m
     C+ procd, :mobal, :mcbal
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
       ww_fqueue = getparm3_('ww_fqueue':'*OPT');
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
       boxtype = '';
      /end-free
     C                   EVAL      QPGM__=%trim('KWWEB'     ) + '/' + 'SELBOXN'
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
     P* quebox0...                  - User defined function
     P*---------------------------------------------------------------------
     P quebox0...
     P                 B
     D quebox0...
     D                 PI




      /free
       p_ztype = 'KWSQUE';
       boxname = 'ww_fQUEUE';
       boxid = 'ww_fQUEUE';
       boxselect = ww_fqueue;
       boxtype = 'SYSTEM';
      /end-free
     C                   EVAL      QPGM__=%trim('KWWEB'     ) + '/' + 'SELBOXN'
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
       rtlla__(2) = 'KWSYS';

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
       if   ((file__='KWSQUE' or file__='*ALL') and NOT %OPEN(KWSQUE));
        if (mbr__ <> '*FIRST');
         ovrdbf_(ovrflag__:'KWSQUE':'KWSQUE' : '*LIBL' : mbr__);
        elseif ('KWSQUE' <> 'KWSQUE');
         ovrdbf_(ovrflag__:'KWSQUE':'KWSQUE' : '*LIBL');
        endif;
        if    erropen__ = 'Y';
         OPEN(E) KWSQUE;                //    KWSQUE
         if        %error;
          return %error;
         endif;
        else;
         OPEN KWSQUE;                //    KWSQUE
        endif;
       endif;
       if   ((file__='KWLQUE' or file__='*ALL') and NOT %OPEN(KWLQUE));
        if (mbr__ <> '*FIRST');
         ovrdbf_(ovrflag__:'KWLQUE':'KWLQUE' : '*LIBL' : mbr__);
        elseif ('KWLQUE' <> 'KWLQUE');
         ovrdbf_(ovrflag__:'KWLQUE':'KWLQUE' : '*LIBL');
        endif;
        if    erropen__ = 'Y';
         OPEN(E) KWLQUE;                //    KWLQUE
         if        %error;
          return %error;
         endif;
        else;
         OPEN KWLQUE;                //    KWLQUE
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
**CTDATA H__1        ListHeader                       4946
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
    
    <style type="tex
t/css">
    
    #report_buttons
    {
    text-align: right;	
    float: right;

    }
    
    #report_buttons img
    {
    width: 20px;
    }	
    
    </sty
le>
    
    
  </head>
  <body onload="onload_handler();">
    
    <div id="wr
apping">
      <div id="everything">
        
        
        <div id="pagetitl
e">
          <span>Past Due Report</span>
        </div>
        
        <div
id="whitebg">
          <div id="EDITtitle"><span>Search Criteria</span><span cl
ass="ShowHideText"><a href="#" onclick="toggledispA();">Click to expand or contr
act this area</a></span></div>
          <div id="EDITcontents">
            

          
            <form action="" method="POST">
              <input type=
"hidden" name="task" value="filter">
              <table class="keys" id="showh
ideA">
                <tr>
                  <td class="left">Location</td>

               <td class="right">
                    
                    

                
                  </td>
                </tr>
                <
tr>
                  <td class="left">Queue</td>
                  <td class="r
ight">
                    
                    
                    

        </td>
                </tr>
                 <tr>
                  <td
class="left">Dealer</td>
                  <td class="right">

  
                    
                    
                  </td>

     </tr>
                
                 <tr>
                  <td class="l
eft">From Days</td>
                  
                  <td class="right"><inpu
t type="text" name="ww_fDays" id="ww_fDAYS" value=""</td>
                  

             </tr>
                <tr>
                  <td class="left">To Da
ys</td>
                  
                  <td class="right"><input type="text
" name="ww_tDAYS" id="ww_tDAYS" value=""</td>
                  

 </tr>
                
                <tr>
                  <td class="left">
&nbsp;</td><td class="right"><input type="submit" value="Filter"></td>

       </tr>
              </table>
            </form>
          </div><!--edit
contents-->
        </div><!--whitebg-->
        
        <div id="whitebg">

       <div id="EDITtitle"><span>Search Results</span><span class="ShowHideText"
></div>
            <div id="contents">
              
              <!-- Katie
Bateman - modified listtopcontrol to make room for spreadsheet and print buttons
 -->
              <div id="listtopcontrol" style="width: 50%;">

 <a id="prevlinktop" class="prevlink nondisp" href="?page=&rnd="><img src="/webs
mart/v7.2/Idaho/images/arrow_left.gif" style="border: none;" /></a>

    
                <a id="nextlinktop" class="nextlink nondisp" href="?page=&r
nd="><img src="/websmart/v7.2/Idaho/images/arrow_right.gif" style="border: none;
" /></a>
              </div> 
              
              <!-- Katie Bateman -
 added div for print buttons -->
              <div id="report_buttons">

         <!--	<a href="?spreadsheet=Y" target="_blank"><img src="/websmart/kwikl
oan/images/icons/excel_icon.jpg" style="border: none;" /></a>
      	<a href="?p
rint=Y" target="_blank"><img src="/websmart/kwikloan/images/icons/printdocuments
.png" style="border: none;" /></a>
      -->
                <a id="xlLink" href
="?spreadsheet=Y" target="_blank"><img src="/websmart/kwikloan/images/icons/exce
l_icon.jpg" style="border: none;" /></a>
                <a id="printLink" href=
"?print=Y" target="_blank"><img src="/websmart/kwikloan/images/icons/printdocume
nts.png" style="border: none;" /></a>
                
              </div>

          
              <table class="mainlist">

**CTDATA H__2        ListDetails                      197
<tr class="">
  
  <td class="first"></td>
  <td></td>
  <td></td>
  <td></td>

 <td></td>
  <td></td>
  <td></td>
  <td></td>
  <td></td>
  <td></td>
  <td></t
d>
  <td class="last"></td>
  
</tr>

**CTDATA H__3        ListFooter                       1436
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
</div><!--wrapping-->

<script type="text/java
script">
	// Control display of Prev and Next links
	if( > 0)
	{
		xl_GetObj("pr
evlinktop").className ="prevlink";
		xl_GetObj("prevlinkbot").className ="prevli
nk";
	}
	if( != 100)
	{
		xl_GetObj("nextlinktop").className ="nextlink";
		xl_G
etObj("nextlinkbot").className ="nextlink";
	}
</script>
<script type="text/java
script" src="/websmart/kwikloan/javascript/1.6.1.min.js"></script>
<script type=
"text/javascript">
	function bldLinks()
	{
		var floc = document.getElementById(
'ww_fLOC').value;
		var fque =	document.getElementById('ww_fQUEUE').value;
		
		
$('#printLink').attr("href","?print=Y&ww_floc="+floc+"&ww_fqueue="+fque+"");
		$
('#xlLink').attr("href","?spreadsheet=Y&ww_floc="+floc+"&ww_fqueue="+fque+"");
	
	//jQuery(".prevlinktop").attr("href", "?task=prev&rrn=&pagenum=");
	}
	//run bl
dLinks on page load (in case they filter once and the dates they choose return a
utomatically into the input fields)
	bldLinks();
</script>
</body>
</html>


**CTDATA H__4        RtnToList                        66
<button onClick="javascript:location.href='?page=;'">Back</button>
**CTDATA H__5        SubHeader                        519
<tr><td class="breakhead" colspan="13">
    Collection Queue: 
  </td></tr>
<tr>

  
  <th width="150" class="first">Name</th>
  <th width="200">Account No</th>

  <th width="100">Queue</th>
  <th width="100">Dealer</th>
  <th width="200">Ori
ginal Loan Amt</th>
  <th width="200">Current Balance</th> 
  <th width="100">Pm
t Amount</th>
  <th width="800">PD Amount</th>
  <th width="800">Days PD</th>

<th width="800">Due Date</th>
  <th width="800">Last Pmt Date</th>
  <th width="
800">Last Pmt Amt</th>
  
  
  
</tr>


**CTDATA H__6        SubTotal                         363
<tr class="subtotal"><td class="breakhead first last" colspan="13">
Totals for 

</td></tr>
<tr class="subtotal_val">
<td class="first"></td>
<td></td>
<td></td>

<td></td>
<td></td>
<td></td>
<td></td>
<td class="text right"></td>
<td class=
"text right"></td>
<td></td>
<td></td>
<td class="last"></td>
</tr>
<tr class="b
lank">
	<td colspan="13">&nbsp;</td>
</tr>

**CTDATA H__7        xlHeader                         3188
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

<Style ss:ID="Currenc
y">
<NumberFormat ss:Format="Currency" />
</Style>

<Style ss:ID="style1">
<Alig
nment ss:Vertical="Bottom" ss:WrapText="0"/>
<Font ss:Size="10" ss:Bold="1" />
<
/Style>

<Style ss:ID="style2">
<Alignment ss:Vertical="Bottom" ss:WrapText="0"/
>
<Font ss:Size="10" ss:Italic="1" ss:Bold="1" />
</Style>

<Style ss:ID="kwik_d
ata">
<Alignment ss:Vertical="Bottom" ss:WrapText="0"/>
<Font x:Family="Swiss" s
s:Size="8"/>
</Style>


</Styles>
<Worksheet ss:Name="Loan Register">
<Table x:F
ullColumns="1" x:FullRows="1">


<Column ss:Index="1" ss:AutoFitWidth="1" ss:Wid
th="200"/>
<Column ss:Index="2" ss:AutoFitWidth="1" ss:Width="100"/>
<Column ss:
Index="3" ss:AutoFitWidth="1" ss:Width="30"/>
<Column ss:Index="4" ss:AutoFitWid
th="1" ss:Width="30"/>
<Column ss:Index="5" ss:AutoFitWidth="1" ss:Width="200"/>

<Column ss:Index="6" ss:AutoFitWidth="1" ss:Width="200"/>
<Column ss:Index="7"
ss:AutoFitWidth="1" ss:Width="100"/>
<Column ss:Index="8" ss:AutoFitWidth="1" ss
:Width="100"/>
<Column ss:Index="9" ss:AutoFitWidth="1" ss:Width="100"/>
<Column
 ss:Index="10" ss:AutoFitWidth="1" ss:Width="50"/>
<Column ss:Index="11" ss:Auto
FitWidth="1" ss:Width="50"/>
<Column ss:Index="12" ss:AutoFitWidth="1" ss:Width=
"100"/>
<Column ss:Index="13" ss:AutoFitWidth="1" ss:Width="100"/>
<Column ss:In
dex="14" ss:AutoFitWidth="1" ss:Width="100"/>

<Row ss:AutoFitHeight="0" ss:Heig
ht="15.75">
<Cell ss:StyleID="s21"><Data ss:Type="String">Name</Data></Cell>
<Ce
ll ss:StyleID="s21"><Data ss:Type="String">Account No</Data></Cell>
<Cell ss:Sty
leID="s21"><Data ss:Type="String">Queue</Data></Cell>
<Cell ss:StyleID="s21"><Da
ta ss:Type="String">Dealer</Data></Cell>
<Cell ss:StyleID="s21"><Data ss:Type="S
tring">Original Loan Amt</Data></Cell>
<Cell ss:StyleID="s21"><Data ss:Type="Str
ing">Current Balance</Data></Cell>
<Cell ss:StyleID="s21"><Data ss:Type="String"
>Pmt Amount</Data></Cell>
<Cell ss:StyleID="s21"><Data ss:Type="String">PD Amoun
t</Data></Cell>
<Cell ss:StyleID="s21"><Data ss:Type="String">Days PD</Data></Ce
ll>
<Cell ss:StyleID="s21"><Data ss:Type="String">Due Date</Data></Cell>
<Cell s
s:StyleID="s21"><Data ss:Type="String">Last Pmt Date</Data></Cell>
<Cell ss:Styl
eID="s21"><Data ss:Type="String">Last Pmt Amt</Data></Cell>
</Row>


**CTDATA H__8        xlDetails                        813
<Row>
<Cell ss:StyleID="kwik_data"><Data ss:Type="String"></Data></Cell>
<Cell s
s:StyleID="kwik_data"><Data ss:Type="String"></Data></Cell>
<Cell ss:StyleID="kw
ik_data"><Data ss:Type="String"></Data></Cell>
<Cell ss:StyleID="kwik_data"><Dat
a ss:Type="String"></Data></Cell>
<Cell ss:StyleID="Currency"><Data ss:Type="Num
ber"></Data></Cell>
<Cell ss:StyleID="Currency"><Data ss:Type="Number"></Data></
Cell>
<Cell ss:StyleID="Currency"><Data ss:Type="Number"></Data></Cell>
<Cell ss
:StyleID="Currency"><Data ss:Type="Number"></Data></Cell>
<Cell ss:StyleID="kwik
_data"><Data ss:Type="Number"></Data></Cell>
<Cell ss:StyleID="kwik_data"><Data
ss:Type="String"></Data></Cell>
<Cell ss:StyleID="kwik_data"><Data ss:Type="Stri
ng"></Data></Cell>
<Cell ss:StyleID="Currency"><Data ss:Type="Number"></Data></C
ell>

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

**CTDATA H__10       printHeader                      955
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
  	<span>Past Due Report<
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



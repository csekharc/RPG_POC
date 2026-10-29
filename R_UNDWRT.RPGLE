     H/TITLE  WebSmart Report
      * ProGen WebSmart Revision 28963
      * File overrides for compile command
      *__OV OVRDBF KWLBASE    KWLBASE
      *__OV OVRDBF KWCDATA    KWCDATA
      *__OV OVRDBF KWPPBASE   KWPPBASE
      *__OV OVRDBF KWPDBASE   KWPDBASE
      *__OV OVRDBF KWCADDR    KWCADDR
      *__OV OVRDBF KWLAPPL    KWLAPPL
      *__OV OVRDBF KWCBASE    KWCBASE
      *__OV OVRDBF KW_XDATA   KW_XDATA
      *__OV OVRDBF KWP_DATA   KWP_DATA
      *__OV OVRDBF KW_APPL    KW_APPL
      *__OV OVRDBF KWHCASH    KWHCASH
      *__OV OVRDBF KWHLOAN    KWHLOAN
      *__OV OVRDBF KWLDISB    KWLDISB
      *__OV OVRDBF KWHBASE    KWHBASE
      *__OV OVRDBF KW_TAX     KW_TAX
      *__OV OVRDBF KWLDECIDE  KWLDECIDE
      *__OV OVRDBF KWCEMPL    KWCEMPL
      *__OV OVRDBF KWLSIGN    KWLSIGN
      *__OV OVRDBF KWLTRAK    KWLTRAK
      *__OV OVRDBF KWS_DATA   KWS_DATA
      *__OV OVRDBF KWPUBASE   KWPUBASE
      *__   Following values are used to create the server program
      *__RO Pgm  lib DEVWEBSMT  Pgm  R_UNDWRT
      *__AG          WEBSMART
      *__CL          *OBJLIBNAM
      *__SQ
      *__BD ECRTBND204
      *===============================================================*
      * Path:   r_undwrt.pdw
      * System: RAJASHEKAR
      * Project:Kwik-Loan
      * Set:    Dev Websmart
      * User:   rajashekhar.battu
      * Date Last Generated:   2020-07-24   15:48:10
      * Last Generated CRC: 2BF62548 E87A11B8 5F701AAB 1BE28038
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
     FKWCBASE   IF   E           K DISK    USROPN
     F                                     INFDS(FID007_   )
     FKW_XDATA  IF   E           K DISK    USROPN
     F                                     INFDS(FID008_   )
     FKWP_DATA  IF   E           K DISK    USROPN
     F                                     INFDS(FID009_   )
     FKW_APPL   IF   E           K DISK    USROPN
     F                                     INFDS(FID010_   )
     FKWHCASH   IF   E           K DISK    USROPN
     F                                     INFDS(FID011_   )
     FKWHLOAN   IF   E           K DISK    USROPN
     F                                     INFDS(FID012_   )
     FKWLDISB   IF   E           K DISK    USROPN
     F                                     INFDS(FID013_   )
     FKWHBASE   IF   E           K DISK    USROPN
     F                                     INFDS(FID014_   )
     FKW_TAX    IF   E           K DISK    USROPN
     F                                     INFDS(FID015_   )
     FKWLDECIDE IF   E           K DISK    USROPN
     F                                     INFDS(FID016_   )
     FKWCEMPL   IF   E           K DISK    USROPN
     F                                     INFDS(FID017_   )
     FKWLSIGN   IF   E           K DISK    USROPN
     F                                     INFDS(FID018_   )
     FKWLTRAK   IF   E           K DISK    USROPN
     F                                     INFDS(FID019_   )
     FKWS_DATA  IF   E           K DISK    USROPN
     F                                     INFDS(FID020_   )
     FKWPUBASE  IF   E           K DISK    USROPN
     F                                     INFDS(FID021_   )

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
     D alphdate                      12A
     D alphdate1                     12A
     D alphdate2                     12A
     D dlrcode                       25A
     D dlrcode1                      25A
     D dlrcode2                      25A
     D undcode                       32A
     D state                          2A
     D ww_fprod                      10A

     D spreadsheet     S              1A
     D print           S              1A
     D mstatus         S             10A
     D datedesc        S             12A
     D artncod         S              5A
     D setlibraryflag  S              1A
     D boxname         S             10A
     D boxid           S             10A
     D boxselect       S             25A
     D boxtype         S             10A
     D jvalidation     S             30A
     D selstring       S           3500A   varying
     D frange1         S              3A
     D reptype         S              4A
     D rrn             S              9P 0
     D nx              S              5P 0
     D pagenum         S              5P 0
     D listsize        S             11P 0
     D rnd             S              5P 0
     D ww_floc         S             10A
     D total           S              7P 0
     D tmpdays         S             15P 0
     D fico            S              7A
     D tinalpha        S             12A
     D cdrevd          S             11P 2
     D cdreva          S             11P 2
     D fundate         S             10A
     D stips           S          10000A
     D whrclause       S           1000A
     D whrlink         S              7A
     D tmpdta          S          32000A   varying
     D header          S            500A
     D x               S              5P 0
     D denr_fld        S           2048A
     D denr            S            150A
     D linebreak       S             20A
     D status          S             15A

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
     D RS014_          S              1A
     D AM014_          S              1A
     D RS015_          S              1A
     D AM015_          S              1A
     D RS016_          S              1A
     D AM016_          S              1A
     D RS017_          S              1A
     D AM017_          S              1A
     D RS018_          S              1A
     D AM018_          S              1A
     D RS019_          S              1A
     D AM019_          S              1A
     D RS020_          S              1A
     D AM020_          S              1A
     D RS021_          S              1A
     D AM021_          S              1A


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
     D rwcolor1__      S             32A   INZ('altcolm1')
     D rwcolor2__      S             32A   INZ('altcolm2')


     D TASKRAN__       S              1    INZ(*OFF)


     D H__1            S             80    PERRCD(1) CTDATA DIM(101         )

     D H__2            S             80    PERRCD(1) CTDATA DIM(17          )

     D H__3            S             80    PERRCD(1) CTDATA DIM(11          )

     D H__4            S             80    PERRCD(1) CTDATA DIM(1           )

     D H__5            S             80    PERRCD(1) CTDATA DIM(16          )

     D H__6            S             80    PERRCD(1) CTDATA DIM(70          )

     D H__7            S             80    PERRCD(1) CTDATA DIM(19          )

     D H__8            S             80    PERRCD(1) CTDATA DIM(5           )

     D H__9            S             80    PERRCD(1) CTDATA DIM(15          )

     D H__10           S             80    PERRCD(1) CTDATA DIM(2           )


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
     D FID014_         DS
     D  RR_014_              397    400B 0
     D FID015_         DS
     D  RR_015_              397    400B 0
     D FID016_         DS
     D  RR_016_              397    400B 0
     D FID017_         DS
     D  RR_017_              397    400B 0
     D FID018_         DS
     D  RR_018_              397    400B 0
     D FID019_         DS
     D  RR_019_              397    400B 0
     D FID020_         DS
     D  RR_020_              397    400B 0
     D FID021_         DS
     D  RR_021_              397    400B 0


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
     D bldcntstr0...
     D                 PR
     D bldpage0...
     D                 PR
     D calc_fields0...
     D                 PR
     D bldselstr0...
     D                 PR
     D fetchnext0...
     D                 PR
     D fetchrel0...
     D                 PR
     D filter0...
     D                 PR
     D statebox0...
     D                 PR
     D QPGM__          S             21A
     D LstPmlErr_      S              4P 0 IMPORT
     D dlrbox0...
     D                 PR
     D undbox0...
     D                 PR
     D psoldbox0...
     D                 PR
     D PipeLen__       S             10p 0 IMPORT
     D QPGMNAM__       S             20A
     D SmurfChk__      S              1A   INZ(*ON)
     D Smurf_ID__      S             64A   IMPORT
     D Smurf_Rw__      S              9B 0 IMPORT

     D alphdate_cp     S                   LIKE(alphdate      )
     D rcdcnt          S                   LIKE(total         )
     D counter         S                   LIKE(rrn           )
     D fico_avg        S                   LIKE(cscore        )
     D frange2         S                   LIKE(frange1       )
     D prevpage        S                   LIKE(pagenum       )
     D nextpage        S                   LIKE(pagenum       )
     D pagemax         S                   LIKE(pagenum       )
     D selstr          S                   LIKE(selstring     )
     D sort            S                   LIKE(ww_ordby      )
     D tmpprod         S                   LIKE(mprod         )
     D ww_date1        S                   LIKE(mmdate        )
     D ww_date2        S                   LIKE(mmdate        )
     D tmpdesc         S                   LIKE(ppdesc        )
     D addisc          S                   LIKE(mfees         )
     D orddir          S                   LIKE(ww_orddir     )
     D ficor1          S                   LIKE(fico          )
     D ficor2          S                   LIKE(fico          )
     D hprev           S                   LIKE(hbal          )
     D hirev           S                   LIKE(hint          )
     D hfrev           S                   LIKE(hother        )
     D total_pmt       S                   LIKE(hbal          )
     D total_rev       S                   LIKE(hbal          )
     D totals_pmt      S                   LIKE(hbal          )
     D totals_rev      S                   LIKE(hbal          )
     D sv_cust         S                   LIKE(mcust         )
     D sv_acct         S                   LIKE(macct         )
     D katinc          S                   LIKE(mobal         )
     D selstr_und      S                   LIKE(selstring     )
     D speclause       S                   LIKE(whrclause     )
     D dec_user        S                   LIKE(mauser        )
     D kapirat1        S                   LIKE(mdecval       )
     D bruptmo         S                   LIKE(mdecval       )
     D coffmo          S                   LIKE(mdecval       )
     D tiftr           S                   LIKE(mdecval       )
     D tr30            S                   LIKE(mdecval       )
     D tr60            S                   LIKE(tr30          )
     D tr90            S                   LIKE(tr60          )
     D scoredisc       S                   LIKE(mdecipcto     )
     D score1disc      S                   LIKE(scoredisc     )
     D totdisc         S                   LIKE(scoredisc     )

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

     C     DL008_        KLIST
     C                   KFLD                    mcust
     C                   KFLD                    macct
     C                   KFLD                    kxwspgm
     C                   KFLD                    kxid
     C     DL016_        KLIST
     C                   KFLD                    mcust
     C                   KFLD                    macct
     C                   KFLD                    mssign
     C                   KFLD                    mdeclvl
     C                   KFLD                    mdecseq
     C                   KFLD                    mdecorder
     C                   KFLD                    mdecfld
     C     deckey        KLIST
     C                   KFLD                    mcust
     C                   KFLD                    macct
     C     DL004_        KLIST
     C                   KFLD                    pdno
     C     DL007_        KLIST
     C                   KFLD                    mcust
     C     DL018_        KLIST
     C                   KFLD                    mcust
     C                   KFLD                    macct
     C                   KFLD                    mstype
     C     DL019_        KLIST
     C                   KFLD                    mcust
     C                   KFLD                    macct
     C     DL009_        KLIST
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
       WBSTRPT_ = getcookie2_('WBSTRPT_undw');
       if (task__ = 'DEFAULT');
        taskran__ = *ON;
        display0();
       endif ;
       if (task__ = 'FILTER');
        taskran__ = *ON;
        filter0();
       endif ;
       if (setlibraryflag = 'Y');
        ExecCmd2_('CHGLIBL LIBL(QTEMP QGPL)':%len(%trimr('CHGLIBL LIBL(QTEMP -
       QGPL)')));
       endif;

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
       pagenum = %dec(aton_( getparm3_('pagenum':'*OPT'):46:16):5:0);
       pagemax = %dec(aton_( getparm3_('pagemax':'*OPT'):46:16):5:0);
       if ((((((TASK__ = 'DEFAULT') and (spreadsheet <> 'Y') and (print <> 'Y-
       ') and (pagemax = 0) and ( getparm3_('page':'*OPT') = ''))))));
        WBSTRPT_ = '';
        pagenum = 1;
        pagemax = 1;
        outweb_(%subst(%str(%addr(H__1(1))):1:4175));
        wfrtn__ = AfToPage_(QPGMNAM__);
        outweb_(%subst(%str(%addr(H__1(53))):16:586));
        wfrtn__ = AfToPage_(ALPHDATE);
        outweb_(%subst(%str(%addr(H__1(60))):42:159));
        wfrtn__ = AfToPage_(ALPHDATE1);
        outweb_(%subst(%str(%addr(H__1(62))):41:116));
        wfrtn__ = AfToPage_(ALPHDATE2);
        outweb_(%subst(%str(%addr(H__1(63))):77:151));
        statebox0();
        outweb_(%subst(%str(%addr(H__1(65))):68:73));
        wfrtn__ = AfToPage_(UNDCODE);
        outweb_(%subst(%str(%addr(H__1(66))):61:56));
        undbox0();
        outweb_(%subst(%str(%addr(H__1(67))):37:123));
        wfrtn__ = AfToPage_(DLRCODE);
        outweb_(%subst(%str(%addr(H__1(68))):80:74));
        dlrbox0();
        outweb_(%subst(%str(%addr(H__1(69))):74:109));
        wfrtn__ = AfToPage_(DLRCODE1);
        outweb_(%subst(%str(%addr(H__1(71))):23:86));
        wfrtn__ = AfToPage_(DLRCODE2);
        outweb_(%subst(%str(%addr(H__1(72))):29:166));
        psoldbox0();
        outweb_(%subst(%str(%addr(H__1(74))):35:865));
        wfrtn__ = AfToPage_(QPGMNAM__);
        outweb_(%subst(%str(%addr(H__1(85))):20:70));
        wfrtn__ = AfToPage_(QPGMNAM__);
        outweb_(%subst(%str(%addr(H__1(86))):10:6));
        AfToPage_(%trim(%editc(PREVPAGE:'X')));
        outweb_(%subst(%str(%addr(H__1(86))):16:5));
        AfToPage_(%trim(%editc(RND:'X')));
        outweb_(%subst(%str(%addr(H__1(86))):21:161));
        wfrtn__ = AfToPage_(QPGMNAM__);
        outweb_(%subst(%str(%addr(H__1(88))):22:6));
        AfToPage_(%trim(%editc(NEXTPAGE:'X')));
        outweb_(%subst(%str(%addr(H__1(88))):28:5));
        AfToPage_(%trim(%editc(RND:'X')));
        outweb_(%subst(%str(%addr(H__1(88))):33:255));
        AfToPage_(%trim(%editc(PAGENUM:'J')));
        outweb_(%subst(%str(%addr(H__1(91))):48:29));
        AfToPage_(%trim(%editc(PAGEMAX:'J')));
        outweb_(%subst(%str(%addr(H__1(91))):77:62));
        AfToPage_(%trim(%editc(PAGEMAX:'J')));
        outweb_(%subst(%str(%addr(H__1(92))):59:667));
        OutWeb_('Please apply at least one filter to run this report.');
        outweb_(%subst(%str(%addr(H__3(1))):1:98));
        wfrtn__ = AfToPage_(QPGMNAM__);
        outweb_(%subst(%str(%addr(H__3(2))):19:6));
        AfToPage_(%trim(%editc(PREVPAGE:'X')));
        outweb_(%subst(%str(%addr(H__3(2))):25:5));
        AfToPage_(%trim(%editc(RND:'X')));
        outweb_(%subst(%str(%addr(H__3(2))):30:7));
        wfrtn__ = AfToPage_(WW_ORDBY);
        outweb_(%subst(%str(%addr(H__3(2))):37:153));
        wfrtn__ = AfToPage_(QPGMNAM__);
        outweb_(%subst(%str(%addr(H__3(4))):30:6));
        AfToPage_(%trim(%editc(NEXTPAGE:'X')));
        outweb_(%subst(%str(%addr(H__3(4))):36:5));
        AfToPage_(%trim(%editc(RND:'X')));
        outweb_(%subst(%str(%addr(H__3(4))):41:7));
        wfrtn__ = AfToPage_(WW_ORDBY);
        outweb_(%subst(%str(%addr(H__3(4))):48:265));
        AfToPage_(%trim(%editc(PREVPAGE:'P')));
        outweb_(%subst(%str(%addr(H__3(7))):73:116));
        AfToPage_(%trim(%editc(SQLCOD:'P')));
        outweb_(%subst(%str(%addr(H__3(9))):29:143));
        Exit_Immed_();
       endif;
       if (pagenum = 0);
        pagenum = %dec(aton_( getparm3_('page':'*OPT'):46:16):5:0);
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
       ww_ordby = getparm3_('ordby':'*OPT');
       Setcookie_('WBSTRPT_undw':WBSTRPT_:'*TEMP':'/':'*HOST':'0':'0');
       bldpage0();
      /end-free
     c     *PSSR         begsr
     c                   endsr
     P                 E


     P*---------------------------------------------------------------------
     P* bldcntstr0...               - User defined function
     P*---------------------------------------------------------------------
     P bldcntstr0...
     P                 B
     D bldcntstr0...
     D                 PI




      /free
       whrclause = '';
       whrlink = ' where';
       if (alphdate <> '');
        ww_date1 = AlpToDate_(alphdate:'*USA');
        whrclause = %trim(whrclause) + whrlink + ' MEDATE = DATE ''' + %trim(
        %char(ww_date1:*ISO)) + '''';
        whrlink = ' and';
       endif;
       if (((alphdate1 <> '') and (alphdate2 <> '')));
        ww_date1 = AlpToDate_(alphdate1:'*USA');
        ww_date2 = AlpToDate_(alphdate2:'*USA');
        whrclause = %trim(whrclause) + whrlink + ' MEDATE >= DATE ''' +
       %trim( %char(ww_date1:*ISO)) + ''' AND MEDATE <= DATE ''' + %trim(
       %char(ww_date2:*ISO)) + '''';
        whrlink = ' and';
       endif;
       if (undcode <> '');
        selstr_und = 'SELECT PUID FROM KWPUBASE WHERE PUNAME = ''' + %trim(
       undcode) + '''';
      /end-free
     C/Exec SQL
     C+            Declare UNDID Scroll Cursor
     C+            For UNDID
     C/End-Exec
     C/Exec SQL
     C+            Prepare UNDID
     C+            From :selstr_und
     C/End-Exec
      /free
        if (sqlcod >= 0);
      /end-free
     C/Exec SQL
     C+            Open UNDID
     C/End-Exec
      /free
        endif;
      /end-free
     C/Exec SQL
     C+  FETCH NEXT FROM UNDID INTO :PUID
     C/End-Exec
      /free
      /end-free
     C/Exec SQL
     C+  close UNDID
     C/End-Exec
      /free
        whrclause = %trim(whrclause) + whrlink + ' (MAUSER = ''' + %trim(
       undcode) + ''' or MDENU = ''' + %trim(puid) + ''')';
        whrlink = ' and';
       endif;
       if (dlrcode <> '');
        whrclause = %trim(whrclause) + whrlink + ' MDLR = ''' + %trim(
       dlrcode) + '''';
        whrlink = ' and';
       endif;
       if (((dlrcode1 <> '') and (dlrcode2 <> '')));
        whrclause = %trim(whrclause) + whrlink + ' MDLR BETWEEN ''' + %trim(
       dlrcode1) + ''' and ' + '''' + %trim(dlrcode2) + '''';
        whrlink = ' and';
       endif;
       if ( %trim(state) <> '');
        whrclause = %trim(whrclause) + whrlink + ' MST = ''' + %trim(state)
       + '''';
        whrlink = ' and';
       endif;
       if (ww_fprod <> '');
        speclause = 'inner join KW_XDATA on KWLBASE.MCUST = KW_XDATA.WCUST an-
       d KWLBASE.MACCT = KW_XDATA.WACCT ';
        whrclause = %trim(whrclause) + whrlink + ' KXWSPGM = ''FDF_APP'' and -
       KXID = ''WPPSOLD''';
        whrlink = ' and';
        whrclause = %trim(whrclause) + whrlink + ' KXDATA = ''' + %trim(
       ww_fprod) + '''';
        whrlink = ' and';
       endif;
       selstring = 'SELECT COUNT(DISTINCT MCUST || MACCT) FROM KWLBASE ' +
       %trim(speclause);
       selstring = %trim(selstring) + ' ' + %trim(whrclause);
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
        listsize = 1000000;
        header = 'application/vnd.ms-excel'+x'25'+' Content-Disposition: inli-
       ne; filename="' +
        %trim(PGMNAME__) + '.xls"';
        HTTPHEADERS__ = %trim( 'Content-Type: ' + header) + x'15' + %trim(
       HTTPHEADERS__);
        SetPipe_('*ON':1000000:'*DFT');
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
        outweb_(%subst(%str(%addr(H__6(1))):1:5566));
       else;
        if (print = 'Y');
         outweb_(%subst(%str(%addr(H__9(1))):1:812));
         if (alphdate <> '');
          OutWeb_('Transaction Date: ');
          OutWeb_(%trimr(alphdate));
         endif;
         outweb_(%subst(%str(%addr(H__9(11))):13:2));
         if (((alphdate1 <> '') and (alphdate2 <> '')));
          OutWeb_('Transaction Date Range: ');
          OutWeb_(%trimr(alphdate1));
          OutWeb_(' to ');
          OutWeb_(%trimr(alphdate2));
          OutWeb_('<br>');
         endif;
         outweb_(%subst(%str(%addr(H__9(11))):15:313));
        else;
         outweb_(%subst(%str(%addr(H__1(1))):1:4175));
         wfrtn__ = AfToPage_(QPGMNAM__);
         outweb_(%subst(%str(%addr(H__1(53))):16:586));
         wfrtn__ = AfToPage_(ALPHDATE);
         outweb_(%subst(%str(%addr(H__1(60))):42:159));
         wfrtn__ = AfToPage_(ALPHDATE1);
         outweb_(%subst(%str(%addr(H__1(62))):41:116));
         wfrtn__ = AfToPage_(ALPHDATE2);
         outweb_(%subst(%str(%addr(H__1(63))):77:151));
         statebox0();
         outweb_(%subst(%str(%addr(H__1(65))):68:73));
         wfrtn__ = AfToPage_(UNDCODE);
         outweb_(%subst(%str(%addr(H__1(66))):61:56));
         undbox0();
         outweb_(%subst(%str(%addr(H__1(67))):37:123));
         wfrtn__ = AfToPage_(DLRCODE);
         outweb_(%subst(%str(%addr(H__1(68))):80:74));
         dlrbox0();
         outweb_(%subst(%str(%addr(H__1(69))):74:109));
         wfrtn__ = AfToPage_(DLRCODE1);
         outweb_(%subst(%str(%addr(H__1(71))):23:86));
         wfrtn__ = AfToPage_(DLRCODE2);
         outweb_(%subst(%str(%addr(H__1(72))):29:166));
         psoldbox0();
         outweb_(%subst(%str(%addr(H__1(74))):35:865));
         wfrtn__ = AfToPage_(QPGMNAM__);
         outweb_(%subst(%str(%addr(H__1(85))):20:70));
         wfrtn__ = AfToPage_(QPGMNAM__);
         outweb_(%subst(%str(%addr(H__1(86))):10:6));
         AfToPage_(%trim(%editc(PREVPAGE:'X')));
         outweb_(%subst(%str(%addr(H__1(86))):16:5));
         AfToPage_(%trim(%editc(RND:'X')));
         outweb_(%subst(%str(%addr(H__1(86))):21:161));
         wfrtn__ = AfToPage_(QPGMNAM__);
         outweb_(%subst(%str(%addr(H__1(88))):22:6));
         AfToPage_(%trim(%editc(NEXTPAGE:'X')));
         outweb_(%subst(%str(%addr(H__1(88))):28:5));
         AfToPage_(%trim(%editc(RND:'X')));
         outweb_(%subst(%str(%addr(H__1(88))):33:255));
         AfToPage_(%trim(%editc(PAGENUM:'J')));
         outweb_(%subst(%str(%addr(H__1(91))):48:29));
         AfToPage_(%trim(%editc(PAGEMAX:'J')));
         outweb_(%subst(%str(%addr(H__1(91))):77:62));
         AfToPage_(%trim(%editc(PAGEMAX:'J')));
         outweb_(%subst(%str(%addr(H__1(92))):59:667));
        endif;
       endif;
       if (spreadsheet <> 'Y');
        outweb_(%subst(%str(%addr(H__5(1))):1:1210));
       endif;
       fetchrel0();
       x = 1;
       dow ((((SQLCOD <> 100) and (SQLCOD >= 0) and (x <= listsize))));
       fundate = '';
       if ( %char(MFDATE:*ISO) <> '0001-01-01');
        fundate = %char(MFDATE:*USA);
       else;
        fundate = 'N/A';
       endif;
       calc_fields0();
       denr_fld = '';
       denr = '';
       if (mstat = 'X');
        if (spreadsheet = 'Y');
         linebreak = ' &#10;';
        else;
         linebreak = '<br>';
        endif;
      /end-free
     C/Exec SQL
     C+  select mden01, mden02, mden03, mden04, mden05, mden06, mden07, mden08,
     C+ mden09, mden10					into :mden01, :mden02, :mden03, :mden04, :mden05, :md
     C+ en06, :mden07, :mden08, :mden09, :mden10						from kwlbase where mcust =
     C+  :mcust and macct = :macct
     C/End-Exec
      /free
        if (mden01 <> ' ');
      /end-free
     C/Exec SQL
     C+  select s_zdesc into :denr from kws_data where s_ztype = 'DENIALREASON'
     C+ and S_ZKEYA = :mden01
     C/End-Exec
      /free
         denr_fld = %trim(denr_fld) + %trim(denr) + linebreak;
        endif;
        if (mden02 <> ' ');
      /end-free
     C/Exec SQL
     C+  select s_zdesc into :denr from kws_data where s_ztype = 'DENIALREASON'
     C+ and S_ZKEYA = :mden02
     C/End-Exec
      /free
         denr_fld = %trim(denr_fld) + %trim(denr) + linebreak;
        endif;
        if (mden03 <> ' ');
      /end-free
     C/Exec SQL
     C+  select s_zdesc into :denr from kws_data where s_ztype = 'DENIALREASON'
     C+ and S_ZKEYA = :mden03
     C/End-Exec
      /free
         denr_fld = %trim(denr_fld) + %trim(denr) + linebreak;
        endif;
        if (mden04 <> ' ');
      /end-free
     C/Exec SQL
     C+  select s_zdesc into :denr from kws_data where s_ztype = 'DENIALREASON'
     C+ and S_ZKEYA = :mden04
     C/End-Exec
      /free
         denr_fld = %trim(denr_fld) + %trim(denr) + linebreak;
        endif;
        if (mden05 <> ' ');
      /end-free
     C/Exec SQL
     C+  select s_zdesc into :denr from kws_data where s_ztype = 'DENIALREASON'
     C+ and S_ZKEYA = :mden05
     C/End-Exec
      /free
         denr_fld = %trim(denr_fld) + %trim(denr) + linebreak;
        endif;
        if (mden06 <> ' ');
      /end-free
     C/Exec SQL
     C+  select s_zdesc into :denr from kws_data where s_ztype = 'DENIALREASON'
     C+ and S_ZKEYA = :mden06
     C/End-Exec
      /free
         denr_fld = %trim(denr_fld) + %trim(denr) + linebreak;
        endif;
        if (mden07 <> ' ');
      /end-free
     C/Exec SQL
     C+  select s_zdesc into :denr from kws_data where s_ztype = 'DENIALREASON'
     C+ and S_ZKEYA = :mden07
     C/End-Exec
      /free
         denr_fld = %trim(denr_fld) + %trim(denr) + linebreak;
        endif;
        if (mden08 <> ' ');
      /end-free
     C/Exec SQL
     C+  select s_zdesc into :denr from kws_data where s_ztype = 'DENIALREASON'
     C+ and S_ZKEYA = :mden08
     C/End-Exec
      /free
         denr_fld = %trim(denr_fld) + %trim(denr) + linebreak;
        endif;
        if (mden09 <> ' ');
      /end-free
     C/Exec SQL
     C+  select s_zdesc into :denr from kws_data where s_ztype = 'DENIALREASON'
     C+ and S_ZKEYA = :mden09
     C/End-Exec
      /free
         denr_fld = %trim(denr_fld) + %trim(denr) + linebreak;
        endif;
        if (mden10 <> ' ');
      /end-free
     C/Exec SQL
     C+  select s_zdesc into :denr from kws_data where s_ztype = 'DENIALREASON'
     C+ and S_ZKEYA = :mden10
     C/End-Exec
      /free
         denr_fld = %trim(denr_fld) + %trim(denr) + linebreak;
        endif;
       endif;
       if (spreadsheet <> 'Y');
        chain(N) DL004_ RKWPDBASE;
        RS004_ = RcdSts2_('GETRCDN':%error: %found: %eof);
        chain(N) DL007_ RKWCBASE;
        RS007_ = RcdSts2_('GETRCDN':%error: %found: %eof);
        Flip_Rc_();
        outweb_(%subst(%str(%addr(H__2(1))):1:11));
        wfrtn__ = AfToPage_(ARCLR__);
        outweb_(%subst(%str(%addr(H__2(1))):12:23));
        wfrtn__ = AfToPage_(%char(MEDATE: *USA));
        outweb_(%subst(%str(%addr(H__2(1))):35:40));
        wfrtn__ = AfToPage_(FUNDATE);
        outweb_(%subst(%str(%addr(H__2(1))):75:39));
        wfrtn__ = AfToPage_(MFMTACCT);
        outweb_(%subst(%str(%addr(H__2(2))):34:40));
        wfrtn__ = AfToPage_(MFNAME);
        outweb_(%subst(%str(%addr(H__2(2))):74:1));
        wfrtn__ = AfToPage_(MLNAME);
        outweb_(%subst(%str(%addr(H__2(2))):75:42));
        wfrtn__ = AfToPage_(MDLR);
        outweb_(%subst(%str(%addr(H__2(3))):37:40));
        wfrtn__ = AfToPage_(PDNAME);
        outweb_(%subst(%str(%addr(H__2(3))):77:42));
        AfToPage_(%trim(%editc(MOBAL:'J')));
        outweb_(%subst(%str(%addr(H__2(4))):39:42));
        wfrtn__ = AfToPage_(STATUS);
        outweb_(%subst(%str(%addr(H__2(5))):1:41));
        wfrtn__ = AfToPage_(DENR_FLD);
        outweb_(%subst(%str(%addr(H__2(5))):42:39));
        AfToPage_(%trim(%editc(CSCORE:'3')));
        outweb_(%subst(%str(%addr(H__2(6))):1:42));
        AfToPage_(%trim(%editc(CSCORE1:'3')));
        outweb_(%subst(%str(%addr(H__2(6))):43:42));
        wfrtn__ = AfToPage_(KAPIRAT1);
        outweb_(%subst(%str(%addr(H__2(7))):5:42));
        AfToPage_(%trim(%editc(KATINC:'J')));
        outweb_(%subst(%str(%addr(H__2(7))):47:42));
        wfrtn__ = AfToPage_(BRUPTMO);
        outweb_(%subst(%str(%addr(H__2(8))):9:42));
        AfToPage_(%trim(%editc(CAMOS:'3')));
        outweb_(%subst(%str(%addr(H__2(8))):51:42));
        AfToPage_(%trim(%editc(CEMOS:'3')));
        outweb_(%subst(%str(%addr(H__2(9))):13:42));
        wfrtn__ = AfToPage_(COFFMO);
        outweb_(%subst(%str(%addr(H__2(9))):55:42));
        wfrtn__ = AfToPage_(WPHOMEO);
        outweb_(%subst(%str(%addr(H__2(10))):17:42));
        AfToPage_(%trim(%editc(CDREVA:'3')));
        outweb_(%subst(%str(%addr(H__2(10))):59:42));
        AfToPage_(%trim(%editc(CDREVD:'J')));
        outweb_(%subst(%str(%addr(H__2(11))):21:42));
        wfrtn__ = AfToPage_(TIFTR);
        outweb_(%subst(%str(%addr(H__2(11))):63:42));
        wfrtn__ = AfToPage_(TR30);
        outweb_(%subst(%str(%addr(H__2(12))):25:42));
        wfrtn__ = AfToPage_(TR60);
        outweb_(%subst(%str(%addr(H__2(12))):67:42));
        wfrtn__ = AfToPage_(TR90);
        outweb_(%subst(%str(%addr(H__2(13))):29:42));
        AfToPage_(%trim(%editc(TOTDISC:'3')));
        outweb_(%subst(%str(%addr(H__2(13))):71:42));
        AfToPage_(%trim(%editc(SCOREDISC:'3')));
        outweb_(%subst(%str(%addr(H__2(14))):33:42));
        AfToPage_(%trim(%editc(SCORE1DISC:'3')));
        outweb_(%subst(%str(%addr(H__2(14))):75:42));
        AfToPage_(%trim(%editc(ADDISC:'3')));
        outweb_(%subst(%str(%addr(H__2(15))):37:42));
        wfrtn__ = AfToPage_(STIPS);
        outweb_(%subst(%str(%addr(H__2(15))):79:42));
        wfrtn__ = AfToPage_(WEUSER);
        outweb_(%subst(%str(%addr(H__2(16))):41:42));
        wfrtn__ = AfToPage_(DEC_USER);
        outweb_(%subst(%str(%addr(H__2(17))):3:57));
       else;
        if (spreadsheet = 'Y');
         outweb_(%subst(%str(%addr(H__7(1))):1:35));
         wfrtn__ = AfToPage_(%char(MEDATE: *USA));
         outweb_(%subst(%str(%addr(H__7(1))):36:45));
         wfrtn__ = AfToPage_(FUNDATE);
         outweb_(%subst(%str(%addr(H__7(2))):1:45));
         wfrtn__ = AfToPage_(MFMTACCT);
         outweb_(%subst(%str(%addr(H__7(2))):46:45));
         wfrtn__ = AfToPage_(MFNAME);
         outweb_(%subst(%str(%addr(H__7(3))):11:1));
         wfrtn__ = AfToPage_(MLNAME);
         outweb_(%subst(%str(%addr(H__7(3))):12:47));
         wfrtn__ = AfToPage_(MDLR);
         outweb_(%subst(%str(%addr(H__7(3))):59:45));
         wfrtn__ = AfToPage_(PDNAME);
         outweb_(%subst(%str(%addr(H__7(4))):24:47));
         AfToPage_(%trim(%editc(MOBAL:'J')));
         outweb_(%subst(%str(%addr(H__7(4))):71:47));
         wfrtn__ = AfToPage_(STATUS);
         outweb_(%subst(%str(%addr(H__7(5))):38:67));
         wfrtn__ = AfToPage_(DENR_FLD);
         outweb_(%subst(%str(%addr(H__7(6))):25:50));
         AfToPage_(%trim(%editc(CSCORE:'3')));
         outweb_(%subst(%str(%addr(H__7(6))):75:47));
         AfToPage_(%trim(%editc(CSCORE1:'3')));
         outweb_(%subst(%str(%addr(H__7(7))):42:47));
         wfrtn__ = AfToPage_(KAPIRAT1);
         outweb_(%subst(%str(%addr(H__7(8))):9:47));
         AfToPage_(%trim(%editc(KATINC:'J')));
         outweb_(%subst(%str(%addr(H__7(8))):56:47));
         wfrtn__ = AfToPage_(BRUPTMO);
         outweb_(%subst(%str(%addr(H__7(9))):23:47));
         AfToPage_(%trim(%editc(CAMOS:'3')));
         outweb_(%subst(%str(%addr(H__7(9))):70:47));
         AfToPage_(%trim(%editc(CEMOS:'3')));
         outweb_(%subst(%str(%addr(H__7(10))):37:47));
         wfrtn__ = AfToPage_(COFFMO);
         outweb_(%subst(%str(%addr(H__7(11))):4:47));
         wfrtn__ = AfToPage_(WPHOMEO);
         outweb_(%subst(%str(%addr(H__7(11))):51:47));
         AfToPage_(%trim(%editc(CDREVA:'3')));
         outweb_(%subst(%str(%addr(H__7(12))):18:47));
         AfToPage_(%trim(%editc(CDREVD:'J')));
         outweb_(%subst(%str(%addr(H__7(12))):65:47));
         wfrtn__ = AfToPage_(TIFTR);
         outweb_(%subst(%str(%addr(H__7(13))):32:47));
         wfrtn__ = AfToPage_(TR30);
         outweb_(%subst(%str(%addr(H__7(13))):79:47));
         wfrtn__ = AfToPage_(TR60);
         outweb_(%subst(%str(%addr(H__7(14))):46:47));
         wfrtn__ = AfToPage_(TR90);
         outweb_(%subst(%str(%addr(H__7(15))):13:47));
         AfToPage_(%trim(%editc(TOTDISC:'3')));
         outweb_(%subst(%str(%addr(H__7(15))):60:47));
         AfToPage_(%trim(%editc(SCOREDISC:'3')));
         outweb_(%subst(%str(%addr(H__7(16))):27:47));
         AfToPage_(%trim(%editc(SCORE1DISC:'3')));
         outweb_(%subst(%str(%addr(H__7(16))):74:47));
         AfToPage_(%trim(%editc(ADDISC:'3')));
         outweb_(%subst(%str(%addr(H__7(17))):41:71));
         wfrtn__ = AfToPage_(STIPS);
         outweb_(%subst(%str(%addr(H__7(18))):32:47));
         wfrtn__ = AfToPage_(WEUSER);
         outweb_(%subst(%str(%addr(H__7(18))):79:47));
         wfrtn__ = AfToPage_(DEC_USER);
         outweb_(%subst(%str(%addr(H__7(19))):46:26));
         if (PIPELEN__ >= 500000);
          SetPipe_('*OFF':1000000:'*DFT');
          tmpdta = GetPipeDta_(32000:'*DFT');
          dow ( %len(%trimr(tmpdta))> 0);
          tmpdta = tranapi_(tmpdta: '*CUSTOM': 37: 437);
          OutWeb_(tmpdta);
          tmpdta = GetPipeDta_(32000:'*DFT');
          enddo;
          SetPipe_('*ON':1000000:'*DFT');
         endif;
        endif;
       endif;
       x = x + 1;
       fetchnext0();
       enddo;
       if (((SQLCOD = 100) and (x = 1)));
        OutWeb_('<tr><td colspan="31">No records found</td></tr>');
       endif;
      /end-free
     C/Exec SQL
     C+  close MC
     C/End-Exec
      /free
       if (spreadsheet = 'Y');
        outweb_(%subst(%str(%addr(H__8(1))):1:383));
       else;
        if (print = 'Y');
         outweb_(%subst(%str(%addr(H__10(1))):1:149));
        else;
         outweb_(%subst(%str(%addr(H__3(1))):1:98));
         wfrtn__ = AfToPage_(QPGMNAM__);
         outweb_(%subst(%str(%addr(H__3(2))):19:6));
         AfToPage_(%trim(%editc(PREVPAGE:'X')));
         outweb_(%subst(%str(%addr(H__3(2))):25:5));
         AfToPage_(%trim(%editc(RND:'X')));
         outweb_(%subst(%str(%addr(H__3(2))):30:7));
         wfrtn__ = AfToPage_(WW_ORDBY);
         outweb_(%subst(%str(%addr(H__3(2))):37:153));
         wfrtn__ = AfToPage_(QPGMNAM__);
         outweb_(%subst(%str(%addr(H__3(4))):30:6));
         AfToPage_(%trim(%editc(NEXTPAGE:'X')));
         outweb_(%subst(%str(%addr(H__3(4))):36:5));
         AfToPage_(%trim(%editc(RND:'X')));
         outweb_(%subst(%str(%addr(H__3(4))):41:7));
         wfrtn__ = AfToPage_(WW_ORDBY);
         outweb_(%subst(%str(%addr(H__3(4))):48:265));
         AfToPage_(%trim(%editc(PREVPAGE:'P')));
         outweb_(%subst(%str(%addr(H__3(7))):73:116));
         AfToPage_(%trim(%editc(SQLCOD:'P')));
         outweb_(%subst(%str(%addr(H__3(9))):29:143));
        endif;
       endif;
       if (spreadsheet = 'Y');
        SetPipe_('*OFF':1000000:'*DFT');
        tmpdta = GetPipeDta_(32000:'*DFT');
        dow ( %len(%trimr(tmpdta))> 0);
        tmpdta = tranapi_(tmpdta: '*CUSTOM': 37: 437);
        OutWeb_(tmpdta);
        tmpdta = GetPipeDta_(32000:'*DFT');
        enddo;
       endif;
      /end-free
     c     *PSSR         begsr
     c                   endsr
     P                 E


     P*---------------------------------------------------------------------
     P* calc_fields0...             - User defined function
     P*---------------------------------------------------------------------
     P calc_fields0...
     P                 B
     D calc_fields0...
     D                 PI




      /free
       WCUST = MCUST;
       WACCT = MACCT;
       cdreva = 0;
       cdrevd = 0;
       CSCORE = 0;
       CSCORE1 = 0;
       kapirat1 = '0';
       bruptmo = '0';
       coffmo = '0';
       tiftr = '0';
       tr30 = '0';
       tr60 = '0';
       tr90 = '0';
       mdecval = '0';
       MDECIPCTO = 0;
       ScoreDisc = 0;
       Score1Disc = 0;
       TotDisc = 0;
       ADDISC = 0;
       pdname = '';
       stips = '';
       SETLL  DL019_ RKWLTRAK;
       RS019_ = RcdSts2_('POSRCD':%error:%equal:%eof);
       READE(NE) DL019_ RKWLTRAK;
       RS019_ = RcdSts2_('GETNXTRCD':%error:%found:%eof);
       AM019_ = CV_ByKey;
       dow (RS019_ = '1');
       selstring = 'select s_zdesc from kws_data where s_ztype = ''TRACK.STIP-
       '' and s_zkeya = ''' + %trim(mtcode) + '''';
      /end-free
     C/Exec SQL
     C+            Declare stips Scroll Cursor
     C+            For stips
     C/End-Exec
     C/Exec SQL
     C+            Prepare stips
     C+            From :selstring
     C/End-Exec
      /free
       if (sqlcod >= 0);
      /end-free
     C/Exec SQL
     C+            Open stips
     C/End-Exec
      /free
       endif;
      /end-free
     C/Exec SQL
     C+  FETCH NEXT FROM STIPS INTO :s_zdesc
     C/End-Exec
      /free
      /end-free
     C/Exec SQL
     C+  close stips
     C/End-Exec
      /free
       if (spreadsheet = 'Y');
        stips = %trim(stips) + s_zdesc + ' &#10;';
       else;
        stips = %trim(stips) + s_zdesc + ' <br>';
       endif;
       READE(NE) DL019_ RKWLTRAK;
       RS019_ = RcdSts2_('GETNXTRCD':%error:%found:%eof);
       AM019_ = CV_ByKey;
       enddo;
       stips = %trim(stips);
       if (stips = '');
        stips = 'None';
       endif;
       if (mstat = 'X');
        dec_user = mdenu;
       else;
        if (((mstat <> 'X') and (mappr = 'Y')));
         dec_user = mauser;
        endif;
       endif;
       kxwspgm = 'FDF_VER';
       kxid = 'ADDISC';
       AM008_ = CV_BYKEY;
       CHAIN(NE) DL008_ RKWKXDATA;
       RS008_ = RcdSts2_('GETRCD': %error: %found: %eof);
       ADDISC = %dec(aton_(kxdata:46:16):46:16);
       if (mappr = 'Y');
        status = 'APPROVED';
       else;
        if (((mappr = 'N') and (mstat = 'X')));
         status = 'DECLINED';
        else;
         status = 'NOT APPR';
        endif;
       endif;
       pdno = mdlr;
       AM004_ = CV_BYKEY;
       CHAIN(NE) DL004_ RKWPDBASE;
       RS004_ = RcdSts2_('GETRCD': %error: %found: %eof);
       MDECSEQ = 1;
       MDECORDER = 0;
       mdeclvl = 'APPLIED';
       mdecfld = 'CEGROSS';
       AM016_ = CV_BYKEY;
       CHAIN(NE) DL016_ RKWLDECIDE;
       RS016_ = RcdSts2_('GETRCD': %error: %found: %eof);
       KATINC = %dec(aton_(mdecval:46:16):11:2);
       mdecfld = 'REVOLVINGA';
       AM016_ = CV_BYKEY;
       CHAIN(NE) DL016_ RKWLDECIDE;
       RS016_ = RcdSts2_('GETRCD': %error: %found: %eof);
       cdreva = %dec(aton_(mdecval:46:16):11:2);
       mdecfld = 'UNSREVAMT';
       AM016_ = CV_BYKEY;
       CHAIN(NE) DL016_ RKWLDECIDE;
       RS016_ = RcdSts2_('GETRCD': %error: %found: %eof);
       cdrevd = %dec(aton_(mdecval:46:16):11:2);
       mdecfld = 'KAPIRAT';
       AM016_ = CV_BYKEY;
       CHAIN(NE) DL016_ RKWLDECIDE;
       RS016_ = RcdSts2_('GETRCD': %error: %found: %eof);
       kapirat1 = mdecval;
       mdecfld = 'BANKRUPTMO';
       AM016_ = CV_BYKEY;
       CHAIN(NE) DL016_ RKWLDECIDE;
       RS016_ = RcdSts2_('GETRCD': %error: %found: %eof);
       bruptmo = mdecval;
       mdecfld = 'CHARGEOFFM';
       AM016_ = CV_BYKEY;
       CHAIN(NE) DL016_ RKWLDECIDE;
       RS016_ = RcdSts2_('GETRCD': %error: %found: %eof);
       coffmo = mdecval;
       mdecfld = 'TIF+TR';
       AM016_ = CV_BYKEY;
       CHAIN(NE) DL016_ RKWLDECIDE;
       RS016_ = RcdSts2_('GETRCD': %error: %found: %eof);
       tiftr = mdecval;
       mdecfld = 'TRADE30MO';
       AM016_ = CV_BYKEY;
       CHAIN(NE) DL016_ RKWLDECIDE;
       RS016_ = RcdSts2_('GETRCD': %error: %found: %eof);
       tr30 = mdecval;
       mdecfld = 'TRADE60MO';
       AM016_ = CV_BYKEY;
       CHAIN(NE) DL016_ RKWLDECIDE;
       RS016_ = RcdSts2_('GETRCD': %error: %found: %eof);
       tr60 = mdecval;
       mdecfld = 'TRADE90MO';
       AM016_ = CV_BYKEY;
       CHAIN(NE) DL016_ RKWLDECIDE;
       RS016_ = RcdSts2_('GETRCD': %error: %found: %eof);
       tr90 = mdecval;
       SETLL  deckey RKWLDECIDE;
       RS016_ = RcdSts2_('POSRCD':%error:%equal:%eof);
       READE(NE) deckey RKWLDECIDE;
       RS016_ = RcdSts2_('GETNXTRCD':%error:%found:%eof);
       AM016_ = CV_ByKey;
       dow (RS016_ = '1');
       if (((mdecfld <> 'CSCORE') and (mdecfld <> 'CSCORE1')));
        TotDisc = TotDisc + Mdecipcto;
       else;
        if (mdecfld = 'CSCORE');
         CSCORE = %dec(aton_(mdecval:46:16):46:16);
         if (MDECIPCTO <> 0);
          ScoreDisc = MDECIPCTO;
         endif;
        else;
         if (mdecfld = 'CSCORE1');
          CSCORE1 = %dec(aton_(mdecval:46:16):46:16);
          if (MDECIPCTO <> 0);
           Score1Disc = MDECIPCTO;
          endif;
         endif;
        endif;
       endif;
       READE(NE) deckey RKWLDECIDE;
       RS016_ = RcdSts2_('GETNXTRCD':%error:%found:%eof);
       AM016_ = CV_ByKey;
       enddo;
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
       selstring = 'SELECT MCUST, MACCT, MEDATE, MFMTACCT, MFNAME, MLNAME, MD-
       LR, MOBAL, MSTAT, MAPPR, MXDATE, WPHOMEO, a1.CAMOS, e1.CEMOS, WEUSER, -
       MAUSER, MDENU, MFDATE ' + 'FROM KWLBASE ' + 'inner join KW_APPL on MCU-
       ST = KW_APPL.WCUST and MACCT = KW_APPL.WACCT ' + %trim(speclause) + ' -
       ' + 'inner join (SELECT CCUST, MAX(CEDATE), AVG(CEMOS) CEMOS FROM KWCE-
       MPL group by CCUST) e1 on MCUST = e1.CCUST ' + 'inner join (SELECT CCU-
       ST, MAX(CADATE), AVG(CAMOS) CAMOS FROM KWCADDR group by CCUST) a1 on M-
       CUST = a1.CCUST ';
       selstring = %trim(selstring) + ' ' + %trim(whrclause);
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
     C+  FETCH NEXT FROM MC INTO :MCUST, :MACCT, :MEDATE, :MFMTACCT, :MFNAME, :M
     C+ LNAME, :MDLR, :MOBAL, :MSTAT, :MAPPR, :MXDATE, :WPHOMEO, :CAMOS, :CEMOS,
     C+  :WEUSER, :MAUSER, :MDENU, :MFDATE
     C/End-Exec
      /free
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
     C+  FETCH RELATIVE :nx FROM MC INTO :MCUST, :MACCT, :MEDATE, :MFMTACCT, :MF
     C+ NAME, :MLNAME, :MDLR, :MOBAL, :MSTAT, :MAPPR, :MXDATE, :WPHOMEO, :CAMOS,
     C+  :CEMOS, :WEUSER, :MAUSER, :MDENU, :MFDATE
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
       alphdate = getparm3_('alphdate':'*OPT');
       alphdate1 = getparm3_('alphdate1':'*OPT');
       alphdate2 = getparm3_('alphdate2':'*OPT');
       dlrcode = getparm3_('dlrcode':'*OPT');
       dlrcode1 = getparm3_('dlrcode1':'*OPT');
       dlrcode2 = getparm3_('dlrcode2':'*OPT');
       undcode = getparm3_('undcode':'*OPT');
       state = getparm3_('state':'*OPT');
       ww_fprod = getparm3_('ww_fprod':'*OPT');
       display0();
      /end-free
     c     *PSSR         begsr
     c                   endsr
     P                 E


     P*---------------------------------------------------------------------
     P* statebox0...                - User defined function
     P*---------------------------------------------------------------------
     P statebox0...
     P                 B
     D statebox0...
     D                 PI




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
     P                 E


     P*---------------------------------------------------------------------
     P* dlrbox0...                  - User defined function
     P*---------------------------------------------------------------------
     P dlrbox0...
     P                 B
     D dlrbox0...
     D                 PI




      /free
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
       OutWeb_('<select name="dlrcode" id="dlrcode" onchange="clear_range();"-
       >');
       OutWeb_('<option value="">All / Range</option>');
       dow (((SQLCOD <> 100) and (SQLCOD >= 0)));
       OutWeb_('<option value="');
       OutWeb_(%trimr(pdno));
       OutWeb_('">');
       OutWeb_(%trimr(pdno));
       OutWeb_('</option>');
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
     P                 E


     P*---------------------------------------------------------------------
     P* undbox0...                  - User defined function
     P*---------------------------------------------------------------------
     P undbox0...
     P                 B
     D undbox0...
     D                 PI




      /free
       selstring = 'SELECT DISTINCT PUNAME FROM KWPUBASE ORDER BY PUNAME FOR -
       FETCH ONLY';
      /end-free
     C/Exec SQL
     C+            Declare UND Scroll Cursor
     C+            For UND
     C/End-Exec
     C/Exec SQL
     C+            Prepare UND
     C+            From :selstring
     C/End-Exec
      /free
       if (sqlcod >= 0);
      /end-free
     C/Exec SQL
     C+            Open UND
     C/End-Exec
      /free
       endif;
      /end-free
     C/Exec SQL
     C+  FETCH NEXT FROM UND INTO :PUNAME
     C/End-Exec
      /free
       OutWeb_('<select name="undcode" id="undcode">');
       OutWeb_('<option value=""></option>');
       dow (((SQLCOD <> 100) and (SQLCOD >= 0)));
       if (undcode = puname);
        OutWeb_('<option selected value="');
        OutWeb_(%trimr(puname));
        OutWeb_('">');
        OutWeb_(%trimr(puname));
        OutWeb_('</option>');
       else;
        OutWeb_('<option value="');
        OutWeb_(%trimr(puname));
        OutWeb_('">');
        OutWeb_(%trimr(puname));
        OutWeb_('</option>');
       endif;
      /end-free
     C/Exec SQL
     C+  FETCH NEXT FROM UND INTO :PUNAME
     C/End-Exec
      /free
       enddo;
       OutWeb_('</select>');
      /end-free
     C/Exec SQL
     C+  close UND
     C/End-Exec
      /free
      /end-free
     c     *PSSR         begsr
     c                   endsr
     P                 E


     P*---------------------------------------------------------------------
     P* psoldbox0...                - User defined function
     P*---------------------------------------------------------------------
     P psoldbox0...
     P                 B
     D psoldbox0...
     D                 PI




      /free
       OutWeb_('<select name="ww_fprod" id="ww_fprod" onchange="">');
       OutWeb_('<option value=""></option>');
       p_ztype = 'PRODSOLD';
       SETLL  DL009_ RKWPDATA;
       RS009_ = RcdSts2_('POSRCD':%error:%equal:%eof);
       READE(NE) DL009_ RKWPDATA;
       RS009_ = RcdSts2_('GETNXTRCD':%error:%found:%eof);
       AM009_ = CV_ByKey;
       dow (RS009_ = '1');
       if (ww_fprod = p_zkeya);
        OutWeb_('<option selected value="');
        OutWeb_(%trimr(p_zkeya));
        OutWeb_('">');
        OutWeb_(%trimr(p_zdesc));
        OutWeb_('</option>');
       else;
        OutWeb_('<option value="');
        OutWeb_(%trimr(p_zkeya));
        OutWeb_('">');
        OutWeb_(%trimr(p_zdesc));
        OutWeb_('</option>');
       endif;
       READE(NE) DL009_ RKWPDATA;
       RS009_ = RcdSts2_('GETNXTRCD':%error:%found:%eof);
       AM009_ = CV_ByKey;
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
       if   ((file__='KWCADDR' or file__='*ALL') and NOT %OPEN(KWCADDR));
        if (mbr__ <> '*FIRST');
         ovrdbf_(ovrflag__:'KWCADDR':'KWCADDR' : '*LIBL' : mbr__);
        elseif ('KWCADDR' <> 'KWCADDR');
         ovrdbf_(ovrflag__:'KWCADDR':'KWCADDR' : '*LIBL');
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
        if (mbr__ <> '*FIRST');
         ovrdbf_(ovrflag__:'KWLAPPL':'KWLAPPL' : '*LIBL' : mbr__);
        elseif ('KWLAPPL' <> 'KWLAPPL');
         ovrdbf_(ovrflag__:'KWLAPPL':'KWLAPPL' : '*LIBL');
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
       if   ((file__='KWCBASE' or file__='*ALL') and NOT %OPEN(KWCBASE));
        if (mbr__ <> '*FIRST');
         ovrdbf_(ovrflag__:'KWCBASE':'KWCBASE' : '*LIBL' : mbr__);
        elseif ('KWCBASE' <> 'KWCBASE');
         ovrdbf_(ovrflag__:'KWCBASE':'KWCBASE' : '*LIBL');
        endif;
        if    erropen__ = 'Y';
         OPEN(E) KWCBASE;                //    KWCBASE
         if        %error;
          return %error;
         endif;
        else;
         OPEN KWCBASE;                //    KWCBASE
        endif;
       endif;
       if   ((file__='KW_XDATA' or file__='*ALL') and NOT %OPEN(KW_XDATA));
        if (mbr__ <> '*FIRST');
         ovrdbf_(ovrflag__:'KW_XDATA':'KW_XDATA' : '*LIBL' : mbr__);
        elseif ('KW_XDATA' <> 'KW_XDATA');
         ovrdbf_(ovrflag__:'KW_XDATA':'KW_XDATA' : '*LIBL');
        endif;
        if    erropen__ = 'Y';
         OPEN(E) KW_XDATA;                //    KW_XDATA
         if        %error;
          return %error;
         endif;
        else;
         OPEN KW_XDATA;                //    KW_XDATA
        endif;
       endif;
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
       if   ((file__='KW_APPL' or file__='*ALL') and NOT %OPEN(KW_APPL));
        if (mbr__ <> '*FIRST');
         ovrdbf_(ovrflag__:'KW_APPL':'KW_APPL' : '*LIBL' : mbr__);
        elseif ('KW_APPL' <> 'KW_APPL');
         ovrdbf_(ovrflag__:'KW_APPL':'KW_APPL' : '*LIBL');
        endif;
        if    erropen__ = 'Y';
         OPEN(E) KW_APPL;                //    KW_APPL
         if        %error;
          return %error;
         endif;
        else;
         OPEN KW_APPL;                //    KW_APPL
        endif;
       endif;
       if   ((file__='KWHCASH' or file__='*ALL') and NOT %OPEN(KWHCASH));
        if (mbr__ <> '*FIRST');
         ovrdbf_(ovrflag__:'KWHCASH':'KWHCASH' : '*LIBL' : mbr__);
        elseif ('KWHCASH' <> 'KWHCASH');
         ovrdbf_(ovrflag__:'KWHCASH':'KWHCASH' : '*LIBL');
        endif;
        if    erropen__ = 'Y';
         OPEN(E) KWHCASH;                //    KWHCASH
         if        %error;
          return %error;
         endif;
        else;
         OPEN KWHCASH;                //    KWHCASH
        endif;
       endif;
       if   ((file__='KWHLOAN' or file__='*ALL') and NOT %OPEN(KWHLOAN));
        if (mbr__ <> '*FIRST');
         ovrdbf_(ovrflag__:'KWHLOAN':'KWHLOAN' : '*LIBL' : mbr__);
        elseif ('KWHLOAN' <> 'KWHLOAN');
         ovrdbf_(ovrflag__:'KWHLOAN':'KWHLOAN' : '*LIBL');
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
       if   ((file__='KWLDISB' or file__='*ALL') and NOT %OPEN(KWLDISB));
        if (mbr__ <> '*FIRST');
         ovrdbf_(ovrflag__:'KWLDISB':'KWLDISB' : '*LIBL' : mbr__);
        elseif ('KWLDISB' <> 'KWLDISB');
         ovrdbf_(ovrflag__:'KWLDISB':'KWLDISB' : '*LIBL');
        endif;
        if    erropen__ = 'Y';
         OPEN(E) KWLDISB;                //    KWLDISB
         if        %error;
          return %error;
         endif;
        else;
         OPEN KWLDISB;                //    KWLDISB
        endif;
       endif;
       if   ((file__='KWHBASE' or file__='*ALL') and NOT %OPEN(KWHBASE));
        if (mbr__ <> '*FIRST');
         ovrdbf_(ovrflag__:'KWHBASE':'KWHBASE' : '*LIBL' : mbr__);
        elseif ('KWHBASE' <> 'KWHBASE');
         ovrdbf_(ovrflag__:'KWHBASE':'KWHBASE' : '*LIBL');
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
       if   ((file__='KW_TAX' or file__='*ALL') and NOT %OPEN(KW_TAX));
        if (mbr__ <> '*FIRST');
         ovrdbf_(ovrflag__:'KW_TAX':'KW_TAX' : '*LIBL' : mbr__);
        elseif ('KW_TAX' <> 'KW_TAX');
         ovrdbf_(ovrflag__:'KW_TAX':'KW_TAX' : '*LIBL');
        endif;
        if    erropen__ = 'Y';
         OPEN(E) KW_TAX;                //    KW_TAX
         if        %error;
          return %error;
         endif;
        else;
         OPEN KW_TAX;                //    KW_TAX
        endif;
       endif;
       if   ((file__='KWLDECIDE' or file__='*ALL') and NOT %OPEN(KWLDECIDE));
        if (mbr__ <> '*FIRST');
         ovrdbf_(ovrflag__:'KWLDECIDE':'KWLDECIDE' : '*LIBL' : mbr__);
        elseif ('KWLDECIDE' <> 'KWLDECIDE');
         ovrdbf_(ovrflag__:'KWLDECIDE':'KWLDECIDE' : '*LIBL');
        endif;
        if    erropen__ = 'Y';
         OPEN(E) KWLDECIDE;                //    KWLDECIDE
         if        %error;
          return %error;
         endif;
        else;
         OPEN KWLDECIDE;                //    KWLDECIDE
        endif;
       endif;
       if   ((file__='KWCEMPL' or file__='*ALL') and NOT %OPEN(KWCEMPL));
        if (mbr__ <> '*FIRST');
         ovrdbf_(ovrflag__:'KWCEMPL':'KWCEMPL' : '*LIBL' : mbr__);
        elseif ('KWCEMPL' <> 'KWCEMPL');
         ovrdbf_(ovrflag__:'KWCEMPL':'KWCEMPL' : '*LIBL');
        endif;
        if    erropen__ = 'Y';
         OPEN(E) KWCEMPL;                //    KWCEMPL
         if        %error;
          return %error;
         endif;
        else;
         OPEN KWCEMPL;                //    KWCEMPL
        endif;
       endif;
       if   ((file__='KWLSIGN' or file__='*ALL') and NOT %OPEN(KWLSIGN));
        if (mbr__ <> '*FIRST');
         ovrdbf_(ovrflag__:'KWLSIGN':'KWLSIGN' : '*LIBL' : mbr__);
        elseif ('KWLSIGN' <> 'KWLSIGN');
         ovrdbf_(ovrflag__:'KWLSIGN':'KWLSIGN' : '*LIBL');
        endif;
        if    erropen__ = 'Y';
         OPEN(E) KWLSIGN;                //    KWLSIGN
         if        %error;
          return %error;
         endif;
        else;
         OPEN KWLSIGN;                //    KWLSIGN
        endif;
       endif;
       if   ((file__='KWLTRAK' or file__='*ALL') and NOT %OPEN(KWLTRAK));
        if (mbr__ <> '*FIRST');
         ovrdbf_(ovrflag__:'KWLTRAK':'KWLTRAK' : '*LIBL' : mbr__);
        elseif ('KWLTRAK' <> 'KWLTRAK');
         ovrdbf_(ovrflag__:'KWLTRAK':'KWLTRAK' : '*LIBL');
        endif;
        if    erropen__ = 'Y';
         OPEN(E) KWLTRAK;                //    KWLTRAK
         if        %error;
          return %error;
         endif;
        else;
         OPEN KWLTRAK;                //    KWLTRAK
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
       if   ((file__='KWPUBASE' or file__='*ALL') and NOT %OPEN(KWPUBASE));
        if (mbr__ <> '*FIRST');
         ovrdbf_(ovrflag__:'KWPUBASE':'KWPUBASE' : '*LIBL' : mbr__);
        elseif ('KWPUBASE' <> 'KWPUBASE');
         ovrdbf_(ovrflag__:'KWPUBASE':'KWPUBASE' : '*LIBL');
        endif;
        if    erropen__ = 'Y';
         OPEN(E) KWPUBASE;                //    KWPUBASE
         if        %error;
          return %error;
         endif;
        else;
         OPEN KWPUBASE;                //    KWPUBASE
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
**CTDATA H__1        ListHeader                       8005
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
"/k_loan/jq/172.js" ></script>
    <script type="text/javascript" src="/websmart
/kwikloan/javascript/klscripts.js"></script>
    <script type="text/javascript"
src="https://www.google.com/jsapi"></script>
    <script type="text/javascript">

		 google.load("jqueryui", "1.7.2");
 	 	google.setOnLoadCallback(function() {

       	 $("#alphdate").datepicker({dateFormat: 'mm/dd/yy'})
 	 	 $("#alphdate1"
).datepicker({dateFormat: 'mm/dd/yy'})
 	 	 $("#alphdate2").datepicker({dateForm
at: 'mm/dd/yy'})
 	 	  
 	 	  
 	 });

 	 $(document).ready(function()
 	 {
 	 	

 	 	
 	 	$("#clrfilt").click(function(){
 	 		$("#alphdate").val('');
 	 		$("#
alphdate1").val('');
 	 		$("#alphdate2").val('');
 	 		$("#dlrcode").val('');

	 		$("#dlrcode1").val('');
 	 		$("#dlrcode2").val('');
 	 		$("#state").val(''
);
 	 		$("#ww_fprod").val('');
 	 		$("#undcode").val("");			
 	 	});
 	 	//eit
her/or checkbox
 	 	$("input:checkbox.radio").click(function ()
		{
			if ($(thi
s).is(":checked") == true)
			{
				var group = "input:checkbox[name='" + $(this
).attr("name") + "']";
				$(group).attr("checked", false);
				$(this).attr("ch
ecked", true);
			}
			else
			{
				$(this).is(":checked", false);
			}
			
			
//AJAX to redirect based on selection; need to separate these reports
		}
		);
	
	
		$("#appd").click(function()
		{
		if ($(this).is(":checked") == false)
			$(
this).attr("checked", true);
		
		}
		);
		
		$("#frep").click(function()
		{
		
	location.href = "r_ficob.pgm";
				
		});
		
		$("#appd").attr("checked", true)
;

 	 	// FICO
 	 	if ($("#ficoc").val() != "")
 	 		$("#fico").val($("#ficoc").
val());
 	 		
 	 	if ($("#dlrc").val() != "")
 	 		$("#dlrcode").val($("#dlrc").
val());
 	 		
 	 }); //doc.ready
 	 
 	 function clear_daterange()
 	 {
 	 $("#a
lphdate1").val('');
 	 $("#alphdate2").val('');
 	 	
 	 }
 	 
 	 function clear_
range()
 	 {
 	 $("#dlrcode1").val('');
 	 $("#dlrcode2").val('');	 		
 	 }
 	 

 	 function clear_dlrbox()
 	 {
 	 $("#dlrcode").val('');	
 	 	
 	 }
 	 
 	 
 	
function clear_ficorange()
 	 {
 	 $("#ficor1").val('');
 	 $("#ficor2").val('')
;
 	 	
 	 }
 	 
 	 function clear_date()
 	 {
 	 $("#alphdate").val('');	
 	 	

	 }
 	 
 	 function onload_handler()
 	 {
 	 }
 	 
 	 </script>
    <style type=
"text/css">
    
    #report_buttons
    {
    text-align: right;	
    float: ri
ght;
    }
    
    #report_buttons img
    {
    width: 20px;
    }	
    .altco
lm1
    {
    background-color:#D3F5F5;	
    
    }
    .altcolm2
    {
    back
ground-color:white;	
    
    }
    
    </style>
    
    
  </head>
  <body on
load="onload_handler();">
    
    <div id="wrapping">
      <div id="everything
">
        
        
        <div id="pagetitle">
          <span>Underwriter Re
port</span>
        </div>
        
        <div id="whitebg" style="">

  <div id="EDITtitle"><span>Search Criteria</span><span class="ShowHideText"><a
href="#" onclick="toggledispA();">Click to expand or contract this area</a></spa
n></div>
          <div id="EDITcontents">
            
            

 <form action="" method="POST">
              <input type="hidden" name="task" v
alue="filter">
              <table class="keys" id="showhideA" style="width:100
%">
                <tr>
                  <th width="20%">
                  </
th>
                  <th width="80%">
                  </th>

 <tr id="date">
                    <td class="left">Application Date: </td>

                 <td class="right" style="width:300px">
                      Si
ngle Date: <input type="text" name="alphdate" id="alphdate" size="10" maxlength=
"10" onfocus="clear_daterange();" value="">  &nbsp; &nbsp;

 Date Range: <input type="text" name="alphdate1" id="alphdate1" onfocus="clear_d
ate();" size="10" maxlength="10" value=""> &nbsp;<input type="text" onfocus="cle
ar_date();" size="10" maxlength="10" name="alphdate2" id="alphdate2" value="">		
							
                    </td>
                  </tr>
                  <tr>

                    <td class="left">State:</td><td class="right">

          <input type="hidden" name="undc" id="undc" value="">

     &nbsp;&nbsp;&nbsp;Underwriter: </td>
                  </tr>

    <tr>
                    <input type="hidden" name="dlrc" id="dlrc" value=""
>
                    <td class="left">Dealer Code</td><td class="right"> &nbsp;
&nbsp;Dealer Range: <input type="text" onfocus="clear_dlrbox();" name="dlrcode1"
 id="dlrcode1" value=""> <input type ="text" onfocus="clear_dlrbox();" name="dlr
code2" id="dlrcode2" value=""></td>
                  </tr>
                  <t
r>
                    <td class="left">Product</td>
                    <td cla
ss="right">
                      &nbsp;&nbsp;&nbsp;<input type="submit" value="
Search">&nbsp;&nbsp;&nbsp;<input type="button" value="Clear Filters" id="clrfilt
">	
                    </td>
                  </tr>
                </tr>

            
              </table>
            </form>
          </div><!--edit
contents-->
        </div><!--whitebg-->
        
        <div id="whitebg" styl
e="width:95%; overflow-x:scroll;">
          
          <div id="EDITtitle" styl
e="width:98%"><span>Search Results</span><span class="ShowHideText"></div>

       <div id="contents" style="width:100%;">
              
              <!--
 Katie Bateman - modified listtopcontrol to make room for spreadsheet and print
buttons -->
              <div id="listtopcontrol" style="width: 50%; white-spac
e: nowrap;">
                <!--Leif Perry--paging functionality-->

     <form action="" method="POST">
                  <a id="prevlinktop" class=
"" href="?page=&rnd="><img src="/websmart/v7.2/Idaho/images/arrow_left.gif" styl
e="border: none; vertical-align:middle;" /></a>
                  <a id="nextlin
ktop" class="" href="?page=&rnd="><img src="/websmart/v7.2/Idaho/images/arrow_ri
ght.gif" style="border: none; vertical-align:middle;"  /></a>

<input type="hidden" name="task" value="DEFAULT">
                  Page <input
type="text" name="pagenum" id="pagenum" value="" size="1" maxlength="2"> of 

               <input type="hidden" name="pagemax" value="">
                  <
input type="submit" value="Go">
                </form>
                

       </div> 
              
              <!-- Katie Bateman - added div for p
rint buttons -->
              <div id="report_buttons">
                <!--Exc
el button; will add back in later-->
                <a href="?spreadsheet=Y" ta
rget="_blank"><img src="/websmart/kwikloan/images/icons/excel_icon.jpg" style="b
order: none;" /></a>
                <a href="?print=Y" target="_blank"><img src
="/websmart/kwikloan/images/icons/printdocuments.png" style="border: none;" /></
a>
                
              </div>
              
              


**CTDATA H__2        ListDetails                      1339
<tr class="">
  <td class="first"></td> 
  <td style="white-sapce:nowrap"></td>

  <td style="white-space:nowrap"></td> 
  <td style="white-space:nowrap"> </td>
  
  <td style="white-space:nowrap"></td> 
  <td style="white-space:nowrap"></td
>   
  <td style="white-space:nowrap"></td>   
  <td style="white-space:nowrap">
</td>  
  <td style="white-space:nowrap"></td>
  <td style="white-space:nowrap">
</td>   
  <td style="white-space:nowrap"></td>   
  <td style="white-space:nowr
ap"></td>   
  <td style="white-space:nowrap"></td>   
  <td style="white-space:
nowrap"></td>   
  <td style="white-space:nowrap"></td>   
  <td style="white-sp
ace:nowrap"></td>   
  <td style="white-space:nowrap"></td>   
  <td style="whit
e-space:nowrap"></td>   
  <td style="white-space:nowrap"></td>   
  <td style="
white-space:nowrap"></td>   
  <td style="white-space:nowrap"></td>   
  <td sty
le="white-space:nowrap"></td>   
  <td style="white-space:nowrap"></td>   
  <td
 style="white-space:nowrap"></td>   
  <td style="white-space:nowrap"></td>   

 <td style="white-space:nowrap"></td>   
  <td style="white-space:nowrap"></td>
  
  <td style="white-space:nowrap"></td>   
  <td style="white-space:nowrap"></
td>   
  <td style="white-space:nowrap"></td>   
  <td style="white-space:nowrap
"></td>     
</tr>

<!--REF == PRICE, OFFER == PURCH AMT-->
**CTDATA H__3        ListFooter                       811
</table>

<div id="listbottomcontrol">
        <a id="prevlinkbot" class="prevli
nk nondisp" href="?page=&rnd=&ordby="><img src="/websmart/v7.2/Idaho/images/arro
w_left.gif" style="border: none;" /></a>
        
        <a id="nextlinkbot" cl
ass="nextlink nondisp" href="?page=&rnd=&ordby="><img src="/websmart/v7.2/Idaho/
images/arrow_right.gif" style="border: none;" /></a>
</div>
</div><!--contents--
>

</div><!-- whitebg-->

</div><!--everything-->
</div><!--wrapping-->

<script
 type="text/javascript">
	// Control display of Prev and Next links
	if( > 0)
	{

		xl_GetObj("prevlinktop").className ="prevlink";
		xl_GetObj("prevlinkbot").cl
assName ="prevlink";
	}
	if( != 100)
	{
		xl_GetObj("nextlinktop").className ="n
extlink";
		xl_GetObj("nextlinkbot").className ="nextlink";
	}
</script>

</body
>
</html>


**CTDATA H__4        RtnToList                        66
<button onClick="javascript:location.href='?page=;'">Back</button>
**CTDATA H__5        SubHeader                        1210
<table class="mainlist" style="width:75%; border-left: 1px solid #C1DAD7;">
  <t
r>
    <th class="first">Date</th>
    <th>Date Funded</th>
    <th >App #</th>

    <th >Customer Name</th>         
    <th >Dealer #</th>   
    <th >Dealer N
ame</th>         
    <th >App Amt</th>         
    <th >Appr/Decl</th> 
    <t
h >Denial Reasons</th>        
    <th >App FICO</th>         
    <th >Co-App F
ICO</th>         
    <th >Debt Ratio</th>         
    <th >Total Income</th>
       
    <th >Bankruptcy Mos</th>         
    <th >Mos at Residence</th>
     
    <th >Mos at Employer</th>         
    <th >Mos Since Last C/O</th>
      
    <th >Renter?</th>         
    <th >Revl Availability</th>         

   <th >Revl Debt</th>         
    <th >Time in file + # of trades</th>
 
    <th >Mos since > 30</th>         
    <th >Mos since > 60</th>         

  <th >Mos since > 90</th>         
    <th >Calculated Disct</th>         

<th >App FICO Discount</th>         
    <th >Co-App FICO Discount</th>

    <th >Actual Bid</th>         
    <th >Stips Applied</th>         
    <th
>Entered App</th>         
    <th >Decisioned App</th>                  
  </tr
>
  
  

**CTDATA H__6        xlHeader                         5566
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
<Alignment ss:Vertical="Bottom" ss:WrapText="1"/>
</Style>

<Style
 ss:ID="Currency">
    <NumberFormat ss:Format="Currency" />
</Style>

</Styles>

<Worksheet ss:Name="DR">
<Table x:FullColumns="1" x:FullRows="1">

<Column ss:I
ndex="1" ss:AutoFitWidth="1" ss:Width="100"/>
<Column ss:Index="2" ss:AutoFitWid
th="1" ss:Width="100"/>
<Column ss:Index="3" ss:AutoFitWidth="1" ss:Width="100"/
>
<Column ss:Index="4" ss:AutoFitWidth="1" ss:Width="120"/>
<Column ss:Index="5"
 ss:AutoFitWidth="1" ss:Width="120"/>
<Column ss:Index="6" ss:AutoFitWidth="1" s
s:Width="120"/>
<Column ss:Index="7" ss:AutoFitWidth="1" ss:Width="120"/>
<Colum
n ss:Index="8" ss:AutoFitWidth="1" ss:Width="120"/>
<Column ss:Index="9" ss:Auto
FitWidth="1" ss:Width="300"/>
<Column ss:Index="10" ss:AutoFitWidth="1" ss:Width
="120"/>
<Column ss:Index="11" ss:AutoFitWidth="1" ss:Width="120"/>
<Column ss:I
ndex="12" ss:AutoFitWidth="1" ss:Width="120"/>
<Column ss:Index="13" ss:AutoFitW
idth="1" ss:Width="120"/>
<Column ss:Index="14" ss:AutoFitWidth="1" ss:Width="12
0"/>
<Column ss:Index="15" ss:AutoFitWidth="1" ss:Width="120"/>
<Column ss:Index
="16" ss:AutoFitWidth="1" ss:Width="120"/>
<Column ss:Index="17" ss:AutoFitWidth
="1" ss:Width="120"/>
<Column ss:Index="18" ss:AutoFitWidth="1" ss:Width="120"/>

<Column ss:Index="19" ss:AutoFitWidth="1" ss:Width="120"/>
<Column ss:Index="20
" ss:AutoFitWidth="1" ss:Width="120"/>
<Column ss:Index="21" ss:AutoFitWidth="1"
 ss:Width="120"/>
<Column ss:Index="22" ss:AutoFitWidth="1" ss:Width="120"/>
<Co
lumn ss:Index="23" ss:AutoFitWidth="1" ss:Width="120"/>
<Column ss:Index="24" ss
:AutoFitWidth="1" ss:Width="120"/>
<Column ss:Index="25" ss:AutoFitWidth="1" ss:
Width="120"/>
<Column ss:Index="26" ss:AutoFitWidth="1" ss:Width="120"/>
<Column
 ss:Index="27" ss:AutoFitWidth="1" ss:Width="500"/>
<Column ss:Index="28" ss:Aut
oFitWidth="1" ss:Width="120"/>
<Column ss:Index="29" ss:AutoFitWidth="1" ss:Widt
h="120"/>
<Column ss:Index="30" ss:AutoFitWidth="1" ss:Width="120"/>
<Column ss:
Index="31" ss:AutoFitWidth="1" ss:Width="120"/>

<Row ss:AutoFitHeight="0" ss:He
ight="15.75">
<Cell ss:StyleID="s21"><Data ss:Type="String">Date</Data></Cell>
<
Cell ss:StyleID="s21"><Data ss:Type="String">Date Funded</Data></Cell>
<Cell ss:
StyleID="s21"><Data ss:Type="String">App #</Data></Cell>
<Cell ss:StyleID="s21">
<Data ss:Type="String">Customer Name</Data></Cell>
<Cell ss:StyleID="s21"><Data
ss:Type="String">Dealer #</Data></Cell>
<Cell ss:StyleID="s21"><Data ss:Type="St
ring">Dealer Name</Data></Cell>
<Cell ss:StyleID="s21"><Data ss:Type="String">Ap
p Amt</Data></Cell>
<Cell ss:StyleID="s21"><Data ss:Type="String">Appr Decl</Dat
a></Cell>
<Cell ss:StyleID="s21"><Data ss:Type="String">Denial Reasons</Data></C
ell>
<Cell ss:StyleID="s21"><Data ss:Type="String">App FICO</Data></Cell>
<Cell
ss:StyleID="s21"><Data ss:Type="String">Co-App FICO</Data></Cell>
<Cell ss:Style
ID="s21"><Data ss:Type="String">Debt Ratio</Data></Cell>
<Cell ss:StyleID="s21">
<Data ss:Type="String">Total Income</Data></Cell>
<Cell ss:StyleID="s21"><Data s
s:Type="String">Bankruptcy Mos</Data></Cell>
<Cell ss:StyleID="s21"><Data ss:Typ
e="String">Mos at Residence</Data></Cell>
<Cell ss:StyleID="s21"><Data ss:Type="
String">Mos at Employer</Data></Cell>
<Cell ss:StyleID="s21"><Data ss:Type="Stri
ng">Mos since Last CO</Data></Cell>
<Cell ss:StyleID="s21"><Data ss:Type="String
">Renter</Data></Cell>
<Cell ss:StyleID="s21"><Data ss:Type="String">Revl Availa
bility</Data></Cell>
<Cell ss:StyleID="s21"><Data ss:Type="String">Revl Debt</Da
ta></Cell>
<Cell ss:StyleID="s21"><Data ss:Type="String">Time in file -- # of tr
ades</Data></Cell>
<Cell ss:StyleID="s21"><Data ss:Type="String">Mos since 30</D
ata></Cell>
<Cell ss:StyleID="s21"><Data ss:Type="String">Mos since 60</Data></C
ell>
<Cell ss:StyleID="s21"><Data ss:Type="String">Mos since 90</Data></Cell>
<C
ell ss:StyleID="s21"><Data ss:Type="String">Calculated Disct</Data></Cell>
<Cell
 ss:StyleID="s21"><Data ss:Type="String">App FICO Disct</Data></Cell>
<Cell ss:S
tyleID="s21"><Data ss:Type="String">Co-App FICO Disct</Data></Cell>
<Cell ss:Sty
leID="s21"><Data ss:Type="String">Actual Bid</Data></Cell>
<Cell ss:StyleID="s21
"><Data ss:Type="String">Stips Applied</Data></Cell>
<Cell ss:StyleID="s21"><Dat
a ss:Type="String">Entered App</Data></Cell>
<Cell ss:StyleID="s21"><Data ss:Typ
e="String">Decisioned App</Data></Cell>
</Row>
**CTDATA H__7        xlDetails                        1511
<Row>
<Cell><Data ss:Type="String"></Data></Cell> 
<Cell><Data ss:Type="String">
</Data></Cell> 
<Cell><Data ss:Type="String"></Data></Cell> 
<Cell><Data ss:Type
="String"> </Data></Cell>   
<Cell><Data ss:Type="String"></Data></Cell> 
<Cell>
<Data ss:Type="String"></Data></Cell>   
<Cell><Data ss:Type="String"></Data></C
ell>   
<Cell><Data ss:Type="String"></Data></Cell>
<Cell ss:StyleID="kwik_data"
><Data ss:Type="String"></Data></Cell>      
<Cell><Data ss:Type="String"></Data
></Cell>   
<Cell><Data ss:Type="String"></Data></Cell>   
<Cell><Data ss:Type="
String"></Data></Cell>   
<Cell><Data ss:Type="String"></Data></Cell>   
<Cell><
Data ss:Type="String"></Data></Cell>   
<Cell><Data ss:Type="String"></Data></Ce
ll>   
<Cell><Data ss:Type="String"></Data></Cell>   
<Cell><Data ss:Type="Strin
g"></Data></Cell>   
<Cell><Data ss:Type="String"></Data></Cell>   
<Cell><Data
ss:Type="String"></Data></Cell>   
<Cell><Data ss:Type="String"></Data></Cell>
 
<Cell><Data ss:Type="String"></Data></Cell>   
<Cell><Data ss:Type="String"></
Data></Cell>   
<Cell><Data ss:Type="String"></Data></Cell>   
<Cell><Data ss:Ty
pe="String"></Data></Cell>   
<Cell><Data ss:Type="String"></Data></Cell>   
<Ce
ll><Data ss:Type="String"></Data></Cell>   
<Cell><Data ss:Type="String"></Data>
</Cell>   
<Cell><Data ss:Type="String"></Data></Cell>   
<Cell  ss:StyleID="kwi
k_data"><Data ss:Type="String"></Data></Cell>   
<Cell><Data ss:Type="String"></
Data></Cell>   
<Cell><Data ss:Type="String"></Data></Cell>     
</Row>
**CTDATA H__8        xlFooter                         383

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

**CTDATA H__9        printHeader                      1127
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
  
 
  <div id="pagetitle">
  	<span style="margin-left:-10%">Underwri
ting Report</span>
  	
  	
  </div>
  
  	<input type="button" value="Print" id=
"print_btn" onclick="window.print();" />
      
      <div id="whitebg">

    <d
iv id="contents">
      
      
      <table class="mainlist" cellspacing="0">


**CTDATA H__10       printFooter                      149
</table>

</div><!--contents-->
</div><!-- whitebg-->

</div><!--everything-->
<
div id="everything"></div>
</div><!--wrapping-->



</body>
</html>



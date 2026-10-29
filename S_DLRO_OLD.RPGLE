     H/TITLE  System Settings:  Users
      * ProGen WebSmart Revision 28963
      * File overrides for compile command
      *__OV OVRDBF KWPDLOC    KWPDLOC
      *__OV OVRDBF F__ARR001  KWPDLOC
      *__OV OVRDBF KWP_DATA   KWP_DATA
      *__OV OVRDBF KWPDBASE   KWPDBASE
      *__OV OVRDBF KWPUBASE   KWPUBASE
      *__OV OVRDBF KWPUOPT    KWPUOPT
      *__OV OVRDBF AIT_PDOFFC AIT_PDOFFC
      *__OV OVRDBF KWPRTOD    KWPRTOD
      *__OV OVRDBF KWPRULE    KWPRULE
      *__OV OVRDBF KWPDDATA   KWPDDATA
      *__OV OVRDBF KWPRTO3    KWPRTO3
      *__OV OVRDBF KWPDRTO3   KWPDRTO3
      *__OV OVRDBF KWPPBASE   KWPPBASE
      *__OV OVRDBF AFF_PDLOC  AFF_PDLOC
      *__OV OVRDBF KWPDECMOD  KWPDECMOD
      *__   Following values are used to create the server program
      *__RO Pgm  lib DEVWEBSMT  Pgm  S_DLRO_OLD
      *__AG          WEBSMART
      *__CL          *OBJLIBNAM
      *__BD ECRTBND204
      *===============================================================*
      * Path:   s_dlro.pdw
      * System: DESKTOP-FBHFT7D
      * Project:Kwik-Loan
      * Set:    MZ Dev
      * User:   mzhang
      * Date Last Generated:   2018-08-23   07:27:43
      * Last Generated CRC: 98463A2F B6E92F23 F501C7E5 904E9097
      *===============================================================*
      */CPY *LIBL/PW_CSRC CPYRIGHT
      * File specifications
     FKWPDLOC   UF A E           K DISK    USROPN
     F                                     INFDS(FID001_   )
     FF__ARR001 UF A E             DISK    USROPN
     F                                     RENAME(RKWPDLOC     :R__ARR001   )
     FKWP_DATA  IF   E           K DISK    USROPN
     F                                     INFDS(FID002_   )
     FKWPDBASE  IF   E           K DISK    USROPN
     F                                     INFDS(FID003_   )
     FKWPUBASE  IF   E           K DISK    USROPN
     F                                     INFDS(FID004_   )
     FKWPUOPT   IF   E           K DISK    USROPN
     F                                     INFDS(FID005_   )
     FAIT_PDOFFCUF A E           K DISK    USROPN
     F                                     INFDS(FID006_   )
     FKWPRTOD   UF A E           K DISK    USROPN
     F                                     INFDS(FID007_   )
     FKWPRULE   IF   E           K DISK    USROPN
     F                                     INFDS(FID008_   )
     FKWPDDATA  UF A E           K DISK    USROPN
     F                                     INFDS(FID009_   )
     FKWPRTO3   IF   E           K DISK    USROPN
     F                                     INFDS(FID010_   )
     FKWPDRTO3  UF A E           K DISK    USROPN
     F                                     INFDS(FID011_   )
     FKWPPBASE  IF   E           K DISK    USROPN
     F                                     INFDS(FID012_   )
     FAFF_PDLOC UF A E           K DISK    USROPN
     F                                     INFDS(FID013_   )
     FKWPDECMOD IF   E           K DISK    USROPN
     F                                     INFDS(FID014_   )

     D PTL__           S             50    DIM(1) CTDATA PERRCD(1)
     D RTLLA__         S             11    DIM(180)

     D*+FLDDCL Field declarations

     Duserdata         DS                  INZ
     D client                         5A
     D userid                        32A
     D location                       5A

     D boxname         S             10A
     D boxid           S             10A
     D boxtype         S             10A
     D jvalidation     S             30A
     D rnd             S              6A
     D lastpgm         S             20A
     D lastpgm2        S             20A
     D disabled        S             10A
     D addhref         S            200A
     D csz             S            100A
     D artncod         S              5A
     D startrrn        S              9P 0
     D endrrn          S              9P 0
     D rcdcnt          S              5P 0
     D prevstate       S              5P 0
     D nextstate       S              5P 0
     D listsize        S              5P 0
     D rrn             S              9P 0
     D savedrrn        S              9A
     D errmsg          S            100A
     D pdozip5         S              5P 0
     D mode            S             15A
     D ibvsopts        S             20A     DIM(5        )
     D ibvsopt         S              1A
     D ibvsiter        S              3I 0
     D tj_client       S              5A
     D tj_func         S             25A
     D tj_dlr          S             25A
     D tj_loc          S             11A
     D tj_cust         S              9A
     D tj_acct         S              5A
     D tj_amt          S             11A
     D tj_datein       S             10A
     D tj_seq          S             11A
     D tj_rate         S           1000A

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
     D rwcolor2__      S             32A   INZ('odd')


     D TASKRAN__       S              1    INZ(*OFF)


     D H__1            S             80    PERRCD(1) CTDATA DIM(42          )

     D H__2            S             80    PERRCD(1) CTDATA DIM(6           )

     D H__3            S             80    PERRCD(1) CTDATA DIM(13          )

     D H__4            S             80    PERRCD(1) CTDATA DIM(2           )

     D H__5            S             80    PERRCD(1) CTDATA DIM(31          )

     D H__6            S             80    PERRCD(1) CTDATA DIM(2           )

     D H__7            S             80    PERRCD(1) CTDATA DIM(121         )

     D H__8            S             80    PERRCD(1) CTDATA DIM(33          )


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
     D next0...
     D                 PR
     D disprcd0...
     D                 PR
     D delconf0...
     D                 PR
     D deletercd0...
     D                 PR
     D beginmanage0...
     D                 PR
     D endmanage0...
     D                 PR
     D wrtpdstbox0...
     D                 PR
     D QPGM__          S             21A
     D LstPmlErr_      S              4P 0 IMPORT
     D prto3idbox0...
     D                 PR
     D prodbox0...
     D                 PR
     D achtypebox0...
     D                 PR
     D decmodbox0...
     D                 PR
     D wrtprodbox0...
     D                 PR
     D webmodbox0...
     D                 PR
     D ppcardbox0...
     D                 PR
     D ppibvbox0...
     D                 PR
     D ibvwbox0...
     D                 PR
     D ibvsbox0...
     D                 PR
     D taxjar0...
     D                 PR
     D CURTIME__       S              6P 0
     D QPGMNAM__       S             20A
     D SmurfChk__      S              1A   INZ(*ON)
     D Smurf_ID__      S             64A   IMPORT
     D Smurf_Rw__      S              9B 0 IMPORT

     D boxselect       S                   LIKE(p_zkeya       )
     D disabled_esign  S                   LIKE(disabled      )
     D sendibv         S                   LIKE(pddchar       )
     D sendnot         S                   LIKE(pddchar       )
     D office          S                   LIKE(pdloc         )
     D startoffc       S                   LIKE(pdloc         )
     D renttoown       S                   LIKE(pruleyesno    )
     D esignoffice     S                   LIKE(pruleyesno    )
     D ibvopt          S                   LIKE(pruleyesno    )
     D notopt          S                   LIKE(pruleyesno    )
     D rto3id          S                   LIKE(prto3id       )
     D prod            S                   LIKE(pprod         )

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

     C     DL001_        KLIST
     C                   KFLD                    pdno
     C     officekey     KLIST
     C                   KFLD                    pdno
     C                   KFLD                    pdloc
     C     DL003_        KLIST
     C                   KFLD                    pdno
     C     DL004_        KLIST
     C                   KFLD                    puid
     C     DL005_        KLIST
     C                   KFLD                    puid
     C                   KFLD                    puotype
     C     DL006_        KLIST
     C                   KFLD                    pdno
     C                   KFLD                    pdloc
     C     DL007_        KLIST
     C                   KFLD                    pdno
     C                   KFLD                    pdloc
     C     DL008_        KLIST
     C                   KFLD                    pruletype
     C                   KFLD                    prulename
     C     DL009_        KLIST
     C                   KFLD                    pdno
     C                   KFLD                    pddtype
     C                   KFLD                    pddcode
     C     DL010_        KLIST
     C                   KFLD                    prto3id
     C     DL011_        KLIST
     C                   KFLD                    pdno
     C                   KFLD                    pdloc
     C     DL012_        KLIST
     C                   KFLD                    pprod
     C     DL013_        KLIST
     C                   KFLD                    pdno
     C                   KFLD                    pdloc
     C     DL014_        KLIST
     C                   KFLD                    pdmodel
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
       lastpgm = GetSmurf2_('LASTPGM');
       if (lastpgm = 'LNVIEW.pgm');
        lastpgm = 'LNLIST.pgm';
       else;
        lastpgm2 = lastpgm;
       endif;
       if (lastpgm = 'LNM_MAIN.pgm');
        lastpgm = 'lnlist.pgm';
       endif;
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
       kw_wrtdataarea('*LDA':userid:'*LIBL':1:32);
       listsize = 8;
       Open_File_('KWPRULE': '*FIRST':  'Y');
       pruletype = 'SYSTEM';
       prulename = 'RENTTOOWN';
       AM008_ = CV_BYKEY;
       CHAIN(E) DL008_ RKWPRULE;
       RS008_ = RcdSts2_('GETRCD': %error: %found: %eof);
       if (RS008_ = '1');
        renttoown = pruleyesno;
       endif;
       pruletype = 'SYSTEM';
       prulename = 'ESIGNDLROFFICE';
       AM008_ = CV_BYKEY;
       CHAIN(E) DL008_ RKWPRULE;
       RS008_ = RcdSts2_('GETRCD': %error: %found: %eof);
       if (RS008_ = '1');
        esignoffice = pruleyesno;
       endif;
       if (esignoffice <> 'Y');
       endif;
       pruletype = 'S_DLRO';
       prulename = 'IBVOPT';
       AM008_ = CV_BYKEY;
       CHAIN(E) DL008_ RKWPRULE;
       RS008_ = RcdSts2_('GETRCD': %error: %found: %eof);
       if (RS008_ = '1');
        ibvopt = pruleyesno;
       endif;
       pruletype = 'S_DLRO';
       prulename = 'NOTOPT';
       AM008_ = CV_BYKEY;
       CHAIN(E) DL008_ RKWPRULE;
       RS008_ = RcdSts2_('GETRCD': %error: %found: %eof);
       if (RS008_ = '1');
        notopt = pruleyesno;
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
       if (task__ = 'NEXT');
        taskran__ = *ON;
        next0();
       endif ;
       if (task__ = 'DISP');
        taskran__ = *ON;
        disprcd0();
       endif ;
       if (task__ = 'DELCONF');
        taskran__ = *ON;
        delconf0();
       endif ;
       if (task__ = 'DEL');
        taskran__ = *ON;
        deletercd0();
       endif ;
       if (task__ = 'BEGINMANAGE');
        taskran__ = *ON;
        beginmanage0();
       endif ;
       if (task__ = 'ENDMANAGE');
        taskran__ = *ON;
        endmanage0();
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
       pdno = getparm3_('pdno':'*OPT');
       AM003_ = CV_BYKEY;
       CHAIN(NE) DL003_ RKWPDBASE;
       RS003_ = RcdSts2_('GETRCD': %error: %found: %eof);
       puid = userid;
       AM004_ = CV_BYKEY;
       CHAIN(NE) DL004_ RKWPUBASE;
       RS004_ = RcdSts2_('GETRCD': %error: %found: %eof);
       puotype = 'ADDDLR';
       AM005_ = CV_BYKEY;
       CHAIN(NE) DL005_ RKWPUOPT;
       RS005_ = RcdSts2_('GETRCD': %error: %found: %eof);
       select;
       when ((RS005_ = '1') and (puoyesno = 'N'));
       addhref = '';
       disabled = 'disabled';
       when ((puprofile <> 'ADMINISTRATOR') and (puoyesno <> 'Y'));
       addhref = '';
       disabled = 'disabled';
       other;
       addhref = 's_dlro.pgm?task=beginmanage&rrn=0&PDNO=' + %trim(pdno);
       endsl;
       outweb_(%subst(%str(%addr(H__1(1))):1:1038));
       wfrtn__ = AfToPage_(QPGMNAM__);
       outweb_(%subst(%str(%addr(H__1(13))):79:248));
       wfrtn__ = AfToPage_(PDNO);
       outweb_(%subst(%str(%addr(H__1(17))):7:2));
       wfrtn__ = AfToPage_(PDNAME);
       outweb_(%subst(%str(%addr(H__1(17))):9:733));
       wfrtn__ = AfToPage_(ADDHREF);
       outweb_(%subst(%str(%addr(H__1(26))):22:1335));
       rcdcnt = 0;
       if (OFFICE> 0);
        pdloc = office;
        SETLL  officekey RKWPDLOC;
        RS001_ = RcdSts2_('POSRCD':%error:%equal:%eof);
        READE(E) DL001_ RKWPDLOC;
        RS001_ = RcdSts2_('GETNXTRCD':%error:%found:%eof);
        AM001_ = CV_ByKey;
       else;
        pdloc = 1;
        SETLL  officekey RKWPDLOC;
        RS001_ = RcdSts2_('POSRCD':%error:%equal:%eof);
        READE(E) DL001_ RKWPDLOC;
        RS001_ = RcdSts2_('GETNXTRCD':%error:%found:%eof);
        AM001_ = CV_ByKey;
       endif;
       if (PDLOC = 0);
        READE(E) DL001_ RKWPDLOC;
        RS001_ = RcdSts2_('GETNXTRCD':%error:%found:%eof);
        AM001_ = CV_ByKey;
       endif;
       startoffc = PDLOC;
       if (RS001_ <> '1');
        PDLOC = 99999;
        SETLL  officekey RKWPDLOC;
        RS001_ = RcdSts2_('POSRCD':%error:%equal:%eof);
        READPE(E) DL001_ RKWPDLOC;
        RS001_ = RcdSts2_('GETPRVRCD': %error: %found: %eof);
        AM001_ = CV_ByKey;
       endif;
       dow ((RS001_ = '1'));
       rrn = RR_001_;
       if (rcdcnt = 0);
        startrrn = RR_001_;
       endif;
       if (pdcity <> '');
        csz = %trim(pdcity) + ', ' + pdst + ' ' + %editw(PDZIP:'     -    ');
       endif;
       if (PDLOC <> 0);
        Flip_Rc_();
        outweb_(%subst(%str(%addr(H__2(1))):1:11));
        wfrtn__ = AfToPage_(ARCLR__);
        outweb_(%subst(%str(%addr(H__2(1))):12:24));
        wfrtn__ = AfToPage_(QPGMNAM__);
        outweb_(%subst(%str(%addr(H__2(1))):36:22));
        AfToPage_(%trim(%editc(RRN:'X')));
        outweb_(%subst(%str(%addr(H__2(1))):58:13));
        AfToPage_(%trim(%editc(STARTRRN:'X')));
        outweb_(%subst(%str(%addr(H__2(1))):71:6));
        wfrtn__ = AfToPage_(PDNO);
        outweb_(%subst(%str(%addr(H__2(1))):77:99));
        wfrtn__ = AfToPage_(QPGMNAM__);
        outweb_(%subst(%str(%addr(H__2(3))):16:18));
        AfToPage_(%trim(%editc(RRN:'X')));
        outweb_(%subst(%str(%addr(H__2(3))):34:13));
        AfToPage_(%trim(%editc(STARTRRN:'X')));
        outweb_(%subst(%str(%addr(H__2(3))):47:6));
        wfrtn__ = AfToPage_(PDNO);
        outweb_(%subst(%str(%addr(H__2(3))):53:118));
        AfToPage_(%trim(%editc(PDLOC:'4')));
        outweb_(%subst(%str(%addr(H__2(5))):11:25));
        wfrtn__ = AfToPage_(PDNAM1);
        outweb_(%subst(%str(%addr(H__2(5))):36:25));
        wfrtn__ = AfToPage_(PDADR1);
        outweb_(%subst(%str(%addr(H__2(5))):61:25));
        wfrtn__ = AfToPage_(CSZ);
        outweb_(%subst(%str(%addr(H__2(6))):6:12));
       endif;
       endrrn = RR_001_;
       rcdcnt = rcdcnt + 1;
       READE(E) DL001_ RKWPDLOC;
       RS001_ = RcdSts2_('GETNXTRCD':%error:%found:%eof);
       AM001_ = CV_ByKey;
       enddo;
       PDLOC = startOffc;
       SETLL  officekey RKWPDLOC;
       RS001_ = RcdSts2_('POSRCD':%error:%equal:%eof);
       READPE(E) DL001_ RKWPDLOC;
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
        PDLOC = PDLOC + 1;
        SETLL  officekey RKWPDLOC;
        RS001_ = RcdSts2_('POSRCD':%error:%equal:%eof);
        READE(E) DL001_ RKWPDLOC;
        RS001_ = RcdSts2_('GETNXTRCD':%error:%found:%eof);
        AM001_ = CV_ByKey;
        if (RS001_ = '1');
         endrrn = RR_001_;
         nextstate = 1;
        endif;
       endif;
       outweb_(%subst(%str(%addr(H__3(1))):1:983));

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
       pdno = getparm3_('pdno':'*OPT');
       OFFICE = %dec(aton_( getparm3_('OFFICE':'*OPT'):46:16):11:0);
       PDLOC = OFFICE;
       SETLL  officekey RKWPDLOC;
       RS001_ = RcdSts2_('POSRCD':%error:%equal:%eof);
       READPE(E) DL001_ RKWPDLOC;
       RS001_ = RcdSts2_('GETPRVRCD': %error: %found: %eof);
       AM001_ = CV_ByKey;
       rcdcnt = 0;
       dow ((((RS001_ = '1')) and ((rcdcnt< listsize))));
       rcdcnt = rcdcnt + 1;
       READPE(E) DL001_ RKWPDLOC;
       RS001_ = RcdSts2_('GETPRVRCD': %error: %found: %eof);
       AM001_ = CV_ByKey;
       enddo;
       OFFICE = PDLOC;
       displist0();
      /end-free
     c     *PSSR         begsr
     c                   endsr
     P                 E


     P*---------------------------------------------------------------------
     P* next0...                    - User defined function
     P*---------------------------------------------------------------------
     P next0...
     P                 B
     D next0...
     D                 PI




      /free
       startrrn = %dec(aton_( getparm3_('startrrn':'*OPT'):46:16):9:0);
       endrrn = %dec(aton_( getparm3_('endrrn':'*OPT'):46:16):9:0);
       nextstate = %dec(aton_( getparm3_('nextstate':'*OPT'):46:16):5:0);
       prevstate = %dec(aton_( getparm3_('prevstate':'*OPT'):46:16):5:0);
       startrrn = endrrn;
       displist0();
      /end-free
     c     *PSSR         begsr
     c                   endsr
     P                 E


     P*---------------------------------------------------------------------
     P* disprcd0...                 - User defined function
     P*---------------------------------------------------------------------
     P disprcd0...
     P                 B
     D disprcd0...
     D                 PI




      /free
       rrn = %dec(aton_( getparm3_('rrn':'*MAND'):46:16):9:0);
       savedrrn = getparm3_('FirstRowRRN':'*OPT');
       RR_001_ = rrn;
       AM001_ = CV_BYRRN;
       CHAIN(E) RR_001_ R__ARR001;
       RS001_ = RcdSts2_('GETRCD': %error: %found: %eof);
       outweb_(%subst(%str(%addr(H__4(1))):1:143));

      /end-free
     c     *PSSR         begsr
     c                   endsr
     P                 E


     P*---------------------------------------------------------------------
     P* delconf0...                 - User defined function
     P*---------------------------------------------------------------------
     P delconf0...
     P                 B
     D delconf0...
     D                 PI




      /free
       rrn = %dec(aton_( getparm3_('rrn':'*MAND'):46:16):9:0);
       savedrrn = getparm3_('FirstRowRRN':'*OPT');
       RR_001_ = rrn;
       AM001_ = CV_BYRRN;
       CHAIN(E) RR_001_ R__ARR001;
       RS001_ = RcdSts2_('GETRCD': %error: %found: %eof);
       outweb_(%subst(%str(%addr(H__5(1))):1:1441));
       wfrtn__ = AfToPage_(QPGMNAM__);
       outweb_(%subst(%str(%addr(H__5(19))):2:131));
       AfToPage_(%trim(%editc(RRN:'X')));
       outweb_(%subst(%str(%addr(H__5(20))):53:62));
       wfrtn__ = AfToPage_(SAVEDRRN);
       outweb_(%subst(%str(%addr(H__5(21))):35:150));
       AfToPage_(%trim(%editc(PDLOC:'X')));
       outweb_(%subst(%str(%addr(H__5(23))):25:132));
       wfrtn__ = AfToPage_(PDNAM1);
       outweb_(%subst(%str(%addr(H__5(24))):77:216));
       wfrtn__ = AfToPage_(QPGMNAM__);
       outweb_(%subst(%str(%addr(H__5(27))):53:14));
       AfToPage_(%trim(%editc(RRN:'X')));
       outweb_(%subst(%str(%addr(H__5(27))):67:13));
       wfrtn__ = AfToPage_(SAVEDRRN);
       outweb_(%subst(%str(%addr(H__5(27))):80:110));
       wfrtn__ = AfToPage_(PDNO);
       outweb_(%subst(%str(%addr(H__5(29))):30:211));

      /end-free
     c     *PSSR         begsr
     c                   endsr
     P                 E


     P*---------------------------------------------------------------------
     P* deletercd0...               - User defined function
     P*---------------------------------------------------------------------
     P deletercd0...
     P                 B
     D deletercd0...
     D                 PI




      /free
       rrn = %dec(aton_( getparm3_('rrn':'*MAND'):46:16):9:0);
       savedrrn = getparm3_('FirstRowRRN':'*OPT');
       RR_001_ = rrn;
       AM001_ = CV_BYRRN;
       CHAIN(E) RR_001_ R__ARR001;
       RS001_ = RcdSts2_('GETRCD': %error: %found: %eof);
       if (rrn = %dec(aton_(savedrrn:46:16):46:16));
        SETLL  DL001_ RKWPDLOC;
        RS001_ = RcdSts2_('POSRCD':%error:%equal:%eof);
        READPE(E) DL001_ RKWPDLOC;
        RS001_ = RcdSts2_('GETPRVRCD': %error: %found: %eof);
        AM001_ = CV_ByKey;
        savedrrn = %trim(%editc(RR_001_:'P'));
        RR_001_ = rrn;
        AM001_ = CV_BYRRN;
        CHAIN(E) RR_001_ R__ARR001;
        RS001_ = RcdSts2_('GETRCD': %error: %found: %eof);
       endif;
       Redirect2_( 's_dlro.pgm?PDNO=' + %trim(pdno):'*SAME':'rand');
      /end-free
     c     *PSSR         begsr
     c                   endsr
     P                 E


     P*---------------------------------------------------------------------
     P* beginmanage0...             - User defined function
     P*---------------------------------------------------------------------
     P beginmanage0...
     P                 B
     D beginmanage0...
     D                 PI




      /free
       rrn = %dec(aton_( getparm3_('rrn':'*MAND'):46:16):9:0);
       savedrrn = getparm3_('FirstRowRRN':'*OPT');
       pdno = getparm3_('pdno':'*OPT');
       RR_001_ = rrn;
       AM001_ = CV_BYRRN;
       CHAIN(E) RR_001_ R__ARR001;
       RS001_ = RcdSts2_('GETRCD': %error: %found: %eof);
       AM006_ = CV_BYKEY;
       CHAIN(NE) DL006_ RAITPDOFFC;
       RS006_ = RcdSts2_('GETRCD': %error: %found: %eof);
       AM007_ = CV_BYKEY;
       CHAIN(NE) DL007_ RKWPRTOD;
       RS007_ = RcdSts2_('GETRCD': %error: %found: %eof);
       AM013_ = CV_BYKEY;
       CHAIN(NE) DL013_ RAFFPDLOC;
       RS013_ = RcdSts2_('GETRCD': %error: %found: %eof);
       if (ibvopt = 'Y');
        pddtype = %trim(%editc(PDLOC:'P'));
        pddcode = 'SENDIBV';
        AM009_ = CV_BYKEY;
        CHAIN(NE) DL009_ RKWPDDATA;
        RS009_ = RcdSts2_('GETRCD': %error: %found: %eof);
        if (((RS009_ = '1') and (pddchar = 'Y')));
         sendibv = 'Y';
        else;
         if (((RS009_ = '1') and (pddchar = 'N')));
          sendibv = 'N';
         endif;
        endif;
       endif;
       if (notopt = 'Y');
        pddtype = %trim(%editc(PDLOC:'P'));
        pddcode = 'SENDNOT';
        AM009_ = CV_BYKEY;
        CHAIN(NE) DL009_ RKWPDDATA;
        RS009_ = RcdSts2_('GETRCD': %error: %found: %eof);
        if (((RS009_ = '1') and (pddchar = 'Y')));
         sendnot = 'Y';
        else;
         if (((RS009_ = '1') and (pddchar = 'N')));
          sendnot = 'N';
         endif;
        endif;
       endif;
       AM011_ = CV_BYKEY;
       CHAIN(NE) DL011_ RKWPDRTO3;
       RS011_ = RcdSts2_('GETRCD': %error: %found: %eof);
       outweb_(%subst(%str(%addr(H__7(1))):1:332));
       outweb_(%subst(%str(%addr(H__8(1))):1:2599));
       outweb_(%subst(%str(%addr(H__7(5))):13:529));
       wfrtn__ = AfToPage_(QPGMNAM__);
       outweb_(%subst(%str(%addr(H__7(11))):62:119));
       AfToPage_(%trim(%editc(RRN:'X')));
       outweb_(%subst(%str(%addr(H__7(13))):21:56));
       wfrtn__ = AfToPage_(SAVEDRRN);
       outweb_(%subst(%str(%addr(H__7(13))):77:49));
       wfrtn__ = AfToPage_(PDNO);
       outweb_(%subst(%str(%addr(H__7(14))):46:311));
       wfrtn__ = AfToPage_(PDNO);
       outweb_(%subst(%str(%addr(H__7(18))):37:664));
       wfrtn__ = AfToPage_(DISABLED);
       outweb_(%subst(%str(%addr(H__7(26))):61:8));
       AfToPage_(%trim(%editc(PDLOC:'4')));
       outweb_(%subst(%str(%addr(H__7(26))):69:238));
       wfrtn__ = AfToPage_(DISABLED);
       outweb_(%subst(%str(%addr(H__7(29))):67:8));
       wfrtn__ = AfToPage_(PDNAM1);
       outweb_(%subst(%str(%addr(H__7(29))):75:236));
       wfrtn__ = AfToPage_(DISABLED_ESIGN);
       outweb_(%subst(%str(%addr(H__7(32))):71:8));
       wfrtn__ = AfToPage_(PDNAM2);
       outweb_(%subst(%str(%addr(H__7(32))):79:238));
       wfrtn__ = AfToPage_(DISABLED_ESIGN);
       outweb_(%subst(%str(%addr(H__7(35))):77:8));
       wfrtn__ = AfToPage_(PDEMAIL);
       outweb_(%subst(%str(%addr(H__7(36))):5:260));
       wfrtn__ = AfToPage_(DISABLED);
       outweb_(%subst(%str(%addr(H__7(39))):25:8));
       wfrtn__ = AfToPage_(PDADR1);
       outweb_(%subst(%str(%addr(H__7(39))):33:243));
       wfrtn__ = AfToPage_(DISABLED);
       outweb_(%subst(%str(%addr(H__7(42))):36:8));
       wfrtn__ = AfToPage_(PDADR2);
       outweb_(%subst(%str(%addr(H__7(42))):44:248));
       wfrtn__ = AfToPage_(%trim(%editw(PDPHON:'   -   -    ')));
       outweb_(%subst(%str(%addr(H__7(45))):52:238));
       wfrtn__ = AfToPage_(DISABLED);
       outweb_(%subst(%str(%addr(H__7(48))):50:8));
       wfrtn__ = AfToPage_(PDCITY);
       outweb_(%subst(%str(%addr(H__7(48))):58:181));
       wrtpdstbox0();
       outweb_(%subst(%str(%addr(H__7(50))):79:212));
       wfrtn__ = AfToPage_(DISABLED);
       outweb_(%subst(%str(%addr(H__7(53))):51:8));
       AfToPage_(%trim(%editc(PDZIP:'X')));
       outweb_(%subst(%str(%addr(H__7(53))):59:270));
       wfrtn__ = AfToPage_(DISABLED);
       outweb_(%subst(%str(%addr(H__7(57))):9:8));
       AfToPage_(%trim(%editc(PDEFTABA:'X')));
       outweb_(%subst(%str(%addr(H__7(57))):17:272));
       wfrtn__ = AfToPage_(DISABLED);
       outweb_(%subst(%str(%addr(H__7(60))):49:8));
       wfrtn__ = AfToPage_(PDEFTACCT);
       outweb_(%subst(%str(%addr(H__7(60))):57:199));
       achtypebox0();
       outweb_(%subst(%str(%addr(H__7(63))):16:52));
       if (client = '106');
        OutWeb_(%trimr( '<tr><td class="left">EFIN:</td><td class="right"><in-
       put type="text" name="AIT_EFIN" size="6" maxlength="6" value="' +
       %trim(ait_efin) + '" style="width: 150px;"></td></tr><tr>'));
       endif;
       if (renttoown = 'Y');
        OutWeb_(%trimr( '<tr><td class="left">RTO Tax Rate:</td><td class="ri-
       ght"><input type="text" name="PRTORATE" size="6" maxlength="6" value="-
       ' + %editc(PRTORATE:'J') + '" style="width: 150px;"></td></tr><tr>'));
        OutWeb_(%trimr( '<tr><td class="left">RTO Refund Percentage:</td><td -
       class="right"><input type="text" name="PRTOREFPCT" size="6" maxlength=-
       "6" value="' + %editc(PRTOREFPCT:'J') + '" style="width: 150px;"></td>-
       </tr><tr>'));
        OutWeb_(%trimr( '<tr><td class="left">RTO LDW Rate:</td><td class="ri-
       ght"><input type="text" name="PRTOLDW" size="6" maxlength="6" value="'
        + %editc(PRTOLDW:'J') + '" style="width: 150px;"></td></tr><tr>'));
        OutWeb_(%trimr( '<tr><td class="left">RTO Delivery Fee:</td><td class-
       ="right"><input type="text" name="PRTODELIV" size="6" maxlength="6" va-
       lue="' + %editc(PRTODELIV:'J') + '" style="width: 150px;"></td></tr><t-
       r>'));
        OutWeb_(%trimr( '<tr><td class="left">RTO Processing Fee:</td><td cla-
       ss="right"><input type="text" name="PRTOPROC" size="6" maxlength="6" v-
       alue="' + %editc(PRTOPROC:'J') + '" style="width: 150px;"></td></tr><t-
       r>'));
        OutWeb_(%trimr( '<tr><td class="left">Early Buyout Fee:</td><td class-
       ="right"><input type="text" name="PEPOFEE" size="6" maxlength="6" valu-
       e="' + %editc(PEPOFEE:'J') + '" style="width: 150px;"></td></tr><tr>')
       );
        OutWeb_(%trimr( '<tr><td class="left">Early Buyout Pct:</td><td class-
       ="right"><input type="text" name="PEPOPCT" size="6" maxlength="6" valu-
       e="' + %editc(PEPOPCT:'J') + '" style="width: 150px;"></td></tr><tr>')
       );
        OutWeb_(%trimr( '<tr><td class="left">RTO 1st Payment:</td><td class=-
       "right"><input type="text" name="PRTOPMT" size="6" maxlength="6" value-
       ="' + %editc(PRTOPMT:'J') + '" style="width: 150px;"></td></tr><tr>'))
       ;
        OutWeb_('<tr><td class="left">RTO 3rd Party Product:</td><td class="r-
       ight">');
        prodbox0();
        OutWeb_('</td></tr>');
        OutWeb_('<tr><td class="left">RTO 3rd Party:</td><td class="right">');
        prto3idbox0();
        OutWeb_('</td></tr>');
       endif;
       if (ibvopt = 'Y');
        OutWeb_('<tr><td class="left">Send IBV Text & Email:</td><td class="r-
       ight">'+x'0D'+''+x'25'+'                		 <select name="SENDIBV">'+x'-
       0D'+''+x'25'+'                		 <option value=""></option>'+x'0D'+''
       +x'25'+'                		 <option value="Y" ');
        if (sendibv = 'Y');
         OutWeb_('selected');
        endif;
        OutWeb_('>Send Automatically</option>');
        OutWeb_('<option value="N" ');
        if (sendibv = 'N');
         OutWeb_('selected');
        endif;
        OutWeb_('>Send Manually</option></select></td></tr><tr>');
       endif;
       if (notopt = 'Y');
        OutWeb_('<tr><td class="left">Text & Email Notification:</td><td clas-
       s="right">'+x'0D'+''+x'25'+'                		 <select name="SENDNOT">-
       '+x'0D'+''+x'25'+'                		 <option value=""></option>'+x'0D'
       +''+x'25'+'                		 <option value="Y" ');
        if (sendnot = 'Y');
         OutWeb_('selected');
        endif;
        OutWeb_('>Yes</option>');
        OutWeb_('<option value="N" ');
        if (sendnot = 'N');
         OutWeb_('selected');
        endif;
        OutWeb_('>No</option></select></td></tr><tr>');
       endif;
       outweb_(%subst(%str(%addr(H__7(63))):68:148));
       wrtprodbox0();
       outweb_(%subst(%str(%addr(H__7(65))):56:185));
       decmodbox0();
       outweb_(%subst(%str(%addr(H__7(68))):1:162));
       webmodbox0();
       outweb_(%subst(%str(%addr(H__7(70))):3:203));
       ppcardbox0();
       outweb_(%subst(%str(%addr(H__7(72))):46:149));
       ppibvbox0();
       outweb_(%subst(%str(%addr(H__7(74))):35:167));
       ibvwbox0();
       outweb_(%subst(%str(%addr(H__7(76))):42:165));
       ibvsbox0();
       outweb_(%subst(%str(%addr(H__7(78))):47:565));
       AfToPage_(%trim(%editc(RRN:'X')));
       outweb_(%subst(%str(%addr(H__7(85))):52:2890));

      /end-free
     c     *PSSR         begsr
     c                   endsr
     P                 E


     P*---------------------------------------------------------------------
     P* endmanage0...               - User defined function
     P*---------------------------------------------------------------------
     P endmanage0...
     P                 B
     D endmanage0...
     D                 PI




      /free
       mode = getparm3_('mode':'*OPT');
       rrn = %dec(aton_( getparm3_('rrn':'*OPT'):46:16):9:0);
       savedrrn = getparm3_('FirstRowRRN':'*OPT');
       pdno = getparm3_('pdno':'*OPT');
       if (rrn = 0);
        PDLOC = %dec(aton_( getparm3_('PDLOC':'*OPT'):46:16):11:0);
        pdnam1 = getparm3_('pdnam1':'*OPT');
        pdnam2 = getparm3_('pdnam2':'*OPT');
        pdemail = getparm3_('pdemail':'*OPT');
        pdadr1 = getparm3_('pdadr1':'*OPT');
        pdadr2 = getparm3_('pdadr2':'*OPT');
        PDPHON = %dec(aton_( getparm3_('PDPHON':'*OPT'):46:16):10:0);
        pdcity = getparm3_('pdcity':'*OPT');
        pdst = getparm3_('pdst':'*OPT');
        PDZIP = %dec(aton_( getparm3_('PDZIP':'*OPT'):46:16):9:0);
        pdlprod = getparm3_('pdlprod':'*OPT');
        pdlmodel = getparm3_('pdlmodel':'*OPT');
        pdlwmodel = getparm3_('pdlwmodel':'*OPT');
        if (PDLOC = 0);
         errmsg = 'ERROR: OFFICE CANNOT BE ZERO';
         Alert_(errmsg);
         outweb_(%subst(%str(%addr(H__7(1))):1:332));
         outweb_(%subst(%str(%addr(H__8(1))):1:2599));
         outweb_(%subst(%str(%addr(H__7(5))):13:529));
         wfrtn__ = AfToPage_(QPGMNAM__);
         outweb_(%subst(%str(%addr(H__7(11))):62:119));
         AfToPage_(%trim(%editc(RRN:'X')));
         outweb_(%subst(%str(%addr(H__7(13))):21:56));
         wfrtn__ = AfToPage_(SAVEDRRN);
         outweb_(%subst(%str(%addr(H__7(13))):77:49));
         wfrtn__ = AfToPage_(PDNO);
         outweb_(%subst(%str(%addr(H__7(14))):46:311));
         wfrtn__ = AfToPage_(PDNO);
         outweb_(%subst(%str(%addr(H__7(18))):37:664));
         wfrtn__ = AfToPage_(DISABLED);
         outweb_(%subst(%str(%addr(H__7(26))):61:8));
         AfToPage_(%trim(%editc(PDLOC:'4')));
         outweb_(%subst(%str(%addr(H__7(26))):69:238));
         wfrtn__ = AfToPage_(DISABLED);
         outweb_(%subst(%str(%addr(H__7(29))):67:8));
         wfrtn__ = AfToPage_(PDNAM1);
         outweb_(%subst(%str(%addr(H__7(29))):75:236));
         wfrtn__ = AfToPage_(DISABLED_ESIGN);
         outweb_(%subst(%str(%addr(H__7(32))):71:8));
         wfrtn__ = AfToPage_(PDNAM2);
         outweb_(%subst(%str(%addr(H__7(32))):79:238));
         wfrtn__ = AfToPage_(DISABLED_ESIGN);
         outweb_(%subst(%str(%addr(H__7(35))):77:8));
         wfrtn__ = AfToPage_(PDEMAIL);
         outweb_(%subst(%str(%addr(H__7(36))):5:260));
         wfrtn__ = AfToPage_(DISABLED);
         outweb_(%subst(%str(%addr(H__7(39))):25:8));
         wfrtn__ = AfToPage_(PDADR1);
         outweb_(%subst(%str(%addr(H__7(39))):33:243));
         wfrtn__ = AfToPage_(DISABLED);
         outweb_(%subst(%str(%addr(H__7(42))):36:8));
         wfrtn__ = AfToPage_(PDADR2);
         outweb_(%subst(%str(%addr(H__7(42))):44:248));
         wfrtn__ = AfToPage_(%trim(%editw(PDPHON:'   -   -    ')));
         outweb_(%subst(%str(%addr(H__7(45))):52:238));
         wfrtn__ = AfToPage_(DISABLED);
         outweb_(%subst(%str(%addr(H__7(48))):50:8));
         wfrtn__ = AfToPage_(PDCITY);
         outweb_(%subst(%str(%addr(H__7(48))):58:181));
         wrtpdstbox0();
         outweb_(%subst(%str(%addr(H__7(50))):79:212));
         wfrtn__ = AfToPage_(DISABLED);
         outweb_(%subst(%str(%addr(H__7(53))):51:8));
         AfToPage_(%trim(%editc(PDZIP:'X')));
         outweb_(%subst(%str(%addr(H__7(53))):59:270));
         wfrtn__ = AfToPage_(DISABLED);
         outweb_(%subst(%str(%addr(H__7(57))):9:8));
         AfToPage_(%trim(%editc(PDEFTABA:'X')));
         outweb_(%subst(%str(%addr(H__7(57))):17:272));
         wfrtn__ = AfToPage_(DISABLED);
         outweb_(%subst(%str(%addr(H__7(60))):49:8));
         wfrtn__ = AfToPage_(PDEFTACCT);
         outweb_(%subst(%str(%addr(H__7(60))):57:199));
         achtypebox0();
         outweb_(%subst(%str(%addr(H__7(63))):16:52));
         if (client = '106');
          OutWeb_(%trimr( '<tr><td class="left">EFIN:</td><td class="right"><-
       input type="text" name="AIT_EFIN" size="6" maxlength="6" value="' +
       %trim(ait_efin) + '" style="width: 150px;"></td></tr><tr>'));
         endif;
         if (renttoown = 'Y');
          OutWeb_(%trimr( '<tr><td class="left">RTO Tax Rate:</td><td class="-
       right"><input type="text" name="PRTORATE" size="6" maxlength="6" value-
       ="' + %editc(PRTORATE:'J') + '" style="width: 150px;"></td></tr><tr>')
       );
          OutWeb_(%trimr( '<tr><td class="left">RTO Refund Percentage:</td><t-
       d class="right"><input type="text" name="PRTOREFPCT" size="6" maxlengt-
       h="6" value="' + %editc(PRTOREFPCT:'J') + '" style="width: 150px;"></t-
       d></tr><tr>'));
          OutWeb_(%trimr( '<tr><td class="left">RTO LDW Rate:</td><td class="-
       right"><input type="text" name="PRTOLDW" size="6" maxlength="6" value=-
       "' + %editc(PRTOLDW:'J') + '" style="width: 150px;"></td></tr><tr>'));
          OutWeb_(%trimr( '<tr><td class="left">RTO Delivery Fee:</td><td cla-
       ss="right"><input type="text" name="PRTODELIV" size="6" maxlength="6" -
       value="' + %editc(PRTODELIV:'J') + '" style="width: 150px;"></td></tr>-
       <tr>'));
          OutWeb_(%trimr( '<tr><td class="left">RTO Processing Fee:</td><td c-
       lass="right"><input type="text" name="PRTOPROC" size="6" maxlength="6"-
        value="' + %editc(PRTOPROC:'J') + '" style="width: 150px;"></td></tr>-
       <tr>'));
          OutWeb_(%trimr( '<tr><td class="left">Early Buyout Fee:</td><td cla-
       ss="right"><input type="text" name="PEPOFEE" size="6" maxlength="6" va-
       lue="' + %editc(PEPOFEE:'J') + '" style="width: 150px;"></td></tr><tr>-
       '));
          OutWeb_(%trimr( '<tr><td class="left">Early Buyout Pct:</td><td cla-
       ss="right"><input type="text" name="PEPOPCT" size="6" maxlength="6" va-
       lue="' + %editc(PEPOPCT:'J') + '" style="width: 150px;"></td></tr><tr>-
       '));
          OutWeb_(%trimr( '<tr><td class="left">RTO 1st Payment:</td><td clas-
       s="right"><input type="text" name="PRTOPMT" size="6" maxlength="6" val-
       ue="' + %editc(PRTOPMT:'J') + '" style="width: 150px;"></td></tr><tr>'
       ));
          OutWeb_('<tr><td class="left">RTO 3rd Party Product:</td><td class=-
       "right">');
          prodbox0();
          OutWeb_('</td></tr>');
          OutWeb_('<tr><td class="left">RTO 3rd Party:</td><td class="right">-
       ');
          prto3idbox0();
          OutWeb_('</td></tr>');
         endif;
         if (ibvopt = 'Y');
          OutWeb_('<tr><td class="left">Send IBV Text & Email:</td><td class=-
       "right">'+x'0D'+''+x'25'+'                		 <select name="SENDIBV">'
       +x'0D'+''+x'25'+'                		 <option value=""></option>'+x'0D'
       +''+x'25'+'                		 <option value="Y" ');
          if (sendibv = 'Y');
           OutWeb_('selected');
          endif;
          OutWeb_('>Send Automatically</option>');
          OutWeb_('<option value="N" ');
          if (sendibv = 'N');
           OutWeb_('selected');
          endif;
          OutWeb_('>Send Manually</option></select></td></tr><tr>');
         endif;
         if (notopt = 'Y');
          OutWeb_('<tr><td class="left">Text & Email Notification:</td><td cl-
       ass="right">'+x'0D'+''+x'25'+'                		 <select name="SENDNOT-
       ">'+x'0D'+''+x'25'+'                		 <option value=""></option>'+x'0-
       D'+''+x'25'+'                		 <option value="Y" ');
          if (sendnot = 'Y');
           OutWeb_('selected');
          endif;
          OutWeb_('>Yes</option>');
          OutWeb_('<option value="N" ');
          if (sendnot = 'N');
           OutWeb_('selected');
          endif;
          OutWeb_('>No</option></select></td></tr><tr>');
         endif;
         outweb_(%subst(%str(%addr(H__7(63))):68:148));
         wrtprodbox0();
         outweb_(%subst(%str(%addr(H__7(65))):56:185));
         decmodbox0();
         outweb_(%subst(%str(%addr(H__7(68))):1:162));
         webmodbox0();
         outweb_(%subst(%str(%addr(H__7(70))):3:203));
         ppcardbox0();
         outweb_(%subst(%str(%addr(H__7(72))):46:149));
         ppibvbox0();
         outweb_(%subst(%str(%addr(H__7(74))):35:167));
         ibvwbox0();
         outweb_(%subst(%str(%addr(H__7(76))):42:165));
         ibvsbox0();
         outweb_(%subst(%str(%addr(H__7(78))):47:565));
         AfToPage_(%trim(%editc(RRN:'X')));
         outweb_(%subst(%str(%addr(H__7(85))):52:2890));
         return ;
        endif;
        if (pdnam1 = '');
         errmsg = 'ERROR: NAME CANNOT BE BLANK';
         Alert_(errmsg);
         outweb_(%subst(%str(%addr(H__7(1))):1:332));
         outweb_(%subst(%str(%addr(H__8(1))):1:2599));
         outweb_(%subst(%str(%addr(H__7(5))):13:529));
         wfrtn__ = AfToPage_(QPGMNAM__);
         outweb_(%subst(%str(%addr(H__7(11))):62:119));
         AfToPage_(%trim(%editc(RRN:'X')));
         outweb_(%subst(%str(%addr(H__7(13))):21:56));
         wfrtn__ = AfToPage_(SAVEDRRN);
         outweb_(%subst(%str(%addr(H__7(13))):77:49));
         wfrtn__ = AfToPage_(PDNO);
         outweb_(%subst(%str(%addr(H__7(14))):46:311));
         wfrtn__ = AfToPage_(PDNO);
         outweb_(%subst(%str(%addr(H__7(18))):37:664));
         wfrtn__ = AfToPage_(DISABLED);
         outweb_(%subst(%str(%addr(H__7(26))):61:8));
         AfToPage_(%trim(%editc(PDLOC:'4')));
         outweb_(%subst(%str(%addr(H__7(26))):69:238));
         wfrtn__ = AfToPage_(DISABLED);
         outweb_(%subst(%str(%addr(H__7(29))):67:8));
         wfrtn__ = AfToPage_(PDNAM1);
         outweb_(%subst(%str(%addr(H__7(29))):75:236));
         wfrtn__ = AfToPage_(DISABLED_ESIGN);
         outweb_(%subst(%str(%addr(H__7(32))):71:8));
         wfrtn__ = AfToPage_(PDNAM2);
         outweb_(%subst(%str(%addr(H__7(32))):79:238));
         wfrtn__ = AfToPage_(DISABLED_ESIGN);
         outweb_(%subst(%str(%addr(H__7(35))):77:8));
         wfrtn__ = AfToPage_(PDEMAIL);
         outweb_(%subst(%str(%addr(H__7(36))):5:260));
         wfrtn__ = AfToPage_(DISABLED);
         outweb_(%subst(%str(%addr(H__7(39))):25:8));
         wfrtn__ = AfToPage_(PDADR1);
         outweb_(%subst(%str(%addr(H__7(39))):33:243));
         wfrtn__ = AfToPage_(DISABLED);
         outweb_(%subst(%str(%addr(H__7(42))):36:8));
         wfrtn__ = AfToPage_(PDADR2);
         outweb_(%subst(%str(%addr(H__7(42))):44:248));
         wfrtn__ = AfToPage_(%trim(%editw(PDPHON:'   -   -    ')));
         outweb_(%subst(%str(%addr(H__7(45))):52:238));
         wfrtn__ = AfToPage_(DISABLED);
         outweb_(%subst(%str(%addr(H__7(48))):50:8));
         wfrtn__ = AfToPage_(PDCITY);
         outweb_(%subst(%str(%addr(H__7(48))):58:181));
         wrtpdstbox0();
         outweb_(%subst(%str(%addr(H__7(50))):79:212));
         wfrtn__ = AfToPage_(DISABLED);
         outweb_(%subst(%str(%addr(H__7(53))):51:8));
         AfToPage_(%trim(%editc(PDZIP:'X')));
         outweb_(%subst(%str(%addr(H__7(53))):59:270));
         wfrtn__ = AfToPage_(DISABLED);
         outweb_(%subst(%str(%addr(H__7(57))):9:8));
         AfToPage_(%trim(%editc(PDEFTABA:'X')));
         outweb_(%subst(%str(%addr(H__7(57))):17:272));
         wfrtn__ = AfToPage_(DISABLED);
         outweb_(%subst(%str(%addr(H__7(60))):49:8));
         wfrtn__ = AfToPage_(PDEFTACCT);
         outweb_(%subst(%str(%addr(H__7(60))):57:199));
         achtypebox0();
         outweb_(%subst(%str(%addr(H__7(63))):16:52));
         if (client = '106');
          OutWeb_(%trimr( '<tr><td class="left">EFIN:</td><td class="right"><-
       input type="text" name="AIT_EFIN" size="6" maxlength="6" value="' +
       %trim(ait_efin) + '" style="width: 150px;"></td></tr><tr>'));
         endif;
         if (renttoown = 'Y');
          OutWeb_(%trimr( '<tr><td class="left">RTO Tax Rate:</td><td class="-
       right"><input type="text" name="PRTORATE" size="6" maxlength="6" value-
       ="' + %editc(PRTORATE:'J') + '" style="width: 150px;"></td></tr><tr>')
       );
          OutWeb_(%trimr( '<tr><td class="left">RTO Refund Percentage:</td><t-
       d class="right"><input type="text" name="PRTOREFPCT" size="6" maxlengt-
       h="6" value="' + %editc(PRTOREFPCT:'J') + '" style="width: 150px;"></t-
       d></tr><tr>'));
          OutWeb_(%trimr( '<tr><td class="left">RTO LDW Rate:</td><td class="-
       right"><input type="text" name="PRTOLDW" size="6" maxlength="6" value=-
       "' + %editc(PRTOLDW:'J') + '" style="width: 150px;"></td></tr><tr>'));
          OutWeb_(%trimr( '<tr><td class="left">RTO Delivery Fee:</td><td cla-
       ss="right"><input type="text" name="PRTODELIV" size="6" maxlength="6" -
       value="' + %editc(PRTODELIV:'J') + '" style="width: 150px;"></td></tr>-
       <tr>'));
          OutWeb_(%trimr( '<tr><td class="left">RTO Processing Fee:</td><td c-
       lass="right"><input type="text" name="PRTOPROC" size="6" maxlength="6"-
        value="' + %editc(PRTOPROC:'J') + '" style="width: 150px;"></td></tr>-
       <tr>'));
          OutWeb_(%trimr( '<tr><td class="left">Early Buyout Fee:</td><td cla-
       ss="right"><input type="text" name="PEPOFEE" size="6" maxlength="6" va-
       lue="' + %editc(PEPOFEE:'J') + '" style="width: 150px;"></td></tr><tr>-
       '));
          OutWeb_(%trimr( '<tr><td class="left">Early Buyout Pct:</td><td cla-
       ss="right"><input type="text" name="PEPOPCT" size="6" maxlength="6" va-
       lue="' + %editc(PEPOPCT:'J') + '" style="width: 150px;"></td></tr><tr>-
       '));
          OutWeb_(%trimr( '<tr><td class="left">RTO 1st Payment:</td><td clas-
       s="right"><input type="text" name="PRTOPMT" size="6" maxlength="6" val-
       ue="' + %editc(PRTOPMT:'J') + '" style="width: 150px;"></td></tr><tr>'
       ));
          OutWeb_('<tr><td class="left">RTO 3rd Party Product:</td><td class=-
       "right">');
          prodbox0();
          OutWeb_('</td></tr>');
          OutWeb_('<tr><td class="left">RTO 3rd Party:</td><td class="right">-
       ');
          prto3idbox0();
          OutWeb_('</td></tr>');
         endif;
         if (ibvopt = 'Y');
          OutWeb_('<tr><td class="left">Send IBV Text & Email:</td><td class=-
       "right">'+x'0D'+''+x'25'+'                		 <select name="SENDIBV">'
       +x'0D'+''+x'25'+'                		 <option value=""></option>'+x'0D'
       +''+x'25'+'                		 <option value="Y" ');
          if (sendibv = 'Y');
           OutWeb_('selected');
          endif;
          OutWeb_('>Send Automatically</option>');
          OutWeb_('<option value="N" ');
          if (sendibv = 'N');
           OutWeb_('selected');
          endif;
          OutWeb_('>Send Manually</option></select></td></tr><tr>');
         endif;
         if (notopt = 'Y');
          OutWeb_('<tr><td class="left">Text & Email Notification:</td><td cl-
       ass="right">'+x'0D'+''+x'25'+'                		 <select name="SENDNOT-
       ">'+x'0D'+''+x'25'+'                		 <option value=""></option>'+x'0-
       D'+''+x'25'+'                		 <option value="Y" ');
          if (sendnot = 'Y');
           OutWeb_('selected');
          endif;
          OutWeb_('>Yes</option>');
          OutWeb_('<option value="N" ');
          if (sendnot = 'N');
           OutWeb_('selected');
          endif;
          OutWeb_('>No</option></select></td></tr><tr>');
         endif;
         outweb_(%subst(%str(%addr(H__7(63))):68:148));
         wrtprodbox0();
         outweb_(%subst(%str(%addr(H__7(65))):56:185));
         decmodbox0();
         outweb_(%subst(%str(%addr(H__7(68))):1:162));
         webmodbox0();
         outweb_(%subst(%str(%addr(H__7(70))):3:203));
         ppcardbox0();
         outweb_(%subst(%str(%addr(H__7(72))):46:149));
         ppibvbox0();
         outweb_(%subst(%str(%addr(H__7(74))):35:167));
         ibvwbox0();
         outweb_(%subst(%str(%addr(H__7(76))):42:165));
         ibvsbox0();
         outweb_(%subst(%str(%addr(H__7(78))):47:565));
         AfToPage_(%trim(%editc(RRN:'X')));
         outweb_(%subst(%str(%addr(H__7(85))):52:2890));
         return ;
        endif;
        if ((((((pdadr1 = '')) or ((pdcity = '')) or ((pdst = '')) or ((
       PDZIP = 0))))));
         errmsg = 'ERROR: ADDRESS, CITY, STATE, AND ZIP REQUIRED';
         Alert_(errmsg);
         outweb_(%subst(%str(%addr(H__7(1))):1:332));
         outweb_(%subst(%str(%addr(H__8(1))):1:2599));
         outweb_(%subst(%str(%addr(H__7(5))):13:529));
         wfrtn__ = AfToPage_(QPGMNAM__);
         outweb_(%subst(%str(%addr(H__7(11))):62:119));
         AfToPage_(%trim(%editc(RRN:'X')));
         outweb_(%subst(%str(%addr(H__7(13))):21:56));
         wfrtn__ = AfToPage_(SAVEDRRN);
         outweb_(%subst(%str(%addr(H__7(13))):77:49));
         wfrtn__ = AfToPage_(PDNO);
         outweb_(%subst(%str(%addr(H__7(14))):46:311));
         wfrtn__ = AfToPage_(PDNO);
         outweb_(%subst(%str(%addr(H__7(18))):37:664));
         wfrtn__ = AfToPage_(DISABLED);
         outweb_(%subst(%str(%addr(H__7(26))):61:8));
         AfToPage_(%trim(%editc(PDLOC:'4')));
         outweb_(%subst(%str(%addr(H__7(26))):69:238));
         wfrtn__ = AfToPage_(DISABLED);
         outweb_(%subst(%str(%addr(H__7(29))):67:8));
         wfrtn__ = AfToPage_(PDNAM1);
         outweb_(%subst(%str(%addr(H__7(29))):75:236));
         wfrtn__ = AfToPage_(DISABLED_ESIGN);
         outweb_(%subst(%str(%addr(H__7(32))):71:8));
         wfrtn__ = AfToPage_(PDNAM2);
         outweb_(%subst(%str(%addr(H__7(32))):79:238));
         wfrtn__ = AfToPage_(DISABLED_ESIGN);
         outweb_(%subst(%str(%addr(H__7(35))):77:8));
         wfrtn__ = AfToPage_(PDEMAIL);
         outweb_(%subst(%str(%addr(H__7(36))):5:260));
         wfrtn__ = AfToPage_(DISABLED);
         outweb_(%subst(%str(%addr(H__7(39))):25:8));
         wfrtn__ = AfToPage_(PDADR1);
         outweb_(%subst(%str(%addr(H__7(39))):33:243));
         wfrtn__ = AfToPage_(DISABLED);
         outweb_(%subst(%str(%addr(H__7(42))):36:8));
         wfrtn__ = AfToPage_(PDADR2);
         outweb_(%subst(%str(%addr(H__7(42))):44:248));
         wfrtn__ = AfToPage_(%trim(%editw(PDPHON:'   -   -    ')));
         outweb_(%subst(%str(%addr(H__7(45))):52:238));
         wfrtn__ = AfToPage_(DISABLED);
         outweb_(%subst(%str(%addr(H__7(48))):50:8));
         wfrtn__ = AfToPage_(PDCITY);
         outweb_(%subst(%str(%addr(H__7(48))):58:181));
         wrtpdstbox0();
         outweb_(%subst(%str(%addr(H__7(50))):79:212));
         wfrtn__ = AfToPage_(DISABLED);
         outweb_(%subst(%str(%addr(H__7(53))):51:8));
         AfToPage_(%trim(%editc(PDZIP:'X')));
         outweb_(%subst(%str(%addr(H__7(53))):59:270));
         wfrtn__ = AfToPage_(DISABLED);
         outweb_(%subst(%str(%addr(H__7(57))):9:8));
         AfToPage_(%trim(%editc(PDEFTABA:'X')));
         outweb_(%subst(%str(%addr(H__7(57))):17:272));
         wfrtn__ = AfToPage_(DISABLED);
         outweb_(%subst(%str(%addr(H__7(60))):49:8));
         wfrtn__ = AfToPage_(PDEFTACCT);
         outweb_(%subst(%str(%addr(H__7(60))):57:199));
         achtypebox0();
         outweb_(%subst(%str(%addr(H__7(63))):16:52));
         if (client = '106');
          OutWeb_(%trimr( '<tr><td class="left">EFIN:</td><td class="right"><-
       input type="text" name="AIT_EFIN" size="6" maxlength="6" value="' +
       %trim(ait_efin) + '" style="width: 150px;"></td></tr><tr>'));
         endif;
         if (renttoown = 'Y');
          OutWeb_(%trimr( '<tr><td class="left">RTO Tax Rate:</td><td class="-
       right"><input type="text" name="PRTORATE" size="6" maxlength="6" value-
       ="' + %editc(PRTORATE:'J') + '" style="width: 150px;"></td></tr><tr>')
       );
          OutWeb_(%trimr( '<tr><td class="left">RTO Refund Percentage:</td><t-
       d class="right"><input type="text" name="PRTOREFPCT" size="6" maxlengt-
       h="6" value="' + %editc(PRTOREFPCT:'J') + '" style="width: 150px;"></t-
       d></tr><tr>'));
          OutWeb_(%trimr( '<tr><td class="left">RTO LDW Rate:</td><td class="-
       right"><input type="text" name="PRTOLDW" size="6" maxlength="6" value=-
       "' + %editc(PRTOLDW:'J') + '" style="width: 150px;"></td></tr><tr>'));
          OutWeb_(%trimr( '<tr><td class="left">RTO Delivery Fee:</td><td cla-
       ss="right"><input type="text" name="PRTODELIV" size="6" maxlength="6" -
       value="' + %editc(PRTODELIV:'J') + '" style="width: 150px;"></td></tr>-
       <tr>'));
          OutWeb_(%trimr( '<tr><td class="left">RTO Processing Fee:</td><td c-
       lass="right"><input type="text" name="PRTOPROC" size="6" maxlength="6"-
        value="' + %editc(PRTOPROC:'J') + '" style="width: 150px;"></td></tr>-
       <tr>'));
          OutWeb_(%trimr( '<tr><td class="left">Early Buyout Fee:</td><td cla-
       ss="right"><input type="text" name="PEPOFEE" size="6" maxlength="6" va-
       lue="' + %editc(PEPOFEE:'J') + '" style="width: 150px;"></td></tr><tr>-
       '));
          OutWeb_(%trimr( '<tr><td class="left">Early Buyout Pct:</td><td cla-
       ss="right"><input type="text" name="PEPOPCT" size="6" maxlength="6" va-
       lue="' + %editc(PEPOPCT:'J') + '" style="width: 150px;"></td></tr><tr>-
       '));
          OutWeb_(%trimr( '<tr><td class="left">RTO 1st Payment:</td><td clas-
       s="right"><input type="text" name="PRTOPMT" size="6" maxlength="6" val-
       ue="' + %editc(PRTOPMT:'J') + '" style="width: 150px;"></td></tr><tr>'
       ));
          OutWeb_('<tr><td class="left">RTO 3rd Party Product:</td><td class=-
       "right">');
          prodbox0();
          OutWeb_('</td></tr>');
          OutWeb_('<tr><td class="left">RTO 3rd Party:</td><td class="right">-
       ');
          prto3idbox0();
          OutWeb_('</td></tr>');
         endif;
         if (ibvopt = 'Y');
          OutWeb_('<tr><td class="left">Send IBV Text & Email:</td><td class=-
       "right">'+x'0D'+''+x'25'+'                		 <select name="SENDIBV">'
       +x'0D'+''+x'25'+'                		 <option value=""></option>'+x'0D'
       +''+x'25'+'                		 <option value="Y" ');
          if (sendibv = 'Y');
           OutWeb_('selected');
          endif;
          OutWeb_('>Send Automatically</option>');
          OutWeb_('<option value="N" ');
          if (sendibv = 'N');
           OutWeb_('selected');
          endif;
          OutWeb_('>Send Manually</option></select></td></tr><tr>');
         endif;
         if (notopt = 'Y');
          OutWeb_('<tr><td class="left">Text & Email Notification:</td><td cl-
       ass="right">'+x'0D'+''+x'25'+'                		 <select name="SENDNOT-
       ">'+x'0D'+''+x'25'+'                		 <option value=""></option>'+x'0-
       D'+''+x'25'+'                		 <option value="Y" ');
          if (sendnot = 'Y');
           OutWeb_('selected');
          endif;
          OutWeb_('>Yes</option>');
          OutWeb_('<option value="N" ');
          if (sendnot = 'N');
           OutWeb_('selected');
          endif;
          OutWeb_('>No</option></select></td></tr><tr>');
         endif;
         outweb_(%subst(%str(%addr(H__7(63))):68:148));
         wrtprodbox0();
         outweb_(%subst(%str(%addr(H__7(65))):56:185));
         decmodbox0();
         outweb_(%subst(%str(%addr(H__7(68))):1:162));
         webmodbox0();
         outweb_(%subst(%str(%addr(H__7(70))):3:203));
         ppcardbox0();
         outweb_(%subst(%str(%addr(H__7(72))):46:149));
         ppibvbox0();
         outweb_(%subst(%str(%addr(H__7(74))):35:167));
         ibvwbox0();
         outweb_(%subst(%str(%addr(H__7(76))):42:165));
         ibvsbox0();
         outweb_(%subst(%str(%addr(H__7(78))):47:565));
         AfToPage_(%trim(%editc(RRN:'X')));
         outweb_(%subst(%str(%addr(H__7(85))):52:2890));
         return ;
        endif;
        pdno = getparm3_('pdno':'*OPT');
        SETLL  officekey RKWPDLOC;
        RS001_ = RcdSts2_('POSRCD':%error:%equal:%eof);
        if (RS001_ = '3');
         errmsg = 'ERROR: LOCATION EXISTS';
         Alert_(errmsg);
         outweb_(%subst(%str(%addr(H__7(1))):1:332));
         outweb_(%subst(%str(%addr(H__8(1))):1:2599));
         outweb_(%subst(%str(%addr(H__7(5))):13:529));
         wfrtn__ = AfToPage_(QPGMNAM__);
         outweb_(%subst(%str(%addr(H__7(11))):62:119));
         AfToPage_(%trim(%editc(RRN:'X')));
         outweb_(%subst(%str(%addr(H__7(13))):21:56));
         wfrtn__ = AfToPage_(SAVEDRRN);
         outweb_(%subst(%str(%addr(H__7(13))):77:49));
         wfrtn__ = AfToPage_(PDNO);
         outweb_(%subst(%str(%addr(H__7(14))):46:311));
         wfrtn__ = AfToPage_(PDNO);
         outweb_(%subst(%str(%addr(H__7(18))):37:664));
         wfrtn__ = AfToPage_(DISABLED);
         outweb_(%subst(%str(%addr(H__7(26))):61:8));
         AfToPage_(%trim(%editc(PDLOC:'4')));
         outweb_(%subst(%str(%addr(H__7(26))):69:238));
         wfrtn__ = AfToPage_(DISABLED);
         outweb_(%subst(%str(%addr(H__7(29))):67:8));
         wfrtn__ = AfToPage_(PDNAM1);
         outweb_(%subst(%str(%addr(H__7(29))):75:236));
         wfrtn__ = AfToPage_(DISABLED_ESIGN);
         outweb_(%subst(%str(%addr(H__7(32))):71:8));
         wfrtn__ = AfToPage_(PDNAM2);
         outweb_(%subst(%str(%addr(H__7(32))):79:238));
         wfrtn__ = AfToPage_(DISABLED_ESIGN);
         outweb_(%subst(%str(%addr(H__7(35))):77:8));
         wfrtn__ = AfToPage_(PDEMAIL);
         outweb_(%subst(%str(%addr(H__7(36))):5:260));
         wfrtn__ = AfToPage_(DISABLED);
         outweb_(%subst(%str(%addr(H__7(39))):25:8));
         wfrtn__ = AfToPage_(PDADR1);
         outweb_(%subst(%str(%addr(H__7(39))):33:243));
         wfrtn__ = AfToPage_(DISABLED);
         outweb_(%subst(%str(%addr(H__7(42))):36:8));
         wfrtn__ = AfToPage_(PDADR2);
         outweb_(%subst(%str(%addr(H__7(42))):44:248));
         wfrtn__ = AfToPage_(%trim(%editw(PDPHON:'   -   -    ')));
         outweb_(%subst(%str(%addr(H__7(45))):52:238));
         wfrtn__ = AfToPage_(DISABLED);
         outweb_(%subst(%str(%addr(H__7(48))):50:8));
         wfrtn__ = AfToPage_(PDCITY);
         outweb_(%subst(%str(%addr(H__7(48))):58:181));
         wrtpdstbox0();
         outweb_(%subst(%str(%addr(H__7(50))):79:212));
         wfrtn__ = AfToPage_(DISABLED);
         outweb_(%subst(%str(%addr(H__7(53))):51:8));
         AfToPage_(%trim(%editc(PDZIP:'X')));
         outweb_(%subst(%str(%addr(H__7(53))):59:270));
         wfrtn__ = AfToPage_(DISABLED);
         outweb_(%subst(%str(%addr(H__7(57))):9:8));
         AfToPage_(%trim(%editc(PDEFTABA:'X')));
         outweb_(%subst(%str(%addr(H__7(57))):17:272));
         wfrtn__ = AfToPage_(DISABLED);
         outweb_(%subst(%str(%addr(H__7(60))):49:8));
         wfrtn__ = AfToPage_(PDEFTACCT);
         outweb_(%subst(%str(%addr(H__7(60))):57:199));
         achtypebox0();
         outweb_(%subst(%str(%addr(H__7(63))):16:52));
         if (client = '106');
          OutWeb_(%trimr( '<tr><td class="left">EFIN:</td><td class="right"><-
       input type="text" name="AIT_EFIN" size="6" maxlength="6" value="' +
       %trim(ait_efin) + '" style="width: 150px;"></td></tr><tr>'));
         endif;
         if (renttoown = 'Y');
          OutWeb_(%trimr( '<tr><td class="left">RTO Tax Rate:</td><td class="-
       right"><input type="text" name="PRTORATE" size="6" maxlength="6" value-
       ="' + %editc(PRTORATE:'J') + '" style="width: 150px;"></td></tr><tr>')
       );
          OutWeb_(%trimr( '<tr><td class="left">RTO Refund Percentage:</td><t-
       d class="right"><input type="text" name="PRTOREFPCT" size="6" maxlengt-
       h="6" value="' + %editc(PRTOREFPCT:'J') + '" style="width: 150px;"></t-
       d></tr><tr>'));
          OutWeb_(%trimr( '<tr><td class="left">RTO LDW Rate:</td><td class="-
       right"><input type="text" name="PRTOLDW" size="6" maxlength="6" value=-
       "' + %editc(PRTOLDW:'J') + '" style="width: 150px;"></td></tr><tr>'));
          OutWeb_(%trimr( '<tr><td class="left">RTO Delivery Fee:</td><td cla-
       ss="right"><input type="text" name="PRTODELIV" size="6" maxlength="6" -
       value="' + %editc(PRTODELIV:'J') + '" style="width: 150px;"></td></tr>-
       <tr>'));
          OutWeb_(%trimr( '<tr><td class="left">RTO Processing Fee:</td><td c-
       lass="right"><input type="text" name="PRTOPROC" size="6" maxlength="6"-
        value="' + %editc(PRTOPROC:'J') + '" style="width: 150px;"></td></tr>-
       <tr>'));
          OutWeb_(%trimr( '<tr><td class="left">Early Buyout Fee:</td><td cla-
       ss="right"><input type="text" name="PEPOFEE" size="6" maxlength="6" va-
       lue="' + %editc(PEPOFEE:'J') + '" style="width: 150px;"></td></tr><tr>-
       '));
          OutWeb_(%trimr( '<tr><td class="left">Early Buyout Pct:</td><td cla-
       ss="right"><input type="text" name="PEPOPCT" size="6" maxlength="6" va-
       lue="' + %editc(PEPOPCT:'J') + '" style="width: 150px;"></td></tr><tr>-
       '));
          OutWeb_(%trimr( '<tr><td class="left">RTO 1st Payment:</td><td clas-
       s="right"><input type="text" name="PRTOPMT" size="6" maxlength="6" val-
       ue="' + %editc(PRTOPMT:'J') + '" style="width: 150px;"></td></tr><tr>'
       ));
          OutWeb_('<tr><td class="left">RTO 3rd Party Product:</td><td class=-
       "right">');
          prodbox0();
          OutWeb_('</td></tr>');
          OutWeb_('<tr><td class="left">RTO 3rd Party:</td><td class="right">-
       ');
          prto3idbox0();
          OutWeb_('</td></tr>');
         endif;
         if (ibvopt = 'Y');
          OutWeb_('<tr><td class="left">Send IBV Text & Email:</td><td class=-
       "right">'+x'0D'+''+x'25'+'                		 <select name="SENDIBV">'
       +x'0D'+''+x'25'+'                		 <option value=""></option>'+x'0D'
       +''+x'25'+'                		 <option value="Y" ');
          if (sendibv = 'Y');
           OutWeb_('selected');
          endif;
          OutWeb_('>Send Automatically</option>');
          OutWeb_('<option value="N" ');
          if (sendibv = 'N');
           OutWeb_('selected');
          endif;
          OutWeb_('>Send Manually</option></select></td></tr><tr>');
         endif;
         if (notopt = 'Y');
          OutWeb_('<tr><td class="left">Text & Email Notification:</td><td cl-
       ass="right">'+x'0D'+''+x'25'+'                		 <select name="SENDNOT-
       ">'+x'0D'+''+x'25'+'                		 <option value=""></option>'+x'0-
       D'+''+x'25'+'                		 <option value="Y" ');
          if (sendnot = 'Y');
           OutWeb_('selected');
          endif;
          OutWeb_('>Yes</option>');
          OutWeb_('<option value="N" ');
          if (sendnot = 'N');
           OutWeb_('selected');
          endif;
          OutWeb_('>No</option></select></td></tr><tr>');
         endif;
         outweb_(%subst(%str(%addr(H__7(63))):68:148));
         wrtprodbox0();
         outweb_(%subst(%str(%addr(H__7(65))):56:185));
         decmodbox0();
         outweb_(%subst(%str(%addr(H__7(68))):1:162));
         webmodbox0();
         outweb_(%subst(%str(%addr(H__7(70))):3:203));
         ppcardbox0();
         outweb_(%subst(%str(%addr(H__7(72))):46:149));
         ppibvbox0();
         outweb_(%subst(%str(%addr(H__7(74))):35:167));
         ibvwbox0();
         outweb_(%subst(%str(%addr(H__7(76))):42:165));
         ibvsbox0();
         outweb_(%subst(%str(%addr(H__7(78))):47:565));
         AfToPage_(%trim(%editc(RRN:'X')));
         outweb_(%subst(%str(%addr(H__7(85))):52:2890));
         return ;
        endif;
        if (PDZIP< 100000);
      /end-free
     C                   MOVE      PDZIP         pdozip5
      /free
         PDZIP = 0;
      /end-free
     C                   MOVEL     pdozip5       PDZIP
      /free
        endif;
        WRITE RKWPDLOC;
        RS001_ = RcdSts2_('WRTRCD': %error: %found: %eof);
       endif;
       if (renttoown = 'Y');
        prto3id = getparm3_('prto3id':'*OPT');
        pprod = getparm3_('pprod':'*OPT');
        pdno = getparm3_('pdno':'*OPT');
        PDLOC = %dec(aton_( getparm3_('PDLOC':'*OPT'):46:16):11:0);
        if ((((prto3id <> '')) and ((pprod <> ''))));
         SETLL  DL011_ RKWPDRTO3;
         RS011_ = RcdSts2_('POSRCD':%error:%equal:%eof);
         READE(E) DL011_ RKWPDRTO3;
         RS011_ = RcdSts2_('GETNXTRCD':%error:%found:%eof);
         AM011_ = CV_ByKey;
         dow (RS011_ = '1');
      /end-free
     C                   EVAL      RS011_ = DeleteRcd_('RKWPDRTO3')
      /free
         READE(E) DL011_ RKWPDRTO3;
         RS011_ = RcdSts2_('GETNXTRCD':%error:%found:%eof);
         AM011_ = CV_ByKey;
         enddo;
         prto3id = getparm3_('prto3id':'*OPT');
         pprod = getparm3_('pprod':'*OPT');
         WRITE RKWPDRTO3;
         RS011_ = RcdSts2_('WRTRCD': %error: %found: %eof);
        endif;
       endif;
       if (rrn <> 0);
        rrn = %dec(aton_( getparm3_('rrn':'*MAND'):46:16):9:0);
        RR_001_ = rrn;
        AM001_ = CV_BYRRN;
        CHAIN(E) RR_001_ R__ARR001;
        RS001_ = RcdSts2_('GETRCD': %error: %found: %eof);
        PDLOC = %dec(aton_( getparm3_('PDLOC':'*OPT'):46:16):11:0);
        pdnam1 = getparm3_('pdnam1':'*OPT');
        pdnam2 = getparm3_('pdnam2':'*OPT');
        pdemail = getparm3_('pdemail':'*OPT');
        pdadr1 = getparm3_('pdadr1':'*OPT');
        pdadr2 = getparm3_('pdadr2':'*OPT');
        PDPHON = %dec(aton_( getparm3_('PDPHON':'*OPT'):46:16):10:0);
        pdcity = getparm3_('pdcity':'*OPT');
        pdst = getparm3_('pdst':'*OPT');
        PDZIP = %dec(aton_( getparm3_('PDZIP':'*OPT'):46:16):9:0);
        pdlprod = getparm3_('pdlprod':'*OPT');
        pdlmodel = getparm3_('pdlmodel':'*OPT');
        pdlwmodel = getparm3_('pdlwmodel':'*OPT');
        if (pdnam1 = '');
         errmsg = 'NAME CANNOT BE BLANK';
         outweb_(%subst(%str(%addr(H__7(1))):1:332));
         outweb_(%subst(%str(%addr(H__8(1))):1:2599));
         outweb_(%subst(%str(%addr(H__7(5))):13:529));
         wfrtn__ = AfToPage_(QPGMNAM__);
         outweb_(%subst(%str(%addr(H__7(11))):62:119));
         AfToPage_(%trim(%editc(RRN:'X')));
         outweb_(%subst(%str(%addr(H__7(13))):21:56));
         wfrtn__ = AfToPage_(SAVEDRRN);
         outweb_(%subst(%str(%addr(H__7(13))):77:49));
         wfrtn__ = AfToPage_(PDNO);
         outweb_(%subst(%str(%addr(H__7(14))):46:311));
         wfrtn__ = AfToPage_(PDNO);
         outweb_(%subst(%str(%addr(H__7(18))):37:664));
         wfrtn__ = AfToPage_(DISABLED);
         outweb_(%subst(%str(%addr(H__7(26))):61:8));
         AfToPage_(%trim(%editc(PDLOC:'4')));
         outweb_(%subst(%str(%addr(H__7(26))):69:238));
         wfrtn__ = AfToPage_(DISABLED);
         outweb_(%subst(%str(%addr(H__7(29))):67:8));
         wfrtn__ = AfToPage_(PDNAM1);
         outweb_(%subst(%str(%addr(H__7(29))):75:236));
         wfrtn__ = AfToPage_(DISABLED_ESIGN);
         outweb_(%subst(%str(%addr(H__7(32))):71:8));
         wfrtn__ = AfToPage_(PDNAM2);
         outweb_(%subst(%str(%addr(H__7(32))):79:238));
         wfrtn__ = AfToPage_(DISABLED_ESIGN);
         outweb_(%subst(%str(%addr(H__7(35))):77:8));
         wfrtn__ = AfToPage_(PDEMAIL);
         outweb_(%subst(%str(%addr(H__7(36))):5:260));
         wfrtn__ = AfToPage_(DISABLED);
         outweb_(%subst(%str(%addr(H__7(39))):25:8));
         wfrtn__ = AfToPage_(PDADR1);
         outweb_(%subst(%str(%addr(H__7(39))):33:243));
         wfrtn__ = AfToPage_(DISABLED);
         outweb_(%subst(%str(%addr(H__7(42))):36:8));
         wfrtn__ = AfToPage_(PDADR2);
         outweb_(%subst(%str(%addr(H__7(42))):44:248));
         wfrtn__ = AfToPage_(%trim(%editw(PDPHON:'   -   -    ')));
         outweb_(%subst(%str(%addr(H__7(45))):52:238));
         wfrtn__ = AfToPage_(DISABLED);
         outweb_(%subst(%str(%addr(H__7(48))):50:8));
         wfrtn__ = AfToPage_(PDCITY);
         outweb_(%subst(%str(%addr(H__7(48))):58:181));
         wrtpdstbox0();
         outweb_(%subst(%str(%addr(H__7(50))):79:212));
         wfrtn__ = AfToPage_(DISABLED);
         outweb_(%subst(%str(%addr(H__7(53))):51:8));
         AfToPage_(%trim(%editc(PDZIP:'X')));
         outweb_(%subst(%str(%addr(H__7(53))):59:270));
         wfrtn__ = AfToPage_(DISABLED);
         outweb_(%subst(%str(%addr(H__7(57))):9:8));
         AfToPage_(%trim(%editc(PDEFTABA:'X')));
         outweb_(%subst(%str(%addr(H__7(57))):17:272));
         wfrtn__ = AfToPage_(DISABLED);
         outweb_(%subst(%str(%addr(H__7(60))):49:8));
         wfrtn__ = AfToPage_(PDEFTACCT);
         outweb_(%subst(%str(%addr(H__7(60))):57:199));
         achtypebox0();
         outweb_(%subst(%str(%addr(H__7(63))):16:52));
         if (client = '106');
          OutWeb_(%trimr( '<tr><td class="left">EFIN:</td><td class="right"><-
       input type="text" name="AIT_EFIN" size="6" maxlength="6" value="' +
       %trim(ait_efin) + '" style="width: 150px;"></td></tr><tr>'));
         endif;
         if (renttoown = 'Y');
          OutWeb_(%trimr( '<tr><td class="left">RTO Tax Rate:</td><td class="-
       right"><input type="text" name="PRTORATE" size="6" maxlength="6" value-
       ="' + %editc(PRTORATE:'J') + '" style="width: 150px;"></td></tr><tr>')
       );
          OutWeb_(%trimr( '<tr><td class="left">RTO Refund Percentage:</td><t-
       d class="right"><input type="text" name="PRTOREFPCT" size="6" maxlengt-
       h="6" value="' + %editc(PRTOREFPCT:'J') + '" style="width: 150px;"></t-
       d></tr><tr>'));
          OutWeb_(%trimr( '<tr><td class="left">RTO LDW Rate:</td><td class="-
       right"><input type="text" name="PRTOLDW" size="6" maxlength="6" value=-
       "' + %editc(PRTOLDW:'J') + '" style="width: 150px;"></td></tr><tr>'));
          OutWeb_(%trimr( '<tr><td class="left">RTO Delivery Fee:</td><td cla-
       ss="right"><input type="text" name="PRTODELIV" size="6" maxlength="6" -
       value="' + %editc(PRTODELIV:'J') + '" style="width: 150px;"></td></tr>-
       <tr>'));
          OutWeb_(%trimr( '<tr><td class="left">RTO Processing Fee:</td><td c-
       lass="right"><input type="text" name="PRTOPROC" size="6" maxlength="6"-
        value="' + %editc(PRTOPROC:'J') + '" style="width: 150px;"></td></tr>-
       <tr>'));
          OutWeb_(%trimr( '<tr><td class="left">Early Buyout Fee:</td><td cla-
       ss="right"><input type="text" name="PEPOFEE" size="6" maxlength="6" va-
       lue="' + %editc(PEPOFEE:'J') + '" style="width: 150px;"></td></tr><tr>-
       '));
          OutWeb_(%trimr( '<tr><td class="left">Early Buyout Pct:</td><td cla-
       ss="right"><input type="text" name="PEPOPCT" size="6" maxlength="6" va-
       lue="' + %editc(PEPOPCT:'J') + '" style="width: 150px;"></td></tr><tr>-
       '));
          OutWeb_(%trimr( '<tr><td class="left">RTO 1st Payment:</td><td clas-
       s="right"><input type="text" name="PRTOPMT" size="6" maxlength="6" val-
       ue="' + %editc(PRTOPMT:'J') + '" style="width: 150px;"></td></tr><tr>'
       ));
          OutWeb_('<tr><td class="left">RTO 3rd Party Product:</td><td class=-
       "right">');
          prodbox0();
          OutWeb_('</td></tr>');
          OutWeb_('<tr><td class="left">RTO 3rd Party:</td><td class="right">-
       ');
          prto3idbox0();
          OutWeb_('</td></tr>');
         endif;
         if (ibvopt = 'Y');
          OutWeb_('<tr><td class="left">Send IBV Text & Email:</td><td class=-
       "right">'+x'0D'+''+x'25'+'                		 <select name="SENDIBV">'
       +x'0D'+''+x'25'+'                		 <option value=""></option>'+x'0D'
       +''+x'25'+'                		 <option value="Y" ');
          if (sendibv = 'Y');
           OutWeb_('selected');
          endif;
          OutWeb_('>Send Automatically</option>');
          OutWeb_('<option value="N" ');
          if (sendibv = 'N');
           OutWeb_('selected');
          endif;
          OutWeb_('>Send Manually</option></select></td></tr><tr>');
         endif;
         if (notopt = 'Y');
          OutWeb_('<tr><td class="left">Text & Email Notification:</td><td cl-
       ass="right">'+x'0D'+''+x'25'+'                		 <select name="SENDNOT-
       ">'+x'0D'+''+x'25'+'                		 <option value=""></option>'+x'0-
       D'+''+x'25'+'                		 <option value="Y" ');
          if (sendnot = 'Y');
           OutWeb_('selected');
          endif;
          OutWeb_('>Yes</option>');
          OutWeb_('<option value="N" ');
          if (sendnot = 'N');
           OutWeb_('selected');
          endif;
          OutWeb_('>No</option></select></td></tr><tr>');
         endif;
         outweb_(%subst(%str(%addr(H__7(63))):68:148));
         wrtprodbox0();
         outweb_(%subst(%str(%addr(H__7(65))):56:185));
         decmodbox0();
         outweb_(%subst(%str(%addr(H__7(68))):1:162));
         webmodbox0();
         outweb_(%subst(%str(%addr(H__7(70))):3:203));
         ppcardbox0();
         outweb_(%subst(%str(%addr(H__7(72))):46:149));
         ppibvbox0();
         outweb_(%subst(%str(%addr(H__7(74))):35:167));
         ibvwbox0();
         outweb_(%subst(%str(%addr(H__7(76))):42:165));
         ibvsbox0();
         outweb_(%subst(%str(%addr(H__7(78))):47:565));
         AfToPage_(%trim(%editc(RRN:'X')));
         outweb_(%subst(%str(%addr(H__7(85))):52:2890));
         return ;
        endif;
        if ((((((pdadr1 = '')) or ((pdcity = '')) or ((pdst = '')) or ((
       PDZIP = 0))))));
         errmsg = 'ADDRESS CANNOT BE BLANK';
         outweb_(%subst(%str(%addr(H__7(1))):1:332));
         outweb_(%subst(%str(%addr(H__8(1))):1:2599));
         outweb_(%subst(%str(%addr(H__7(5))):13:529));
         wfrtn__ = AfToPage_(QPGMNAM__);
         outweb_(%subst(%str(%addr(H__7(11))):62:119));
         AfToPage_(%trim(%editc(RRN:'X')));
         outweb_(%subst(%str(%addr(H__7(13))):21:56));
         wfrtn__ = AfToPage_(SAVEDRRN);
         outweb_(%subst(%str(%addr(H__7(13))):77:49));
         wfrtn__ = AfToPage_(PDNO);
         outweb_(%subst(%str(%addr(H__7(14))):46:311));
         wfrtn__ = AfToPage_(PDNO);
         outweb_(%subst(%str(%addr(H__7(18))):37:664));
         wfrtn__ = AfToPage_(DISABLED);
         outweb_(%subst(%str(%addr(H__7(26))):61:8));
         AfToPage_(%trim(%editc(PDLOC:'4')));
         outweb_(%subst(%str(%addr(H__7(26))):69:238));
         wfrtn__ = AfToPage_(DISABLED);
         outweb_(%subst(%str(%addr(H__7(29))):67:8));
         wfrtn__ = AfToPage_(PDNAM1);
         outweb_(%subst(%str(%addr(H__7(29))):75:236));
         wfrtn__ = AfToPage_(DISABLED_ESIGN);
         outweb_(%subst(%str(%addr(H__7(32))):71:8));
         wfrtn__ = AfToPage_(PDNAM2);
         outweb_(%subst(%str(%addr(H__7(32))):79:238));
         wfrtn__ = AfToPage_(DISABLED_ESIGN);
         outweb_(%subst(%str(%addr(H__7(35))):77:8));
         wfrtn__ = AfToPage_(PDEMAIL);
         outweb_(%subst(%str(%addr(H__7(36))):5:260));
         wfrtn__ = AfToPage_(DISABLED);
         outweb_(%subst(%str(%addr(H__7(39))):25:8));
         wfrtn__ = AfToPage_(PDADR1);
         outweb_(%subst(%str(%addr(H__7(39))):33:243));
         wfrtn__ = AfToPage_(DISABLED);
         outweb_(%subst(%str(%addr(H__7(42))):36:8));
         wfrtn__ = AfToPage_(PDADR2);
         outweb_(%subst(%str(%addr(H__7(42))):44:248));
         wfrtn__ = AfToPage_(%trim(%editw(PDPHON:'   -   -    ')));
         outweb_(%subst(%str(%addr(H__7(45))):52:238));
         wfrtn__ = AfToPage_(DISABLED);
         outweb_(%subst(%str(%addr(H__7(48))):50:8));
         wfrtn__ = AfToPage_(PDCITY);
         outweb_(%subst(%str(%addr(H__7(48))):58:181));
         wrtpdstbox0();
         outweb_(%subst(%str(%addr(H__7(50))):79:212));
         wfrtn__ = AfToPage_(DISABLED);
         outweb_(%subst(%str(%addr(H__7(53))):51:8));
         AfToPage_(%trim(%editc(PDZIP:'X')));
         outweb_(%subst(%str(%addr(H__7(53))):59:270));
         wfrtn__ = AfToPage_(DISABLED);
         outweb_(%subst(%str(%addr(H__7(57))):9:8));
         AfToPage_(%trim(%editc(PDEFTABA:'X')));
         outweb_(%subst(%str(%addr(H__7(57))):17:272));
         wfrtn__ = AfToPage_(DISABLED);
         outweb_(%subst(%str(%addr(H__7(60))):49:8));
         wfrtn__ = AfToPage_(PDEFTACCT);
         outweb_(%subst(%str(%addr(H__7(60))):57:199));
         achtypebox0();
         outweb_(%subst(%str(%addr(H__7(63))):16:52));
         if (client = '106');
          OutWeb_(%trimr( '<tr><td class="left">EFIN:</td><td class="right"><-
       input type="text" name="AIT_EFIN" size="6" maxlength="6" value="' +
       %trim(ait_efin) + '" style="width: 150px;"></td></tr><tr>'));
         endif;
         if (renttoown = 'Y');
          OutWeb_(%trimr( '<tr><td class="left">RTO Tax Rate:</td><td class="-
       right"><input type="text" name="PRTORATE" size="6" maxlength="6" value-
       ="' + %editc(PRTORATE:'J') + '" style="width: 150px;"></td></tr><tr>')
       );
          OutWeb_(%trimr( '<tr><td class="left">RTO Refund Percentage:</td><t-
       d class="right"><input type="text" name="PRTOREFPCT" size="6" maxlengt-
       h="6" value="' + %editc(PRTOREFPCT:'J') + '" style="width: 150px;"></t-
       d></tr><tr>'));
          OutWeb_(%trimr( '<tr><td class="left">RTO LDW Rate:</td><td class="-
       right"><input type="text" name="PRTOLDW" size="6" maxlength="6" value=-
       "' + %editc(PRTOLDW:'J') + '" style="width: 150px;"></td></tr><tr>'));
          OutWeb_(%trimr( '<tr><td class="left">RTO Delivery Fee:</td><td cla-
       ss="right"><input type="text" name="PRTODELIV" size="6" maxlength="6" -
       value="' + %editc(PRTODELIV:'J') + '" style="width: 150px;"></td></tr>-
       <tr>'));
          OutWeb_(%trimr( '<tr><td class="left">RTO Processing Fee:</td><td c-
       lass="right"><input type="text" name="PRTOPROC" size="6" maxlength="6"-
        value="' + %editc(PRTOPROC:'J') + '" style="width: 150px;"></td></tr>-
       <tr>'));
          OutWeb_(%trimr( '<tr><td class="left">Early Buyout Fee:</td><td cla-
       ss="right"><input type="text" name="PEPOFEE" size="6" maxlength="6" va-
       lue="' + %editc(PEPOFEE:'J') + '" style="width: 150px;"></td></tr><tr>-
       '));
          OutWeb_(%trimr( '<tr><td class="left">Early Buyout Pct:</td><td cla-
       ss="right"><input type="text" name="PEPOPCT" size="6" maxlength="6" va-
       lue="' + %editc(PEPOPCT:'J') + '" style="width: 150px;"></td></tr><tr>-
       '));
          OutWeb_(%trimr( '<tr><td class="left">RTO 1st Payment:</td><td clas-
       s="right"><input type="text" name="PRTOPMT" size="6" maxlength="6" val-
       ue="' + %editc(PRTOPMT:'J') + '" style="width: 150px;"></td></tr><tr>'
       ));
          OutWeb_('<tr><td class="left">RTO 3rd Party Product:</td><td class=-
       "right">');
          prodbox0();
          OutWeb_('</td></tr>');
          OutWeb_('<tr><td class="left">RTO 3rd Party:</td><td class="right">-
       ');
          prto3idbox0();
          OutWeb_('</td></tr>');
         endif;
         if (ibvopt = 'Y');
          OutWeb_('<tr><td class="left">Send IBV Text & Email:</td><td class=-
       "right">'+x'0D'+''+x'25'+'                		 <select name="SENDIBV">'
       +x'0D'+''+x'25'+'                		 <option value=""></option>'+x'0D'
       +''+x'25'+'                		 <option value="Y" ');
          if (sendibv = 'Y');
           OutWeb_('selected');
          endif;
          OutWeb_('>Send Automatically</option>');
          OutWeb_('<option value="N" ');
          if (sendibv = 'N');
           OutWeb_('selected');
          endif;
          OutWeb_('>Send Manually</option></select></td></tr><tr>');
         endif;
         if (notopt = 'Y');
          OutWeb_('<tr><td class="left">Text & Email Notification:</td><td cl-
       ass="right">'+x'0D'+''+x'25'+'                		 <select name="SENDNOT-
       ">'+x'0D'+''+x'25'+'                		 <option value=""></option>'+x'0-
       D'+''+x'25'+'                		 <option value="Y" ');
          if (sendnot = 'Y');
           OutWeb_('selected');
          endif;
          OutWeb_('>Yes</option>');
          OutWeb_('<option value="N" ');
          if (sendnot = 'N');
           OutWeb_('selected');
          endif;
          OutWeb_('>No</option></select></td></tr><tr>');
         endif;
         outweb_(%subst(%str(%addr(H__7(63))):68:148));
         wrtprodbox0();
         outweb_(%subst(%str(%addr(H__7(65))):56:185));
         decmodbox0();
         outweb_(%subst(%str(%addr(H__7(68))):1:162));
         webmodbox0();
         outweb_(%subst(%str(%addr(H__7(70))):3:203));
         ppcardbox0();
         outweb_(%subst(%str(%addr(H__7(72))):46:149));
         ppibvbox0();
         outweb_(%subst(%str(%addr(H__7(74))):35:167));
         ibvwbox0();
         outweb_(%subst(%str(%addr(H__7(76))):42:165));
         ibvsbox0();
         outweb_(%subst(%str(%addr(H__7(78))):47:565));
         AfToPage_(%trim(%editc(RRN:'X')));
         outweb_(%subst(%str(%addr(H__7(85))):52:2890));
         return ;
        endif;
        if (PDZIP< 100000);
      /end-free
     C                   MOVE      PDZIP         pdozip5
      /free
         PDZIP = 0;
      /end-free
     C                   MOVEL     pdozip5       PDZIP
      /free
        endif;
        RS001_ = UpdateRcd_('RKWPDLOC');
       endif;
       if (client = '106');
        AM006_ = CV_BYKEY;
        CHAIN(E) DL006_ RAITPDOFFC;
        RS006_ = RcdSts2_('GETRCD': %error: %found: %eof);
        ait_efin = getparm3_('ait_efin':'*OPT');
        if (RS006_ = '1');
         RS006_ = UpdateRcd_('RAITPDOFFC');
        else;
         WRITE RAITPDOFFC;
         RS006_ = RcdSts2_('WRTRCD': %error: %found: %eof);
        endif;
       endif;
       ibvopt = getparm3_('ibvopt':'*OPT');
       pddtype = %trim(%editc(PDLOC:'P'));
       pddcode = 'SENDIBV';
       AM009_ = CV_BYKEY;
       CHAIN(E) DL009_ RKWPDDATA;
       RS009_ = RcdSts2_('GETRCD': %error: %found: %eof);
       pddchar = getparm3_('SENDIBV':'*OPT');
       if (RS009_ = '1');
        RS009_ = UpdateRcd_('RKWPDDATA');
       else;
        WRITE RKWPDDATA;
        RS009_ = RcdSts2_('WRTRCD': %error: %found: %eof);
       endif;
       notopt = getparm3_('notopt':'*OPT');
       pddtype = %trim(%editc(PDLOC:'P'));
       pddcode = 'SENDNOT';
       AM009_ = CV_BYKEY;
       CHAIN(E) DL009_ RKWPDDATA;
       RS009_ = RcdSts2_('GETRCD': %error: %found: %eof);
       pddchar = getparm3_('SENDNOT':'*OPT');
       if (RS009_ = '1');
        RS009_ = UpdateRcd_('RKWPDDATA');
       else;
        WRITE RKWPDDATA;
        RS009_ = RcdSts2_('WRTRCD': %error: %found: %eof);
       endif;
       if (renttoown = 'Y');
        AM007_ = CV_BYKEY;
        CHAIN(E) DL007_ RKWPRTOD;
        RS007_ = RcdSts2_('GETRCD': %error: %found: %eof);
        PRTORATE = %dec(aton_( getparm3_('PRTORATE':'*OPT'):46:16):8:5);
        PRTOREFPCT = %dec(aton_( getparm3_('PRTOREFPCT':'*OPT'):46:16):8:5);
        PRTOLDW = %dec(aton_( getparm3_('PRTOLDW':'*OPT'):46:16):8:5);
        PRTODELIV = %dec(aton_( getparm3_('PRTODELIV':'*OPT'):46:16):11:2);
        PRTOPROC = %dec(aton_( getparm3_('PRTOPROC':'*OPT'):46:16):11:2);
        PRTOPMT = %dec(aton_( getparm3_('PRTOPMT':'*OPT'):46:16):11:2);
        PEPOFEE = %dec(aton_( getparm3_('PEPOFEE':'*OPT'):46:16):11:2);
        PEPOPCT = %dec(aton_( getparm3_('PEPOPCT':'*OPT'):46:16):8:5);
        if (RS007_ = '1');
         taxjar0();
         RS007_ = UpdateRcd_('RKWPRTOD');
        else;
         taxjar0();
         WRITE RKWPRTOD;
         RS007_ = RcdSts2_('WRTRCD': %error: %found: %eof);
        endif;
       endif;
       AM013_ = CV_BYKEY;
       CHAIN(E) DL013_ RAFFPDLOC;
       RS013_ = RcdSts2_('GETRCD': %error: %found: %eof);
       PDEFTABA = %dec(aton_( getparm3_('PDEFTABA':'*OPT'):46:16):9:0);
       pdeftacct = getparm3_('pdeftacct':'*OPT');
       pdefttype = getparm3_('pdefttype':'*OPT');
       pdlprod = getparm3_('pdlprod':'*OPT');
       pdlmodel = getparm3_('pdlmodel':'*OPT');
       pdlwmodel = getparm3_('pdlwmodel':'*OPT');
       pdlppcard = getparm3_('pdlppcard':'*OPT');
       pdlppibv = getparm3_('pdlppibv':'*OPT');
       pdlibvw = getparm3_('pdlibvw':'*OPT');
       pdlibvs = getparm3_('pdlibvs':'*OPT');
       if (RS013_ = '1');
        RS013_ = UpdateRcd_('RAFFPDLOC');
       else;
        WRITE RAFFPDLOC;
        RS013_ = RcdSts2_('WRTRCD': %error: %found: %eof);
       endif;
       Redirect2_( 's_dlro.pgm?PDNO=' + %trim(pdno):'*SAME':'rand');
      /end-free
     c     *PSSR         begsr
     c                   endsr
     P                 E


     P*---------------------------------------------------------------------
     P* wrtpdstbox0...              - User defined function
     P*---------------------------------------------------------------------
     P wrtpdstbox0...
     P                 B
     D wrtpdstbox0...
     D                 PI




      /free
       boxtype = 'SYSTEM';
       p_ztype = 'STATECODE';
       boxname = 'PDST';
       boxid = 'PDST';
       boxselect = pdst;
       jvalidation = 'valState(''stateErr'');';
      /end-free
     C                   EVAL      QPGM__=%trim('KWWEB'     ) + '/' + 'SELBOX2'
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
     P* prto3idbox0...              - User defined function
     P*---------------------------------------------------------------------
     P prto3idbox0...
     P                 B
     D prto3idbox0...
     D                 PI




      /free
       AM011_ = CV_BYKEY;
       CHAIN(NE) DL011_ RKWPDRTO3;
       RS011_ = RcdSts2_('GETRCD': %error: %found: %eof);
       rto3id = prto3id;
       OutWeb_('<select name="PRTO3ID" id="PRTO3ID" >');
       OutWeb_(%trimr( '<option value="' + '"  >' + '   ' + '</option>'));
       SETLL  *LOVAL RKWPRTO3;
       RS010_ = RcdSts2_('POSRCD':%error:%equal:%eof);
       READ(NE)  RKWPRTO3;
       RS010_ = RcdSts2_('GETNXTRCD':%error:%found:%eof);
       AM010_ = CV_ByKey;
       dow (RS010_ = '1');
       if (rto3id = prto3id);
        OutWeb_(%trimr( '<option value="' + %trim(prto3id) + '" selected >'));
        OutWeb_(%trimr( %trim(prto3n1) + '-' + %trim(prto3city)));
        OutWeb_('</option>');
       else;
        OutWeb_(%trimr( '<option value="' + %trim(prto3id) + '">'));
        OutWeb_(%trimr( %trim(prto3n1) + '-' + %trim(prto3city)));
        OutWeb_('</option>');
       endif;
       READ(NE)  RKWPRTO3;
       RS010_ = RcdSts2_('GETNXTRCD':%error:%found:%eof);
       AM010_ = CV_ByKey;
       enddo;
       OutWeb_('</select>');
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
       AM011_ = CV_BYKEY;
       CHAIN(NE) DL011_ RKWPDRTO3;
       RS011_ = RcdSts2_('GETRCD': %error: %found: %eof);
       prod = pprod;
       p_ztype = 'KWPPBASE';
       boxname = 'PPROD';
       boxid = 'PPROD';
       boxselect = prod;
       boxtype = 'OTHER';
       OutWeb_('<select name="');
       OutWeb_(%trimr(boxname));
       OutWeb_('"');
       OutWeb_(' id="');
       OutWeb_(%trimr(boxid));
       OutWeb_('" onblur="');
       OutWeb_(%trimr(jvalidation));
       OutWeb_('"');
       OutWeb_(' size="1"');
       OutWeb_('>');
       OutWeb_('<option value=""></option>');
       pprod = ' ';
       SETLL  DL012_ RKWPPBASE;
       RS012_ = RcdSts2_('POSRCD':%error:%equal:%eof);
       READ(NE)  RKWPPBASE;
       RS012_ = RcdSts2_('GETNXTRCD':%error:%found:%eof);
       AM012_ = CV_ByKey;
       dow (RS012_ = '1');
       OutWeb_('<option value="');
       OutWeb_(%trimr(pprod));
       OutWeb_('"');
       if (prod = pprod);
        OutWeb_(' selected');
       endif;
       OutWeb_('>');
       OutWeb_(%trimr(ppdesc));
       OutWeb_('</option>');
       READ(NE)  RKWPPBASE;
       RS012_ = RcdSts2_('GETNXTRCD':%error:%found:%eof);
       AM012_ = CV_ByKey;
       enddo;
       OutWeb_('</select>');
      /end-free
     c     *PSSR         begsr
     c                   endsr
     P                 E


     P*---------------------------------------------------------------------
     P* achtypebox0...              - User defined function
     P*---------------------------------------------------------------------
     P achtypebox0...
     P                 B
     D achtypebox0...
     D                 PI




      /free
       boxtype = 'SYSTEM';
       p_ztype = 'ACH_ACTTYP';
       boxname = 'PDEFTTYPE';
       boxid = 'PDEFTTYPE';
       boxselect = pdefttype;
       jvalidation = ' ';
      /end-free
     C                   EVAL      QPGM__=%trim('KWWEB'     ) + '/' + 'SELBOX2'
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
     P* decmodbox0...               - User defined function
     P*---------------------------------------------------------------------
     P decmodbox0...
     P                 B
     D decmodbox0...
     D                 PI




      /free
       boxname = 'PDLMODEL';
       boxid = 'PDLMODEL';
       boxtype = 'OTHER';
       OutWeb_('<select name="');
       OutWeb_(%trimr(boxname));
       OutWeb_('"');
       OutWeb_(' id="');
       OutWeb_(%trimr(boxid));
       OutWeb_('" onblur="');
       OutWeb_(%trimr(jvalidation));
       OutWeb_('"');
       OutWeb_(' size="1"');
       OutWeb_('>');
       OutWeb_('<option value="">Use product settings</option>');
       pdmodel = '';
       SETLL  DL014_ RKWPDECMOD;
       RS014_ = RcdSts2_('POSRCD':%error:%equal:%eof);
       READ(NE)  RKWPDECMOD;
       RS014_ = RcdSts2_('GETNXTRCD':%error:%found:%eof);
       AM014_ = CV_ByKey;
       dow (RS014_ = '1');
       if ( %subst(pdmodel: %len(%trimr( %trim(pdmodel))) - 2:3) <> 'REV');
        OutWeb_('<option value="');
        OutWeb_(%trimr(pdmodel));
        OutWeb_('"');
        if (pdmodel = pdlmodel);
         OutWeb_(' selected');
        endif;
        OutWeb_('>');
        OutWeb_(%trimr(pddesc));
        OutWeb_('</option>');
       endif;
       READ(NE)  RKWPDECMOD;
       RS014_ = RcdSts2_('GETNXTRCD':%error:%found:%eof);
       AM014_ = CV_ByKey;
       enddo;
       OutWeb_('</select>');
      /end-free
     c     *PSSR         begsr
     c                   endsr
     P                 E


     P*---------------------------------------------------------------------
     P* wrtprodbox0...              - User defined function
     P*---------------------------------------------------------------------
     P wrtprodbox0...
     P                 B
     D wrtprodbox0...
     D                 PI




      /free
       p_ztype = 'KWPPBASE';
       boxname = 'PDLPROD';
       boxid = 'PDLPROD';
       boxselect = pdlprod;
       boxtype = 'OTHER';
       OutWeb_('<select name="');
       OutWeb_(%trimr(boxname));
       OutWeb_('"');
       OutWeb_(' id="');
       OutWeb_(%trimr(boxid));
       OutWeb_('" onblur="');
       OutWeb_(%trimr(jvalidation));
       OutWeb_('"');
       OutWeb_(' size="1"');
       OutWeb_('>');
       OutWeb_('<option value=""></option>');
       pprod = ' ';
       SETLL  DL012_ RKWPPBASE;
       RS012_ = RcdSts2_('POSRCD':%error:%equal:%eof);
       READ(NE)  RKWPPBASE;
       RS012_ = RcdSts2_('GETNXTRCD':%error:%found:%eof);
       AM012_ = CV_ByKey;
       dow (RS012_ = '1');
       OutWeb_('<option value="');
       OutWeb_(%trimr(pprod));
       OutWeb_('"');
       if (pdlprod = pprod);
        OutWeb_(' selected');
       endif;
       OutWeb_('>');
       OutWeb_(%trimr(ppdesc));
       OutWeb_('</option>');
       READ(NE)  RKWPPBASE;
       RS012_ = RcdSts2_('GETNXTRCD':%error:%found:%eof);
       AM012_ = CV_ByKey;
       enddo;
       OutWeb_('</select>');
      /end-free
     c     *PSSR         begsr
     c                   endsr
     P                 E


     P*---------------------------------------------------------------------
     P* webmodbox0...               - User defined function
     P*---------------------------------------------------------------------
     P webmodbox0...
     P                 B
     D webmodbox0...
     D                 PI




      /free
       boxname = 'PDLWMODEL';
       boxid = 'PDLWMODEL';
       boxtype = 'OTHER';
       OutWeb_('<select name="');
       OutWeb_(%trimr(boxname));
       OutWeb_('"');
       OutWeb_(' id="');
       OutWeb_(%trimr(boxid));
       OutWeb_('" onblur="');
       OutWeb_(%trimr(jvalidation));
       OutWeb_('"');
       OutWeb_(' size="1"');
       OutWeb_('>');
       OutWeb_('<option value="">Use store model</option>');
       pdmodel = '';
       SETLL  DL014_ RKWPDECMOD;
       RS014_ = RcdSts2_('POSRCD':%error:%equal:%eof);
       READ(NE)  RKWPDECMOD;
       RS014_ = RcdSts2_('GETNXTRCD':%error:%found:%eof);
       AM014_ = CV_ByKey;
       dow (RS014_ = '1');
       OutWeb_('<option value="');
       OutWeb_(%trimr(pdmodel));
       OutWeb_('"');
       if (pdmodel = pdlwmodel);
        OutWeb_(' selected');
       endif;
       OutWeb_('>');
       OutWeb_(%trimr(pddesc));
       OutWeb_('</option>');
       READ(NE)  RKWPDECMOD;
       RS014_ = RcdSts2_('GETNXTRCD':%error:%found:%eof);
       AM014_ = CV_ByKey;
       enddo;
       OutWeb_('</select>');
      /end-free
     c     *PSSR         begsr
     c                   endsr
     P                 E


     P*---------------------------------------------------------------------
     P* ppcardbox0...               - User defined function
     P*---------------------------------------------------------------------
     P ppcardbox0...
     P                 B
     D ppcardbox0...
     D                 PI




      /free
       boxselect = pdlppcard;
       boxtype = 'SYSTEM';
       p_ztype = 'YESNO';
       boxname = 'PDLPPCARD ';
       boxid = 'PDLPPCARD ';
       jvalidation = '';
      /end-free
     C                   EVAL      QPGM__=%trim('KWWEB'     ) + '/' + 'SELBOX2'
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
     P* ppibvbox0...                - User defined function
     P*---------------------------------------------------------------------
     P ppibvbox0...
     P                 B
     D ppibvbox0...
     D                 PI




      /free
       boxselect = pdlppibv;
       boxtype = 'SYSTEM';
       p_ztype = 'YESNO';
       boxname = 'PDLPPIBV ';
       boxid = 'PDLPPIBV ';
       jvalidation = '';
      /end-free
     C                   EVAL      QPGM__=%trim('KWWEB'     ) + '/' + 'SELBOX2'
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
     P* ibvwbox0...                 - User defined function
     P*---------------------------------------------------------------------
     P ibvwbox0...
     P                 B
     D ibvwbox0...
     D                 PI




      /free
       boxselect = pdlibvw;
       boxtype = 'SYSTEM';
       p_ztype = 'YESNO';
       boxname = 'PDLIBVW ';
       boxid = 'PDLIBVW ';
       jvalidation = '';
      /end-free
     C                   EVAL      QPGM__=%trim('KWWEB'     ) + '/' + 'SELBOX2'
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
     P* ibvsbox0...                 - User defined function
     P*---------------------------------------------------------------------
     P ibvsbox0...
     P                 B
     D ibvsbox0...
     D                 PI




      /free
       ibvsopts(1) = 'Use Dealer Setting';
       ibvsopts(2) = 'Easy';
       ibvsopts(3) = 'None';
       ibvsopts(4) = 'Intermediate';
       ibvsopts(5) = 'Hard';
       OutWeb_('<select name="IBVS" id="IBVS">');
       ibvsiter = 1;
       dow (ibvsiter <= 5);
       if (ibvsiter = 1);
        ibvsopt = ' ';
       else;
        ibvsopt = %subst(ibvsopts(ibvsiter):1:1);
       endif;
       OutWeb_('<option ');
       if (ibvsopt = pdlibvs);
        OutWeb_('selected');
       endif;
       OutWeb_(%trimr( ' value="' + ibvsopt + '">' + %trim(ibvsopts(ibvsiter)
       ) + '</option>'));
       ibvsiter = ibvsiter + 1;
       enddo;
       OutWeb_('</select>');
      /end-free
     c     *PSSR         begsr
     c                   endsr
     P                 E


     P*---------------------------------------------------------------------
     P* taxjar0...                  - User defined function
     P*---------------------------------------------------------------------
     P taxjar0...
     P                 B
     D taxjar0...
     D                 PI




      /free
       tj_client = '108';
       tj_func = 'rate';
       tj_dlr = pdno;
       tj_loc = %trim(%editc(pdloc:'P'));
      /end-free
     C                   EVAL      QPGM__=%trim('KWPGM'     ) + '/' + 'SP_TAX-
     C                             JAR'
     C                   CALL      QPGM__                               90
     C                   PARM                    tj_client
     C                   PARM                    tj_func
     C                   PARM                    tj_dlr
     C                   PARM                    tj_loc
     C                   PARM                    tj_cust
     C                   PARM                    tj_acct
     C                   PARM                    tj_amt
     C                   PARM                    tj_datein
     C                   PARM                    tj_seq
     C                   PARM                    tj_rate
     C                   IF        *IN90 = '1'
     C                   EVAL      LstPmlErr_ = 1
     C                   ELSE
     C                   EVAL      LstPmlErr_ = 0
     C                   ENDIF
      /free
       if ((((tj_rate <> '')) and ((tj_rate <> '0'))));
        monitor;
        prtorate = ( 100 * %dec(aton_(tj_rate:46:16):46:16));
        on-error 00103:00105;
        endmon;
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

      /end-free
     C                   TIME                    CURTIME__
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
       if   ((file__='KWPDLOC' or file__='*ALL') and NOT %OPEN(KWPDLOC));
        if (mbr__ <> '*FIRST');
         ovrdbf_(ovrflag__:'KWPDLOC':'KWPDLOC' : '*LIBL' : mbr__);
        elseif ('KWPDLOC' <> 'KWPDLOC');
         ovrdbf_(ovrflag__:'KWPDLOC':'KWPDLOC' : '*LIBL');
        endif;
        if    erropen__ = 'Y';
         OPEN(E) KWPDLOC;             //    KWPDLOC
         if        %error;
          return %error;
         endif;
        else;
         OPEN KWPDLOC;                //    KWPDLOC
        endif;
       endif;
       if   (file__='KWPDLOC' or file__='*ALL')  and NOT %OPEN(F__ARR001);
        ovrdbf_(ovrflag__:'F__ARR001':'KWPDLOC' : '*LIBL' : mbr__);
        if   erropen__ = 'Y';
         OPEN(E) F__ARR001;          //   KWPDLOC
         if        %error;
          return %error;
         endif;
        else;
         OPEN F__ARR001;            //    KWPDLOC
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
       if   ((file__='KWPUOPT' or file__='*ALL') and NOT %OPEN(KWPUOPT));
        if (mbr__ <> '*FIRST');
         ovrdbf_(ovrflag__:'KWPUOPT':'KWPUOPT' : '*LIBL' : mbr__);
        elseif ('KWPUOPT' <> 'KWPUOPT');
         ovrdbf_(ovrflag__:'KWPUOPT':'KWPUOPT' : '*LIBL');
        endif;
        if    erropen__ = 'Y';
         OPEN(E) KWPUOPT;                //    KWPUOPT
         if        %error;
          return %error;
         endif;
        else;
         OPEN KWPUOPT;                //    KWPUOPT
        endif;
       endif;
       if   ((file__='AIT_PDOFFC' or file__='*ALL') and NOT %OPEN(AIT_PDOFFC));
        if (mbr__ <> '*FIRST');
         ovrdbf_(ovrflag__:'AIT_PDOFFC':'AIT_PDOFFC' : '*LIBL' : mbr__);
        elseif ('AIT_PDOFFC' <> 'AIT_PDOFFC');
         ovrdbf_(ovrflag__:'AIT_PDOFFC':'AIT_PDOFFC' : '*LIBL');
        endif;
        if    erropen__ = 'Y';
         OPEN(E) AIT_PDOFFC;                //    AIT_PDOFFC
         if        %error;
          return %error;
         endif;
        else;
         OPEN AIT_PDOFFC;                //    AIT_PDOFFC
        endif;
       endif;
       if   ((file__='KWPRTOD' or file__='*ALL') and NOT %OPEN(KWPRTOD));
        if (mbr__ <> '*FIRST');
         ovrdbf_(ovrflag__:'KWPRTOD':'KWPRTOD' : '*LIBL' : mbr__);
        elseif ('KWPRTOD' <> 'KWPRTOD');
         ovrdbf_(ovrflag__:'KWPRTOD':'KWPRTOD' : '*LIBL');
        endif;
        if    erropen__ = 'Y';
         OPEN(E) KWPRTOD;                //    KWPRTOD
         if        %error;
          return %error;
         endif;
        else;
         OPEN KWPRTOD;                //    KWPRTOD
        endif;
       endif;
       if   ((file__='KWPRULE' or file__='*ALL') and NOT %OPEN(KWPRULE));
        if (mbr__ <> '*FIRST');
         ovrdbf_(ovrflag__:'KWPRULE':'KWPRULE' : '*LIBL' : mbr__);
        elseif ('KWPRULE' <> 'KWPRULE');
         ovrdbf_(ovrflag__:'KWPRULE':'KWPRULE' : '*LIBL');
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
       if   ((file__='KWPDDATA' or file__='*ALL') and NOT %OPEN(KWPDDATA));
        if (mbr__ <> '*FIRST');
         ovrdbf_(ovrflag__:'KWPDDATA':'KWPDDATA' : '*LIBL' : mbr__);
        elseif ('KWPDDATA' <> 'KWPDDATA');
         ovrdbf_(ovrflag__:'KWPDDATA':'KWPDDATA' : '*LIBL');
        endif;
        if    erropen__ = 'Y';
         OPEN(E) KWPDDATA;                //    KWPDDATA
         if        %error;
          return %error;
         endif;
        else;
         OPEN KWPDDATA;                //    KWPDDATA
        endif;
       endif;
       if   ((file__='KWPRTO3' or file__='*ALL') and NOT %OPEN(KWPRTO3));
        if (mbr__ <> '*FIRST');
         ovrdbf_(ovrflag__:'KWPRTO3':'KWPRTO3' : '*LIBL' : mbr__);
        elseif ('KWPRTO3' <> 'KWPRTO3');
         ovrdbf_(ovrflag__:'KWPRTO3':'KWPRTO3' : '*LIBL');
        endif;
        if    erropen__ = 'Y';
         OPEN(E) KWPRTO3;                //    KWPRTO3
         if        %error;
          return %error;
         endif;
        else;
         OPEN KWPRTO3;                //    KWPRTO3
        endif;
       endif;
       if   ((file__='KWPDRTO3' or file__='*ALL') and NOT %OPEN(KWPDRTO3));
        if (mbr__ <> '*FIRST');
         ovrdbf_(ovrflag__:'KWPDRTO3':'KWPDRTO3' : '*LIBL' : mbr__);
        elseif ('KWPDRTO3' <> 'KWPDRTO3');
         ovrdbf_(ovrflag__:'KWPDRTO3':'KWPDRTO3' : '*LIBL');
        endif;
        if    erropen__ = 'Y';
         OPEN(E) KWPDRTO3;                //    KWPDRTO3
         if        %error;
          return %error;
         endif;
        else;
         OPEN KWPDRTO3;                //    KWPDRTO3
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
       if   ((file__='AFF_PDLOC' or file__='*ALL') and NOT %OPEN(AFF_PDLOC));
        if (mbr__ <> '*FIRST');
         ovrdbf_(ovrflag__:'AFF_PDLOC':'AFF_PDLOC' : '*LIBL' : mbr__);
        elseif ('AFF_PDLOC' <> 'AFF_PDLOC');
         ovrdbf_(ovrflag__:'AFF_PDLOC':'AFF_PDLOC' : '*LIBL');
        endif;
        if    erropen__ = 'Y';
         OPEN(E) AFF_PDLOC;                //    AFF_PDLOC
         if        %error;
          return %error;
         endif;
        else;
         OPEN AFF_PDLOC;                //    AFF_PDLOC
        endif;
       endif;
       if   ((file__='KWPDECMOD' or file__='*ALL') and NOT %OPEN(KWPDECMOD));
        if (mbr__ <> '*FIRST');
         ovrdbf_(ovrflag__:'KWPDECMOD':'KWPDECMOD' : '*LIBL' : mbr__);
        elseif ('KWPDECMOD' <> 'KWPDECMOD');
         ovrdbf_(ovrflag__:'KWPDECMOD':'KWPDECMOD' : '*LIBL');
        endif;
        if    erropen__ = 'Y';
         OPEN(E) KWPDECMOD;                //    KWPDECMOD
         if        %error;
          return %error;
         endif;
        else;
         OPEN KWPDECMOD;                //    KWPDECMOD
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
       when      rcdfmt__='RKWPDLOC' and AM001_ = CV_ByKey and RS001_ = *ON ;
       update RKWPDLOC;
       when      rcdfmt__='RKWPDLOC' and AM001_ = CV_ByRrn and RS001_ = *ON ;
       update R__ARR001;
       when      rcdfmt__='RAITPDOFFC' and AM006_ = CV_ByKey and RS006_ = *ON ;
       update RAITPDOFFC;
       when      rcdfmt__='RKWPRTOD' and AM007_ = CV_ByKey and RS007_ = *ON ;
       update RKWPRTOD;
       when      rcdfmt__='RKWPDDATA' and AM009_ = CV_ByKey and RS009_ = *ON ;
       update RKWPDDATA;
       when      rcdfmt__='RAFFPDLOC' and AM013_ = CV_ByKey and RS013_ = *ON ;
       update RAFFPDLOC;
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
       when      rcdfmt__='RKWPDRTO3' and AM011_ = CV_ByKey and RS011_ = *ON ;
       delete RKWPDRTO3;
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
System Settings:  Users
**CTDATA H__1        ListHeader                       3356
                
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>
    <
meta name="generator" content="WebSmart" />
    <meta http-equiv="Pragma" conten
t="no-cache" />
    <title>System Settings:  Dealer Offices</title>
    <link re
l="stylesheet" type="text/css" href="/websmart/kwikloan/styles/klstylei.css" med
ia="screen, tv, projection" />
    <link rel="stylesheet" type="text/css" href="
/websmart/kwikloan/styles/klstyleInquiry3.css" media="screen, tv, projection" />

    <link rel="stylesheet" type="text/css" href="/websmart/kwikloan/styles/noti
fications.css" media="screen, tv, projection" />
    <link rel="stylesheet" type
="text/css" href="/k_loan/s/tablesorter.css" media="screen, tv, projection" />

   <style type="text/css">
    #sections {
    border: 1px solid #9A9AA4;
    he
ight: 548px;
    margin-left: 10px;
    overflow-x: hidden;
    position: relati
ve;
    width: 679px;
    }
    </style>
  </head>
  <body>
    <form action=""
method="get">
      <input type="hidden" name="TASK" value="POST">
      <div id
="wrapping">
        <div id="everything">
          <div id="pagetitle">

      <span>System Settings:  Dealer Offices &nbsp;&nbsp;-- </span>

<span>: </span>
          </div>
          <div id="whitebg" class="whitebg">

          <!-- modal window boxes -->
            <div id="modalOverlay" style="
display: none;"></div>
            <div id="modalContainer" style="display: none
;">
              <div id="modalContent">
                <div class="modalHeade
r"><h3 id="headerText"></h3><a id="modalCloseA" class="modalCloseA" onclick="hid
eStuff2();"><div id="modalCloseImg" class="modalCloseImg"></div></a></div>

           <div id="modalFrameDiv"></div>
              </div>
            </div
>
            <!-- end modal window boxes -->
            
            <div clas
s="left">
              
              <table class="actionsTable">

    <tr><td><a href=""><img src="https://sb4.compass-technologies.com:8158/websm
art/kwikloan/images/loanInqADD.png"></a><span class="LSlabel"></span></td></tr>

              </table>
            </div><!--left-->
            
            <d
iv class="right">
              
              <div id="msg1" class="msg" style=
"display: none;">
                <div id="msgSym1" class="msgSym">

      <table class="msgSymbol">
                    <tr><td>&#33;</td></tr>

              </table>
                </div>
                <div class="msgWra
pper">
                  <table class="msgTable">
                    <tr><td id
="msg1" class="msgTxt">This application has successfully been converted to an <s
pan class="bold">OPEN LOAN</span>.</td></tr>
                  </table>

        </div>
              </div><!-- msg1 -->
              
             

            <div id="sections">
                
                

  
                
                <table id="mainTable" class="tablesorter">

               <thead>
                <tr>
                      <th>Action</th
>
                    <th>Location</th>
                    <th>Name</th>

              <th>Address</th>
                    <th>City/State/Zip</th>

             </tr>   
                  </thead><tbody>      

**CTDATA H__2        ListDetails                      417
<tr class=""> 
  <td>
    <a href="?TASK=beginmanage&rrn=&FirstRowRRN=&PDNO="><i
mg src="/websmart/v7.2/Lincoln/images/edit.gif"  alt="Edit" title="Edit"></a>

 <!-- <a href="?TASK=delconf&rrn=&FirstRowRRN=&PDNO="><img src="/websmart/v7.2/L
incoln/images/delete.gif" alt="Delete" title="Delete"></a>-->
  </td> 
  <td cla
ss="text"></td>
  <td class="text"></td>
  <td class="text"></td>
  <td class="t
ext"></td>
</tr>

**CTDATA H__3        ListFooter                       983
</tbody>
</table>
<div id="pager">
<form>
		<img src="/k_loan/i/asc.gif" class="
first"/>
		<img src="/k_loan/i/asc.gif" class="prev"/>
		<!--<input type="text"
class="pagedisplay"/>--><span class="pagedisplay"></span>
		<img src="/k_loan/i/
desc.gif" class="next"/>
		<img src="/k_loan/i/desc.gif" class="last"/>
		<selec
t style="width: 0px; height: 0px;" class="pagesize">
			<option selected="select
ed" value="14">14</option>
		</select>
	</form>
	</div>
</form>
</div><!--sectio
ns-->
</div><!--right-->
</div><!--whitebg-->
</div><!--everything-->
</div><!--
wrapping-->
<script type="text/javascript" src="/k_loan/jq/172.js"></script>
<sc
ript type="text/javascript" src="/k_loan/jq/tablesorter.min.js"></script>
<scrip
t type="text/javascript" src="/k_loan/jq/tablepager.js"></script>
<script type="
text/javascript">
$(document).ready(function() 
    { 
        $("#mainTable").t
ablesorter().tablesorterPager({container: $("#pager")}); 
    } 
);
</script>
</
form>
</body>
</html>


**CTDATA H__4        RcdDisplay                       143


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.
org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>

</html>




**CTDATA H__5        DelChoice                        2480
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.or
g/TR/xhtml1/DTD/xhtml1-transitional.dtd">
  <html>
    <head>
      <meta name="
generator" content="WebSmart" />
      <meta http-equiv="Pragma" content="no-cac
he" />
      <title>System Settings:  Dealers - Add or Change</title>
      <lin
k rel="stylesheet" type="text/css" href="/websmart/kwikloan/styles/klDFtheme.css
" media="screen, tv, projection" title="default"/>
      <link rel="stylesheet"
type="text/css" href="/websmart/kwikloan/styles/klstylei.css" media="screen, tv,
 projection" />
      <script type="text/javascript" src="/websmart/kwikloan/jav
ascript/klscripts.js"></script>
          <!-- removed klthemes.js reference -->

      <script type="text/javascript" src="/websmart/v7.2/javascript/esdiapi010.
js"></script>
          <script type="text/javascript" src="/websmart/v8.8/javas
cript/jquery.min.js"></script>

      <script type="text/javascript">
		xl_Attac
hEvent(window, "load", WindowInit); 

		function WindowInit()
		{
			xl_FocusFir
stElement();
		}
	</script>
    </head>
    <body>
      <div id="wrapping">

     <div id="everything">
          
          
          <div id="pagetitle">

            <span>System Settings:  Dealer Offices</span>
          </div

    
          <div id="whitebg">
            <div id="EDITtitle"><span>Edit Dea
ler</span></div>
            <div id="EDITcontents"> 
             <form action=
"" method="get">
            <input type="hidden" name="task" value="endmanage">

            <input type="hidden" name="rrn" value="">
            <input type="
hidden" name="FirstRowRRN" value="">
                
                <table>

             <tr>
                <td class="left">Location No.:</td>

      <td class="right"></td>
              </tr>
              <tr>

     <td class="left">Location Name:</td>
                <td class="right"></td
>
              </tr> 
               <tr>
                <td COLSPAN="2">Are y
ou SURE you want to delete this record?</td>
              </tr>
              <
tr>
                <td>
                  <a href="?task=del&rrn=&FirstRowRRN="
>Yes</a>
                  &nbsp;&nbsp;
                  <a href="javascript:lo
cation.href='s_dlro.pgm?pdno='">No</a>
                </td>
              </tr>

                </table>
            		
              </form>
            </div
><!--editcontents-->
          </div></div></div>
    </body>
  </html>
  
  

**CTDATA H__6        RtnToList                        97
<input type="button" class="navbutton" value="Back" onclick="javascript:location
.href='?PDNO='"/>
**CTDATA H__7        RcdManage                        9661
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.or
g/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>
    <meta name="genera
tor" content="WebSmart" />
    <meta http-equiv="Pragma" content="no-cache" />

   <title>System Settings:  Dealers - Add or Change</title>
    <style type="tex
t/css">
    
    </style>
    <script type="text/javascript" src="/websmart/kwik
loan/javascript/klscripts.js"></script>
    <!-- removed klthemes.js reference -
->
    <script type="text/javascript" src="/websmart/v7.2/javascript/esdiapi010.
js"></script>
    <script type="text/javascript" src="/websmart/v8.8/javascript/
jquery.min.js"></script>
    
    <script type="text/javascript">
		xl_AttachEve
nt(window, "load", WindowInit); 

		function WindowInit()
		{
			xl_FocusFirstEl
ement();
		}
	</script>
  </head>
  <body>
    <form action="" method="get">

   <input type="hidden" name="task" value="endmanage">
      <input type="hidden
" name="rrn" value="">
      <input type="hidden" name="FirstRowRRN" value="">

     <input type="hidden" name="PDNO" value="">
      
      <div id="pagetitle"
>
        <span>System Settings:  Dealer Offices</span>
        <div id="topBtns
">
          <input type="submit" class="navbutton" name="mode" value="Update"/>

          <input type="button" class="navbutton" value="Cancel" onclick="javasc
ript:location.href='s_dlro.pgm?PDNO='"/>
        </div>
      </div> 
      <div
 id="wrapping">
        
        
        
        
        
        <div id="wh
itebg">
          <!-- <div id="EDITtitle"><span>Edit Dealer</span></div>-->

       <div id="EDITcontents"> 
            
            <table id="holderTable"
>
              
              
              <tr>
                <th>Edit Offi
ce</th>
              </tr>
              <tr>
                <td class="holder
Td">
                  <table class="dealerTable">
                    <tr>

                  <td class="left">Location Number:</td>
                      <
td class="right"><input type="text" id="PDLOC" name="PDLOC"  value="" style="wid
th: 150px;"></td>
                    </tr>
                    <tr>

           <td class="left">Location Name:</td>
                      <td class=
"right"><input type="text" name="PDNAM1" size="40" maxlength="40"  value="" styl
e="width: 150px;"></td>
                    </tr>
                    <tr>

                 <td class="left">Signer Name:</td>
                      <td cl
ass="right"><input type="text" name="PDNAM2" size="40" maxlength="40"  value=""
style="width: 150px;"></td>
                    </tr>
                    <tr>

                     <td class="left">Signer Email:</td>
                      <
td class="right"><input type="text" name="PDEMAIL" size="40" maxlength="40"  val
ue="" style="width: 250px;"></td>
                    </tr>                 

                 <tr>
                      <td class="left">Location Address 1:
</td>
                      <td class="right"><input type="text" name="PDADR1" s
ize="40" maxlength="40"  value="" style="width: 150px;"></td>

  </tr>
                    <tr>
                      <td class="left">Location
 Address 2:</td>
                      <td class="right"><input type="text" name
="PDADR2" size="40" maxlength="40"  value="" style="width: 150px;"></td>

             </tr>
                    <tr>
                      <td class="lef
t">Location Phone #:</td>
                      <td class="right"><input type="t
ext" name="PDPHON" size="22" maxlength="22" value="" style="width: 150px;"></td>

                    </tr>
                    <tr>
                      <td cl
ass="left">Location City:</td>
                      <td class="right"><input ty
pe="text" name="PDCITY" size="30" maxlength="40"  value="" style="width: 150px;"
></td>
                    </tr>
                    <tr>

<td class="left">Location State:</td>
                      <td class="right"></
td>
                    </tr>
                    <tr>
                      <td
 class="left">Location Zip:</td>
                      <td class="right"><input
type="text" name="PDZIP" size="10" maxlength="10"  value="" style="width: 150px;
"></td>
                    </tr>
                    
                     <tr>

                      <td class="left">Routing #</td>
                      <td
 class="right"><input type="text" name="PDEFTABA" id="PDEFTABA" size="25" maxlen
gth="9"  value="" onKeyPress="numbersOnly(this.value,this);"></td>

       </tr>
                    <tr>
                      <td class="left">Acc
ount #</td>
                      <td class="right"><input type="text" name="PDE
FTACCT" id="PDEFTACCT" size="30" maxlength="40"  value="" onKeyPress="numbersOnl
y(this.value,this);"></td>
                    </tr>
                    <tr>

                    <td class="left">Account Type</td>
                      <td
 class="right"></td>
                    </tr>
                    

        
                    <tr>
                      <td class="left">Default
 Product:</td>
                      <td class="right"></td>

 </tr>
                    
                    <tr>
                      <td c
lass="left"> Store Decision Model:</td>
                      <td class="right">
</td>
                    </tr>
                    <tr>
                      <
td class="left"> WEB Decision Model:</td>
                      <td class="right
"></td>
                    </tr>
                    
                    

                  <tr>
                    	<td class="left">Deny Prepaid Cards?
</td>
                    	<td class="right"></td>
                    </tr>


    				<tr>
                    	<td class="left">IBV Prepaid Cards?</td>

               	<td class="right"></td>
                    </tr>
     
      				<tr>
                    	<td class="left">IBV All Web Apps?</td
>
                    	<td class="right"></td>
                    </tr>
            
      				<tr>
                    	<td class="left">IBV Risk Level
?</td>
                    	<td class="right"></td>
                    </tr>
                 
                    
                    

<tr>
                      
                      <td class="left">&nbsp;</td>

                     <td class="right">&nbsp;</td>
                    </tr>

                 
                    
                    


                  </table>
                </td>
              </tr>

  </table>
            <div id="navbottom">
              
              <script
 type="text/javascript">
	var protkey = "";   
	if( == 0)
	{
		
		xl_GetFormElem
entByName("mode").value = "Add";
	} 
	else 
	{
		protkey  = xl_GetFormElementByN
ame("PDUID");
		protkey.readOnly = true;
		protkey.className = protkey.className
 + " disabled";
		xl_GetFormElementByName("mode").value = "Change";
	}
	function
 mask(inputString,textbox,delimiterLocations,delimeter){
//only allow numeric in
put
	var characterTyped = inputString.substring(inputString.length - 1);
	if (ch
aracterTyped != '0'
		&& characterTyped != '1'
		&& characterTyped != '2'
		&& c
haracterTyped != '3'
		&& characterTyped != '4'
		&& characterTyped != '5'
		&&
characterTyped != '6'
		&& characterTyped != '7'
		&& characterTyped != '8'
		&&
 characterTyped != '9'
		&& characterTyped != '.')
	{
		textbox.value = inputStr
ing.substring(0,inputString.length - 1);
		return;
	}
	
	var locations = delimit
erLocations.split(',');
	
	for (var i = 0; i <= locations.length; i++)
	{
		for
(var k = 0; k <= inputString.length; k++)
		{
			if (k == locations[i])
			{
			
	if (inputString.substring(k, k+1) != delimeter)
				{
					inputString = inputS
tring.substring(0,k) + delimeter + inputString.substring(k,inputString.length);

				}
			}
		}
	}
	textbox.value = inputString;
}
function numbersOnly(inputStri
ng,textbox){
	var characterTyped = inputString.substring(inputString.length - 1)
;
	if (characterTyped != '0'
		&& characterTyped != '1'
		&& characterTyped != '
2'
		&& characterTyped != '3'
		&& characterTyped != '4'
		&& characterTyped !=
'5'
		&& characterTyped != '6'
		&& characterTyped != '7'
		&& characterTyped !=
 '8'
		&& characterTyped != '9'
		&& characterTyped != '.'
		&& characterTyped !
= '/')
	{
		textbox.value = inputString.substring(0,inputString.length - 1);
		r
eturn;
	}	
}

function numbersOnlyF(inputString,textbox){
  var characterTyped =
 inputString.substring(inputString.length - 1);
  if (characterTyped != '0'

&& characterTyped != '1'
    && characterTyped != '2'
    && characterTyped != '
3'
    && characterTyped != '4'
    && characterTyped != '5'
    && characterTyp
ed != '6'
    && characterTyped != '7'
    && characterTyped != '8'
    && chara
cterTyped != '9'
    && characterTyped != '.')
  {
    textbox.value = inputStri
ng.substring(0,inputString.length - 1);
    return;
  } 
}

function numbersOnly
Strict(inputString,textbox){
  var characterTyped = inputString.substring(inputS
tring.length - 1);
  if (characterTyped != '0'
    && characterTyped != '1'

&& characterTyped != '2'
    && characterTyped != '3'
    && characterTyped != '
4'
    && characterTyped != '5'
    && characterTyped != '6'
    && characterTyp
ed != '7'
    && characterTyped != '8'
    && characterTyped != '9')
  {
    tex
tbox.value = inputString.substring(0,inputString.length - 1);
    return;
  } 
}

</script>
              
            </div>		
            
          </div><!--
editcontents-->
        </div></div></form>
  </body>
</html>
**CTDATA H__8        manageCSS                        2599
input
{
width: 180px;	
}
select
{
width: 185px;	
}
.checkBox
{
width: 10px;	
}
#
holderTable
{
position: relative;
margin-top: 40px;
border-collapse: collapse;
m
argin-left: auto;
margin-right: auto;
width: 98%;
min-width: 800px;	
}
#holderTa
ble tr th
{
background-color: #6C6C6C;
color: #FFFFFF;
font-family: verdana;
fon
t-size: 12px;
font-weight: normal;
padding: 5px;
text-align: left;
}
.loanProd,
.stateTable, .holderTd
{
vertical-align: top;	
}
.loanProd
{
border-left: 1px so
lid #cccccc;	
}
.holderTd
{
border-right: 1px solid #cccccc;
}
#stateTable
{
pos
ition: relative;
width: 300px;
border-left: 1px solid #CCCCCC;	
}
.stateTable tr
 td
{
padding: 0px 0px 0px 3px;
vertical-align: top;	
}
.loanProd
{
padding: 0px
 0px 0px 3px;
vertical-align: top;	
}
#stateOfBus
{
font-family: verdana;
font-s
ize: 11px;	
}
#loanProd
{
font-family: verdana;
font-size: 11px;
}
body {
backgr
ound-image: none;
color: #000000;
background-color: #c9c9c9;
padding-top: 0px;
p
adding-bottom: 0px;
padding-left: 0px;
padding-right: 0px;
}

#wrapping {
width:
 98%;
margin-left: auto;
margin-right: auto;
}

#everything {
width: 98%;
margin
-top: 10px;
margin-left: auto;
margin-right: auto;
padding-bottom: 10px;
backgro
und-color: #EAEAEA;
background-image: url('/websmart/kwikloan/images/pshadow.png
');
background-position: right;
background-repeat: repeat-y;
}

#topBtns
{
float
: right;
padding-right: 12px;
margin-right: 30px;
}

#pagetitle {
font-size: 14p
x;
color: #FFFFFF;
width: 100%;
background-color: #839dc1;
padding: 10px;
positi
on: fixed;
top: 0px;
left: 0px;
z-index: 9999;
}

#pagetitle span {
margin-left:
 10px;
font-family: verdana;
padding: 5px;
}

#whitebg {
background-color: #FFFF
FF;
border: 1px solid #999;
padding: 10px;
margin-top: 10px;
margin-bottom: 10px
;
margin-left: auto;
margin-right: auto;
width: 98%;
height: 98%;
}

#whitebg ta
ble td a {
color: #06f;
}

DIV.whitebg {
height: 565px;	
}

DIV.left {
position:
 relative;
float: left;
height: 550px;
width: 200px;
background-color: #6d819c;

background-image: url('/websmart/kwikloan/images/loanInqLeft.png');
}

DIV.right
 {
position: relative;
float: left;
height: 550px;
width: 650px; 
}


table.deal
erTable 
{
border-spacing: 0;
font-family: verdana;
font-size: 11px;
margin-top:
 8px;
padding-bottom: 5px;
left: 7px;
position: relative;
width: 350px;
}
table.
dealerTable td 
{
font-family: verdana;
font-size: 11px;
padding: 6px 5px 6px 0p
x;
vertical-align: middle;
}
table.dealerTable td.left 
{
text-align: right;
wid
th: 130px;
}
table.dealerTable td.right 
{
padding-left: 8px;
text-align: left;

width: 190px;
vertical-align: middle;
}

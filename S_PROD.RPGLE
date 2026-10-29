     H/TITLE  System Settings:  Producst
      * ProGen WebSmart Revision 21923
      * File overrides for compile command
      *__OV OVRDBF KWPPBASE   KWPPBASE
      *__OV OVRDBF F__ARR001  KWPPBASE
      *__OV OVRDBF KWPUBASE   KWPUBASE
      *__OV OVRDBF KWP_DATA   KWP_DATA
      *__OV OVRDBF NCC_PPBASE NCC_PPBASE
      *__OV OVRDBF KWPPNSF    KWPPNSF
      *__OV OVRDBF KWPPLINK   KWPPLINK
      *__OV OVRDBF KWPPGM     KWPPGM
      *__OV OVRDBF KWSTYPE    KWSTYPE
      *__OV OVRDBF KWPDECMOD  KWPDECMOD
      *__OV OVRDBF KWPPRTO    KWPPRTO
      *__   Following values are used to create the server program
      *__RO Pgm  lib KWWEB      Pgm  S_PROD
      *__AG          WEBSMART
      *__CL          *OBJLIBNAM
      *__BD ECRTBND195
      *===============================================================*
      * Path:   s_prod.pdw
      * System: REGGIE-LENOVO
      * Project:Kwik-Loan
      * Set:    Development
      * User:   Reggie
      * Date Last Generated:   2017-09-14   15:28:38
      * Last Generated CRC: 72ECB7D5 32535ABD 01093FBC 3936B95C
      *===============================================================*
      */CPY *LIBL/PW_CSRC CPYRIGHT
      * File specifications
     FKWPPBASE  UF A E           K DISK    USROPN
     F                                     INFDS(FID001_   )
     FF__ARR001 UF A E             DISK    USROPN
     F                                     RENAME(RKWPPBASE    :R__ARR001   )
     FKWPUBASE  IF   E           K DISK    USROPN
     F                                     INFDS(FID002_   )
     FKWP_DATA  UF A E           K DISK    USROPN
     F                                     INFDS(FID003_   )
     FNCC_PPBASEUF A E           K DISK    USROPN
     F                                     INFDS(FID004_   )
     FKWPPNSF   UF A E           K DISK    USROPN
     F                                     INFDS(FID005_   )
     FKWPPLINK  UF A E           K DISK    USROPN
     F                                     INFDS(FID006_   )
     FKWPPGM    IF   E           K DISK    USROPN
     F                                     INFDS(FID007_   )
     FKWSTYPE   IF   E           K DISK    USROPN
     F                                     INFDS(FID008_   )
     FKWPDECMOD IF   E           K DISK    USROPN
     F                                     INFDS(FID009_   )
     FKWPPRTO   UF A E           K DISK    USROPN
     F                                     INFDS(FID010_   )

     D PTL__           S             50    DIM(1) CTDATA PERRCD(1)
     D RTLLA__         S             11    DIM(180)

     D*+FLDDCL Field declarations

     Duserdata         DS                  INZ
     D client                         5A
     D userid                        32A
     D location                       5A

     D rnd             S              6A
     D disphref        S            200A
     D edithref        S            200A
     D delhref         S            200A
     D addhref         S            200A
     D boxname         S             10A
     D boxid           S             10A
     D boxselect       S             25A
     D boxtype         S             10A
     D jvalidation     S             30A
     D artncod         S              5A
     D startrrn        S              9P 0
     D endrrn          S              9P 0
     D rcdcnt          S              5P 0
     D prevstate       S              5P 0
     D nextstate       S              5P 0
     D listsize        S              5P 0
     D rrn             S              9P 0
     D savedrrn        S              9A
     D mode            S             15A

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

     D H__2            S             80    PERRCD(1) CTDATA DIM(8           )

     D H__3            S             80    PERRCD(1) CTDATA DIM(10          )

     D H__4            S             80    PERRCD(1) CTDATA DIM(43          )

     D H__5            S             80    PERRCD(1) CTDATA DIM(3           )

     D H__6            S             80    PERRCD(1) CTDATA DIM(1           )

     D H__7            S             80    PERRCD(1) CTDATA DIM(172         )

     D H__8            S             80    PERRCD(1) CTDATA DIM(34          )

     D H__9            S             80    PERRCD(1) CTDATA DIM(1           )


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
     D ppdfreqbox0...
     D                 PR
     D QPGM__          S             21A
     D LstPmlErr_      S              4P 0 IMPORT
     D pprfreqbox0...
     D                 PR
     D pptypebox0...
     D                 PR
     D ppbpbox0...
     D                 PR
     D ppcatbox0...
     D                 PR
     D ppglbox0...
     D                 PR
     D decmodbox0...
     D                 PR
     D ppsigntypebox0...
     D                 PR
     D inactivebox0...
     D                 PR
     D ppstbox0...
     D                 PR
     D ppitmcdbox0...
     D                 PR
     D ppnsfbox0...
     D                 PR
     D ajaxnsf0...
     D                 PR
     D delnsf0...
     D                 PR
     D pppgmbox0...
     D                 PR
     D pp1pmtreqbox0...
     D                 PR
     D CURTIME__       S              6P 0
     D QPGMNAM__       S             20A
     D SmurfChk__      S              1A   INZ(*ON)
     D Smurf_ID__      S             64A   IMPORT
     D Smurf_Rw__      S              9B 0 IMPORT

     D userprofile     S                   LIKE(puprofile     )

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
     C                   KFLD                    pprod
     C     DL002_        KLIST
     C                   KFLD                    puid
     C     DL003_        KLIST
     C                   KFLD                    p_ztype
     C                   KFLD                    p_zkeya
     C                   KFLD                    p_zkeyn
     C     DL004_        KLIST
     C                   KFLD                    pprod
     C     DL005_        KLIST
     C                   KFLD                    pnsftype
     C     DL006_        KLIST
     C                   KFLD                    pprod
     C     DL007_        KLIST
     C                   KFLD                    psprogram
     C     DL008_        KLIST
     C                   KFLD                    pptype
     C     DL009_        KLIST
     C                   KFLD                    ppmodel
     C     DL010_        KLIST
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
       rnd = %trim(%editc(CURTIME__:'P'));
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
       listsize = 20;
       startrrn = %dec(aton_( getparm3_('rrn':'*OPT'):46:16):9:0);
       if (task__ = 'DEFAULT');
        taskran__ = *ON;
        displist0();
       endif ;
       if (task__ = 'PREV');
        taskran__ = *ON;
        prev0();
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
       if (task__ = 'AJAXGETNSF');
        taskran__ = *ON;
        ajaxnsf0();
       endif ;
       if (task__ = 'AJAXDELNSF');
        taskran__ = *ON;
        delnsf0();
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
       puid = userid;
       AM002_ = CV_BYKEY;
       CHAIN(NE) DL002_ RKWPUBASE;
       RS002_ = RcdSts2_('GETRCD': %error: %found: %eof);
       userprofile = puprofile;
       if (userprofile <> 'ADMINISTRATOR');
        addhref = '';
       else;
        addhref = 'window.location=''s_prod.pgm?task=beginmanage&rrn=0&rnd='
       + %trim(rnd) + '''';
       endif;
       pprod = getparm3_('PPROD':'*OPT');
       outweb_(%subst(%str(%addr(H__1(1))):1:975));
       wfrtn__ = AfToPage_(QPGMNAM__);
       outweb_(%subst(%str(%addr(H__1(13))):16:28));
       wfrtn__ = AfToPage_(RND);
       outweb_(%subst(%str(%addr(H__1(13))):44:193));
       wfrtn__ = AfToPage_(ADDHREF);
       outweb_(%subst(%str(%addr(H__1(15))):77:225));
       wfrtn__ = AfToPage_(QPGMNAM__);
       outweb_(%subst(%str(%addr(H__1(18))):62:1055));
       rcdcnt = 0;
       if (startrrn> 0);
        RR_001_ = startrrn;
        AM001_ = CV_BYRRN;
        CHAIN(NE) RR_001_ R__ARR001;
        RS001_ = RcdSts2_('GETRCD': %error: %found: %eof);
       endif;
       SETLL  pfklist RKWPPBASE;
       RS001_ = RcdSts2_('POSRCD':%error:%equal:%eof);
       READ(E)  RKWPPBASE;
       RS001_ = RcdSts2_('GETNXTRCD':%error:%found:%eof);
       AM001_ = CV_ByKey;
       if (RS001_ <> '1');
        SETLL  *HIVAL RKWPPBASE;
        RS001_ = RcdSts2_('POSRCD':%error:%equal:%eof);
        READ(E)  RKWPPBASE;
        RS001_ = RcdSts2_('GETNXTRCD':%error:%found:%eof);
        AM001_ = CV_ByKey;
       endif;
       dow ((((RS001_ = '1')) and ((rcdcnt< listsize))));
       rrn = RR_001_;
       if (rcdcnt = 0);
        startrrn = RR_001_;
       endif;
       disphref = '<a href="s_prod.pgm?TASK=disp&rrn=' + %trim(%editc(rrn:'P'
       )) + '&FirstRowRRN=' + %trim(%editc(startrrn:'P')) + '"><img src="/web-
       smart/v7.2/Lincoln/images/view.gif" alt="Display" title="Display"></a>-
       ';
       if (userprofile <> 'ADMINISTRATOR');
        edithref = '';
        delhref = '';
       else;
        edithref = '<a href="s_prod.pgm?TASK=beginmanage&rrn=' + %trim(
       %editc(rrn:'P')) + '&FirstRowRRN=' + %trim(%editc(startrrn:'P')) + '">-
       <img src="/websmart/v7.2/Lincoln/images/edit.gif"  alt="Edit" title="E-
       dit"></a>';
        delhref = '<a href="s_prod.pgm?TASK=delconf&rrn=' + %trim(%editc(rrn:
       'P')) + '&FirstRowRRN=' + %trim(%editc(startrrn:'P')) + '"><img src="/-
       websmart/v7.2/Lincoln/images/delete.gif" alt="Delete" title="Delete"><-
       /a>';
       endif;
       Flip_Rc_();
       outweb_(%subst(%str(%addr(H__2(1))):1:11));
       wfrtn__ = AfToPage_(ARCLR__);
       outweb_(%subst(%str(%addr(H__2(1))):12:22));
       wfrtn__ = AfToPage_(QPGMNAM__);
       outweb_(%subst(%str(%addr(H__2(1))):34:15));
       AfToPage_(%trim(%editc(RRN:'X')));
       outweb_(%subst(%str(%addr(H__2(1))):49:13));
       AfToPage_(%trim(%editc(STARTRRN:'X')));
       outweb_(%subst(%str(%addr(H__2(1))):62:102));
       wfrtn__ = AfToPage_(QPGMNAM__);
       outweb_(%subst(%str(%addr(H__2(3))):4:22));
       AfToPage_(%trim(%editc(RRN:'X')));
       outweb_(%subst(%str(%addr(H__2(3))):26:13));
       AfToPage_(%trim(%editc(STARTRRN:'X')));
       outweb_(%subst(%str(%addr(H__2(3))):39:98));
       wfrtn__ = AfToPage_(QPGMNAM__);
       outweb_(%subst(%str(%addr(H__2(4))):57:18));
       AfToPage_(%trim(%editc(RRN:'X')));
       outweb_(%subst(%str(%addr(H__2(4))):75:13));
       AfToPage_(%trim(%editc(STARTRRN:'X')));
       outweb_(%subst(%str(%addr(H__2(5))):8:128));
       wfrtn__ = AfToPage_(EDITHREF);
       outweb_(%subst(%str(%addr(H__2(6))):56:7));
       wfrtn__ = AfToPage_(DELHREF);
       outweb_(%subst(%str(%addr(H__2(6))):63:38));
       wfrtn__ = AfToPage_(PPROD);
       outweb_(%subst(%str(%addr(H__2(7))):21:25));
       wfrtn__ = AfToPage_(PPDESC);
       outweb_(%subst(%str(%addr(H__2(7))):46:25));
       wfrtn__ = AfToPage_(PPTYPE);
       outweb_(%subst(%str(%addr(H__2(7))):71:25));
       wfrtn__ = AfToPage_(PPBP);
       outweb_(%subst(%str(%addr(H__2(8))):16:12));
       endrrn = RR_001_;
       rcdcnt = rcdcnt + 1;
       READ(E)  RKWPPBASE;
       RS001_ = RcdSts2_('GETNXTRCD':%error:%found:%eof);
       AM001_ = CV_ByKey;
       enddo;
       RR_001_ = startrrn;
       AM001_ = CV_BYRRN;
       CHAIN(NE) RR_001_ R__ARR001;
       RS001_ = RcdSts2_('GETRCD': %error: %found: %eof);
       SETLL  pfklist RKWPPBASE;
       RS001_ = RcdSts2_('POSRCD':%error:%equal:%eof);
       READP(E)  RKWPPBASE;
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
        SETGT  pfklist RKWPPBASE;
        RS001_ = RcdSts2_('POSRCD':%error:%equal:%eof);
        READ(E)  RKWPPBASE;
        RS001_ = RcdSts2_('GETNXTRCD':%error:%found:%eof);
        AM001_ = CV_ByKey;
        if (RS001_ = '1');
         endrrn = RR_001_;
         nextstate = 1;
        endif;
       endif;
       outweb_(%subst(%str(%addr(H__3(1))):1:233));
       AfToPage_(%trim(%editc(PREVSTATE:'P')));
       outweb_(%subst(%str(%addr(H__3(3))):74:142));
       wfrtn__ = AfToPage_(QPGMNAM__);
       outweb_(%subst(%str(%addr(H__3(5))):56:15));
       AfToPage_(%trim(%editc(STARTRRN:'X')));
       outweb_(%subst(%str(%addr(H__3(5))):71:36));
       wfrtn__ = AfToPage_(QPGMNAM__);
       outweb_(%subst(%str(%addr(H__3(6))):27:15));
       AfToPage_(%trim(%editc(STARTRRN:'X')));
       outweb_(%subst(%str(%addr(H__3(6))):42:52));
       AfToPage_(%trim(%editc(NEXTSTATE:'P')));
       outweb_(%subst(%str(%addr(H__3(7))):14:143));
       wfrtn__ = AfToPage_(QPGMNAM__);
       outweb_(%subst(%str(%addr(H__3(8))):77:18));
       AfToPage_(%trim(%editc(ENDRRN:'X')));
       outweb_(%subst(%str(%addr(H__3(9))):15:36));
       wfrtn__ = AfToPage_(QPGMNAM__);
       outweb_(%subst(%str(%addr(H__3(9))):51:18));
       AfToPage_(%trim(%editc(ENDRRN:'X')));
       outweb_(%subst(%str(%addr(H__3(9))):69:35));

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
       SETLL  pfklist RKWPPBASE;
       RS001_ = RcdSts2_('POSRCD':%error:%equal:%eof);
       READP(E)  RKWPPBASE;
       RS001_ = RcdSts2_('GETPRVRCD': %error: %found: %eof);
       AM001_ = CV_ByKey;
       rcdcnt = 1;
       dow ((((RS001_ = '1')) and ((rcdcnt< listsize))));
       rcdcnt = rcdcnt + 1;
       READP(E)  RKWPPBASE;
       RS001_ = RcdSts2_('GETPRVRCD': %error: %found: %eof);
       AM001_ = CV_ByKey;
       enddo;
       startrrn = RR_001_;
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
       pppgm = '';
       AM006_ = CV_BYKEY;
       CHAIN(NE) DL006_ RKWPPLINK;
       RS006_ = RcdSts2_('GETRCD': %error: %found: %eof);
       outweb_(%subst(%str(%addr(H__4(1))):1:1003));
       if (TASK__ = 'DISP');
        outweb_(%subst(%str(%addr(H__6(1))):1:48));
        wfrtn__ = AfToPage_(SAVEDRRN);
        outweb_(%subst(%str(%addr(H__6(1))):49:17));
       else;
        if (TASK__ = 'DELCONF');
         outweb_(%subst(%str(%addr(H__5(1))):1:61));
         wfrtn__ = AfToPage_(QPGMNAM__);
         outweb_(%subst(%str(%addr(H__5(1))):62:14));
         AfToPage_(%trim(%editc(RRN:'X')));
         outweb_(%subst(%str(%addr(H__5(1))):76:13));
         wfrtn__ = AfToPage_(SAVEDRRN);
         outweb_(%subst(%str(%addr(H__5(2))):9:63));
         wfrtn__ = AfToPage_(SAVEDRRN);
         outweb_(%subst(%str(%addr(H__5(2))):72:10));
        endif;
       endif;
       outweb_(%subst(%str(%addr(H__4(13))):44:135));
       wfrtn__ = AfToPage_(PPROD);
       outweb_(%subst(%str(%addr(H__4(15))):19:114));
       wfrtn__ = AfToPage_(PPDESC);
       outweb_(%subst(%str(%addr(H__4(16))):53:111));
       wfrtn__ = AfToPage_(PPTYPE);
       outweb_(%subst(%str(%addr(H__4(18))):4:28));
       if (client = '108');
        OutWeb_(%trimr( '<tr>'+x'0D'+''+x'25'+'          <td class="left">Lin-
       ked Program:</td>'+x'0D'+''+x'25'+'          <td class="right">' +
       %trim(pppgm) + '</td>'+x'0D'+''+x'25'+'        </tr>'));
       endif;
       outweb_(%subst(%str(%addr(H__4(18))):32:84));
       wfrtn__ = AfToPage_(PPNSFTYPE);
       outweb_(%subst(%str(%addr(H__4(19))):36:112));
       wfrtn__ = AfToPage_(PPBP);
       outweb_(%subst(%str(%addr(H__4(20))):68:108));
       AfToPage_(%trim(%editc(PPCAT:'4')));
       outweb_(%subst(%str(%addr(H__4(22))):16:107));
       AfToPage_(%trim(%editc(PPLTERM:'4')));
       outweb_(%subst(%str(%addr(H__4(23))):43:107));
       AfToPage_(%trim(%editc(PPHTERM:'4')));
       outweb_(%subst(%str(%addr(H__4(24))):70:107));
       AfToPage_(%trim(%editc(PPDTERM:'4')));
       outweb_(%subst(%str(%addr(H__4(26))):17:107));
       AfToPage_(%trim(%editc(PPLRATE:'J')));
       outweb_(%subst(%str(%addr(H__4(27))):44:107));
       AfToPage_(%trim(%editc(PPHRATE:'J')));
       outweb_(%subst(%str(%addr(H__4(28))):71:107));
       AfToPage_(%trim(%editc(PPDRATE:'J')));
       outweb_(%subst(%str(%addr(H__4(30))):18:107));
       wfrtn__ = AfToPage_(PPDFREQ);
       outweb_(%subst(%str(%addr(H__4(31))):45:108));
       wfrtn__ = AfToPage_(PPRFREQ);
       outweb_(%subst(%str(%addr(H__4(32))):73:106));
       AfToPage_(%trim(%editc(PPLAMT:'J')));
       outweb_(%subst(%str(%addr(H__4(34))):19:109));
       AfToPage_(%trim(%editc(PPHAMT:'J')));
       outweb_(%subst(%str(%addr(H__4(35))):48:106));
       AfToPage_(%trim(%editc(PPDAMT:'J')));
       outweb_(%subst(%str(%addr(H__4(36))):74:113));
       AfToPage_(%trim(%editc(PPLDAYS:'4')));
       outweb_(%subst(%str(%addr(H__4(38))):27:113));
       AfToPage_(%trim(%editc(PPHDAYS:'4')));
       outweb_(%subst(%str(%addr(H__4(39))):60:113));
       AfToPage_(%trim(%editc(PPDDAYS:'4')));
       outweb_(%subst(%str(%addr(H__4(41))):13:105));
       AfToPage_(%trim(%editc(PPGL:'X')));
       outweb_(%subst(%str(%addr(H__4(42))):38:71));

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
       pppgm = '';
       AM006_ = CV_BYKEY;
       CHAIN(NE) DL006_ RKWPPLINK;
       RS006_ = RcdSts2_('GETRCD': %error: %found: %eof);
       outweb_(%subst(%str(%addr(H__4(1))):1:1003));
       if (TASK__ = 'DISP');
        outweb_(%subst(%str(%addr(H__6(1))):1:48));
        wfrtn__ = AfToPage_(SAVEDRRN);
        outweb_(%subst(%str(%addr(H__6(1))):49:17));
       else;
        if (TASK__ = 'DELCONF');
         outweb_(%subst(%str(%addr(H__5(1))):1:61));
         wfrtn__ = AfToPage_(QPGMNAM__);
         outweb_(%subst(%str(%addr(H__5(1))):62:14));
         AfToPage_(%trim(%editc(RRN:'X')));
         outweb_(%subst(%str(%addr(H__5(1))):76:13));
         wfrtn__ = AfToPage_(SAVEDRRN);
         outweb_(%subst(%str(%addr(H__5(2))):9:63));
         wfrtn__ = AfToPage_(SAVEDRRN);
         outweb_(%subst(%str(%addr(H__5(2))):72:10));
        endif;
       endif;
       outweb_(%subst(%str(%addr(H__4(13))):44:135));
       wfrtn__ = AfToPage_(PPROD);
       outweb_(%subst(%str(%addr(H__4(15))):19:114));
       wfrtn__ = AfToPage_(PPDESC);
       outweb_(%subst(%str(%addr(H__4(16))):53:111));
       wfrtn__ = AfToPage_(PPTYPE);
       outweb_(%subst(%str(%addr(H__4(18))):4:28));
       if (client = '108');
        OutWeb_(%trimr( '<tr>'+x'0D'+''+x'25'+'          <td class="left">Lin-
       ked Program:</td>'+x'0D'+''+x'25'+'          <td class="right">' +
       %trim(pppgm) + '</td>'+x'0D'+''+x'25'+'        </tr>'));
       endif;
       outweb_(%subst(%str(%addr(H__4(18))):32:84));
       wfrtn__ = AfToPage_(PPNSFTYPE);
       outweb_(%subst(%str(%addr(H__4(19))):36:112));
       wfrtn__ = AfToPage_(PPBP);
       outweb_(%subst(%str(%addr(H__4(20))):68:108));
       AfToPage_(%trim(%editc(PPCAT:'4')));
       outweb_(%subst(%str(%addr(H__4(22))):16:107));
       AfToPage_(%trim(%editc(PPLTERM:'4')));
       outweb_(%subst(%str(%addr(H__4(23))):43:107));
       AfToPage_(%trim(%editc(PPHTERM:'4')));
       outweb_(%subst(%str(%addr(H__4(24))):70:107));
       AfToPage_(%trim(%editc(PPDTERM:'4')));
       outweb_(%subst(%str(%addr(H__4(26))):17:107));
       AfToPage_(%trim(%editc(PPLRATE:'J')));
       outweb_(%subst(%str(%addr(H__4(27))):44:107));
       AfToPage_(%trim(%editc(PPHRATE:'J')));
       outweb_(%subst(%str(%addr(H__4(28))):71:107));
       AfToPage_(%trim(%editc(PPDRATE:'J')));
       outweb_(%subst(%str(%addr(H__4(30))):18:107));
       wfrtn__ = AfToPage_(PPDFREQ);
       outweb_(%subst(%str(%addr(H__4(31))):45:108));
       wfrtn__ = AfToPage_(PPRFREQ);
       outweb_(%subst(%str(%addr(H__4(32))):73:106));
       AfToPage_(%trim(%editc(PPLAMT:'J')));
       outweb_(%subst(%str(%addr(H__4(34))):19:109));
       AfToPage_(%trim(%editc(PPHAMT:'J')));
       outweb_(%subst(%str(%addr(H__4(35))):48:106));
       AfToPage_(%trim(%editc(PPDAMT:'J')));
       outweb_(%subst(%str(%addr(H__4(36))):74:113));
       AfToPage_(%trim(%editc(PPLDAYS:'4')));
       outweb_(%subst(%str(%addr(H__4(38))):27:113));
       AfToPage_(%trim(%editc(PPHDAYS:'4')));
       outweb_(%subst(%str(%addr(H__4(39))):60:113));
       AfToPage_(%trim(%editc(PPDDAYS:'4')));
       outweb_(%subst(%str(%addr(H__4(41))):13:105));
       AfToPage_(%trim(%editc(PPGL:'X')));
       outweb_(%subst(%str(%addr(H__4(42))):38:71));

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
        SETLL  pfklist RKWPPBASE;
        RS001_ = RcdSts2_('POSRCD':%error:%equal:%eof);
        READP(E)  RKWPPBASE;
        RS001_ = RcdSts2_('GETPRVRCD': %error: %found: %eof);
        AM001_ = CV_ByKey;
        savedrrn = %trim(%editc(RR_001_:'P'));
        RR_001_ = rrn;
        AM001_ = CV_BYRRN;
        CHAIN(E) RR_001_ R__ARR001;
        RS001_ = RcdSts2_('GETRCD': %error: %found: %eof);
       endif;
      /end-free
     C                   EVAL      RS001_ = DeleteRcd_('RKWPPBASE')
      /free
       AM006_ = CV_BYKEY;
       CHAIN(E) DL006_ RKWPPLINK;
       RS006_ = RcdSts2_('GETRCD': %error: %found: %eof);
       if (RS006_ = '1');
      /end-free
     C                   EVAL      RS006_ = DeleteRcd_('RKWPPLINK')
      /free
       endif;
       p_ztype = 'KWPPBASE';
       p_zkeya = pprod;
       AM003_ = CV_BYKEY;
       CHAIN(E) DL003_ RKWPDATA;
       RS003_ = RcdSts2_('GETRCD': %error: %found: %eof);
       if (RS003_ = '1');
      /end-free
     C                   EVAL      RS003_ = DeleteRcd_('RKWPDATA')
      /free
       endif;
       Redirect2_( '?rrn=' + savedrrn:'*SAME');
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
       RR_001_ = rrn;
       AM001_ = CV_BYRRN;
       CHAIN(E) RR_001_ R__ARR001;
       RS001_ = RcdSts2_('GETRCD': %error: %found: %eof);
       pppgm = '';
       AM006_ = CV_BYKEY;
       CHAIN(NE) DL006_ RKWPPLINK;
       RS006_ = RcdSts2_('GETRCD': %error: %found: %eof);
       AM004_ = CV_BYKEY;
       CHAIN(NE) DL004_ RNCCPPBASE;
       RS004_ = RcdSts2_('GETRCD': %error: %found: %eof);
       AM010_ = CV_BYKEY;
       CHAIN(NE) DL010_ RKWPPRTO;
       RS010_ = RcdSts2_('GETRCD': %error: %found: %eof);
       outweb_(%subst(%str(%addr(H__7(1))):1:5));
       AfToPage_(%trim(%editc(JOBNBR__:'X')));
       outweb_(%subst(%str(%addr(H__7(1))):6:338));
       outweb_(%subst(%str(%addr(H__8(1))):1:2661));
       outweb_(%subst(%str(%addr(H__7(5))):24:576));
       AfToPage_(%trim(%editc(RRN:'X')));
       outweb_(%subst(%str(%addr(H__7(12))):40:379));
       wfrtn__ = AfToPage_(QPGMNAM__);
       outweb_(%subst(%str(%addr(H__7(17))):19:131));
       AfToPage_(%trim(%editc(RRN:'X')));
       outweb_(%subst(%str(%addr(H__7(18))):70:62));
       wfrtn__ = AfToPage_(SAVEDRRN);
       outweb_(%subst(%str(%addr(H__7(19))):52:1105));
       wfrtn__ = AfToPage_(PPROD);
       outweb_(%subst(%str(%addr(H__7(33))):37:229));
       wfrtn__ = AfToPage_(PPDESC);
       outweb_(%subst(%str(%addr(H__7(36))):26:161));
       pptypebox0();
       outweb_(%subst(%str(%addr(H__7(38))):27:156));
       ppnsfbox0();
       outweb_(%subst(%str(%addr(H__7(40))):23:83));
       wfrtn__ = AfToPage_(PPNSFTYPE);
       outweb_(%subst(%str(%addr(H__7(41))):26:54));
       if (ppnsftype = '');
        OutWeb_('style="display: none;"');
       endif;
       outweb_(%subst(%str(%addr(H__7(41))):80:108));
       if (client = '108');
        OutWeb_('<tr>'+x'0D'+''+x'25'+'                      	<td class="left-
       ">Linked Program:</td>'+x'0D'+''+x'25'+'                      	<td cla-
       ss="right">');
        pppgmbox0();
        OutWeb_('</td>'+x'0D'+''+x'25'+'                      </tr>');
       endif;
       outweb_(%subst(%str(%addr(H__7(43))):28:194));
       AfToPage_(%trim(%editc(PNSFAMT:'J')));
       outweb_(%subst(%str(%addr(H__7(45))):62:233));
       AfToPage_(%trim(%editc(PNSFMIN:'J')));
       outweb_(%subst(%str(%addr(H__7(48))):55:233));
       AfToPage_(%trim(%editc(PNSFMAX:'J')));
       outweb_(%subst(%str(%addr(H__7(51))):48:226));
       AfToPage_(%trim(%editc(PNSFPCT:'J')));
       outweb_(%subst(%str(%addr(H__7(54))):34:172));
       ppbpbox0();
       outweb_(%subst(%str(%addr(H__7(56))):46:167));
       ppcatbox0();
       outweb_(%subst(%str(%addr(H__7(58))):53:238));
       AfToPage_(%trim(%editc(PPLTERM:'4')));
       outweb_(%subst(%str(%addr(H__7(61))):51:245));
       AfToPage_(%trim(%editc(PPHTERM:'4')));
       outweb_(%subst(%str(%addr(H__7(64))):56:245));
       AfToPage_(%trim(%editc(PPDTERM:'4')));
       outweb_(%subst(%str(%addr(H__7(67))):61:245));
       AfToPage_(%trim(%editc(PPLRATE:'J')));
       outweb_(%subst(%str(%addr(H__7(70))):66:245));
       AfToPage_(%trim(%editc(PPHRATE:'J')));
       outweb_(%subst(%str(%addr(H__7(73))):71:245));
       AfToPage_(%trim(%editc(PPDRATE:'J')));
       outweb_(%subst(%str(%addr(H__7(76))):76:181));
       ppdfreqbox0();
       outweb_(%subst(%str(%addr(H__7(79))):17:183));
       pprfreqbox0();
       outweb_(%subst(%str(%addr(H__7(81))):40:254));
       AfToPage_(%trim(%editc(PPLAMT:'J')));
       outweb_(%subst(%str(%addr(H__7(84))):54:264));
       AfToPage_(%trim(%editc(PPHAMT:'J')));
       outweb_(%subst(%str(%addr(H__7(87))):78:261));
       AfToPage_(%trim(%editc(PPDAMT:'J')));
       outweb_(%subst(%str(%addr(H__7(91))):19:267));
       AfToPage_(%trim(%editc(PPLDAYS:'4')));
       outweb_(%subst(%str(%addr(H__7(94))):46:267));
       AfToPage_(%trim(%editc(PPHDAYS:'4')));
       outweb_(%subst(%str(%addr(H__7(97))):73:267));
       AfToPage_(%trim(%editc(PPDDAYS:'4')));
       outweb_(%subst(%str(%addr(H__7(101))):20:196));
       ppglbox0();
       outweb_(%subst(%str(%addr(H__7(103))):56:200));
       decmodbox0();
       outweb_(%subst(%str(%addr(H__7(106))):16:208));
       ppsigntypebox0();
       outweb_(%subst(%str(%addr(H__7(108))):64:204));
       ppstbox0();
       outweb_(%subst(%str(%addr(H__7(111))):28:215));
       inactivebox0();
       outweb_(%subst(%str(%addr(H__7(114))):3:286));
       AfToPage_(%trim(%editc(PPITERM:'4')));
       outweb_(%subst(%str(%addr(H__7(117))):49:229));
       ppitmcdbox0();
       outweb_(%subst(%str(%addr(H__7(120))):38:218));
       pp1pmtreqbox0();
       outweb_(%subst(%str(%addr(H__7(123))):16:79));
       if (client = '99');
        OutWeb_(%trimr( '<tr><td class="left">NCC Product ID:</td><td class="-
       right"><input type="text" name="NCC_PRODID" size="15" maxlength="15" v-
       alue="' + %trim(ncc_prodid) + '"></td></tr>'));
       endif;
       outweb_(%subst(%str(%addr(H__7(124))):15:3850));

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
       savedrrn = getparm3_('FirstRowRRN':'*OPT');
       if (mode = 'Add');
        pprod = getparm3_('pprod':'*OPT');
        ppdesc = getparm3_('ppdesc':'*OPT');
        pptype = getparm3_('pptype':'*OPT');
        ppbp = getparm3_('ppbp':'*OPT');
        PPCAT = %dec(aton_( getparm3_('PPCAT':'*OPT'):46:16):3:0);
        PPLTERM = %dec(aton_( getparm3_('PPLTERM':'*OPT'):46:16):5:0);
        PPHTERM = %dec(aton_( getparm3_('PPHTERM':'*OPT'):46:16):5:0);
        PPDTERM = %dec(aton_( getparm3_('PPDTERM':'*OPT'):46:16):5:0);
        PPLRATE = %dec(aton_( getparm3_('PPLRATE':'*OPT'):46:16):8:5);
        PPHRATE = %dec(aton_( getparm3_('PPHRATE':'*OPT'):46:16):8:5);
        PPDRATE = %dec(aton_( getparm3_('PPDRATE':'*OPT'):46:16):8:5);
        ppdfreq = getparm3_('ppdfreq':'*OPT');
        pprfreq = getparm3_('pprfreq':'*OPT');
        PPLAMT = %dec(aton_( getparm3_('PPLAMT':'*OPT'):46:16):11:2);
        PPHAMT = %dec(aton_( getparm3_('PPHAMT':'*OPT'):46:16):11:2);
        PPDAMT = %dec(aton_( getparm3_('PPDAMT':'*OPT'):46:16):11:2);
        PPLDAYS = %dec(aton_( getparm3_('PPLDAYS':'*OPT'):46:16):7:0);
        PPHDAYS = %dec(aton_( getparm3_('PPHDAYS':'*OPT'):46:16):7:0);
        PPDDAYS = %dec(aton_( getparm3_('PPDDAYS':'*OPT'):46:16):7:0);
        PPGL = %dec(aton_( getparm3_('PPGL':'*OPT'):46:16):11:0);
        ppmodel = getparm3_('ppmodel':'*OPT');
        ppsigntype = getparm3_('ppsigntype':'*OPT');
        ppinactive = getparm3_('ppinactive':'*OPT');
        PPITERM = %dec(aton_( getparm3_('PPITERM':'*OPT'):46:16):5:0);
        ppitmcd = getparm3_('ppitmcd':'*OPT');
        ppnsftype = getparm3_('ppnsftype':'*OPT');
        pppgm = getparm3_('pppgm':'*OPT');
        pp1pmtreq = getparm3_('pp1pmtreq':'*OPT');
        WRITE RKWPPBASE;
        RS001_ = RcdSts2_('WRTRCD': %error: %found: %eof);
        if (pppgm <> '');
         WRITE RKWPPLINK;
         RS006_ = RcdSts2_('WRTRCD': %error: %found: %eof);
        endif;
        if (pp1pmtreq <> '');
         WRITE RKWPPRTO;
         RS010_ = RcdSts2_('WRTRCD': %error: %found: %eof);
        endif;
        AM004_ = CV_BYKEY;
        CHAIN(E) DL004_ RNCCPPBASE;
        RS004_ = RcdSts2_('GETRCD': %error: %found: %eof);
        ncc_prodid = getparm3_('ncc_prodid':'*OPT');
        if (ncc_prodid <> '');
         if (RS004_ = '1');
          RS004_ = UpdateRcd_('RNCCPPBASE');
         else;
          WRITE RNCCPPBASE;
          RS004_ = RcdSts2_('WRTRCD': %error: %found: %eof);
         endif;
        endif;
        p_ztype = 'KWPPBASE';
        p_zkeya = pprod;
        p_zdesc = ppdesc;
        WRITE RKWPDATA;
        RS003_ = RcdSts2_('WRTRCD': %error: %found: %eof);
       endif;
       if (mode = 'Change');
        rrn = %dec(aton_( getparm3_('rrn':'*MAND'):46:16):9:0);
        RR_001_ = rrn;
        AM001_ = CV_BYRRN;
        CHAIN(E) RR_001_ R__ARR001;
        RS001_ = RcdSts2_('GETRCD': %error: %found: %eof);
        AM006_ = CV_BYKEY;
        CHAIN(E) DL006_ RKWPPLINK;
        RS006_ = RcdSts2_('GETRCD': %error: %found: %eof);
        AM010_ = CV_BYKEY;
        CHAIN(E) DL010_ RKWPPRTO;
        RS010_ = RcdSts2_('GETRCD': %error: %found: %eof);
        ppdesc = getparm3_('ppdesc':'*OPT');
        pptype = getparm3_('pptype':'*OPT');
        ppbp = getparm3_('ppbp':'*OPT');
        PPCAT = %dec(aton_( getparm3_('PPCAT':'*OPT'):46:16):3:0);
        PPLTERM = %dec(aton_( getparm3_('PPLTERM':'*OPT'):46:16):5:0);
        PPHTERM = %dec(aton_( getparm3_('PPHTERM':'*OPT'):46:16):5:0);
        PPDTERM = %dec(aton_( getparm3_('PPDTERM':'*OPT'):46:16):5:0);
        PPLRATE = %dec(aton_( getparm3_('PPLRATE':'*OPT'):46:16):8:5);
        PPHRATE = %dec(aton_( getparm3_('PPHRATE':'*OPT'):46:16):8:5);
        PPDRATE = %dec(aton_( getparm3_('PPDRATE':'*OPT'):46:16):8:5);
        ppdfreq = getparm3_('ppdfreq':'*OPT');
        pprfreq = getparm3_('pprfreq':'*OPT');
        PPLAMT = %dec(aton_( getparm3_('PPLAMT':'*OPT'):46:16):11:2);
        PPHAMT = %dec(aton_( getparm3_('PPHAMT':'*OPT'):46:16):11:2);
        PPDAMT = %dec(aton_( getparm3_('PPDAMT':'*OPT'):46:16):11:2);
        PPLDAYS = %dec(aton_( getparm3_('PPLDAYS':'*OPT'):46:16):7:0);
        PPHDAYS = %dec(aton_( getparm3_('PPHDAYS':'*OPT'):46:16):7:0);
        PPDDAYS = %dec(aton_( getparm3_('PPDDAYS':'*OPT'):46:16):7:0);
        PPGL = %dec(aton_( getparm3_('PPGL':'*OPT'):46:16):11:0);
        ppmodel = getparm3_('ppmodel':'*OPT');
        ppsigntype = getparm3_('ppsigntype':'*OPT');
        ppinactive = getparm3_('ppinactive':'*OPT');
        PPITERM = %dec(aton_( getparm3_('PPITERM':'*OPT'):46:16):5:0);
        ppitmcd = getparm3_('ppitmcd':'*OPT');
        ppnsftype = getparm3_('ppnsftype':'*OPT');
        pppgm = getparm3_('pppgm':'*OPT');
        pp1pmtreq = getparm3_('pp1pmtreq':'*OPT');
        RS001_ = UpdateRcd_('RKWPPBASE');
        if (RS006_ = '1');
         if (pppgm = '');
      /end-free
     C                   EVAL      RS006_ = DeleteRcd_('RKWPPLINK')
      /free
         else;
          RS006_ = UpdateRcd_('RKWPPLINK');
         endif;
        else;
         if (pppgm <> '');
          WRITE RKWPPLINK;
          RS006_ = RcdSts2_('WRTRCD': %error: %found: %eof);
         endif;
        endif;
        if (RS010_ = '1');
         if (pp1pmtreq = '');
      /end-free
     C                   EVAL      RS010_ = DeleteRcd_('RKWPPRTO')
      /free
         else;
          RS010_ = UpdateRcd_('RKWPPRTO');
         endif;
        else;
         if (pp1pmtreq <> '');
          WRITE RKWPPRTO;
          RS010_ = RcdSts2_('WRTRCD': %error: %found: %eof);
         endif;
        endif;
        AM004_ = CV_BYKEY;
        CHAIN(E) DL004_ RNCCPPBASE;
        RS004_ = RcdSts2_('GETRCD': %error: %found: %eof);
        ncc_prodid = getparm3_('ncc_prodid':'*OPT');
        if (ncc_prodid <> '');
         if (RS004_ = '1');
          RS004_ = UpdateRcd_('RNCCPPBASE');
         else;
          WRITE RNCCPPBASE;
          RS004_ = RcdSts2_('WRTRCD': %error: %found: %eof);
         endif;
        endif;
        p_ztype = 'KWPPBASE';
        p_zkeya = pprod;
        AM003_ = CV_BYKEY;
        CHAIN(E) DL003_ RKWPDATA;
        RS003_ = RcdSts2_('GETRCD': %error: %found: %eof);
        p_zdesc = ppdesc;
        if (RS003_ = '1');
         RS003_ = UpdateRcd_('RKWPDATA');
        else;
         WRITE RKWPDATA;
         RS003_ = RcdSts2_('WRTRCD': %error: %found: %eof);
        endif;
       endif;
       if (ppnsftype <> '');
        pnsftype = ppnsftype;
        AM005_ = CV_BYKEY;
        CHAIN(E) DL005_ RKWPPNSF;
        RS005_ = RcdSts2_('GETRCD': %error: %found: %eof);
        PNSFAMT = %dec(aton_( getparm3_('PNSFAMT':'*OPT'):46:16):11:2);
        PNSFMIN = %dec(aton_( getparm3_('PNSFMIN':'*OPT'):46:16):11:2);
        PNSFMAX = %dec(aton_( getparm3_('PNSFMAX':'*OPT'):46:16):11:2);
        PNSFPCT = %dec(aton_( getparm3_('PNSFPCT':'*OPT'):46:16):8:5);
        pnsfpctof = getparm3_('pnsfpctof':'*OPT');
        if (RS005_ <> '1');
         WRITE RKWPPNSF;
         RS005_ = RcdSts2_('WRTRCD': %error: %found: %eof);
        else;
         RS005_ = UpdateRcd_('RKWPPNSF');
        endif;
       endif;
       Redirect2_( '?rrn=' + savedrrn:'*SAME':'rand');
      /end-free
     c     *PSSR         begsr
     c                   endsr
     P                 E


     P*---------------------------------------------------------------------
     P* ppdfreqbox0...              - User defined function
     P*---------------------------------------------------------------------
     P ppdfreqbox0...
     P                 B
     D ppdfreqbox0...
     D                 PI




      /free
       p_ztype = 'LN_FREQ';
       boxname = 'PPDFREQ';
       boxid = 'PPDFREQ';
       boxselect = ppdfreq;
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
     P* pprfreqbox0...              - User defined function
     P*---------------------------------------------------------------------
     P pprfreqbox0...
     P                 B
     D pprfreqbox0...
     D                 PI




      /free
       p_ztype = 'LN_FREQ';
       boxname = 'PPRFREQ';
       boxid = 'PPRFREQ';
       boxselect = pprfreq;
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
     P* pptypebox0...               - User defined function
     P*---------------------------------------------------------------------
     P pptypebox0...
     P                 B
     D pptypebox0...
     D                 PI




      /free
       p_ztype = 'KWSTYPE';
       boxname = 'PPTYPE';
       boxid = 'PPTYPE';
       boxselect = pptype;
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
     P* ppbpbox0...                 - User defined function
     P*---------------------------------------------------------------------
     P ppbpbox0...
     P                 B
     D ppbpbox0...
     D                 PI




      /free
       p_ztype = 'ML_CUSTYP';
       boxname = 'PPBP';
       boxid = 'PPBP';
       boxselect = ppbp;
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
     P* ppcatbox0...                - User defined function
     P*---------------------------------------------------------------------
     P ppcatbox0...
     P                 B
     D ppcatbox0...
     D                 PI




      /free
       p_ztype = 'LOANCAT';
       boxname = 'PPCAT';
       boxid = 'PPCAT';
       boxselect = %trim(%editc(PPCAT:'P'));
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
     P* ppglbox0...                 - User defined function
     P*---------------------------------------------------------------------
     P ppglbox0...
     P                 B
     D ppglbox0...
     D                 PI




      /free
       p_ztype = 'KWPGL';
       boxname = 'PPGL';
       boxid = 'PPGL';
       boxselect = %trim(%editc(PPGL:'P'));
       boxtype = ' ';
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
     P* decmodbox0...               - User defined function
     P*---------------------------------------------------------------------
     P decmodbox0...
     P                 B
     D decmodbox0...
     D                 PI




      /free
       OutWeb_('<select id="PPMODEL" name="PPMODEL"><option value=""></option-
       >');
       SETLL  *LOVAL RKWPDECMOD;
       RS009_ = RcdSts2_('POSRCD':%error:%equal:%eof);
       dou (RS009_ <> '1');
       READ(NE)  RKWPDECMOD;
       RS009_ = RcdSts2_('GETNXTRCD':%error:%found:%eof);
       AM009_ = CV_ByKey;
       if (RS009_ = '1');
        OutWeb_(%trimr( '<option value="' + %trim(pdmodel) + '"'));
        if (pdmodel = ppmodel);
         OutWeb_(' selected');
        endif;
        OutWeb_(%trimr( '>' + %trim(pddesc) + '</option>'));
       endif;
       enddo;
       OutWeb_('</select>');
      /end-free
     c     *PSSR         begsr
     c                   endsr
     P                 E


     P*---------------------------------------------------------------------
     P* ppsigntypebox0...           - User defined function
     P*---------------------------------------------------------------------
     P ppsigntypebox0...
     P                 B
     D ppsigntypebox0...
     D                 PI




      /free
       OutWeb_('<select name="PPSIGNTYPE" onChange="updateVal(this);" size="1-
       ">');
       OutWeb_('<option value=" "> </option>');
       if (ppsigntype = 'SIGNPAD');
        OutWeb_(%trimr( '<option value="' + 'SIGNPAD' + '" selected>' + 'Sign-
       ature Pad' + '</option>'));
       else;
        OutWeb_(%trimr( '<option value="' + 'SIGNPAD' + '">' + 'Signature Pad-
       ' + '</option>'));
       endif;
       if (ppsigntype = 'PRINTDOC');
        OutWeb_(%trimr( '<option value="' + 'PRINTDOC' + '" selected>' + 'Pri-
       nt Docs' + '</option>'));
       else;
        OutWeb_(%trimr( '<option value="' + 'PRINTDOC' + '">' + 'Print Docs'
       + '</option>'));
       endif;
       if (ppsigntype = 'ESIGN');
        OutWeb_(%trimr( '<option value="' + 'ESIGN' + '" selected>' + 'Electr-
       onic Signing' + '</option>'));
       else;
        OutWeb_(%trimr( '<option value="' + 'ESIGN' + '">' + 'Electronic Sign-
       ing' + '</option>'));
       endif;
       OutWeb_('</select>');
      /end-free
     c     *PSSR         begsr
     c                   endsr
     P                 E


     P*---------------------------------------------------------------------
     P* inactivebox0...             - User defined function
     P*---------------------------------------------------------------------
     P inactivebox0...
     P                 B
     D inactivebox0...
     D                 PI




      /free
       boxtype = 'SYSTEM';
       p_ztype = 'YESNO';
       boxname = 'PPINACTIVE';
       boxid = 'PPINACTIVE';
       boxselect = ppinactive;
       jvalidation = '';
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
     P* ppstbox0...                 - User defined function
     P*---------------------------------------------------------------------
     P ppstbox0...
     P                 B
     D ppstbox0...
     D                 PI




      /free
       p_ztype = 'STATECODE';
       boxname = 'PPST';
       boxid = 'PPST';
       boxselect = ppst;
       boxtype = 'SYSTEM';
       jvalidation = '';
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
     P* ppitmcdbox0...              - User defined function
     P*---------------------------------------------------------------------
     P ppitmcdbox0...
     P                 B
     D ppitmcdbox0...
     D                 PI




      /free
       OutWeb_('<select name="PPITMCD" onChange="updateVal(this);" size="1">');
       OutWeb_('<option value=" "> </option>');
       if (ppitmcd = 'M');
        OutWeb_(%trimr( '<option value="' + 'M' + '" selected>' + 'Months' +
       '</option>'));
       else;
        OutWeb_(%trimr( '<option value="' + 'M' + '">' + 'Months' + '</option-
       >'));
       endif;
       if (ppitmcd = 'D');
        OutWeb_(%trimr( '<option value="' + 'D' + '" selected>' + 'Days' + '<-
       /option>'));
       else;
        OutWeb_(%trimr( '<option value="' + 'D' + '">' + 'Days' + '</option>'
       ));
       endif;
       OutWeb_('</select>');
      /end-free
     c     *PSSR         begsr
     c                   endsr
     P                 E


     P*---------------------------------------------------------------------
     P* ppnsfbox0...                - User defined function
     P*---------------------------------------------------------------------
     P ppnsfbox0...
     P                 B
     D ppnsfbox0...
     D                 PI




      /free
       OutWeb_('<select name="PPNSFTYPE" id="PPNSFTYPEselect" onchange="handl-
       eNSF(this);" size="1">');
       OutWeb_('<option');
       if (ppnsftype = '');
        OutWeb_(' selected');
       endif;
       OutWeb_(' value=" " id="locnsf">Use location settings</option>');
       OutWeb_('<option value="newnsf" id="newnsf">Add new...</option>');
       SETLL  *LOVAL RKWPPNSF;
       RS005_ = RcdSts2_('POSRCD':%error:%equal:%eof);
       READ(NE)  RKWPPNSF;
       RS005_ = RcdSts2_('GETNXTRCD':%error:%found:%eof);
       AM005_ = CV_ByKey;
       dow (RS005_ = '1');
       OutWeb_('<option');
       if (ppnsftype = pnsftype);
        OutWeb_(' selected');
       endif;
       OutWeb_(%trimr( ' value="' + pnsftype + '">' + pnsftype + '</option>'));
       READ(NE)  RKWPPNSF;
       RS005_ = RcdSts2_('GETNXTRCD':%error:%found:%eof);
       AM005_ = CV_ByKey;
       enddo;
       OutWeb_('</select>');
       CLEAR  RKWPPNSF;
       pnsftype = ppnsftype;
       AM005_ = CV_BYKEY;
       CHAIN(NE) DL005_ RKWPPNSF;
       RS005_ = RcdSts2_('GETRCD': %error: %found: %eof);
      /end-free
     c     *PSSR         begsr
     c                   endsr
     P                 E


     P*---------------------------------------------------------------------
     P* ajaxnsf0...                 - User defined function
     P*---------------------------------------------------------------------
     P ajaxnsf0...
     P                 B
     D ajaxnsf0...
     D                 PI




      /free
       CLEAR  RKWPPNSF;
       pnsftype = getparm3_('pnsftype':'*OPT');
       AM005_ = CV_BYKEY;
       CHAIN(NE) DL005_ RKWPPNSF;
       RS005_ = RcdSts2_('GETRCD': %error: %found: %eof);
       outweb_(%subst(%str(%addr(H__9(1))):1:13));
       AfToPage_(%trim(%editc(PNSFAMT:'J')));
       outweb_(%subst(%str(%addr(H__9(1))):14:12));
       AfToPage_(%trim(%editc(PNSFMIN:'J')));
       outweb_(%subst(%str(%addr(H__9(1))):26:12));
       AfToPage_(%trim(%editc(PNSFMAX:'J')));
       outweb_(%subst(%str(%addr(H__9(1))):38:12));
       AfToPage_(%trim(%editc(PNSFPCT:'J')));
       outweb_(%subst(%str(%addr(H__9(1))):50:3));

      /end-free
     c     *PSSR         begsr
     c                   endsr
     P                 E


     P*---------------------------------------------------------------------
     P* delnsf0...                  - User defined function
     P*---------------------------------------------------------------------
     P delnsf0...
     P                 B
     D delnsf0...
     D                 PI




      /free
       CLEAR  RKWPPNSF;
       pnsftype = getparm3_('pnsftype':'*OPT');
       AM005_ = CV_BYKEY;
       CHAIN(E) DL005_ RKWPPNSF;
       RS005_ = RcdSts2_('GETRCD': %error: %found: %eof);
       if (RS005_ = '1');
      /end-free
     C                   EVAL      RS005_ = DeleteRcd_('RKWPPNSF')
      /free
        OutWeb_('Y');
       else;
        OutWeb_('N');
       endif;
      /end-free
     c     *PSSR         begsr
     c                   endsr
     P                 E


     P*---------------------------------------------------------------------
     P* pppgmbox0...                - User defined function
     P*---------------------------------------------------------------------
     P pppgmbox0...
     P                 B
     D pppgmbox0...
     D                 PI




      /free
       AM008_ = CV_BYKEY;
       CHAIN(NE) DL008_ RKWSTYPE;
       RS008_ = RcdSts2_('GETRCD': %error: %found: %eof);
       SETLL  *LOVAL RKWPPGM;
       RS007_ = RcdSts2_('POSRCD':%error:%equal:%eof);
       OutWeb_('<select name="PPPGM" id="PPPGMselect" size="1">');
       if (pppgm = '');
        OutWeb_('<option selected value=""> </option>');
       else;
        OutWeb_('<option value=""> </option>');
       endif;
       dou (RS007_ <> '1');
       READ(NE)  RKWPPGM;
       RS007_ = RcdSts2_('GETNXTRCD':%error:%found:%eof);
       AM007_ = CV_ByKey;
       if (((RS007_ = '1') and (strevolve = psrevolve)));
        OutWeb_('<option ');
        if (psprogram = pppgm);
         OutWeb_('selected ');
        endif;
        OutWeb_(%trimr( ' value="' + %trim(psprogram) + '">' + %trim(
       psprogram) + '</option>'));
       endif;
       enddo;
       OutWeb_('</select>');
      /end-free
     c     *PSSR         begsr
     c                   endsr
     P                 E


     P*---------------------------------------------------------------------
     P* pp1pmtreqbox0...            - User defined function
     P*---------------------------------------------------------------------
     P pp1pmtreqbox0...
     P                 B
     D pp1pmtreqbox0...
     D                 PI




      /free
       boxtype = 'SYSTEM';
       p_ztype = 'YESNO';
       boxname = 'PP1PMTREQ';
       boxid = 'PP1PMTREQ';
       boxselect = pp1pmtreq;
       jvalidation = '';
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
       rtlla__(3) = 'KWSYS';

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
       if   ((file__='KWPPBASE' or file__='*ALL') and NOT %OPEN(KWPPBASE));
        if (mbr__ <> '*FIRST');
         ovrdbf_(ovrflag__:'KWPPBASE':'KWPPBASE' : '*LIBL' : mbr__);
        elseif ('KWPPBASE' <> 'KWPPBASE');
         ovrdbf_(ovrflag__:'KWPPBASE':'KWPPBASE' : '*LIBL');
        endif;
        if    erropen__ = 'Y';
         OPEN(E) KWPPBASE;             //    KWPPBASE
         if        %error;
          return %error;
         endif;
        else;
         OPEN KWPPBASE;                //    KWPPBASE
        endif;
       endif;
       if   (file__='KWPPBASE' or file__='*ALL')  and NOT %OPEN(F__ARR001);
        ovrdbf_(ovrflag__:'F__ARR001':'KWPPBASE' : '*LIBL' : mbr__);
        if   erropen__ = 'Y';
         OPEN(E) F__ARR001;          //   KWPPBASE
         if        %error;
          return %error;
         endif;
        else;
         OPEN F__ARR001;            //    KWPPBASE
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
       if   ((file__='NCC_PPBASE' or file__='*ALL') and NOT %OPEN(NCC_PPBASE));
        if (mbr__ <> '*FIRST');
         ovrdbf_(ovrflag__:'NCC_PPBASE':'NCC_PPBASE' : '*LIBL' : mbr__);
        elseif ('NCC_PPBASE' <> 'NCC_PPBASE');
         ovrdbf_(ovrflag__:'NCC_PPBASE':'NCC_PPBASE' : '*LIBL');
        endif;
        if    erropen__ = 'Y';
         OPEN(E) NCC_PPBASE;                //    NCC_PPBASE
         if        %error;
          return %error;
         endif;
        else;
         OPEN NCC_PPBASE;                //    NCC_PPBASE
        endif;
       endif;
       if   ((file__='KWPPNSF' or file__='*ALL') and NOT %OPEN(KWPPNSF));
        if (mbr__ <> '*FIRST');
         ovrdbf_(ovrflag__:'KWPPNSF':'KWPPNSF' : '*LIBL' : mbr__);
        elseif ('KWPPNSF' <> 'KWPPNSF');
         ovrdbf_(ovrflag__:'KWPPNSF':'KWPPNSF' : '*LIBL');
        endif;
        if    erropen__ = 'Y';
         OPEN(E) KWPPNSF;                //    KWPPNSF
         if        %error;
          return %error;
         endif;
        else;
         OPEN KWPPNSF;                //    KWPPNSF
        endif;
       endif;
       if   ((file__='KWPPLINK' or file__='*ALL') and NOT %OPEN(KWPPLINK));
        if (mbr__ <> '*FIRST');
         ovrdbf_(ovrflag__:'KWPPLINK':'KWPPLINK' : '*LIBL' : mbr__);
        elseif ('KWPPLINK' <> 'KWPPLINK');
         ovrdbf_(ovrflag__:'KWPPLINK':'KWPPLINK' : '*LIBL');
        endif;
        if    erropen__ = 'Y';
         OPEN(E) KWPPLINK;                //    KWPPLINK
         if        %error;
          return %error;
         endif;
        else;
         OPEN KWPPLINK;                //    KWPPLINK
        endif;
       endif;
       if   ((file__='KWPPGM' or file__='*ALL') and NOT %OPEN(KWPPGM));
        if (mbr__ <> '*FIRST');
         ovrdbf_(ovrflag__:'KWPPGM':'KWPPGM' : '*LIBL' : mbr__);
        elseif ('KWPPGM' <> 'KWPPGM');
         ovrdbf_(ovrflag__:'KWPPGM':'KWPPGM' : '*LIBL');
        endif;
        if    erropen__ = 'Y';
         OPEN(E) KWPPGM;                //    KWPPGM
         if        %error;
          return %error;
         endif;
        else;
         OPEN KWPPGM;                //    KWPPGM
        endif;
       endif;
       if   ((file__='KWSTYPE' or file__='*ALL') and NOT %OPEN(KWSTYPE));
        if (mbr__ <> '*FIRST');
         ovrdbf_(ovrflag__:'KWSTYPE':'KWSTYPE' : '*LIBL' : mbr__);
        elseif ('KWSTYPE' <> 'KWSTYPE');
         ovrdbf_(ovrflag__:'KWSTYPE':'KWSTYPE' : '*LIBL');
        endif;
        if    erropen__ = 'Y';
         OPEN(E) KWSTYPE;                //    KWSTYPE
         if        %error;
          return %error;
         endif;
        else;
         OPEN KWSTYPE;                //    KWSTYPE
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
       if   ((file__='KWPPRTO' or file__='*ALL') and NOT %OPEN(KWPPRTO));
        if (mbr__ <> '*FIRST');
         ovrdbf_(ovrflag__:'KWPPRTO':'KWPPRTO' : '*LIBL' : mbr__);
        elseif ('KWPPRTO' <> 'KWPPRTO');
         ovrdbf_(ovrflag__:'KWPPRTO':'KWPPRTO' : '*LIBL');
        endif;
        if    erropen__ = 'Y';
         OPEN(E) KWPPRTO;                //    KWPPRTO
         if        %error;
          return %error;
         endif;
        else;
         OPEN KWPPRTO;                //    KWPPRTO
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
       when      rcdfmt__='RKWPPBASE' and AM001_ = CV_ByKey and RS001_ = *ON ;
       update RKWPPBASE;
       when      rcdfmt__='RKWPPBASE' and AM001_ = CV_ByRrn and RS001_ = *ON ;
       update R__ARR001;
       when      rcdfmt__='RKWPDATA' and AM003_ = CV_ByKey and RS003_ = *ON ;
       update RKWPDATA;
       when      rcdfmt__='RNCCPPBASE' and AM004_ = CV_ByKey and RS004_ = *ON ;
       update RNCCPPBASE;
       when      rcdfmt__='RKWPPNSF' and AM005_ = CV_ByKey and RS005_ = *ON ;
       update RKWPPNSF;
       when      rcdfmt__='RKWPPLINK' and AM006_ = CV_ByKey and RS006_ = *ON ;
       update RKWPPLINK;
       when      rcdfmt__='RKWPPRTO' and AM010_ = CV_ByKey and RS010_ = *ON ;
       update RKWPPRTO;
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
       when      rcdfmt__='RKWPPBASE' and AM001_ = CV_ByKey and RS001_ = *ON ;
       delete RKWPPBASE;
       when      rcdfmt__='RKWPPBASE' and AM001_ = CV_ByRrn and RS001_ = *ON ;
       delete R__ARR001;
       when      rcdfmt__='RKWPDATA' and AM003_ = CV_ByKey and RS003_ = *ON ;
       delete RKWPDATA;
       when      rcdfmt__='RKWPPNSF' and AM005_ = CV_ByKey and RS005_ = *ON ;
       delete RKWPPNSF;
       when      rcdfmt__='RKWPPLINK' and AM006_ = CV_ByKey and RS006_ = *ON ;
       delete RKWPPLINK;
       when      rcdfmt__='RKWPPRTO' and AM010_ = CV_ByKey and RS010_ = *ON ;
       delete RKWPPRTO;
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
System Settings:  Producst
**CTDATA H__1        ListHeader                       2476
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.or
g/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>
    <meta name="genera
tor" content="WebSmart" />
    <meta http-equiv="Pragma" content="no-cache" />

   <title>System Settings:  Producst</title>
        <link rel="stylesheet" type
="text/css" href="/websmart/kwikloan/styles/klstylei.css" media="screen, tv, pro
jection" />
        <link rel="stylesheet" type="text/css" href="/websmart/kwikl
oan/styles/klstyleInquiryList.css" media="screen, tv, projection" />
    <script
 type="text/javascript" src="/websmart/kwikloan/javascript/klscripts.js"></scrip
t>
  </head>
  <body>
    <div id="wrapping">
      <div id="everything">

  <div id="pagetitle">
          <span>Loan Search</span>
        </div>  

   <div id="whitebg" class="whitebg">
          <div class="left">
            <
table class="actionsTable">
                <!-- <tr><td><a href="#" onclick="wi
ndow.location='?task=beginmanage&rrn=0&rnd='"><img src="https://sv1.americanfirs
tfinance.com:8158/websmart/kwikloan/images/modalIconsAN.png"></a><span class="LS
label"></span></td></tr>-->     
              <tr><td><a href="#" onclick=""><i
mg src="https://sv1.americanfirstfinance.com:8158/websmart/kwikloan/images/loanI
nqADD.png"></a><span class="LSlabel"></span></td></tr>     
           

</table> 
            
           <form method="get" action="">
              <i
nput type="hidden" name="task" value="filter">
              <table class="accou
ntInfo" id="loanSearchTable">
                <tr>
                  <td id="Lna
me"><span class="LSlabel">Loan Product #:</span><br><input type="text" name="PPR
OD" size="11" maxlength="11"></td>
                  </tr>
                  <tr
>
                  <td><br><br><input type="submit" value="Filter Results"><br>

                  </td>
                </tr>
              </table> 

   </form>
            
          </div><!--left-->
          <div class="right"
>
            <div id="scroller">
              <div id="sections">

    <ul>
                <li>
 
         
      <table class="mainlist">

 <tr>
          
          
          <th width="100">Action</th>
          <th
width="110" valign="top">Loan Product #</th>
          <th width="250">Product D
escription</th>
          <th width="250">System Loan Type</th>
          <th wi
dth="10">Business/Personal</th>
          
          
        </tr>

**CTDATA H__2        ListDetails                      587
<tr class="">
 <!-- <td><a href="?TASK=disp&rrn=&FirstRowRRN="><img src="/websma
rt/v7.2/Lincoln/images/view.gif" alt="Display" title="Display"></a>
      <a hre
f="?TASK=beginmanage&rrn=&FirstRowRRN="><img src="/websmart/v7.2/Lincoln/images/
edit.gif"  alt="Edit" title="Edit"></a>
       <a href="?TASK=delconf&rrn=&First
RowRRN="><img src="/websmart/v7.2/Lincoln/images/delete.gif" alt="Delete" title=
"Delete"></a>
      </td> -->
       <td>
      
      
      
      </td>
  <td
 class="text right"></td>
  <td class="text"></td>
  <td class="text"></td>
  <t
d class="text"></td>
</tr>

**CTDATA H__3        ListFooter                       743
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

	// write the PREV link if necessary
	if( > 0)
	
{
		xl_GetObj("prevlinktop").className ="prevlink";
		xl_GetObj("prevlinkbot").c
lassName ="prevlink";
		xl_GetObj("prevlinktop").href="?task=prev&rrn=";
		xl_Ge
tObj("prevlinkbot").href="?task=prev&rrn=";
		
	}
	
	// write the NEXT link if n
ecessary
	if( > 0) 
	{
		xl_GetObj("nextlinktop").className ="nextlink";
		xl_Ge
tObj("nextlinkbot").className ="nextlink";
		xl_GetObj("nextlinktop").href="?tas
k=default&rrn=";
		xl_GetObj("nextlinkbot").href="?task=default&rrn=";
	}
	
</sc
ript>

</body>
</html>

**CTDATA H__4        RcdDisplay                       3388
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.or
g/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>
    <meta name="genera
tor" content="WebSmart" />
    <meta http-equiv="Pragma" content="no-cache" />

   <title>System Settings:  Producst - Display</title>
        <link rel="styles
heet" type="text/css" href="/websmart/kwikloan/styles/klstylei.css" media="scree
n, tv, projection" />
    <script type="text/javascript" src="/websmart/kwikloan
/javascript/klscripts.js"></script>
    <script type="text/javascript" src="/web
smart/kwikloan/javascript/klthemes.js"></script>
    <script type="text/javascri
pt" src="/websmart/v7.2/javascript/esdiapi010.js"></script>
    
  </head>
  <bo
dy>
    <div id="wrapping">
  <div id="everything">
  
  
  <div id="pagetitle">

  	<span>System Settings: Products</span>
  </div>
  
  <div id="whitebg">
  <d
iv id="EDITtitle"><span>View Products Settings</span></div>

    <div id="EDITco
ntents"> 

      <div id="navtop">
        
        
      </div>
      <table>

        
        <tr>
          <td class="left">Loan Product #:</td>

<td class="right"></td>
        </tr>
        <tr>
          <td class="left">Pr
oduct Description:</td>
          <td class="right"></td>
        </tr>

<tr>
          <td class="left">System Loan Type:</td>
          <td class="righ
t"></td>
        </tr>
        
        <tr>
          <td class="left">NSF type
:</td>
          <td class="right"></td>
        </tr>
        <tr>
          <t
d class="left">Business/Personal:</td>
          <td class="right"></td>

 </tr>
        <tr>
          <td class="left">Loan Category:</td>
          <td
 class="right"></td>
        </tr>
        <tr>
          <td class="left">Minim
um Term:</td>
          <td class="right"></td>
        </tr>
        <tr>

     <td class="left">Maximum Term:</td>
          <td class="right"></td>

   </tr>
        <tr>
          <td class="left">Default Term:</td>
          <t
d class="right"></td>
        </tr>
        <tr>
          <td class="left">Mini
mum Rate:</td>
          <td class="right"></td>
        </tr>
        <tr>

      <td class="left">Maximum Rate:</td>
          <td class="right"></td>

    </tr>
        <tr>
          <td class="left">Default Rate:</td>
          <
td class="right"></td>
        </tr>
        <tr>
          <td class="left">Def
ault Freq:</td>
          <td class="right"></td>
        </tr>
        <tr>

       <td class="left">Required Freq:</td>
          <td class="right"></td>

      </tr>
        <tr>
          <td class="left">Minimum Amt:</td>

<td class="right"></td>
        </tr>
        <tr>
          <td class="left">Ma
ximum Amount:</td>
          <td class="right"></td>
        </tr>
        <tr>

          <td class="left">Default Amt:</td>
          <td class="right"></td>

       </tr>
        <tr>
          <td class="left">Minimum Days to FP:</td>

        <td class="right"></td>
        </tr>
        <tr>
          <td class="
left">Maximum Days to FP:</td>
          <td class="right"></td>
        </tr>

       <tr>
          <td class="left">Default Days to FP:</td>
          <td cl
ass="right"></td>
        </tr>
        <tr>
          <td class="left">G/L Matr
ix:</td>
          <td class="right"></td>
        </tr>
      </table>
      

   </div>
  </body>
</html>

**CTDATA H__5        DelChoice                        161
<p>Are you SURE you want to delete this record?</p>
<a href="?task=del&rrn=&Firs
tRowRRN=">Yes</a>
&nbsp;&nbsp;
<a href="javascript:location.href='?rrn='">No</a>


**CTDATA H__6        RtnToList                        65
<button onClick="javascript:location.href='?rrn=;'">Back</button>
**CTDATA H__7        RcdManage                        13704
<!--  -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http:/
/www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>
    <meta na
me="generator" content="WebSmart" />
    <meta http-equiv="Pragma" content="no-c
ache" />
    <title>System Settings:  Producst - Add or Change</title>
    <styl
e type="text/css">
    
    </style>
    <script type="text/javascript" src="/we
bsmart/kwikloan/javascript/klscripts.js"></script>
    <script type="text/javasc
ript" src="/websmart/kwikloan/javascript/klthemes.js"></script>
    <script type
="text/javascript" src="/websmart/v7.2/javascript/esdiapi010.js"></script>
    <
script type="text/javascript" src="/k_loan/jq/172.js"></script>
    <script type
="text/javascript">
		xl_AttachEvent(window, "load", WindowInit); 

		function W
indowInit()
		{
			xl_FocusFirstElement();
		}
		$(document).ready(function() {

			
				var protkey = "";   
							if( == 0)
							{
								xl_GetFormElement
ByName("mode").value = "Add";
							} 
							else 
							{
								protkey  =
 xl_GetFormElementByName("PPROD");
								protkey.disabled = true;
								prot
key.className = protkey.className + " disabled";
								xl_GetFormElementByName
("mode").value = "Change";
								
							}
		});
	</script>
  </head>
  <body>

   <form action="" method="get">
            <input type="hidden" name="task" v
alue="endmanage">
            <input type="hidden" name="rrn" value="">

    <input type="hidden" name="FirstRowRRN" value="">
            <input type="h
idden" name="PNSFPCTOF" value="1"> <!-- this is the only value currently support
ed -->
    <div id="pagetitle">
      <span>System Settings: Products</span>

   <div id="topBtns">
        <input type="submit" class="navbutton" name="mode"
 id="sbmbtn" value="Update">
        <script type="text/javascript">
						
				
			</script>
        
        <button class="navbutton" onclick="javascript:loca
tion.href='s_prod.pgm;return false;'">Cancel</button>
      </div>
    </div>

  <div id="wrapping">
      
      
      
      
      <div id="whitebg">

   
        
        <div id="EDITcontents"> 
         
            

 <table id="holderTable">
              
              
              <tr>

           <th>Product Settings</th>
              </tr>
              <tr>

            <td class="holderTd">
                  <table class="dealerTable">

                    
                    <tr>
                      <td class="l
eft">Loan Product #:</td>
                      <td class="right"><input type="t
ext" id="PPROD" name="PPROD" value=""></td>
                    </tr>

          <tr>
                      <td class="left">Product Description:</td>

                      <td class="right"><input type="text" name="PPDESC" size="2
5" maxlength="25" value=""></td>
                    </tr>
                    <
tr>
                      <td class="left">System Loan Type:</td>

        <td class="right">
                      </tr>
                      <tr
>
                      	<td class="left">NSF Fee type:</td>

   	<td class="right"><input type="text" name="PPNSFTYPE" id="PPNSFTYPEinput" di
sabled="disabled" value="" /></td>
                      	<td class="right"><a
href="#" id="editnsf" onclick="editNSF();">Edit</a></td>
                      <
/tr>
                      
                      <tr class="nsf">

         	<td class="left">Fixed amount:</td>
                      	<td class="
right"><input type="text" name="PNSFAMT" id="PNSFAMT" value="" /></td>

             </tr>
                      <tr class="nsf">

	<td class="left">Minimum amount:</td>
                      	<td class="right">
<input type="text" name="PNSFMIN" id="PNSFMIN" value="" /></td>

      </tr>
                      <tr class="nsf">
                      	<td cl
ass="left">Maximum amount:</td>
                      	<td class="right"><input
type="text" name="PNSFMAX" id="PNSFMAX" value="" /></td>
                      <
/tr>
                      <tr class="nsf">
                      	<td class="le
ft">Percent:</td>
                      	<td class="right"><input type="text" na
me="PNSFPCT" id="PNSFPCT" value="" /></td>
                      </tr>

             <tr>
                        <td class="left">Business/Personal:</t
d>
                        <td class="right">
                        </tr>

                    <tr>
                          <td class="left">Loan Categor
y:</td>
                          <td class="right">
                          <
/tr>
                          <tr>
                            <td class="left"
>Minimum Term:</td>
                            <td class="right"><input type="t
ext" name="PPLTERM" size="5" maxlength="5" value=""></td>

    </tr>
                          <tr>
                            <td class="
left">Maximum Term:</td>
                            <td class="right"><input ty
pe="text" name="PPHTERM" size="5" maxlength="5" value=""></td>

         </tr>
                          <tr>
                            <td cl
ass="left">Default Term:</td>
                            <td class="right"><inp
ut type="text" name="PPDTERM" size="5" maxlength="5" value=""></td>

              </tr>
                          <tr>
                            <
td class="left">Minimum Rate:</td>
                            <td class="right"
><input type="text" name="PPLRATE" size="8" maxlength="8" value=""></td>

                   </tr>
                          <tr>

    <td class="left">Maximum Rate:</td>
                            <td class="r
ight"><input type="text" name="PPHRATE" size="8" maxlength="8" value=""></td>

                        </tr>
                          <tr>

         <td class="left">Default Rate:</td>
                            <td cla
ss="right"><input type="text" name="PPDRATE" size="8" maxlength="8" value=""></t
d>
                          </tr>
                          <tr>

              <td class="left">Default Freq:</td>
                            <t
d class="right">
                            </tr>
                            <
tr>
                              <td class="left">Required Freq:</td>

                     <td class="right">
                              </tr>

                          <tr>
                                <td class="left">
Minimum Amt:</td>
                                <td class="right"><input type=
"text" name="PPLAMT" size="11" maxlength="11" value=""></td>

           </tr>
                              <tr>

    <td class="left">Maximum Amount:</td>
                                <td cl
ass="right"><input type="text" name="PPHAMT" size="11" maxlength="11" value=""><
/td>
                              </tr>
                              <tr>

                            <td class="left">Default Amt:</td>

               <td class="right"><input type="text" name="PPDAMT" size="11" maxl
ength="11" value=""></td>
                              </tr>

            <tr>
                                <td class="left">Minimum Days t
o FP:</td>
                                <td class="right"><input type="text"
name="PPLDAYS" size="3" maxlength="3" value=""></td>

   </tr>
                              <tr>
                                <td
class="left">Maximum Days to FP:</td>
                                <td class=
"right"><input type="text" name="PPHDAYS" size="3" maxlength="3" value=""></td>

                              </tr>
                              <tr>

                       <td class="left">Default Days to FP:</td>

                 <td class="right"><input type="text" name="PPDDAYS" size="3" ma
xlength="3" value=""></td>
                              </tr>	

              <tr>
                                <td class="left">G/L Matrix:<
/td>
                                <td class="right">

        </tr>
                                <tr>

     <td class="left">Decision Model:</td>
                                  <td
 class="right">
                                  </tr>

          <tr>
                                    <td class="left">Signature Ty
pe:</td>
                                    <td class="right"></td>

                       </tr>
                                  <tr>

                        <td class="left">State:</td>

         <td class="right"></td>
                                  </tr>

                           <tr>
                                    <td class="l
eft">Inactive Product:</td>
                                    <td class="right
"></td>
                                  </tr>

  <tr>
                                    <td class="left">Interest Abatement T
erm:</td>
                                    <td class="right"><input type="tex
t" name="PPITERM" size="5" maxlength="5" value=""></td>

          </tr>
                                  <tr>

           <td class="left">Interest Abatement Term Code:</td>

                   <td class="right">
                                    </tr>

                                    <tr>
                                    <td
 class="left">1st Payment Required:</td>
                                    <td
 class="right">
                                    </tr>

              
                                  </table>

          </td>
                              </tr>

</table>
                            
                          </form>

                  
                        </div><!--EDITcontents-->

           </div>
                    </div>
                    <script type="t
ext/javascript">
                    	function handleNSF(select){

      		$selected = $(select).find(":selected");
                    		

            		if ($selected.is("#newnsf")){
                    			$(".nsf").sho
w();
                    			$("#editnsf").show();
                    			$("#edi
tnsf").html("Cancel");
                    			$("#PPNSFTYPEselect").hide();

                			$("#PPNSFTYPEselect").attr('disabled', 'disabled');

           			$("#PPNSFTYPEinput").show();
                    			$("#PPNSFTYPEi
nput").removeAttr('disabled');
                    		} else{

 			$(".nsf").hide();
                    			$("#PPNSFTYPEinput").hide();

              			$("#PPNSFTYPEinput").attr('disabled', 'disabled');

        			$("#PPNSFTYPEselect").show();
                    			$("#PPNSFTYPEsel
ect").removeAttr('disabled');
                    			if ($selected.is("#locnsf")
){
                    				$("#editnsf").hide();
                    			} else{

                    				$("#editnsf").show().html("Edit");
                    	
			updateNSF($selected.val());
                    			}
                    		}

                    	}
                    	
                    	function editN
SF(){
                    		text = $("#editnsf").html();
                    		i
f (text == "Edit"){
                    			updateNSF($("#PPNSFTYPEselect").find(
":selected").val(), true);
							} else if (text == "Cancel"){
								$(".nsf"
).hide();
                    			$("#editnsf").html("Edit").hide();

        			$("#PPNSFTYPEselect").show();
                    			$("#PPNSFTYPEsel
ect").removeAttr('disabled');
                    			$("#PPNSFTYPEselect option:
eq(0)").attr('selected', 'selected');
                    			$("#PPNSFTYPEinput"
).hide();
                    			$("#PPNSFTYPEinput").attr('disabled', 'disabled
');
							} else if (text == "Delete"){
								if (confirm("Are you sure you w
ant to delete NSF type " + $("#PPNSFTYPEselect").find(":selected").val().trim()
+ "?")){
									$.ajax({
										type: "POST",
										url: "s_prod.pgm",

										data: "task=ajaxDelNSF&pnsftype=" + $("#PPNSFTYPEselect").find(":selec
ted").val(),
										success: function(msg) {
											$(".nsf").hide();
			
								$("#editnsf").hide();
											$("#PPNSFTYPEselect").find(":selected")
.remove();
											$("#PPNSFTYPEselect option:eq(0)").attr('selected', 'selec
ted');
										}
									});
								}
							}
                    	}

              	
                    	function updateNSF(nsftype, showVals){

                		// don't allow submission while the amounts are updating, othe
rwise stuff can get overwritten
                    		$("#sbmbtn").attr('disable
d', 'disabled');
                    		$.ajax({
								type: "POST",
								ur
l: "s_prod.pgm",
								data: "task=ajaxGetNSF&pnsftype=" + nsftype,
								su
ccess: function(msg) {
									nsf = eval(msg);
									$("#PNSFAMT").val(nsf.
pnsfamt);
									$("#PNSFMIN").val(nsf.pnsfmin);
									$("#PNSFMAX").val(ns
f.pnsfmax);
									$("#PNSFPCT").val(nsf.pnsfpct);
									$("#sbmbtn").remov
eAttr('disabled');
									if (showVals){
										$(".nsf").show();
									
	$("#editnsf").html("Delete");
									}
								}
							});

   	}
                    </script>
                  </body>


                </html>
**CTDATA H__8        manageCSS                        2661
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

.nsf{
	display: none;
}

#PPNSFTYPEinpu
t{
	display: none;
}

**CTDATA H__9        AjaxNSFSeg                       52
({
	pnsfamt: ,
	pnsfmin: ,
	pnsfmax: ,
	pnsfpct: 
})

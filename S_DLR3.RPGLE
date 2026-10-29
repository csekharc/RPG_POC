     H/TITLE  System Settings: 3rd Party
      * ProGen WebSmart Revision 21178
      * File overrides for compile command
      *__OV OVRDBF KWPRTO3    KWPRTO3
      *__OV OVRDBF F__ARR001  KWPRTO3
      *__OV OVRDBF KWPRTO3C   KWPRTO3C
      *__OV OVRDBF KWP_DATA   KWP_DATA
      *__   Following values are used to create the server program
      *__RO Pgm  lib KWWEB      Pgm  S_DLR3
      *__AG          WEBSMART
      *__CL          *OBJLIBNAM
      *__BD ECRTBND187
      *===============================================================*
      * Path:   s_dlr3.pdw
      * System: REGGIE-LENOVO
      * Project:Kwik-Loan
      * Set:    Development
      * User:   Reggie
      * Date Last Generated:   2015-12-01   11:18:07
      * Last Generated CRC: 8BA3A0CC 46A56BF0 5C356655 CA0776F4
      *===============================================================*
      */CPY *LIBL/PW_CSRC CPYRIGHT
      * File specifications
     FKWPRTO3   UF A E           K DISK    USROPN
     F                                     INFDS(FID001_   )
     FF__ARR001 UF A E             DISK    USROPN
     F                                     RENAME(RKWPRTO3     :R__ARR001   )
     FKWPRTO3C  UF A E           K DISK    USROPN
     F                                     INFDS(FID002_   )
     FKWP_DATA  IF   E           K DISK    USROPN
     F                                     INFDS(FID003_   )

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
     D rwcolor1__      S             32A   INZ('F0F0FF')
     D rwcolor2__      S             32A   INZ('odd')


     D TASKRAN__       S              1    INZ(*OFF)


     D H__1            S             80    PERRCD(1) CTDATA DIM(43          )

     D H__2            S             80    PERRCD(1) CTDATA DIM(6           )

     D H__3            S             80    PERRCD(1) CTDATA DIM(13          )

     D H__4            S             80    PERRCD(1) CTDATA DIM(2           )

     D H__5            S             80    PERRCD(1) CTDATA DIM(31          )

     D H__6            S             80    PERRCD(1) CTDATA DIM(2           )

     D H__7            S             80    PERRCD(1) CTDATA DIM(163         )

     D H__8            S             80    PERRCD(1) CTDATA DIM(33          )


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
     D wrtprto3stbox0...
     D                 PR
     D QPGM__          S             21A
     D LstPmlErr_      S              4P 0 IMPORT
     D achtypebox0...
     D                 PR
     D CURTIME__       S              6P 0
     D QPGMNAM__       S             20A
     D SmurfChk__      S              1A   INZ(*ON)
     D Smurf_ID__      S             64A   IMPORT
     D Smurf_Rw__      S              9B 0 IMPORT

     D boxselect       S                   LIKE(p_zkeya       )
     D delemail1       S                   LIKE(prto3email    )
     D delemail2       S                   LIKE(prto3email    )
     D delemail3       S                   LIKE(prto3email    )
     D delemail4       S                   LIKE(prto3email    )
     D delemail5       S                   LIKE(prto3email    )
     D delcell1        S                   LIKE(prto3cell     )
     D delcell2        S                   LIKE(prto3cell     )
     D delcell3        S                   LIKE(prto3cell     )
     D delcell4        S                   LIKE(prto3cell     )
     D delcell5        S                   LIKE(prto3cell     )
     D acctemail1      S                   LIKE(prto3email    )
     D acctemail2      S                   LIKE(prto3email    )
     D acctemail3      S                   LIKE(prto3email    )
     D acctemail4      S                   LIKE(prto3email    )
     D acctemail5      S                   LIKE(prto3email    )
     D acctcell1       S                   LIKE(prto3cell     )
     D acctcell2       S                   LIKE(prto3cell     )
     D acctcell3       S                   LIKE(prto3cell     )
     D acctcell4       S                   LIKE(prto3cell     )
     D acctcell5       S                   LIKE(prto3cell     )

      /COPY *LIBL/PW_CSRC,SUBPROT187
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
     C                   KFLD                    prto3id
     C     DL002_        KLIST
     C                   KFLD                    prto3id
     C                   KFLD                    prto3ctype
     C     contkey       KLIST
     C                   KFLD                    prto3id
     C                   KFLD                    prto3ctype
     C                   KFLD                    prto3cseq
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
       startrrn = %dec(aton_( getparm3_('rrn':'*OPT'):9:0):9:0);
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
       outweb_(%subst(%str(%addr(H__1(1))):1:1033));
       wfrtn__ = AfToPage_(QPGMNAM__);
       outweb_(%subst(%str(%addr(H__1(13))):74:243));
       wfrtn__ = AfToPage_(PRTO3ID);
       outweb_(%subst(%str(%addr(H__1(16))):77:2));
       wfrtn__ = AfToPage_(PRTO3N1);
       outweb_(%subst(%str(%addr(H__1(16))):79:2105));
       rcdcnt = 0;
       prto3id = '';
       SETLL  DL001_ RKWPRTO3;
       RS001_ = RcdSts2_('POSRCD':%error:%equal:%eof);
       READ(E)  RKWPRTO3;
       RS001_ = RcdSts2_('GETNXTRCD':%error:%found:%eof);
       AM001_ = CV_ByKey;
       dow ((RS001_ = '1'));
       rrn = RR_001_;
       if (rcdcnt = 0);
        startrrn = RR_001_;
       endif;
       if (prto3city <> '');
        csz = %trim(prto3city) + ', ' + prto3st + ' ' + %editw(PRTO3ZIP:'    -
        -    ');
       endif;
       Flip_Rc_();
       outweb_(%subst(%str(%addr(H__2(1))):1:11));
       wfrtn__ = AfToPage_(ARCLR__);
       outweb_(%subst(%str(%addr(H__2(1))):12:24));
       wfrtn__ = AfToPage_(QPGMNAM__);
       outweb_(%subst(%str(%addr(H__2(1))):36:22));
       AfToPage_(%trim(%editc(RRN:'X')));
       outweb_(%subst(%str(%addr(H__2(1))):58:13));
       AfToPage_(%trim(%editc(STARTRRN:'X')));
       outweb_(%subst(%str(%addr(H__2(1))):71:9));
       wfrtn__ = AfToPage_(PRTO3ID);
       outweb_(%subst(%str(%addr(H__2(1))):80:95));
       wfrtn__ = AfToPage_(QPGMNAM__);
       outweb_(%subst(%str(%addr(H__2(3))):15:18));
       AfToPage_(%trim(%editc(RRN:'X')));
       outweb_(%subst(%str(%addr(H__2(3))):33:13));
       AfToPage_(%trim(%editc(STARTRRN:'X')));
       outweb_(%subst(%str(%addr(H__2(3))):46:9));
       wfrtn__ = AfToPage_(PRTO3ID);
       outweb_(%subst(%str(%addr(H__2(3))):55:115));
       wfrtn__ = AfToPage_(PRTO3ID);
       outweb_(%subst(%str(%addr(H__2(5))):10:25));
       wfrtn__ = AfToPage_(PRTO3N1);
       outweb_(%subst(%str(%addr(H__2(5))):35:25));
       wfrtn__ = AfToPage_(PRTO3A1);
       outweb_(%subst(%str(%addr(H__2(5))):60:25));
       wfrtn__ = AfToPage_(CSZ);
       outweb_(%subst(%str(%addr(H__2(6))):5:12));
       endrrn = RR_001_;
       rcdcnt = rcdcnt + 1;
       READ(E)  RKWPRTO3;
       RS001_ = RcdSts2_('GETNXTRCD':%error:%found:%eof);
       AM001_ = CV_ByKey;
       enddo;
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
       rrn = %dec(aton_( getparm3_('rrn':'*MAND'):9:0):9:0);
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
       rrn = %dec(aton_( getparm3_('rrn':'*MAND'):9:0):9:0);
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
       outweb_(%subst(%str(%addr(H__5(21))):35:151));
       wfrtn__ = AfToPage_(PRTO3ID);
       outweb_(%subst(%str(%addr(H__5(23))):26:123));
       wfrtn__ = AfToPage_(PRTO3N1);
       outweb_(%subst(%str(%addr(H__5(24))):69:216));
       wfrtn__ = AfToPage_(QPGMNAM__);
       outweb_(%subst(%str(%addr(H__5(27))):45:14));
       AfToPage_(%trim(%editc(RRN:'X')));
       outweb_(%subst(%str(%addr(H__5(27))):59:13));
       wfrtn__ = AfToPage_(SAVEDRRN);
       outweb_(%subst(%str(%addr(H__5(27))):72:316));

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
       rrn = %dec(aton_( getparm3_('rrn':'*MAND'):9:0):9:0);
       savedrrn = getparm3_('FirstRowRRN':'*OPT');
       RR_001_ = rrn;
       AM001_ = CV_BYRRN;
       CHAIN(E) RR_001_ R__ARR001;
       RS001_ = RcdSts2_('GETRCD': %error: %found: %eof);
       if (rrn = %dec(aton_(savedrrn:46:16):46:16));
        SETLL  DL001_ RKWPRTO3;
        RS001_ = RcdSts2_('POSRCD':%error:%equal:%eof);
        READPE(E) DL001_ RKWPRTO3;
        RS001_ = RcdSts2_('GETPRVRCD': %error: %found: %eof);
        AM001_ = CV_ByKey;
        savedrrn = %trim(%editc(RR_001_:'P'));
        RR_001_ = rrn;
        AM001_ = CV_BYRRN;
        CHAIN(E) RR_001_ R__ARR001;
        RS001_ = RcdSts2_('GETRCD': %error: %found: %eof);
       endif;
      /end-free
     C                   EVAL      RS001_ = DeleteRcd_('RKWPRTO3')
      /free
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
       rrn = %dec(aton_( getparm3_('rrn':'*MAND'):9:0):9:0);
       savedrrn = getparm3_('FirstRowRRN':'*OPT');
       RR_001_ = rrn;
       AM001_ = CV_BYRRN;
       CHAIN(E) RR_001_ R__ARR001;
       RS001_ = RcdSts2_('GETRCD': %error: %found: %eof);
       prto3ctype = 'DELIVERY';
       SETLL  DL002_ RKWPRTO3C;
       RS002_ = RcdSts2_('POSRCD':%error:%equal:%eof);
       READE(E) DL002_ RKWPRTO3C;
       RS002_ = RcdSts2_('GETNXTRCD':%error:%found:%eof);
       AM002_ = CV_ByKey;
       dow (RS002_ = '1');
       select;
       when (PRTO3CSEQ = 1);
       delemail1 = prto3email;
       DELCELL1 = PRTO3CELL;
       when (PRTO3CSEQ = 2);
       delemail2 = prto3email;
       DELCELL2 = PRTO3CELL;
       when (PRTO3CSEQ = 3);
       delemail3 = prto3email;
       DELCELL3 = PRTO3CELL;
       when (PRTO3CSEQ = 4);
       delemail4 = prto3email;
       DELCELL4 = PRTO3CELL;
       when (PRTO3CSEQ = 5);
       delemail5 = prto3email;
       DELCELL5 = PRTO3CELL;
       endsl;
       READE(E) DL002_ RKWPRTO3C;
       RS002_ = RcdSts2_('GETNXTRCD':%error:%found:%eof);
       AM002_ = CV_ByKey;
       enddo;
       prto3ctype = 'ACCOUNTING';
       SETLL  DL002_ RKWPRTO3C;
       RS002_ = RcdSts2_('POSRCD':%error:%equal:%eof);
       READE(E) DL002_ RKWPRTO3C;
       RS002_ = RcdSts2_('GETNXTRCD':%error:%found:%eof);
       AM002_ = CV_ByKey;
       dow (RS002_ = '1');
       select;
       when (PRTO3CSEQ = 1);
       acctemail1 = prto3email;
       ACCTCELL1 = PRTO3CELL;
       when (PRTO3CSEQ = 2);
       acctemail2 = prto3email;
       ACCTCELL2 = PRTO3CELL;
       when (PRTO3CSEQ = 3);
       acctemail3 = prto3email;
       ACCTCELL3 = PRTO3CELL;
       when (PRTO3CSEQ = 4);
       acctemail4 = prto3email;
       ACCTCELL4 = PRTO3CELL;
       when (PRTO3CSEQ = 5);
       acctemail5 = prto3email;
       ACCTCELL5 = PRTO3CELL;
       endsl;
       READE(E) DL002_ RKWPRTO3C;
       RS002_ = RcdSts2_('GETNXTRCD':%error:%found:%eof);
       AM002_ = CV_ByKey;
       enddo;
       outweb_(%subst(%str(%addr(H__7(1))):1:334));
       outweb_(%subst(%str(%addr(H__8(1))):1:2599));
       outweb_(%subst(%str(%addr(H__7(5))):15:529));
       wfrtn__ = AfToPage_(QPGMNAM__);
       outweb_(%subst(%str(%addr(H__7(11))):64:119));
       AfToPage_(%trim(%editc(RRN:'X')));
       outweb_(%subst(%str(%addr(H__7(13))):23:56));
       wfrtn__ = AfToPage_(SAVEDRRN);
       outweb_(%subst(%str(%addr(H__7(13))):79:968));
       wfrtn__ = AfToPage_(DISABLED);
       outweb_(%subst(%str(%addr(H__7(26))):7:8));
       wfrtn__ = AfToPage_(PRTO3ID);
       outweb_(%subst(%str(%addr(H__7(26))):15:230));
       wfrtn__ = AfToPage_(DISABLED);
       outweb_(%subst(%str(%addr(H__7(29))):5:8));
       wfrtn__ = AfToPage_(PRTO3N1);
       outweb_(%subst(%str(%addr(H__7(29))):13:291));
       wfrtn__ = AfToPage_(DISABLED);
       outweb_(%subst(%str(%addr(H__7(32))):64:8));
       wfrtn__ = AfToPage_(PRTO3A1);
       outweb_(%subst(%str(%addr(H__7(32))):72:235));
       wfrtn__ = AfToPage_(DISABLED);
       outweb_(%subst(%str(%addr(H__7(35))):67:8));
       wfrtn__ = AfToPage_(PRTO3A2);
       outweb_(%subst(%str(%addr(H__7(35))):75:242));
       wfrtn__ = AfToPage_(%trim(%editw(PRTO3PHON:'   -   -    ')));
       outweb_(%subst(%str(%addr(H__7(38))):77:232));
       wfrtn__ = AfToPage_(DISABLED);
       outweb_(%subst(%str(%addr(H__7(41))):69:8));
       wfrtn__ = AfToPage_(PRTO3CITY);
       outweb_(%subst(%str(%addr(H__7(41))):77:172));
       wrtprto3stbox0();
       outweb_(%subst(%str(%addr(H__7(44))):9:206));
       wfrtn__ = AfToPage_(DISABLED);
       outweb_(%subst(%str(%addr(H__7(46))):55:8));
       wfrtn__ = AfToPage_(%trim(%editw(PRTO3ZIP:'     -    ')));
       outweb_(%subst(%str(%addr(H__7(46))):63:238));
       wfrtn__ = AfToPage_(DISABLED);
       outweb_(%subst(%str(%addr(H__7(49))):61:8));
       AfToPage_(%trim(%editc(PRTO3ABA:'X')));
       outweb_(%subst(%str(%addr(H__7(49))):69:239));
       wfrtn__ = AfToPage_(DISABLED);
       outweb_(%subst(%str(%addr(H__7(52))):68:8));
       wfrtn__ = AfToPage_(PRTO3ACCT);
       outweb_(%subst(%str(%addr(H__7(52))):76:179));
       achtypebox0();
       outweb_(%subst(%str(%addr(H__7(55))):15:236));
       wfrtn__ = AfToPage_(DISABLED);
       outweb_(%subst(%str(%addr(H__7(58))):11:8));
       AfToPage_(%trim(%editc(PRTO3DELIV:'3')));
       outweb_(%subst(%str(%addr(H__7(58))):19:267));
       wfrtn__ = AfToPage_(DISABLED);
       outweb_(%subst(%str(%addr(H__7(61))):46:8));
       wfrtn__ = AfToPage_(DELEMAIL1);
       outweb_(%subst(%str(%addr(H__7(61))):54:224));
       wfrtn__ = AfToPage_(DISABLED);
       outweb_(%subst(%str(%addr(H__7(64))):38:8));
       wfrtn__ = AfToPage_(DELEMAIL2);
       outweb_(%subst(%str(%addr(H__7(64))):46:224));
       wfrtn__ = AfToPage_(DISABLED);
       outweb_(%subst(%str(%addr(H__7(67))):30:8));
       wfrtn__ = AfToPage_(DELEMAIL3);
       outweb_(%subst(%str(%addr(H__7(67))):38:224));
       wfrtn__ = AfToPage_(DISABLED);
       outweb_(%subst(%str(%addr(H__7(70))):22:8));
       wfrtn__ = AfToPage_(DELEMAIL4);
       outweb_(%subst(%str(%addr(H__7(70))):30:224));
       wfrtn__ = AfToPage_(DISABLED);
       outweb_(%subst(%str(%addr(H__7(73))):14:8));
       wfrtn__ = AfToPage_(DELEMAIL5);
       outweb_(%subst(%str(%addr(H__7(73))):22:254));
       wfrtn__ = AfToPage_(%trim(%editw(DELCELL1:'   -   -    ')));
       outweb_(%subst(%str(%addr(H__7(76))):36:254));
       wfrtn__ = AfToPage_(%trim(%editw(DELCELL2:'   -   -    ')));
       outweb_(%subst(%str(%addr(H__7(79))):50:254));
       wfrtn__ = AfToPage_(%trim(%editw(DELCELL3:'   -   -    ')));
       outweb_(%subst(%str(%addr(H__7(82))):64:254));
       wfrtn__ = AfToPage_(%trim(%editw(DELCELL4:'   -   -    ')));
       outweb_(%subst(%str(%addr(H__7(85))):78:254));
       wfrtn__ = AfToPage_(%trim(%editw(DELCELL5:'   -   -    ')));
       outweb_(%subst(%str(%addr(H__7(89))):12:272));
       wfrtn__ = AfToPage_(DISABLED);
       outweb_(%subst(%str(%addr(H__7(92))):44:8));
       wfrtn__ = AfToPage_(ACCTEMAIL1);
       outweb_(%subst(%str(%addr(H__7(92))):52:227));
       wfrtn__ = AfToPage_(DISABLED);
       outweb_(%subst(%str(%addr(H__7(95))):39:8));
       wfrtn__ = AfToPage_(ACCTEMAIL2);
       outweb_(%subst(%str(%addr(H__7(95))):47:227));
       wfrtn__ = AfToPage_(DISABLED);
       outweb_(%subst(%str(%addr(H__7(98))):34:8));
       wfrtn__ = AfToPage_(ACCTEMAIL3);
       outweb_(%subst(%str(%addr(H__7(98))):42:227));
       wfrtn__ = AfToPage_(DISABLED);
       outweb_(%subst(%str(%addr(H__7(101))):29:8));
       wfrtn__ = AfToPage_(ACCTEMAIL4);
       outweb_(%subst(%str(%addr(H__7(101))):37:227));
       wfrtn__ = AfToPage_(DISABLED);
       outweb_(%subst(%str(%addr(H__7(104))):24:8));
       wfrtn__ = AfToPage_(ACCTEMAIL5);
       outweb_(%subst(%str(%addr(H__7(104))):32:257));
       wfrtn__ = AfToPage_(%trim(%editw(ACCTCELL1:'   -   -    ')));
       outweb_(%subst(%str(%addr(H__7(107))):49:257));
       wfrtn__ = AfToPage_(%trim(%editw(ACCTCELL2:'   -   -    ')));
       outweb_(%subst(%str(%addr(H__7(110))):66:257));
       wfrtn__ = AfToPage_(%trim(%editw(ACCTCELL3:'   -   -    ')));
       outweb_(%subst(%str(%addr(H__7(114))):3:257));
       wfrtn__ = AfToPage_(%trim(%editw(ACCTCELL4:'   -   -    ')));
       outweb_(%subst(%str(%addr(H__7(117))):20:257));
       wfrtn__ = AfToPage_(%trim(%editw(ACCTCELL5:'   -   -    ')));
       outweb_(%subst(%str(%addr(H__7(120))):37:527));
       AfToPage_(%trim(%editc(RRN:'X')));
       outweb_(%subst(%str(%addr(H__7(127))):4:2892));

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
       rrn = %dec(aton_( getparm3_('rrn':'*OPT'):9:0):9:0);
       savedrrn = getparm3_('FirstRowRRN':'*OPT');
       if (rrn = 0);
        prto3id = getparm3_('prto3id':'*OPT');
        prto3n1 = getparm3_('prto3n1':'*OPT');
        prto3n2 = getparm3_('prto3n2':'*OPT');
        prto3a1 = getparm3_('prto3a1':'*OPT');
        prto3a2 = getparm3_('prto3a2':'*OPT');
        prto3city = getparm3_('prto3city':'*OPT');
        prto3st = getparm3_('prto3st':'*OPT');
        PRTO3ZIP = %dec(aton_( getparm3_('PRTO3ZIP':'*OPT'):9:0):9:0);
        PRTO3ABA = %dec(aton_( getparm3_('PRTO3ABA':'*OPT'):9:0):9:0);
        prto3acct = getparm3_('prto3acct':'*OPT');
        prto3type = getparm3_('prto3type':'*OPT');
        PRTO3PHON = %dec(aton_( getparm3_('PRTO3PHON':'*OPT'):10:0):10:0);
        PRTO3DELIV = %dec(aton_( getparm3_('PRTO3DELIV':'*OPT'):11:2):11:2);
        if (prto3id = '');
         errmsg = 'ERROR: 3RD PARTY ID CANNOT BE BLANK';
         Alert_(errmsg);
         outweb_(%subst(%str(%addr(H__7(1))):1:334));
         outweb_(%subst(%str(%addr(H__8(1))):1:2599));
         outweb_(%subst(%str(%addr(H__7(5))):15:529));
         wfrtn__ = AfToPage_(QPGMNAM__);
         outweb_(%subst(%str(%addr(H__7(11))):64:119));
         AfToPage_(%trim(%editc(RRN:'X')));
         outweb_(%subst(%str(%addr(H__7(13))):23:56));
         wfrtn__ = AfToPage_(SAVEDRRN);
         outweb_(%subst(%str(%addr(H__7(13))):79:968));
         wfrtn__ = AfToPage_(DISABLED);
         outweb_(%subst(%str(%addr(H__7(26))):7:8));
         wfrtn__ = AfToPage_(PRTO3ID);
         outweb_(%subst(%str(%addr(H__7(26))):15:230));
         wfrtn__ = AfToPage_(DISABLED);
         outweb_(%subst(%str(%addr(H__7(29))):5:8));
         wfrtn__ = AfToPage_(PRTO3N1);
         outweb_(%subst(%str(%addr(H__7(29))):13:291));
         wfrtn__ = AfToPage_(DISABLED);
         outweb_(%subst(%str(%addr(H__7(32))):64:8));
         wfrtn__ = AfToPage_(PRTO3A1);
         outweb_(%subst(%str(%addr(H__7(32))):72:235));
         wfrtn__ = AfToPage_(DISABLED);
         outweb_(%subst(%str(%addr(H__7(35))):67:8));
         wfrtn__ = AfToPage_(PRTO3A2);
         outweb_(%subst(%str(%addr(H__7(35))):75:242));
         wfrtn__ = AfToPage_(%trim(%editw(PRTO3PHON:'   -   -    ')));
         outweb_(%subst(%str(%addr(H__7(38))):77:232));
         wfrtn__ = AfToPage_(DISABLED);
         outweb_(%subst(%str(%addr(H__7(41))):69:8));
         wfrtn__ = AfToPage_(PRTO3CITY);
         outweb_(%subst(%str(%addr(H__7(41))):77:172));
         wrtprto3stbox0();
         outweb_(%subst(%str(%addr(H__7(44))):9:206));
         wfrtn__ = AfToPage_(DISABLED);
         outweb_(%subst(%str(%addr(H__7(46))):55:8));
         wfrtn__ = AfToPage_(%trim(%editw(PRTO3ZIP:'     -    ')));
         outweb_(%subst(%str(%addr(H__7(46))):63:238));
         wfrtn__ = AfToPage_(DISABLED);
         outweb_(%subst(%str(%addr(H__7(49))):61:8));
         AfToPage_(%trim(%editc(PRTO3ABA:'X')));
         outweb_(%subst(%str(%addr(H__7(49))):69:239));
         wfrtn__ = AfToPage_(DISABLED);
         outweb_(%subst(%str(%addr(H__7(52))):68:8));
         wfrtn__ = AfToPage_(PRTO3ACCT);
         outweb_(%subst(%str(%addr(H__7(52))):76:179));
         achtypebox0();
         outweb_(%subst(%str(%addr(H__7(55))):15:236));
         wfrtn__ = AfToPage_(DISABLED);
         outweb_(%subst(%str(%addr(H__7(58))):11:8));
         AfToPage_(%trim(%editc(PRTO3DELIV:'3')));
         outweb_(%subst(%str(%addr(H__7(58))):19:267));
         wfrtn__ = AfToPage_(DISABLED);
         outweb_(%subst(%str(%addr(H__7(61))):46:8));
         wfrtn__ = AfToPage_(DELEMAIL1);
         outweb_(%subst(%str(%addr(H__7(61))):54:224));
         wfrtn__ = AfToPage_(DISABLED);
         outweb_(%subst(%str(%addr(H__7(64))):38:8));
         wfrtn__ = AfToPage_(DELEMAIL2);
         outweb_(%subst(%str(%addr(H__7(64))):46:224));
         wfrtn__ = AfToPage_(DISABLED);
         outweb_(%subst(%str(%addr(H__7(67))):30:8));
         wfrtn__ = AfToPage_(DELEMAIL3);
         outweb_(%subst(%str(%addr(H__7(67))):38:224));
         wfrtn__ = AfToPage_(DISABLED);
         outweb_(%subst(%str(%addr(H__7(70))):22:8));
         wfrtn__ = AfToPage_(DELEMAIL4);
         outweb_(%subst(%str(%addr(H__7(70))):30:224));
         wfrtn__ = AfToPage_(DISABLED);
         outweb_(%subst(%str(%addr(H__7(73))):14:8));
         wfrtn__ = AfToPage_(DELEMAIL5);
         outweb_(%subst(%str(%addr(H__7(73))):22:254));
         wfrtn__ = AfToPage_(%trim(%editw(DELCELL1:'   -   -    ')));
         outweb_(%subst(%str(%addr(H__7(76))):36:254));
         wfrtn__ = AfToPage_(%trim(%editw(DELCELL2:'   -   -    ')));
         outweb_(%subst(%str(%addr(H__7(79))):50:254));
         wfrtn__ = AfToPage_(%trim(%editw(DELCELL3:'   -   -    ')));
         outweb_(%subst(%str(%addr(H__7(82))):64:254));
         wfrtn__ = AfToPage_(%trim(%editw(DELCELL4:'   -   -    ')));
         outweb_(%subst(%str(%addr(H__7(85))):78:254));
         wfrtn__ = AfToPage_(%trim(%editw(DELCELL5:'   -   -    ')));
         outweb_(%subst(%str(%addr(H__7(89))):12:272));
         wfrtn__ = AfToPage_(DISABLED);
         outweb_(%subst(%str(%addr(H__7(92))):44:8));
         wfrtn__ = AfToPage_(ACCTEMAIL1);
         outweb_(%subst(%str(%addr(H__7(92))):52:227));
         wfrtn__ = AfToPage_(DISABLED);
         outweb_(%subst(%str(%addr(H__7(95))):39:8));
         wfrtn__ = AfToPage_(ACCTEMAIL2);
         outweb_(%subst(%str(%addr(H__7(95))):47:227));
         wfrtn__ = AfToPage_(DISABLED);
         outweb_(%subst(%str(%addr(H__7(98))):34:8));
         wfrtn__ = AfToPage_(ACCTEMAIL3);
         outweb_(%subst(%str(%addr(H__7(98))):42:227));
         wfrtn__ = AfToPage_(DISABLED);
         outweb_(%subst(%str(%addr(H__7(101))):29:8));
         wfrtn__ = AfToPage_(ACCTEMAIL4);
         outweb_(%subst(%str(%addr(H__7(101))):37:227));
         wfrtn__ = AfToPage_(DISABLED);
         outweb_(%subst(%str(%addr(H__7(104))):24:8));
         wfrtn__ = AfToPage_(ACCTEMAIL5);
         outweb_(%subst(%str(%addr(H__7(104))):32:257));
         wfrtn__ = AfToPage_(%trim(%editw(ACCTCELL1:'   -   -    ')));
         outweb_(%subst(%str(%addr(H__7(107))):49:257));
         wfrtn__ = AfToPage_(%trim(%editw(ACCTCELL2:'   -   -    ')));
         outweb_(%subst(%str(%addr(H__7(110))):66:257));
         wfrtn__ = AfToPage_(%trim(%editw(ACCTCELL3:'   -   -    ')));
         outweb_(%subst(%str(%addr(H__7(114))):3:257));
         wfrtn__ = AfToPage_(%trim(%editw(ACCTCELL4:'   -   -    ')));
         outweb_(%subst(%str(%addr(H__7(117))):20:257));
         wfrtn__ = AfToPage_(%trim(%editw(ACCTCELL5:'   -   -    ')));
         outweb_(%subst(%str(%addr(H__7(120))):37:527));
         AfToPage_(%trim(%editc(RRN:'X')));
         outweb_(%subst(%str(%addr(H__7(127))):4:2892));
         return ;
        endif;
        if (prto3n1 = '');
         errmsg = 'ERROR: NAME CANNOT BE BLANK';
         Alert_(errmsg);
         outweb_(%subst(%str(%addr(H__7(1))):1:334));
         outweb_(%subst(%str(%addr(H__8(1))):1:2599));
         outweb_(%subst(%str(%addr(H__7(5))):15:529));
         wfrtn__ = AfToPage_(QPGMNAM__);
         outweb_(%subst(%str(%addr(H__7(11))):64:119));
         AfToPage_(%trim(%editc(RRN:'X')));
         outweb_(%subst(%str(%addr(H__7(13))):23:56));
         wfrtn__ = AfToPage_(SAVEDRRN);
         outweb_(%subst(%str(%addr(H__7(13))):79:968));
         wfrtn__ = AfToPage_(DISABLED);
         outweb_(%subst(%str(%addr(H__7(26))):7:8));
         wfrtn__ = AfToPage_(PRTO3ID);
         outweb_(%subst(%str(%addr(H__7(26))):15:230));
         wfrtn__ = AfToPage_(DISABLED);
         outweb_(%subst(%str(%addr(H__7(29))):5:8));
         wfrtn__ = AfToPage_(PRTO3N1);
         outweb_(%subst(%str(%addr(H__7(29))):13:291));
         wfrtn__ = AfToPage_(DISABLED);
         outweb_(%subst(%str(%addr(H__7(32))):64:8));
         wfrtn__ = AfToPage_(PRTO3A1);
         outweb_(%subst(%str(%addr(H__7(32))):72:235));
         wfrtn__ = AfToPage_(DISABLED);
         outweb_(%subst(%str(%addr(H__7(35))):67:8));
         wfrtn__ = AfToPage_(PRTO3A2);
         outweb_(%subst(%str(%addr(H__7(35))):75:242));
         wfrtn__ = AfToPage_(%trim(%editw(PRTO3PHON:'   -   -    ')));
         outweb_(%subst(%str(%addr(H__7(38))):77:232));
         wfrtn__ = AfToPage_(DISABLED);
         outweb_(%subst(%str(%addr(H__7(41))):69:8));
         wfrtn__ = AfToPage_(PRTO3CITY);
         outweb_(%subst(%str(%addr(H__7(41))):77:172));
         wrtprto3stbox0();
         outweb_(%subst(%str(%addr(H__7(44))):9:206));
         wfrtn__ = AfToPage_(DISABLED);
         outweb_(%subst(%str(%addr(H__7(46))):55:8));
         wfrtn__ = AfToPage_(%trim(%editw(PRTO3ZIP:'     -    ')));
         outweb_(%subst(%str(%addr(H__7(46))):63:238));
         wfrtn__ = AfToPage_(DISABLED);
         outweb_(%subst(%str(%addr(H__7(49))):61:8));
         AfToPage_(%trim(%editc(PRTO3ABA:'X')));
         outweb_(%subst(%str(%addr(H__7(49))):69:239));
         wfrtn__ = AfToPage_(DISABLED);
         outweb_(%subst(%str(%addr(H__7(52))):68:8));
         wfrtn__ = AfToPage_(PRTO3ACCT);
         outweb_(%subst(%str(%addr(H__7(52))):76:179));
         achtypebox0();
         outweb_(%subst(%str(%addr(H__7(55))):15:236));
         wfrtn__ = AfToPage_(DISABLED);
         outweb_(%subst(%str(%addr(H__7(58))):11:8));
         AfToPage_(%trim(%editc(PRTO3DELIV:'3')));
         outweb_(%subst(%str(%addr(H__7(58))):19:267));
         wfrtn__ = AfToPage_(DISABLED);
         outweb_(%subst(%str(%addr(H__7(61))):46:8));
         wfrtn__ = AfToPage_(DELEMAIL1);
         outweb_(%subst(%str(%addr(H__7(61))):54:224));
         wfrtn__ = AfToPage_(DISABLED);
         outweb_(%subst(%str(%addr(H__7(64))):38:8));
         wfrtn__ = AfToPage_(DELEMAIL2);
         outweb_(%subst(%str(%addr(H__7(64))):46:224));
         wfrtn__ = AfToPage_(DISABLED);
         outweb_(%subst(%str(%addr(H__7(67))):30:8));
         wfrtn__ = AfToPage_(DELEMAIL3);
         outweb_(%subst(%str(%addr(H__7(67))):38:224));
         wfrtn__ = AfToPage_(DISABLED);
         outweb_(%subst(%str(%addr(H__7(70))):22:8));
         wfrtn__ = AfToPage_(DELEMAIL4);
         outweb_(%subst(%str(%addr(H__7(70))):30:224));
         wfrtn__ = AfToPage_(DISABLED);
         outweb_(%subst(%str(%addr(H__7(73))):14:8));
         wfrtn__ = AfToPage_(DELEMAIL5);
         outweb_(%subst(%str(%addr(H__7(73))):22:254));
         wfrtn__ = AfToPage_(%trim(%editw(DELCELL1:'   -   -    ')));
         outweb_(%subst(%str(%addr(H__7(76))):36:254));
         wfrtn__ = AfToPage_(%trim(%editw(DELCELL2:'   -   -    ')));
         outweb_(%subst(%str(%addr(H__7(79))):50:254));
         wfrtn__ = AfToPage_(%trim(%editw(DELCELL3:'   -   -    ')));
         outweb_(%subst(%str(%addr(H__7(82))):64:254));
         wfrtn__ = AfToPage_(%trim(%editw(DELCELL4:'   -   -    ')));
         outweb_(%subst(%str(%addr(H__7(85))):78:254));
         wfrtn__ = AfToPage_(%trim(%editw(DELCELL5:'   -   -    ')));
         outweb_(%subst(%str(%addr(H__7(89))):12:272));
         wfrtn__ = AfToPage_(DISABLED);
         outweb_(%subst(%str(%addr(H__7(92))):44:8));
         wfrtn__ = AfToPage_(ACCTEMAIL1);
         outweb_(%subst(%str(%addr(H__7(92))):52:227));
         wfrtn__ = AfToPage_(DISABLED);
         outweb_(%subst(%str(%addr(H__7(95))):39:8));
         wfrtn__ = AfToPage_(ACCTEMAIL2);
         outweb_(%subst(%str(%addr(H__7(95))):47:227));
         wfrtn__ = AfToPage_(DISABLED);
         outweb_(%subst(%str(%addr(H__7(98))):34:8));
         wfrtn__ = AfToPage_(ACCTEMAIL3);
         outweb_(%subst(%str(%addr(H__7(98))):42:227));
         wfrtn__ = AfToPage_(DISABLED);
         outweb_(%subst(%str(%addr(H__7(101))):29:8));
         wfrtn__ = AfToPage_(ACCTEMAIL4);
         outweb_(%subst(%str(%addr(H__7(101))):37:227));
         wfrtn__ = AfToPage_(DISABLED);
         outweb_(%subst(%str(%addr(H__7(104))):24:8));
         wfrtn__ = AfToPage_(ACCTEMAIL5);
         outweb_(%subst(%str(%addr(H__7(104))):32:257));
         wfrtn__ = AfToPage_(%trim(%editw(ACCTCELL1:'   -   -    ')));
         outweb_(%subst(%str(%addr(H__7(107))):49:257));
         wfrtn__ = AfToPage_(%trim(%editw(ACCTCELL2:'   -   -    ')));
         outweb_(%subst(%str(%addr(H__7(110))):66:257));
         wfrtn__ = AfToPage_(%trim(%editw(ACCTCELL3:'   -   -    ')));
         outweb_(%subst(%str(%addr(H__7(114))):3:257));
         wfrtn__ = AfToPage_(%trim(%editw(ACCTCELL4:'   -   -    ')));
         outweb_(%subst(%str(%addr(H__7(117))):20:257));
         wfrtn__ = AfToPage_(%trim(%editw(ACCTCELL5:'   -   -    ')));
         outweb_(%subst(%str(%addr(H__7(120))):37:527));
         AfToPage_(%trim(%editc(RRN:'X')));
         outweb_(%subst(%str(%addr(H__7(127))):4:2892));
         return ;
        endif;
        if ((((((prto3a1 = '')) or ((prto3city = '')) or ((prto3st = '')) or
       ((PRTO3ZIP = 0))))));
         errmsg = 'ERROR: ADDRESS, CITY, STATE, AND ZIP REQUIRED';
         Alert_(errmsg);
         outweb_(%subst(%str(%addr(H__7(1))):1:334));
         outweb_(%subst(%str(%addr(H__8(1))):1:2599));
         outweb_(%subst(%str(%addr(H__7(5))):15:529));
         wfrtn__ = AfToPage_(QPGMNAM__);
         outweb_(%subst(%str(%addr(H__7(11))):64:119));
         AfToPage_(%trim(%editc(RRN:'X')));
         outweb_(%subst(%str(%addr(H__7(13))):23:56));
         wfrtn__ = AfToPage_(SAVEDRRN);
         outweb_(%subst(%str(%addr(H__7(13))):79:968));
         wfrtn__ = AfToPage_(DISABLED);
         outweb_(%subst(%str(%addr(H__7(26))):7:8));
         wfrtn__ = AfToPage_(PRTO3ID);
         outweb_(%subst(%str(%addr(H__7(26))):15:230));
         wfrtn__ = AfToPage_(DISABLED);
         outweb_(%subst(%str(%addr(H__7(29))):5:8));
         wfrtn__ = AfToPage_(PRTO3N1);
         outweb_(%subst(%str(%addr(H__7(29))):13:291));
         wfrtn__ = AfToPage_(DISABLED);
         outweb_(%subst(%str(%addr(H__7(32))):64:8));
         wfrtn__ = AfToPage_(PRTO3A1);
         outweb_(%subst(%str(%addr(H__7(32))):72:235));
         wfrtn__ = AfToPage_(DISABLED);
         outweb_(%subst(%str(%addr(H__7(35))):67:8));
         wfrtn__ = AfToPage_(PRTO3A2);
         outweb_(%subst(%str(%addr(H__7(35))):75:242));
         wfrtn__ = AfToPage_(%trim(%editw(PRTO3PHON:'   -   -    ')));
         outweb_(%subst(%str(%addr(H__7(38))):77:232));
         wfrtn__ = AfToPage_(DISABLED);
         outweb_(%subst(%str(%addr(H__7(41))):69:8));
         wfrtn__ = AfToPage_(PRTO3CITY);
         outweb_(%subst(%str(%addr(H__7(41))):77:172));
         wrtprto3stbox0();
         outweb_(%subst(%str(%addr(H__7(44))):9:206));
         wfrtn__ = AfToPage_(DISABLED);
         outweb_(%subst(%str(%addr(H__7(46))):55:8));
         wfrtn__ = AfToPage_(%trim(%editw(PRTO3ZIP:'     -    ')));
         outweb_(%subst(%str(%addr(H__7(46))):63:238));
         wfrtn__ = AfToPage_(DISABLED);
         outweb_(%subst(%str(%addr(H__7(49))):61:8));
         AfToPage_(%trim(%editc(PRTO3ABA:'X')));
         outweb_(%subst(%str(%addr(H__7(49))):69:239));
         wfrtn__ = AfToPage_(DISABLED);
         outweb_(%subst(%str(%addr(H__7(52))):68:8));
         wfrtn__ = AfToPage_(PRTO3ACCT);
         outweb_(%subst(%str(%addr(H__7(52))):76:179));
         achtypebox0();
         outweb_(%subst(%str(%addr(H__7(55))):15:236));
         wfrtn__ = AfToPage_(DISABLED);
         outweb_(%subst(%str(%addr(H__7(58))):11:8));
         AfToPage_(%trim(%editc(PRTO3DELIV:'3')));
         outweb_(%subst(%str(%addr(H__7(58))):19:267));
         wfrtn__ = AfToPage_(DISABLED);
         outweb_(%subst(%str(%addr(H__7(61))):46:8));
         wfrtn__ = AfToPage_(DELEMAIL1);
         outweb_(%subst(%str(%addr(H__7(61))):54:224));
         wfrtn__ = AfToPage_(DISABLED);
         outweb_(%subst(%str(%addr(H__7(64))):38:8));
         wfrtn__ = AfToPage_(DELEMAIL2);
         outweb_(%subst(%str(%addr(H__7(64))):46:224));
         wfrtn__ = AfToPage_(DISABLED);
         outweb_(%subst(%str(%addr(H__7(67))):30:8));
         wfrtn__ = AfToPage_(DELEMAIL3);
         outweb_(%subst(%str(%addr(H__7(67))):38:224));
         wfrtn__ = AfToPage_(DISABLED);
         outweb_(%subst(%str(%addr(H__7(70))):22:8));
         wfrtn__ = AfToPage_(DELEMAIL4);
         outweb_(%subst(%str(%addr(H__7(70))):30:224));
         wfrtn__ = AfToPage_(DISABLED);
         outweb_(%subst(%str(%addr(H__7(73))):14:8));
         wfrtn__ = AfToPage_(DELEMAIL5);
         outweb_(%subst(%str(%addr(H__7(73))):22:254));
         wfrtn__ = AfToPage_(%trim(%editw(DELCELL1:'   -   -    ')));
         outweb_(%subst(%str(%addr(H__7(76))):36:254));
         wfrtn__ = AfToPage_(%trim(%editw(DELCELL2:'   -   -    ')));
         outweb_(%subst(%str(%addr(H__7(79))):50:254));
         wfrtn__ = AfToPage_(%trim(%editw(DELCELL3:'   -   -    ')));
         outweb_(%subst(%str(%addr(H__7(82))):64:254));
         wfrtn__ = AfToPage_(%trim(%editw(DELCELL4:'   -   -    ')));
         outweb_(%subst(%str(%addr(H__7(85))):78:254));
         wfrtn__ = AfToPage_(%trim(%editw(DELCELL5:'   -   -    ')));
         outweb_(%subst(%str(%addr(H__7(89))):12:272));
         wfrtn__ = AfToPage_(DISABLED);
         outweb_(%subst(%str(%addr(H__7(92))):44:8));
         wfrtn__ = AfToPage_(ACCTEMAIL1);
         outweb_(%subst(%str(%addr(H__7(92))):52:227));
         wfrtn__ = AfToPage_(DISABLED);
         outweb_(%subst(%str(%addr(H__7(95))):39:8));
         wfrtn__ = AfToPage_(ACCTEMAIL2);
         outweb_(%subst(%str(%addr(H__7(95))):47:227));
         wfrtn__ = AfToPage_(DISABLED);
         outweb_(%subst(%str(%addr(H__7(98))):34:8));
         wfrtn__ = AfToPage_(ACCTEMAIL3);
         outweb_(%subst(%str(%addr(H__7(98))):42:227));
         wfrtn__ = AfToPage_(DISABLED);
         outweb_(%subst(%str(%addr(H__7(101))):29:8));
         wfrtn__ = AfToPage_(ACCTEMAIL4);
         outweb_(%subst(%str(%addr(H__7(101))):37:227));
         wfrtn__ = AfToPage_(DISABLED);
         outweb_(%subst(%str(%addr(H__7(104))):24:8));
         wfrtn__ = AfToPage_(ACCTEMAIL5);
         outweb_(%subst(%str(%addr(H__7(104))):32:257));
         wfrtn__ = AfToPage_(%trim(%editw(ACCTCELL1:'   -   -    ')));
         outweb_(%subst(%str(%addr(H__7(107))):49:257));
         wfrtn__ = AfToPage_(%trim(%editw(ACCTCELL2:'   -   -    ')));
         outweb_(%subst(%str(%addr(H__7(110))):66:257));
         wfrtn__ = AfToPage_(%trim(%editw(ACCTCELL3:'   -   -    ')));
         outweb_(%subst(%str(%addr(H__7(114))):3:257));
         wfrtn__ = AfToPage_(%trim(%editw(ACCTCELL4:'   -   -    ')));
         outweb_(%subst(%str(%addr(H__7(117))):20:257));
         wfrtn__ = AfToPage_(%trim(%editw(ACCTCELL5:'   -   -    ')));
         outweb_(%subst(%str(%addr(H__7(120))):37:527));
         AfToPage_(%trim(%editc(RRN:'X')));
         outweb_(%subst(%str(%addr(H__7(127))):4:2892));
         return ;
        endif;
        SETLL  DL001_ RKWPRTO3;
        RS001_ = RcdSts2_('POSRCD':%error:%equal:%eof);
        if (RS001_ = '3');
         errmsg = 'ERROR: LOCATION EXISTS';
         Alert_(errmsg);
         outweb_(%subst(%str(%addr(H__7(1))):1:334));
         outweb_(%subst(%str(%addr(H__8(1))):1:2599));
         outweb_(%subst(%str(%addr(H__7(5))):15:529));
         wfrtn__ = AfToPage_(QPGMNAM__);
         outweb_(%subst(%str(%addr(H__7(11))):64:119));
         AfToPage_(%trim(%editc(RRN:'X')));
         outweb_(%subst(%str(%addr(H__7(13))):23:56));
         wfrtn__ = AfToPage_(SAVEDRRN);
         outweb_(%subst(%str(%addr(H__7(13))):79:968));
         wfrtn__ = AfToPage_(DISABLED);
         outweb_(%subst(%str(%addr(H__7(26))):7:8));
         wfrtn__ = AfToPage_(PRTO3ID);
         outweb_(%subst(%str(%addr(H__7(26))):15:230));
         wfrtn__ = AfToPage_(DISABLED);
         outweb_(%subst(%str(%addr(H__7(29))):5:8));
         wfrtn__ = AfToPage_(PRTO3N1);
         outweb_(%subst(%str(%addr(H__7(29))):13:291));
         wfrtn__ = AfToPage_(DISABLED);
         outweb_(%subst(%str(%addr(H__7(32))):64:8));
         wfrtn__ = AfToPage_(PRTO3A1);
         outweb_(%subst(%str(%addr(H__7(32))):72:235));
         wfrtn__ = AfToPage_(DISABLED);
         outweb_(%subst(%str(%addr(H__7(35))):67:8));
         wfrtn__ = AfToPage_(PRTO3A2);
         outweb_(%subst(%str(%addr(H__7(35))):75:242));
         wfrtn__ = AfToPage_(%trim(%editw(PRTO3PHON:'   -   -    ')));
         outweb_(%subst(%str(%addr(H__7(38))):77:232));
         wfrtn__ = AfToPage_(DISABLED);
         outweb_(%subst(%str(%addr(H__7(41))):69:8));
         wfrtn__ = AfToPage_(PRTO3CITY);
         outweb_(%subst(%str(%addr(H__7(41))):77:172));
         wrtprto3stbox0();
         outweb_(%subst(%str(%addr(H__7(44))):9:206));
         wfrtn__ = AfToPage_(DISABLED);
         outweb_(%subst(%str(%addr(H__7(46))):55:8));
         wfrtn__ = AfToPage_(%trim(%editw(PRTO3ZIP:'     -    ')));
         outweb_(%subst(%str(%addr(H__7(46))):63:238));
         wfrtn__ = AfToPage_(DISABLED);
         outweb_(%subst(%str(%addr(H__7(49))):61:8));
         AfToPage_(%trim(%editc(PRTO3ABA:'X')));
         outweb_(%subst(%str(%addr(H__7(49))):69:239));
         wfrtn__ = AfToPage_(DISABLED);
         outweb_(%subst(%str(%addr(H__7(52))):68:8));
         wfrtn__ = AfToPage_(PRTO3ACCT);
         outweb_(%subst(%str(%addr(H__7(52))):76:179));
         achtypebox0();
         outweb_(%subst(%str(%addr(H__7(55))):15:236));
         wfrtn__ = AfToPage_(DISABLED);
         outweb_(%subst(%str(%addr(H__7(58))):11:8));
         AfToPage_(%trim(%editc(PRTO3DELIV:'3')));
         outweb_(%subst(%str(%addr(H__7(58))):19:267));
         wfrtn__ = AfToPage_(DISABLED);
         outweb_(%subst(%str(%addr(H__7(61))):46:8));
         wfrtn__ = AfToPage_(DELEMAIL1);
         outweb_(%subst(%str(%addr(H__7(61))):54:224));
         wfrtn__ = AfToPage_(DISABLED);
         outweb_(%subst(%str(%addr(H__7(64))):38:8));
         wfrtn__ = AfToPage_(DELEMAIL2);
         outweb_(%subst(%str(%addr(H__7(64))):46:224));
         wfrtn__ = AfToPage_(DISABLED);
         outweb_(%subst(%str(%addr(H__7(67))):30:8));
         wfrtn__ = AfToPage_(DELEMAIL3);
         outweb_(%subst(%str(%addr(H__7(67))):38:224));
         wfrtn__ = AfToPage_(DISABLED);
         outweb_(%subst(%str(%addr(H__7(70))):22:8));
         wfrtn__ = AfToPage_(DELEMAIL4);
         outweb_(%subst(%str(%addr(H__7(70))):30:224));
         wfrtn__ = AfToPage_(DISABLED);
         outweb_(%subst(%str(%addr(H__7(73))):14:8));
         wfrtn__ = AfToPage_(DELEMAIL5);
         outweb_(%subst(%str(%addr(H__7(73))):22:254));
         wfrtn__ = AfToPage_(%trim(%editw(DELCELL1:'   -   -    ')));
         outweb_(%subst(%str(%addr(H__7(76))):36:254));
         wfrtn__ = AfToPage_(%trim(%editw(DELCELL2:'   -   -    ')));
         outweb_(%subst(%str(%addr(H__7(79))):50:254));
         wfrtn__ = AfToPage_(%trim(%editw(DELCELL3:'   -   -    ')));
         outweb_(%subst(%str(%addr(H__7(82))):64:254));
         wfrtn__ = AfToPage_(%trim(%editw(DELCELL4:'   -   -    ')));
         outweb_(%subst(%str(%addr(H__7(85))):78:254));
         wfrtn__ = AfToPage_(%trim(%editw(DELCELL5:'   -   -    ')));
         outweb_(%subst(%str(%addr(H__7(89))):12:272));
         wfrtn__ = AfToPage_(DISABLED);
         outweb_(%subst(%str(%addr(H__7(92))):44:8));
         wfrtn__ = AfToPage_(ACCTEMAIL1);
         outweb_(%subst(%str(%addr(H__7(92))):52:227));
         wfrtn__ = AfToPage_(DISABLED);
         outweb_(%subst(%str(%addr(H__7(95))):39:8));
         wfrtn__ = AfToPage_(ACCTEMAIL2);
         outweb_(%subst(%str(%addr(H__7(95))):47:227));
         wfrtn__ = AfToPage_(DISABLED);
         outweb_(%subst(%str(%addr(H__7(98))):34:8));
         wfrtn__ = AfToPage_(ACCTEMAIL3);
         outweb_(%subst(%str(%addr(H__7(98))):42:227));
         wfrtn__ = AfToPage_(DISABLED);
         outweb_(%subst(%str(%addr(H__7(101))):29:8));
         wfrtn__ = AfToPage_(ACCTEMAIL4);
         outweb_(%subst(%str(%addr(H__7(101))):37:227));
         wfrtn__ = AfToPage_(DISABLED);
         outweb_(%subst(%str(%addr(H__7(104))):24:8));
         wfrtn__ = AfToPage_(ACCTEMAIL5);
         outweb_(%subst(%str(%addr(H__7(104))):32:257));
         wfrtn__ = AfToPage_(%trim(%editw(ACCTCELL1:'   -   -    ')));
         outweb_(%subst(%str(%addr(H__7(107))):49:257));
         wfrtn__ = AfToPage_(%trim(%editw(ACCTCELL2:'   -   -    ')));
         outweb_(%subst(%str(%addr(H__7(110))):66:257));
         wfrtn__ = AfToPage_(%trim(%editw(ACCTCELL3:'   -   -    ')));
         outweb_(%subst(%str(%addr(H__7(114))):3:257));
         wfrtn__ = AfToPage_(%trim(%editw(ACCTCELL4:'   -   -    ')));
         outweb_(%subst(%str(%addr(H__7(117))):20:257));
         wfrtn__ = AfToPage_(%trim(%editw(ACCTCELL5:'   -   -    ')));
         outweb_(%subst(%str(%addr(H__7(120))):37:527));
         AfToPage_(%trim(%editc(RRN:'X')));
         outweb_(%subst(%str(%addr(H__7(127))):4:2892));
         return ;
        endif;
        if (PRTO3ZIP< 100000);
      /end-free
     C                   MOVE      PRTO3ZIP      pdozip5
      /free
         PRTO3ZIP = 0;
      /end-free
     C                   MOVEL     pdozip5       PRTO3ZIP
      /free
        endif;
        WRITE RKWPRTO3;
        RS001_ = RcdSts2_('WRTRCD': %error: %found: %eof);
       endif;
       if (rrn <> 0);
        rrn = %dec(aton_( getparm3_('rrn':'*MAND'):9:0):9:0);
        RR_001_ = rrn;
        AM001_ = CV_BYRRN;
        CHAIN(E) RR_001_ R__ARR001;
        RS001_ = RcdSts2_('GETRCD': %error: %found: %eof);
        prto3id = getparm3_('prto3id':'*OPT');
        prto3n1 = getparm3_('prto3n1':'*OPT');
        prto3n2 = getparm3_('prto3n2':'*OPT');
        prto3a1 = getparm3_('prto3a1':'*OPT');
        prto3a2 = getparm3_('prto3a2':'*OPT');
        prto3city = getparm3_('prto3city':'*OPT');
        prto3st = getparm3_('prto3st':'*OPT');
        PRTO3ZIP = %dec(aton_( getparm3_('PRTO3ZIP':'*OPT'):9:0):9:0);
        PRTO3ABA = %dec(aton_( getparm3_('PRTO3ABA':'*OPT'):9:0):9:0);
        prto3acct = getparm3_('prto3acct':'*OPT');
        prto3type = getparm3_('prto3type':'*OPT');
        PRTO3PHON = %dec(aton_( getparm3_('PRTO3PHON':'*OPT'):10:0):10:0);
        PRTO3DELIV = %dec(aton_( getparm3_('PRTO3DELIV':'*OPT'):11:2):11:2);
        if (prto3n1 = '');
         errmsg = 'ERROR: NAME CANNOT BE BLANK';
         Alert_(errmsg);
         outweb_(%subst(%str(%addr(H__7(1))):1:334));
         outweb_(%subst(%str(%addr(H__8(1))):1:2599));
         outweb_(%subst(%str(%addr(H__7(5))):15:529));
         wfrtn__ = AfToPage_(QPGMNAM__);
         outweb_(%subst(%str(%addr(H__7(11))):64:119));
         AfToPage_(%trim(%editc(RRN:'X')));
         outweb_(%subst(%str(%addr(H__7(13))):23:56));
         wfrtn__ = AfToPage_(SAVEDRRN);
         outweb_(%subst(%str(%addr(H__7(13))):79:968));
         wfrtn__ = AfToPage_(DISABLED);
         outweb_(%subst(%str(%addr(H__7(26))):7:8));
         wfrtn__ = AfToPage_(PRTO3ID);
         outweb_(%subst(%str(%addr(H__7(26))):15:230));
         wfrtn__ = AfToPage_(DISABLED);
         outweb_(%subst(%str(%addr(H__7(29))):5:8));
         wfrtn__ = AfToPage_(PRTO3N1);
         outweb_(%subst(%str(%addr(H__7(29))):13:291));
         wfrtn__ = AfToPage_(DISABLED);
         outweb_(%subst(%str(%addr(H__7(32))):64:8));
         wfrtn__ = AfToPage_(PRTO3A1);
         outweb_(%subst(%str(%addr(H__7(32))):72:235));
         wfrtn__ = AfToPage_(DISABLED);
         outweb_(%subst(%str(%addr(H__7(35))):67:8));
         wfrtn__ = AfToPage_(PRTO3A2);
         outweb_(%subst(%str(%addr(H__7(35))):75:242));
         wfrtn__ = AfToPage_(%trim(%editw(PRTO3PHON:'   -   -    ')));
         outweb_(%subst(%str(%addr(H__7(38))):77:232));
         wfrtn__ = AfToPage_(DISABLED);
         outweb_(%subst(%str(%addr(H__7(41))):69:8));
         wfrtn__ = AfToPage_(PRTO3CITY);
         outweb_(%subst(%str(%addr(H__7(41))):77:172));
         wrtprto3stbox0();
         outweb_(%subst(%str(%addr(H__7(44))):9:206));
         wfrtn__ = AfToPage_(DISABLED);
         outweb_(%subst(%str(%addr(H__7(46))):55:8));
         wfrtn__ = AfToPage_(%trim(%editw(PRTO3ZIP:'     -    ')));
         outweb_(%subst(%str(%addr(H__7(46))):63:238));
         wfrtn__ = AfToPage_(DISABLED);
         outweb_(%subst(%str(%addr(H__7(49))):61:8));
         AfToPage_(%trim(%editc(PRTO3ABA:'X')));
         outweb_(%subst(%str(%addr(H__7(49))):69:239));
         wfrtn__ = AfToPage_(DISABLED);
         outweb_(%subst(%str(%addr(H__7(52))):68:8));
         wfrtn__ = AfToPage_(PRTO3ACCT);
         outweb_(%subst(%str(%addr(H__7(52))):76:179));
         achtypebox0();
         outweb_(%subst(%str(%addr(H__7(55))):15:236));
         wfrtn__ = AfToPage_(DISABLED);
         outweb_(%subst(%str(%addr(H__7(58))):11:8));
         AfToPage_(%trim(%editc(PRTO3DELIV:'3')));
         outweb_(%subst(%str(%addr(H__7(58))):19:267));
         wfrtn__ = AfToPage_(DISABLED);
         outweb_(%subst(%str(%addr(H__7(61))):46:8));
         wfrtn__ = AfToPage_(DELEMAIL1);
         outweb_(%subst(%str(%addr(H__7(61))):54:224));
         wfrtn__ = AfToPage_(DISABLED);
         outweb_(%subst(%str(%addr(H__7(64))):38:8));
         wfrtn__ = AfToPage_(DELEMAIL2);
         outweb_(%subst(%str(%addr(H__7(64))):46:224));
         wfrtn__ = AfToPage_(DISABLED);
         outweb_(%subst(%str(%addr(H__7(67))):30:8));
         wfrtn__ = AfToPage_(DELEMAIL3);
         outweb_(%subst(%str(%addr(H__7(67))):38:224));
         wfrtn__ = AfToPage_(DISABLED);
         outweb_(%subst(%str(%addr(H__7(70))):22:8));
         wfrtn__ = AfToPage_(DELEMAIL4);
         outweb_(%subst(%str(%addr(H__7(70))):30:224));
         wfrtn__ = AfToPage_(DISABLED);
         outweb_(%subst(%str(%addr(H__7(73))):14:8));
         wfrtn__ = AfToPage_(DELEMAIL5);
         outweb_(%subst(%str(%addr(H__7(73))):22:254));
         wfrtn__ = AfToPage_(%trim(%editw(DELCELL1:'   -   -    ')));
         outweb_(%subst(%str(%addr(H__7(76))):36:254));
         wfrtn__ = AfToPage_(%trim(%editw(DELCELL2:'   -   -    ')));
         outweb_(%subst(%str(%addr(H__7(79))):50:254));
         wfrtn__ = AfToPage_(%trim(%editw(DELCELL3:'   -   -    ')));
         outweb_(%subst(%str(%addr(H__7(82))):64:254));
         wfrtn__ = AfToPage_(%trim(%editw(DELCELL4:'   -   -    ')));
         outweb_(%subst(%str(%addr(H__7(85))):78:254));
         wfrtn__ = AfToPage_(%trim(%editw(DELCELL5:'   -   -    ')));
         outweb_(%subst(%str(%addr(H__7(89))):12:272));
         wfrtn__ = AfToPage_(DISABLED);
         outweb_(%subst(%str(%addr(H__7(92))):44:8));
         wfrtn__ = AfToPage_(ACCTEMAIL1);
         outweb_(%subst(%str(%addr(H__7(92))):52:227));
         wfrtn__ = AfToPage_(DISABLED);
         outweb_(%subst(%str(%addr(H__7(95))):39:8));
         wfrtn__ = AfToPage_(ACCTEMAIL2);
         outweb_(%subst(%str(%addr(H__7(95))):47:227));
         wfrtn__ = AfToPage_(DISABLED);
         outweb_(%subst(%str(%addr(H__7(98))):34:8));
         wfrtn__ = AfToPage_(ACCTEMAIL3);
         outweb_(%subst(%str(%addr(H__7(98))):42:227));
         wfrtn__ = AfToPage_(DISABLED);
         outweb_(%subst(%str(%addr(H__7(101))):29:8));
         wfrtn__ = AfToPage_(ACCTEMAIL4);
         outweb_(%subst(%str(%addr(H__7(101))):37:227));
         wfrtn__ = AfToPage_(DISABLED);
         outweb_(%subst(%str(%addr(H__7(104))):24:8));
         wfrtn__ = AfToPage_(ACCTEMAIL5);
         outweb_(%subst(%str(%addr(H__7(104))):32:257));
         wfrtn__ = AfToPage_(%trim(%editw(ACCTCELL1:'   -   -    ')));
         outweb_(%subst(%str(%addr(H__7(107))):49:257));
         wfrtn__ = AfToPage_(%trim(%editw(ACCTCELL2:'   -   -    ')));
         outweb_(%subst(%str(%addr(H__7(110))):66:257));
         wfrtn__ = AfToPage_(%trim(%editw(ACCTCELL3:'   -   -    ')));
         outweb_(%subst(%str(%addr(H__7(114))):3:257));
         wfrtn__ = AfToPage_(%trim(%editw(ACCTCELL4:'   -   -    ')));
         outweb_(%subst(%str(%addr(H__7(117))):20:257));
         wfrtn__ = AfToPage_(%trim(%editw(ACCTCELL5:'   -   -    ')));
         outweb_(%subst(%str(%addr(H__7(120))):37:527));
         AfToPage_(%trim(%editc(RRN:'X')));
         outweb_(%subst(%str(%addr(H__7(127))):4:2892));
         return ;
        endif;
        if ((((((prto3a1 = '')) or ((prto3city = '')) or ((prto3st = '')) or
       ((PRTO3ZIP = 0))))));
         errmsg = 'ERROR: ADDRESS, CITY, STATE, AND ZIP REQUIRED';
         Alert_(errmsg);
         outweb_(%subst(%str(%addr(H__7(1))):1:334));
         outweb_(%subst(%str(%addr(H__8(1))):1:2599));
         outweb_(%subst(%str(%addr(H__7(5))):15:529));
         wfrtn__ = AfToPage_(QPGMNAM__);
         outweb_(%subst(%str(%addr(H__7(11))):64:119));
         AfToPage_(%trim(%editc(RRN:'X')));
         outweb_(%subst(%str(%addr(H__7(13))):23:56));
         wfrtn__ = AfToPage_(SAVEDRRN);
         outweb_(%subst(%str(%addr(H__7(13))):79:968));
         wfrtn__ = AfToPage_(DISABLED);
         outweb_(%subst(%str(%addr(H__7(26))):7:8));
         wfrtn__ = AfToPage_(PRTO3ID);
         outweb_(%subst(%str(%addr(H__7(26))):15:230));
         wfrtn__ = AfToPage_(DISABLED);
         outweb_(%subst(%str(%addr(H__7(29))):5:8));
         wfrtn__ = AfToPage_(PRTO3N1);
         outweb_(%subst(%str(%addr(H__7(29))):13:291));
         wfrtn__ = AfToPage_(DISABLED);
         outweb_(%subst(%str(%addr(H__7(32))):64:8));
         wfrtn__ = AfToPage_(PRTO3A1);
         outweb_(%subst(%str(%addr(H__7(32))):72:235));
         wfrtn__ = AfToPage_(DISABLED);
         outweb_(%subst(%str(%addr(H__7(35))):67:8));
         wfrtn__ = AfToPage_(PRTO3A2);
         outweb_(%subst(%str(%addr(H__7(35))):75:242));
         wfrtn__ = AfToPage_(%trim(%editw(PRTO3PHON:'   -   -    ')));
         outweb_(%subst(%str(%addr(H__7(38))):77:232));
         wfrtn__ = AfToPage_(DISABLED);
         outweb_(%subst(%str(%addr(H__7(41))):69:8));
         wfrtn__ = AfToPage_(PRTO3CITY);
         outweb_(%subst(%str(%addr(H__7(41))):77:172));
         wrtprto3stbox0();
         outweb_(%subst(%str(%addr(H__7(44))):9:206));
         wfrtn__ = AfToPage_(DISABLED);
         outweb_(%subst(%str(%addr(H__7(46))):55:8));
         wfrtn__ = AfToPage_(%trim(%editw(PRTO3ZIP:'     -    ')));
         outweb_(%subst(%str(%addr(H__7(46))):63:238));
         wfrtn__ = AfToPage_(DISABLED);
         outweb_(%subst(%str(%addr(H__7(49))):61:8));
         AfToPage_(%trim(%editc(PRTO3ABA:'X')));
         outweb_(%subst(%str(%addr(H__7(49))):69:239));
         wfrtn__ = AfToPage_(DISABLED);
         outweb_(%subst(%str(%addr(H__7(52))):68:8));
         wfrtn__ = AfToPage_(PRTO3ACCT);
         outweb_(%subst(%str(%addr(H__7(52))):76:179));
         achtypebox0();
         outweb_(%subst(%str(%addr(H__7(55))):15:236));
         wfrtn__ = AfToPage_(DISABLED);
         outweb_(%subst(%str(%addr(H__7(58))):11:8));
         AfToPage_(%trim(%editc(PRTO3DELIV:'3')));
         outweb_(%subst(%str(%addr(H__7(58))):19:267));
         wfrtn__ = AfToPage_(DISABLED);
         outweb_(%subst(%str(%addr(H__7(61))):46:8));
         wfrtn__ = AfToPage_(DELEMAIL1);
         outweb_(%subst(%str(%addr(H__7(61))):54:224));
         wfrtn__ = AfToPage_(DISABLED);
         outweb_(%subst(%str(%addr(H__7(64))):38:8));
         wfrtn__ = AfToPage_(DELEMAIL2);
         outweb_(%subst(%str(%addr(H__7(64))):46:224));
         wfrtn__ = AfToPage_(DISABLED);
         outweb_(%subst(%str(%addr(H__7(67))):30:8));
         wfrtn__ = AfToPage_(DELEMAIL3);
         outweb_(%subst(%str(%addr(H__7(67))):38:224));
         wfrtn__ = AfToPage_(DISABLED);
         outweb_(%subst(%str(%addr(H__7(70))):22:8));
         wfrtn__ = AfToPage_(DELEMAIL4);
         outweb_(%subst(%str(%addr(H__7(70))):30:224));
         wfrtn__ = AfToPage_(DISABLED);
         outweb_(%subst(%str(%addr(H__7(73))):14:8));
         wfrtn__ = AfToPage_(DELEMAIL5);
         outweb_(%subst(%str(%addr(H__7(73))):22:254));
         wfrtn__ = AfToPage_(%trim(%editw(DELCELL1:'   -   -    ')));
         outweb_(%subst(%str(%addr(H__7(76))):36:254));
         wfrtn__ = AfToPage_(%trim(%editw(DELCELL2:'   -   -    ')));
         outweb_(%subst(%str(%addr(H__7(79))):50:254));
         wfrtn__ = AfToPage_(%trim(%editw(DELCELL3:'   -   -    ')));
         outweb_(%subst(%str(%addr(H__7(82))):64:254));
         wfrtn__ = AfToPage_(%trim(%editw(DELCELL4:'   -   -    ')));
         outweb_(%subst(%str(%addr(H__7(85))):78:254));
         wfrtn__ = AfToPage_(%trim(%editw(DELCELL5:'   -   -    ')));
         outweb_(%subst(%str(%addr(H__7(89))):12:272));
         wfrtn__ = AfToPage_(DISABLED);
         outweb_(%subst(%str(%addr(H__7(92))):44:8));
         wfrtn__ = AfToPage_(ACCTEMAIL1);
         outweb_(%subst(%str(%addr(H__7(92))):52:227));
         wfrtn__ = AfToPage_(DISABLED);
         outweb_(%subst(%str(%addr(H__7(95))):39:8));
         wfrtn__ = AfToPage_(ACCTEMAIL2);
         outweb_(%subst(%str(%addr(H__7(95))):47:227));
         wfrtn__ = AfToPage_(DISABLED);
         outweb_(%subst(%str(%addr(H__7(98))):34:8));
         wfrtn__ = AfToPage_(ACCTEMAIL3);
         outweb_(%subst(%str(%addr(H__7(98))):42:227));
         wfrtn__ = AfToPage_(DISABLED);
         outweb_(%subst(%str(%addr(H__7(101))):29:8));
         wfrtn__ = AfToPage_(ACCTEMAIL4);
         outweb_(%subst(%str(%addr(H__7(101))):37:227));
         wfrtn__ = AfToPage_(DISABLED);
         outweb_(%subst(%str(%addr(H__7(104))):24:8));
         wfrtn__ = AfToPage_(ACCTEMAIL5);
         outweb_(%subst(%str(%addr(H__7(104))):32:257));
         wfrtn__ = AfToPage_(%trim(%editw(ACCTCELL1:'   -   -    ')));
         outweb_(%subst(%str(%addr(H__7(107))):49:257));
         wfrtn__ = AfToPage_(%trim(%editw(ACCTCELL2:'   -   -    ')));
         outweb_(%subst(%str(%addr(H__7(110))):66:257));
         wfrtn__ = AfToPage_(%trim(%editw(ACCTCELL3:'   -   -    ')));
         outweb_(%subst(%str(%addr(H__7(114))):3:257));
         wfrtn__ = AfToPage_(%trim(%editw(ACCTCELL4:'   -   -    ')));
         outweb_(%subst(%str(%addr(H__7(117))):20:257));
         wfrtn__ = AfToPage_(%trim(%editw(ACCTCELL5:'   -   -    ')));
         outweb_(%subst(%str(%addr(H__7(120))):37:527));
         AfToPage_(%trim(%editc(RRN:'X')));
         outweb_(%subst(%str(%addr(H__7(127))):4:2892));
         return ;
        endif;
        if (PRTO3ZIP< 100000);
      /end-free
     C                   MOVE      PRTO3ZIP      pdozip5
      /free
         PRTO3ZIP = 0;
      /end-free
     C                   MOVEL     pdozip5       PRTO3ZIP
      /free
        endif;
        RS001_ = UpdateRcd_('RKWPRTO3');
       endif;
       delemail1 = getparm3_('delemail1':'*OPT');
       DELCELL1 = %dec(aton_( getparm3_('DELCELL1':'*OPT'):10:0):10:0);
       delemail2 = getparm3_('delemail2':'*OPT');
       DELCELL2 = %dec(aton_( getparm3_('DELCELL2':'*OPT'):10:0):10:0);
       delemail3 = getparm3_('delemail3':'*OPT');
       DELCELL3 = %dec(aton_( getparm3_('DELCELL3':'*OPT'):10:0):10:0);
       delemail4 = getparm3_('delemail4':'*OPT');
       DELCELL4 = %dec(aton_( getparm3_('DELCELL4':'*OPT'):10:0):10:0);
       delemail5 = getparm3_('delemail5':'*OPT');
       DELCELL5 = %dec(aton_( getparm3_('DELCELL5':'*OPT'):10:0):10:0);
       prto3ctype = 'DELIVERY';
       PRTO3CSEQ = 1;
       AM002_ = CV_BYKEY;
       CHAIN(E) contkey RKWPRTO3C;
       RS002_ = RcdSts2_('GETRCD': %error: %found: %eof);
       prto3email = delemail1;
       PRTO3CELL = DELCELL1;
       if (RS002_ = '1');
        RS002_ = UpdateRcd_('RKWPRTO3C');
       else;
        WRITE RKWPRTO3C;
        RS002_ = RcdSts2_('WRTRCD': %error: %found: %eof);
       endif;
       PRTO3CSEQ = 2;
       AM002_ = CV_BYKEY;
       CHAIN(E) contkey RKWPRTO3C;
       RS002_ = RcdSts2_('GETRCD': %error: %found: %eof);
       prto3email = delemail2;
       PRTO3CELL = DELCELL2;
       if (RS002_ = '1');
        RS002_ = UpdateRcd_('RKWPRTO3C');
       else;
        WRITE RKWPRTO3C;
        RS002_ = RcdSts2_('WRTRCD': %error: %found: %eof);
       endif;
       PRTO3CSEQ = 3;
       AM002_ = CV_BYKEY;
       CHAIN(E) contkey RKWPRTO3C;
       RS002_ = RcdSts2_('GETRCD': %error: %found: %eof);
       prto3email = delemail3;
       PRTO3CELL = DELCELL3;
       if (RS002_ = '1');
        RS002_ = UpdateRcd_('RKWPRTO3C');
       else;
        WRITE RKWPRTO3C;
        RS002_ = RcdSts2_('WRTRCD': %error: %found: %eof);
       endif;
       PRTO3CSEQ = 4;
       AM002_ = CV_BYKEY;
       CHAIN(E) contkey RKWPRTO3C;
       RS002_ = RcdSts2_('GETRCD': %error: %found: %eof);
       prto3email = delemail4;
       PRTO3CELL = DELCELL4;
       if (RS002_ = '1');
        RS002_ = UpdateRcd_('RKWPRTO3C');
       else;
        WRITE RKWPRTO3C;
        RS002_ = RcdSts2_('WRTRCD': %error: %found: %eof);
       endif;
       PRTO3CSEQ = 5;
       AM002_ = CV_BYKEY;
       CHAIN(E) contkey RKWPRTO3C;
       RS002_ = RcdSts2_('GETRCD': %error: %found: %eof);
       prto3email = delemail5;
       PRTO3CELL = DELCELL5;
       if (RS002_ = '1');
        RS002_ = UpdateRcd_('RKWPRTO3C');
       else;
        WRITE RKWPRTO3C;
        RS002_ = RcdSts2_('WRTRCD': %error: %found: %eof);
       endif;
       acctemail1 = getparm3_('acctemail1':'*OPT');
       ACCTCELL1 = %dec(aton_( getparm3_('ACCTCELL1':'*OPT'):10:0):10:0);
       acctemail2 = getparm3_('acctemail2':'*OPT');
       ACCTCELL2 = %dec(aton_( getparm3_('ACCTCELL2':'*OPT'):10:0):10:0);
       acctemail3 = getparm3_('acctemail3':'*OPT');
       ACCTCELL3 = %dec(aton_( getparm3_('ACCTCELL3':'*OPT'):10:0):10:0);
       acctemail4 = getparm3_('acctemail4':'*OPT');
       ACCTCELL4 = %dec(aton_( getparm3_('ACCTCELL4':'*OPT'):10:0):10:0);
       acctemail5 = getparm3_('acctemail5':'*OPT');
       ACCTCELL5 = %dec(aton_( getparm3_('ACCTCELL5':'*OPT'):10:0):10:0);
       prto3ctype = 'ACCOUNTING';
       PRTO3CSEQ = 1;
       AM002_ = CV_BYKEY;
       CHAIN(E) contkey RKWPRTO3C;
       RS002_ = RcdSts2_('GETRCD': %error: %found: %eof);
       prto3email = acctemail1;
       PRTO3CELL = ACCTCELL1;
       if (RS002_ = '1');
        RS002_ = UpdateRcd_('RKWPRTO3C');
       else;
        WRITE RKWPRTO3C;
        RS002_ = RcdSts2_('WRTRCD': %error: %found: %eof);
       endif;
       PRTO3CSEQ = 2;
       AM002_ = CV_BYKEY;
       CHAIN(E) contkey RKWPRTO3C;
       RS002_ = RcdSts2_('GETRCD': %error: %found: %eof);
       prto3email = acctemail2;
       PRTO3CELL = ACCTCELL2;
       if (RS002_ = '1');
        RS002_ = UpdateRcd_('RKWPRTO3C');
       else;
        WRITE RKWPRTO3C;
        RS002_ = RcdSts2_('WRTRCD': %error: %found: %eof);
       endif;
       PRTO3CSEQ = 3;
       AM002_ = CV_BYKEY;
       CHAIN(E) contkey RKWPRTO3C;
       RS002_ = RcdSts2_('GETRCD': %error: %found: %eof);
       prto3email = acctemail3;
       PRTO3CELL = ACCTCELL3;
       if (RS002_ = '1');
        RS002_ = UpdateRcd_('RKWPRTO3C');
       else;
        WRITE RKWPRTO3C;
        RS002_ = RcdSts2_('WRTRCD': %error: %found: %eof);
       endif;
       PRTO3CSEQ = 4;
       AM002_ = CV_BYKEY;
       CHAIN(E) contkey RKWPRTO3C;
       RS002_ = RcdSts2_('GETRCD': %error: %found: %eof);
       prto3email = acctemail4;
       PRTO3CELL = ACCTCELL4;
       if (RS002_ = '1');
        RS002_ = UpdateRcd_('RKWPRTO3C');
       else;
        WRITE RKWPRTO3C;
        RS002_ = RcdSts2_('WRTRCD': %error: %found: %eof);
       endif;
       PRTO3CSEQ = 5;
       AM002_ = CV_BYKEY;
       CHAIN(E) contkey RKWPRTO3C;
       RS002_ = RcdSts2_('GETRCD': %error: %found: %eof);
       prto3email = acctemail5;
       PRTO3CELL = ACCTCELL5;
       if (RS002_ = '1');
        RS002_ = UpdateRcd_('RKWPRTO3C');
       else;
        WRITE RKWPRTO3C;
        RS002_ = RcdSts2_('WRTRCD': %error: %found: %eof);
       endif;
       Redirect2_('s_dlr3.pgm':'*SAME':'rand');
      /end-free
     c     *PSSR         begsr
     c                   endsr
     P                 E


     P*---------------------------------------------------------------------
     P* wrtprto3stbox0...           - User defined function
     P*---------------------------------------------------------------------
     P wrtprto3stbox0...
     P                 B
     D wrtprto3stbox0...
     D                 PI




      /free
       boxtype = 'SYSTEM';
       p_ztype = 'STATECODE';
       boxname = 'PRTO3ST';
       boxid = 'PRTO3ST';
       boxselect = prto3st;
       jvalidation = 'valState(''stateErr'');';
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
     P* achtypebox0...              - User defined function
     P*---------------------------------------------------------------------
     P achtypebox0...
     P                 B
     D achtypebox0...
     D                 PI




      /free
       boxtype = 'SYSTEM';
       p_ztype = 'ACH_ACTTYP';
       boxname = 'PRTO3TYPE';
       boxid = 'PRTO3TYPE';
       boxselect = prto3type;
       jvalidation = ' ';
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
       if   ((file__='KWPRTO3' or file__='*ALL') and NOT %OPEN(KWPRTO3));
        if (mbr__ <> '*FIRST');
         ovrdbf_(ovrflag__:'KWPRTO3':'KWPRTO3' : '*LIBL' : mbr__);
        elseif ('KWPRTO3' <> 'KWPRTO3');
         ovrdbf_(ovrflag__:'KWPRTO3':'KWPRTO3' : '*LIBL');
        endif;
        if    erropen__ = 'Y';
         OPEN(E) KWPRTO3;             //    KWPRTO3
         if        %error;
          return %error;
         endif;
        else;
         OPEN KWPRTO3;                //    KWPRTO3
        endif;
       endif;
       if   (file__='KWPRTO3' or file__='*ALL')  and NOT %OPEN(F__ARR001);
        ovrdbf_(ovrflag__:'F__ARR001':'KWPRTO3' : '*LIBL' : mbr__);
        if   erropen__ = 'Y';
         OPEN(E) F__ARR001;          //   KWPRTO3
         if        %error;
          return %error;
         endif;
        else;
         OPEN F__ARR001;            //    KWPRTO3
        endif;
       endif;
       if   ((file__='KWPRTO3C' or file__='*ALL') and NOT %OPEN(KWPRTO3C));
        if (mbr__ <> '*FIRST');
         ovrdbf_(ovrflag__:'KWPRTO3C':'KWPRTO3C' : '*LIBL' : mbr__);
        elseif ('KWPRTO3C' <> 'KWPRTO3C');
         ovrdbf_(ovrflag__:'KWPRTO3C':'KWPRTO3C' : '*LIBL');
        endif;
        if    erropen__ = 'Y';
         OPEN(E) KWPRTO3C;                //    KWPRTO3C
         if        %error;
          return %error;
         endif;
        else;
         OPEN KWPRTO3C;                //    KWPRTO3C
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
       when      rcdfmt__='RKWPRTO3' and AM001_ = CV_ByKey and RS001_ = *ON ;
       update RKWPRTO3;
       when      rcdfmt__='RKWPRTO3' and AM001_ = CV_ByRrn and RS001_ = *ON ;
       update R__ARR001;
       when      rcdfmt__='RKWPRTO3C' and AM002_ = CV_ByKey and RS002_ = *ON ;
       update RKWPRTO3C;
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
       when      rcdfmt__='RKWPRTO3' and AM001_ = CV_ByKey and RS001_ = *ON ;
       delete RKWPRTO3;
       when      rcdfmt__='RKWPRTO3' and AM001_ = CV_ByRrn and RS001_ = *ON ;
       delete R__ARR001;
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
System Settings: 3rd Party
**CTDATA H__1        ListHeader                       3383
                
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>
    <
meta name="generator" content="WebSmart" />
    <meta http-equiv="Pragma" conten
t="no-cache" />
    <title>System Settings:  3RD PARTY</title>
    <link rel="st
ylesheet" type="text/css" href="/websmart/kwikloan/styles/klstylei.css" media="s
creen, tv, projection" />
    <link rel="stylesheet" type="text/css" href="/webs
mart/kwikloan/styles/klstyleInquiry3.css" media="screen, tv, projection" />

<link rel="stylesheet" type="text/css" href="/websmart/kwikloan/styles/notificat
ions.css" media="screen, tv, projection" />
    <link rel="stylesheet" type="tex
t/css" href="/k_loan/s/tablesorter.css" media="screen, tv, projection" />
    <s
tyle type="text/css">
    #sections {
    border: 1px solid #9A9AA4;
    height:
 548px;
    margin-left: 10px;
    overflow-x: hidden;
    position: relative;

   width: 679px;
    }
    </style>
  </head>
  <body>
    <form action="" metho
d="get">
      <input type="hidden" name="TASK" value="POST">
      <div id="wra
pping">
        <div id="everything">
          <div id="pagetitle">

 <span>System Settings:  3RD PARTY &nbsp;&nbsp;-- </span>
            <span>: </
span>
          </div>
          <div id="whitebg" class="whitebg">

<!-- modal window boxes -->
            <div id="modalOverlay" style="display: n
one;"></div>
            <div id="modalContainer" style="display: none;">

        <div id="modalContent">
                <div class="modalHeader"><h3 id=
"headerText"></h3><a id="modalCloseA" class="modalCloseA" onclick="hideStuff2();
"><div id="modalCloseImg" class="modalCloseImg"></div></a></div>

 <div id="modalFrameDiv"></div>
              </div>
            </div>

    <!-- end modal window boxes -->
            
            <div class="left">

              
              <table class="actionsTable">
                <tr><t
d><a href="s_dlr3.pgm?task=beginmanage&rrn=0"><img src="https://sb4.compass-tech
nologies.com:8158/websmart/kwikloan/images/loanInqADD.png"></a><span class="LSla
bel"></span></td></tr>
              </table>
            </div><!--left-->

        
            <div class="right">
              
              <div id="m
sg1" class="msg" style="display: none;">
                <div id="msgSym1" class
="msgSym">
                  <table class="msgSymbol">
                    <tr><
td>&#33;</td></tr>
                  </table>
                </div>

     <div class="msgWrapper">
                  <table class="msgTable">

             <tr><td id="msg1" class="msgTxt">This application has successfully
been converted to an <span class="bold">OPEN LOAN</span>.</td></tr>

      </table>
                </div>
              </div><!-- msg1 -->

      
             
              <div id="sections">
                

        
                
                
                <table id="mainTable"
 class="tablesorter">
                <thead>
                <tr>

         <th>Action</th>
                    <th>3rd Party ID</th>

       <th>Name</th>
                    <th>Address</th>
                    <t
h>City/State/Zip</th>
                  </tr>   
                  </thead><tbod
y>      

**CTDATA H__2        ListDetails                      416
<tr class=""> 
  <td>
    <a href="?TASK=beginmanage&rrn=&FirstRowRRN=&PRTO3ID="
><img src="/websmart/v7.2/Lincoln/images/edit.gif"  alt="Edit" title="Edit"></a>

    <a href="?TASK=delconf&rrn=&FirstRowRRN=&PRTO3ID="><img src="/websmart/v7.2
/Lincoln/images/delete.gif" alt="Delete" title="Delete"></a>
  </td> 
  <td clas
s="text"></td>
  <td class="text"></td>
  <td class="text"></td>
  <td class="te
xt"></td>
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




**CTDATA H__5        DelChoice                        2467
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
                <td class="left">3RD PARTY ID.:</td>

       <td class="right"></td>
              </tr>
              <tr>

      <td class="left">Name:</td>
                <td class="right"></td>

        </tr> 
               <tr>
                <td COLSPAN="2">Are you SURE
you want to delete this record?</td>
              </tr>
              <tr>

            <td>
                  <a href="?task=del&rrn=&FirstRowRRN=">Yes</a>

                  &nbsp;&nbsp;
                  <a href="javascript:location.h
ref='s_dlr3.pgm>'">No</a>
                </td>
              </tr>

    </table>
            		
              </form>
            </div><!--editcont
ents-->
          </div></div></div>
    </body>
  </html>
  
  

**CTDATA H__6        RtnToList                        97
<input type="button" class="navbutton" value="Back" onclick="javascript:location
.href='?PDNO='"/>
**CTDATA H__7        RcdManage                        12975
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.or
g/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>
    <meta name="genera
tor" content="WebSmart" />
    <meta http-equiv="Pragma" content="no-cache" />

   <title>System Settings:  3RD PARTY - Add or Change</title>
    <style type="t
ext/css">
    
    </style>
    <script type="text/javascript" src="/websmart/kw
ikloan/javascript/klscripts.js"></script>
    <!-- removed klthemes.js reference
 -->
    <script type="text/javascript" src="/websmart/v7.2/javascript/esdiapi01
0.js"></script>
    <script type="text/javascript" src="/websmart/v8.8/javascrip
t/jquery.min.js"></script>
    
    <script type="text/javascript">
		xl_AttachE
vent(window, "load", WindowInit); 

		function WindowInit()
		{
			xl_FocusFirst
Element();
		}
	</script>
  </head>
  <body>
    <form action="" method="get">

     <input type="hidden" name="task" value="endmanage">
      <input type="hidd
en" name="rrn" value="">
      <input type="hidden" name="FirstRowRRN" value="">

  
   
      <div id="pagetitle">
        <span>System Settings:  3RD PARTY</sp
an>
        <div id="topBtns">
          <input type="submit" class="navbutton"
name="mode" value="Update"/>
          <input type="button" class="navbutton" va
lue="Cancel" onclick="javascript:location.href='s_dlr3.pgm'"/>
        </div>

    </div> 
      <div id="wrapping">
        
        
        
        

  
        <div id="whitebg">
          <!-- <div id="EDITtitle"><span>Edit Deal
er</span></div>-->
          <div id="EDITcontents"> 
            
            <
table id="holderTable">
              
              
              <tr>

         <th>Edit 3RD PARTY</th>
              </tr>
              <tr>

        <td class="holderTd">
                  <table class="dealerTable">

                <tr>
                      <td class="left">3RD PARTY ID:</td>

                     <td class="right"><input type="text" id="PRTO3ID" name="PRT
O3ID"  value="" style="width: 150px;"></td>
                    </tr>

          <tr>
                      <td class="left">Name:</td>

       <td class="right"><input type="text" name="PRTO3N1" size="40" maxlength="
40"  value="" style="width: 150px;"></td>
                    </tr>

         
                                 
                    <tr>

           <td class="left">Address 1:</td>
                      <td class="rig
ht"><input type="text" name="PRTO3A1" size="40" maxlength="40"  value="" style="
width: 150px;"></td>
                    </tr>
                    <tr>

              <td class="left">Address 2:</td>
                      <td class="
right"><input type="text" name="PRTO3A2" size="40" maxlength="40"  value="" styl
e="width: 150px;"></td>
                    </tr>
                    <tr>

                 <td class="left">Phone #:</td>
                      <td class=
"right"><input type="text" name="PRTO3PHON" size="22" maxlength="22" value="" st
yle="width: 150px;"></td>
                    </tr>
                    <tr>

                   <td class="left">City:</td>
                      <td class="
right"><input type="text" name="PRTO3CITY" size="30" maxlength="40"  value="" st
yle="width: 150px;"></td>
                    </tr>
                    <tr>

                   <td class="left">State:</td>
                      <td class=
"right"></td>
                    </tr>
                    <tr>

       <td class="left">Zip:</td>
                      <td class="right"><input
 type="text" name="PRTO3ZIP" size="10" maxlength="10"  value="" style="width: 15
0px;"></td>
                    </tr>
                     <tr>

      <td class="left">ABA Number:</td>
                      <td class="right">
<input type="text" name="PRTO3ABA" size="10" maxlength="10"  value="" style="wid
th: 150px;"></td>
                    </tr>
                    <tr>

           <td class="left">Acct Number:</td>
                      <td class="r
ight"><input type="text" name="PRTO3ACCT" size="17" maxlength="17"  value="" sty
le="width: 150px;"></td>
                    </tr>
                     <tr>

                   <td class="left">Account Type</td>
                      <td
class="right"></td>
                    </tr>
                    

       <tr>
                      <td class="left">Delivery Fee:</td>

            <td class="right"><input type="text" name="PRTO3DELIV" size="6" maxl
ength="6"  value="" style="width: 150px;"></td>
                    </tr>

              
                     <tr>
                      <td class="left">
Delivery Email 1:</td>
                      <td class="right"><input type="text
" name="DELEMAIL1" size="50" maxlength="250"  value=""></td>

 </tr>
                     <tr>
                      <td class="left">Delivery
 Email 2:</td>
                      <td class="right"><input type="text" name="
DELEMAIL2" size="50" maxlength="250"  value=""></td>
                    </tr> 

                    <tr>
                      <td class="left">Delivery Email 3
:</td>
                      <td class="right"><input type="text" name="DELEMAIL
3" size="50" maxlength="250"  value=""></td>
                    </tr>

            <tr>
                      <td class="left">Delivery Email 4:</td>

                     <td class="right"><input type="text" name="DELEMAIL4" size=
"50" maxlength="250"  value=""></td>
                    </tr>

    <tr>
                      <td class="left">Delivery Email 5:</td>

             <td class="right"><input type="text" name="DELEMAIL5" size="50" max
length="250"  value=""></td>
                    </tr>
                    

                 <tr>
                      <td class="left">Delivery Cell 1</td
>:</td>
                      <td class="right"><input type="text" name="DELCELL
1" size="22" maxlength="22" value="" style="width: 150px;"></td>

     </tr>
                    <tr>
                      <td class="left">Deliv
ery Cell 2</td>:</td>
                      <td class="right"><input type="text"
 name="DELCELL2" size="22" maxlength="22" value="" style="width: 150px;"></td>

                   </tr>
                    <tr>
                      <td clas
s="left">Delivery Cell 3</td>:</td>
                      <td class="right"><inp
ut type="text" name="DELCELL3" size="22" maxlength="22" value="" style="width: 1
50px;"></td>
                    </tr>
                    <tr>

      <td class="left">Delivery Cell 4</td>:</td>
                      <td clas
s="right"><input type="text" name="DELCELL4" size="22" maxlength="22" value="" s
tyle="width: 150px;"></td>
                    </tr>
                    <tr>

                    <td class="left">Delivery Cell 5</td>:</td>

      <td class="right"><input type="text" name="DELCELL5" size="22" maxlength="
22" value="" style="width: 150px;"></td>
                    </tr>

         
                     <tr>
                      <td class="left">Accou
nting Email 1:</td>
                      <td class="right"><input type="text" n
ame="ACCTEMAIL1" size="50" maxlength="250"  value=""></td>
                    <
/tr>
                     <tr>
                      <td class="left">Accounting
 Email 2:</td>
                      <td class="right"><input type="text" name="
ACCTEMAIL2" size="50" maxlength="250"  value=""></td>
                    </tr>

                    <tr>
                      <td class="left">Accounting Emai
l 3:</td>
                      <td class="right"><input type="text" name="ACCTE
MAIL3" size="50" maxlength="250"  value=""></td>
                    </tr>

                <tr>
                      <td class="left">Accounting Email 4:<
/td>
                      <td class="right"><input type="text" name="ACCTEMAIL4
" size="50" maxlength="250"  value=""></td>
                    </tr>

           <tr>
                      <td class="left">Accounting Email 5:</td>

                      <td class="right"><input type="text" name="ACCTEMAIL5" siz
e="50" maxlength="250"  value=""></td>
                    </tr>

     
                     <tr>
                      <td class="left">Accountin
g Cell 1</td>:</td>
                      <td class="right"><input type="text" n
ame="ACCTCELL1" size="22" maxlength="22" value="" style="width: 150px;"></td>

                  </tr>
                    <tr>
                      <td class
="left">Accounting Cell 2</td>:</td>
                      <td class="right"><in
put type="text" name="ACCTCELL2" size="22" maxlength="22" value="" style="width:
 150px;"></td>
                    </tr>
                    <tr>

        <td class="left">Accounting Cell 3</td>:</td>
                      <td
class="right"><input type="text" name="ACCTCELL3" size="22" maxlength="22" value
="" style="width: 150px;"></td>
                    </tr>
                    <t
r>
                      <td class="left">Accounting Cell 4</td>:</td>

             <td class="right"><input type="text" name="ACCTCELL4" size="22" max
length="22" value="" style="width: 150px;"></td>
                    </tr>

               <tr>
                      <td class="left">Accounting Cell 5</td
>:</td>
                      <td class="right"><input type="text" name="ACCTCEL
L5" size="22" maxlength="22" value="" style="width: 150px;"></td>

      </tr>
                     
                    <tr> 

  <td class="left">&nbsp;</td>
                      <td class="right">&nbsp;</t
d>
                    </tr>
                    
                    

           
                    
                  </table>
                </td
>
              </tr>
            </table>
            <div id="navbottom">

          
              <script type="text/javascript">
	var protkey = "";   
	
if( == 0)
	{
		
		xl_GetFormElementByName("mode").value = "Add";
	} 
	else 
	{
	
	protkey  = xl_GetFormElementByName("PRTO3ID");
		protkey.readOnly = true;
		pro
tkey.className = protkey.className + " disabled";
		xl_GetFormElementByName("mod
e").value = "Change";
	}
	function mask(inputString,textbox,delimiterLocations,d
elimeter){
//only allow numeric input
	var characterTyped = inputString.substrin
g(inputString.length - 1);
	if (characterTyped != '0'
		&& characterTyped != '1'

		&& characterTyped != '2'
		&& characterTyped != '3'
		&& characterTyped != '4
'
		&& characterTyped != '5'
		&& characterTyped != '6'
		&& characterTyped != '
7'
		&& characterTyped != '8'
		&& characterTyped != '9'
		&& characterTyped !=
'.')
	{
		textbox.value = inputString.substring(0,inputString.length - 1);
		ret
urn;
	}
	
	var locations = delimiterLocations.split(',');
	
	for (var i = 0; i <
= locations.length; i++)
	{
		for (var k = 0; k <= inputString.length; k++)
		{

			if (k == locations[i])
			{
				if (inputString.substring(k, k+1) != delimete
r)
				{
					inputString = inputString.substring(0,k) + delimeter + inputString
.substring(k,inputString.length);
				}
			}
		}
	}
	textbox.value = inputString
;
}
function numbersOnly(inputString,textbox){
	var characterTyped = inputString
.substring(inputString.length - 1);
	if (characterTyped != '0'
		&& characterTyp
ed != '1'
		&& characterTyped != '2'
		&& characterTyped != '3'
		&& characterTy
ped != '4'
		&& characterTyped != '5'
		&& characterTyped != '6'
		&& characterT
yped != '7'
		&& characterTyped != '8'
		&& characterTyped != '9'
		&& character
Typed != '.'
		&& characterTyped != '/')
	{
		textbox.value = inputString.substr
ing(0,inputString.length - 1);
		return;
	}	
}

function numbersOnlyF(inputStrin
g,textbox){
  var characterTyped = inputString.substring(inputString.length - 1)
;
  if (characterTyped != '0'
    && characterTyped != '1'
    && characterTyped
 != '2'
    && characterTyped != '3'
    && characterTyped != '4'
    && charact
erTyped != '5'
    && characterTyped != '6'
    && characterTyped != '7'
    &&
characterTyped != '8'
    && characterTyped != '9'
    && characterTyped != '.')

  {
    textbox.value = inputString.substring(0,inputString.length - 1);
    re
turn;
  } 
}

function numbersOnlyStrict(inputString,textbox){
  var characterTy
ped = inputString.substring(inputString.length - 1);
  if (characterTyped != '0'

    && characterTyped != '1'
    && characterTyped != '2'
    && characterTyped
 != '3'
    && characterTyped != '4'
    && characterTyped != '5'
    && charact
erTyped != '6'
    && characterTyped != '7'
    && characterTyped != '8'
    &&
characterTyped != '9')
  {
    textbox.value = inputString.substring(0,inputStri
ng.length - 1);
    return;
  } 
}
</script>
              
            </div>		

            
          </div><!--editcontents-->
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

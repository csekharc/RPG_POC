     H/TITLE  System Settings:  Producst
      * ProGen WebSmart Revision 21923
      * File overrides for compile command
      *__OV OVRDBF KWSCARDEFT KWSCARDEFT
      *__OV OVRDBF F__ARR001  KWSCARDEFT
      *__OV OVRDBF KWSCARD    KWSCARD
      *__OV OVRDBF KWSEFT     KWSEFT
      *__   Following values are used to create the server program
      *__RO Pgm  lib KWWEB      Pgm  S_BCARD
      *__AG          WEBSMART
      *__CL          *OBJLIBNAM
      *__BD ECRTBND195
      *===============================================================*
      * Path:   s_bcard.pdw
      * System: LAPTOP-Q2C0JE89
      * Project:Kwik-Loan
      * Set:    Development
      * User:   tvrba
      * Date Last Generated:   2017-07-17   08:47:00
      * Last Generated CRC: 1E212B45 FA6E4E6E A019D235 739A3183
      *===============================================================*
      */CPY *LIBL/PW_CSRC CPYRIGHT
      * File specifications
     FKWSCARDEFTUF A E           K DISK    USROPN
     F                                     INFDS(FID001_   )
     FF__ARR001 UF A E             DISK    USROPN
     F                                     RENAME(RKWSCARDEF   :R__ARR001   )
     FKWSCARD   IF   E           K DISK    USROPN
     F                                     INFDS(FID002_   )
     FKWSEFT    IF   E           K DISK    USROPN
     F                                     INFDS(FID003_   )

     D PTL__           S             50    DIM(1) CTDATA PERRCD(1)
     D RTLLA__         S             11    DIM(180)

     D*+FLDDCL Field declarations

     Duserdata         DS                  INZ
     D client                         5A
     D userid                        32A
     D location                       5A

     D rnd             S              6A
     D pagenum         S              5P 0
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


     D H__1            S             80    PERRCD(1) CTDATA DIM(40          )

     D H__2            S             80    PERRCD(1) CTDATA DIM(10          )

     D H__3            S             80    PERRCD(1) CTDATA DIM(11          )

     D H__4            S             80    PERRCD(1) CTDATA DIM(20          )

     D H__5            S             80    PERRCD(1) CTDATA DIM(3           )

     D H__6            S             80    PERRCD(1) CTDATA DIM(1           )

     D H__7            S             80    PERRCD(1) CTDATA DIM(44          )

     D H__8            S             80    PERRCD(1) CTDATA DIM(34          )

     D H__9            S             80    PERRCD(1) CTDATA DIM(1           )

     D H__10           S             80    PERRCD(1) CTDATA DIM(44          )

     D H__11           S             80    PERRCD(1) CTDATA DIM(44          )


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
     D aff_cardp0...
     D                 PR
     D QPGM__          S             21A
     D LstPmlErr_      S              4P 0 IMPORT
     D aff_bankp0...
     D                 PR
     D areyousurec0...
     D                 PR
     D areyousureb0...
     D                 PR
     D CURTIME__       S              6P 0
     D QPGMNAM__       S             20A
     D SmurfChk__      S              1A   INZ(*ON)
     D Smurf_ID__      S             64A   IMPORT
     D Smurf_Rw__      S              9B 0 IMPORT

     D prevpage        S                   LIKE(pagenum       )
     D nextpage        S                   LIKE(pagenum       )
     D fpcbin          S                   LIKE(cbin          )

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
     C                   KFLD                    cbin
     C                   KFLD                    irtnnbr
     C     DL001_        KLIST
     C                   KFLD                    cbin
     C                   KFLD                    irtnnbr
     C     DL002_        KLIST
     C                   KFLD                    cbin
     C     DL003_        KLIST
     C                   KFLD                    irtnnbr
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
       if (task__ = 'AFF_CARDP');
        taskran__ = *ON;
        aff_cardp0();
       endif ;
       if (task__ = 'AFF_BANKP');
        taskran__ = *ON;
        aff_bankp0();
       endif ;
       if (task__ = 'AREYOUSUREC');
        taskran__ = *ON;
        areyousurec0();
       endif ;
       if (task__ = 'AREYOUSUREB');
        taskran__ = *ON;
        areyousureb0();
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
       addhref = 'window.location=''s_bcard.pgm?task=beginmanage&rrn=0&rnd='
       + %trim(rnd) + '''';
       outweb_(%subst(%str(%addr(H__1(1))):1:974));
       wfrtn__ = AfToPage_(QPGMNAM__);
       outweb_(%subst(%str(%addr(H__1(13))):15:28));
       wfrtn__ = AfToPage_(RND);
       outweb_(%subst(%str(%addr(H__1(13))):43:193));
       wfrtn__ = AfToPage_(ADDHREF);
       outweb_(%subst(%str(%addr(H__1(15))):76:150));
       wfrtn__ = AfToPage_(QPGMNAM__);
       outweb_(%subst(%str(%addr(H__1(17))):66:15));
       AfToPage_(%trim(%editc(STARTRRN:'X')));
       outweb_(%subst(%str(%addr(H__1(18))):1:135));
       wfrtn__ = AfToPage_(QPGMNAM__);
       outweb_(%subst(%str(%addr(H__1(19))):56:5));
       AfToPage_(%trim(%editc(ENDRRN:'X')));
       outweb_(%subst(%str(%addr(H__1(19))):61:601));
       wfrtn__ = AfToPage_(QPGMNAM__);
       outweb_(%subst(%str(%addr(H__1(27))):22:1045));
       rcdcnt = 0;
       if (startrrn> 0);
        RR_001_ = startrrn;
        AM001_ = CV_BYRRN;
        CHAIN(NE) RR_001_ R__ARR001;
        RS001_ = RcdSts2_('GETRCD': %error: %found: %eof);
       endif;
       prevpage = %dec(aton_( getparm3_('prevpage':'*OPT'):46:16):5:0);
       nextpage = %dec(aton_( getparm3_('nextpage':'*OPT'):46:16):5:0);
       if (prevpage> 1);
        RR_001_ = prevpage - 1;
        AM001_ = CV_BYRRN;
        CHAIN(NE) RR_001_ R__ARR001;
        RS001_ = RcdSts2_('GETRCD': %error: %found: %eof);
       endif;
       if (nextpage> 0);
        RR_001_ = nextpage;
        AM001_ = CV_BYRRN;
        CHAIN(NE) RR_001_ R__ARR001;
        RS001_ = RcdSts2_('GETRCD': %error: %found: %eof);
       endif;
       cbin = '';
       fpcbin = getparm3_('fPCBIN':'*OPT');
       if (fpcbin <> '');
        cbin = fpcbin;
        irtnnbr = '';
       endif;
       SETLL  pfklist RKWSCARDEF;
       RS001_ = RcdSts2_('POSRCD':%error:%equal:%eof);
       READ(E)  RKWSCARDEF;
       RS001_ = RcdSts2_('GETNXTRCD':%error:%found:%eof);
       AM001_ = CV_ByKey;
       if (RS001_ <> '1');
        SETLL  *HIVAL RKWSCARDEF;
        RS001_ = RcdSts2_('POSRCD':%error:%equal:%eof);
        READ(E)  RKWSCARDEF;
        RS001_ = RcdSts2_('GETNXTRCD':%error:%found:%eof);
        AM001_ = CV_ByKey;
       endif;
       dow ((((RS001_ = '1')) and ((rcdcnt< listsize))));
       rrn = RR_001_;
       if (rcdcnt = 0);
        startrrn = RR_001_;
       endif;
       disphref = '<a href="s_bcard.pgm?TASK=disp&rrn=' + %trim(%editc(rrn:'P-
       ')) + '&FirstRowRRN=' + %trim(%editc(startrrn:'P')) + '"><img src="/we-
       bsmart/v7.2/Lincoln/images/view.gif" alt="Display" title="Display"></a-
       >';
       edithref = '<a href="s_bcard.pgm?TASK=beginmanage&rrn=' + %trim(
       %editc(rrn:'P')) + '&FirstRowRRN=' + %trim(%editc(startrrn:'P')) + '">-
       <img src="/websmart/v7.2/Lincoln/images/edit.gif"  alt="Edit" title="E-
       dit"></a>';
       delhref = '<a href="s_bcard.pgm?TASK=delconf&rrn=' + %trim(%editc(rrn:
       'P')) + '&FirstRowRRN=' + %trim(%editc(startrrn:'P')) + '"><img src="/-
       websmart/v7.2/Lincoln/images/delete.gif" alt="Delete" title="Delete"><-
       /a>';
       iname = '*** NOT FOUND ***';
       cbankname = '*** NOT FOUND ***';
       AM002_ = CV_BYKEY;
       CHAIN(NE) DL002_ RKWSCARD;
       RS002_ = RcdSts2_('GETRCD': %error: %found: %eof);
       AM003_ = CV_BYKEY;
       CHAIN(NE) DL003_ RKWSEFT;
       RS003_ = RcdSts2_('GETRCD': %error: %found: %eof);
       if (prevpage = 0);
        prevpage = RR_001_;
       endif;
       nextpage = RR_001_;
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
       outweb_(%subst(%str(%addr(H__2(5))):8:138));
       wfrtn__ = AfToPage_(QPGMNAM__);
       outweb_(%subst(%str(%addr(H__2(6))):66:15));
       AfToPage_(%trim(%editc(RRN:'X')));
       outweb_(%subst(%str(%addr(H__2(7))):1:13));
       AfToPage_(%trim(%editc(STARTRRN:'X')));
       outweb_(%subst(%str(%addr(H__2(7))):14:106));
       wfrtn__ = AfToPage_(EDITHREF);
       outweb_(%subst(%str(%addr(H__2(8))):40:7));
       wfrtn__ = AfToPage_(DELHREF);
       outweb_(%subst(%str(%addr(H__2(8))):47:38));
       wfrtn__ = AfToPage_(CBIN);
       outweb_(%subst(%str(%addr(H__2(9))):5:25));
       wfrtn__ = AfToPage_(CBANKNAME);
       outweb_(%subst(%str(%addr(H__2(9))):30:25));
       wfrtn__ = AfToPage_(IRTNNBR);
       outweb_(%subst(%str(%addr(H__2(9))):55:25));
       wfrtn__ = AfToPage_(INAME);
       outweb_(%subst(%str(%addr(H__2(9))):80:12));
       endrrn = RR_001_;
       rcdcnt = rcdcnt + 1;
       READ(E)  RKWSCARDEF;
       RS001_ = RcdSts2_('GETNXTRCD':%error:%found:%eof);
       AM001_ = CV_ByKey;
       enddo;
       RR_001_ = startrrn;
       AM001_ = CV_BYRRN;
       CHAIN(NE) RR_001_ R__ARR001;
       RS001_ = RcdSts2_('GETRCD': %error: %found: %eof);
       SETLL  pfklist RKWSCARDEF;
       RS001_ = RcdSts2_('POSRCD':%error:%equal:%eof);
       READP(E)  RKWSCARDEF;
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
        SETGT  pfklist RKWSCARDEF;
        RS001_ = RcdSts2_('POSRCD':%error:%equal:%eof);
        READ(E)  RKWSCARDEF;
        RS001_ = RcdSts2_('GETNXTRCD':%error:%found:%eof);
        AM001_ = CV_ByKey;
        if (RS001_ = '1');
         endrrn = RR_001_;
         nextstate = 1;
        endif;
       endif;
       outweb_(%subst(%str(%addr(H__3(1))):1:53));
       AfToPage_(%trim(%editc(PREVPAGE:'X')));
       outweb_(%subst(%str(%addr(H__3(1))):54:47));
       AfToPage_(%trim(%editc(NEXTPAGE:'X')));
       outweb_(%subst(%str(%addr(H__3(2))):21:228));
       AfToPage_(%trim(%editc(PREVSTATE:'P')));
       outweb_(%subst(%str(%addr(H__3(5))):9:142));
       wfrtn__ = AfToPage_(QPGMNAM__);
       outweb_(%subst(%str(%addr(H__3(6))):71:15));
       AfToPage_(%trim(%editc(STARTRRN:'X')));
       outweb_(%subst(%str(%addr(H__3(7))):6:36));
       wfrtn__ = AfToPage_(QPGMNAM__);
       outweb_(%subst(%str(%addr(H__3(7))):42:15));
       AfToPage_(%trim(%editc(STARTRRN:'X')));
       outweb_(%subst(%str(%addr(H__3(7))):57:52));
       AfToPage_(%trim(%editc(NEXTSTATE:'P')));
       outweb_(%subst(%str(%addr(H__3(8))):29:143));
       wfrtn__ = AfToPage_(QPGMNAM__);
       outweb_(%subst(%str(%addr(H__3(10))):12:18));
       AfToPage_(%trim(%editc(ENDRRN:'X')));
       outweb_(%subst(%str(%addr(H__3(10))):30:36));
       wfrtn__ = AfToPage_(QPGMNAM__);
       outweb_(%subst(%str(%addr(H__3(10))):66:18));
       AfToPage_(%trim(%editc(ENDRRN:'X')));
       outweb_(%subst(%str(%addr(H__3(11))):4:35));

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
       SETLL  pfklist RKWSCARDEF;
       RS001_ = RcdSts2_('POSRCD':%error:%equal:%eof);
       READP(E)  RKWSCARDEF;
       RS001_ = RcdSts2_('GETPRVRCD': %error: %found: %eof);
       AM001_ = CV_ByKey;
       rcdcnt = 1;
       dow ((((RS001_ = '1')) and ((rcdcnt< listsize))));
       rcdcnt = rcdcnt + 1;
       READP(E)  RKWSCARDEF;
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
       iname = '*** NOT FOUND ***';
       cbankname = '*** NOT FOUND ***';
       AM002_ = CV_BYKEY;
       CHAIN(NE) DL002_ RKWSCARD;
       RS002_ = RcdSts2_('GETRCD': %error: %found: %eof);
       AM003_ = CV_BYKEY;
       CHAIN(NE) DL003_ RKWSEFT;
       RS003_ = RcdSts2_('GETRCD': %error: %found: %eof);
       chain(N) DL002_ RKWSCARD;
       RS002_ = RcdSts2_('GETRCDN':%error: %found: %eof);
       chain(N) DL003_ RKWSEFT;
       RS003_ = RcdSts2_('GETRCDN':%error: %found: %eof);
       outweb_(%subst(%str(%addr(H__4(1))):1:1006));
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
       outweb_(%subst(%str(%addr(H__4(13))):47:129));
       wfrtn__ = AfToPage_(CBIN);
       outweb_(%subst(%str(%addr(H__4(15))):16:104));
       wfrtn__ = AfToPage_(CBANKNAME);
       outweb_(%subst(%str(%addr(H__4(16))):40:104));
       wfrtn__ = AfToPage_(IRTNNBR);
       outweb_(%subst(%str(%addr(H__4(17))):64:114));
       wfrtn__ = AfToPage_(INAME);
       outweb_(%subst(%str(%addr(H__4(19))):18:80));

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
       chain(N) DL002_ RKWSCARD;
       RS002_ = RcdSts2_('GETRCDN':%error: %found: %eof);
       chain(N) DL003_ RKWSEFT;
       RS003_ = RcdSts2_('GETRCDN':%error: %found: %eof);
       outweb_(%subst(%str(%addr(H__4(1))):1:1006));
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
       outweb_(%subst(%str(%addr(H__4(13))):47:129));
       wfrtn__ = AfToPage_(CBIN);
       outweb_(%subst(%str(%addr(H__4(15))):16:104));
       wfrtn__ = AfToPage_(CBANKNAME);
       outweb_(%subst(%str(%addr(H__4(16))):40:104));
       wfrtn__ = AfToPage_(IRTNNBR);
       outweb_(%subst(%str(%addr(H__4(17))):64:114));
       wfrtn__ = AfToPage_(INAME);
       outweb_(%subst(%str(%addr(H__4(19))):18:80));

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
        SETLL  pfklist RKWSCARDEF;
        RS001_ = RcdSts2_('POSRCD':%error:%equal:%eof);
        READP(E)  RKWSCARDEF;
        RS001_ = RcdSts2_('GETPRVRCD': %error: %found: %eof);
        AM001_ = CV_ByKey;
        savedrrn = %trim(%editc(RR_001_:'P'));
        RR_001_ = rrn;
        AM001_ = CV_BYRRN;
        CHAIN(E) RR_001_ R__ARR001;
        RS001_ = RcdSts2_('GETRCD': %error: %found: %eof);
       endif;
      /end-free
     C                   EVAL      RS001_ = DeleteRcd_('RKWSCARDEF')
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
       rrn = %dec(aton_( getparm3_('rrn':'*MAND'):46:16):9:0);
       savedrrn = getparm3_('FirstRowRRN':'*OPT');
       RR_001_ = rrn;
       AM001_ = CV_BYRRN;
       CHAIN(E) RR_001_ R__ARR001;
       RS001_ = RcdSts2_('GETRCD': %error: %found: %eof);
       if ((((cbin <> '')) and ((irtnnbr <> ''))));
        iname = '*** NOT FOUND ***';
        cbankname = '*** NOT FOUND ***';
        AM002_ = CV_BYKEY;
        CHAIN(NE) DL002_ RKWSCARD;
        RS002_ = RcdSts2_('GETRCD': %error: %found: %eof);
        AM003_ = CV_BYKEY;
        CHAIN(NE) DL003_ RKWSEFT;
        RS003_ = RcdSts2_('GETRCD': %error: %found: %eof);
       endif;
       outweb_(%subst(%str(%addr(H__7(1))):1:5));
       AfToPage_(%trim(%editc(JOBNBR__:'X')));
       outweb_(%subst(%str(%addr(H__7(1))):6:339));
       outweb_(%subst(%str(%addr(H__8(1))):1:2661));
       outweb_(%subst(%str(%addr(H__7(5))):25:576));
       AfToPage_(%trim(%editc(RRN:'X')));
       outweb_(%subst(%str(%addr(H__7(12))):41:378));
       wfrtn__ = AfToPage_(QPGMNAM__);
       outweb_(%subst(%str(%addr(H__7(17))):19:131));
       AfToPage_(%trim(%editc(RRN:'X')));
       outweb_(%subst(%str(%addr(H__7(18))):70:62));
       wfrtn__ = AfToPage_(SAVEDRRN);
       outweb_(%subst(%str(%addr(H__7(19))):52:1010));
       wfrtn__ = AfToPage_(CBIN);
       outweb_(%subst(%str(%addr(H__7(32))):22:136));
       wfrtn__ = AfToPage_(CBANKNAME);
       outweb_(%subst(%str(%addr(H__7(33))):78:207));
       wfrtn__ = AfToPage_(IRTNNBR);
       outweb_(%subst(%str(%addr(H__7(36))):45:136));
       wfrtn__ = AfToPage_(INAME);
       outweb_(%subst(%str(%addr(H__7(38))):21:483));

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
        cbin = getparm3_('cbin':'*OPT');
        irtnnbr = getparm3_('irtnnbr':'*OPT');
        WRITE RKWSCARDEF;
        RS001_ = RcdSts2_('WRTRCD': %error: %found: %eof);
       endif;
       if (mode = 'Change');
        rrn = %dec(aton_( getparm3_('rrn':'*MAND'):46:16):9:0);
        RR_001_ = rrn;
        AM001_ = CV_BYRRN;
        CHAIN(E) RR_001_ R__ARR001;
        RS001_ = RcdSts2_('GETRCD': %error: %found: %eof);
        cbin = getparm3_('cbin':'*OPT');
        irtnnbr = getparm3_('irtnnbr':'*OPT');
        RS001_ = UpdateRcd_('RKWSCARDEF');
       endif;
       Redirect2_( '?rrn=' + savedrrn:'*SAME':'rand');
      /end-free
     c     *PSSR         begsr
     c                   endsr
     P                 E


     P*---------------------------------------------------------------------
     P* aff_cardp0...               - User defined function
     P*---------------------------------------------------------------------
     P aff_cardp0...
     P                 B
     D aff_cardp0...
     D                 PI




      /free

      /end-free
     C                   EVAL      QPGM__=%trim('KWPGM'     ) + '/' + 'PAFF_C-
     C                             ARDP'
     C                   CALL      QPGM__                               90
     C                   PARM                    client
     C                   PARM                    userid
     C                   IF        *IN90 = '1'
     C                   EVAL      LstPmlErr_ = 1
     C                   ELSE
     C                   EVAL      LstPmlErr_ = 0
     C                   ENDIF
      /free
       displist0();
      /end-free
     c     *PSSR         begsr
     c                   endsr
     P                 E


     P*---------------------------------------------------------------------
     P* aff_bankp0...               - User defined function
     P*---------------------------------------------------------------------
     P aff_bankp0...
     P                 B
     D aff_bankp0...
     D                 PI




      /free

      /end-free
     C                   EVAL      QPGM__=%trim('KWPGM'     ) + '/' + 'PAFF_B-
     C                             ANKP'
     C                   CALL      QPGM__                               90
     C                   PARM                    client
     C                   PARM                    userid
     C                   IF        *IN90 = '1'
     C                   EVAL      LstPmlErr_ = 1
     C                   ELSE
     C                   EVAL      LstPmlErr_ = 0
     C                   ENDIF
      /free
       displist0();
      /end-free
     c     *PSSR         begsr
     c                   endsr
     P                 E


     P*---------------------------------------------------------------------
     P* areyousurec0...             - User defined function
     P*---------------------------------------------------------------------
     P areyousurec0...
     P                 B
     D areyousurec0...
     D                 PI




      /free
       outweb_(%subst(%str(%addr(H__10(1))):1:2806));
       wfrtn__ = AfToPage_(QPGMNAM__);
       outweb_(%subst(%str(%addr(H__10(36))):7:689));

      /end-free
     c     *PSSR         begsr
     c                   endsr
     P                 E


     P*---------------------------------------------------------------------
     P* areyousureb0...             - User defined function
     P*---------------------------------------------------------------------
     P areyousureb0...
     P                 B
     D areyousureb0...
     D                 PI




      /free
       outweb_(%subst(%str(%addr(H__11(1))):1:2819));
       wfrtn__ = AfToPage_(QPGMNAM__);
       outweb_(%subst(%str(%addr(H__11(36))):20:689));

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
       rtlla__(1) = 'KWSYS';

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
       if   ((file__='KWSCARDEFT' or file__='*ALL') and NOT %OPEN(KWSCARDEFT));
        if (mbr__ <> '*FIRST');
         ovrdbf_(ovrflag__:'KWSCARDEFT':'KWSCARDEFT' : '*LIBL' : mbr__);
        elseif ('KWSCARDEFT' <> 'KWSCARDEFT');
         ovrdbf_(ovrflag__:'KWSCARDEFT':'KWSCARDEFT' : '*LIBL');
        endif;
        if    erropen__ = 'Y';
         OPEN(E) KWSCARDEFT;             //    KWSCARDEFT
         if        %error;
          return %error;
         endif;
        else;
         OPEN KWSCARDEFT;                //    KWSCARDEFT
        endif;
       endif;
       if   (file__='KWSCARDEFT' or file__='*ALL')  and NOT %OPEN(F__ARR001);
        ovrdbf_(ovrflag__:'F__ARR001':'KWSCARDEFT' : '*LIBL' : mbr__);
        if   erropen__ = 'Y';
         OPEN(E) F__ARR001;          //   KWSCARDEFT
         if        %error;
          return %error;
         endif;
        else;
         OPEN F__ARR001;            //    KWSCARDEFT
        endif;
       endif;
       if   ((file__='KWSCARD' or file__='*ALL') and NOT %OPEN(KWSCARD));
        if (mbr__ <> '*FIRST');
         ovrdbf_(ovrflag__:'KWSCARD':'KWSCARD' : '*LIBL' : mbr__);
        elseif ('KWSCARD' <> 'KWSCARD');
         ovrdbf_(ovrflag__:'KWSCARD':'KWSCARD' : '*LIBL');
        endif;
        if    erropen__ = 'Y';
         OPEN(E) KWSCARD;                //    KWSCARD
         if        %error;
          return %error;
         endif;
        else;
         OPEN KWSCARD;                //    KWSCARD
        endif;
       endif;
       if   ((file__='KWSEFT' or file__='*ALL') and NOT %OPEN(KWSEFT));
        if (mbr__ <> '*FIRST');
         ovrdbf_(ovrflag__:'KWSEFT':'KWSEFT' : '*LIBL' : mbr__);
        elseif ('KWSEFT' <> 'KWSEFT');
         ovrdbf_(ovrflag__:'KWSEFT':'KWSEFT' : '*LIBL');
        endif;
        if    erropen__ = 'Y';
         OPEN(E) KWSEFT;                //    KWSEFT
         if        %error;
          return %error;
         endif;
        else;
         OPEN KWSEFT;                //    KWSEFT
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
       when      rcdfmt__='RKWSCARDEF' and AM001_ = CV_ByKey and RS001_ = *ON ;
       update RKWSCARDEF;
       when      rcdfmt__='RKWSCARDEF' and AM001_ = CV_ByRrn and RS001_ = *ON ;
       update R__ARR001;
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
       when      rcdfmt__='RKWSCARDEF' and AM001_ = CV_ByKey and RS001_ = *ON ;
       delete RKWSCARDEF;
       when      rcdfmt__='RKWSCARDEF' and AM001_ = CV_ByRrn and RS001_ = *ON ;
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
System Settings:  Producst
**CTDATA H__1        ListHeader                       3146
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.or
g/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>
    <meta name="genera
tor" content="WebSmart" />
    <meta http-equiv="Pragma" content="no-cache" />

   <title>System Settings:  Card/Bank</title>
        <link rel="stylesheet" typ
e="text/css" href="/websmart/kwikloan/styles/klstylei.css" media="screen, tv, pr
ojection" />
        <link rel="stylesheet" type="text/css" href="/websmart/kwik
loan/styles/klstyleInquiryList.css" media="screen, tv, projection" />
    <scrip
t type="text/javascript" src="/websmart/kwikloan/javascript/klscripts.js"></scri
pt>
  </head>
  <body>
    <div id="wrapping">
      <div id="everything">

   <div id="pagetitle">
          <span>Card/Bank</span>
        </div>  

  <div id="whitebg" class="whitebg">
          <div class="left">
            <t
able class="actionsTable">
                <!-- <tr><td><a href="#" onclick="win
dow.location='?task=beginmanage&rrn=0&rnd='"><img src="https://sb4.compass-techn
ologies.com:8158/websmart/kwikloan/images/modalIconsAN.png"></a><span class="LSl
abel"></span></td></tr>-->     
              <tr><td><a href="#" onclick=""><im
g src="/websmart/kwikloan/images/loanInqADD.png"></a><span class="LSlabel"></spa
n></td></tr>     
             <tr><td><a id="prevlinkbot" href="?task=prev&rrn=
" class="nonDisplay"><img src="/websmart/kwikloan/images/loanInqLSpp.png"> </a><
/td></tr> 
         <tr><td> <a id="nextlinkbot" href="?rrn=" class="nonDisplay"
><img src="/websmart/kwikloan/images/loanInqLSnp.png"></a> </td></tr>
        <t
r><td>
                   <button type="button" name="dlr_info" id="dlr_info" on
click="location.href='?task=areyousurec'; return false;">Process Past Due Paymen
ts-CARD</button>
                  </td></tr>
                  <tr><td>

            <button type="button" name="dlr_info" id="dlr_info" onclick="locatio
n.href='?task=areyousureb'; return false;">Process Past Due Payments-BANK</butto
n>
                  </td></tr>
        </table> 
            
           <form
method="get" action="">
              <input type="hidden" name="task" value="DE
FAULT">
              <table class="accountInfo" id="loanSearchTable">

       <tr>
                  <td id="Lname"><span class="LSlabel">Card BIN:</sp
an><br><input type="text" name="fpCBIN" size="6" maxlength="6"></td>

       </tr>
                  <tr>
                  <td><br><br><input type="s
ubmit" value="Filter Results"><br>
                  </td>
                  

                 
                </tr>
              </table> 
            </fo
rm>
            
          </div><!--left-->
          <div class="right">

       <div id="scroller">
              <div id="sections">
                <ul
>
                <li>
 
         
      <table class="mainlist">
        <tr>

         
          
          <th width="100">Action</th>
          <th width="
100">CARD BIN</th>
          <th width="250">Bank Name</th>
          <th width=
"100">Bank R/T#</th>
          <th width="250">Bank Name</th>
          

   
        </tr>

**CTDATA H__2        ListDetails                      731
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
       <a href="?TASK=disp&rrn=
&FirstRowRRN="><img src="/websmart/v7.2/Lincoln/images/view.gif" alt="Display" t
itle="Display"></a>
      
     
      
      
      </td>
  <td class="text rig
ht"></td>
  <td class="text"></td>
  <td class="text"></td>
  <td class="text"><
/td>
</tr>

**CTDATA H__3        ListFooter                       838
</table>
<input type="hidden" name="prevpage" value="">
<input type="hidden" nam
e="nextpage" value="">

</form>
</li>
</ul>
</div><!--sections-->
</div><!--scro
ller-->
</div><!--right-->
</div><!--whitebg-->
</div><!--everything-->
</div><!
--wrapping-->
<script type="text/javascript">

	// write the PREV link if necess
ary
	if( > 0)
	{
		xl_GetObj("prevlinktop").className ="prevlink";
		xl_GetObj("
prevlinkbot").className ="prevlink";
		xl_GetObj("prevlinktop").href="?task=prev
&rrn=";
		xl_GetObj("prevlinkbot").href="?task=prev&rrn=";
		
	}
	
	// write the
 NEXT link if necessary
	if( > 0) 
	{
		xl_GetObj("nextlinktop").className ="nex
tlink";
		xl_GetObj("nextlinkbot").className ="nextlink";
		xl_GetObj("nextlinkt
op").href="?task=default&rrn=";
		xl_GetObj("nextlinkbot").href="?task=default&r
rn=";
	}
	
</script>

</body>
</html>

**CTDATA H__4        RcdDisplay                       1537
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.or
g/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>
    <meta name="genera
tor" content="WebSmart" />
    <meta http-equiv="Pragma" content="no-cache" />

   <title>System Settings:  Card/Bank - Display</title>
        <link rel="style
sheet" type="text/css" href="/websmart/kwikloan/styles/klstylei.css" media="scre
en, tv, projection" />
    <script type="text/javascript" src="/websmart/kwikloa
n/javascript/klscripts.js"></script>
    <script type="text/javascript" src="/we
bsmart/kwikloan/javascript/klthemes.js"></script>
    <script type="text/javascr
ipt" src="/websmart/v7.2/javascript/esdiapi010.js"></script>
    
  </head>
  <b
ody>
    <div id="wrapping">
  <div id="everything">
  
  
  <div id="pagetitle"
>
  	<span>System Settings: Card/Bank</span>
  </div>
  
  <div id="whitebg">

<div id="EDITtitle"><span>View Card/Bank Settings</span></div>

    <div id="EDI
Tcontents"> 

      <div id="navtop">
        
        
      </div>
      <tabl
e>
        
        <tr>
          <td class="left">Card BIN:</td>
          <td
 class="right"></td>
        </tr>
        <tr>
          <td class="left">Bank
Name:</td>
          <td class="right"></td>
        </tr>
        <tr>

  <td class="left">Bank R/T#:</td>
          <td class="right"></td>
        </t
r>
         
        <tr>
          <td class="left">Bank Name:</td>
          <
td class="right"></td>
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
**CTDATA H__7        RcdManage                        3463
<!--  -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http:/
/www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>
    <meta na
me="generator" content="WebSmart" />
    <meta http-equiv="Pragma" content="no-c
ache" />
    <title>System Settings:  Card/Bank - Add or Change</title>
    <sty
le type="text/css">
    
    </style>
    <script type="text/javascript" src="/w
ebsmart/kwikloan/javascript/klscripts.js"></script>
    <script type="text/javas
cript" src="/websmart/kwikloan/javascript/klthemes.js"></script>
    <script typ
e="text/javascript" src="/websmart/v7.2/javascript/esdiapi010.js"></script>

<script type="text/javascript" src="/k_loan/jq/172.js"></script>
    <script typ
e="text/javascript">
		xl_AttachEvent(window, "load", WindowInit); 

		function
WindowInit()
		{
			xl_FocusFirstElement();
		}
		$(document).ready(function() {

			
				var protkey = "";   
							if( == 0)
							{
								xl_GetFormElemen
tByName("mode").value = "Add";
							} 
							else 
							{
								protkey
= xl_GetFormElementByName("CBIN");
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
    <div id="pagetitle">

     <span>System Settings: Card/Bank</span>
      <div id="topBtns">
        <i
nput type="submit" class="navbutton" name="mode" id="sbmbtn" value="Update">

     <script type="text/javascript">
						
							</script>
        
        <b
utton class="navbutton" onclick="javascript:location.href='s_prod.pgm;return fal
se;'">Cancel</button>
      </div>
    </div>
    <div id="wrapping">
      

   
      
      
      <div id="whitebg">
        
        
        <div id="ED
ITcontents"> 
         
            
            <table id="holderTable">

        
              
              <tr>
                <th>Card/Bank Setting
s</th>
              </tr>
              <tr>
                <td class="holderT
d">
                  <table class="dealerTable">
                    

           <tr>
                      <td class="left">Card BIN:</td>

            <td class="right"><input type="text" id="CBIN" name="CBIN" size="6"
maxlength="6" value=""></td>
                    </tr>
                    <tr>

        			  <td class="left">Bank Name:</td>
        			  <td class="right"></t
d>
        			</tr>
                    <tr>
                      <td class="le
ft">Bank R/T#:</td>
                      <td class="right"><input type="text" n
ame="IRTNNBR" size="9" maxlength="9" value=""></td>
                    </tr>

                  <tr>
          			<td class="left">Bank Name:</td>
          	
		<td class="right"></td>
        			</tr>
                    

                  </table>
                                </td>

               </tr>
                            </table>

      
                          </form>
                          

            </div><!--EDITcontents-->
                      </div>

       </div>
                    
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
**CTDATA H__10       aysc                             3495
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.or
g/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>
    <meta name="genera
tor" content="WebSmart" />
    <meta http-equiv="Pragma" content="no-cache" />

   
    <title>Process Past Due Payments</title>
    <link  rel="stylesheet" typ
e="text/css" href="//ajax.googleapis.com/ajax/libs/jqueryui/1.9.1/themes/smoothn
ess/jquery-ui.css" />
    <link rel="stylesheet" type="text/css" href="/websmart
/kwikloan/styles/klDFtheme.css" media="screen, tv, projection" title="default"/>

    <link rel="alternate stylesheet" type="text/css" href="/websmart/kwikloan/s
tyles/klBStheme.css" media="screen, tv, projection" title="bluesky"/>
    <link
rel="alternate stylesheet" type="text/css" href="/websmart/kwikloan/styles/klRDt
heme.css" media="screen, tv, projection" title="reddevil"/>
    <link rel="alter
nate stylesheet" type="text/css" href="/websmart/kwikloan/styles/klOCtheme.css"
media="screen, tv, projection" title="orangecrush"/>
    <link rel="stylesheet"
type="text/css" href="/websmart/kwikloan/styles/klstylei.css" media="screen, tv,
 projection" />
    
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.7
.2/jquery.min.js"></script>
	<script src="//ajax.googleapis.com/ajax/libs/jquery
ui/1.9.1/jquery-ui.min.js"></script>
    <script type="text/javascript" src="/we
bsmart/kwikloan/javascript/klscripts.js"></script>
    <script type="text/javasc
ript" src="/websmart/kwikloan/javascript/klthemes.js"></script>						
    <scrip
t type="text/javascript" src="compass/javascript/esdiapi011.js"></script>
    <s
cript type="text/javascript">
			xl_AttachEvent(window, "load", WindowInit); 
		
	
			function WindowInit()
			{
				xl_FocusFirstElement();
			}
		$(function(){

			$(".js-datepicker").datepicker();
		});
	</script>
  </head>
  <body nosplas
h>
    <div id="header"><h1>VERIFICATION</h1></div>
    <div id="ayscontents">

     <table width="90%">
        <tr>
          <td>
             <span style="f
ont-size: 12px;">You have selected the option to process past due payments for D
ebit Cards.  This will do the following:</span>
            <br/>
            <b
r/>
            
            <span style="font-size: 12px;">1. Process all past
due loans that are not bankrupt and do not have a pending promise to pay.</span>

            <br/>
            <span style="font-size: 12px;">2. Attempt to post
 a payment or past due amount if there is an active card on file. </span>

      <br/>

            <br/>
            <br/>
            
            	<br /
>
            	<br />
            </span>
            <span style="font-size: 13
px; color: #008cff; display:  ;">ARE YOU SURE YOU WANT TO POST THESE PAYMENTS?</
span>
          </td>
        </tr>
      </table>
      <center>
      <form ac
tion="" name="lncomp">
      <fieldset class="submit">
        <!--<input type="
button" value="Complete" class="margl" onclick="parent.closeSureWindow('Y');" />
-->
        <!--<input type="button" value="Complete" class="margl" onclick="win
dow.location.href='lncomp.pgm?task=endcomp'; parent.location.href='lnlist.pgm';"
 />-->
        <input style="display:  ;" type="submit" value="POST" class="marg
l" onclick="" />
        <!--<input type="button" value="Cancel" class="margl" o
nclick="parent.closeSureWindow();" />-->
        <br/>
        <br/>
        

      </fieldset>
       <input type="hidden" name="task" value="AFF_CARDP">

   </form>
      </center>
    </div>
  </body>
</html>
**CTDATA H__11       aysb                             3508
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.or
g/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>
    <meta name="genera
tor" content="WebSmart" />
    <meta http-equiv="Pragma" content="no-cache" />

   
    <title>Process Past Due Payments-Bank</title>
    <link  rel="stylesheet
" type="text/css" href="//ajax.googleapis.com/ajax/libs/jqueryui/1.9.1/themes/sm
oothness/jquery-ui.css" />
    <link rel="stylesheet" type="text/css" href="/web
smart/kwikloan/styles/klDFtheme.css" media="screen, tv, projection" title="defau
lt"/>
    <link rel="alternate stylesheet" type="text/css" href="/websmart/kwikl
oan/styles/klBStheme.css" media="screen, tv, projection" title="bluesky"/>
    <
link rel="alternate stylesheet" type="text/css" href="/websmart/kwikloan/styles/
klRDtheme.css" media="screen, tv, projection" title="reddevil"/>
    <link rel="
alternate stylesheet" type="text/css" href="/websmart/kwikloan/styles/klOCtheme.
css" media="screen, tv, projection" title="orangecrush"/>
    <link rel="stylesh
eet" type="text/css" href="/websmart/kwikloan/styles/klstylei.css" media="screen
, tv, projection" />
    
    <script src="//ajax.googleapis.com/ajax/libs/jquer
y/1.7.2/jquery.min.js"></script>
	<script src="//ajax.googleapis.com/ajax/libs/j
queryui/1.9.1/jquery-ui.min.js"></script>
    <script type="text/javascript" src
="/websmart/kwikloan/javascript/klscripts.js"></script>
    <script type="text/j
avascript" src="/websmart/kwikloan/javascript/klthemes.js"></script>						
    <
script type="text/javascript" src="compass/javascript/esdiapi011.js"></script>

   <script type="text/javascript">
			xl_AttachEvent(window, "load", WindowInit)
; 
			
			function WindowInit()
			{
				xl_FocusFirstElement();
			}
		$(functi
on(){
			$(".js-datepicker").datepicker();
		});
	</script>
  </head>
  <body no
splash>
    <div id="header"><h1>VERIFICATION</h1></div>
    <div id="ayscontent
s">
      <table width="90%">
        <tr>
          <td>
             <span sty
le="font-size: 12px;">You have selected the option to process past due payments
for valid bank accounts.  This will do the following:</span>
            <br/>

           <br/>
            
            <span style="font-size: 12px;">1. Proc
ess all past due loans that are not bankrupt and do not have a pending promise t
o pay.</span>
            <br/>
            <span style="font-size: 12px;">2. At
tempt to post a payment or past due amount if there is an active card on file. <
/span>
            <br/>

            <br/>
            <br/>
            

       	<br />
            	<br />
            </span>
            <span style="
font-size: 13px; color: #008cff; display:  ;">ARE YOU SURE YOU WANT TO POST THES
E PAYMENTS?</span>
          </td>
        </tr>
      </table>
      <center>

     <form action="" name="lncomp">
      <fieldset class="submit">
        <!--
<input type="button" value="Complete" class="margl" onclick="parent.closeSureWin
dow('Y');" />-->
        <!--<input type="button" value="Complete" class="margl"
 onclick="window.location.href='lncomp.pgm?task=endcomp'; parent.location.href='
lnlist.pgm';" />-->
        <input style="display:  ;" type="submit" value="POST
" class="margl" onclick="" />
        <!--<input type="button" value="Cancel" cl
ass="margl" onclick="parent.closeSureWindow();" />-->
        <br/>
        <br/
>
        
        </fieldset>
       <input type="hidden" name="task" value="AF
F_BANKP">
      </form>
      </center>
    </div>
  </body>
</html>

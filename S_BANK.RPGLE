     H/TITLE  System Settings:  Bank Accounts
      * ProGen WebSmart Revision 21923
      * File overrides for compile command
      *__OV OVRDBF KWPBANK    KWPBANK
      *__OV OVRDBF F__ARR001  KWPBANK
      *__OV OVRDBF KWP_DATA   KWP_DATA
      *__OV OVRDBF KWPUBASE   KWPUBASE
      *__   Following values are used to create the server program
      *__RO Pgm  lib KWWEB      Pgm  S_BANK
      *__AG          WEBSMART
      *__CL          *OBJLIBNAM
      *__BD ECRTBND195
      *===============================================================*
      * Path:   s_bank.pdw
      * System: LAPTOP-Q2C0JE89
      * Project:Kwik-Loan
      * Set:    Development
      * User:   tvrba
      * Date Last Generated:   2017-07-17   08:43:20
      * Last Generated CRC: 6569BC25 88E989FB 9B35F238 8B36C7DB
      *===============================================================*
      */CPY *LIBL/PW_CSRC CPYRIGHT
      * File specifications
     FKWPBANK   UF A E           K DISK    USROPN
     F                                     INFDS(FID001_   )
     F                                     RENAME(RKWPBANK     :RKWBANK     )
     FF__ARR001 UF A E             DISK    USROPN
     F                                     RENAME(RKWPBANK     :R__ARR001   )
     FKWP_DATA  IF   E           K DISK    USROPN
     F                                     INFDS(FID002_   )
     FKWPUBASE  IF   E           K DISK    USROPN
     F                                     INFDS(FID003_   )

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


     D H__1            S             80    PERRCD(1) CTDATA DIM(33          )

     D H__2            S             80    PERRCD(1) CTDATA DIM(8           )

     D H__3            S             80    PERRCD(1) CTDATA DIM(10          )

     D H__4            S             80    PERRCD(1) CTDATA DIM(45          )

     D H__5            S             80    PERRCD(1) CTDATA DIM(3           )

     D H__6            S             80    PERRCD(1) CTDATA DIM(1           )

     D H__7            S             80    PERRCD(1) CTDATA DIM(65          )

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
     D pbdepbox0...
     D                 PR
     D QPGM__          S             21A
     D LstPmlErr_      S              4P 0 IMPORT
     D pbcheckbox0...
     D                 PR
     D CURTIME__       S              6P 0
     D QPGMNAM__       S             20A
     D SmurfChk__      S              1A   INZ(*ON)
     D Smurf_ID__      S             64A   IMPORT
     D Smurf_Rw__      S              9B 0 IMPORT

     D boxselect       S                   LIKE(p_zkeya       )
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
     C                   KFLD                    pbbr
     C                   KFLD                    pbshort
     C     DL003_        KLIST
     C                   KFLD                    puid
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
       AM003_ = CV_BYKEY;
       CHAIN(NE) DL003_ RKWPUBASE;
       RS003_ = RcdSts2_('GETRCD': %error: %found: %eof);
       userprofile = puprofile;
       if (userprofile <> 'ADMINISTRATOR');
        addhref = '';
       else;
        addhref = 'window.location=''s_bank.pgm?task=beginmanage&rrn=0&rnd='
       + %trim(rnd) + '''';
       endif;
       PBBR = %dec(aton_( getparm3_('PBBR':'*OPT'):46:16):5:0);
       pbshort = getparm3_('PBSHORT':'*OPT');
       outweb_(%subst(%str(%addr(H__1(1))):1:981));
       wfrtn__ = AfToPage_(QPGMNAM__);
       outweb_(%subst(%str(%addr(H__1(13))):22:28));
       wfrtn__ = AfToPage_(RND);
       outweb_(%subst(%str(%addr(H__1(13))):50:195));
       wfrtn__ = AfToPage_(ADDHREF);
       outweb_(%subst(%str(%addr(H__1(16))):5:184));
       wfrtn__ = AfToPage_(QPGMNAM__);
       outweb_(%subst(%str(%addr(H__1(18))):29:1236));
       rcdcnt = 0;
       if (startrrn> 0);
        RR_001_ = startrrn;
        AM001_ = CV_BYRRN;
        CHAIN(NE) RR_001_ R__ARR001;
        RS001_ = RcdSts2_('GETRCD': %error: %found: %eof);
       endif;
       SETLL  pfklist RKWBANK;
       RS001_ = RcdSts2_('POSRCD':%error:%equal:%eof);
       READ(E)  RKWBANK;
       RS001_ = RcdSts2_('GETNXTRCD':%error:%found:%eof);
       AM001_ = CV_ByKey;
       if (RS001_ <> '1');
        SETLL  *HIVAL RKWBANK;
        RS001_ = RcdSts2_('POSRCD':%error:%equal:%eof);
        READ(E)  RKWBANK;
        RS001_ = RcdSts2_('GETNXTRCD':%error:%found:%eof);
        AM001_ = CV_ByKey;
       endif;
       dow ((((RS001_ = '1')) and ((rcdcnt< listsize))));
       rrn = RR_001_;
       if (rcdcnt = 0);
        startrrn = RR_001_;
       endif;
       disphref = '<a href="s_bank.pgm?TASK=disp&rrn=' + %trim(%editc(rrn:'P'
       )) + '&FirstRowRRN=' + %trim(%editc(startrrn:'P')) + '"><img src="/web-
       smart/v7.2/Lincoln/images/view.gif" alt="Display" title="Display"></a>-
       ';
       if (userprofile <> 'ADMINISTRATOR');
        edithref = '';
        delhref = '';
       else;
        edithref = '<a href="s_bank.pgm?TASK=beginmanage&rrn=' + %trim(
       %editc(rrn:'P')) + '&FirstRowRRN=' + %trim(%editc(startrrn:'P')) + '">-
       <img src="/websmart/v7.2/Lincoln/images/edit.gif"  alt="Edit" title="E-
       dit"></a>';
        delhref = '<a href="s_bank.pgm?TASK=delconf&rrn=' + %trim(%editc(rrn:
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
       outweb_(%subst(%str(%addr(H__2(1))):62:103));
       wfrtn__ = AfToPage_(QPGMNAM__);
       outweb_(%subst(%str(%addr(H__2(3))):5:22));
       AfToPage_(%trim(%editc(RRN:'X')));
       outweb_(%subst(%str(%addr(H__2(3))):27:13));
       AfToPage_(%trim(%editc(STARTRRN:'X')));
       outweb_(%subst(%str(%addr(H__2(3))):40:98));
       wfrtn__ = AfToPage_(QPGMNAM__);
       outweb_(%subst(%str(%addr(H__2(4))):58:18));
       AfToPage_(%trim(%editc(RRN:'X')));
       outweb_(%subst(%str(%addr(H__2(4))):76:13));
       AfToPage_(%trim(%editc(STARTRRN:'X')));
       outweb_(%subst(%str(%addr(H__2(5))):9:126));
       wfrtn__ = AfToPage_(EDITHREF);
       outweb_(%subst(%str(%addr(H__2(6))):55:7));
       wfrtn__ = AfToPage_(DELHREF);
       outweb_(%subst(%str(%addr(H__2(6))):62:38));
       AfToPage_(%trim(%editc(PBBR:'4')));
       outweb_(%subst(%str(%addr(H__2(7))):20:25));
       wfrtn__ = AfToPage_(PBSHORT);
       outweb_(%subst(%str(%addr(H__2(7))):45:25));
       wfrtn__ = AfToPage_(PBNAME);
       outweb_(%subst(%str(%addr(H__2(7))):70:25));
       wfrtn__ = AfToPage_(PBDESC);
       outweb_(%subst(%str(%addr(H__2(8))):15:12));
       endrrn = RR_001_;
       rcdcnt = rcdcnt + 1;
       READ(E)  RKWBANK;
       RS001_ = RcdSts2_('GETNXTRCD':%error:%found:%eof);
       AM001_ = CV_ByKey;
       enddo;
       RR_001_ = startrrn;
       AM001_ = CV_BYRRN;
       CHAIN(NE) RR_001_ R__ARR001;
       RS001_ = RcdSts2_('GETRCD': %error: %found: %eof);
       SETLL  pfklist RKWBANK;
       RS001_ = RcdSts2_('POSRCD':%error:%equal:%eof);
       READP(E)  RKWBANK;
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
        SETGT  pfklist RKWBANK;
        RS001_ = RcdSts2_('POSRCD':%error:%equal:%eof);
        READ(E)  RKWBANK;
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
       SETLL  pfklist RKWBANK;
       RS001_ = RcdSts2_('POSRCD':%error:%equal:%eof);
       READP(E)  RKWBANK;
       RS001_ = RcdSts2_('GETPRVRCD': %error: %found: %eof);
       AM001_ = CV_ByKey;
       rcdcnt = 1;
       dow ((((RS001_ = '1')) and ((rcdcnt< listsize))));
       rcdcnt = rcdcnt + 1;
       READP(E)  RKWBANK;
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
       outweb_(%subst(%str(%addr(H__4(1))):1:1608));
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
       outweb_(%subst(%str(%addr(H__4(21))):9:134));
       AfToPage_(%trim(%editc(PBBR:'4')));
       outweb_(%subst(%str(%addr(H__4(22))):63:107));
       wfrtn__ = AfToPage_(PBSHORT);
       outweb_(%subst(%str(%addr(H__4(24))):10:105));
       AfToPage_(%trim(%editc(PBRT:'4')));
       outweb_(%subst(%str(%addr(H__4(25))):35:111));
       AfToPage_(%trim(%editc(PBACCT:'4')));
       outweb_(%subst(%str(%addr(H__4(26))):66:109));
       AfToPage_(%trim(%editc(PBALEN:'4')));
       outweb_(%subst(%str(%addr(H__4(28))):15:114));
       wfrtn__ = AfToPage_(PBDESC);
       outweb_(%subst(%str(%addr(H__4(29))):49:104));
       wfrtn__ = AfToPage_(PBNAME);
       outweb_(%subst(%str(%addr(H__4(30))):73:115));
       wfrtn__ = AfToPage_(PBDEP);
       outweb_(%subst(%str(%addr(H__4(32))):28:107));
       wfrtn__ = AfToPage_(PBCHECK);
       outweb_(%subst(%str(%addr(H__4(33))):55:109));
       wfrtn__ = AfToPage_(%char(PBBDATE));
       outweb_(%subst(%str(%addr(H__4(35))):4:112));
       AfToPage_(%trim(%editc(PBBBAL:'J')));
       outweb_(%subst(%str(%addr(H__4(36))):36:106));
       wfrtn__ = AfToPage_(PBADDR);
       outweb_(%subst(%str(%addr(H__4(37))):62:104));
       wfrtn__ = AfToPage_(PBCITY);
       outweb_(%subst(%str(%addr(H__4(39))):6:105));
       wfrtn__ = AfToPage_(PBST);
       outweb_(%subst(%str(%addr(H__4(40))):31:103));
       AfToPage_(%trim(%editc(PBZIP:'4')));
       outweb_(%subst(%str(%addr(H__4(41))):54:113));
       AfToPage_(%trim(%editc(PBDRT:'4')));
       outweb_(%subst(%str(%addr(H__4(43))):7:106));
       AfToPage_(%trim(%editc(PBDTC:'4')));
       outweb_(%subst(%str(%addr(H__4(44))):33:113));

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
       outweb_(%subst(%str(%addr(H__4(1))):1:1608));
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
       outweb_(%subst(%str(%addr(H__4(21))):9:134));
       AfToPage_(%trim(%editc(PBBR:'4')));
       outweb_(%subst(%str(%addr(H__4(22))):63:107));
       wfrtn__ = AfToPage_(PBSHORT);
       outweb_(%subst(%str(%addr(H__4(24))):10:105));
       AfToPage_(%trim(%editc(PBRT:'4')));
       outweb_(%subst(%str(%addr(H__4(25))):35:111));
       AfToPage_(%trim(%editc(PBACCT:'4')));
       outweb_(%subst(%str(%addr(H__4(26))):66:109));
       AfToPage_(%trim(%editc(PBALEN:'4')));
       outweb_(%subst(%str(%addr(H__4(28))):15:114));
       wfrtn__ = AfToPage_(PBDESC);
       outweb_(%subst(%str(%addr(H__4(29))):49:104));
       wfrtn__ = AfToPage_(PBNAME);
       outweb_(%subst(%str(%addr(H__4(30))):73:115));
       wfrtn__ = AfToPage_(PBDEP);
       outweb_(%subst(%str(%addr(H__4(32))):28:107));
       wfrtn__ = AfToPage_(PBCHECK);
       outweb_(%subst(%str(%addr(H__4(33))):55:109));
       wfrtn__ = AfToPage_(%char(PBBDATE));
       outweb_(%subst(%str(%addr(H__4(35))):4:112));
       AfToPage_(%trim(%editc(PBBBAL:'J')));
       outweb_(%subst(%str(%addr(H__4(36))):36:106));
       wfrtn__ = AfToPage_(PBADDR);
       outweb_(%subst(%str(%addr(H__4(37))):62:104));
       wfrtn__ = AfToPage_(PBCITY);
       outweb_(%subst(%str(%addr(H__4(39))):6:105));
       wfrtn__ = AfToPage_(PBST);
       outweb_(%subst(%str(%addr(H__4(40))):31:103));
       AfToPage_(%trim(%editc(PBZIP:'4')));
       outweb_(%subst(%str(%addr(H__4(41))):54:113));
       AfToPage_(%trim(%editc(PBDRT:'4')));
       outweb_(%subst(%str(%addr(H__4(43))):7:106));
       AfToPage_(%trim(%editc(PBDTC:'4')));
       outweb_(%subst(%str(%addr(H__4(44))):33:113));

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
        SETLL  pfklist RKWBANK;
        RS001_ = RcdSts2_('POSRCD':%error:%equal:%eof);
        READP(E)  RKWBANK;
        RS001_ = RcdSts2_('GETPRVRCD': %error: %found: %eof);
        AM001_ = CV_ByKey;
        savedrrn = %trim(%editc(RR_001_:'P'));
        RR_001_ = rrn;
        AM001_ = CV_BYRRN;
        CHAIN(E) RR_001_ R__ARR001;
        RS001_ = RcdSts2_('GETRCD': %error: %found: %eof);
       endif;
      /end-free
     C                   EVAL      RS001_ = DeleteRcd_('RKWBANK')
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
       outweb_(%subst(%str(%addr(H__7(1))):1:333));
       outweb_(%subst(%str(%addr(H__8(1))):1:2601));
       outweb_(%subst(%str(%addr(H__7(5))):14:481));
       wfrtn__ = AfToPage_(QPGMNAM__);
       outweb_(%subst(%str(%addr(H__7(11))):15:123));
       AfToPage_(%trim(%editc(RRN:'X')));
       outweb_(%subst(%str(%addr(H__7(12))):58:58));
       wfrtn__ = AfToPage_(SAVEDRRN);
       outweb_(%subst(%str(%addr(H__7(13))):36:265));
       wfrtn__ = AfToPage_(SAVEDRRN);
       outweb_(%subst(%str(%addr(H__7(16))):61:539));
       AfToPage_(%trim(%editc(PBBR:'X')));
       outweb_(%subst(%str(%addr(H__7(23))):40:158));
       wfrtn__ = AfToPage_(PBSHORT);
       outweb_(%subst(%str(%addr(H__7(25))):38:176));
       AfToPage_(%trim(%editc(PBRT:'4')));
       outweb_(%subst(%str(%addr(H__7(27))):54:186));
       AfToPage_(%trim(%editc(PBACCT:'4')));
       outweb_(%subst(%str(%addr(H__7(29))):80:182));
       AfToPage_(%trim(%editc(PBALEN:'4')));
       outweb_(%subst(%str(%addr(H__7(32))):22:189));
       wfrtn__ = AfToPage_(PBDESC);
       outweb_(%subst(%str(%addr(H__7(34))):51:179));
       wfrtn__ = AfToPage_(PBNAME);
       outweb_(%subst(%str(%addr(H__7(36))):70:125));
       pbdepbox0();
       outweb_(%subst(%str(%addr(H__7(38))):35:115));
       pbcheckbox0();
       outweb_(%subst(%str(%addr(H__7(39))):70:183));
       wfrtn__ = AfToPage_(%char(PBBDATE));
       outweb_(%subst(%str(%addr(H__7(42))):13:187));
       AfToPage_(%trim(%editc(PBBBAL:'J')));
       outweb_(%subst(%str(%addr(H__7(44))):40:181));
       wfrtn__ = AfToPage_(PBADDR);
       outweb_(%subst(%str(%addr(H__7(46))):61:179));
       wfrtn__ = AfToPage_(PBCITY);
       outweb_(%subst(%str(%addr(H__7(48))):80:176));
       wfrtn__ = AfToPage_(PBST);
       outweb_(%subst(%str(%addr(H__7(51))):16:175));
       AfToPage_(%trim(%editc(PBZIP:'4')));
       outweb_(%subst(%str(%addr(H__7(53))):31:185));
       AfToPage_(%trim(%editc(PBDRT:'4')));
       outweb_(%subst(%str(%addr(H__7(55))):56:178));
       AfToPage_(%trim(%editc(PBDTC:'4')));
       outweb_(%subst(%str(%addr(H__7(57))):74:157));
       AfToPage_(%trim(%editc(RRN:'X')));
       outweb_(%subst(%str(%addr(H__7(59))):71:476));

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
        PBBR = %dec(aton_( getparm3_('PBBR':'*OPT'):46:16):5:0);
        pbshort = getparm3_('pbshort':'*OPT');
        PBRT = %dec(aton_( getparm3_('PBRT':'*OPT'):46:16):9:0);
        PBACCT = %dec(aton_( getparm3_('PBACCT':'*OPT'):46:16):15:0);
        PBALEN = %dec(aton_( getparm3_('PBALEN':'*OPT'):46:16):2:0);
        pbdesc = getparm3_('pbdesc':'*OPT');
        pbname = getparm3_('pbname':'*OPT');
        pbdep = getparm3_('pbdep':'*OPT');
        pbcheck = getparm3_('pbcheck':'*OPT');
        PBBDATE = AlpToDate_( getparm3_('PBBDATE':'*OPT'):'*ISO');
        PBBBAL = %dec(aton_( getparm3_('PBBBAL':'*OPT'):46:16):11:2);
        pbaddr = getparm3_('pbaddr':'*OPT');
        pbcity = getparm3_('pbcity':'*OPT');
        pbst = getparm3_('pbst':'*OPT');
        PBZIP = %dec(aton_( getparm3_('PBZIP':'*OPT'):46:16):9:0);
        PBDRT = %dec(aton_( getparm3_('PBDRT':'*OPT'):46:16):9:0);
        PBDTC = %dec(aton_( getparm3_('PBDTC':'*OPT'):46:16):5:0);
        WRITE RKWBANK;
        RS001_ = RcdSts2_('WRTRCD': %error: %found: %eof);
       endif;
       if (mode = 'Change');
        rrn = %dec(aton_( getparm3_('rrn':'*MAND'):46:16):9:0);
        RR_001_ = rrn;
        AM001_ = CV_BYRRN;
        CHAIN(E) RR_001_ R__ARR001;
        RS001_ = RcdSts2_('GETRCD': %error: %found: %eof);
        PBRT = %dec(aton_( getparm3_('PBRT':'*OPT'):46:16):9:0);
        PBACCT = %dec(aton_( getparm3_('PBACCT':'*OPT'):46:16):15:0);
        PBALEN = %dec(aton_( getparm3_('PBALEN':'*OPT'):46:16):2:0);
        pbdesc = getparm3_('pbdesc':'*OPT');
        pbname = getparm3_('pbname':'*OPT');
        pbdep = getparm3_('pbdep':'*OPT');
        pbcheck = getparm3_('pbcheck':'*OPT');
        PBBDATE = AlpToDate_( getparm3_('PBBDATE':'*OPT'):'*ISO');
        PBBBAL = %dec(aton_( getparm3_('PBBBAL':'*OPT'):46:16):11:2);
        pbaddr = getparm3_('pbaddr':'*OPT');
        pbcity = getparm3_('pbcity':'*OPT');
        pbst = getparm3_('pbst':'*OPT');
        PBZIP = %dec(aton_( getparm3_('PBZIP':'*OPT'):46:16):9:0);
        PBDRT = %dec(aton_( getparm3_('PBDRT':'*OPT'):46:16):9:0);
        PBDTC = %dec(aton_( getparm3_('PBDTC':'*OPT'):46:16):5:0);
        RS001_ = UpdateRcd_('RKWBANK');
       endif;
       Redirect2_( '?rrn=' + savedrrn:'*SAME':'rand');
      /end-free
     c     *PSSR         begsr
     c                   endsr
     P                 E


     P*---------------------------------------------------------------------
     P* pbdepbox0...                - User defined function
     P*---------------------------------------------------------------------
     P pbdepbox0...
     P                 B
     D pbdepbox0...
     D                 PI




      /free
       boxtype = 'SYSTEM';
       p_ztype = 'YESNO';
       boxname = 'PBDEP';
       boxid = 'PBDEP';
       boxselect = pbdep;
       jvalidation = '';
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
     P* pbcheckbox0...              - User defined function
     P*---------------------------------------------------------------------
     P pbcheckbox0...
     P                 B
     D pbcheckbox0...
     D                 PI




      /free
       boxtype = 'SYSTEM';
       p_ztype = 'YESNO';
       boxname = 'PBCHECK';
       boxid = 'PBCHECK';
       boxselect = pbcheck;
       jvalidation = '';
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
       if   ((file__='KWPBANK' or file__='*ALL') and NOT %OPEN(KWPBANK));
        if (mbr__ <> '*FIRST');
         ovrdbf_(ovrflag__:'KWPBANK':'KWPBANK' : '*LIBL' : mbr__);
        elseif ('KWPBANK' <> 'KWPBANK');
         ovrdbf_(ovrflag__:'KWPBANK':'KWPBANK' : '*LIBL');
        endif;
        if    erropen__ = 'Y';
         OPEN(E) KWPBANK;             //    KWPBANK
         if        %error;
          return %error;
         endif;
        else;
         OPEN KWPBANK;                //    KWPBANK
        endif;
       endif;
       if   (file__='KWPBANK' or file__='*ALL')  and NOT %OPEN(F__ARR001);
        ovrdbf_(ovrflag__:'F__ARR001':'KWPBANK' : '*LIBL' : mbr__);
        if   erropen__ = 'Y';
         OPEN(E) F__ARR001;          //   KWPBANK
         if        %error;
          return %error;
         endif;
        else;
         OPEN F__ARR001;            //    KWPBANK
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
       when      rcdfmt__='RKWBANK' and AM001_ = CV_ByKey and RS001_ = *ON ;
       update RKWBANK;
       when      rcdfmt__='RKWBANK' and AM001_ = CV_ByRrn and RS001_ = *ON ;
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
       when      rcdfmt__='RKWBANK' and AM001_ = CV_ByKey and RS001_ = *ON ;
       delete RKWBANK;
       when      rcdfmt__='RKWBANK' and AM001_ = CV_ByRrn and RS001_ = *ON ;
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
System Settings:  Bank Accounts
**CTDATA H__1        ListHeader                       2624
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.or
g/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>
    <meta name="genera
tor" content="WebSmart" />
    <meta http-equiv="Pragma" content="no-cache" />

   <title>System Settings:  Bank Accounts</title>
        <link rel="stylesheet"
 type="text/css" href="/websmart/kwikloan/styles/klstylei.css" media="screen, tv
, projection" />
         <link rel="stylesheet" type="text/css" href="/websmart
/kwikloan/styles/klstyleInquiryList.css" media="screen, tv, projection" />
    <
script type="text/javascript" src="/websmart/kwikloan/javascript/klscripts.js"><
/script>
  </head>
  <body>
    <div id="wrapping">
      <div id="everything">

        <div id="pagetitle">
          <span>Loan Search</span>
        </div>

        <div id="whitebg" class="whitebg">
          <div class="left">

     <table class="actionsTable">
                <!-- <tr><td><a href="#" oncli
ck="window.location='?task=beginmanage&rrn=0&rnd='"><img src="https://sb4.compas
s-technologies.com:8158/websmart/kwikloan/images/modalIconsAN.png"></a><span cla
ss="LSlabel"></span></td></tr>-->     
                <tr><td><a href="#" oncli
ck=""><img src="/websmart/kwikloan/images/loanInqADD.png"></a><span class="LSlab
el"></span></td></tr>     
           
        </table> 
            

 <form method="get" action="">
              <input type="hidden" name="task" va
lue="filter">
              <table class="accountInfo" id="loanSearchTable">

             <tr>
                  <td id="Lname"><span class="LSlabel">Branch
Number:</span><br><input type="text" name="PBBR" size="5" maxlength="5"></td>

                </tr>
                  
                <tr>

<td id="Lname"><span class="LSlabel">Bank Account:</span><br><input type="text"
name="PBSHORT" size="15" maxlength="15"></td>
                  </tr>

        <tr>
                  <td><br><br><input type="submit" value="Filter Re
sults"><br>
                  </td>
                </tr>
              </table>
 
            </form>
            
          </div><!--left-->
          <div cl
ass="right">
            <div id="scroller">
              <div id="sections">

               <ul>
                <li>
 
      <table class="mainlist">

  <tr>
          
          
          <th width="100">Action</th>
          <th
 width="50" valign="top">Branch Number</th>
          <th width="150">Bank Accou
nt</th>
          <th width="400">Bank Name</th>
          <th width="400">Accou
nt Description</th>
          
          
        </tr>

**CTDATA H__2        ListDetails                      586
<tr class="">
<!--  <td><a href="?TASK=disp&rrn=&FirstRowRRN="><img src="/websma
rt/v7.2/Lincoln/images/view.gif" alt="Display" title="Display"></a>
       <a hr
ef="?TASK=beginmanage&rrn=&FirstRowRRN="><img src="/websmart/v7.2/Lincoln/images
/edit.gif"  alt="Edit" title="Edit"></a>
       <a href="?TASK=delconf&rrn=&Firs
tRowRRN="><img src="/websmart/v7.2/Lincoln/images/delete.gif" alt="Delete" title
="Delete"></a>
     </td> -->
      <td>
      
      
      
      </td>
  <td
class="text right"></td>
  <td class="text"></td>
  <td class="text"></td>
  <td
 class="text"></td>
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

**CTDATA H__4        RcdDisplay                       3585
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.or
g/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>
    <meta name="genera
tor" content="WebSmart" />
    <meta http-equiv="Pragma" content="no-cache" />

   <title>System Settings:  Bank Accounts - Display</title>
<link rel="styleshee
t" type="text/css" href="/websmart/kwikloan/styles/klDFtheme.css" media="screen,
 tv, projection" title="default"/>
    <link rel="alternate stylesheet" type="te
xt/css" href="/websmart/kwikloan/styles/klBStheme.css" media="screen, tv, projec
tion" title="bluesky"/>
    <link rel="alternate stylesheet" type="text/css" hre
f="/websmart/kwikloan/styles/klRDtheme.css" media="screen, tv, projection" title
="reddevil"/>
    <link rel="alternate stylesheet" type="text/css" href="/websma
rt/kwikloan/styles/klOCtheme.css" media="screen, tv, projection" title="orangecr
ush"/>
        <link rel="stylesheet" type="text/css" href="/websmart/kwikloan/s
tyles/klstylei.css" media="screen, tv, projection" />
    <script type="text/jav
ascript" src="/websmart/kwikloan/javascript/klscripts.js"></script>
    <script
type="text/javascript" src="/websmart/kwikloan/javascript/klthemes.js"></script>

    <script type="text/javascript" src="/websmart/v7.2/javascript/esdiapi010.js
"></script>
    
  </head>
  <body>
        <div id="wrapping">
  <div id="every
thing">
  
  
  <div id="pagetitle">
  	<span>System Settings:  Bank Accounts</s
pan>
  </div>
  
  <div id="whitebg">
  <div id="EDITtitle"><span>View Bank Acco
unts Settings</span></div>
    <div id="EDITcontents"> 
      <div id="navtop">

        
        
      </div>
      <table>
        
        <tr>
          <td
 class="left">Branch Number:</td>
          <td class="right"></td>
        </tr
>
        <tr>
          <td class="left">Bank Account:</td>
          <td class
="right"></td>
        </tr>
        <tr>
          <td class="left">R/T Number:
</td>
          <td class="right"></td>
        </tr>
        <tr>
          <td
 class="left">Bank Account No.:</td>
          <td class="right"></td>
        <
/tr>
        <tr>
          <td class="left">Acct No Length:</td>
          <td
class="right"></td>
        </tr>
        <tr>
          <td class="left">Accoun
t Description:</td>
          <td class="right"></td>
        </tr>
        <tr>

          <td class="left">Bank Name:</td>
          <td class="right"></td>

      </tr>
        <tr>
          <td class="left">Make Branch Deposits:</td>

         <td class="right"></td>
        </tr>
        <tr>
          <td class=
"left">Print Checks:</td>
          <td class="right"></td>
        </tr>

  <tr>
          <td class="left">Last Stmt Date:</td>
          <td class="righ
t"></td>
        </tr>
        <tr>
          <td class="left">Last Stmt Balance
:</td>
          <td class="right"></td>
        </tr>
        <tr>
          <t
d class="left">Bank Addr 1:</td>
          <td class="right"></td>
        </tr>

        <tr>
          <td class="left">Bank City:</td>
          <td class="ri
ght"></td>
        </tr>
        <tr>
          <td class="left">Bank State:</td
>
          <td class="right"></td>
        </tr>
        <tr>
          <td cla
ss="left">Bank Zip:</td>
          <td class="right"></td>
        </tr>

 <tr>
          <td class="left">Deposit R/T Number:</td>
          <td class="r
ight"></td>
        </tr>
        <tr>
          <td class="left">Deposit T/C:</
td>
          <td class="right"></td>
        </tr>
      </table>
      
    </
div><!--editcontents-->
    </div></div></div>
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
**CTDATA H__7        RcdManage                        5186
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.or
g/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>
    <meta name="genera
tor" content="WebSmart" />
    <meta http-equiv="Pragma" content="no-cache" />

   <title>System Settings:  Bank Accounts - Add or Change</title>
<style type="t
ext/css">
   
   </style>
    <script type="text/javascript" src="/websmart/kwik
loan/javascript/klscripts.js"></script>
    <script type="text/javascript" src="
/websmart/kwikloan/javascript/klthemes.js"></script>
    <script type="text/java
script" src="/websmart/v7.2/javascript/esdiapi010.js"></script>
    <script type
="text/javascript">
		xl_AttachEvent(window, "load", WindowInit); 

		function W
indowInit()
		{
			xl_FocusFirstElement();
		}
	</script>
  </head>
  <body>

<form action="" method="get">
        <input type="hidden" name="task" value="en
dmanage">
        <input type="hidden" name="rrn" value="">
        <input type=
"hidden" name="FirstRowRRN" value="">
  
    <div id="pagetitle">
  	<span>Syste
m Settings:  Bank Accounts</span>
  	<div id="topBtns">
          <input type="s
ubmit" class="navbutton" name="mode" value="Update">
          
          <butto
n class="navbutton" onclick="javascript:location.href='?rrn=;return false;'">Can
cel</button>
        </div>
  </div>
  
    <div id="wrapping">
  
  <div id="wh
itebg">

    <div id="EDITcontents"> 
     
        
        <table id="holderTa
ble">
              
              
              <tr>
                <th>Bank
Settings</th>
              </tr>
              <tr>
                <td class="
holderTd">
        <table class="dealerTable">
        
          
          <tr
>
            <td class="left">Branch Number:</td>
            <td class="right"
><input type="text" name="PBBR" value=""></td>
          </tr>
          <tr>

          <td class="left">Bank Account:</td>
            <td class="right"><inp
ut type="text" name="PBSHORT" value=""></td>
          </tr>
          <tr>

        <td class="left">R/T Number:</td>
            <td class="right"><input t
ype="text" name="PBRT" size="9" maxlength="9" value=""></td>
          </tr>

       <tr>
            <td class="left">Bank Account No.:</td>
            <td
class="right"><input type="text" name="PBACCT" size="15" maxlength="15" value=""
></td>
          </tr>
          <tr>
            <td class="left">Acct No Lengt
h:</td>
            <td class="right"><input type="text" name="PBALEN" size="2"
maxlength="2" value=""></td>
          </tr>
          <tr>
            <td clas
s="left">Account Description:</td>
            <td class="right"><input type="te
xt" name="PBDESC" size="40" maxlength="40" value=""></td>
          </tr>

    <tr>
            <td class="left">Bank Name:</td>
            <td class="rig
ht"><input type="text" name="PBNAME" size="40" maxlength="40" value=""></td>

       </tr>
          <tr>
            <td class="left">Make Branch Deposits:</
td>
            <td class="right"></td>
          </tr>
          <tr>

   <td class="left">Print Checks:</td>
            <td class="right"></td>

     </tr>
          <tr>
            <td class="left">Last Stmt Date:</td>

        <td class="right"><input type="text" name="PBBDATE" size="10" maxlength=
"10" value=""></td>
          </tr>
          <tr>
            <td class="left">
Last Stmt Balance:</td>
            <td class="right"><input type="text" name="P
BBBAL" size="11" maxlength="11" value=""></td>
          </tr>
          <tr>

          <td class="left">Bank Addr 1:</td>
            <td class="right"><inpu
t type="text" name="PBADDR" size="40" maxlength="40" value=""></td>
          </
tr>
          <tr>
            <td class="left">Bank City:</td>
            <td
class="right"><input type="text" name="PBCITY" size="30" maxlength="30" value=""
></td>
          </tr>
          <tr>
            <td class="left">Bank State:</
td>
            <td class="right"><input type="text" name="PBST" size="2" maxlen
gth="2" value=""></td>
          </tr>
          <tr>
            <td class="lef
t">Bank Zip:</td>
            <td class="right"><input type="text" name="PBZIP"
size="9" maxlength="9" value=""></td>
          </tr>
          <tr>

 <td class="left">Deposit R/T Number:</td>
            <td class="right"><input
type="text" name="PBDRT" size="9" maxlength="9" value=""></td>
          </tr>

         <tr>
            <td class="left">Deposit T/C:</td>
            <td cla
ss="right"><input type="text" name="PBDTC" size="5" maxlength="5" value=""></td>

          </tr>	
        </table>
        	</td>
        	</tr>
        	</tabl
e>
        	<script type="text/javascript">
	var protkey = "";   
	if( == 0)
	{

		
		xl_GetFormElementByName("mode").value = "Add";
	} 
	else 
	{
		protkey  = x
l_GetFormElementByName("PBBR");
		protkey.disabled = true;
		protkey.className =
 protkey.className + " disabled";protkey  = xl_GetFormElementByName("PBSHORT");

		protkey.disabled = true;
		protkey.className = protkey.className + " disabled"
;
		xl_GetFormElementByName("mode").value = "Change";
	}
</script>	
      </form
>
    </div><!--editcontents-->
    </div></div>
  </body>
</html>
**CTDATA H__8        manageCSS                        2601
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



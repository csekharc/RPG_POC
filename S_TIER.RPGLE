     H/TITLE  System Settings:  Producst
      * ProGen WebSmart Revision 28963
      * File overrides for compile command
      *__OV OVRDBF KWPUBASE   KWPUBASE
      *__OV OVRDBF KWP_DATA   KWP_DATA
      *__OV OVRDBF KWPPGM     KWPPGM
      *__OV OVRDBF KWPUOPT    KWPUOPT
      *__OV OVRDBF KWS_DATA   KWS_DATA
      *__OV OVRDBF KWPDECRATE KWPDECRATE
      *__OV OVRDBF F__ARR006  KWPDECRATE
      *__OV OVRDBF KWPPBASE   KWPPBASE
      *__   Following values are used to create the server program
      *__RO Pgm  lib KWWEB      Pgm  S_TIER
      *__AG          WEBSMART
      *__CL          *OBJLIBNAM
      *__SQ
      *__BD ECRTBND204
      *===============================================================*
      * Path:   s_tier.pdw
      * System: DESKTOP-FBHFT7D
      * Project:Kwik-Loan
      * Set:    Development
      * User:   mzhang
      * Date Last Generated:   2018-08-06   11:24:14
      * Last Generated CRC: 4FA9DC61 953723C1 D6D7313B AD8232D0
      *===============================================================*
YK02  * AECP-2969 Y.Kumar SOX - Enable tier Code Screen for Roles that
YK02  *                   can Edit Dealer Settings
Yk02  * 06/23/2022        Modification Marker - YK02
      *===============================================================*
      */CPY *LIBL/PW_CSRC CPYRIGHT
      * File specifications
     FKWPUBASE  IF   E           K DISK    USROPN
     F                                     INFDS(FID001_   )
     FKWP_DATA  IF   E           K DISK    USROPN
     F                                     INFDS(FID002_   )
     FKWPPGM    IF   E           K DISK    USROPN
     F                                     INFDS(FID003_   )
     FKWPUOPT   IF   E           K DISK    USROPN
     F                                     INFDS(FID004_   )
     FKWS_DATA  IF   E           K DISK    USROPN
     F                                     INFDS(FID005_   )
     FKWPDECRATEUF A E           K DISK    USROPN
     F                                     INFDS(FID006_   )
     FF__ARR006 UF A E             DISK    USROPN
     F                                     RENAME(RKWPDECRAT   :R__ARR006   )
     FKWPPBASE  IF   E           K DISK    USROPN
     F                                     INFDS(FID007_   )

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
     D selstr          S           3200A   varying
     D selstring       S          12000A   varying
     D type            S              2A
Yk02 D wedtdlr         S              3A   inz
     D whrclause       S           2000A
     D pmtfct          S              3A
     D boxname         S             10A
     D boxid           S             10A
     D boxselect       S             25A
     D boxtype         S             10A
     D jvalidation     S             30A
     D blank           S              1A
     D pskdlrh         S              1A
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


     D H__1            S             80    PERRCD(1) CTDATA DIM(25          )

     D H__2            S             80    PERRCD(1) CTDATA DIM(7           )

     D H__3            S             80    PERRCD(1) CTDATA DIM(10          )

     D H__4            S             80    PERRCD(1) CTDATA DIM(50          )

     D H__5            S             80    PERRCD(1) CTDATA DIM(3           )

     D H__6            S             80    PERRCD(1) CTDATA DIM(1           )

     D H__7            S             80    PERRCD(1) CTDATA DIM(86          )

     D H__8            S             80    PERRCD(1) CTDATA DIM(34          )


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
     D prod1box0...
     D                 PR
     D prod2box0...
     D                 PR
     D prod3box0...
     D                 PR
     D prod4box0...
     D                 PR
     D CURTIME__       S              6P 0
     D QPGMNAM__       S             20A
     D SmurfChk__      S              1A   INZ(*ON)
     D Smurf_ID__      S             64A   IMPORT
     D Smurf_Rw__      S              9B 0 IMPORT

     D userprofile     S                   LIKE(puprofile     )
     D pdrfico1        S                   LIKE(pdrfico       )
     D pdrclrfr1       S                   LIKE(pdrclrfr      )
     D pdrdecile1      S                   LIKE(pdrdecile     )
     D pdrdisc1        S                   LIKE(pdrdisc       )
     D pdrprod1        S                   LIKE(pdrprod       )
     D pdrrate1        S                   LIKE(pdrrate       )
     D pdrfico2        S                   LIKE(pdrfico       )
     D pdrclrfr2       S                   LIKE(pdrclrfr      )
     D pdrdecile2      S                   LIKE(pdrdecile     )
     D pdrdisc2        S                   LIKE(pdrdisc       )
     D pdrprod2        S                   LIKE(pdrprod       )
     D pdrrate2        S                   LIKE(pdrrate       )
     D pdrfico3        S                   LIKE(pdrfico       )
     D pdrclrfr3       S                   LIKE(pdrclrfr      )
     D pdrdecile3      S                   LIKE(pdrdecile     )
     D pdrdisc3        S                   LIKE(pdrdisc       )
     D pdrprod3        S                   LIKE(pdrprod       )
     D pdrrate3        S                   LIKE(pdrrate       )
     D pdrfico4        S                   LIKE(pdrfico       )
     D pdrclrfr4       S                   LIKE(pdrclrfr      )
     D pdrdecile4      S                   LIKE(pdrdecile     )
     D pdrdisc4        S                   LIKE(pdrdisc       )
     D pdrprod4        S                   LIKE(pdrprod       )
     D pdrrate4        S                   LIKE(pdrrate       )

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

     C     pfklist       KLIST
     C                   KFLD                    pdrcode
     C     DL001_        KLIST
     C                   KFLD                    puid
     C     DL004_        KLIST
     C                   KFLD                    userid
     C                   KFLD                    puotype
     C     DL006_        KLIST
     C                   KFLD                    pdrcode
     C     DL007_        KLIST
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
       listsize = 1500;
       startrrn = %dec(aton_( getparm3_('rrn':'*OPT'):46:16):9:0);
YK02  /end-free
Yk02   wedtdlr   = *Blanks;
YK02  /free
YK02  /end-free
YK02 C/Exec SQL
YK02 C+  select RL_EDITDLR  into :wedtdlr
YK02 C+   from kwlrole WHERE RL_ROLEID =
YK02 C+   (select puvalue from kwpuopt where puid = :userid
YK02 C+  and puotype = 'USERROLE')
Yk02 C/End-Exec
YK02  /free
       if (task__ = 'DEFAULT');
        taskran__ = *ON;
        displist0();
       endif ;
       if (task__ = 'DISPLIST');
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
       AM001_ = CV_BYKEY;
       CHAIN(NE) DL001_ RKWPUBASE;
       RS001_ = RcdSts2_('GETRCD': %error: %found: %eof);
       userprofile = puprofile;
       puotype = 'ADDPGM';
       AM004_ = CV_BYKEY;
       CHAIN(NE) DL004_ RKWPUOPT;
       RS004_ = RcdSts2_('GETRCD': %error: %found: %eof);
       select;
 yk02  //when ((RS004_ = '1') and (puoyesno = 'N'));
 yk02  //addhref = '';
 yk02  //when ((puprofile <> 'ADMINISTRATOR') and (puoyesno <> 'Y'));
 yk02  when (wedtdlr <> 'Yes');
       addhref = '';
       other;
       addhref = 'window.location=''s_tier.pgm?task=beginmanage&rrn=0&rnd='
       + %trim(rnd) + '''';
       endsl;
       pdrcode = getparm3_('PDRCODE':'*OPT');
       outweb_(%subst(%str(%addr(H__1(1))):1:983));
       wfrtn__ = AfToPage_(QPGMNAM__);
       outweb_(%subst(%str(%addr(H__1(13))):24:28));
       wfrtn__ = AfToPage_(RND);
       outweb_(%subst(%str(%addr(H__1(13))):52:193));
       wfrtn__ = AfToPage_(ADDHREF);
       outweb_(%subst(%str(%addr(H__1(16))):5:784));
       rcdcnt = 0;
       puotype = 'EDITPGM';
       AM004_ = CV_BYKEY;
       CHAIN(NE) DL004_ RKWPUOPT;
       RS004_ = RcdSts2_('GETRCD': %error: %found: %eof);
       selstr = 'SELECT RRN(KWPDECRATE), KWPDECRATE.PDRCODE, KWPDECRATE.PDRDE-
       SC FROM KWPDECRATE WHERE KWPDECRATE.PDRFICO in( 680, 1) FOR FETCH ONLY-
       ';
      /end-free
     C/Exec SQL
     C+            Declare MC Scroll Cursor
     C+            For MC
     C/End-Exec
     C/Exec SQL
     C+            Prepare MC
     C+            From :selstr
     C/End-Exec
      /free
       if (sqlcod >= 0);
      /end-free
     C/Exec SQL
     C+            Open MC
     C/End-Exec
      /free
       endif;
      /end-free
     C/Exec SQL
     C+  FETCH NEXT FROM MC INTO :rrn, :PDRCODE, :PDRDESC
     C/End-Exec
      /free
       dow (((((sqlcod <> 100) and (sqlcod >= 0)) and ((rcdcnt< listsize)))));
       rrn = rrn;
       if (rcdcnt = 0);
        startrrn = rrn;
       endif;
       disphref = '<a href="s_tier.pgm?TASK=disp&rrn=' + %trim(%editc(rrn:'P'
       )) + '&FirstRowRRN=' + %trim(%editc(startrrn:'P')) + '"><img src="/web-
       smart/v7.2/Lincoln/images/view.gif" alt="Display" title="Display"></a>-
       ';
       select;
 yk02  //when ((RS004_ = '1') and (puoyesno = 'N'));
       //edithref = '';
       //delhref = '';
 yk02  //when ((puprofile <> 'ADMINISTRATOR') and (puoyesno <> 'Y'));
 yk02  when (wedtdlr <> 'Yes');
       edithref = '';
       delhref = '';
       other;
       edithref = '<a href="s_tier.pgm?TASK=beginmanage&rrn=' + %trim(%editc(
       rrn:'P')) + '&FirstRowRRN=' + %trim(%editc(startrrn:'P')) + '"><img sr-
       c="/websmart/v7.2/Lincoln/images/edit.gif"  alt="Edit" title="Edit"></-
       a>';
       delhref = '<a href="s_tier.pgm?TASK=delconf&rrn=' + %trim(%editc(rrn:'-
       P')) + '&FirstRowRRN=' + %trim(%editc(startrrn:'P')) + '"><img src="/w-
       ebsmart/v7.2/Lincoln/images/delete.gif" alt="Delete" title="Delete"></-
       a>';
       endsl;
       chain(N) DL006_ RKWPDECRAT;
       RS006_ = RcdSts2_('GETRCDN':%error: %found: %eof);
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
       outweb_(%subst(%str(%addr(H__2(3))):39:108));
       wfrtn__ = AfToPage_(QPGMNAM__);
       outweb_(%subst(%str(%addr(H__2(4))):67:18));
       AfToPage_(%trim(%editc(RRN:'X')));
       outweb_(%subst(%str(%addr(H__2(5))):5:13));
       AfToPage_(%trim(%editc(STARTRRN:'X')));
       outweb_(%subst(%str(%addr(H__2(5))):18:121));
       wfrtn__ = AfToPage_(DISPHREF);
       outweb_(%subst(%str(%addr(H__2(6))):59:7));
       wfrtn__ = AfToPage_(EDITHREF);
       outweb_(%subst(%str(%addr(H__2(6))):66:7));
       wfrtn__ = AfToPage_(DELHREF);
       outweb_(%subst(%str(%addr(H__2(6))):73:38));
       wfrtn__ = AfToPage_(PDRCODE);
       outweb_(%subst(%str(%addr(H__2(7))):31:25));
       wfrtn__ = AfToPage_(PDRDESC);
       outweb_(%subst(%str(%addr(H__2(7))):56:16));
       endrrn = rrn;
       rcdcnt = rcdcnt + 1;
      /end-free
     C/Exec SQL
     C+  FETCH NEXT FROM MC INTO :rrn, :PDRCODE, :PDRDESC
     C/End-Exec
      /free
       enddo;
      /end-free
     C/Exec SQL
     C+  close MC
     C/End-Exec
      /free
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
       RR_006_ = startrrn;
       AM006_ = CV_BYRRN;
       CHAIN(NE) RR_006_ R__ARR006;
       RS006_ = RcdSts2_('GETRCD': %error: %found: %eof);
       SETLL  pfklist RKWPDECRAT;
       RS006_ = RcdSts2_('POSRCD':%error:%equal:%eof);
       READPE(E) DL006_ RKWPDECRAT;
       RS006_ = RcdSts2_('GETPRVRCD': %error: %found: %eof);
       AM006_ = CV_ByKey;
       rcdcnt = 1;
       dow ((((RS006_ = '1')) and ((rcdcnt< listsize))));
       rcdcnt = rcdcnt + 1;
       READPE(E) DL006_ RKWPDECRAT;
       RS006_ = RcdSts2_('GETPRVRCD': %error: %found: %eof);
       AM006_ = CV_ByKey;
       enddo;
       startrrn = RR_006_;
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
       RR_006_ = rrn;
       AM006_ = CV_BYRRN;
       CHAIN(E) RR_006_ R__ARR006;
       RS006_ = RcdSts2_('GETRCD': %error: %found: %eof);
       if (pdrcode <> '');
        SETLL  DL006_ RKWPDECRAT;
        RS006_ = RcdSts2_('POSRCD':%error:%equal:%eof);
        READE(NE) DL006_ RKWPDECRAT;
        RS006_ = RcdSts2_('GETNXTRCD':%error:%found:%eof);
        AM006_ = CV_ByKey;
        dow (RS006_ = '1');
        select;
        when (pdrprod1 = '');
        PDRFICO1 = PDRFICO;
        PDRCLRFR1 = PDRCLRFR;
        pdrdecile1 = pdrdecile;
        PDRDISC1 = PDRDISC;
        PDRRATE1 = PDRRATE;
        pdrprod1 = pdrprod;
        when (pdrprod2 = '');
        PDRFICO2 = PDRFICO;
        PDRCLRFR2 = PDRCLRFR;
        pdrdecile2 = pdrdecile;
        PDRDISC2 = PDRDISC;
        PDRRATE2 = PDRRATE;
        pdrprod2 = pdrprod;
        when (pdrprod3 = '');
        PDRFICO3 = PDRFICO;
        PDRCLRFR3 = PDRCLRFR;
        pdrdecile3 = pdrdecile;
        PDRDISC3 = PDRDISC;
        PDRRATE3 = PDRRATE;
        pdrprod3 = pdrprod;
        when (pdrprod4 = '');
        PDRFICO4 = PDRFICO;
        PDRCLRFR4 = PDRCLRFR;
        pdrdecile4 = pdrdecile;
        PDRDISC4 = PDRDISC;
        PDRRATE4 = PDRRATE;
        pdrprod4 = pdrprod;
        endsl;
        READE(NE) DL006_ RKWPDECRAT;
        RS006_ = RcdSts2_('GETNXTRCD':%error:%found:%eof);
        AM006_ = CV_ByKey;
        enddo;
       endif;
       chain(N) DL006_ RKWPDECRAT;
       RS006_ = RcdSts2_('GETRCDN':%error: %found: %eof);
       outweb_(%subst(%str(%addr(H__4(1))):1:1086));
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
       outweb_(%subst(%str(%addr(H__4(14))):47:228));
       wfrtn__ = AfToPage_(PDRCODE);
       outweb_(%subst(%str(%addr(H__4(17))):35:179));
       wfrtn__ = AfToPage_(PDRDESC);
       outweb_(%subst(%str(%addr(H__4(19))):54:149));
       AfToPage_(%trim(%editc(PDRFICO1:'3')));
       outweb_(%subst(%str(%addr(H__4(21))):43:105));
       AfToPage_(%trim(%editc(PDRCLRFR1:'3')));
       outweb_(%subst(%str(%addr(H__4(22))):68:97));
       AfToPage_(%trim(%editc(PDRDECILE1:'3')));
       outweb_(%subst(%str(%addr(H__4(24))):5:97));
       wfrtn__ = AfToPage_(PDRPROD1);
       outweb_(%subst(%str(%addr(H__4(25))):22:1));
       AfToPage_(%trim(%editc(PDRRATE1:'J')));
       outweb_(%subst(%str(%addr(H__4(25))):23:100));
       AfToPage_(%trim(%editc(PDRDISC1:'3')));
       outweb_(%subst(%str(%addr(H__4(26))):43:191));
       AfToPage_(%trim(%editc(PDRFICO2:'3')));
       outweb_(%subst(%str(%addr(H__4(28))):74:105));
       AfToPage_(%trim(%editc(PDRCLRFR2:'3')));
       outweb_(%subst(%str(%addr(H__4(30))):19:97));
       AfToPage_(%trim(%editc(PDRDECILE2:'3')));
       outweb_(%subst(%str(%addr(H__4(31))):36:97));
       wfrtn__ = AfToPage_(PDRPROD2);
       outweb_(%subst(%str(%addr(H__4(32))):53:1));
       AfToPage_(%trim(%editc(PDRRATE2:'J')));
       outweb_(%subst(%str(%addr(H__4(32))):54:100));
       AfToPage_(%trim(%editc(PDRDISC2:'3')));
       outweb_(%subst(%str(%addr(H__4(33))):74:174));
       AfToPage_(%trim(%editc(PDRFICO3:'3')));
       outweb_(%subst(%str(%addr(H__4(36))):8:105));
       AfToPage_(%trim(%editc(PDRCLRFR3:'3')));
       outweb_(%subst(%str(%addr(H__4(37))):33:97));
       AfToPage_(%trim(%editc(PDRDECILE3:'3')));
       outweb_(%subst(%str(%addr(H__4(38))):50:97));
       wfrtn__ = AfToPage_(PDRPROD3);
       outweb_(%subst(%str(%addr(H__4(39))):67:1));
       AfToPage_(%trim(%editc(PDRRATE3:'J')));
       outweb_(%subst(%str(%addr(H__4(39))):68:100));
       AfToPage_(%trim(%editc(PDRDISC3:'3')));
       outweb_(%subst(%str(%addr(H__4(41))):8:191));
       AfToPage_(%trim(%editc(PDRFICO4:'3')));
       outweb_(%subst(%str(%addr(H__4(43))):39:105));
       AfToPage_(%trim(%editc(PDRCLRFR4:'3')));
       outweb_(%subst(%str(%addr(H__4(44))):64:97));
       AfToPage_(%trim(%editc(PDRDECILE4:'3')));
       outweb_(%subst(%str(%addr(H__4(46))):1:97));
       wfrtn__ = AfToPage_(PDRPROD4);
       outweb_(%subst(%str(%addr(H__4(47))):18:1));
       AfToPage_(%trim(%editc(PDRRATE4:'J')));
       outweb_(%subst(%str(%addr(H__4(47))):19:100));
       AfToPage_(%trim(%editc(PDRDISC4:'3')));
       outweb_(%subst(%str(%addr(H__4(48))):39:182));

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
       RR_006_ = rrn;
       AM006_ = CV_BYRRN;
       CHAIN(E) RR_006_ R__ARR006;
       RS006_ = RcdSts2_('GETRCD': %error: %found: %eof);
       chain(N) DL006_ RKWPDECRAT;
       RS006_ = RcdSts2_('GETRCDN':%error: %found: %eof);
       outweb_(%subst(%str(%addr(H__4(1))):1:1086));
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
       outweb_(%subst(%str(%addr(H__4(14))):47:228));
       wfrtn__ = AfToPage_(PDRCODE);
       outweb_(%subst(%str(%addr(H__4(17))):35:179));
       wfrtn__ = AfToPage_(PDRDESC);
       outweb_(%subst(%str(%addr(H__4(19))):54:149));
       AfToPage_(%trim(%editc(PDRFICO1:'3')));
       outweb_(%subst(%str(%addr(H__4(21))):43:105));
       AfToPage_(%trim(%editc(PDRCLRFR1:'3')));
       outweb_(%subst(%str(%addr(H__4(22))):68:97));
       AfToPage_(%trim(%editc(PDRDECILE1:'3')));
       outweb_(%subst(%str(%addr(H__4(24))):5:97));
       wfrtn__ = AfToPage_(PDRPROD1);
       outweb_(%subst(%str(%addr(H__4(25))):22:1));
       AfToPage_(%trim(%editc(PDRRATE1:'J')));
       outweb_(%subst(%str(%addr(H__4(25))):23:100));
       AfToPage_(%trim(%editc(PDRDISC1:'3')));
       outweb_(%subst(%str(%addr(H__4(26))):43:191));
       AfToPage_(%trim(%editc(PDRFICO2:'3')));
       outweb_(%subst(%str(%addr(H__4(28))):74:105));
       AfToPage_(%trim(%editc(PDRCLRFR2:'3')));
       outweb_(%subst(%str(%addr(H__4(30))):19:97));
       AfToPage_(%trim(%editc(PDRDECILE2:'3')));
       outweb_(%subst(%str(%addr(H__4(31))):36:97));
       wfrtn__ = AfToPage_(PDRPROD2);
       outweb_(%subst(%str(%addr(H__4(32))):53:1));
       AfToPage_(%trim(%editc(PDRRATE2:'J')));
       outweb_(%subst(%str(%addr(H__4(32))):54:100));
       AfToPage_(%trim(%editc(PDRDISC2:'3')));
       outweb_(%subst(%str(%addr(H__4(33))):74:174));
       AfToPage_(%trim(%editc(PDRFICO3:'3')));
       outweb_(%subst(%str(%addr(H__4(36))):8:105));
       AfToPage_(%trim(%editc(PDRCLRFR3:'3')));
       outweb_(%subst(%str(%addr(H__4(37))):33:97));
       AfToPage_(%trim(%editc(PDRDECILE3:'3')));
       outweb_(%subst(%str(%addr(H__4(38))):50:97));
       wfrtn__ = AfToPage_(PDRPROD3);
       outweb_(%subst(%str(%addr(H__4(39))):67:1));
       AfToPage_(%trim(%editc(PDRRATE3:'J')));
       outweb_(%subst(%str(%addr(H__4(39))):68:100));
       AfToPage_(%trim(%editc(PDRDISC3:'3')));
       outweb_(%subst(%str(%addr(H__4(41))):8:191));
       AfToPage_(%trim(%editc(PDRFICO4:'3')));
       outweb_(%subst(%str(%addr(H__4(43))):39:105));
       AfToPage_(%trim(%editc(PDRCLRFR4:'3')));
       outweb_(%subst(%str(%addr(H__4(44))):64:97));
       AfToPage_(%trim(%editc(PDRDECILE4:'3')));
       outweb_(%subst(%str(%addr(H__4(46))):1:97));
       wfrtn__ = AfToPage_(PDRPROD4);
       outweb_(%subst(%str(%addr(H__4(47))):18:1));
       AfToPage_(%trim(%editc(PDRRATE4:'J')));
       outweb_(%subst(%str(%addr(H__4(47))):19:100));
       AfToPage_(%trim(%editc(PDRDISC4:'3')));
       outweb_(%subst(%str(%addr(H__4(48))):39:182));

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
       RR_003_ = rrn;
       AM006_ = CV_BYRRN;
       CHAIN(E) RR_006_ R__ARR006;
       RS006_ = RcdSts2_('GETRCD': %error: %found: %eof);
       if (rrn = %dec(aton_(savedrrn:46:16):46:16));
        SETLL  pfklist RKWPDECRAT;
        RS006_ = RcdSts2_('POSRCD':%error:%equal:%eof);
        READPE(E) DL006_ RKWPDECRAT;
        RS006_ = RcdSts2_('GETPRVRCD': %error: %found: %eof);
        AM006_ = CV_ByKey;
        savedrrn = %trim(%editc(RR_006_:'P'));
        RR_006_ = rrn;
        AM006_ = CV_BYRRN;
        CHAIN(E) RR_006_ R__ARR006;
        RS006_ = RcdSts2_('GETRCD': %error: %found: %eof);
       endif;
      /end-free
     C                   EVAL      RS006_ = DeleteRcd_('RKWPDECRAT')
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
       RR_006_ = rrn;
       AM006_ = CV_BYRRN;
       CHAIN(E) RR_006_ R__ARR006;
       RS006_ = RcdSts2_('GETRCD': %error: %found: %eof);
       if (pdrcode <> '');
        SETLL  DL006_ RKWPDECRAT;
        RS006_ = RcdSts2_('POSRCD':%error:%equal:%eof);
        READE(NE) DL006_ RKWPDECRAT;
        RS006_ = RcdSts2_('GETNXTRCD':%error:%found:%eof);
        AM006_ = CV_ByKey;
        dow (RS006_ = '1');
        select;
        when (pdrprod1 = '');
        PDRFICO1 = PDRFICO;
        PDRCLRFR1 = PDRCLRFR;
        pdrdecile1 = pdrdecile;
        PDRDISC1 = PDRDISC;
        pdrprod1 = pdrprod;
        when (pdrprod2 = '');
        PDRFICO2 = PDRFICO;
        PDRCLRFR2 = PDRCLRFR;
        pdrdecile2 = pdrdecile;
        PDRDISC2 = PDRDISC;
        pdrprod2 = pdrprod;
        when (pdrprod3 = '');
        PDRFICO3 = PDRFICO;
        PDRCLRFR3 = PDRCLRFR;
        pdrdecile3 = pdrdecile;
        PDRDISC3 = PDRDISC;
        pdrprod3 = pdrprod;
        when (pdrprod4 = '');
        PDRFICO4 = PDRFICO;
        PDRCLRFR4 = PDRCLRFR;
        pdrdecile4 = pdrdecile;
        PDRDISC4 = PDRDISC;
        pdrprod4 = pdrprod;
        endsl;
        READE(NE) DL006_ RKWPDECRAT;
        RS006_ = RcdSts2_('GETNXTRCD':%error:%found:%eof);
        AM006_ = CV_ByKey;
        enddo;
       else;
        PDRFICO3 = 680;
        PDRFICO4 = 750;
        pdrdecile3 = 0;
        pdrdecile4 = 0;
       endif;
       outweb_(%subst(%str(%addr(H__7(1))):1:335));
       outweb_(%subst(%str(%addr(H__8(1))):1:2717));
       outweb_(%subst(%str(%addr(H__7(5))):16:892));
       wfrtn__ = AfToPage_(QPGMNAM__);
       outweb_(%subst(%str(%addr(H__7(16))):28:119));
       AfToPage_(%trim(%editc(RRN:'X')));
       outweb_(%subst(%str(%addr(H__7(17))):67:56));
       wfrtn__ = AfToPage_(SAVEDRRN);
       outweb_(%subst(%str(%addr(H__7(18))):43:372));
       AfToPage_(%trim(%editc(RRN:'X')));
       outweb_(%subst(%str(%addr(H__7(23))):15:1141));
       wfrtn__ = AfToPage_(PDRCODE);
       outweb_(%subst(%str(%addr(H__7(37))):36:248));
       wfrtn__ = AfToPage_(PDRDESC);
       outweb_(%subst(%str(%addr(H__7(40))):44:229));
       AfToPage_(%trim(%editc(PDRFICO1:'3')));
       outweb_(%subst(%str(%addr(H__7(43))):33:171));
       AfToPage_(%trim(%editc(PDRCLRFR1:'3')));
       outweb_(%subst(%str(%addr(H__7(45))):44:164));
       AfToPage_(%trim(%editc(PDRDECILE1:'3')));
       outweb_(%subst(%str(%addr(H__7(47))):48:98));
       prod1box0();
       outweb_(%subst(%str(%addr(H__7(48))):66:165));
       AfToPage_(%trim(%editc(PDRDISC1:'3')));
       outweb_(%subst(%str(%addr(H__7(50))):71:216));
       AfToPage_(%trim(%editc(PDRFICO2:'3')));
       outweb_(%subst(%str(%addr(H__7(53))):47:171));
       AfToPage_(%trim(%editc(PDRCLRFR2:'3')));
       outweb_(%subst(%str(%addr(H__7(55))):58:164));
       AfToPage_(%trim(%editc(PDRDECILE2:'3')));
       outweb_(%subst(%str(%addr(H__7(57))):62:98));
       prod2box0();
       outweb_(%subst(%str(%addr(H__7(58))):80:165));
       AfToPage_(%trim(%editc(PDRDISC2:'3')));
       outweb_(%subst(%str(%addr(H__7(61))):5:240));
       AfToPage_(%trim(%editc(PDRFICO3:'3')));
       outweb_(%subst(%str(%addr(H__7(64))):5:171));
       AfToPage_(%trim(%editc(PDRCLRFR3:'3')));
       outweb_(%subst(%str(%addr(H__7(66))):16:164));
       AfToPage_(%trim(%editc(PDRDECILE3:'3')));
       outweb_(%subst(%str(%addr(H__7(68))):20:98));
       prod3box0();
       outweb_(%subst(%str(%addr(H__7(69))):38:165));
       AfToPage_(%trim(%editc(PDRDISC3:'3')));
       outweb_(%subst(%str(%addr(H__7(71))):43:216));
       AfToPage_(%trim(%editc(PDRFICO4:'3')));
       outweb_(%subst(%str(%addr(H__7(74))):19:171));
       AfToPage_(%trim(%editc(PDRCLRFR4:'3')));
       outweb_(%subst(%str(%addr(H__7(76))):30:164));
       AfToPage_(%trim(%editc(PDRDECILE4:'3')));
       outweb_(%subst(%str(%addr(H__7(78))):34:98));
       prod4box0();
       outweb_(%subst(%str(%addr(H__7(79))):52:165));
       AfToPage_(%trim(%editc(PDRDISC4:'3')));
       outweb_(%subst(%str(%addr(H__7(81))):57:407));

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
        pdrcode = getparm3_('pdrcode':'*OPT');
        pdrdesc = getparm3_('pdrdesc':'*OPT');
        if ((((pdrcode = '')) or ((pdrdesc = ''))));
         Alert_('Tier Code and Description cannot be blank');
         outweb_(%subst(%str(%addr(H__7(1))):1:335));
         outweb_(%subst(%str(%addr(H__8(1))):1:2717));
         outweb_(%subst(%str(%addr(H__7(5))):16:892));
         wfrtn__ = AfToPage_(QPGMNAM__);
         outweb_(%subst(%str(%addr(H__7(16))):28:119));
         AfToPage_(%trim(%editc(RRN:'X')));
         outweb_(%subst(%str(%addr(H__7(17))):67:56));
         wfrtn__ = AfToPage_(SAVEDRRN);
         outweb_(%subst(%str(%addr(H__7(18))):43:372));
         AfToPage_(%trim(%editc(RRN:'X')));
         outweb_(%subst(%str(%addr(H__7(23))):15:1141));
         wfrtn__ = AfToPage_(PDRCODE);
         outweb_(%subst(%str(%addr(H__7(37))):36:248));
         wfrtn__ = AfToPage_(PDRDESC);
         outweb_(%subst(%str(%addr(H__7(40))):44:229));
         AfToPage_(%trim(%editc(PDRFICO1:'3')));
         outweb_(%subst(%str(%addr(H__7(43))):33:171));
         AfToPage_(%trim(%editc(PDRCLRFR1:'3')));
         outweb_(%subst(%str(%addr(H__7(45))):44:164));
         AfToPage_(%trim(%editc(PDRDECILE1:'3')));
         outweb_(%subst(%str(%addr(H__7(47))):48:98));
         prod1box0();
         outweb_(%subst(%str(%addr(H__7(48))):66:165));
         AfToPage_(%trim(%editc(PDRDISC1:'3')));
         outweb_(%subst(%str(%addr(H__7(50))):71:216));
         AfToPage_(%trim(%editc(PDRFICO2:'3')));
         outweb_(%subst(%str(%addr(H__7(53))):47:171));
         AfToPage_(%trim(%editc(PDRCLRFR2:'3')));
         outweb_(%subst(%str(%addr(H__7(55))):58:164));
         AfToPage_(%trim(%editc(PDRDECILE2:'3')));
         outweb_(%subst(%str(%addr(H__7(57))):62:98));
         prod2box0();
         outweb_(%subst(%str(%addr(H__7(58))):80:165));
         AfToPage_(%trim(%editc(PDRDISC2:'3')));
         outweb_(%subst(%str(%addr(H__7(61))):5:240));
         AfToPage_(%trim(%editc(PDRFICO3:'3')));
         outweb_(%subst(%str(%addr(H__7(64))):5:171));
         AfToPage_(%trim(%editc(PDRCLRFR3:'3')));
         outweb_(%subst(%str(%addr(H__7(66))):16:164));
         AfToPage_(%trim(%editc(PDRDECILE3:'3')));
         outweb_(%subst(%str(%addr(H__7(68))):20:98));
         prod3box0();
         outweb_(%subst(%str(%addr(H__7(69))):38:165));
         AfToPage_(%trim(%editc(PDRDISC3:'3')));
         outweb_(%subst(%str(%addr(H__7(71))):43:216));
         AfToPage_(%trim(%editc(PDRFICO4:'3')));
         outweb_(%subst(%str(%addr(H__7(74))):19:171));
         AfToPage_(%trim(%editc(PDRCLRFR4:'3')));
         outweb_(%subst(%str(%addr(H__7(76))):30:164));
         AfToPage_(%trim(%editc(PDRDECILE4:'3')));
         outweb_(%subst(%str(%addr(H__7(78))):34:98));
         prod4box0();
         outweb_(%subst(%str(%addr(H__7(79))):52:165));
         AfToPage_(%trim(%editc(PDRDISC4:'3')));
         outweb_(%subst(%str(%addr(H__7(81))):57:407));
         return ;
        endif;
       endif;
       pdrcode = getparm3_('pdrcode':'*OPT');
       pdrdesc = getparm3_('pdrdesc':'*OPT');
       PDRFICO1 = %dec(aton_( getparm3_('PDRFICO1':'*OPT'):46:16):5:0);
       PDRCLRFR1 = %dec(aton_( getparm3_('PDRCLRFR1':'*OPT'):46:16):5:0);
       pdrdecile1 = %dec(aton_( getparm3_('pdrdecile1':'*OPT'):46:16):17:9);
       pdrprod1 = getparm3_('pdrprod1':'*OPT');
       PDRDISC1 = %dec(aton_( getparm3_('PDRDISC1':'*OPT'):46:16):8:5);
       PDRFICO2 = %dec(aton_( getparm3_('PDRFICO2':'*OPT'):46:16):5:0);
       PDRCLRFR2 = %dec(aton_( getparm3_('PDRCLRFR2':'*OPT'):46:16):5:0);
       pdrdecile2 = %dec(aton_( getparm3_('pdrdecile2':'*OPT'):46:16):17:9);
       pdrprod2 = getparm3_('pdrprod2':'*OPT');
       PDRDISC2 = %dec(aton_( getparm3_('PDRDISC2':'*OPT'):46:16):8:5);
       PDRFICO3 = %dec(aton_( getparm3_('PDRFICO3':'*OPT'):46:16):5:0);
       PDRCLRFR3 = %dec(aton_( getparm3_('PDRCLRFR3':'*OPT'):46:16):5:0);
       pdrdecile3 = %dec(aton_( getparm3_('pdrdecile3':'*OPT'):46:16):17:9);
       pdrprod3 = getparm3_('pdrprod3':'*OPT');
       PDRDISC3 = %dec(aton_( getparm3_('PDRDISC3':'*OPT'):46:16):8:5);
       PDRFICO4 = %dec(aton_( getparm3_('PDRFICO4':'*OPT'):46:16):5:0);
       PDRCLRFR4 = %dec(aton_( getparm3_('PDRCLRFR4':'*OPT'):46:16):5:0);
       pdrdecile4 = %dec(aton_( getparm3_('pdrdecile4':'*OPT'):46:16):17:9);
       pdrprod4 = getparm3_('pdrprod4':'*OPT');
       PDRDISC4 = %dec(aton_( getparm3_('PDRDISC4':'*OPT'):46:16):8:5);
       if (pdrdesc = '');
        Alert_('Tier Code and Description cannot be blank');
        outweb_(%subst(%str(%addr(H__7(1))):1:335));
        outweb_(%subst(%str(%addr(H__8(1))):1:2717));
        outweb_(%subst(%str(%addr(H__7(5))):16:892));
        wfrtn__ = AfToPage_(QPGMNAM__);
        outweb_(%subst(%str(%addr(H__7(16))):28:119));
        AfToPage_(%trim(%editc(RRN:'X')));
        outweb_(%subst(%str(%addr(H__7(17))):67:56));
        wfrtn__ = AfToPage_(SAVEDRRN);
        outweb_(%subst(%str(%addr(H__7(18))):43:372));
        AfToPage_(%trim(%editc(RRN:'X')));
        outweb_(%subst(%str(%addr(H__7(23))):15:1141));
        wfrtn__ = AfToPage_(PDRCODE);
        outweb_(%subst(%str(%addr(H__7(37))):36:248));
        wfrtn__ = AfToPage_(PDRDESC);
        outweb_(%subst(%str(%addr(H__7(40))):44:229));
        AfToPage_(%trim(%editc(PDRFICO1:'3')));
        outweb_(%subst(%str(%addr(H__7(43))):33:171));
        AfToPage_(%trim(%editc(PDRCLRFR1:'3')));
        outweb_(%subst(%str(%addr(H__7(45))):44:164));
        AfToPage_(%trim(%editc(PDRDECILE1:'3')));
        outweb_(%subst(%str(%addr(H__7(47))):48:98));
        prod1box0();
        outweb_(%subst(%str(%addr(H__7(48))):66:165));
        AfToPage_(%trim(%editc(PDRDISC1:'3')));
        outweb_(%subst(%str(%addr(H__7(50))):71:216));
        AfToPage_(%trim(%editc(PDRFICO2:'3')));
        outweb_(%subst(%str(%addr(H__7(53))):47:171));
        AfToPage_(%trim(%editc(PDRCLRFR2:'3')));
        outweb_(%subst(%str(%addr(H__7(55))):58:164));
        AfToPage_(%trim(%editc(PDRDECILE2:'3')));
        outweb_(%subst(%str(%addr(H__7(57))):62:98));
        prod2box0();
        outweb_(%subst(%str(%addr(H__7(58))):80:165));
        AfToPage_(%trim(%editc(PDRDISC2:'3')));
        outweb_(%subst(%str(%addr(H__7(61))):5:240));
        AfToPage_(%trim(%editc(PDRFICO3:'3')));
        outweb_(%subst(%str(%addr(H__7(64))):5:171));
        AfToPage_(%trim(%editc(PDRCLRFR3:'3')));
        outweb_(%subst(%str(%addr(H__7(66))):16:164));
        AfToPage_(%trim(%editc(PDRDECILE3:'3')));
        outweb_(%subst(%str(%addr(H__7(68))):20:98));
        prod3box0();
        outweb_(%subst(%str(%addr(H__7(69))):38:165));
        AfToPage_(%trim(%editc(PDRDISC3:'3')));
        outweb_(%subst(%str(%addr(H__7(71))):43:216));
        AfToPage_(%trim(%editc(PDRFICO4:'3')));
        outweb_(%subst(%str(%addr(H__7(74))):19:171));
        AfToPage_(%trim(%editc(PDRCLRFR4:'3')));
        outweb_(%subst(%str(%addr(H__7(76))):30:164));
        AfToPage_(%trim(%editc(PDRDECILE4:'3')));
        outweb_(%subst(%str(%addr(H__7(78))):34:98));
        prod4box0();
        outweb_(%subst(%str(%addr(H__7(79))):52:165));
        AfToPage_(%trim(%editc(PDRDISC4:'3')));
        outweb_(%subst(%str(%addr(H__7(81))):57:407));
        return ;
       endif;
       if (mode = 'Change');
        rrn = %dec(aton_( getparm3_('rrn':'*MAND'):46:16):9:0);
        RR_006_ = rrn;
        AM006_ = CV_BYRRN;
        CHAIN(E) RR_006_ R__ARR006;
        RS006_ = RcdSts2_('GETRCD': %error: %found: %eof);
      /end-free
     C/Exec SQL
     C+  delete from KWPDECRATE where PDRCODE = :PDRCODE
     C/End-Exec
      /free
       endif;
       PDRFICO = PDRFICO1;
       PDRCLRFR = PDRCLRFR1;
       pdrdecile = pdrdecile1;
       pdrprod = pdrprod1;
       PDRDISC = PDRDISC1;
       pprod = pdrprod;
       AM007_ = CV_BYKEY;
       CHAIN(NE) DL007_ RKWPPBASE;
       RS007_ = RcdSts2_('GETRCD': %error: %found: %eof);
       PDRRATE = PPDRATE;
       WRITE RKWPDECRAT;
       RS006_ = RcdSts2_('WRTRCD': %error: %found: %eof);
       PDRFICO = PDRFICO2;
       PDRCLRFR = PDRCLRFR2;
       pdrdecile = pdrdecile2;
       pdrprod = pdrprod2;
       PDRDISC = PDRDISC2;
       pprod = pdrprod;
       AM007_ = CV_BYKEY;
       CHAIN(NE) DL007_ RKWPPBASE;
       RS007_ = RcdSts2_('GETRCD': %error: %found: %eof);
       PDRRATE = PPDRATE;
       WRITE RKWPDECRAT;
       RS006_ = RcdSts2_('WRTRCD': %error: %found: %eof);
       if (pdrprod3 <> '');
        PDRFICO = PDRFICO3;
        PDRCLRFR = PDRCLRFR3;
        pdrdecile = pdrdecile3;
        pdrprod = pdrprod3;
        PDRDISC = PDRDISC3;
        pprod = pdrprod;
        AM007_ = CV_BYKEY;
        CHAIN(NE) DL007_ RKWPPBASE;
        RS007_ = RcdSts2_('GETRCD': %error: %found: %eof);
        PDRRATE = PPDRATE;
        WRITE RKWPDECRAT;
        RS006_ = RcdSts2_('WRTRCD': %error: %found: %eof);
       endif;
       if (pdrprod4 <> '');
        PDRFICO = PDRFICO4;
        PDRCLRFR = PDRCLRFR4;
        pdrdecile = pdrdecile4;
        pdrprod = pdrprod4;
        PDRDISC = PDRDISC4;
        pprod = pdrprod;
        AM007_ = CV_BYKEY;
        CHAIN(NE) DL007_ RKWPPBASE;
        RS007_ = RcdSts2_('GETRCD': %error: %found: %eof);
        PDRRATE = PPDRATE;
        WRITE RKWPDECRAT;
        RS006_ = RcdSts2_('WRTRCD': %error: %found: %eof);
       endif;
       Redirect2_( '?rrn=' + savedrrn:'*SAME':'rand');
      /end-free
     c     *PSSR         begsr
     c                   endsr
     P                 E


     P*---------------------------------------------------------------------
     P* prod1box0...                - User defined function
     P*---------------------------------------------------------------------
     P prod1box0...
     P                 B
     D prod1box0...
     D                 PI




      /free
       p_ztype = 'KWPPBASE';
       boxname = 'PDRPROD1';
       boxid = 'PDRPROD1';
       boxselect = pdrprod1;
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
       SETLL  DL007_ RKWPPBASE;
       RS007_ = RcdSts2_('POSRCD':%error:%equal:%eof);
       READ(NE)  RKWPPBASE;
       RS007_ = RcdSts2_('GETNXTRCD':%error:%found:%eof);
       AM007_ = CV_ByKey;
       dow (RS007_ = '1');
       OutWeb_('<option value="');
       OutWeb_(%trimr(pprod));
       OutWeb_('"');
       if (pdrprod1 = pprod);
        OutWeb_(' selected');
       endif;
       OutWeb_('>');
       OutWeb_(%trimr( %trim(pprod)));
       OutWeb_(' ');
       OutWeb_(%trimr( %editc(PPDRATE:'3')));
       OutWeb_('</option>');
       READ(NE)  RKWPPBASE;
       RS007_ = RcdSts2_('GETNXTRCD':%error:%found:%eof);
       AM007_ = CV_ByKey;
       enddo;
       OutWeb_('</select>');
      /end-free
     c     *PSSR         begsr
     c                   endsr
     P                 E


     P*---------------------------------------------------------------------
     P* prod2box0...                - User defined function
     P*---------------------------------------------------------------------
     P prod2box0...
     P                 B
     D prod2box0...
     D                 PI




      /free
       p_ztype = 'KWPPBASE';
       boxname = 'PDRPROD2';
       boxid = 'PDRPROD2';
       boxselect = pdrprod2;
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
       SETLL  DL007_ RKWPPBASE;
       RS007_ = RcdSts2_('POSRCD':%error:%equal:%eof);
       READ(NE)  RKWPPBASE;
       RS007_ = RcdSts2_('GETNXTRCD':%error:%found:%eof);
       AM007_ = CV_ByKey;
       dow (RS007_ = '1');
       OutWeb_('<option value="');
       OutWeb_(%trimr(pprod));
       OutWeb_('"');
       if (pdrprod2 = pprod);
        OutWeb_(' selected');
       endif;
       OutWeb_('>');
       OutWeb_(%trimr( %trim(pprod)));
       OutWeb_(' ');
       OutWeb_(%trimr( %editc(PPDRATE:'3')));
       OutWeb_('</option>');
       READ(NE)  RKWPPBASE;
       RS007_ = RcdSts2_('GETNXTRCD':%error:%found:%eof);
       AM007_ = CV_ByKey;
       enddo;
       OutWeb_('</select>');
      /end-free
     c     *PSSR         begsr
     c                   endsr
     P                 E


     P*---------------------------------------------------------------------
     P* prod3box0...                - User defined function
     P*---------------------------------------------------------------------
     P prod3box0...
     P                 B
     D prod3box0...
     D                 PI




      /free
       p_ztype = 'KWPPBASE';
       boxname = 'PDRPROD3';
       boxid = 'PDRPROD3';
       boxselect = pdrprod3;
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
       SETLL  DL007_ RKWPPBASE;
       RS007_ = RcdSts2_('POSRCD':%error:%equal:%eof);
       READ(NE)  RKWPPBASE;
       RS007_ = RcdSts2_('GETNXTRCD':%error:%found:%eof);
       AM007_ = CV_ByKey;
       dow (RS007_ = '1');
       OutWeb_('<option value="');
       OutWeb_(%trimr(pprod));
       OutWeb_('"');
       if (pdrprod3 = pprod);
        OutWeb_(' selected');
       endif;
       OutWeb_('>');
       OutWeb_(%trimr( %trim(pprod)));
       OutWeb_(' ');
       OutWeb_(%trimr( %editc(PPDRATE:'3')));
       OutWeb_('</option>');
       READ(NE)  RKWPPBASE;
       RS007_ = RcdSts2_('GETNXTRCD':%error:%found:%eof);
       AM007_ = CV_ByKey;
       enddo;
       OutWeb_('</select>');
      /end-free
     c     *PSSR         begsr
     c                   endsr
     P                 E


     P*---------------------------------------------------------------------
     P* prod4box0...                - User defined function
     P*---------------------------------------------------------------------
     P prod4box0...
     P                 B
     D prod4box0...
     D                 PI




      /free
       p_ztype = 'KWPPBASE';
       boxname = 'PDRPROD4';
       boxid = 'PDRPROD4';
       boxselect = pdrprod4;
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
       SETLL  DL007_ RKWPPBASE;
       RS007_ = RcdSts2_('POSRCD':%error:%equal:%eof);
       READ(NE)  RKWPPBASE;
       RS007_ = RcdSts2_('GETNXTRCD':%error:%found:%eof);
       AM007_ = CV_ByKey;
       dow (RS007_ = '1');
       OutWeb_('<option value="');
       OutWeb_(%trimr(pprod));
       OutWeb_('"');
       if (pdrprod4 = pprod);
        OutWeb_(' selected');
       endif;
       OutWeb_('>');
       OutWeb_(%trimr( %trim(pprod)));
       OutWeb_(' ');
       OutWeb_(%trimr( %editc(PPDRATE:'3')));
       OutWeb_('</option>');
       READ(NE)  RKWPPBASE;
       RS007_ = RcdSts2_('GETNXTRCD':%error:%found:%eof);
       AM007_ = CV_ByKey;
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
     C                   TIME                    CURTIME__
      /free
      /end-free
      /free
       QPGMNAM__=%trim(PGMNAME__) + '.pgm';

       // Initialize library list array for current job to find files
       rtlla__(1) = 'KWDB';
       rtlla__(2) = 'KWSYS';
       rtlla__(3) = 'KWDB108';

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
       if   ((file__='KWPDECRATE' or file__='*ALL') and NOT %OPEN(KWPDECRATE));
        if (mbr__ <> '*FIRST');
         ovrdbf_(ovrflag__:'KWPDECRATE':'KWPDECRATE' : '*LIBL' : mbr__);
        elseif ('KWPDECRATE' <> 'KWPDECRATE');
         ovrdbf_(ovrflag__:'KWPDECRATE':'KWPDECRATE' : '*LIBL');
        endif;
        if    erropen__ = 'Y';
         OPEN(E) KWPDECRATE;             //    KWPDECRATE
         if        %error;
          return %error;
         endif;
        else;
         OPEN KWPDECRATE;                //    KWPDECRATE
        endif;
       endif;
       if   (file__='KWPDECRATE' or file__='*ALL')  and NOT %OPEN(F__ARR006);
        ovrdbf_(ovrflag__:'F__ARR006':'KWPDECRATE' : '*LIBL' : mbr__);
        if   erropen__ = 'Y';
         OPEN(E) F__ARR006;          //   KWPDECRATE
         if        %error;
          return %error;
         endif;
        else;
         OPEN F__ARR006;            //    KWPDECRATE
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
       when      rcdfmt__='RKWPDECRAT' and AM006_ = CV_ByKey and RS006_ = *ON ;
       delete RKWPDECRAT;
       when      rcdfmt__='RKWPDECRAT' and AM006_ = CV_ByRrn and RS006_ = *ON ;
       delete R__ARR006;
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
**CTDATA H__1        ListHeader                       1988
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.or
g/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>
    <meta name="genera
tor" content="WebSmart" />
    <meta http-equiv="Pragma" content="no-cache" />

   <title>System Settings:  Rate Tiers</title>
    <link rel="stylesheet" type="
text/css" href="/websmart/kwikloan/styles/klstylei.css" media="screen, tv, proje
ction" />
    <link rel="stylesheet" type="text/css" href="/websmart/kwikloan/st
yles/klstyleInquiryList.css" media="screen, tv, projection" />
    <script type=
"text/javascript" src="/websmart/kwikloan/javascript/klscripts.js"></script>
  <
/head>
  <body>
    <div id="wrapping">
      <div id="everything">
        <div
 id="pagetitle">
          <span>System Settings: Rate Tiers</span>
        </di
v>  
        <div id="whitebg" class="whitebg">
          <div class="left">

         <table class="actionsTable">
              <!-- <tr><td><a href="#" onc
lick="window.location='?task=beginmanage&rrn=0&rnd='"><img src="https://sv1.amer
icanfirstfinance.com:8158/websmart/kwikloan/images/modalIconsAN.png"></a><span c
lass="LSlabel"></span></td></tr>-->     
              <tr><td><a href="#" oncli
ck=""><img src="/websmart/kwikloan/images/loanInqADD.png"></a><span class="LSlab
el"></span></td></tr>     
              
            </table> 
            

          
            
          </div><!--left-->
          <div class="right"
>
            <div id="scroller">
              <div id="sections" style="overfl
ow-y: scroll;">
                <ul>
                <li>
                

           
                <table class="mainlist">
                  <tr>

                
                    
                    <th width="100">Action
</th>
                    <th width="110" valign="top">Rate Tier</th>

          <th width="250">Description</th>
                    

    
                    
                  </tr>

**CTDATA H__2        ListDetails                      551
<tr class="">
 <!-- <td><a href="?TASK=disp&rrn=&FirstRowRRN="><img src="/websma
rt/v7.2/Lincoln/images/view.gif" alt="Display" title="Display"></a>
      <a hre
f="?TASK=beginmanage&rrn=&FirstRowRRN=&mode=edit"><img src="/websmart/v7.2/Linco
ln/images/edit.gif"  alt="Edit" title="Edit"></a>
       <a href="?TASK=delconf&
rrn=&FirstRowRRN="><img src="/websmart/v7.2/Lincoln/images/delete.gif" alt="Dele
te" title="Delete"></a>
      </td> -->
       <td>
      
      
      
      <
/td>
  <td class="text right"></td>
  <td class="text"></td>
   
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

**CTDATA H__4        RcdDisplay                       3980
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.or
g/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>
    <meta name="genera
tor" content="WebSmart" />
    <meta http-equiv="Pragma" content="no-cache" />

   <title>System Settings:  Rate Tiers - Display</title>
    <link rel="styleshe
et" type="text/css" href="/websmart/kwikloan/styles/klstylei.css" media="screen,
 tv, projection" />
    <script type="text/javascript" src="/websmart/kwikloan/j
avascript/klscripts.js"></script>
    <script type="text/javascript" src="/websm
art/kwikloan/javascript/klthemes.js"></script>
    <script type="text/javascript
" src="/websmart/v7.2/javascript/esdiapi010.js"></script>
  </head>
  <body>

 <div id="wrapping">
      <div id="everything">
        
        
        <div
id="pagetitle">
          <span>System Settings: Rate Tiers</span>
        </div
>
        
        <div id="whitebg">
          <div id="EDITtitle"><span>View R
ate Tiers</span></div>
          
          <div id="EDITcontents"> 

 
            <div id="navtop">
              
              
            </div>

            <table>
              
               
	                
	
        <tr>
                      <td class="left">Rate Tier Code:</td>

               <td class="right">  </td>
                    </tr>

        
                    <tr>
                      <td class="left">Descrip
tion:</td>
                      <td class="right">   </td>

</tr>
                    <tr>
                      <td class="left">FICO:</td>

                      <td class="right">  </td>
                      <td class
="left">Clear Fraud:</td>
                      <td class="right">  </td>

              <td class="left">Score:</td>
                      <td class="righ
t">  </td>
                    	<td class="left">Product:</td>

     <td colspan="2"> </td>
                      <td class="left">Discount:</td
>
                      <td class="right"></td>	
                    </tr>

                 
	                 
                    <tr>

    <td class="left">FICO:</td>
                      <td class="right">  </td>

                      <td class="left">Clear Fraud:</td>
                      <
td class="right">  </td>
                    <td class="left">Score:</td>

                <td class="right">  </td>
                    	<td class="left">
Product:</td>
                      <td colspan="2"> </td>

 <td class="left">Discount:</td>
                      <td class="right"></td>	

                    </tr>
                    <!--
                    <tr>

                  <td class="left">FICO:</td>
                      <td class="r
ight">  </td>
                      <td class="left">Clear Fraud:</td>

             <td class="right">  </td>
                    <td class="left">Scor
e:</td>
                      <td class="right">  </td>
                    	<td
 class="left">Product:</td>
                      <td colspan="2"> </td>

               <td class="left">Discount:</td>
                      <td class="
right"></td>	
                    </tr>                    

 
                    <tr>
                      <td class="left">FICO:</td>

                   <td class="right">  </td>
                      <td class="le
ft">Clear Fraud:</td>
                      <td class="right">  </td>

          <td class="left">Score:</td>
                      <td class="right">
 </td>
                    	<td class="left">Product:</td>

 <td colspan="2"> </td>
                      <td class="left">Discount:</td>

                    <td class="right"></td>	
                    </tr>
	
        -->
	                
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
**CTDATA H__7        RcdManage                        6863
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.or
g/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>
    <meta name="genera
tor" content="WebSmart" />
    <meta http-equiv="Pragma" content="no-cache" />

   <title>System Settings:  Rate Tiers - Add or Change</title>
    <style type="
text/css">
    
    </style>
    <script type="text/javascript" src="/websmart/k
wikloan/javascript/klscripts.js"></script>
    <script type="text/javascript" sr
c="/websmart/kwikloan/javascript/klthemes.js"></script>
    <script type="text/j
avascript" src="/websmart/v7.2/javascript/esdiapi010.js"></script>
    <script t
ype="text/javascript" src="/k_com/jqLatest.js"></script>
    <script type="text/
javascript">
		xl_AttachEvent(window, "load", WindowInit); 

		function WindowIn
it()
		{
			xl_FocusFirstElement();
		}
		
		$(document).ready(function(){
			
	
		if ($("#psin").val() == "Y")
				$("#psin1").prop('checked', true);
			else if
 ($("#psin").val() == "N")
				$("#psin2").prop('checked', true);
				
			if ($(
"#PSPERCENT").val() == 1.50) {
				$("#PSPMTFCT").val("Y");
			}
			else {
				$
("#PSPMTFCT").val("N");	
			}
		});
		
	</script>
  </head>
  <body onload="getS
tat();">
    <form action="" method="get">
      <input type="hidden" name="task
" value="endmanage">
      <input type="hidden" name="rrn" value="">
      <inpu
t type="hidden" name="FirstRowRRN" value="">
      <div id="pagetitle">


        <span>System Settings: Rate Tiers</span>
        
        <!-----------
------ TOP BUTTONS ------------------------>
        <div id="topBtns">

  <input type="submit" class="navbutton" name="mode" value="Add">
          <scr
ipt type="text/javascript">
    		 function getStat()
   			  {
			var protkey =
 "";   
			if( == 0)
			{
		
			xl_GetFormElementByName("mode").value = "Add";
	
		} 
			else 
			{
				protkey  = xl_GetFormElementByName("PDRCODE");
				protke
y.disabled = true; 
				protkey.className = protkey.className + " disabled";
			
	xl_GetFormElementByName("mode").value = "Change";
			}
		}
		</script>

  
         <!-- <button class="navbutton" onclick="javascript:location.href='?t
ask=displist;return false;'">Cancel</button>-->
        </div>
        <!-------
---------- END TOP BUTTONS ------------------------>
      </div>
      
      <
div id="wrapping">
        
        
        <div id="whitebg">
          

     <div id="EDITcontents"> 
            
            <table id="holderTable">

              
              
              <tr>
                <th>Program Set
tings</th>
              </tr>
              <tr>
                <td class="hol
derTd">
                  <table class="dealerTable">
                    

               
                    <tr>
                      <td class="left">
Rate Tier Code:</td>
                      <td class="right"><input type="text"
id="PDRCODE" name="PDRCODE" value="" maxlength="25"></td>
                    </
tr>
                     
                    <tr>
                      <td cla
ss="left">Description:</td>
                      <td class="right"> <input type
="text" name="PDRDESC" id="PDRDESC" value="" maxlength="25"></td>

      </tr>
                    <tr>
                      <td class="left">FICO
:</td>
                      <td class="right"><input type="text" name="PDRFICO1
" size="5" maxlength="5" value=""></td>
                      <td class="left">C
lear Fraud:</td>
                      <td class="right"><input type="text" name
="PDRCLRFR1" size="5" maxlength="5" value=""></td>
                    <td class
="left">Score:</td>
                      <td class="right"><input type="text" n
ame="PDRDECILE1" size="5" maxlength="5" value=""></td>
                    	<td
class="left">Product:</td>
                      <td colspan="2"></td>

             <td class="left">Discount:</td>
                      <td class="ri
ght"><input type="text" name="PDRDISC1" size="5" maxlength="5" value=""></td>	

                   </tr>
                     <tr>
                      <td cla
ss="left">FICO:</td>
                      <td class="right"><input type="text"
name="PDRFICO2" size="5" maxlength="5" value=""></td>
                      <td
class="left">Clear Fraud:</td>
                      <td class="right"><input ty
pe="text" name="PDRCLRFR2" size="5" maxlength="5" value=""></td>

     <td class="left">Score:</td>
                      <td class="right"><input
 type="text" name="PDRDECILE2" size="5" maxlength="5" value=""></td>

         	<td class="left">Product:</td>
                      <td colspan="2"><
/td>
                      <td class="left">Discount:</td>

 <td class="right"><input type="text" name="PDRDISC2" size="5" maxlength="5" val
ue=""></td>	
                    </tr>
                    <!--

    <tr>
                      <td class="left">FICO:</td>

 <td class="right"><input type="text" name="PDRFICO3" size="5" maxlength="5" val
ue=""></td>
                      <td class="left">Clear Fraud:</td>

           <td class="right"><input type="text" name="PDRCLRFR3" size="5" maxlen
gth="5" value=""></td>
                    <td class="left">Score:</td>

              <td class="right"><input type="text" name="PDRDECILE3" size="5" ma
xlength="5" value=""></td>
                    	<td class="left">Product:</td>

                     <td colspan="2"></td>
                      <td class="left
">Discount:</td>
                      <td class="right"><input type="text" name
="PDRDISC3" size="5" maxlength="5" value=""></td>	
                    </tr>

                  <tr>
                      <td class="left">FICO:</td>

               <td class="right"><input type="text" name="PDRFICO4" size="5" max
length="5" value=""></td>
                      <td class="left">Clear Fraud:</t
d>
                      <td class="right"><input type="text" name="PDRCLRFR4" s
ize="5" maxlength="5" value=""></td>
                    <td class="left">Score:
</td>
                      <td class="right"><input type="text" name="PDRDECILE
4" size="5" maxlength="5" value=""></td>
                    	<td class="left">P
roduct:</td>
                      <td colspan="2"></td>
                      <
td class="left">Discount:</td>
                      <td class="right"><input ty
pe="text" name="PDRDISC4" size="5" maxlength="5" value=""></td>	

     </tr>
                    -->
                   
                        

                      </table>
                    </td>
                  </tr>

                </table>
                
                
              </div>
<!--whitebg-->
            </div><!--edit contents-->
          </div><!--wrappe
r-->
        </form>
        
       
      </body>
    </html>
**CTDATA H__8        manageCSS                        2717
input
{
width: 180px;	
}

input[type="radio"]{width: auto;}

select
{
width: 185
px;	
}
.checkBox
{
width: 10px;	
}
#holderTable
{
position: relative;
margin-top
: 40px;
border-collapse: collapse;
margin-left: auto;
margin-right: auto;
width:
 98%;
min-width: 800px;	
}
#holderTable tr th
{
background-color: #6C6C6C;
color
: #FFFFFF;
font-family: verdana;
font-size: 12px;
font-weight: normal;
padding:
5px;
text-align: left;
}
.loanProd, .stateTable, .holderTd
{
vertical-align: top
;	
}
.loanProd
{
border-left: 1px solid #cccccc;	
}
.holderTd
{
border-right: 1p
x solid #cccccc;
}
#stateTable
{
position: relative;
width: 300px;
border-left:
1px solid #CCCCCC;	
}
.stateTable tr td
{
padding: 0px 0px 0px 3px;
vertical-ali
gn: top;	
}
.loanProd
{
padding: 0px 0px 0px 3px;
vertical-align: top;	
}
#state
OfBus
{
font-family: verdana;
font-size: 11px;	
}
#loanProd
{
font-family: verda
na;
font-size: 11px;
}
body {
background-image: none;
color: #000000;
background
-color: #c9c9c9;
padding-top: 0px;
padding-bottom: 0px;
padding-left: 0px;
paddi
ng-right: 0px;
}

#wrapping {
width: 98%;
margin-left: auto;
margin-right: auto;

}

#everything {
width: 98%;
margin-top: 10px;
margin-left: auto;
margin-right:
 auto;
padding-bottom: 10px;
background-color: #EAEAEA;
background-image: url('/
websmart/kwikloan/images/pshadow.png');
background-position: right;
background-r
epeat: repeat-y;
}

#topBtns
{
float: right;
padding-right: 12px;
margin-right:
30px;
}

#pagetitle {
font-size: 14px;
color: #FFFFFF;
width: 100%;
background-c
olor: #839dc1;
padding: 10px;
position: fixed;
top: 0px;
left: 0px;
z-index: 999
9;
}

#pagetitle span {
margin-left: 10px;
font-family: verdana;
padding: 5px;
}


#whitebg {
background-color: #FFFFFF;
border: 1px solid #999;
padding: 10px;
m
argin-top: 10px;
margin-bottom: 10px;
margin-left: auto;
margin-right: auto;
wid
th: 98%;
height: 98%;
}

#whitebg table td a {
color: #06f;
}

DIV.whitebg {
hei
ght: 565px;	
}

DIV.left {
position: relative;
float: left;
height: 550px;
width
: 200px;
background-color: #6d819c;
background-image: url('/websmart/kwikloan/im
ages/loanInqLeft.png');
}

DIV.right {
position: relative;
float: left;
height:
550px;
width: 650px; 
}

DIV.right_1 {
position: relative;
float: left;
height:
550px;
width: 150px; 
}


table.dealerTable 
{
border-spacing: 0;
font-family: v
erdana;
font-size: 11px;
margin-top: 8px;
padding-bottom: 5px;
left: 7px;
positi
on: relative;
width: 350px;
}
table.dealerTable td 
{
font-family: verdana;
font
-size: 11px;
padding: 6px 5px 6px 0px;
vertical-align: middle;
}
table.dealerTab
le td.left 
{
text-align: right;
width: 130px;
}
table.dealerTable td.right 
{
p
adding-left: 8px;
text-align: left;
width: 190px;
vertical-align: middle;
}



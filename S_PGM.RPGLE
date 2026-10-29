     H/TITLE  System Settings:  Producst
      * ProGen WebSmart Revision 21923
      * File overrides for compile command
      *__OV OVRDBF KWPUBASE   KWPUBASE
      *__OV OVRDBF KWP_DATA   KWP_DATA
      *__OV OVRDBF KWPPGM     KWPPGM
      *__OV OVRDBF F__ARR003  KWPPGM
      *__OV OVRDBF KWPUOPT    KWPUOPT
      *__OV OVRDBF KWS_DATA   KWS_DATA
      *__   Following values are used to create the server program
      *__RO Pgm  lib KWWEB      Pgm  S_PGM
      *__AG          WEBSMART
      *__CL          *OBJLIBNAM
      *__SQ
      *__BD ECRTBND195
      *===============================================================*
      * Path:   s_pgm.pdw
      * System: SEAN-DESK
      * Project:Kwik-Loan
      * Set:    Development
      * User:   Sean
      * Date Last Generated:   2016-03-31   15:14:33
      * Last Generated CRC: B38A7676 F174F28E 329EA53F 89F1C861
      *===============================================================*
      */CPY *LIBL/PW_CSRC CPYRIGHT
      * File specifications
     FKWPUBASE  IF   E           K DISK    USROPN
     F                                     INFDS(FID001_   )
     FKWP_DATA  UF A E           K DISK    USROPN
     F                                     INFDS(FID002_   )
     FKWPPGM    UF A E           K DISK    USROPN
     F                                     INFDS(FID003_   )
     FF__ARR003 UF A E             DISK    USROPN
     F                                     RENAME(RKWPPGM      :R__ARR003   )
     FKWPUOPT   IF   E           K DISK    USROPN
     F                                     INFDS(FID004_   )
     FKWS_DATA  IF   E           K DISK    USROPN
     F                                     INFDS(FID005_   )

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
     D x               S              3P 0
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


     D H__1            S             80    PERRCD(1) CTDATA DIM(38          )

     D H__2            S             80    PERRCD(1) CTDATA DIM(7           )

     D H__3            S             80    PERRCD(1) CTDATA DIM(10          )

     D H__4            S             80    PERRCD(1) CTDATA DIM(52          )

     D H__5            S             80    PERRCD(1) CTDATA DIM(3           )

     D H__6            S             80    PERRCD(1) CTDATA DIM(1           )

     D H__7            S             80    PERRCD(1) CTDATA DIM(141         )

     D H__8            S             80    PERRCD(1) CTDATA DIM(34          )

     D H__9            S             80    PERRCD(1) CTDATA DIM(6           )


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

     D displist0...
     D                 PR
     D filter0...
     D                 PR
     D prev0...
     D                 PR
     D reorder0...
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
     D nointbox0...
     D                 PR
     D QPGM__          S             21A
     D LstPmlErr_      S              4P 0 IMPORT
     D psabtmthdbox0...
     D                 PR
     D revolvebox0...
     D                 PR
     D stipbox0...
     D                 PR
     D pspitmcdbox0...
     D                 PR
     D pspptmcdbox0...
     D                 PR
     D ratepbox0...
     D                 PR
     D CURTIME__       S              6P 0
     D QPGMNAM__       S             20A
     D SmurfChk__      S              1A   INZ(*ON)
     D Smurf_ID__      S             64A   IMPORT
     D Smurf_Rw__      S              9B 0 IMPORT

     D tmporder1       S                   LIKE(psporder      )
     D tmporder2       S                   LIKE(psporder      )
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
     C                   KFLD                    psprogram
     C     DL001_        KLIST
     C                   KFLD                    puid
     C     DL002_        KLIST
     C                   KFLD                    p_ztype
     C                   KFLD                    p_zkeya
     C                   KFLD                    p_zkeyn
     C     DL003_        KLIST
     C                   KFLD                    psprogram
     C     DL004_        KLIST
     C                   KFLD                    userid
     C                   KFLD                    puotype
     C     DL005_        KLIST
     C                   KFLD                    s_ztype
     C                   KFLD                    s_zkeya
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
       if (task__ = 'REORDER');
        taskran__ = *ON;
        reorder0();
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
       when ((RS004_ = '1') and (puoyesno = 'N'));
       addhref = '';
       when ((puprofile <> 'ADMINISTRATOR') and (puoyesno <> 'Y'));
       addhref = '';
       other;
       addhref = 'window.location=''s_pgm.pgm?task=beginmanage&rrn=0&rnd=' +
       %trim(rnd) + '''';
       endsl;
       psprogram = getparm3_('PSPROGRAM':'*OPT');
       outweb_(%subst(%str(%addr(H__1(1))):1:980));
       wfrtn__ = AfToPage_(QPGMNAM__);
       outweb_(%subst(%str(%addr(H__1(13))):21:28));
       wfrtn__ = AfToPage_(RND);
       outweb_(%subst(%str(%addr(H__1(13))):49:193));
       wfrtn__ = AfToPage_(ADDHREF);
       outweb_(%subst(%str(%addr(H__1(16))):2:192));
       wfrtn__ = AfToPage_(QPGMNAM__);
       outweb_(%subst(%str(%addr(H__1(18))):34:1588));
       rcdcnt = 0;
       puotype = 'EDITPGM';
       AM004_ = CV_BYKEY;
       CHAIN(NE) DL004_ RKWPUOPT;
       RS004_ = RcdSts2_('GETRCD': %error: %found: %eof);
       selstr = 'SELECT RRN(KWPPGM), KWPPGM.PSPROGRAM, KWPPGM.PSPDESC FROM KW-
       PPGM WHERE KWPPGM.PSPORDER >= 1 AND PSREVOLVE = ''N'' ' + %trim(
       whrclause) + ' ORDER BY KWPPGM.PSPORDER ASC FOR FETCH ONLY';
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
     C+  FETCH NEXT FROM MC INTO :rrn, :PSPROGRAM, :PSPDESC
     C/End-Exec
      /free
       dow (((((sqlcod <> 100) and (sqlcod >= 0)) and ((rcdcnt< listsize)))));
       rrn = rrn;
       if (rcdcnt = 0);
        startrrn = rrn;
       endif;
       disphref = '<a href="s_pgm.pgm?TASK=disp&rrn=' + %trim(%editc(rrn:'P')
       ) + '&FirstRowRRN=' + %trim(%editc(startrrn:'P')) + '"><img src="/webs-
       mart/v7.2/Lincoln/images/view.gif" alt="Display" title="Display"></a>';
       select;
       when ((RS004_ = '1') and (puoyesno = 'N'));
       edithref = '';
       delhref = '';
       when ((puprofile <> 'ADMINISTRATOR') and (puoyesno <> 'Y'));
       edithref = '';
       delhref = '';
       other;
       edithref = '<a href="s_pgm.pgm?TASK=beginmanage&rrn=' + %trim(%editc(
       rrn:'P')) + '&FirstRowRRN=' + %trim(%editc(startrrn:'P')) + '"><img sr-
       c="/websmart/v7.2/Lincoln/images/edit.gif"  alt="Edit" title="Edit"></-
       a>';
       delhref = '<a href="s_pgm.pgm?TASK=delconf&rrn=' + %trim(%editc(rrn:'P-
       ')) + '&FirstRowRRN=' + %trim(%editc(startrrn:'P')) + '"><img src="/we-
       bsmart/v7.2/Lincoln/images/delete.gif" alt="Delete" title="Delete"></a-
       >';
       endsl;
       chain(N) DL003_ RKWPPGM;
       RS003_ = RcdSts2_('GETRCDN':%error: %found: %eof);
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
       AfToPage_(%trim(%editc(PSPORDER:'J')));
       outweb_(%subst(%str(%addr(H__2(7))):31:2));
       wfrtn__ = AfToPage_(PSPROGRAM);
       outweb_(%subst(%str(%addr(H__2(7))):33:25));
       wfrtn__ = AfToPage_(PSPDESC);
       outweb_(%subst(%str(%addr(H__2(7))):58:16));
       endrrn = rrn;
       rcdcnt = rcdcnt + 1;
      /end-free
     C/Exec SQL
     C+  FETCH NEXT FROM MC INTO :rrn, :PSPROGRAM, :PSPDESC
     C/End-Exec
      /free
       enddo;
      /end-free
     C/Exec SQL
     C+  close MC
     C/End-Exec
      /free
       selstr = 'SELECT RRN(KWPPGM), KWPPGM.PSPROGRAM, KWPPGM.PSPDESC FROM KW-
       PPGM WHERE KWPPGM.PSPORDER >= 1 AND PSREVOLVE = ''Y'' ' + %trim(
       whrclause) + ' ORDER BY KWPPGM.PSPORDER ASC FOR FETCH ONLY';
      /end-free
     C/Exec SQL
     C+            Declare NC Scroll Cursor
     C+            For NC
     C/End-Exec
     C/Exec SQL
     C+            Prepare NC
     C+            From :selstr
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
     C+  FETCH NEXT FROM NC INTO :rrn, :PSPROGRAM, :PSPDESC
     C/End-Exec
      /free
       dow (((((sqlcod <> 100) and (sqlcod >= 0)) and ((rcdcnt< listsize)))));
       rrn = rrn;
       if (rcdcnt = 0);
        startrrn = rrn;
       endif;
       disphref = '<a href="s_pgm.pgm?TASK=disp&rrn=' + %trim(%editc(rrn:'P')
       ) + '&FirstRowRRN=' + %trim(%editc(startrrn:'P')) + '"><img src="/webs-
       mart/v7.2/Lincoln/images/view.gif" alt="Display" title="Display"></a>';
       select;
       when ((RS004_ = '1') and (puoyesno = 'N'));
       edithref = '';
       delhref = '';
       when ((puprofile <> 'ADMINISTRATOR') and (puoyesno <> 'Y'));
       edithref = '';
       delhref = '';
       other;
       edithref = '<a href="s_pgm.pgm?TASK=beginmanage&rrn=' + %trim(%editc(
       rrn:'P')) + '&FirstRowRRN=' + %trim(%editc(startrrn:'P')) + '"><img sr-
       c="/websmart/v7.2/Lincoln/images/edit.gif"  alt="Edit" title="Edit"></-
       a>';
       delhref = '<a href="s_pgm.pgm?TASK=delconf&rrn=' + %trim(%editc(rrn:'P-
       ')) + '&FirstRowRRN=' + %trim(%editc(startrrn:'P')) + '"><img src="/we-
       bsmart/v7.2/Lincoln/images/delete.gif" alt="Delete" title="Delete"></a-
       >';
       endsl;
       chain(N) DL003_ RKWPPGM;
       RS003_ = RcdSts2_('GETRCDN':%error: %found: %eof);
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
       AfToPage_(%trim(%editc(PSPORDER:'J')));
       outweb_(%subst(%str(%addr(H__2(7))):31:2));
       wfrtn__ = AfToPage_(PSPROGRAM);
       outweb_(%subst(%str(%addr(H__2(7))):33:25));
       wfrtn__ = AfToPage_(PSPDESC);
       outweb_(%subst(%str(%addr(H__2(7))):58:16));
       endrrn = rrn;
       rcdcnt = rcdcnt + 1;
      /end-free
     C/Exec SQL
     C+  FETCH NEXT FROM NC INTO :rrn, :PSPROGRAM, :PSPDESC
     C/End-Exec
      /free
       enddo;
      /end-free
     C/Exec SQL
     C+  close NC
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
     P* filter0...                  - User defined function
     P*---------------------------------------------------------------------
     P filter0...
     P                 B
     D filter0...
     D                 PI




      /free
       psprogram = getparm3_('psprogram':'*OPT');
       if (psprogram <> '');
        whrclause = ' AND PSPROGRAM like ''%' + %trim(psprogram) + '%''';
       endif;
       displist0();
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
       RR_003_ = startrrn;
       AM003_ = CV_BYRRN;
       CHAIN(NE) RR_003_ R__ARR003;
       RS003_ = RcdSts2_('GETRCD': %error: %found: %eof);
       SETLL  pfklist RKWPPGM;
       RS003_ = RcdSts2_('POSRCD':%error:%equal:%eof);
       READPE(E) DL003_ RKWPPGM;
       RS003_ = RcdSts2_('GETPRVRCD': %error: %found: %eof);
       AM003_ = CV_ByKey;
       rcdcnt = 1;
       dow ((((RS003_ = '1')) and ((rcdcnt< listsize))));
       rcdcnt = rcdcnt + 1;
       READPE(E) DL003_ RKWPPGM;
       RS003_ = RcdSts2_('GETPRVRCD': %error: %found: %eof);
       AM003_ = CV_ByKey;
       enddo;
       startrrn = RR_003_;
       displist0();
      /end-free
     c     *PSSR         begsr
     c                   endsr
     P                 E


     P*---------------------------------------------------------------------
     P* reorder0...                 - User defined function
     P*---------------------------------------------------------------------
     P reorder0...
     P                 B
     D reorder0...
     D                 PI




      /free
       type = getparm3_('type':'*OPT');
       type = %XLATE(lo__:up__:type);
       selstring = 'SELECT PSPROGRAM, PSPORDER FROM KWPPGM WHERE PSPROGRAM LI-
       KE ''' + %trim(type) + '%'' order by PSPORDER ASC';
       selstring = %trim(selstring);
      /end-free
     C/Exec SQL
     C+            Declare PS Scroll Cursor
     C+            For PS
     C/End-Exec
     C/Exec SQL
     C+            Prepare PS
     C+            From :selstring
     C/End-Exec
      /free
       if (sqlcod >= 0);
      /end-free
     C/Exec SQL
     C+            Open PS
     C/End-Exec
      /free
       endif;
      /end-free
     C/Exec SQL
     C+  FETCH NEXT FROM PS INTO :PSPROGRAM, :PSPORDER
     C/End-Exec
      /free
       x = 1;
       dow (((SQLCOD <> 100) and (SQLCOD >= 0)));
       AM003_ = CV_BYKEY;
       CHAIN(E) DL003_ RKWPPGM;
       RS003_ = RcdSts2_('GETRCD': %error: %found: %eof);
       PSPORDER = x;
       RS003_ = UpdateRcd_('RKWPPGM');
       x = x + 1;
      /end-free
     C/Exec SQL
     C+  FETCH NEXT FROM PS INTO :PSPROGRAM, :PSPORDER
     C/End-Exec
      /free
       enddo;
      /end-free
     C/Exec SQL
     C+  close PS
     C/End-Exec
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
       rrn = %dec(aton_( getparm3_('rrn':'*MAND'):46:16):9:0);
       savedrrn = getparm3_('FirstRowRRN':'*OPT');
       RR_003_ = rrn;
       AM003_ = CV_BYRRN;
       CHAIN(E) RR_003_ R__ARR003;
       RS003_ = RcdSts2_('GETRCD': %error: %found: %eof);
       if (PSPERCENT = 1.50);
        pmtfct = 'Yes';
       else;
        pmtfct = 'No';
       endif;
       s_ztype = 'ABATEMETHOD';
       s_zkeya = psabtmthd;
       s_zdesc = '';
       AM005_ = CV_BYKEY;
       CHAIN(NE) DL005_ RKWSDATA;
       RS005_ = RcdSts2_('GETRCD': %error: %found: %eof);
       chain(N) DL003_ RKWPPGM;
       RS003_ = RcdSts2_('GETRCDN':%error: %found: %eof);
       chain(N) DL005_ RKWSDATA;
       RS005_ = RcdSts2_('GETRCDN':%error: %found: %eof);
       outweb_(%subst(%str(%addr(H__4(1))):1:1088));
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
       outweb_(%subst(%str(%addr(H__4(14))):49:177));
       wfrtn__ = AfToPage_(PSPROGRAM);
       outweb_(%subst(%str(%addr(H__4(16))):66:143));
       AfToPage_(%trim(%editc(PSPORDER:'J')));
       outweb_(%subst(%str(%addr(H__4(18))):49:138));
       wfrtn__ = AfToPage_(PSPDESC);
       outweb_(%subst(%str(%addr(H__4(20))):27:143));
       AfToPage_(%trim(%editc(PSPITERM:'4')));
       outweb_(%subst(%str(%addr(H__4(22))):10:147));
       wfrtn__ = AfToPage_(PSPITMCD);
       outweb_(%subst(%str(%addr(H__4(23))):77:147));
       wfrtn__ = AfToPage_(S_ZDESC);
       outweb_(%subst(%str(%addr(H__4(25))):64:138));
       wfrtn__ = AfToPage_(PSPNOINT);
       outweb_(%subst(%str(%addr(H__4(27))):42:149));
       AfToPage_(%trim(%editc(PSPPTM:'4')));
       outweb_(%subst(%str(%addr(H__4(29))):31:154));
       wfrtn__ = AfToPage_(PSPPTMCD);
       outweb_(%subst(%str(%addr(H__4(31))):25:150));
       AfToPage_(%trim(%editc(PSPEAMT:'J')));
       outweb_(%subst(%str(%addr(H__4(33))):15:150));
       AfToPage_(%trim(%editc(PSPEPCT:'J')));
       outweb_(%subst(%str(%addr(H__4(35))):5:149));
       AfToPage_(%trim(%editc(PSPIAMT:'J')));
       outweb_(%subst(%str(%addr(H__4(36))):74:145));
       AfToPage_(%trim(%editc(PSPIPCT:'J')));
       outweb_(%subst(%str(%addr(H__4(38))):59:146));
       AfToPage_(%trim(%editc(PSPWAMT:'J')));
       outweb_(%subst(%str(%addr(H__4(40))):45:143));
       wfrtn__ = AfToPage_(PSPGROUP);
       outweb_(%subst(%str(%addr(H__4(42))):28:138));
       wfrtn__ = AfToPage_(PSPMINDLR);
       outweb_(%subst(%str(%addr(H__4(44))):6:138));
       wfrtn__ = AfToPage_(PSPMAXDLR);
       outweb_(%subst(%str(%addr(H__4(45))):64:140));
       AfToPage_(%trim(%editc(PSPBIDPCT:'4')));
       outweb_(%subst(%str(%addr(H__4(47))):44:148));
       wfrtn__ = AfToPage_(PSPSTIP);
       outweb_(%subst(%str(%addr(H__4(49))):32:147));
       wfrtn__ = AfToPage_(PMTFCT);
       outweb_(%subst(%str(%addr(H__4(51))):19:139));

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
       RR_003_ = rrn;
       AM003_ = CV_BYRRN;
       CHAIN(E) RR_003_ R__ARR003;
       RS003_ = RcdSts2_('GETRCD': %error: %found: %eof);
       s_ztype = 'ABATEMETHOD';
       s_zkeya = psabtmthd;
       s_zdesc = '';
       AM005_ = CV_BYKEY;
       CHAIN(NE) DL005_ RKWSDATA;
       RS005_ = RcdSts2_('GETRCD': %error: %found: %eof);
       chain(N) DL003_ RKWPPGM;
       RS003_ = RcdSts2_('GETRCDN':%error: %found: %eof);
       chain(N) DL005_ RKWSDATA;
       RS005_ = RcdSts2_('GETRCDN':%error: %found: %eof);
       outweb_(%subst(%str(%addr(H__4(1))):1:1088));
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
       outweb_(%subst(%str(%addr(H__4(14))):49:177));
       wfrtn__ = AfToPage_(PSPROGRAM);
       outweb_(%subst(%str(%addr(H__4(16))):66:143));
       AfToPage_(%trim(%editc(PSPORDER:'J')));
       outweb_(%subst(%str(%addr(H__4(18))):49:138));
       wfrtn__ = AfToPage_(PSPDESC);
       outweb_(%subst(%str(%addr(H__4(20))):27:143));
       AfToPage_(%trim(%editc(PSPITERM:'4')));
       outweb_(%subst(%str(%addr(H__4(22))):10:147));
       wfrtn__ = AfToPage_(PSPITMCD);
       outweb_(%subst(%str(%addr(H__4(23))):77:147));
       wfrtn__ = AfToPage_(S_ZDESC);
       outweb_(%subst(%str(%addr(H__4(25))):64:138));
       wfrtn__ = AfToPage_(PSPNOINT);
       outweb_(%subst(%str(%addr(H__4(27))):42:149));
       AfToPage_(%trim(%editc(PSPPTM:'4')));
       outweb_(%subst(%str(%addr(H__4(29))):31:154));
       wfrtn__ = AfToPage_(PSPPTMCD);
       outweb_(%subst(%str(%addr(H__4(31))):25:150));
       AfToPage_(%trim(%editc(PSPEAMT:'J')));
       outweb_(%subst(%str(%addr(H__4(33))):15:150));
       AfToPage_(%trim(%editc(PSPEPCT:'J')));
       outweb_(%subst(%str(%addr(H__4(35))):5:149));
       AfToPage_(%trim(%editc(PSPIAMT:'J')));
       outweb_(%subst(%str(%addr(H__4(36))):74:145));
       AfToPage_(%trim(%editc(PSPIPCT:'J')));
       outweb_(%subst(%str(%addr(H__4(38))):59:146));
       AfToPage_(%trim(%editc(PSPWAMT:'J')));
       outweb_(%subst(%str(%addr(H__4(40))):45:143));
       wfrtn__ = AfToPage_(PSPGROUP);
       outweb_(%subst(%str(%addr(H__4(42))):28:138));
       wfrtn__ = AfToPage_(PSPMINDLR);
       outweb_(%subst(%str(%addr(H__4(44))):6:138));
       wfrtn__ = AfToPage_(PSPMAXDLR);
       outweb_(%subst(%str(%addr(H__4(45))):64:140));
       AfToPage_(%trim(%editc(PSPBIDPCT:'4')));
       outweb_(%subst(%str(%addr(H__4(47))):44:148));
       wfrtn__ = AfToPage_(PSPSTIP);
       outweb_(%subst(%str(%addr(H__4(49))):32:147));
       wfrtn__ = AfToPage_(PMTFCT);
       outweb_(%subst(%str(%addr(H__4(51))):19:139));

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
       AM003_ = CV_BYRRN;
       CHAIN(E) RR_003_ R__ARR003;
       RS003_ = RcdSts2_('GETRCD': %error: %found: %eof);
       if (rrn = %dec(aton_(savedrrn:46:16):46:16));
        SETLL  pfklist RKWPPGM;
        RS003_ = RcdSts2_('POSRCD':%error:%equal:%eof);
        READPE(E) DL003_ RKWPPGM;
        RS003_ = RcdSts2_('GETPRVRCD': %error: %found: %eof);
        AM003_ = CV_ByKey;
        savedrrn = %trim(%editc(RR_003_:'P'));
        RR_003_ = rrn;
        AM003_ = CV_BYRRN;
        CHAIN(E) RR_003_ R__ARR003;
        RS003_ = RcdSts2_('GETRCD': %error: %found: %eof);
       endif;
      /end-free
     C                   EVAL      RS003_ = DeleteRcd_('RKWPPGM')
      /free
       p_ztype = 'KWPPGM';
       p_zkeya = psprogram;
       AM002_ = CV_BYKEY;
       CHAIN(E) DL002_ RKWPDATA;
       RS002_ = RcdSts2_('GETRCD': %error: %found: %eof);
       if (RS002_ = '1');
      /end-free
     C                   EVAL      RS002_ = DeleteRcd_('RKWPDATA')
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
       RR_003_ = rrn;
       AM003_ = CV_BYRRN;
       CHAIN(E) RR_003_ R__ARR003;
       RS003_ = RcdSts2_('GETRCD': %error: %found: %eof);
       outweb_(%subst(%str(%addr(H__7(1))):1:333));
       outweb_(%subst(%str(%addr(H__8(1))):1:2717));
       outweb_(%subst(%str(%addr(H__7(5))):14:892));
       wfrtn__ = AfToPage_(QPGMNAM__);
       outweb_(%subst(%str(%addr(H__7(16))):26:119));
       AfToPage_(%trim(%editc(RRN:'X')));
       outweb_(%subst(%str(%addr(H__7(17))):65:56));
       wfrtn__ = AfToPage_(SAVEDRRN);
       outweb_(%subst(%str(%addr(H__7(18))):41:370));
       AfToPage_(%trim(%editc(RRN:'X')));
       outweb_(%subst(%str(%addr(H__7(23))):11:397));
       wfrtn__ = AfToPage_(SAVEDRRN);
       outweb_(%subst(%str(%addr(H__7(28))):8:692));
       wfrtn__ = AfToPage_(PSINACTIVE);
       outweb_(%subst(%str(%addr(H__7(36))):60:391));
       wfrtn__ = AfToPage_(PSPROGRAM);
       outweb_(%subst(%str(%addr(H__7(41))):51:237));
       AfToPage_(%trim(%editc(PSPORDER:'4')));
       outweb_(%subst(%str(%addr(H__7(44))):48:280));
       wfrtn__ = AfToPage_(PSPSTATUS);
       outweb_(%subst(%str(%addr(H__7(48))):8:223));
       wfrtn__ = AfToPage_(PSPDESC);
       outweb_(%subst(%str(%addr(H__7(50))):71:242));
       AfToPage_(%trim(%editc(PSPITERM:'4')));
       outweb_(%subst(%str(%addr(H__7(53))):73:173));
       pspitmcdbox0();
       outweb_(%subst(%str(%addr(H__7(56))):6:165));
       psabtmthdbox0();
       outweb_(%subst(%str(%addr(H__7(58))):11:160));
       nointbox0();
       outweb_(%subst(%str(%addr(H__7(60))):11:236));
       AfToPage_(%trim(%editc(PSPPTM:'4')));
       outweb_(%subst(%str(%addr(H__7(63))):7:180));
       pspptmcdbox0();
       outweb_(%subst(%str(%addr(H__7(65))):27:233));
       AfToPage_(%trim(%editc(PSPEAMT:'4')));
       outweb_(%subst(%str(%addr(H__7(68))):20:240));
       AfToPage_(%trim(%editc(PSPEPCT:'4')));
       outweb_(%subst(%str(%addr(H__7(71))):20:239));
       AfToPage_(%trim(%editc(PSPIAMT:'4')));
       outweb_(%subst(%str(%addr(H__7(74))):19:235));
       AfToPage_(%trim(%editc(PSPIPCT:'4')));
       outweb_(%subst(%str(%addr(H__7(77))):14:236));
       AfToPage_(%trim(%editc(PSPWAMT:'4')));
       outweb_(%subst(%str(%addr(H__7(80))):10:236));
       AfToPage_(%trim(%editc(PSPWPCT:'4')));
       outweb_(%subst(%str(%addr(H__7(83))):6:238));
       AfToPage_(%trim(%editc(PSPRATE:'4')));
       outweb_(%subst(%str(%addr(H__7(86))):4:233));
       AfToPage_(%trim(%editc(PSPFTM:'4')));
       outweb_(%subst(%str(%addr(H__7(88))):77:168));
       revolvebox0();
       outweb_(%subst(%str(%addr(H__7(91))):5:243));
       AfToPage_(%trim(%editc(PSPERCENT:'4')));
       outweb_(%subst(%str(%addr(H__7(94))):8:236));
       wfrtn__ = AfToPage_(PSPGROUP);
       outweb_(%subst(%str(%addr(H__7(97))):4:56));
       if (client = '104');
        outweb_(%subst(%str(%addr(H__9(1))):1:480));
       endif;
       outweb_(%subst(%str(%addr(H__7(97))):60:217));
       wfrtn__ = AfToPage_(PSPMINDLR);
       outweb_(%subst(%str(%addr(H__7(100))):37:229));
       wfrtn__ = AfToPage_(PSPMAXDLR);
       outweb_(%subst(%str(%addr(H__7(103))):26:237));
       wfrtn__ = AfToPage_(PEXMINDLR);
       outweb_(%subst(%str(%addr(H__7(106))):23:237));
       wfrtn__ = AfToPage_(PEXMAXDLR);
       outweb_(%subst(%str(%addr(H__7(109))):20:231));
       AfToPage_(%trim(%editc(PSPBIDPCT:'4')));
       outweb_(%subst(%str(%addr(H__7(112))):11:233));
       AfToPage_(%trim(%editc(PMAXBIDPCT:'4')));
       outweb_(%subst(%str(%addr(H__7(115))):4:166));
       stipbox0();
       outweb_(%subst(%str(%addr(H__7(117))):10:196));
       ratepbox0();
       outweb_(%subst(%str(%addr(H__7(119))):46:1793));

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
        psprogram = getparm3_('psprogram':'*OPT');
        PSPORDER = %dec(aton_( getparm3_('PSPORDER':'*OPT'):46:16):7:0);
        pspstatus = getparm3_('pspstatus':'*OPT');
        pspdesc = getparm3_('pspdesc':'*OPT');
        PSPITERM = %dec(aton_( getparm3_('PSPITERM':'*OPT'):46:16):5:0);
        pspitmcd = getparm3_('pspitmcd':'*OPT');
        PSPPTM = %dec(aton_( getparm3_('PSPPTM':'*OPT'):46:16):5:0);
        pspptmcd = getparm3_('pspptmcd':'*OPT');
        pspnoint = getparm3_('pspnoint':'*OPT');
        PSPEAMT = %dec(aton_( getparm3_('PSPEAMT':'*OPT'):46:16):11:2);
        PSPEPCT = %dec(aton_( getparm3_('PSPEPCT':'*OPT'):46:16):8:5);
        PSPIPCT = %dec(aton_( getparm3_('PSPIPCT':'*OPT'):46:16):8:5);
        PSPIAMT = %dec(aton_( getparm3_('PSPIAMT':'*OPT'):46:16):11:2);
        PSPWPCT = %dec(aton_( getparm3_('PSPWPCT':'*OPT'):46:16):8:5);
        PSPWAMT = %dec(aton_( getparm3_('PSPWAMT':'*OPT'):46:16):11:2);
        PSPFTM = %dec(aton_( getparm3_('PSPFTM':'*OPT'):46:16):5:0);
        PSPRATE = %dec(aton_( getparm3_('PSPRATE':'*OPT'):46:16):8:5);
        psrevolve = getparm3_('psrevolve':'*OPT');
        PSPERCENT = %dec(aton_( getparm3_('PSPERCENT':'*OPT'):46:16):5:2);
        psinactive = getparm3_('psinactive':'*OPT');
        psabtmthd = getparm3_('psabtmthd':'*OPT');
        pspmindlr = getparm3_('pspmindlr':'*OPT');
        pspmaxdlr = getparm3_('pspmaxdlr':'*OPT');
        PSPBIDPCT = %dec(aton_( getparm3_('PSPBIDPCT':'*OPT'):46:16):3:0);
        pspstip = getparm3_('pspstip':'*OPT');
        pspgroup = getparm3_('pspgroup':'*OPT');
        pexmindlr = getparm3_('pexmindlr':'*OPT');
        pexmaxdlr = getparm3_('pexmaxdlr':'*OPT');
        PMAXBIDPCT = %dec(aton_( getparm3_('PMAXBIDPCT':'*OPT'):46:16):3:0);
        pspratep = getparm3_('pspratep':'*OPT');
        if (psrevolve <> 'Y');
         psrevolve = 'N';
        endif;
        WRITE RKWPPGM;
        RS003_ = RcdSts2_('WRTRCD': %error: %found: %eof);
        p_ztype = 'KWPPGM';
        p_zkeya = psprogram;
        AM002_ = CV_BYKEY;
        CHAIN(E) DL002_ RKWPDATA;
        RS002_ = RcdSts2_('GETRCD': %error: %found: %eof);
        p_zdesc = pspdesc;
        if (RS002_ = '1');
         RS002_ = UpdateRcd_('RKWPDATA');
        else;
         WRITE RKWPDATA;
         RS002_ = RcdSts2_('WRTRCD': %error: %found: %eof);
        endif;
       endif;
       if (mode = 'Change');
        rrn = %dec(aton_( getparm3_('rrn':'*MAND'):46:16):9:0);
        RR_003_ = rrn;
        AM003_ = CV_BYRRN;
        CHAIN(E) RR_003_ R__ARR003;
        RS003_ = RcdSts2_('GETRCD': %error: %found: %eof);
        psprogram = getparm3_('psprogram':'*OPT');
        pspdesc = getparm3_('pspdesc':'*OPT');
        PSPORDER = %dec(aton_( getparm3_('PSPORDER':'*OPT'):46:16):7:0);
        pspstatus = getparm3_('pspstatus':'*OPT');
        PSPITERM = %dec(aton_( getparm3_('PSPITERM':'*OPT'):46:16):5:0);
        pspitmcd = getparm3_('pspitmcd':'*OPT');
        PSPPTM = %dec(aton_( getparm3_('PSPPTM':'*OPT'):46:16):5:0);
        pspptmcd = getparm3_('pspptmcd':'*OPT');
        pspnoint = getparm3_('pspnoint':'*OPT');
        PSPEAMT = %dec(aton_( getparm3_('PSPEAMT':'*OPT'):46:16):11:2);
        PSPEPCT = %dec(aton_( getparm3_('PSPEPCT':'*OPT'):46:16):8:5);
        PSPIPCT = %dec(aton_( getparm3_('PSPIPCT':'*OPT'):46:16):8:5);
        PSPIAMT = %dec(aton_( getparm3_('PSPIAMT':'*OPT'):46:16):11:2);
        PSPWPCT = %dec(aton_( getparm3_('PSPWPCT':'*OPT'):46:16):8:5);
        PSPWAMT = %dec(aton_( getparm3_('PSPWAMT':'*OPT'):46:16):11:2);
        PSPFTM = %dec(aton_( getparm3_('PSPFTM':'*OPT'):46:16):5:0);
        PSPRATE = %dec(aton_( getparm3_('PSPRATE':'*OPT'):46:16):8:5);
        psrevolve = getparm3_('psrevolve':'*OPT');
        PSPERCENT = %dec(aton_( getparm3_('PSPERCENT':'*OPT'):46:16):5:2);
        psinactive = getparm3_('psinactive':'*OPT');
        psabtmthd = getparm3_('psabtmthd':'*OPT');
        pspmindlr = getparm3_('pspmindlr':'*OPT');
        pspmaxdlr = getparm3_('pspmaxdlr':'*OPT');
        PSPBIDPCT = %dec(aton_( getparm3_('PSPBIDPCT':'*OPT'):46:16):3:0);
        pspstip = getparm3_('pspstip':'*OPT');
        pspgroup = getparm3_('pspgroup':'*OPT');
        pexmindlr = getparm3_('pexmindlr':'*OPT');
        pexmaxdlr = getparm3_('pexmaxdlr':'*OPT');
        PMAXBIDPCT = %dec(aton_( getparm3_('PMAXBIDPCT':'*OPT'):46:16):3:0);
        pspratep = getparm3_('pspratep':'*OPT');
        RS003_ = UpdateRcd_('RKWPPGM');
        p_ztype = 'KWPPGM';
        p_zkeya = psprogram;
        AM002_ = CV_BYKEY;
        CHAIN(E) DL002_ RKWPDATA;
        RS002_ = RcdSts2_('GETRCD': %error: %found: %eof);
        p_zdesc = pspdesc;
        if (RS002_ = '1');
         RS002_ = UpdateRcd_('RKWPDATA');
        else;
         WRITE RKWPDATA;
         RS002_ = RcdSts2_('WRTRCD': %error: %found: %eof);
        endif;
       endif;
       Redirect2_( '?rrn=' + savedrrn:'*SAME':'rand');
      /end-free
     c     *PSSR         begsr
     c                   endsr
     P                 E


     P*---------------------------------------------------------------------
     P* nointbox0...                - User defined function
     P*---------------------------------------------------------------------
     P nointbox0...
     P                 B
     D nointbox0...
     D                 PI




      /free
       boxtype = 'SYSTEM';
       p_ztype = 'YESNO';
       boxname = 'PSPNOINT';
       boxid = 'PSPNOINT';
       boxselect = pspnoint;
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
     P* psabtmthdbox0...            - User defined function
     P*---------------------------------------------------------------------
     P psabtmthdbox0...
     P                 B
     D psabtmthdbox0...
     D                 PI




      /free
       boxtype = 'SYSTEM';
       p_ztype = 'ABATEMETHOD';
       boxname = 'PSABTMTHD';
       boxid = 'PSABTMTHD';
       boxselect = psabtmthd;
       jvalidation = '';
       blank = 'N';
      /end-free
     C                   EVAL      QPGM__=%trim('KWWEB'     ) + '/' + 'SELBOXN'
     C                   CALL      QPGM__                               90
     C                   PARM                    p_ztype
     C                   PARM                    boxname
     C                   PARM                    boxid
     C                   PARM                    boxselect
     C                   PARM                    boxtype
     C                   PARM                    jvalidation
     C                   PARM                    blank
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
     P* revolvebox0...              - User defined function
     P*---------------------------------------------------------------------
     P revolvebox0...
     P                 B
     D revolvebox0...
     D                 PI




      /free
       boxtype = 'SYSTEM';
       p_ztype = 'YESNO';
       boxname = 'PSREVOLVE';
       boxid = 'PSREVOLVE';
       boxselect = psrevolve;
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
     P* stipbox0...                 - User defined function
     P*---------------------------------------------------------------------
     P stipbox0...
     P                 B
     D stipbox0...
     D                 PI




      /free
       boxtype = '';
       p_ztype = 'TRACK.STIP';
       boxname = 'PSPSTIP';
       boxid = 'PSPSTIP';
       boxselect = pspstip;
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
     P* pspitmcdbox0...             - User defined function
     P*---------------------------------------------------------------------
     P pspitmcdbox0...
     P                 B
     D pspitmcdbox0...
     D                 PI




      /free
       OutWeb_('<select name="PSPITMCD" onChange="updateVal(this);" size="1">-
       ');
       OutWeb_('<option value=" "> </option>');
       if (pspitmcd = 'M');
        OutWeb_(%trimr( '<option value="' + 'M' + '" selected>' + 'Months' +
       '</option>'));
       else;
        OutWeb_(%trimr( '<option value="' + 'M' + '">' + 'Months' + '</option-
       >'));
       endif;
       if (pspitmcd = 'D');
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
     P* pspptmcdbox0...             - User defined function
     P*---------------------------------------------------------------------
     P pspptmcdbox0...
     P                 B
     D pspptmcdbox0...
     D                 PI




      /free
       OutWeb_('<select name="PSPPTMCD" onChange="updateVal(this);" size="1">-
       ');
       OutWeb_('<option value=" "> </option>');
       if (pspptmcd = 'M');
        OutWeb_(%trimr( '<option value="' + 'M' + '" selected>' + 'Months' +
       '</option>'));
       else;
        OutWeb_(%trimr( '<option value="' + 'M' + '">' + 'Months' + '</option-
       >'));
       endif;
       if (pspptmcd = 'D');
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
     P* ratepbox0...                - User defined function
     P*---------------------------------------------------------------------
     P ratepbox0...
     P                 B
     D ratepbox0...
     D                 PI




      /free
       boxtype = 'SYSTEM';
       p_ztype = 'YESNO';
       boxname = 'PSPRATEP';
       boxid = 'PSRPRATEP';
       boxselect = pspratep;
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
         OPEN(E) KWPPGM;             //    KWPPGM
         if        %error;
          return %error;
         endif;
        else;
         OPEN KWPPGM;                //    KWPPGM
        endif;
       endif;
       if   (file__='KWPPGM' or file__='*ALL')  and NOT %OPEN(F__ARR003);
        ovrdbf_(ovrflag__:'F__ARR003':'KWPPGM' : '*LIBL' : mbr__);
        if   erropen__ = 'Y';
         OPEN(E) F__ARR003;          //   KWPPGM
         if        %error;
          return %error;
         endif;
        else;
         OPEN F__ARR003;            //    KWPPGM
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
       when      rcdfmt__='RKWPDATA' and AM002_ = CV_ByKey and RS002_ = *ON ;
       update RKWPDATA;
       when      rcdfmt__='RKWPPGM' and AM003_ = CV_ByKey and RS003_ = *ON ;
       update RKWPPGM;
       when      rcdfmt__='RKWPPGM' and AM003_ = CV_ByRrn and RS003_ = *ON ;
       update R__ARR003;
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
       when      rcdfmt__='RKWPDATA' and AM002_ = CV_ByKey and RS002_ = *ON ;
       delete RKWPDATA;
       when      rcdfmt__='RKWPPGM' and AM003_ = CV_ByKey and RS003_ = *ON ;
       delete RKWPPGM;
       when      rcdfmt__='RKWPPGM' and AM003_ = CV_ByRrn and RS003_ = *ON ;
       delete R__ARR003;
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
**CTDATA H__1        ListHeader                       2981
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.or
g/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>
    <meta name="genera
tor" content="WebSmart" />
    <meta http-equiv="Pragma" content="no-cache" />

   <title>System Settings:  Programs</title>
    <link rel="stylesheet" type="te
xt/css" href="/websmart/kwikloan/styles/klstylei.css" media="screen, tv, project
ion" />
    <link rel="stylesheet" type="text/css" href="/websmart/kwikloan/styl
es/klstyleInquiryList.css" media="screen, tv, projection" />
    <script type="t
ext/javascript" src="/websmart/kwikloan/javascript/klscripts.js"></script>
  </h
ead>
  <body>
    <div id="wrapping">
      <div id="everything">
        <div i
d="pagetitle">
          <span>System Settings:  Programs</span>
        </div>
 
        <div id="whitebg" class="whitebg">
          <div class="left">

      <table class="actionsTable">
              <!-- <tr><td><a href="#" onclic
k="window.location='?task=beginmanage&rrn=0&rnd='"><img src="https://sv1.america
nfirstfinance.com:8158/websmart/kwikloan/images/modalIconsAN.png"></a><span clas
s="LSlabel"></span></td></tr>-->     
              <tr><td><a href="#" onclick=
""><img src="/websmart/kwikloan/images/loanInqADD.png"></a><span class="LSlabel"
></span></td></tr>     
              
            </table> 
            

      <form method="get" action="">
              <input type="hidden" name="tas
k" value="filter">
              <table class="accountInfo" id="loanSearchTable"
>
                <tr>
                  <td id="Lname"><span class="LSlabel">Lo
an Program:</span><br><input type="text" name="PSPROGRAM" size="11" maxlength="2
5"></td>
                </tr>
                <tr>
                  <td><br><b
r><input type="submit" value="Filter Results"><br>
                  </td>

           </tr>
                <tr>
                  <td><br><br><input type=
"button" onclick="javascript:location.href='?task=reorder&type=ce'; return false
;"value="Re-order CE programs"><br>
                  </td>
                </tr
>
                <tr>
                  <td><br><br><input type="button" onclic
k="javascript:location.href='?task=reorder&type=rev'; return false;"value="Re-or
der REV programs"><br>
                  </td>
                </tr>

   </table> 
            </form>
            
          </div><!--left-->

    <div class="right">
            <div id="scroller">
              <div id="s
ections" style="overflow-y: scroll;">
                <ul>
                <li>

                
                
                <table class="mainlist">

             <tr>
                    
                    

<th width="100">Action</th>
                    <th width="110" valign="top">Loa
n Program</th>
                    <th width="250">Program Description</th>

                
                    
                    
                  </t
r>

**CTDATA H__2        ListDetails                      553
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
  <td class="text right">: </td>
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

**CTDATA H__4        RcdDisplay                       4157
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.or
g/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>
    <meta name="genera
tor" content="WebSmart" />
    <meta http-equiv="Pragma" content="no-cache" />

   <title>System Settings:  Programs - Display</title>
    <link rel="stylesheet
" type="text/css" href="/websmart/kwikloan/styles/klstylei.css" media="screen, t
v, projection" />
    <script type="text/javascript" src="/websmart/kwikloan/jav
ascript/klscripts.js"></script>
    <script type="text/javascript" src="/websmar
t/kwikloan/javascript/klthemes.js"></script>
    <script type="text/javascript"
src="/websmart/v7.2/javascript/esdiapi010.js"></script>
  </head>
  <body>
    <
div id="wrapping">
      <div id="everything">
        
        
        <div id
="pagetitle">
          <span>System Settings: Programs</span>
        </div>

      
        <div id="whitebg">
          <div id="EDITtitle"><span>View Progr
am Settings</span></div>
          
          <div id="EDITcontents"> 

   
            <div id="navtop">
              
              
            </di
v>
            <table>
              
              <tr>
                <td cla
ss="left">Loan Program #:</td>
                <td class="right"></td>

     </tr>
                 <tr>
                <td class="left">Loan Program S
equence:</td>
                <td class="right"></td>
              </tr>

        <tr>
                <td class="left">Program Description:</td>

        <td class="right"></td>
              </tr>
              <tr>

       <td class="left">Interest Abatement Term:</td>
                <td class=
"right"> </td>
              </tr>
              <tr>
                <td class=
"left">Interest Abatement Term Code:</td>
                <td class="right"> </t
d>
                </tr>
              <tr>
                <td class="left">Int
erest Abatement Method:</td>
                <td class="right"></td>

   </tr>
                <tr>
                  <td class="left">Interest Free:<
/td>
                  <td class="right"></td>
                </tr>

     <tr>
                  <td class="left">Payment Abatement Term:</td>

            <td class="right"></td>
                </tr>
                <tr>

                 <td class="left">Payment Abatement Term Code:</td>

      <td class="right"></td>
                  </tr>
                  <tr>

                 <td class="left">Expense Fee Amt:</td>
                    <td
class="right"></td>
                  </tr>
                  <tr>

       <td class="left">Expense Fee Pct:</td>
                    <td class="rig
ht"></td>
                  </tr>
                  <tr>
                    <td
 class="left">Income Fee Amt:</td>
                    <td class="right"></td>

                 </tr>
                  <tr>
                    <td class="lef
t">Income Pct:</td>
                    <td class="right"></td>

  </tr>
                  <tr>
                    <td class="left">W/H Fee Amt:
</td>
                    <td class="right"></td>
                  </tr>

            <tr>
	                	<td class="left">Program Group</td>
	
        	<td class="right"></td>
	                </tr>
	                <tr>
	
               	<td class="left">Min Dealer</td>
	                	<td class="ri
ght"></td>
	                </tr>
	                <tr>
	                	<td cl
ass="left">Max Dealer</td>
	                	<td class="right"></td>
	
      </tr>
	                <tr>
	                	<td class="left">Min Bid %ag
e</td>
	                	<td class="right"></td>
	                </tr>
	
         <tr>
	                	<td class="left">Required Stipulation</td>
	
            	<td class="right"></td>
	                </tr>
	                <tr
>
	                	<td class="left">1.5% Payment Factor</td>
	                	
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
**CTDATA H__7        RcdManage                        11278
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.or
g/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>
    <meta name="genera
tor" content="WebSmart" />
    <meta http-equiv="Pragma" content="no-cache" />

   <title>System Settings:  Programs - Add or Change</title>
    <style type="te
xt/css">
    
    </style>
    <script type="text/javascript" src="/websmart/kwi
kloan/javascript/klscripts.js"></script>
    <script type="text/javascript" src=
"/websmart/kwikloan/javascript/klthemes.js"></script>
    <script type="text/jav
ascript" src="/websmart/v7.2/javascript/esdiapi010.js"></script>
    <script typ
e="text/javascript" src="/k_com/jqLatest.js"></script>
    <script type="text/ja
vascript">
		xl_AttachEvent(window, "load", WindowInit); 

		function WindowInit
()
		{
			xl_FocusFirstElement();
		}
		
		$(document).ready(function(){
			
			
if ($("#psin").val() == "Y")
				$("#psin1").prop('checked', true);
			else if (
$("#psin").val() == "N")
				$("#psin2").prop('checked', true);
				
			if ($("#
PSPERCENT").val() == 1.50) {
				$("#PSPMTFCT").val("Y");
			}
			else {
				$("
#PSPMTFCT").val("N");	
			}
		});
		
	</script>
  </head>
  <body onload="getSta
t();">
    <form action="" method="get">
      <input type="hidden" name="task"
value="endmanage">
      <input type="hidden" name="rrn" value="">
      <input
type="hidden" name="FirstRowRRN" value="">
      <div id="pagetitle">
        

       <span>System Settings: Programs</span>
        
        <!---------------
-- TOP BUTTONS ------------------------>
        <div id="topBtns">
          <i
nput type="submit" class="navbutton" name="mode" value="Add">
          <script
type="text/javascript">
    		 function getStat()
   			  {
			var protkey = "";
   
			if( == 0)
			{
		
			xl_GetFormElementByName("mode").value = "Add";
			}

			else 
			{
				protkey  = xl_GetFormElementByName("PSPROGRAM");
				//protke
y.disabled = true; ANDREA
				//protkey.className = protkey.className + " disabl
ed";
				xl_GetFormElementByName("mode").value = "Change";
			}
		}
		</script>

          
          <button class="navbutton" onclick="javascript:location.href
='?rrn=;return false;'">Cancel</button>
        </div>
        <!---------------
-- END TOP BUTTONS ------------------------>
      </div>
      
      <div id="
wrapping">
        
        
        <div id="whitebg">
          
          <di
v id="EDITcontents"> 
            
            <table id="holderTable">

      
              
              <tr>
                <th>Program Settings</t
h>
              </tr>
              <tr>
                <td class="holderTd">

                  <table class="dealerTable">
                    

       <tr>
                      <td class="left">Hide from Kwik-Dealer:</td>

                     <input type="hidden" id="psin" value="">

    <td class="right">Yes<input type="radio" id="psin1" name="PSINACTIVE" value=
"Y"><br>No&nbsp;<input type="radio" id="psin2" name="PSINACTIVE" value="N"></td>

                    </tr>
                    <tr>
                      <td cl
ass="left">Loan Program #:</td>
                      <td class="right"><input t
ype="text" id="PSPROGRAM" name="PSPROGRAM" value="" maxlength="25"></td>

             </tr>
                    <tr>
                      <td class="lef
t">Loan Program Sequence:</td>
                      <td class="right"><input ty
pe="text" name="PSPORDER" id="PSPORDER" value=""></td>
                    </tr>

                    <tr>
                      <td class="left">Begin <span>"Co
mbined Promotions"</span> heading: (Y/N)</td>
                      <td class="r
ight"><input type="text" name="PSPSTATUS" size="1" maxlength="1" id="PSPSTATUS"
value=""></td>
                    </tr>
                    <tr>

        <td class="left">Program Description:</td>
                      <td cla
ss="right"> <textarea name="PSPDESC" id="PSPDESC" rows="10" cols="50"></textarea
></td>
                    </tr>
                    <tr>

<td class="left">Interest Abatement Term:</td>
                      <td class="
right"><input type="text" name="PSPITERM" size="5" maxlength="5" value=""></td>

                    </tr>
                    <tr>
                      <td cla
ss="left">Interest Abatement Term Code:</td>
                      <td class="ri
ght">
                      </tr>
                    <tr>

 <td class="left">Interest Abatement Method:</td>
                      <td clas
s="right"></td>
                    </tr>
                      <tr>

             <td class="left">Interest Free:</td>
                        <td co
lspan="2"></td>
                      </tr>
                      <tr>

               <td class="left">Payment Abatement Term:</td>

     <td class="right"><input type="text" name="PSPPTM" size="5" maxlength="5" v
alue=""></td>
                      </tr>
                      <tr>

             <td class="left">Payment Abatement Term Code:</td>

        <td class="right">
                        </td>

 <tr>
                          <td class="left">Expense Fee Amt:</td>

                 <td class="right"><input type="text" name="PSPEAMT" size="5" ma
xlength="5" value=""></td>
                        </tr>

 <tr>
                          <td class="left">Expense Fee Pct:</td>

                 <td class="right"><input type="text" name="PSPEPCT" size="5" ma
xlength="5" value=""></td>
                        </tr>

 <tr>
                          <td class="left">Income Fee Amt:</td>

                <td class="right"><input type="text" name="PSPIAMT" size="5" max
length="5" value=""></td>
                        </tr>

<tr>
                          <td class="left">Income Pct:</td>

           <td class="right"><input type="text" name="PSPIPCT" size="5" maxlengt
h="5" value=""></td>
                        </tr>
                        <tr>

                          <td class="left">W/H Fee Amt:</td>

       <td class="right"><input type="text" name="PSPWAMT" size="5" maxlength="5
" value=""></td>
                        </tr>
                        <tr>

                      <td class="left">W/H Fee Pct:</td>

   <td class="right"><input type="text" name="PSPWPCT" size="5" maxlength="5" va
lue=""></td>
                        </tr>
                        <tr>

                  <td class="left">Interest Rate:</td>

 <td class="right"><input type="text" name="PSPRATE" size="9" maxlength="9" valu
e=""></td>
                        </tr>
                        <tr>

                <td class="left">Loan Term:</td>
                          <td c
lass="right"><input type="text" name="PSPFTM" size="5" maxlength="5" value=""></
td>
                        </tr>
                        <tr>

         <td class="left">Revolving:</td>
                          <td colspan=
"2"></td>
                        </tr>
                        <tr>

               <td class="left">Payment Percentage:</td>

   <td class="right"><input type="text" name="PSPERCENT" size="5" maxlength="5"
value=""></td>
                        </tr>
                        <tr>
	
               	<td class="left">Program Group</td>
	                    	<td cl
ass="right"><input type="text" name="PSPGROUP" maxlength="40" id="PSPGROUP" valu
e=""></td>
	                    </tr>
	                    
	
 
	                    <tr>
	                    	<td class="left">Min Dealer</t
d>
	                    	<td class="right"><input type="text" name="PSPMINDLR" m
axlength="25" id="PSPMINDLR" value=""></td>
	                    </tr>
	
            <tr>
	                    	<td class="left">Max Dealer</td>
	
             	<td class="right"><input type="text" name="PSPMAXDLR" maxlength="2
5" id="PSPMAXDLR" value=""></td>
	                    </tr>
	
 <tr>
	                    	<td class="left">Exclude Min Dealer</td>
	
          	<td class="right"><input type="text" name="PEXMINDLR" maxlength="25"
id="PEXMINDLR" value=""></td>
	                    </tr>
	                    <t
r>
	                    	<td class="left">Exclude Max Dealer</td>
	
       	<td class="right"><input type="text" name="PEXMAXDLR" maxlength="25" id=
"PEXMAXDLR" value=""></td>
	                    </tr>
	                    <tr>

	                    	<td class="left">Min Bid %age</td>
	                    	<
td class="right"><input type="text" name="PSPBIDPCT" maxlength="40" id="PSPBIDPC
T" value=""></td>
	                    </tr>
	                    <tr>
	
            	<td class="left">Max Bid %age</td>
	                    	<td class=
"right"><input type="text" name="PMAXBIDPCT" maxlength="40" id="PMAXBIDPCT" valu
e=""></td>
	                    </tr>
	                    <tr>
	
     	<td class="left">Required Stipulation</td>
	                    	<td class
="right"></td>
	                    </tr>
                         

             <tr>
                        <td class="left">Interest Rate Promo:<
/td>
                        <td colspan="2"></td>
                      </tr>

                       <tr>
                        	<td class="left">1.5% Payme
nt Factor</td>
                        	<td class="right">

   		<select id="PSPMTFCT" name="PSPMTFCT">
                        			<option v
alue="Y">Yes</option>
                        			<option value="N">No</option>

                       		</select>
                        	</td>

          </tr>
                        
                      </table>

            </td>
                  </tr>
                </table>

   
                
              </div><!--whitebg-->
            </div><!--ed
it contents-->
          </div><!--wrapper-->
        </form>
        
        <
script type="text/javascript">
        	$('input:radio[name=presets]').change(fu
nction(){
        		switch($(this).val()){
        			case 'ALL':
        				$(
"#PSPMINDLR").val('');
        				$("#PSPMAXDLR").val('');
        				$("#PSPB
IDPCT").val('');
        				$("#PSPSTIP").val('');
        			break;
        		
	
        			case 'PrimePlus':
        				$("#PSPMINDLR").val('0');
        			
	$("#PSPMAXDLR").val('10999.999');
        				$("#PSPBIDPCT").val('100');

   				$("#PSPSTIP").val('');
        			break;
        			
        			case 'Sup
erPrime':
        				$("#PSPMINDLR").val('0');
        				$("#PSPMAXDLR").val(
'10999.999');
        				$("#PSPBIDPCT").val('100');
        				$("#PSPSTIP").
val('QUALSUPERPRIME');
        			break;
        			
        			case 'VAC':

    				$("#PSPMINDLR").val('11000');
        				$("#PSPMAXDLR").val('18999');

        				$("#PSPBIDPCT").val('');
        				$("#PSPSTIP").val('');

			break;
        		}
        	});
        </script>
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


**CTDATA H__9        FNDPresets                       480
<tr>
	<td colspan="2">
		<p>Dealer Limitation Presets</p>
		<input type="radio"
name="presets" id="preset1" value="ALL"><label for="preset1">All</label>
		<inpu
t type="radio" name="presets" id="preset2" value="PrimePlus"><label for="preset2
">PrimePlus</label>
		<input type="radio" name="presets" id="preset3" value="Sup
erPrime"><label for="preset3">SuperPrime</label>
		<input type="radio" name="pre
sets" id="preset4" value="VAC"><label for="preset4">VAC/RTL</label>
	</td>
</tr>

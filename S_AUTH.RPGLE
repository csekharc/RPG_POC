     H/TITLE  Transaction Limits
      * ProGen WebSmart Revision 28963
      * File overrides for compile command
      *__OV OVRDBF KWSQUE     KWSQUE
      *__OV OVRDBF KWTOTAL    KWTOTAL
      *__OV OVRDBF KWPLQUE    KWPLQUE
      *__OV OVRDBF KWPSBASE   KWPSBASE
      *__OV OVRDBF KWPLBASE   KWPLBASE
      *__OV OVRDBF KWPRULE    KWPRULE
      *__OV OVRDBF KWPUBASE   KWPUBASE
      *__OV OVRDBF ACPSTAPRVT ACPSTAPRVT
      *__OV OVRDBF KWTCACCT#T KWTCACCT#T
      *__OV OVRDBF KWIKUSER   KWIKUSER
      *__OV OVRDBF KWS_DATA   KWS_DATA
      *__OV OVRDBF KWHBASE    KWHBASE
      *__OV OVRDBF KWZ_POSTO  KWZ_POSTO
      *__OV OVRDBF KWZ_POSTI  KWZ_POSTI
      *__OV OVRDBF KWLBASE    KWLBASE
      *__OV OVRDBF KWSHIST    KWSHIST
      *__   Following values are used to create the server program
      *__RO Pgm  lib KWWEB      Pgm  S_AUTH
      *__AG          WEBSMART
      *__CL          *OBJLIBNAM
      *__SQ
      *__BD ECRTBND204
      *===============================================================*
      * Path:   s_auth.pdw
      * System: DESKTOP-HRQ4U30
      * Project:Kwik-Loan
      * Set:    Development
      * User:   seanp
      * Date Last Generated:   2018-11-14   15:12:05
      * Last Generated CRC: 8E1FBDAC 46BF4212 6AF35A40 4DF49103
      *===============================================================*
      */CPY *LIBL/PW_CSRC CPYRIGHT
      * File specifications
     FKWSQUE    IF   E           K DISK    USROPN
     F                                     INFDS(FID001_   )
     FKWTOTAL   IF   E           K DISK    USROPN
     F                                     INFDS(FID002_   )
     FKWPLQUE   IF   E           K DISK    USROPN
     F                                     INFDS(FID003_   )
     FKWPSBASE  IF   E           K DISK    USROPN
     F                                     INFDS(FID004_   )
     FKWPLBASE  IF   E           K DISK    USROPN
     F                                     INFDS(FID005_   )
     FKWPRULE   IF   E           K DISK    USROPN
     F                                     INFDS(FID006_   )
     FKWPUBASE  IF   E           K DISK    USROPN
     F                                     INFDS(FID007_   )
     FACPSTAPRVTIF   E           K DISK    USROPN
     F                                     INFDS(FID008_   )
     FKWTCACCT#TIF   E           K DISK    USROPN
     F                                     INFDS(FID009_   )
     FKWIKUSER  IF   E           K DISK    USROPN
     F                                     INFDS(FID010_   )
     FKWS_DATA  IF   E           K DISK    USROPN
     F                                     INFDS(FID011_   )
     FKWHBASE   IF   E           K DISK    USROPN
     F                                     INFDS(FID012_   )
     FKWLBASE   IF   E           K DISK    USROPN
     F                                     INFDS(FID015_   )
     FKWSHIST   IF   E           K DISK    USROPN
     F                                     INFDS(FID016_   )

     D PTL__           S             50    DIM(1) CTDATA PERRCD(1)
     D RTLLA__         S             11    DIM(180)

     D*+FLDDCL Field declarations

     Duserdata         DS                  INZ
     D client                         5A
     D userid                        32A
     D location                       5A
     Dqueds            DS                  INZ
     D q_no                          11S 0
     D q_amt                         11S 2

     D sqlstring       S             90A
     D rnd             S              6A
     D startrrn        S              9P 0
     D endrrn          S              9P 0
     D rcdcnt          S              5P 0
     D prevstate       S              5P 0
     D nextstate       S              5P 0
     D listsize        S              5P 0
     D rrn             S              9P 0
     D savedrrn        S              9A
     D pdpayments      S              1A
     D alphaque        S             11A
     D artncod         S              5A
     D prevpage        S              5P 0
     D nextpage        S              5P 0
     D qpct            S              7P 2
     D security        S              1A
     D pgaction        S              4A
     D pgdisp          S              5P 0
     D pg              S              5P 0
     D os              S              5P 0
     D lnstat          S             30A
     D selecttxt       S             30A
     D disabled        S             30A

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
     D RS015_          S              1A
     D AM015_          S              1A
     D RS016_          S              1A
     D AM016_          S              1A


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


     D H__1            S             80    PERRCD(1) CTDATA DIM(36          )

     D H__2            S             80    PERRCD(1) CTDATA DIM(5           )

     D H__3            S             80    PERRCD(1) CTDATA DIM(3           )

     D H__4            S             80    PERRCD(1) CTDATA DIM(25          )

     D H__5            S             80    PERRCD(1) CTDATA DIM(1           )


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
     D FID015_         DS
     D  RR_015_              397    400B 0
     D FID016_         DS
     D  RR_016_              397    400B 0


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
     D user_prof_box0...
     D                 PR
     D update0...
     D                 PR
     D CURTIME__       S              6P 0
     D QPGMNAM__       S             20A
     D SmurfChk__      S              1A   INZ(*ON)
     D Smurf_ID__      S             64A   IMPORT
     D Smurf_Rw__      S              9B 0 IMPORT

     D mtminseq        S                   LIKE(mtminseq#     )
     D userprofile     S                   LIKE(s_zkeyn       )
     D pdno            S                   LIKE(dbsno         )
     D osno            S                   LIKE(dbsno         )
     D pdamt           S                   LIKE(dbsamt        )
     D osamt           S                   LIKE(dbsamt        )
     D desc            S                   LIKE(plnam1        )

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
     C                   KFLD                    sqcode
     C     DL003_        KLIST
     C                   KFLD                    plno
     C                   KFLD                    plque
     C     DL002_        KLIST
     C                   KFLD                    dbsbr
     C                   KFLD                    dbsdate
     C                   KFLD                    dbstype
     C                   KFLD                    dbstc
     C                   KFLD                    dbsdrcr
     C                   KFLD                    dbsaffect
     C                   KFLD                    dbssub1
     C                   KFLD                    dbsgl
     C     DL005_        KLIST
     C                   KFLD                    plno
     C     DL006_        KLIST
     C                   KFLD                    pruletype
     C                   KFLD                    prulename
     C     DL007_        KLIST
     C                   KFLD                    userid
     C     DL008_        KLIST
     C                   KFLD                    paidentity
     C     DL015_        KLIST
     C                   KFLD                    mcust
     C                   KFLD                    macct
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
       security = kw_security(userid:'AUTHLIST.PGM');
       if (security = '0');
        Redirect2_('dash.pgm':'*SAME');
        return ;
       endif;
       AM007_ = CV_BYKEY;
       CHAIN(NE) DL007_ RKWPUBASE;
       RS007_ = RcdSts2_('GETRCD': %error: %found: %eof);
       SetSmurf_('LASTPGM':QPGMNAM__);
       startrrn = %dec(aton_( getparm3_('rrn':'*OPT'):46:16):9:0);
       userprofile = 0;
       userprofile = %dec(aton_( getparm3_('userprofile':'*OPT'):46:16):11:0);
       if (userprofile = 0);
        userprofile = 10;
       endif;
       if (task__ = 'DEFAULT');
        taskran__ = *ON;
        display0();
       endif ;
       if (task__ = 'AJAX_UPDATE');
        taskran__ = *ON;
        update0();
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
       outweb_(%subst(%str(%addr(H__1(1))):1:2182));
       user_prof_box0();
       outweb_(%subst(%str(%addr(H__1(28))):23:663));

      /end-free
     C/Exec SQL
     C+  select PUPROFILE into :PUPROFILE from KWPUBASE where PUID = :userid
     C/End-Exec
      /free
       if ( %trim(puprofile) <> '');
      /end-free
     C/Exec SQL
     C+  select S_ZKEYN into :S_ZKEYN from KWSYS.KWS_DATA where S_ZTYPE = 'USERP
     C+ ROFILE' and S_ZKEYA = :PUPROFILE
     C/End-Exec
      /free
        if (S_ZKEYN <= 40);
         disabled = 'disabled="disabled"';
        endif;
       endif;
       rcdcnt = 1;
      /end-free
     C/Exec SQL
     C+  declare ATH cursor for select MTTC, MTDESCRIPT, MTMINSEQ#, MTGLACCT#, M
     C+ TLOANTYPE, MTLOANSTTS, MTMAXBLNCE from KWTCACCT#T where MTMINSEQ# = :use
     C+ rprofile order by MTDESCRIPT asc
     C/End-Exec
      /free
      /end-free
     C/Exec SQL
     C+  open ATH
     C/End-Exec
      /free
      /end-free
     C/Exec SQL
     C+  fetch next from ATH into :MTTC, :MTDESCRIPT, :MTMINSEQ#, :MTGLACCT#, :M
     C+ TLOANTYPE, :MTLOANSTTS, :MTMAXBLNCE
     C/End-Exec
      /free
       dow ((((SQLCOD <> 100) and (SQLCOD >= 0))));
      /end-free
     C/Exec SQL
     C+  select SHDESC into :SHDESC from KWSHIST where SHCODE = :MTTC
     C/End-Exec
      /free
       if (mtloanstts = 'O');
        lnstat = 'Open';
       endif;
       if (mtloanstts = 'C');
        lnstat = 'Charge-Off';
       endif;
       Flip_Rc_();
       outweb_(%subst(%str(%addr(H__2(1))):1:11));
       wfrtn__ = AfToPage_(ARCLR__);
       outweb_(%subst(%str(%addr(H__2(1))):12:25));
       wfrtn__ = AfToPage_(htmlencode_(MTDESCRIPT));
       outweb_(%subst(%str(%addr(H__2(1))):37:30));
       AfToPage_(%trim(%editc(MTTC:'P')));
       outweb_(%subst(%str(%addr(H__2(1))):67:30));
       wfrtn__ = AfToPage_(htmlencode_(SHDESC));
       outweb_(%subst(%str(%addr(H__2(2))):17:30));
       wfrtn__ = AfToPage_(htmlencode_(MTLOANTYPE));
       outweb_(%subst(%str(%addr(H__2(2))):47:30));
       wfrtn__ = AfToPage_(htmlencode_(LNSTAT));
       outweb_(%subst(%str(%addr(H__2(2))):77:42));
       AfToPage_(%trim(%editc(RCDCNT:'P')));
       outweb_(%subst(%str(%addr(H__2(3))):39:9));
       AfToPage_(%trim(%editc(MTMAXBLNCE:'J')));
       outweb_(%subst(%str(%addr(H__2(3))):48:2));
       wfrtn__ = AfToPage_(DISABLED);
       outweb_(%subst(%str(%addr(H__2(3))):50:65));
       AfToPage_(%trim(%editc(RCDCNT:'P')));
       outweb_(%subst(%str(%addr(H__2(4))):35:11));
       AfToPage_(%trim(%editc(MTTC:'P')));
       outweb_(%subst(%str(%addr(H__2(4))):46:11));
       wfrtn__ = AfToPage_(MTLOANSTTS);
       outweb_(%subst(%str(%addr(H__2(4))):57:11));
       wfrtn__ = AfToPage_(MTLOANTYPE);
       outweb_(%subst(%str(%addr(H__2(4))):68:12));
       AfToPage_(%trim(%editc(MTMINSEQ#:'P')));
       outweb_(%subst(%str(%addr(H__2(4))):80:24));
       wfrtn__ = AfToPage_(DISABLED);
       outweb_(%subst(%str(%addr(H__2(5))):24:29));
       mtdescript = '';
       lnstat = '';
       shdesc = '';
       MTMAXBLNCE = 0;
       rcdcnt = rcdcnt + 1;
      /end-free
     C/Exec SQL
     C+  fetch next from ATH into :MTTC, :MTDESCRIPT, :MTMINSEQ#, :MTGLACCT#, :M
     C+ TLOANTYPE, :MTLOANSTTS, :MTMAXBLNCE
     C/End-Exec
      /free
       enddo;
       outweb_(%subst(%str(%addr(H__3(1))):1:151));
       outweb_(%subst(%str(%addr(H__4(1))):1:179));
       wfrtn__ = AfToPage_(htmlencode_(QPGMNAM__));
       outweb_(%subst(%str(%addr(H__4(3))):20:690));
       wfrtn__ = AfToPage_(htmlencode_(QPGMNAM__));
       outweb_(%subst(%str(%addr(H__4(11))):70:1088));
       outweb_(%subst(%str(%addr(H__3(2))):72:16));

      /end-free
     C/Exec SQL
     C+  close ATH
     C/End-Exec
      /free
      /end-free
     c     *PSSR         begsr
     c                   endsr
     P                 E


     P*---------------------------------------------------------------------
     P* user_prof_box0...           - User defined function
     P*---------------------------------------------------------------------
     P user_prof_box0...
     P                 B
     D user_prof_box0...
     D                 PI




      /free
       OutWeb_('<select type="select-one" name="userprofile" id="userprofile"-
        value="" style="width: 174px; padding: 3px; font-size: 12px;">');
      /end-free
     C/Exec SQL
     C+  declare UP cursor for select S_ZKEYN, S_ZDESC from KWS_DATA where S_ZTY
     C+ PE = 'USERPROFILE' order by S_ZKEYN asc, S_ZKEYA asc
     C/End-Exec
      /free
      /end-free
     C/Exec SQL
     C+  open UP
     C/End-Exec
      /free
      /end-free
     C/Exec SQL
     C+  fetch next from UP into :S_ZKEYN, :S_ZDESC
     C/End-Exec
      /free
       dow ((((SQLCOD <> 100) and (SQLCOD >= 0))));
       if (userprofile = S_ZKEYN);
        selecttxt = 'selected="selected"';
       else;
        selecttxt = '';
       endif;
       OutWeb_(%trimr( '<option ' + %trim(selecttxt) + ' value="' + %trim(
       %editc(S_ZKEYN:'P')) + '">' + %trim(s_zdesc) + '</option>'));
      /end-free
     C/Exec SQL
     C+  fetch next from UP into :S_ZKEYN, :S_ZDESC
     C/End-Exec
      /free
       enddo;
       OutWeb_('</select>');
      /end-free
     C/Exec SQL
     C+  close UP
     C/End-Exec
      /free
      /end-free
     c     *PSSR         begsr
     c                   endsr
     P                 E


     P*---------------------------------------------------------------------
     P* update0...                  - User defined function
     P*---------------------------------------------------------------------
     P update0...
     P                 B
     D update0...
     D                 PI




      /free
       MTTC = 0;
       mtminseq = 0;
       mtminseq# = 0;
       mtloantype = '';
       mtloanstts = '';
       MTMAXBLNCE = 0;
       MTTC = %dec(aton_( getparm3_('MTTC':'*OPT'):46:16):5:0);
       mtminseq = %dec(aton_( getparm3_('mtminseq':'*OPT'):46:16):3:0);
       mtloantype = getparm3_('mtloantype':'*OPT');
       mtloanstts = getparm3_('mtloanstts':'*OPT');
       MTMAXBLNCE = %dec(aton_( getparm3_('MTMAXBLNCE':'*OPT'):46:16):11:2);
       mtminseq# = mtminseq;
       if ((((((MTTC = 0)) or ((mtminseq# = 0)) or ((mtloantype = '')) or ((
       mtloanstts = ''))))));
        OutWeb_('error|Required information for update was not recieved.  Ple-
       ase try again.');
        return ;
       endif;
      /end-free
     C/Exec SQL
     C+  update KWTCACCT#T set MTMAXBLNCE = :MTMAXBLNCE where MTTC = :MTTC and M
     C+ TMINSEQ# = :MTMINSEQ# and MTLOANTYPE = :MTLOANTYPE and MTLOANSTTS = :MTL
     C+ OANSTTS
     C/End-Exec
      /free
       if ((((SQLCOD <> 100) and (SQLCOD >= 0))));
        OutWeb_('success|Update Complete!');
       else;
        OutWeb_('error|There was an issue with the update.  Please try again.-
       ');
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
       rtlla__(1) = 'KWSYS';
       rtlla__(2) = 'KWDB';
       rtlla__(3) = 'KWDB108';
       rtlla__(4) = 'KWIK';
       rtlla__(5) = 'KWPGM';

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
       if   ((file__='KWTOTAL' or file__='*ALL') and NOT %OPEN(KWTOTAL));
        if (mbr__ <> '*FIRST');
         ovrdbf_(ovrflag__:'KWTOTAL':'KWTOTAL' : '*LIBL' : mbr__);
        elseif ('KWTOTAL' <> 'KWTOTAL');
         ovrdbf_(ovrflag__:'KWTOTAL':'KWTOTAL' : '*LIBL');
        endif;
        if    erropen__ = 'Y';
         OPEN(E) KWTOTAL;                //    KWTOTAL
         if        %error;
          return %error;
         endif;
        else;
         OPEN KWTOTAL;                //    KWTOTAL
        endif;
       endif;
       if   ((file__='KWPLQUE' or file__='*ALL') and NOT %OPEN(KWPLQUE));
        if (mbr__ <> '*FIRST');
         ovrdbf_(ovrflag__:'KWPLQUE':'KWPLQUE' : '*LIBL' : mbr__);
        elseif ('KWPLQUE' <> 'KWPLQUE');
         ovrdbf_(ovrflag__:'KWPLQUE':'KWPLQUE' : '*LIBL');
        endif;
        if    erropen__ = 'Y';
         OPEN(E) KWPLQUE;                //    KWPLQUE
         if        %error;
          return %error;
         endif;
        else;
         OPEN KWPLQUE;                //    KWPLQUE
        endif;
       endif;
       if   ((file__='KWPSBASE' or file__='*ALL') and NOT %OPEN(KWPSBASE));
        if (mbr__ <> '*FIRST');
         ovrdbf_(ovrflag__:'KWPSBASE':'KWPSBASE' : '*LIBL' : mbr__);
        elseif ('KWPSBASE' <> 'KWPSBASE');
         ovrdbf_(ovrflag__:'KWPSBASE':'KWPSBASE' : '*LIBL');
        endif;
        if    erropen__ = 'Y';
         OPEN(E) KWPSBASE;                //    KWPSBASE
         if        %error;
          return %error;
         endif;
        else;
         OPEN KWPSBASE;                //    KWPSBASE
        endif;
       endif;
       if   ((file__='KWPLBASE' or file__='*ALL') and NOT %OPEN(KWPLBASE));
        if (mbr__ <> '*FIRST');
         ovrdbf_(ovrflag__:'KWPLBASE':'KWPLBASE' : '*LIBL' : mbr__);
        elseif ('KWPLBASE' <> 'KWPLBASE');
         ovrdbf_(ovrflag__:'KWPLBASE':'KWPLBASE' : '*LIBL');
        endif;
        if    erropen__ = 'Y';
         OPEN(E) KWPLBASE;                //    KWPLBASE
         if        %error;
          return %error;
         endif;
        else;
         OPEN KWPLBASE;                //    KWPLBASE
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
       if   ((file__='ACPSTAPRVT' or file__='*ALL') and NOT %OPEN(ACPSTAPRVT));
        if (mbr__ <> '*FIRST');
         ovrdbf_(ovrflag__:'ACPSTAPRVT':'ACPSTAPRVT' : '*LIBL' : mbr__);
        elseif ('ACPSTAPRVT' <> 'ACPSTAPRVT');
         ovrdbf_(ovrflag__:'ACPSTAPRVT':'ACPSTAPRVT' : '*LIBL');
        endif;
        if    erropen__ = 'Y';
         OPEN(E) ACPSTAPRVT;                //    ACPSTAPRVT
         if        %error;
          return %error;
         endif;
        else;
         OPEN ACPSTAPRVT;                //    ACPSTAPRVT
        endif;
       endif;
       if   ((file__='KWTCACCT#T' or file__='*ALL') and NOT %OPEN(KWTCACCT#T));
        if (mbr__ <> '*FIRST');
         ovrdbf_(ovrflag__:'KWTCACCT#T':'KWTCACCT#T' : '*LIBL' : mbr__);
        elseif ('KWTCACCT#T' <> 'KWTCACCT#T');
         ovrdbf_(ovrflag__:'KWTCACCT#T':'KWTCACCT#T' : '*LIBL');
        endif;
        if    erropen__ = 'Y';
         OPEN(E) KWTCACCT#T;                //    KWTCACCT#T
         if        %error;
          return %error;
         endif;
        else;
         OPEN KWTCACCT#T;                //    KWTCACCT#T
        endif;
       endif;
       if   ((file__='KWIKUSER' or file__='*ALL') and NOT %OPEN(KWIKUSER));
        if (mbr__ <> '*FIRST');
         ovrdbf_(ovrflag__:'KWIKUSER':'KWIKUSER' : '*LIBL' : mbr__);
        elseif ('KWIKUSER' <> 'KWIKUSER');
         ovrdbf_(ovrflag__:'KWIKUSER':'KWIKUSER' : '*LIBL');
        endif;
        if    erropen__ = 'Y';
         OPEN(E) KWIKUSER;                //    KWIKUSER
         if        %error;
          return %error;
         endif;
        else;
         OPEN KWIKUSER;                //    KWIKUSER
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
       if   ((file__='KWSHIST' or file__='*ALL') and NOT %OPEN(KWSHIST));
        if (mbr__ <> '*FIRST');
         ovrdbf_(ovrflag__:'KWSHIST':'KWSHIST' : '*LIBL' : mbr__);
        elseif ('KWSHIST' <> 'KWSHIST');
         ovrdbf_(ovrflag__:'KWSHIST':'KWSHIST' : '*LIBL');
        endif;
        if    erropen__ = 'Y';
         OPEN(E) KWSHIST;                //    KWSHIST
         if        %error;
          return %error;
         endif;
        else;
         OPEN KWSHIST;                //    KWSHIST
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
Transaction Limits
**CTDATA H__1        AuthListHeader                   2845
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.or
g/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>
    <meta name="genera
tor" content="WebSmart" />
    <meta http-equiv="Pragma" content="no-cache" />

   <title>Authorization Limits</title>
    <link rel="stylesheet" type="text/css
" href="/websmart/kwikloan/styles/klstylei.css" media="screen, tv, projection" /
>
    <link rel="stylesheet" type="text/css" href="/websmart/kwikloan/styles/kls
tyleInquiryList.css" media="screen, tv, projection" />
	<script src="https://cod
e.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxl
twRo8QtmkMRdAu8="  crossorigin="anonymous"></script>
    <style type="text/css">

    	DIV.whitebg, DIV.right, DIV#scroller, DIV#sections{
    		min-height: 1900
px;
    	}
    	.page-indicator{
    		color: #fff;
    		font-size: 13px;
    	
	font-weight: bold;
    		padding-left: 5px;	
    	}
    	#pagetitle{
    		padd
ing: 15px;	
    	}
    	#whitebg{
    		min-width: 1300px;
    	}
		table.mainli
st{
			min-width: 1085px;
		}
		#sections,#scroller,.right{
			min-width: 1100px
;
		}
		.tableinputs{
			color: #fff;	
		}
		.tableinputtitle{
			font-weight: b
old;
			font-size: 14px;	
		}
    </style>
  </head>
  <body>
    <div id="wrapp
ing">
      <div id="everything">
        <div id="pagetitle">
          <span>S
ettings - Transaction Limits for User Profiles</span>
        </div>
        <di
v id="whitebg" class="whitebg">
          <!-- modal window boxes -->

<div id="modalOverlay" style="display: none;"></div>
          <div id="modalCon
tainer" style="display: none;">
            <div id="modalContent">

  <div class="modalHeader"><h3 id="headerText"></h3><a id="modalCloseA" class="m
odalCloseA" onclick="hideStuff();"><div id="modalCloseImg" class="modalCloseImg"
></div></a></div>
              <div id="modalFrameDiv"></div>
            </div
>
          </div>
          <!-- end modal window boxes -->
          <div clas
s="left"> 
            <table class="actionsTable">
           	  <tr><td class=
"tableinputs tableinputtitle">Choose Profile Type</td></tr>
           	  <tr><t
d class="tableinputs"></td></tr>
           	  <!--<tr><td class="tableinputs"><
button type="button" class="reload" style="padding: 3px;">Reload</button></td></
tr>-->
            </table> 
          </div><!--left-->
          <div class="r
ight">
            <div id="scroller">
              <div id="sections">

         <ul>
                <li>
                <table class="mainlist">
             
				<tr>
				  <th width="150">Friendly Name</th>
				  <th width=
"150">Tran Code</th>
				  <th width="150">Tran Desc</th>
				  <th width="150">
Acct. Type</th>
				  <th width="150">Acct. Stat</th>
				  <th width="150">Limi
t</th>
				  <th width="150"></th>
				</tr>

**CTDATA H__2        AuthListDetails                  372
<tr class="">
 <td class="text">
   
 </td>
 <td class="text">
   
 </td>
 <td c
lass="text">
   
 </td>
 <td class="text">
   
 </td>
 <td class="text">
   
 </
td>
 <td>
   <input class="auth-limit-" value="" >
 </td>
 <td>
   <button type=
"button" class="update" data-cnt="" data-tc="" data-ls="" data-lt=""  data-up=""
 style="padding: 3px;" >update</button>
 </td>
</tr>
**CTDATA H__3        AuthListFooter                   167
</table>
</li>
</ul>
</div><!--sections-->
</div><!--scroller-->
</div><!--right
-->
</div><!--whitebg-->
</div><!--everything-->
</div><!--wrapping-->

</body>

</html>
**CTDATA H__4        report_js                        1957
<script type="text/javascript">
     $(document).ready(function(){
 		$(document
).on('change','#userprofile',function(){
 			var userprofile = $(this).val();	
	
		location.href = "?userprofile="+userprofile;
			
 		});
 		
 		
 		$(document)
.on('click','.update',function(){
 			var id = $(this).attr('data-cnt');
 			
 	
		var tc = $(this).attr('data-tc');
 			var lt = $(this).attr('data-lt');
 			va
r ls = $(this).attr('data-ls');
 			
 			var up = $(this).attr('data-up');
 			

 			if(id == "" || tc == "" || lt == "" || ls == "" || up == ""){
 				alert('Re
quired data to update this value was not found. Please reload the page and try a
gain.');
 				return false;	
 			}
 			
 			var mb = $('.auth-limit-'+id).val();

 			
 			var query = "task=ajax_update&mttc="+tc+"&mtloantype="+lt+"&mtloanstts
="+ls+"&mtmaxblnce="+mb+"&mtminseq="+up;
 				
			$.ajax({
				url: "",
				data
: query,
				success: function(html)
				{
					if(html)
					{
						
						var
 html_split = html.split('|', 2);
						
						if(html_split[0] == "success")
		
				{
							$('.auth-limit-'+id).css({"background-color":" #33cc33"});
							$
('.auth-limit-'+id).css({"color":" #fff"});
							setTimeout(function(){
						
		$('.auth-limit-'+id).css({"background-color":" #fff"});
								$('.auth-limit
-'+id).css({"color":" #000"});
							},2000);
						}
						else
						{
						
	alert('There was an error: '+html_split[1]);	
							$('.auth-limit-'+id).css({
'background-color':' #cc0000'});
							$('.auth-limit-'+id).css({'color':' #fff
'});
							setTimeout(function(){
								$('.auth-limit-'+id).css({'background
-color':' #fff'});
								$('.auth-limit-'+id).css({'color':' #000'});
							}
,2000);
						}
						
						console.log(html);
					}
					if(!html)
					{
			
			alert('fail');	
					}
				},
				error: function(response) 
				{
		    		va
r r = jQuery.parseJSON(response.responseText);
		    		alert('error');
				}
		

			});	
			
 		});
     });
</script>
**CTDATA H__5        RtnToList                        65
<button onClick="javascript:location.href='?rrn=;'">Back</button>

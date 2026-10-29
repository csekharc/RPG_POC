     H/TITLE  System Settings:  Dealers
      * ProGen WebSmart Revision 21923
      * File overrides for compile command
      *__OV OVRDBF KWP_DATA   KWP_DATA
      *__OV OVRDBF KWPUBASE   KWPUBASE
      *__OV OVRDBF KWPSUCOD   KWPSUCOD
      *__OV OVRDBF F__ARR003  KWPSUCOD
      *__OV OVRDBF KWPSUFLD   KWPSUFLD
      *__OV OVRDBF KWPDLOC    KWPDLOC
      *__OV OVRDBF KWPDBASE   KWPDBASE
      *__   Following values are used to create the server program
      *__RO Pgm  lib KWWEB      Pgm  S_UCODE
      *__AG          WEBSMART
      *__CL          *OBJLIBNAM
      *__SQ
      *__BD ECRTBND195
      *===============================================================*
      * Path:   s_ucode.pdw
      * System: SEAN-DESK
      * Project:Kwik-Loan
      * Set:    Development
      * User:   Sean
      * Date Last Generated:   2016-03-31   15:15:25
      * Last Generated CRC: 4133C024 3149C455 658DFCD8 2DB7A59B
      *===============================================================*
YK02  * AECP-2968 Y.Kumar SOX - Enable User Code Screen for Roles that
YK02  *                   can Edit Dealer Settings
Yk02  * 06/23/2022        Modification Marker - YK02
      *===============================================================*
      */CPY *LIBL/PW_CSRC CPYRIGHT
      * File specifications
     FKWP_DATA  IF   E           K DISK    USROPN
     F                                     INFDS(FID001_   )
     FKWPUBASE  IF   E           K DISK    USROPN
     F                                     INFDS(FID002_   )
     FKWPSUCOD  UF A E           K DISK    USROPN
     F                                     INFDS(FID003_   )
     FF__ARR003 UF A E             DISK    USROPN
     F                                     RENAME(RKWPSUCOD    :R__ARR003   )
     FKWPSUFLD  IF   E           K DISK    USROPN
     F                                     INFDS(FID004_   )
     FKWPDLOC   IF   E           K DISK    USROPN
     F                                     INFDS(FID005_   )
     FKWPDBASE  IF   E           K DISK    USROPN
     F                                     INFDS(FID006_   )

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
     D query           S           1024A   varying
     D boxtype         S             10A
     D jvalidation     S             30A
Yk02 D wedtdlr         S              3A   inz
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


     D H__1            S             80    PERRCD(1) CTDATA DIM(30          )

     D H__2            S             80    PERRCD(1) CTDATA DIM(8           )

     D H__3            S             80    PERRCD(1) CTDATA DIM(10          )

     D H__4            S             80    PERRCD(1) CTDATA DIM(32          )

     D H__5            S             80    PERRCD(1) CTDATA DIM(3           )

     D H__6            S             80    PERRCD(1) CTDATA DIM(1           )

     D H__7            S             80    PERRCD(1) CTDATA DIM(52          )

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

     D filter0...
     D                 PR
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
     D usrnobox0...
     D                 PR
     D dlrbox0...
     D                 PR
     D officebox0...
     D                 PR
     D CURTIME__       S              6P 0
     D QPGMNAM__       S             20A
     D SmurfChk__      S              1A   INZ(*ON)
     D Smurf_ID__      S             64A   IMPORT
     D Smurf_Rw__      S              9B 0 IMPORT

     D dlrcode         S                   LIKE(psusrpdno     )
     D userprofile     S                   LIKE(puprofile     )
     D boxselect       S                   LIKE(p_zkeya       )
     D saveusrno       S                   LIKE(psusrno       )
     D savedesc        S                   LIKE(psusrdesc     )
     D savefile        S                   LIKE(psusrfile     )

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

     C     DL002_        KLIST
     C                   KFLD                    puid
     C     DL003_        KLIST
     C                   KFLD                    psusrfile
     C                   KFLD                    psusrno
     C                   KFLD                    psusrcode
     C     DL004_        KLIST
     C                   KFLD                    psusrfile
     C                   KFLD                    psusrtype
     C     userkey       KLIST
     C                   KFLD                    psusrfile
     C                   KFLD                    psusrtype
     C                   KFLD                    psusrno
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
       kw_wrtdataarea('*LDA':userid:'*LIBL':1:32);
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
       if (task__ = 'PREV');
        taskran__ = *ON;
        prev0();
       endif ;
       if (task__ = 'DISP');
        taskran__ = *ON;
        disprcd0();
       endif ;
       if (task__ = 'FILTER');
        taskran__ = *ON;
        filter0();
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
       if (task__ = 'OFFICEBOX');
        taskran__ = *ON;
        officebox0();
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
     P* filter0...                  - User defined function
     P*---------------------------------------------------------------------
     P filter0...
     P                 B
     D filter0...
     D                 PI




      /free
       puid = userid;
       AM002_ = CV_BYKEY;
       CHAIN(NE) DL002_ RKWPUBASE;
       RS002_ = RcdSts2_('GETRCD': %error: %found: %eof);
       userprofile = puprofile;
 yk02  //if (userprofile <> 'ADMINISTRATOR');
 yk02  if (wedtdlr  <> 'Yes');
        addhref = '';
       else;
        addhref = 'window.location=''s_dlr.pgm?task=beginmanage&rrn=0&rnd='
       + %trim(rnd) + '''';
       endif;
       psusrcode = getparm3_('psusrcode':'*OPT');
       if (psusrcode = '');
        displist0();
        Exit_Immed_();
       endif;
       outweb_(%subst(%str(%addr(H__1(1))):1:985));
       wfrtn__ = AfToPage_(QPGMNAM__);
       outweb_(%subst(%str(%addr(H__1(13))):26:28));
       wfrtn__ = AfToPage_(RND);
       outweb_(%subst(%str(%addr(H__1(13))):54:226));
       wfrtn__ = AfToPage_(QPGMNAM__);
       outweb_(%subst(%str(%addr(H__1(16))):40:1122));
       query = 'SELECT * from KWPSUCOD where upper(psusrcode) like ''%' +
       %XLATE(lo__:up__: %trim(psusrcode)) + '%''';
      /end-free
     C/Exec SQL
     C+            Declare users Scroll Cursor
     C+            For users
     C/End-Exec
     C/Exec SQL
     C+            Prepare users
     C+            From :query
     C/End-Exec
      /free
       if (sqlcod >= 0);
      /end-free
     C/Exec SQL
     C+            Open users
     C/End-Exec
      /free
       endif;
      /end-free
     C/Exec SQL
     C+  fetch next from users into :psusrfile, :psusrno, :psusrcode, :psusrdesc
     C+ , :psusrpdno, :psusrpdloc
     C/End-Exec
      /free
       dow (((sqlcod <> 100) and (sqlcod >= 0)));
       disphref = '<a href="s_ucode.pgm?TASK=disp&rrn=' + %trim(%editc(rrn:'P-
       ')) + '&FirstRowRRN=' + %trim(%editc(startrrn:'P')) + '"><img src="/we-
       bsmart/v7.2/Lincoln/images/view.gif" alt="Display" title="Display"></a-
       >';
 yk02  //if (userprofile <> 'ADMINISTRATOR');
 yk02  if (wedtdlr  <> 'Yes');
        edithref = '';
        delhref = '';
       else;
        edithref = '<a href="s_ucode.pgm?TASK=beginmanage&rrn=' + %trim(
       %editc(rrn:'P')) + '&FirstRowRRN=' + %trim(%editc(startrrn:'P')) + '">-
       <img src="/websmart/v7.2/Lincoln/images/edit.gif"  alt="Edit" title="E-
       dit"></a>';
        delhref = '<a href="s_ucode.pgm?TASK=delconf&rrn=' + %trim(%editc(
       rrn:'P')) + '&FirstRowRRN=' + %trim(%editc(startrrn:'P')) + '"><img sr-
       c="/websmart/v7.2/Lincoln/images/delete.gif" alt="Delete" title="Delet-
       e"></a>';
       endif;
       savedesc = psusrdesc;
       psusrtype = 'C';
       AM004_ = CV_BYKEY;
       CHAIN(NE) userkey RKWPSUFLD;
       RS004_ = RcdSts2_('GETRCD': %error: %found: %eof);
       pdnam1 = '';
       if (psusrpdno <> '');
      /end-free
     C/Exec SQL
     C+  select pdnam1 into :pdnam1 from kwpdloc where pdno = :psusrpdno and pdl
     C+ oc = :psusrpdloc
     C/End-Exec
      /free
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
       outweb_(%subst(%str(%addr(H__2(5))):9:131));
       wfrtn__ = AfToPage_(EDITHREF);
       outweb_(%subst(%str(%addr(H__2(6))):60:7));
       wfrtn__ = AfToPage_(DELHREF);
       outweb_(%subst(%str(%addr(H__2(6))):67:38));
       wfrtn__ = AfToPage_(PSUSRDESC);
       outweb_(%subst(%str(%addr(H__2(7))):25:25));
       wfrtn__ = AfToPage_(PSUSRCODE);
       outweb_(%subst(%str(%addr(H__2(7))):50:25));
       wfrtn__ = AfToPage_(PSUSRPDNO);
       outweb_(%subst(%str(%addr(H__2(7))):75:25));
       wfrtn__ = AfToPage_(PDNAM1);
       outweb_(%subst(%str(%addr(H__2(8))):20:25));
       wfrtn__ = AfToPage_(SAVEDESC);
       outweb_(%subst(%str(%addr(H__2(8))):45:12));

      /end-free
     C/Exec SQL
     C+  fetch next from users into :psusrfile, :psusrno, :psusrcode, :psusrdesc
     C+ , :psusrpdno, :psusrpdloc
     C/End-Exec
      /free
       enddo;
      /end-free
     C/Exec SQL
     C+  close users
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
 yk02  //if (userprofile <> 'ADMINISTRATOR');
 yk02  if (wedtdlr  <> 'Yes');
        addhref = '';
       else;
        addhref = 'window.location=''s_dlr.pgm?task=beginmanage&rrn=0&rnd='
       + %trim(rnd) + '''';
       endif;
       psusrcode = getparm3_('PSUSRCODE':'*OPT');
       outweb_(%subst(%str(%addr(H__1(1))):1:985));
       wfrtn__ = AfToPage_(QPGMNAM__);
       outweb_(%subst(%str(%addr(H__1(13))):26:28));
       wfrtn__ = AfToPage_(RND);
       outweb_(%subst(%str(%addr(H__1(13))):54:226));
       wfrtn__ = AfToPage_(QPGMNAM__);
       outweb_(%subst(%str(%addr(H__1(16))):40:1122));
       rcdcnt = 0;
       if (startrrn> 0);
        RR_003_ = startrrn;
        AM003_ = CV_BYRRN;
        CHAIN(NE) RR_003_ R__ARR003;
        RS003_ = RcdSts2_('GETRCD': %error: %found: %eof);
       endif;
       SETLL  DL003_ RKWPSUCOD;
       RS003_ = RcdSts2_('POSRCD':%error:%equal:%eof);
       READ(E)  RKWPSUCOD;
       RS003_ = RcdSts2_('GETNXTRCD':%error:%found:%eof);
       AM003_ = CV_ByKey;
       if (RS003_ <> '1');
        SETLL  *HIVAL RKWPSUCOD;
        RS003_ = RcdSts2_('POSRCD':%error:%equal:%eof);
        READ(E)  RKWPSUCOD;
        RS003_ = RcdSts2_('GETNXTRCD':%error:%found:%eof);
        AM003_ = CV_ByKey;
       endif;
       dow (RS003_ = '1');
       rrn = RR_003_;
       if (rcdcnt = 0);
        startrrn = RR_003_;
       endif;
       disphref = '<a href="s_ucode.pgm?TASK=disp&rrn=' + %trim(%editc(rrn:'P-
       ')) + '&FirstRowRRN=' + %trim(%editc(startrrn:'P')) + '"><img src="/we-
       bsmart/v7.2/Lincoln/images/view.gif" alt="Display" title="Display"></a-
       >';
 yk02  //if (userprofile <> 'ADMINISTRATOR');
 yk02  if (wedtdlr  <> 'Yes');
        edithref = '';
        delhref = '';
       else;
        edithref = '<a href="s_ucode.pgm?TASK=beginmanage&rrn=' + %trim(
       %editc(rrn:'P')) + '&FirstRowRRN=' + %trim(%editc(startrrn:'P')) + '">-
       <img src="/websmart/v7.2/Lincoln/images/edit.gif"  alt="Edit" title="E-
       dit"></a>';
        delhref = '<a href="s_ucode.pgm?TASK=delconf&rrn=' + %trim(%editc(
       rrn:'P')) + '&FirstRowRRN=' + %trim(%editc(startrrn:'P')) + '"><img sr-
       c="/websmart/v7.2/Lincoln/images/delete.gif" alt="Delete" title="Delet-
       e"></a>';
       endif;
       savedesc = psusrdesc;
       psusrtype = 'C';
       AM004_ = CV_BYKEY;
       CHAIN(NE) userkey RKWPSUFLD;
       RS004_ = RcdSts2_('GETRCD': %error: %found: %eof);
       pdnam1 = '';
       if (psusrpdno <> '');
      /end-free
     C/Exec SQL
     C+  select pdnam1 into :pdnam1 from kwpdloc where pdno = :psusrpdno and pdl
     C+ oc = :psusrpdloc
     C/End-Exec
      /free
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
       outweb_(%subst(%str(%addr(H__2(5))):9:131));
       wfrtn__ = AfToPage_(EDITHREF);
       outweb_(%subst(%str(%addr(H__2(6))):60:7));
       wfrtn__ = AfToPage_(DELHREF);
       outweb_(%subst(%str(%addr(H__2(6))):67:38));
       wfrtn__ = AfToPage_(PSUSRDESC);
       outweb_(%subst(%str(%addr(H__2(7))):25:25));
       wfrtn__ = AfToPage_(PSUSRCODE);
       outweb_(%subst(%str(%addr(H__2(7))):50:25));
       wfrtn__ = AfToPage_(PSUSRPDNO);
       outweb_(%subst(%str(%addr(H__2(7))):75:25));
       wfrtn__ = AfToPage_(PDNAM1);
       outweb_(%subst(%str(%addr(H__2(8))):20:25));
       wfrtn__ = AfToPage_(SAVEDESC);
       outweb_(%subst(%str(%addr(H__2(8))):45:12));
       endrrn = RR_003_;
       rcdcnt = rcdcnt + 1;
       READ(E)  RKWPSUCOD;
       RS003_ = RcdSts2_('GETNXTRCD':%error:%found:%eof);
       AM003_ = CV_ByKey;
       enddo;
       RR_003_ = startrrn;
       AM003_ = CV_BYRRN;
       CHAIN(NE) RR_003_ R__ARR003;
       RS003_ = RcdSts2_('GETRCD': %error: %found: %eof);
       SETLL  DL003_ RKWPSUCOD;
       RS003_ = RcdSts2_('POSRCD':%error:%equal:%eof);
       READP(E)  RKWPSUCOD;
       RS003_ = RcdSts2_('GETPRVRCD': %error: %found: %eof);
       AM003_ = CV_ByKey;
       if (RS003_ = '1');
        prevstate = 1;
       endif;
       if (rcdcnt = listsize);
        RR_003_ = endrrn;
        AM003_ = CV_BYRRN;
        CHAIN(NE) RR_003_ R__ARR003;
        RS003_ = RcdSts2_('GETRCD': %error: %found: %eof);
        SETGT  DL003_ RKWPSUCOD;
        RS003_ = RcdSts2_('POSRCD':%error:%equal:%eof);
        READ(E)  RKWPSUCOD;
        RS003_ = RcdSts2_('GETNXTRCD':%error:%found:%eof);
        AM003_ = CV_ByKey;
        if (RS003_ = '1');
         endrrn = RR_003_;
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
       RR_003_ = startrrn;
       AM003_ = CV_BYRRN;
       CHAIN(NE) RR_003_ R__ARR003;
       RS003_ = RcdSts2_('GETRCD': %error: %found: %eof);
       SETLL  DL003_ RKWPSUCOD;
       RS003_ = RcdSts2_('POSRCD':%error:%equal:%eof);
       READP(E)  RKWPSUCOD;
       RS003_ = RcdSts2_('GETPRVRCD': %error: %found: %eof);
       AM003_ = CV_ByKey;
       rcdcnt = 1;
       dow ((((RS003_ = '1')) and ((rcdcnt< listsize))));
       rcdcnt = rcdcnt + 1;
       READP(E)  RKWPSUCOD;
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
       chain(N) DL003_ RKWPSUCOD;
       RS003_ = RcdSts2_('GETRCDN':%error: %found: %eof);
       outweb_(%subst(%str(%addr(H__4(1))):1:1654));
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
       outweb_(%subst(%str(%addr(H__4(21))):55:172));
       wfrtn__ = AfToPage_(PSUSRFILE);
       outweb_(%subst(%str(%addr(H__4(23))):67:128));
       wfrtn__ = AfToPage_(PSUSRCODE);
       outweb_(%subst(%str(%addr(H__4(25))):35:132));
       wfrtn__ = AfToPage_(PSUSRPDNO);
       outweb_(%subst(%str(%addr(H__4(27))):7:134));
       AfToPage_(%trim(%editc(PSUSRPDLOC:'X')));
       outweb_(%subst(%str(%addr(H__4(28))):61:130));
       wfrtn__ = AfToPage_(PSUSRDESC);
       outweb_(%subst(%str(%addr(H__4(30))):31:156));

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
       chain(N) DL003_ RKWPSUCOD;
       RS003_ = RcdSts2_('GETRCDN':%error: %found: %eof);
       outweb_(%subst(%str(%addr(H__4(1))):1:1654));
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
       outweb_(%subst(%str(%addr(H__4(21))):55:172));
       wfrtn__ = AfToPage_(PSUSRFILE);
       outweb_(%subst(%str(%addr(H__4(23))):67:128));
       wfrtn__ = AfToPage_(PSUSRCODE);
       outweb_(%subst(%str(%addr(H__4(25))):35:132));
       wfrtn__ = AfToPage_(PSUSRPDNO);
       outweb_(%subst(%str(%addr(H__4(27))):7:134));
       AfToPage_(%trim(%editc(PSUSRPDLOC:'X')));
       outweb_(%subst(%str(%addr(H__4(28))):61:130));
       wfrtn__ = AfToPage_(PSUSRDESC);
       outweb_(%subst(%str(%addr(H__4(30))):31:156));

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
       Alert_(savedrrn);
       RR_003_ = rrn;
       AM003_ = CV_BYRRN;
       CHAIN(E) RR_003_ R__ARR003;
       RS003_ = RcdSts2_('GETRCD': %error: %found: %eof);
       if (rrn = %dec(aton_(savedrrn:46:16):46:16));
        SETLL  DL003_ RKWPSUCOD;
        RS003_ = RcdSts2_('POSRCD':%error:%equal:%eof);
        READPE(E) DL003_ RKWPSUCOD;
        RS003_ = RcdSts2_('GETPRVRCD': %error: %found: %eof);
        AM003_ = CV_ByKey;
        savedrrn = %trim(%editc(RR_003_:'P'));
        RR_003_ = rrn;
        AM003_ = CV_BYRRN;
        CHAIN(E) RR_003_ R__ARR003;
        RS003_ = RcdSts2_('GETRCD': %error: %found: %eof);
       endif;
      /end-free
     C                   EVAL      RS003_ = DeleteRcd_('RKWPSUCOD')
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
       RR_003_ = rrn;
       AM003_ = CV_BYRRN;
       CHAIN(E) RR_003_ R__ARR003;
       RS003_ = RcdSts2_('GETRCD': %error: %found: %eof);
       outweb_(%subst(%str(%addr(H__7(1))):1:335));
       outweb_(%subst(%str(%addr(H__8(1))):1:2601));
       outweb_(%subst(%str(%addr(H__7(5))):16:613));
       wfrtn__ = AfToPage_(QPGMNAM__);
       outweb_(%subst(%str(%addr(H__7(12))):69:157));
       wfrtn__ = AfToPage_(QPGMNAM__);
       outweb_(%subst(%str(%addr(H__7(14))):66:129));
       AfToPage_(%trim(%editc(RRN:'X')));
       outweb_(%subst(%str(%addr(H__7(16))):35:56));
       wfrtn__ = AfToPage_(SAVEDRRN);
       outweb_(%subst(%str(%addr(H__7(17))):11:54));
       wfrtn__ = AfToPage_(PSUSRFILE);
       outweb_(%subst(%str(%addr(H__7(17))):65:278));
       wfrtn__ = AfToPage_(SAVEDRRN);
       outweb_(%subst(%str(%addr(H__7(21))):23:247));
       wfrtn__ = AfToPage_(QPGMNAM__);
       outweb_(%subst(%str(%addr(H__7(24))):30:135));
       AfToPage_(%trim(%editc(RRN:'X')));
       outweb_(%subst(%str(%addr(H__7(26))):5:64));
       wfrtn__ = AfToPage_(SAVEDRRN);
       outweb_(%subst(%str(%addr(H__7(26))):69:62));
       wfrtn__ = AfToPage_(PSUSRFILE);
       outweb_(%subst(%str(%addr(H__7(27))):51:439));
       usrnobox0();
       outweb_(%subst(%str(%addr(H__7(33))):10:203));
       wfrtn__ = AfToPage_(PSUSRCODE);
       outweb_(%subst(%str(%addr(H__7(35))):53:188));
       dlrbox0();
       outweb_(%subst(%str(%addr(H__7(38))):1:187));
       officebox0();
       outweb_(%subst(%str(%addr(H__7(40))):28:250));
       wfrtn__ = AfToPage_(PSUSRDESC);
       outweb_(%subst(%str(%addr(H__7(43))):38:229));
       AfToPage_(%trim(%editc(RRN:'X')));
       outweb_(%subst(%str(%addr(H__7(46))):27:504));

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
        psusrfile = getparm3_('psusrfile':'*OPT');
        psusrcode = getparm3_('psusrcode':'*OPT');
        PSUSRNO = %dec(aton_( getparm3_('PSUSRNO':'*OPT'):46:16):11:0);
        psusrdesc = getparm3_('psusrdesc':'*OPT');
        psusrpdno = getparm3_('psusrpdno':'*OPT');
        PSUSRPDLOC = %dec(aton_( getparm3_('PSUSRPDLOC':'*OPT'):46:16):11:0);
        psusrfile = 'KWLUFLD';
        WRITE RKWPSUCOD;
        RS003_ = RcdSts2_('WRTRCD': %error: %found: %eof);
       endif;
       if (mode = 'Change');
        rrn = %dec(aton_( getparm3_('rrn':'*MAND'):46:16):9:0);
        RR_003_ = rrn;
        AM003_ = CV_BYRRN;
        CHAIN(E) RR_003_ R__ARR003;
        RS003_ = RcdSts2_('GETRCD': %error: %found: %eof);
        psusrdesc = getparm3_('psusrdesc':'*OPT');
        psusrpdno = getparm3_('psusrpdno':'*OPT');
        PSUSRPDLOC = %dec(aton_( getparm3_('PSUSRPDLOC':'*OPT'):46:16):11:0);
        RS003_ = UpdateRcd_('RKWPSUCOD');
       endif;
       Redirect2_( '?rrn=' + savedrrn:'*SAME':'rand');
      /end-free
     c     *PSSR         begsr
     c                   endsr
     P                 E


     P*---------------------------------------------------------------------
     P* usrnobox0...                - User defined function
     P*---------------------------------------------------------------------
     P usrnobox0...
     P                 B
     D usrnobox0...
     D                 PI




      /free
       p_ztype = 'KWLUFLD';
       boxname = 'PSUSRNO';
       boxid = 'PSUSRNO';
       boxselect = %trim(%editc(PSUSRNO:'P'));
       boxtype = 'OTHER';
       SaveUsrno = PSUSRNO;
       savedesc = psusrdesc;
       savefile = psusrfile;
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
       psusrfile = 'KWLUFLD';
       psusrtype = 'C';
       SETLL  DL004_ RKWPSUFLD;
       RS004_ = RcdSts2_('POSRCD':%error:%equal:%eof);
       READE(NE) DL004_ RKWPSUFLD;
       RS004_ = RcdSts2_('GETNXTRCD':%error:%found:%eof);
       AM004_ = CV_ByKey;
       dow (RS004_ = '1');
       OutWeb_('<option value="');
       OutWeb_(%trimr( %trim(%editc(PSUSRNO:'P'))));
       OutWeb_('"');
       if (SaveUsrno = PSUSRNO);
        OutWeb_(' selected');
       endif;
       OutWeb_('>');
       OutWeb_(%trimr(psusrdesc));
       OutWeb_('</option>');
       READE(NE) DL004_ RKWPSUFLD;
       RS004_ = RcdSts2_('GETNXTRCD':%error:%found:%eof);
       AM004_ = CV_ByKey;
       enddo;
       OutWeb_('</select>');
       psusrdesc = savedesc;
       PSUSRNO = SaveUsrno;
       psusrfile = savefile;
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
       query = 'SELECT PDNO, PDNAME FROM KWPDBASE ORDER BY PDNO ASC FOR FETCH-
        ONLY';
      /end-free
     C/Exec SQL
     C+            Declare DLR Scroll Cursor
     C+            For DLR
     C/End-Exec
     C/Exec SQL
     C+            Prepare DLR
     C+            From :query
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
     C+  FETCH NEXT FROM DLR INTO :dlrcode, :PDNAME
     C/End-Exec
      /free
       OutWeb_('<select name=''PSUSRPDNO'' id=''PSUSRPDNO'' placeholder=''Dea-
       ler''>');
       OutWeb_('<option value=''''>All</option>');
       dow (((SQLCOD <> 100) and (SQLCOD >= 0)));
       if (psusrpdno = dlrcode);
        OutWeb_('<option selected value=''');
        OutWeb_(%trimr(dlrcode));
        OutWeb_('''>');
        OutWeb_(%trimr(pdname));
        OutWeb_('</option>');
       else;
        OutWeb_('<option value=''');
        OutWeb_(%trimr(dlrcode));
        OutWeb_('''>');
        OutWeb_(%trimr(pdname));
        OutWeb_('</option>');
       endif;
      /end-free
     C/Exec SQL
     C+  FETCH NEXT FROM DLR INTO :dlrcode, :PDNAME
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
     P* officebox0...               - User defined function
     P*---------------------------------------------------------------------
     P officebox0...
     P                 B
     D officebox0...
     D                 PI




      /free
       if (psusrpdno = '');
        psusrpdno = getparm3_('psusrpdno':'*OPT');
       endif;
       OutWeb_('<select class=''form-control'' name=''PSUSRPDLOC'' id=''PSUSR-
       PDLOC'' placeholder=''Location''>');
       OutWeb_('<option value=''''>All</option>');
      /end-free
     C/Exec SQL
     C+  declare loccsr scroll cursor for 				select pdnam1, pdloc from kwpdloc
     C+ where pdno = :psusrpdno and pdloc <> 0
     C/End-Exec
      /free
      /end-free
     C/Exec SQL
     C+  open loccsr
     C/End-Exec
      /free
      /end-free
     C/Exec SQL
     C+  fetch next from loccsr into :pdnam1, :pdloc
     C/End-Exec
      /free
       dow (sqlcod <> 100);
       if (PSUSRPDLOC = pdloc);
        OutWeb_(%trimr( '<option selected value=''' + %trim(%editc(PDLOC:'P')
       ) + '''>' + %trim(pdnam1) + '</option>'));
       else;
        OutWeb_(%trimr( '<option value=''' + %trim(%editc(PDLOC:'P')) + '''>'
        + %trim(pdnam1) + '</option>'));
       endif;
      /end-free
     C/Exec SQL
     C+  fetch next from loccsr into :pdnam1, :pdloc
     C/End-Exec
      /free
       enddo;
       OutWeb_('</select>');
      /end-free
     C/Exec SQL
     C+  close loccsr
     C/End-Exec
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
       if   ((file__='KWPSUCOD' or file__='*ALL') and NOT %OPEN(KWPSUCOD));
        if (mbr__ <> '*FIRST');
         ovrdbf_(ovrflag__:'KWPSUCOD':'KWPSUCOD' : '*LIBL' : mbr__);
        elseif ('KWPSUCOD' <> 'KWPSUCOD');
         ovrdbf_(ovrflag__:'KWPSUCOD':'KWPSUCOD' : '*LIBL');
        endif;
        if    erropen__ = 'Y';
         OPEN(E) KWPSUCOD;             //    KWPSUCOD
         if        %error;
          return %error;
         endif;
        else;
         OPEN KWPSUCOD;                //    KWPSUCOD
        endif;
       endif;
       if   (file__='KWPSUCOD' or file__='*ALL')  and NOT %OPEN(F__ARR003);
        ovrdbf_(ovrflag__:'F__ARR003':'KWPSUCOD' : '*LIBL' : mbr__);
        if   erropen__ = 'Y';
         OPEN(E) F__ARR003;          //   KWPSUCOD
         if        %error;
          return %error;
         endif;
        else;
         OPEN F__ARR003;            //    KWPSUCOD
        endif;
       endif;
       if   ((file__='KWPSUFLD' or file__='*ALL') and NOT %OPEN(KWPSUFLD));
        if (mbr__ <> '*FIRST');
         ovrdbf_(ovrflag__:'KWPSUFLD':'KWPSUFLD' : '*LIBL' : mbr__);
        elseif ('KWPSUFLD' <> 'KWPSUFLD');
         ovrdbf_(ovrflag__:'KWPSUFLD':'KWPSUFLD' : '*LIBL');
        endif;
        if    erropen__ = 'Y';
         OPEN(E) KWPSUFLD;                //    KWPSUFLD
         if        %error;
          return %error;
         endif;
        else;
         OPEN KWPSUFLD;                //    KWPSUFLD
        endif;
       endif;
       if   ((file__='KWPDLOC' or file__='*ALL') and NOT %OPEN(KWPDLOC));
        if (mbr__ <> '*FIRST');
         ovrdbf_(ovrflag__:'KWPDLOC':'KWPDLOC' : '*LIBL' : mbr__);
        elseif ('KWPDLOC' <> 'KWPDLOC');
         ovrdbf_(ovrflag__:'KWPDLOC':'KWPDLOC' : '*LIBL');
        endif;
        if    erropen__ = 'Y';
         OPEN(E) KWPDLOC;                //    KWPDLOC
         if        %error;
          return %error;
         endif;
        else;
         OPEN KWPDLOC;                //    KWPDLOC
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
       when      rcdfmt__='RKWPSUCOD' and AM003_ = CV_ByKey and RS003_ = *ON ;
       update RKWPSUCOD;
       when      rcdfmt__='RKWPSUCOD' and AM003_ = CV_ByRrn and RS003_ = *ON ;
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
       when      rcdfmt__='RKWPSUCOD' and AM003_ = CV_ByKey and RS003_ = *ON ;
       delete RKWPSUCOD;
       when      rcdfmt__='RKWPSUCOD' and AM003_ = CV_ByRrn and RS003_ = *ON ;
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
System Settings:  Dealers
**CTDATA H__1        ListHeader                       2361
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.or
g/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>
    <meta name="genera
tor" content="WebSmart" />
    <meta http-equiv="Pragma" content="no-cache" />

   <title>System Settings:  User Codes</title>
        <link rel="stylesheet" ty
pe="text/css" href="/websmart/kwikloan/styles/klstylei.css" media="screen, tv, p
rojection" />
        <link rel="stylesheet" type="text/css" href="/websmart/kwi
kloan/styles/klstyleInquiryList.css" media="screen, tv, projection" />
    <scri
pt type="text/javascript" src="/websmart/kwikloan/javascript/klscripts.js"></scr
ipt>
  </head>
  <body>
  <div id="wrapping">
      <div id="everything">

  <div id="pagetitle">
          <span>System Settings: User Codes</span>

  </div>  
        <div id="whitebg" class="whitebg">
          <div class="left
">
            <table class="actionsTable" >
              <tr><td><a href="#" o
nclick="window.location='?task=beginmanage&rrn=0&rnd='"><img src="https://sv1.am
ericanfirstfinance.com:8158/websmart/kwikloan/images/loanInqADD.png"></a><span c
lass="LSlabel"></span></td></tr>     
           
        </table> 


           <form method="get" action="">
              <input type="hidden" nam
e="task" value="filter">
              <table class="accountInfo" id="loanSearch
Table">
                <tr>
                  <td id="Lname"><span class="LSlab
el">User Code:</span><br><input type="text" name="PSUSRCODE" size="25" maxlength
="25"></td>
                  </tr>
                  
               

         <tr>
                  <td><br><br><input type="submit" value="Filter R
esults"><br>
                  </td>
                </tr>
              </table
> 
            </form>
            
          </div><!--left-->
          <div c
lass="right">
            <div id="scroller">
              <div id="sections" s
tyle="overflow-y:scroll">
                <ul>
                <li>
  
      <ta
ble class="mainlist">
        <tr>
          
          
          <th width="10
0">Action</th>
          <th width="110" valign="top">User Type</th>

<th width="110" valign="top">User Code</th>
           <th>Dealer Number</th>

         <th>Dealer Location</th>
          <th width="400">Description</th>

       
          
        </tr>

**CTDATA H__2        ListDetails                      616
<tr class="">
  <!--<td><a href="?TASK=disp&rrn=&FirstRowRRN="><img src="/websma
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

 <td class="text right"></td>
  <td class="text"></td>
  <td class="text"></td>

  <td class="text"></td>
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

**CTDATA H__4        RcdDisplay                       2506
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.or
g/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>
    <meta name="genera
tor" content="WebSmart" />
    <meta http-equiv="Pragma" content="no-cache" />

   <title>System Settings:  User Codes - Display</title>
    <link rel="styleshe
et" type="text/css" href="/websmart/kwikloan/styles/klDFtheme.css" media="screen
, tv, projection" title="default"/>
    <link rel="alternate stylesheet" type="t
ext/css" href="/websmart/kwikloan/styles/klBStheme.css" media="screen, tv, proje
ction" title="bluesky"/>
    <link rel="alternate stylesheet" type="text/css" hr
ef="/websmart/kwikloan/styles/klRDtheme.css" media="screen, tv, projection" titl
e="reddevil"/>
    <link rel="alternate stylesheet" type="text/css" href="/websm
art/kwikloan/styles/klOCtheme.css" media="screen, tv, projection" title="orangec
rush"/>
    <link rel="stylesheet" type="text/css" href="/websmart/kwikloan/styl
es/klstylei.css" media="screen, tv, projection" />
    <script type="text/javasc
ript" src="/websmart/kwikloan/javascript/klscripts.js"></script>
    <script typ
e="text/javascript" src="/websmart/kwikloan/javascript/klthemes.js"></script>

  <script type="text/javascript" src="/websmart/v7.2/javascript/esdiapi010.js"><
/script>
    
  </head>
  <body>
    <div id="wrapping">
      <div id="everythi
ng">
        
        
        <div id="pagetitle">
          <span>System Setti
ngs:  User Codes</span>
        </div>
        
        <div id="whitebg">

     <div id="EDITtitle"><span>View Codes</span></div>
          <div id="EDITco
ntents"> 
            <div id="navtop">
              
              

  </div>
            <table>
              
              <tr>
                <
td class="left">User File:</td>
                <td class="right"></td>

      </tr>
              <tr>
                <td class="left">User Code:</td>

                <td class="right"></td>
              </tr>
              <tr>

               <td class="left">Dealer Number:</td>
                <td class="r
ight"></td>
              </tr>
              <tr>
                <td class="le
ft">Dealer Location:</td>
                <td class="right"></td>

</tr>
              <tr>
                <td class="left">Description:</td>

            <td class="right"></td>
              </tr>
              

   </table>
            
          </div><!--editcontents-->
        </div></div
></div>
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
**CTDATA H__7        RcdManage                        4130
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.or
g/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>
    <meta name="genera
tor" content="WebSmart" />
    <meta http-equiv="Pragma" content="no-cache" />

   <title>System Settings:  User Codes - Add or Change</title>
    <style type="
text/css">
    
    </style>
    <script type="text/javascript" src="/websmart/k
wikloan/javascript/klscripts.js"></script>
    <script type="text/javascript" sr
c="/websmart/kwikloan/javascript/klthemes.js"></script>
    <script type="text/j
avascript" src="/websmart/v7.2/javascript/esdiapi010.js"></script>
    <script s
rc="//ajax.googleapis.com/ajax/libs/jquery/2.0.0/jquery.min.js"></script>
    <s
cript type="text/javascript">
		xl_AttachEvent(window, "load", WindowInit); 

		
function WindowInit()
		{
			xl_FocusFirstElement();
		}
		
		$(document).ready(
function(){
						
		$("#PSUSRPDNO").change(function(){
 	 		$.get("", {task:"of
ficebox", PSUSRPDNO: $(this).val()}, function(dta){ $("#obox").html(dta) });		

	 	});
			
		});
	</script>
  </head>
  <body>
    <form action="" method="get">

      <input type="hidden" name="task" value="endmanage">
      <input type="hi
dden" name="rrn"  id="rrn" value="">
      <input type="hidden" name="FirstRowRR
N" value="">
      <input type="hidden" name="PSUSRFILE" value="">
      

<div id="pagetitle">
        <span>System Settings:  User Codes</span>
        <
div id="topBtns">
          <input type="submit" class="navbutton" name="mode" v
alue="Update">
          
          <button class="navbutton" onclick="javascrip
t:location.href='?rrn=;return false;'">Cancel</button>
        </div>
      </di
v>
      <div id="wrapping">
        
        
        
        
        

  <div id="whitebg" class="whitebg">
          
          <div id="EDITcontents"
> 
            <form action="" method="get">
              <input type="hidden"
name="task" value="endmanage">
              <input type="hidden" name="rrn" val
ue="">
              <input type="hidden" name="FirstRowRRN" value="">

     <input type="hidden" name="PSUSRFILE" value="">
              

  <table id="holderTable">
                
                
                <tr
>
                  <th>UserCode Settings</th>
                </tr>

     <tr>
                  <td class="holderTd">
                    <table cla
ss="dealerTable">
                      
                      <tr>

            <td class="left">User Number:</td>
                        <td class
="right"></td>
                      </tr>
                      <tr>

              <td class="left">User Code:</td>
                        <td class
="right"><input type="text" name="PSUSRCODE" value=""></td>

  </tr>
                      
                      <tr>

  <td class="left">Dealer Number</td>
                        <td class="right">
</td>       
                      </tr>
                      <tr>

            <td class="left">Dealer Location</td>
                        <td cl
ass="right"><div id="obox"></div></td>       
                      </tr>

                <tr>
                        <td class="left">Name / Description
:</td>
                        <td class="right"><input type="text" name="PSUSRD
ESC" size="40" maxlength="40" value=""></td>
                      </tr>

               
                    </table>
                  </td>

     </tr>
              </table>
              <script type="text/javascript">

	var protkey = "";   
	if( == 0)
	{
		
		xl_GetFormElementByName("mode").value =
 "Add";
	} 
	else 
	{
		protkey  = xl_GetFormElementByName("PSUSRCODE");
		protk
ey.disabled = true;
		protkey.className = protkey.className + " disabled";
			pr
otkey  = xl_GetFormElementByName("PSUSRNO");
		protkey.disabled = true;
		protke
y.className = protkey.className + " disabled";
		xl_GetFormElementByName("mode")
.value = "Change";
	}
</script>
            </form>
          </div><!--editcont
ents-->
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



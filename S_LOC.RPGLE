     H/TITLE  System Settings:  Locations
      * ProGen WebSmart Revision 21923
      * File overrides for compile command
      *__OV OVRDBF KWPLBASE   KWPLBASE
      *__OV OVRDBF F__ARR001  KWPLBASE
      *__OV OVRDBF KWPLAREL   KWPLAREL
      *__OV OVRDBF KWPLCASH   KWPLCASH
      *__OV OVRDBF KWPLCRB    KWPLCRB
      *__OV OVRDBF KWPLDOC    KWPLDOC
      *__OV OVRDBF KWPLFEE    KWPLFEE
      *__OV OVRDBF KWPLINS    KWPLINS
      *__OV OVRDBF KWPLNSF    KWPLNSF
      *__OV OVRDBF KWPLQUE    KWPLQUE
      *__OV OVRDBF KWPLTYPE   KWPLTYPE
      *__OV OVRDBF KWPUBASE   KWPUBASE
      *__OV OVRDBF KWP_DATA   KWP_DATA
      *__OV OVRDBF KWSQUE     KWSQUE
      *__OV OVRDBF KWPSIPADDR KWPSIPADDR
      *__   Following values are used to create the server program
      *__RO Pgm  lib KWWEB      Pgm  S_LOC
      *__AG          WEBSMART
      *__CL          *OBJLIBNAM
      *__SQ
      *__BD ECRTBND195
      *===============================================================*
      * Path:   s_loc.pdw
      * System: SEAN-DESK
      * Project:Kwik-Loan
      * Set:    Development
      * User:   Sean
      * Date Last Generated:   2016-03-31   14:53:14
      * Last Generated CRC: C41FF4FA FA8E7BF0 6CD0C34B 8514CA7E
      *===============================================================*
      */CPY *LIBL/PW_CSRC CPYRIGHT
      * File specifications
     FKWPLBASE  UF A E           K DISK    USROPN
     F                                     INFDS(FID001_   )
     FF__ARR001 UF A E             DISK    USROPN
     F                                     RENAME(RKWPLBASE    :R__ARR001   )
     FKWPLAREL  IF   E           K DISK    USROPN
     F                                     INFDS(FID002_   )
     FKWPLCASH  UF A E           K DISK    USROPN
     F                                     INFDS(FID003_   )
     FKWPLCRB   IF   E           K DISK    USROPN
     F                                     INFDS(FID004_   )
     FKWPLDOC   IF   E           K DISK    USROPN
     F                                     INFDS(FID005_   )
     FKWPLFEE   IF   E           K DISK    USROPN
     F                                     INFDS(FID006_   )
     FKWPLINS   IF   E           K DISK    USROPN
     F                                     INFDS(FID007_   )
     FKWPLNSF   UF A E           K DISK    USROPN
     F                                     INFDS(FID008_   )
     FKWPLQUE   UF A E           K DISK    USROPN
     F                                     INFDS(FID009_   )
     FKWPLTYPE  IF   E           K DISK    USROPN
     F                                     INFDS(FID010_   )
     FKWPUBASE  IF   E           K DISK    USROPN
     F                                     INFDS(FID011_   )
     FKWP_DATA  UF A E           K DISK    USROPN
     F                                     INFDS(FID012_   )
     FKWSQUE    IF   E           K DISK    USROPN
     F                                     INFDS(FID013_   )
     FKWPSIPADDRIF   E           K DISK    USROPN
     F                                     INFDS(FID014_   )

     D PTL__           S             50    DIM(1) CTDATA PERRCD(1)
     D RTLLA__         S             11    DIM(180)

     D*+FLDDCL Field declarations

     Duserdata         DS                  INZ
     D client                         5A
     D userid                        32A
     D location                       5A

     D rnd             S              6A
     D boxname         S             10A
     D boxid           S             10A
     D boxtype         S             10A
     D jvalidation     S             30A
     D disphref        S            200A
     D edithref        S            200A
     D delhref         S            200A
     D addhref         S            200A
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
     D rwcolor1__      S             32A   INZ('altcol1')
     D rwcolor2__      S             32A   INZ('altcol2')


     D TASKRAN__       S              1    INZ(*OFF)


     D H__1            S             80    PERRCD(1) CTDATA DIM(35          )

     D H__2            S             80    PERRCD(1) CTDATA DIM(8           )

     D H__3            S             80    PERRCD(1) CTDATA DIM(10          )

     D H__4            S             80    PERRCD(1) CTDATA DIM(59          )

     D H__5            S             80    PERRCD(1) CTDATA DIM(3           )

     D H__6            S             80    PERRCD(1) CTDATA DIM(1           )

     D H__7            S             80    PERRCD(1) CTDATA DIM(125         )

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
     D plstbox0...
     D                 PR
     D QPGM__          S             21A
     D LstPmlErr_      S              4P 0 IMPORT
     D plst1box0...
     D                 PR
     D plnusebox0...
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
     C                   KFLD                    plno
     C     DL002_        KLIST
     C                   KFLD                    plno
     C     DL003_        KLIST
     C                   KFLD                    plno
     C     DL004_        KLIST
     C                   KFLD                    plno
     C     DL005_        KLIST
     C                   KFLD                    plno
     C     DL006_        KLIST
     C                   KFLD                    plno
     C     DL007_        KLIST
     C                   KFLD                    plno
     C     DL008_        KLIST
     C                   KFLD                    plno
     C     DL009_        KLIST
     C                   KFLD                    plno
     C     DL010_        KLIST
     C                   KFLD                    plno
     C     DL011_        KLIST
     C                   KFLD                    puid
     C     DL012_        KLIST
     C                   KFLD                    p_ztype
     C                   KFLD                    p_zkeya
     C                   KFLD                    p_zkeyn
     C     DL013_        KLIST
     C                   KFLD                    sqcode
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
       AM011_ = CV_BYKEY;
       CHAIN(NE) DL011_ RKWPUBASE;
       RS011_ = RcdSts2_('GETRCD': %error: %found: %eof);
       userprofile = puprofile;
       if (userprofile <> 'ADMINISTRATOR');
        addhref = '';
       else;
        addhref = 'window.location=''s_loc.pgm?task=beginmanage&rrn=0&rnd='
       + %trim(rnd) + '''';
       endif;
       PLNO = %dec(aton_( getparm3_('PLNO':'*OPT'):46:16):5:0);
       outweb_(%subst(%str(%addr(H__1(1))):1:1222));
       wfrtn__ = AfToPage_(QPGMNAM__);
       outweb_(%subst(%str(%addr(H__1(16))):23:28));
       wfrtn__ = AfToPage_(RND);
       outweb_(%subst(%str(%addr(H__1(16))):51:195));
       wfrtn__ = AfToPage_(ADDHREF);
       outweb_(%subst(%str(%addr(H__1(19))):6:225));
       wfrtn__ = AfToPage_(QPGMNAM__);
       outweb_(%subst(%str(%addr(H__1(21))):71:1081));
       rcdcnt = 0;
       if (startrrn> 0);
        RR_001_ = startrrn;
        AM001_ = CV_BYRRN;
        CHAIN(NE) RR_001_ R__ARR001;
        RS001_ = RcdSts2_('GETRCD': %error: %found: %eof);
       endif;
       SETLL  pfklist RKWPLBASE;
       RS001_ = RcdSts2_('POSRCD':%error:%equal:%eof);
       READ(E)  RKWPLBASE;
       RS001_ = RcdSts2_('GETNXTRCD':%error:%found:%eof);
       AM001_ = CV_ByKey;
       if (RS001_ <> '1');
        SETLL  *HIVAL RKWPLBASE;
        RS001_ = RcdSts2_('POSRCD':%error:%equal:%eof);
        READ(E)  RKWPLBASE;
        RS001_ = RcdSts2_('GETNXTRCD':%error:%found:%eof);
        AM001_ = CV_ByKey;
       endif;
       dow ((((RS001_ = '1')) and ((rcdcnt< listsize))));
       rrn = RR_001_;
       if (rcdcnt = 0);
        startrrn = RR_001_;
       endif;
       disphref = '<a href="s_loc.pgm?TASK=disp&rrn=' + %trim(%editc(rrn:'P')
       ) + '&FirstRowRRN=' + %trim(%editc(startrrn:'P')) + '"><img src="/webs-
       mart/v7.2/Lincoln/images/view.gif" alt="Display" title="Display"></a>';
       if (userprofile <> 'ADMINISTRATOR');
        edithref = '';
        delhref = '';
       else;
        edithref = '<a href="s_loc.pgm?TASK=beginmanage&rrn=' + %trim(%editc(
       rrn:'P')) + '&FirstRowRRN=' + %trim(%editc(startrrn:'P')) + '"><img sr-
       c="/websmart/v7.2/Lincoln/images/edit.gif"  alt="Edit" title="Edit"></-
       a>';
        delhref = '<a href="s_loc.pgm?TASK=delconf&rrn=' + %trim(%editc(rrn:'-
       P')) + '&FirstRowRRN=' + %trim(%editc(startrrn:'P')) + '"><img src="/w-
       ebsmart/v7.2/Lincoln/images/delete.gif" alt="Delete" title="Delete"></-
       a>';
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
       outweb_(%subst(%str(%addr(H__2(1))):62:104));
       wfrtn__ = AfToPage_(QPGMNAM__);
       outweb_(%subst(%str(%addr(H__2(3))):6:22));
       AfToPage_(%trim(%editc(RRN:'X')));
       outweb_(%subst(%str(%addr(H__2(3))):28:13));
       AfToPage_(%trim(%editc(STARTRRN:'X')));
       outweb_(%subst(%str(%addr(H__2(3))):41:99));
       wfrtn__ = AfToPage_(QPGMNAM__);
       outweb_(%subst(%str(%addr(H__2(4))):60:18));
       AfToPage_(%trim(%editc(RRN:'X')));
       outweb_(%subst(%str(%addr(H__2(4))):78:13));
       AfToPage_(%trim(%editc(STARTRRN:'X')));
       outweb_(%subst(%str(%addr(H__2(5))):11:126));
       wfrtn__ = AfToPage_(EDITHREF);
       outweb_(%subst(%str(%addr(H__2(6))):57:7));
       wfrtn__ = AfToPage_(DELHREF);
       outweb_(%subst(%str(%addr(H__2(6))):64:38));
       AfToPage_(%trim(%editc(PLNO:'4')));
       outweb_(%subst(%str(%addr(H__2(7))):22:25));
       wfrtn__ = AfToPage_(PLNAM1);
       outweb_(%subst(%str(%addr(H__2(7))):47:25));
       wfrtn__ = AfToPage_(PLNAM2);
       outweb_(%subst(%str(%addr(H__2(7))):72:25));
       wfrtn__ = AfToPage_(PLADR1);
       outweb_(%subst(%str(%addr(H__2(8))):17:25));
       wfrtn__ = AfToPage_(PLCITY);
       outweb_(%subst(%str(%addr(H__2(8))):42:25));
       wfrtn__ = AfToPage_(PLST);
       outweb_(%subst(%str(%addr(H__2(8))):67:12));
       endrrn = RR_001_;
       rcdcnt = rcdcnt + 1;
       READ(E)  RKWPLBASE;
       RS001_ = RcdSts2_('GETNXTRCD':%error:%found:%eof);
       AM001_ = CV_ByKey;
       enddo;
       RR_001_ = startrrn;
       AM001_ = CV_BYRRN;
       CHAIN(NE) RR_001_ R__ARR001;
       RS001_ = RcdSts2_('GETRCD': %error: %found: %eof);
       SETLL  pfklist RKWPLBASE;
       RS001_ = RcdSts2_('POSRCD':%error:%equal:%eof);
       READP(E)  RKWPLBASE;
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
        SETGT  pfklist RKWPLBASE;
        RS001_ = RcdSts2_('POSRCD':%error:%equal:%eof);
        READ(E)  RKWPLBASE;
        RS001_ = RcdSts2_('GETNXTRCD':%error:%found:%eof);
        AM001_ = CV_ByKey;
        if (RS001_ = '1');
         endrrn = RR_001_;
         nextstate = 1;
        endif;
       endif;
       outweb_(%subst(%str(%addr(H__3(1))):1:234));
       AfToPage_(%trim(%editc(PREVSTATE:'P')));
       outweb_(%subst(%str(%addr(H__3(3))):75:142));
       wfrtn__ = AfToPage_(QPGMNAM__);
       outweb_(%subst(%str(%addr(H__3(5))):57:15));
       AfToPage_(%trim(%editc(STARTRRN:'X')));
       outweb_(%subst(%str(%addr(H__3(5))):72:36));
       wfrtn__ = AfToPage_(QPGMNAM__);
       outweb_(%subst(%str(%addr(H__3(6))):28:15));
       AfToPage_(%trim(%editc(STARTRRN:'X')));
       outweb_(%subst(%str(%addr(H__3(6))):43:52));
       AfToPage_(%trim(%editc(NEXTSTATE:'P')));
       outweb_(%subst(%str(%addr(H__3(7))):15:143));
       wfrtn__ = AfToPage_(QPGMNAM__);
       outweb_(%subst(%str(%addr(H__3(8))):78:18));
       AfToPage_(%trim(%editc(ENDRRN:'X')));
       outweb_(%subst(%str(%addr(H__3(9))):16:36));
       wfrtn__ = AfToPage_(QPGMNAM__);
       outweb_(%subst(%str(%addr(H__3(9))):52:18));
       AfToPage_(%trim(%editc(ENDRRN:'X')));
       outweb_(%subst(%str(%addr(H__3(9))):70:35));

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
       SETLL  pfklist RKWPLBASE;
       RS001_ = RcdSts2_('POSRCD':%error:%equal:%eof);
       READP(E)  RKWPLBASE;
       RS001_ = RcdSts2_('GETPRVRCD': %error: %found: %eof);
       AM001_ = CV_ByKey;
       rcdcnt = 1;
       dow ((((RS001_ = '1')) and ((rcdcnt< listsize))));
       rcdcnt = rcdcnt + 1;
       READP(E)  RKWPLBASE;
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
       chain(N) DL003_ RKWPLCASH;
       RS003_ = RcdSts2_('GETRCDN':%error: %found: %eof);
       chain(N) DL008_ RKWPLNSF;
       RS008_ = RcdSts2_('GETRCDN':%error: %found: %eof);
       outweb_(%subst(%str(%addr(H__4(1))):1:1591));
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
       outweb_(%subst(%str(%addr(H__4(20))):72:134));
       AfToPage_(%trim(%editc(PLNO:'4')));
       outweb_(%subst(%str(%addr(H__4(22))):46:110));
       wfrtn__ = AfToPage_(PLNUSE);
       outweb_(%subst(%str(%addr(H__4(23))):76:101));
       wfrtn__ = AfToPage_(PLNAM1);
       outweb_(%subst(%str(%addr(H__4(25))):17:101));
       wfrtn__ = AfToPage_(PLNAM2);
       outweb_(%subst(%str(%addr(H__4(26))):38:104));
       wfrtn__ = AfToPage_(PLADR1);
       outweb_(%subst(%str(%addr(H__4(27))):62:104));
       wfrtn__ = AfToPage_(PLADR2);
       outweb_(%subst(%str(%addr(H__4(29))):6:99));
       wfrtn__ = AfToPage_(PLCITY);
       outweb_(%subst(%str(%addr(H__4(30))):25:100));
       wfrtn__ = AfToPage_(PLST);
       outweb_(%subst(%str(%addr(H__4(31))):45:102));
       AfToPage_(%trim(%editc(PLZIP:'4')));
       outweb_(%subst(%str(%addr(H__4(32))):67:104));
       wfrtn__ = AfToPage_(PLADR11);
       outweb_(%subst(%str(%addr(H__4(34))):11:104));
       wfrtn__ = AfToPage_(PLADR21);
       outweb_(%subst(%str(%addr(H__4(35))):35:99));
       wfrtn__ = AfToPage_(PLCITY1);
       outweb_(%subst(%str(%addr(H__4(36))):54:100));
       wfrtn__ = AfToPage_(PLST1);
       outweb_(%subst(%str(%addr(H__4(37))):74:102));
       AfToPage_(%trim(%editc(PLZIP1:'4')));
       outweb_(%subst(%str(%addr(H__4(39))):16:107));
       AfToPage_(%trim(%editc(PLPHON:'4')));
       outweb_(%subst(%str(%addr(H__4(40))):43:107));
       AfToPage_(%trim(%editc(PLPHON1:'4')));
       outweb_(%subst(%str(%addr(H__4(41))):70:107));
       AfToPage_(%trim(%editc(PLFAX:'4')));
       outweb_(%subst(%str(%addr(H__4(43))):17:104));
       wfrtn__ = AfToPage_(PLTIMEZ);
       outweb_(%subst(%str(%addr(H__4(44))):41:100));
       wfrtn__ = AfToPage_(PLEMAIL);
       outweb_(%subst(%str(%addr(H__4(45))):61:108));
       AfToPage_(%trim(%editc(PLTIN:'4')));
       outweb_(%subst(%str(%addr(H__4(47))):9:107));
       AfToPage_(%trim(%editc(PLCBAL:'J')));
       outweb_(%subst(%str(%addr(H__4(48))):36:114));
       AfToPage_(%trim(%editc(PLCLIM1:'J')));
       outweb_(%subst(%str(%addr(H__4(49))):70:114));
       AfToPage_(%trim(%editc(PLCLIM2:'J')));
       outweb_(%subst(%str(%addr(H__4(51))):24:111));
       AfToPage_(%trim(%editc(PNSFAMT:'J')));
       outweb_(%subst(%str(%addr(H__4(52))):55:113));
       AfToPage_(%trim(%editc(PNSFMIN:'J')));
       outweb_(%subst(%str(%addr(H__4(54))):8:113));
       AfToPage_(%trim(%editc(PNSFMAX:'J')));
       outweb_(%subst(%str(%addr(H__4(55))):41:106));
       AfToPage_(%trim(%editc(PNSFPCT:'J')));
       outweb_(%subst(%str(%addr(H__4(56))):67:109));
       wfrtn__ = AfToPage_(PNSFPCTOF);
       outweb_(%subst(%str(%addr(H__4(58))):16:113));

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
       chain(N) DL003_ RKWPLCASH;
       RS003_ = RcdSts2_('GETRCDN':%error: %found: %eof);
       chain(N) DL008_ RKWPLNSF;
       RS008_ = RcdSts2_('GETRCDN':%error: %found: %eof);
       outweb_(%subst(%str(%addr(H__4(1))):1:1591));
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
       outweb_(%subst(%str(%addr(H__4(20))):72:134));
       AfToPage_(%trim(%editc(PLNO:'4')));
       outweb_(%subst(%str(%addr(H__4(22))):46:110));
       wfrtn__ = AfToPage_(PLNUSE);
       outweb_(%subst(%str(%addr(H__4(23))):76:101));
       wfrtn__ = AfToPage_(PLNAM1);
       outweb_(%subst(%str(%addr(H__4(25))):17:101));
       wfrtn__ = AfToPage_(PLNAM2);
       outweb_(%subst(%str(%addr(H__4(26))):38:104));
       wfrtn__ = AfToPage_(PLADR1);
       outweb_(%subst(%str(%addr(H__4(27))):62:104));
       wfrtn__ = AfToPage_(PLADR2);
       outweb_(%subst(%str(%addr(H__4(29))):6:99));
       wfrtn__ = AfToPage_(PLCITY);
       outweb_(%subst(%str(%addr(H__4(30))):25:100));
       wfrtn__ = AfToPage_(PLST);
       outweb_(%subst(%str(%addr(H__4(31))):45:102));
       AfToPage_(%trim(%editc(PLZIP:'4')));
       outweb_(%subst(%str(%addr(H__4(32))):67:104));
       wfrtn__ = AfToPage_(PLADR11);
       outweb_(%subst(%str(%addr(H__4(34))):11:104));
       wfrtn__ = AfToPage_(PLADR21);
       outweb_(%subst(%str(%addr(H__4(35))):35:99));
       wfrtn__ = AfToPage_(PLCITY1);
       outweb_(%subst(%str(%addr(H__4(36))):54:100));
       wfrtn__ = AfToPage_(PLST1);
       outweb_(%subst(%str(%addr(H__4(37))):74:102));
       AfToPage_(%trim(%editc(PLZIP1:'4')));
       outweb_(%subst(%str(%addr(H__4(39))):16:107));
       AfToPage_(%trim(%editc(PLPHON:'4')));
       outweb_(%subst(%str(%addr(H__4(40))):43:107));
       AfToPage_(%trim(%editc(PLPHON1:'4')));
       outweb_(%subst(%str(%addr(H__4(41))):70:107));
       AfToPage_(%trim(%editc(PLFAX:'4')));
       outweb_(%subst(%str(%addr(H__4(43))):17:104));
       wfrtn__ = AfToPage_(PLTIMEZ);
       outweb_(%subst(%str(%addr(H__4(44))):41:100));
       wfrtn__ = AfToPage_(PLEMAIL);
       outweb_(%subst(%str(%addr(H__4(45))):61:108));
       AfToPage_(%trim(%editc(PLTIN:'4')));
       outweb_(%subst(%str(%addr(H__4(47))):9:107));
       AfToPage_(%trim(%editc(PLCBAL:'J')));
       outweb_(%subst(%str(%addr(H__4(48))):36:114));
       AfToPage_(%trim(%editc(PLCLIM1:'J')));
       outweb_(%subst(%str(%addr(H__4(49))):70:114));
       AfToPage_(%trim(%editc(PLCLIM2:'J')));
       outweb_(%subst(%str(%addr(H__4(51))):24:111));
       AfToPage_(%trim(%editc(PNSFAMT:'J')));
       outweb_(%subst(%str(%addr(H__4(52))):55:113));
       AfToPage_(%trim(%editc(PNSFMIN:'J')));
       outweb_(%subst(%str(%addr(H__4(54))):8:113));
       AfToPage_(%trim(%editc(PNSFMAX:'J')));
       outweb_(%subst(%str(%addr(H__4(55))):41:106));
       AfToPage_(%trim(%editc(PNSFPCT:'J')));
       outweb_(%subst(%str(%addr(H__4(56))):67:109));
       wfrtn__ = AfToPage_(PNSFPCTOF);
       outweb_(%subst(%str(%addr(H__4(58))):16:113));

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
        SETLL  pfklist RKWPLBASE;
        RS001_ = RcdSts2_('POSRCD':%error:%equal:%eof);
        READP(E)  RKWPLBASE;
        RS001_ = RcdSts2_('GETPRVRCD': %error: %found: %eof);
        AM001_ = CV_ByKey;
        savedrrn = %trim(%editc(RR_001_:'P'));
        RR_001_ = rrn;
        AM001_ = CV_BYRRN;
        CHAIN(E) RR_001_ R__ARR001;
        RS001_ = RcdSts2_('GETRCD': %error: %found: %eof);
       endif;
      /end-free
     C                   EVAL      RS001_ = DeleteRcd_('RKWPLBASE')
      /free
       AM003_ = CV_BYKEY;
       CHAIN(E) DL003_ RKWPLCASH;
       RS003_ = RcdSts2_('GETRCD': %error: %found: %eof);
      /end-free
     C                   EVAL      RS003_ = DeleteRcd_('RKWPLCASH')
      /free
       AM008_ = CV_BYKEY;
       CHAIN(E) DL008_ RKWPLNSF;
       RS008_ = RcdSts2_('GETRCD': %error: %found: %eof);
      /end-free
     C                   EVAL      RS008_ = DeleteRcd_('RKWPLNSF')
      /free
       p_ztype = 'KWPLBASE';
       P_ZKEYN = PLNO;
       AM012_ = CV_BYKEY;
       CHAIN(E) DL012_ RKWPDATA;
       RS012_ = RcdSts2_('GETRCD': %error: %found: %eof);
       if (RS012_ = '1');
      /end-free
     C                   EVAL      RS012_ = DeleteRcd_('RKWPDATA')
      /free
       endif;
       SETLL  pfklist RKWPLQUE;
       RS009_ = RcdSts2_('POSRCD':%error:%equal:%eof);
       READE(E) pfklist RKWPLQUE;
       RS009_ = RcdSts2_('GETNXTRCD':%error:%found:%eof);
       AM009_ = CV_ByKey;
       dow (RS009_ = '1');
      /end-free
     C                   EVAL      RS009_ = DeleteRcd_('RKWPLQUE')
      /free
       READE(E) pfklist RKWPLQUE;
       RS009_ = RcdSts2_('GETNXTRCD':%error:%found:%eof);
       AM009_ = CV_ByKey;
       enddo;
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
       AM008_ = CV_BYKEY;
       CHAIN(NE) DL008_ RKWPLNSF;
       RS008_ = RcdSts2_('GETRCD': %error: %found: %eof);
       AM003_ = CV_BYKEY;
       CHAIN(NE) DL003_ RKWPLCASH;
       RS003_ = RcdSts2_('GETRCD': %error: %found: %eof);
       kwk_iptype = 'KWIK-LOAN';
      /end-free
     C/Exec SQL
     C+  select KWK_IPADDR into :KWK_IPADDR from KWPSIPADDR where KWK_IPTYPE = :
     C+ KWK_IPTYPE and KWK_BR = :PLNO
     C/End-Exec
      /free
       outweb_(%subst(%str(%addr(H__7(1))):1:335));
       outweb_(%subst(%str(%addr(H__8(1))):1:2600));
       outweb_(%subst(%str(%addr(H__7(5))):16:1443));
       wfrtn__ = AfToPage_(QPGMNAM__);
       outweb_(%subst(%str(%addr(H__7(23))):19:119));
       AfToPage_(%trim(%editc(RRN:'X')));
       outweb_(%subst(%str(%addr(H__7(24))):58:56));
       wfrtn__ = AfToPage_(SAVEDRRN);
       outweb_(%subst(%str(%addr(H__7(25))):34:268));
       wfrtn__ = AfToPage_(SAVEDRRN);
       outweb_(%subst(%str(%addr(H__7(28))):62:700));
       AfToPage_(%trim(%editc(PLNO:'X')));
       outweb_(%subst(%str(%addr(H__7(37))):42:168));
       plnusebox0();
       outweb_(%subst(%str(%addr(H__7(39))):50:222));
       wfrtn__ = AfToPage_(PLNAM1);
       outweb_(%subst(%str(%addr(H__7(42))):32:224));
       wfrtn__ = AfToPage_(PLNAM2);
       outweb_(%subst(%str(%addr(H__7(45))):16:227));
       wfrtn__ = AfToPage_(PLADR1);
       outweb_(%subst(%str(%addr(H__7(48))):3:227));
       wfrtn__ = AfToPage_(PLADR2);
       outweb_(%subst(%str(%addr(H__7(50))):70:222));
       wfrtn__ = AfToPage_(PLCITY);
       outweb_(%subst(%str(%addr(H__7(53))):52:158));
       plstbox0();
       outweb_(%subst(%str(%addr(H__7(55))):50:222));
       wfrtn__ = AfToPage_(%trim(%editw(PLZIP:'     -    ')));
       outweb_(%subst(%str(%addr(H__7(58))):32:269));
       wfrtn__ = AfToPage_(PLADR11);
       outweb_(%subst(%str(%addr(H__7(61))):61:228));
       wfrtn__ = AfToPage_(PLADR21);
       outweb_(%subst(%str(%addr(H__7(64))):49:223));
       wfrtn__ = AfToPage_(PLCITY1);
       outweb_(%subst(%str(%addr(H__7(67))):32:158));
       plst1box0();
       outweb_(%subst(%str(%addr(H__7(69))):30:223));
       wfrtn__ = AfToPage_(%trim(%editw(PLZIP1:'     -    ')));
       outweb_(%subst(%str(%addr(H__7(72))):13:271));
       wfrtn__ = AfToPage_(%trim(%editw(PLPHON:'   -   -    ')));
       outweb_(%subst(%str(%addr(H__7(75))):44:274));
       wfrtn__ = AfToPage_(%trim(%editw(PLPHON1:'   -   -    ')));
       outweb_(%subst(%str(%addr(H__7(78))):78:270));
       wfrtn__ = AfToPage_(%trim(%editw(PLFAX:'   -   -    ')));
       outweb_(%subst(%str(%addr(H__7(82))):28:269));
       wfrtn__ = AfToPage_(PLTIMEZ);
       outweb_(%subst(%str(%addr(H__7(85))):57:224));
       wfrtn__ = AfToPage_(PLEMAIL);
       outweb_(%subst(%str(%addr(H__7(88))):41:230));
       wfrtn__ = AfToPage_(%trim(%editw(PLTIN:'   -  -    ')));
       outweb_(%subst(%str(%addr(H__7(91))):31:273));
       AfToPage_(%trim(%editc(PLCBAL:'J')));
       outweb_(%subst(%str(%addr(H__7(94))):64:238));
       AfToPage_(%trim(%editc(PLCLIM1:'J')));
       outweb_(%subst(%str(%addr(H__7(97))):62:238));
       AfToPage_(%trim(%editc(PLCLIM2:'J')));
       outweb_(%subst(%str(%addr(H__7(100))):60:236));
       AfToPage_(%trim(%editc(PNSFAMT:'J')));
       outweb_(%subst(%str(%addr(H__7(103))):56:237));
       AfToPage_(%trim(%editc(PNSFMIN:'J')));
       outweb_(%subst(%str(%addr(H__7(106))):53:237));
       AfToPage_(%trim(%editc(PNSFMAX:'J')));
       outweb_(%subst(%str(%addr(H__7(109))):50:228));
       AfToPage_(%trim(%editc(PNSFPCT:'J')));
       outweb_(%subst(%str(%addr(H__7(112))):38:233));
       wfrtn__ = AfToPage_(PNSFPCTOF);
       outweb_(%subst(%str(%addr(H__7(115))):31:216));
       wfrtn__ = AfToPage_(KWK_IPADDR);
       outweb_(%subst(%str(%addr(H__7(118))):7:245));
       AfToPage_(%trim(%editc(RRN:'X')));
       outweb_(%subst(%str(%addr(H__7(121))):12:367));

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
        PLNO = %dec(aton_( getparm3_('PLNO':'*OPT'):46:16):5:0);
        plnuse = getparm3_('plnuse':'*OPT');
        plnam1 = getparm3_('plnam1':'*OPT');
        plnam2 = getparm3_('plnam2':'*OPT');
        pladr1 = getparm3_('pladr1':'*OPT');
        pladr2 = getparm3_('pladr2':'*OPT');
        plcity = getparm3_('plcity':'*OPT');
        plst = getparm3_('plst':'*OPT');
        PLZIP = %dec(aton_( getparm3_('PLZIP':'*OPT'):46:16):9:0);
        pladr11 = getparm3_('pladr11':'*OPT');
        pladr21 = getparm3_('pladr21':'*OPT');
        plcity1 = getparm3_('plcity1':'*OPT');
        plst1 = getparm3_('plst1':'*OPT');
        PLZIP1 = %dec(aton_( getparm3_('PLZIP1':'*OPT'):46:16):9:0);
        PLPHON = %dec(aton_( getparm3_('PLPHON':'*OPT'):46:16):10:0);
        PLPHON1 = %dec(aton_( getparm3_('PLPHON1':'*OPT'):46:16):10:0);
        PLFAX = %dec(aton_( getparm3_('PLFAX':'*OPT'):46:16):10:0);
        pltimez = getparm3_('pltimez':'*OPT');
        plemail = getparm3_('plemail':'*OPT');
        PLTIN = %dec(aton_( getparm3_('PLTIN':'*OPT'):46:16):9:0);
        PLCBAL = %dec(aton_( getparm3_('PLCBAL':'*OPT'):46:16):11:2);
        PLCLIM1 = %dec(aton_( getparm3_('PLCLIM1':'*OPT'):46:16):11:2);
        PLCLIM2 = %dec(aton_( getparm3_('PLCLIM2':'*OPT'):46:16):11:2);
        PNSFAMT = %dec(aton_( getparm3_('PNSFAMT':'*OPT'):46:16):11:2);
        PNSFMIN = %dec(aton_( getparm3_('PNSFMIN':'*OPT'):46:16):11:2);
        PNSFMAX = %dec(aton_( getparm3_('PNSFMAX':'*OPT'):46:16):11:2);
        PNSFPCT = %dec(aton_( getparm3_('PNSFPCT':'*OPT'):46:16):8:5);
        pnsfpctof = getparm3_('pnsfpctof':'*OPT');
        WRITE RKWPLBASE;
        RS001_ = RcdSts2_('WRTRCD': %error: %found: %eof);
        WRITE RKWPLCASH;
        RS003_ = RcdSts2_('WRTRCD': %error: %found: %eof);
        WRITE RKWPLNSF;
        RS008_ = RcdSts2_('WRTRCD': %error: %found: %eof);
        p_ztype = 'KWPLBASE';
        P_ZKEYN = PLNO;
        p_zdesc = plnam1;
        WRITE RKWPDATA;
        RS012_ = RcdSts2_('WRTRCD': %error: %found: %eof);
        sqcode = '';
        SETLL  DL013_ RKWSQUE;
        RS013_ = RcdSts2_('POSRCD':%error:%equal:%eof);
        READ(NE)  RKWSQUE;
        RS013_ = RcdSts2_('GETNXTRCD':%error:%found:%eof);
        AM013_ = CV_ByKey;
        dow (RS013_ = '1');
        AM009_ = CV_BYKEY;
        CHAIN(NE) DL009_ RKWPLQUE;
        RS009_ = RcdSts2_('GETRCD': %error: %found: %eof);
        if (RS009_ <> '1');
         WRITE RKWPLQUE;
         RS009_ = RcdSts2_('WRTRCD': %error: %found: %eof);
        endif;
        READ(NE)  RKWSQUE;
        RS013_ = RcdSts2_('GETNXTRCD':%error:%found:%eof);
        AM013_ = CV_ByKey;
        enddo;
        Redirect2_( '?rrn=' + savedrrn:'*SAME':'rand');
       endif;
       if (mode = 'Change');
        rrn = %dec(aton_( getparm3_('rrn':'*MAND'):46:16):9:0);
        RR_001_ = rrn;
        AM001_ = CV_BYRRN;
        CHAIN(E) RR_001_ R__ARR001;
        RS001_ = RcdSts2_('GETRCD': %error: %found: %eof);
        AM008_ = CV_BYKEY;
        CHAIN(E) DL008_ RKWPLNSF;
        RS008_ = RcdSts2_('GETRCD': %error: %found: %eof);
        AM003_ = CV_BYKEY;
        CHAIN(E) DL003_ RKWPLCASH;
        RS003_ = RcdSts2_('GETRCD': %error: %found: %eof);
        plnuse = getparm3_('plnuse':'*OPT');
        plnam1 = getparm3_('plnam1':'*OPT');
        plnam2 = getparm3_('plnam2':'*OPT');
        pladr1 = getparm3_('pladr1':'*OPT');
        pladr2 = getparm3_('pladr2':'*OPT');
        plcity = getparm3_('plcity':'*OPT');
        plst = getparm3_('plst':'*OPT');
        PLZIP = %dec(aton_( getparm3_('PLZIP':'*OPT'):46:16):9:0);
        pladr11 = getparm3_('pladr11':'*OPT');
        pladr21 = getparm3_('pladr21':'*OPT');
        plcity1 = getparm3_('plcity1':'*OPT');
        plst1 = getparm3_('plst1':'*OPT');
        PLZIP1 = %dec(aton_( getparm3_('PLZIP1':'*OPT'):46:16):9:0);
        PLPHON = %dec(aton_( getparm3_('PLPHON':'*OPT'):46:16):10:0);
        PLPHON1 = %dec(aton_( getparm3_('PLPHON1':'*OPT'):46:16):10:0);
        PLFAX = %dec(aton_( getparm3_('PLFAX':'*OPT'):46:16):10:0);
        pltimez = getparm3_('pltimez':'*OPT');
        plemail = getparm3_('plemail':'*OPT');
        PLTIN = %dec(aton_( getparm3_('PLTIN':'*OPT'):46:16):9:0);
        PLCBAL = %dec(aton_( getparm3_('PLCBAL':'*OPT'):46:16):11:2);
        PLCLIM1 = %dec(aton_( getparm3_('PLCLIM1':'*OPT'):46:16):11:2);
        PLCLIM2 = %dec(aton_( getparm3_('PLCLIM2':'*OPT'):46:16):11:2);
        PNSFAMT = %dec(aton_( getparm3_('PNSFAMT':'*OPT'):46:16):11:2);
        PNSFMIN = %dec(aton_( getparm3_('PNSFMIN':'*OPT'):46:16):11:2);
        PNSFMAX = %dec(aton_( getparm3_('PNSFMAX':'*OPT'):46:16):11:2);
        PNSFPCT = %dec(aton_( getparm3_('PNSFPCT':'*OPT'):46:16):8:5);
        pnsfpctof = getparm3_('pnsfpctof':'*OPT');
        RS001_ = UpdateRcd_('RKWPLBASE');
        if (RS008_ = '1');
         RS008_ = UpdateRcd_('RKWPLNSF');
        else;
         WRITE RKWPLNSF;
         RS008_ = RcdSts2_('WRTRCD': %error: %found: %eof);
        endif;
        if (RS003_ = '1');
         RS003_ = UpdateRcd_('RKWPLCASH');
        else;
         WRITE RKWPLCASH;
         RS003_ = RcdSts2_('WRTRCD': %error: %found: %eof);
        endif;
        p_ztype = 'KWPLBASE';
        P_ZKEYN = PLNO;
        AM012_ = CV_BYKEY;
        CHAIN(E) DL012_ RKWPDATA;
        RS012_ = RcdSts2_('GETRCD': %error: %found: %eof);
        p_zdesc = plnam1;
        if (RS012_ = '1');
         RS012_ = UpdateRcd_('RKWPDATA');
        else;
         WRITE RKWPDATA;
         RS012_ = RcdSts2_('WRTRCD': %error: %found: %eof);
        endif;
       endif;
       kwk_iptype = 'KWIK-LOAN';
      /end-free
     C/Exec SQL
     C+  select KWK_IPADDR into :KWK_IPADDR from KWPSIPADDR where KWK_IPTYPE = :
     C+ KWK_IPTYPE and KWK_BR = :PLNO
     C/End-Exec
      /free
       if (kwk_ipaddr <> '');
        kwk_ipaddr = getparm3_('kwk_ipaddr':'*OPT');
      /end-free
     C/Exec SQL
     C+  update KWPSIPADDR set KWK_IPADDR=:KWK_IPADDR where KWK_IPTYPE = 'KWIK-L
     C+ OAN' and KWK_BR = :PLNO
     C/End-Exec
      /free
       else;
        kwk_ipaddr = getparm3_('kwk_ipaddr':'*OPT');
        if (kwk_ipaddr <> '');
      /end-free
     C/Exec SQL
     C+  insert into KWPSIPADDR (KWK_IPTYPE, KWK_IPADDR, KWK_BR) values ('KWIK-L
     C+ OAN',:KWK_IPADDR,:PLNO)
     C/End-Exec
      /free
        endif;
       endif;
       Redirect2_( '?rrn=' + savedrrn:'*SAME':'rand');
      /end-free
     c     *PSSR         begsr
     c                   endsr
     P                 E


     P*---------------------------------------------------------------------
     P* plstbox0...                 - User defined function
     P*---------------------------------------------------------------------
     P plstbox0...
     P                 B
     D plstbox0...
     D                 PI




      /free
       boxtype = 'SYSTEM';
       p_ztype = 'STATECODE';
       boxname = 'PLST';
       boxid = 'PLST';
       boxselect = plst;
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
     P* plst1box0...                - User defined function
     P*---------------------------------------------------------------------
     P plst1box0...
     P                 B
     D plst1box0...
     D                 PI




      /free
       boxtype = 'SYSTEM';
       p_ztype = 'STATECODE';
       boxname = 'PLST1';
       boxid = 'PLST1';
       boxselect = plst1;
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
     P* plnusebox0...               - User defined function
     P*---------------------------------------------------------------------
     P plnusebox0...
     P                 B
     D plnusebox0...
     D                 PI




      /free
       boxtype = 'SYSTEM';
       p_ztype = 'YESNO';
       boxname = 'PLNUSE';
       boxid = 'PLNUSE';
       boxselect = plnuse;
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
       if   ((file__='KWPLBASE' or file__='*ALL') and NOT %OPEN(KWPLBASE));
        if (mbr__ <> '*FIRST');
         ovrdbf_(ovrflag__:'KWPLBASE':'KWPLBASE' : '*LIBL' : mbr__);
        elseif ('KWPLBASE' <> 'KWPLBASE');
         ovrdbf_(ovrflag__:'KWPLBASE':'KWPLBASE' : '*LIBL');
        endif;
        if    erropen__ = 'Y';
         OPEN(E) KWPLBASE;             //    KWPLBASE
         if        %error;
          return %error;
         endif;
        else;
         OPEN KWPLBASE;                //    KWPLBASE
        endif;
       endif;
       if   (file__='KWPLBASE' or file__='*ALL')  and NOT %OPEN(F__ARR001);
        ovrdbf_(ovrflag__:'F__ARR001':'KWPLBASE' : '*LIBL' : mbr__);
        if   erropen__ = 'Y';
         OPEN(E) F__ARR001;          //   KWPLBASE
         if        %error;
          return %error;
         endif;
        else;
         OPEN F__ARR001;            //    KWPLBASE
        endif;
       endif;
       if   ((file__='KWPLAREL' or file__='*ALL') and NOT %OPEN(KWPLAREL));
        if (mbr__ <> '*FIRST');
         ovrdbf_(ovrflag__:'KWPLAREL':'KWPLAREL' : '*LIBL' : mbr__);
        elseif ('KWPLAREL' <> 'KWPLAREL');
         ovrdbf_(ovrflag__:'KWPLAREL':'KWPLAREL' : '*LIBL');
        endif;
        if    erropen__ = 'Y';
         OPEN(E) KWPLAREL;                //    KWPLAREL
         if        %error;
          return %error;
         endif;
        else;
         OPEN KWPLAREL;                //    KWPLAREL
        endif;
       endif;
       if   ((file__='KWPLCASH' or file__='*ALL') and NOT %OPEN(KWPLCASH));
        if (mbr__ <> '*FIRST');
         ovrdbf_(ovrflag__:'KWPLCASH':'KWPLCASH' : '*LIBL' : mbr__);
        elseif ('KWPLCASH' <> 'KWPLCASH');
         ovrdbf_(ovrflag__:'KWPLCASH':'KWPLCASH' : '*LIBL');
        endif;
        if    erropen__ = 'Y';
         OPEN(E) KWPLCASH;                //    KWPLCASH
         if        %error;
          return %error;
         endif;
        else;
         OPEN KWPLCASH;                //    KWPLCASH
        endif;
       endif;
       if   ((file__='KWPLCRB' or file__='*ALL') and NOT %OPEN(KWPLCRB));
        if (mbr__ <> '*FIRST');
         ovrdbf_(ovrflag__:'KWPLCRB':'KWPLCRB' : '*LIBL' : mbr__);
        elseif ('KWPLCRB' <> 'KWPLCRB');
         ovrdbf_(ovrflag__:'KWPLCRB':'KWPLCRB' : '*LIBL');
        endif;
        if    erropen__ = 'Y';
         OPEN(E) KWPLCRB;                //    KWPLCRB
         if        %error;
          return %error;
         endif;
        else;
         OPEN KWPLCRB;                //    KWPLCRB
        endif;
       endif;
       if   ((file__='KWPLDOC' or file__='*ALL') and NOT %OPEN(KWPLDOC));
        if (mbr__ <> '*FIRST');
         ovrdbf_(ovrflag__:'KWPLDOC':'KWPLDOC' : '*LIBL' : mbr__);
        elseif ('KWPLDOC' <> 'KWPLDOC');
         ovrdbf_(ovrflag__:'KWPLDOC':'KWPLDOC' : '*LIBL');
        endif;
        if    erropen__ = 'Y';
         OPEN(E) KWPLDOC;                //    KWPLDOC
         if        %error;
          return %error;
         endif;
        else;
         OPEN KWPLDOC;                //    KWPLDOC
        endif;
       endif;
       if   ((file__='KWPLFEE' or file__='*ALL') and NOT %OPEN(KWPLFEE));
        if (mbr__ <> '*FIRST');
         ovrdbf_(ovrflag__:'KWPLFEE':'KWPLFEE' : '*LIBL' : mbr__);
        elseif ('KWPLFEE' <> 'KWPLFEE');
         ovrdbf_(ovrflag__:'KWPLFEE':'KWPLFEE' : '*LIBL');
        endif;
        if    erropen__ = 'Y';
         OPEN(E) KWPLFEE;                //    KWPLFEE
         if        %error;
          return %error;
         endif;
        else;
         OPEN KWPLFEE;                //    KWPLFEE
        endif;
       endif;
       if   ((file__='KWPLINS' or file__='*ALL') and NOT %OPEN(KWPLINS));
        if (mbr__ <> '*FIRST');
         ovrdbf_(ovrflag__:'KWPLINS':'KWPLINS' : '*LIBL' : mbr__);
        elseif ('KWPLINS' <> 'KWPLINS');
         ovrdbf_(ovrflag__:'KWPLINS':'KWPLINS' : '*LIBL');
        endif;
        if    erropen__ = 'Y';
         OPEN(E) KWPLINS;                //    KWPLINS
         if        %error;
          return %error;
         endif;
        else;
         OPEN KWPLINS;                //    KWPLINS
        endif;
       endif;
       if   ((file__='KWPLNSF' or file__='*ALL') and NOT %OPEN(KWPLNSF));
        if (mbr__ <> '*FIRST');
         ovrdbf_(ovrflag__:'KWPLNSF':'KWPLNSF' : '*LIBL' : mbr__);
        elseif ('KWPLNSF' <> 'KWPLNSF');
         ovrdbf_(ovrflag__:'KWPLNSF':'KWPLNSF' : '*LIBL');
        endif;
        if    erropen__ = 'Y';
         OPEN(E) KWPLNSF;                //    KWPLNSF
         if        %error;
          return %error;
         endif;
        else;
         OPEN KWPLNSF;                //    KWPLNSF
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
       if   ((file__='KWPLTYPE' or file__='*ALL') and NOT %OPEN(KWPLTYPE));
        if (mbr__ <> '*FIRST');
         ovrdbf_(ovrflag__:'KWPLTYPE':'KWPLTYPE' : '*LIBL' : mbr__);
        elseif ('KWPLTYPE' <> 'KWPLTYPE');
         ovrdbf_(ovrflag__:'KWPLTYPE':'KWPLTYPE' : '*LIBL');
        endif;
        if    erropen__ = 'Y';
         OPEN(E) KWPLTYPE;                //    KWPLTYPE
         if        %error;
          return %error;
         endif;
        else;
         OPEN KWPLTYPE;                //    KWPLTYPE
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
       if   ((file__='KWPSIPADDR' or file__='*ALL') and NOT %OPEN(KWPSIPADDR));
        if (mbr__ <> '*FIRST');
         ovrdbf_(ovrflag__:'KWPSIPADDR':'KWPSIPADDR' : '*LIBL' : mbr__);
        elseif ('KWPSIPADDR' <> 'KWPSIPADDR');
         ovrdbf_(ovrflag__:'KWPSIPADDR':'KWPSIPADDR' : '*LIBL');
        endif;
        if    erropen__ = 'Y';
         OPEN(E) KWPSIPADDR;                //    KWPSIPADDR
         if        %error;
          return %error;
         endif;
        else;
         OPEN KWPSIPADDR;                //    KWPSIPADDR
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
       when      rcdfmt__='RKWPLBASE' and AM001_ = CV_ByKey and RS001_ = *ON ;
       update RKWPLBASE;
       when      rcdfmt__='RKWPLBASE' and AM001_ = CV_ByRrn and RS001_ = *ON ;
       update R__ARR001;
       when      rcdfmt__='RKWPLCASH' and AM003_ = CV_ByKey and RS003_ = *ON ;
       update RKWPLCASH;
       when      rcdfmt__='RKWPLNSF' and AM008_ = CV_ByKey and RS008_ = *ON ;
       update RKWPLNSF;
       when      rcdfmt__='RKWPDATA' and AM012_ = CV_ByKey and RS012_ = *ON ;
       update RKWPDATA;
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
       when      rcdfmt__='RKWPLBASE' and AM001_ = CV_ByKey and RS001_ = *ON ;
       delete RKWPLBASE;
       when      rcdfmt__='RKWPLBASE' and AM001_ = CV_ByRrn and RS001_ = *ON ;
       delete R__ARR001;
       when      rcdfmt__='RKWPLCASH' and AM003_ = CV_ByKey and RS003_ = *ON ;
       delete RKWPLCASH;
       when      rcdfmt__='RKWPLNSF' and AM008_ = CV_ByKey and RS008_ = *ON ;
       delete RKWPLNSF;
       when      rcdfmt__='RKWPLQUE' and AM009_ = CV_ByKey and RS009_ = *ON ;
       delete RKWPLQUE;
       when      rcdfmt__='RKWPDATA' and AM012_ = CV_ByKey and RS012_ = *ON ;
       delete RKWPDATA;
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
System Settings:  Locations
**CTDATA H__1        ListHeader                       2751
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.or
g/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>
    <meta name="genera
tor" content="WebSmart" />
    <meta http-equiv="Pragma" content="no-cache" />

   <title>System Settings:  Locations</title>
        <link rel="stylesheet" typ
e="text/css" href="/websmart/kwikloan/styles/klstylei.css" media="screen, tv, pr
ojection" />
         <link rel="stylesheet" type="text/css" href="/websmart/kwi
kloan/styles/klstyleInquiryList.css" media="screen, tv, projection" />
    <scri
pt type="text/javascript" src="/websmart/kwikloan/javascript/klscripts.js"></scr
ipt>
    <script type="text/javascript" src="/websmart/v7.2/javascript/esdiapi01
0.js"></script>
    <script type="text/javascript">
		xl_AttachEvent(window, "lo
ad", WindowInit); 

		function WindowInit()
		{
			xl_FocusFirstElement();
		}
	
</script>
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
                 <!--<tr><td><a href="#" oncl
ick="window.location='?task=beginmanage&rrn=0&rnd='"><img src="https://sv1.ameri
canfirstfinance.com:8158/websmart/kwikloan/images/modalIconsAN.png"></a><span cl
ass="LSlabel"></span></td></tr>-->     
                <tr><td><a href="#" oncl
ick=""><img src="https://sv1.americanfirstfinance.com:8158/websmart/kwikloan/ima
ges/loanInqADD.png"></a><span class="LSlabel"></span></td></tr>     


        </table> 
            
           <form method="get" action="">

       <input type="hidden" name="task" value="filter">
              <table cla
ss="accountInfo" id="loanSearchTable">
                <tr>
                  <t
d id="Lname"><span class="LSlabel">Branch Number:</span><br><input type="text" n
ame="PLNO" size="5" maxlength="5"></td>
                  </tr>

  <tr>
                  <td><br><br><input type="submit" value="Filter Results"
><br>
                  </td>
                </tr>
              </table> 

        </form>
            
          </div><!--left-->
          <div class="r
ight">
            <div id="scroller">
              <div id="sections">

         <ul>
                <li>


      <table class="mainlist">
        <tr>

          
          
          <th width="100">Action</th>
          <th width
="50" valign="top">Branch Number</th>
          <th width="400">Name 1</th>

      <th width="400">Name 2</th>
          <th width="400">Address 1</th>

     <th width="300">City</th>
          <th width="20">State</th>
          

        
        </tr>

**CTDATA H__2        ListDetails                      638
<tr class="">
 <!-- <td><a href="?TASK=disp&rrn=&FirstRowRRN="><img src="/websma
rt/v7.2/Lincoln/images/view.gif" alt="Display" title="Display"></a>
        <a h
ref="?TASK=beginmanage&rrn=&FirstRowRRN="><img src="/websmart/v7.2/Lincoln/image
s/edit.gif"  alt="Edit" title="Edit"></a>
        <a href="?TASK=delconf&rrn=&Fi
rstRowRRN="><img src="/websmart/v7.2/Lincoln/images/delete.gif" alt="Delete" tit
le="Delete"></a>
     </td> -->
      <td>
      
      
      
      </td>
  <t
d class="text right"></td>
  <td class="text"></td>
  <td class="text"></td>
  <
td class="text"></td>
  <td class="text"></td>
  <td class="text"></td>
</tr>

**CTDATA H__3        ListFooter                       744
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

<script type="text/javascript">

	// write the PREV link if necessary
	if( > 0)

	{
		xl_GetObj("prevlinktop").className ="prevlink";
		xl_GetObj("prevlinkbot").
className ="prevlink";
		xl_GetObj("prevlinktop").href="?task=prev&rrn=";
		xl_G
etObj("prevlinkbot").href="?task=prev&rrn=";
		
	}
	
	// write the NEXT link if
necessary
	if( > 0) 
	{
		xl_GetObj("nextlinktop").className ="nextlink";
		xl_G
etObj("nextlinkbot").className ="nextlink";
		xl_GetObj("nextlinktop").href="?ta
sk=default&rrn=";
		xl_GetObj("nextlinkbot").href="?task=default&rrn=";
	}
	
</s
cript>

</body>
</html>

**CTDATA H__4        RcdDisplay                       4688
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.or
g/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>
    <meta name="genera
tor" content="WebSmart" />
    <meta http-equiv="Pragma" content="no-cache" />

   <title>System Settings:  Locations - Display</title>
<link rel="stylesheet" t
ype="text/css" href="/websmart/kwikloan/styles/klDFtheme.css" media="screen, tv,
 projection" title="default"/>
    <link rel="alternate stylesheet" type="text/c
ss" href="/websmart/kwikloan/styles/klBStheme.css" media="screen, tv, projection
" title="bluesky"/>
    <link rel="alternate stylesheet" type="text/css" href="/
websmart/kwikloan/styles/klRDtheme.css" media="screen, tv, projection" title="re
ddevil"/>
    <link rel="alternate stylesheet" type="text/css" href="/websmart/k
wikloan/styles/klOCtheme.css" media="screen, tv, projection" title="orangecrush"
/>
        <link rel="stylesheet" type="text/css" href="/websmart/kwikloan/style
s/klstylei.css" media="screen, tv, projection" />
    <script type="text/javascr
ipt" src="/websmart/kwikloan/javascript/klscripts.js"></script>
    <script type
="text/javascript" src="/websmart/kwikloan/javascript/klthemes.js"></script>

 <script type="text/javascript" src="/websmart/v7.2/javascript/esdiapi010.js"></
script>
    
  </head>
  <body>
   <div id="wrapping">
  <div id="everything">

 
  
  <div id="pagetitle">
  	<span>System Settings:  Locations</span>
  </div>

  
  <div id="whitebg">
  <div id="EDITtitle"><span>View Location Settings</spa
n></div>

    <div id="EDITcontents"> 
      <div id="navtop">
        


      </div>
      <table>
        
        <tr>
          <td class="left">Bra
nch Number:</td>
          <td class="right"></td>
        </tr>
        <tr>

        <td class="left">Do not use Flag:</td>
          <td class="right"></td>

        </tr>
        <tr>
          <td class="left">Name 1:</td>
          <t
d class="right"></td>
        </tr>
        <tr>
          <td class="left">Name
 2:</td>
          <td class="right"></td>
        </tr>
        <tr>

<td class="left">Address 1:</td>
          <td class="right"></td>
        </tr>

        <tr>
          <td class="left">Address 2:</td>
          <td class="ri
ght"></td>
        </tr>
        <tr>
          <td class="left">City:</td>

      <td class="right"></td>
        </tr>
        <tr>
          <td class="le
ft">State:</td>
          <td class="right"></td>
        </tr>
        <tr>

       <td class="left">Zipcode:</td>
          <td class="right"></td>

</tr>
        <tr>
          <td class="left">Address 1:</td>
          <td clas
s="right"></td>
        </tr>
        <tr>
          <td class="left">Address 2:
</td>
          <td class="right"></td>
        </tr>
        <tr>
          <td
 class="left">City:</td>
          <td class="right"></td>
        </tr>

 <tr>
          <td class="left">State:</td>
          <td class="right"></td>

       </tr>
        <tr>
          <td class="left">Zipcode:</td>
          <td
 class="right"></td>
        </tr>
        <tr>
          <td class="left">Phone
 Number:</td>
          <td class="right"></td>
        </tr>
        <tr>

     <td class="left">Phone Number:</td>
          <td class="right"></td>

   </tr>
        <tr>
          <td class="left">Phone Number:</td>
          <t
d class="right"></td>
        </tr>
        <tr>
          <td class="left">TIME
 ZONE:</td>
          <td class="right"></td>
        </tr>
        <tr>

   <td class="left">EMAIL:</td>
          <td class="right"></td>
        </tr>

        <tr>
          <td class="left">Tax ID Number:</td>
          <td class=
"right"></td>
        </tr>
        <tr>
          <td class="left">Minimum Cash
:</td>
          <td class="right"></td>
        </tr>
        <tr>
          <t
d class="left">Branch Cash Limit 1:</td>
          <td class="right"></td>

   </tr>
        <tr>
          <td class="left">Branch Cash Limit 2:</td>

     <td class="right"></td>
        </tr>
        <tr>
          <td class="lef
t">NSF Fixed Amount:</td>
          <td class="right"></td>
        </tr>

  <tr>
          <td class="left">NSF Minimum Amount:</td>
          <td class="
right"></td>
        </tr>
        <tr>
          <td class="left">NSF Maximum A
mount:</td>
          <td class="right"></td>
        </tr>
        <tr>

   <td class="left">NSF Percent:</td>
          <td class="right"></td>

</tr>
        <tr>
          <td class="left">NSF Percent of:</td>
          <td
 class="right"></td>
        </tr>
      </table>
      
    </div><!--editconte
nts-->
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
**CTDATA H__7        RcdManage                        9978
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.or
g/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>
    <meta name="genera
tor" content="WebSmart" />
    <meta http-equiv="Pragma" content="no-cache" />

   <title>System Settings:  Locations - Add or Change</title>
    <style type="t
ext/css"> 
    
    </style>
    <script type="text/javascript" src="/websmart/k
wikloan/javascript/klscripts.js"></script>
    <script type="text/javascript" sr
c="/websmart/kwikloan/javascript/klthemes.js"></script>
    <script type="text/j
avascript" src="/websmart/v7.2/javascript/esdiapi010.js"></script>
    <script t
ype="text/javascript">
		xl_AttachEvent(window, "load", WindowInit); 

		functio
n WindowInit()
		{
			xl_FocusFirstElement();
		}
		
		 function mask(inputStrin
g,textbox,delimiterLocations,delimeter){
//only allow numeric input
		var charac
terTyped = inputString.substring(inputString.length - 1);
		if (characterTyped !
= '0'
		&& characterTyped != '1'
		&& characterTyped != '2'
		&& characterTyped
!= '3'
		&& characterTyped != '4'
		&& characterTyped != '5'
		&& characterTyped
 != '6'
		&& characterTyped != '7'
		&& characterTyped != '8'
		&& characterType
d != '9'
		&& characterTyped != '.')
		{
		textbox.value = inputString.substring
(0,inputString.length - 1);
		return;
		}
		var locations = delimiterLocations.s
plit(',');
		for (var i = 0; i <= locations.length; i++)
		{
			for (var k = 0;
k <= inputString.length; k++)
			{
				if (k == locations[i])
				{
					if (inp
utString.substring(k, k+1) != delimeter)
					{
					inputString = inputString.s
ubstring(0,k) + delimeter + inputString.substring(k,inputString.length);
					}

				}
			}
		}
		textbox.value = inputString;
		}
	</script>
  </head>
  <body>

    <form action="" method="get">
      <input type="hidden" name="task" value="
endmanage">
      <input type="hidden" name="rrn" value="">
      <input type="h
idden" name="FirstRowRRN" value="">
      <div id="pagetitle">
        <span>Sys
tem Settings:  Locations</span>
        <div id="topBtns" >
          <input typ
e="submit" class="navbutton" name="mode" value="Add">
          
          <butt
on class="navbutton" onclick="javascript:location.href='?rrn=;return false;'">Ca
ncel</button>
        </div>
      </div>
      
      <div id="wrapping">

   
        
        
        
        
        <div id="whitebg" class="whitebg
">
          <div id="EDITcontents"> 
            
              <table id="hold
erTable">
                
                
                <tr>

   <th>Location Settings</th>
                </tr>
                <tr>

           <td class="holderTd">
                    <table class="dealerTable"
style="">
                      
                      <tr>

    <td class="left">Branch Number:</td>
                        <td class="righ
t"><input type="text" name="PLNO" value=""></td>
                      </tr>

                   <tr>
                        <td class="left">Do not use Flag
:</td>
                        <td class="right"></td>
                      </t
r>
                      <tr>
                        <td class="left">Name 1:</
td>
                        <td class="right"><input type="text" name="PLNAM1" s
ize="40" maxlength="40" value=""></td>
                      </tr>

         <tr>
                        <td class="left">Name 2:</td>

            <td class="right"><input type="text" name="PLNAM2" size="40" maxleng
th="40" value=""></td>
                      </tr>
                      <tr>

                      <td class="left">Address 1:</td>
                        <
td class="right"><input type="text" name="PLADR1" size="40" maxlength="40" value
=""></td>
                      </tr>
                      <tr>

         <td class="left">Address 2:</td>
                        <td class="rig
ht"><input type="text" name="PLADR2" size="40" maxlength="40" value=""></td>

                   </tr>
                      <tr>
                        <td
class="left">City:</td>
                        <td class="right"><input type="t
ext" name="PLCITY" size="30" maxlength="30" value=""></td>

 </tr>
                      <tr>
                        <td class="left">State
:</td>
                        <td class="right"></td>
                      </t
r>
                      <tr>
                        <td class="left">Zipcode:<
/td>
                        <td class="right"><input type="text" name="PLZIP" s
ize="10" maxlength="10" value="" onkeyup="mask(this.value,this,'5','-');"></td>

                      </tr>
                      <tr>
                        <
td class="left">Address 1:</td>
                        <td class="right"><input
 type="text" name="PLADR11" size="40" maxlength="40" value=""></td>

          </tr>
                      <tr>
                        <td class="le
ft">Address 2:</td>
                        <td class="right"><input type="text"
 name="PLADR21" size="40" maxlength="40" value=""></td>
                      </
tr>
                      <tr>
                        <td class="left">City:</t
d>
                        <td class="right"><input type="text" name="PLCITY1" s
ize="30" maxlength="30" value=""></td>
                      </tr>

         <tr>
                        <td class="left">State:</td>

           <td class="right"></td>
                      </tr>

     <tr>
                        <td class="left">Zipcode:</td>

         <td class="right"><input type="text" name="PLZIP1" size="10" maxlength=
"10" value="" onkeyup="mask(this.value,this,'5','-');"></td>

   </tr>
                      <tr>
                        <td class="left">Pho
ne Number:</td>
                        <td class="right"><input type="text" nam
e="PLPHON" size="12" maxlength="12" value="" onkeyup="mask(this.value,this,'3,7'
,'-');"></td>
                      </tr>
                      <tr>

             <td class="left">Phone Number:</td>
                        <td cla
ss="right"><input type="text" name="PLPHON1" size="12" maxlength="12" value="" o
nkeyup="mask(this.value,this,'3,7','-');"></td>
                      </tr>

                  <tr>
                        <td class="left">Fax Number:</td>

                        <td class="right"><input type="text" name="PLFAX" size=
"12" maxlength="12" value="" onkeyup="mask(this.value,this,'3,7','-');"></td>

                    </tr>
                      <tr>
                        <td
 class="left">TIME ZONE:</td>
                        <td class="right"><input t
ype="text" name="PLTIMEZ" size="8" maxlength="8" value=""></td>

      </tr>
                      <tr>
                        <td class="left">
EMAIL:</td>
                        <td class="right"><input type="text" name="P
LEMAIL" size="50" maxlength="50" value=""></td>
                      </tr>

                  <tr>
                        <td class="left">Tax ID Number:</
td>
                        <td class="right"><input type="text" name="PLTIN" si
ze="11" maxlength="11" value="" onkeyup="mask(this.value,this,'3,6','-');"></td>

                      </tr>
                      <tr>

<td class="left">Minimum Cash:</td>
                        <td class="right"><i
nput type="text" name="PLCBAL" size="11" maxlength="11" value=""></td>

             </tr>
                      <tr>
                        <td class=
"left">Branch Cash Limit 1:</td>
                        <td class="right"><inpu
t type="text" name="PLCLIM1" size="11" maxlength="11" value=""></td>

           </tr>
                      <tr>
                        <td class="l
eft">Branch Cash Limit 2:</td>
                        <td class="right"><input
type="text" name="PLCLIM2" size="11" maxlength="11" value=""></td>

         </tr>
                      <tr>
                        <td class="lef
t"> NSF Fixed Amount:</td>
                        <td class="right"><input type
="text" name="PNSFAMT" size="11" maxlength="11" value=""></td>

     </tr>
                      <tr>
                        <td class="left">N
SF Minimum Amount:</td>
                        <td class="right"><input type="t
ext" name="PNSFMIN" size="11" maxlength="11" value=""></td>

  </tr>
                      <tr>
                        <td class="left">NSF
Maximum Amount:</td>
                        <td class="right"><input type="text
" name="PNSFMAX" size="11" maxlength="11" value=""></td>
                      <
/tr>
                      <tr>
                        <td class="left">NSF Per
cent:</td>
                        <td class="right"><input type="text" name="PN
SFPCT" size="8" maxlength="8" value=""></td>
                      </tr>

               <tr>
                        <td class="left">NSF Percent of:</td
>
                        <td class="right"><input type="text" name="PNSFPCTOF"
size="1" maxlength="1" value=""></td>
                      </tr>	
					<tr>

                     <td class="left">IP ADDRESS:</td>
                        <
td class="right"><input type="text" name="KWK_IPADDR" size="25" maxlength="25" v
alue=""></td>
                      </tr>	
                    </table>

          </td>
                  
                </tr>
                

        </table>
              <script type="text/javascript">
	var protkey = ""
;   
	
	if( == 0)
	{
		
		xl_GetFormElementByName("mode").value = "Add";
	} 
	el
se 
	{
		protkey  = xl_GetFormElementByName("PLNO");
		protkey.disabled = true;

		protkey.className = protkey.className + " disabled";
		xl_GetFormElementByName
("mode").value = "Change";
	}
</script>
            </form>
          </div><!--
editcontents-->
        </div></div>
    </body>
  </html>
**CTDATA H__8        manageCSS                        2600
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
#topBtns
{
float: right;
paddin
g-right: 12px;
margin-right: 30px;
}
.loanProd
{
border-left: 1px solid #cccccc;
	
}
.holderTd
{
border-right: 1px solid #cccccc;
}
#stateTable
{
position: relat
ive;
width: 300px;
border-left: 1px solid #CCCCCC;	
}
.stateTable tr td
{
paddin
g: 0px 0px 0px 3px;
vertical-align: top;	
}
.loanProd
{
padding: 0px 0px 0px 3px
;
vertical-align: top;	
}
#stateOfBus
{
font-family: verdana;
font-size: 11px;	

}
#loanProd
{
font-family: verdana;
font-size: 11px;
}
body {
background-image:
none;
color: #000000;
background-color: #c9c9c9;
padding-top: 0px;
padding-botto
m: 0px;
padding-left: 0px;
padding-right: 0px;
}

#wrapping {
width: 98%;
margin
-left: auto;
margin-right: auto;
}

#everything {
width: 98%;
margin-top: 10px;

margin-left: auto;
margin-right: auto;
padding-bottom: 10px;
background-color: #
EAEAEA;
background-image: url('/websmart/kwikloan/images/pshadow.png');
backgrou
nd-position: right;
background-repeat: repeat-y;
}

#pagetitle {
font-size: 14px
;
color: #FFFFFF;
width: 100%;
background-color: #839dc1;
padding: 10px;
positio
n: fixed;
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
background-color: #FFFFF
F;
border: 1px solid #999;
padding: 10px;
margin-top: 10px;
margin-bottom: 10px;

margin-left: auto;
margin-right: auto;
width: 98%;
height: 98%;
}

#whitebg tab
le td a {
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
b
ackground-image: url('/websmart/kwikloan/images/loanInqLeft.png');
}

DIV.right
{
position: relative;
float: left;
height: 550px;
width: 650px; 
}


table.deale
rTable 
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
table.d
ealerTable td 
{
font-family: verdana;
font-size: 11px;
padding: 6px 5px 6px 0px
;
vertical-align: middle;
}
table.dealerTable td.left 
{
text-align: right;
widt
h: 130px;
}
table.dealerTable td.right 
{
padding-left: 8px;
text-align: left;
w
idth: 190px;
vertical-align: middle;
}



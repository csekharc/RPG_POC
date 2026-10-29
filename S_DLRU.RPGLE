     H/TITLE  System Settings:  Users
      * ProGen WebSmart Revision 21923
      * File overrides for compile command
      *__OV OVRDBF KWPDUSER   KWPDUSER
      *__OV OVRDBF F__ARR001  KWPDUSER
      *__OV OVRDBF KWPDLOC    KWPDLOC
      *__OV OVRDBF KWPDBASE   KWPDBASE
      *__OV OVRDBF KWPDUOPT   KWPDUOPT
      *__OV OVRDBF KWP_DATA   KWP_DATA
      *__OV OVRDBF KWPRULE    KWPRULE
      *__OV OVRDBF KWPUOPT    KWPUOPT
      *__OV OVRDBF KWPDDATA   KWPDDATA
      *__   Following values are used to create the server program
      *__RO Pgm  lib KWWEB      Pgm  S_DLRU
      *__AG          WEBSMART
      *__CL          *OBJLIBNAM
      *__SQ
      *__BD ECRTBND195
      *===============================================================*
      * Path:   s_dlru.pdw
      * System: REGGIE-LENOVO
      * Project:Kwik-Loan
      * Set:    Development
      * User:   Reggie
      * Date Last Generated:   2017-10-28   13:58:36
      * Last Generated CRC: A681D996 327E19E8 F073A819 0E612CCF
      *===============================================================*
      */CPY *LIBL/PW_CSRC CPYRIGHT
      * File specifications
     FKWPDUSER  UF A E           K DISK    USROPN
     F                                     INFDS(FID001_   )
     FF__ARR001 UF A E             DISK    USROPN
     F                                     RENAME(RKWPDUSER    :R__ARR001   )
     FKWPDLOC   IF   E           K DISK    USROPN
     F                                     INFDS(FID002_   )
     FKWPDBASE  IF   E           K DISK    USROPN
     F                                     INFDS(FID003_   )
     FKWPDUOPT  UF A E           K DISK    USROPN
     F                                     INFDS(FID004_   )
     FKWP_DATA  IF   E           K DISK    USROPN
     F                                     INFDS(FID005_   )
     FKWPRULE   IF   E           K DISK    USROPN
     F                                     INFDS(FID006_   )
     FKWPUOPT   IF   E           K DISK    USROPN
     F                                     INFDS(FID007_   )
     FKWPDDATA  UF A E           K DISK    USROPN
     F                                     INFDS(FID008_   )

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
     D chkipaddr       S              1A
     D current_sec     S             50A
     D lastpgm         S             20A
     D lastpgm2        S             20A
     D dlrcust         S              9P 0
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
     D pdinfo          S            100A
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


     D H__1            S             80    PERRCD(1) CTDATA DIM(41          )

     D H__2            S             80    PERRCD(1) CTDATA DIM(5           )

     D H__3            S             80    PERRCD(1) CTDATA DIM(13          )

     D H__4            S             80    PERRCD(1) CTDATA DIM(31          )

     D H__5            S             80    PERRCD(1) CTDATA DIM(33          )

     D H__6            S             80    PERRCD(1) CTDATA DIM(2           )

     D H__7            S             80    PERRCD(1) CTDATA DIM(103         )

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
     D wrtstaffbox0...
     D                 PR
     D wrtofficebox0...
     D                 PR
     D prtchkbox0...
     D                 PR
     D QPGM__          S             21A
     D LstPmlErr_      S              4P 0 IMPORT
     D reprtchkbox0...
     D                 PR
     D reasnrepbox0...
     D                 PR
     D signdocsbox0...
     D                 PR
     D viewallbox0...
     D                 PR
     D delappbox0...
     D                 PR
     D undelappbox0...
     D                 PR
     D updchknobox0...
     D                 PR
     D wrt_cust_opts0...
     D                 PR
     D ipaddrbox0...
     D                 PR
     D CURTIME__       S              6P 0
     D QPGMNAM__       S             20A
     D SmurfChk__      S              1A   INZ(*ON)
     D Smurf_ID__      S             64A   IMPORT
     D Smurf_Rw__      S              9B 0 IMPORT

     D boxselect       S                   LIKE(p_zkeya       )
     D pdkdsec         S                   LIKE(pduemail      )
     D kdmlocs         S                   LIKE(pduemail      )
     D aff_staff       S                   LIKE(pddchar       )
     D undelapp        S                   LIKE(delapp        )
     D office          S                   LIKE(pdloc         )
     D prtchk          S                   LIKE(pduyesno      )
     D reprtchk        S                   LIKE(pduyesno      )
     D updchkno        S                   LIKE(pduyesno      )
     D reasnrep        S                   LIKE(pduyesno      )
     D delapp          S                   LIKE(pduyesno      )
     D signdocs        S                   LIKE(pduyesno      )
     D viewall         S                   LIKE(pduyesno      )
     D user            S                   LIKE(pduid         )
     D startuser       S                   LIKE(pduid         )
     D saveuser        S                   LIKE(pduid         )

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

     C     DL001_        KLIST
     C                   KFLD                    pdutype
     C                   KFLD                    pdno
     C                   KFLD                    pduid
     C     DL002_        KLIST
     C                   KFLD                    pdno
     C     officekey     KLIST
     C                   KFLD                    pdutype
     C                   KFLD                    pdno
     C     DL003_        KLIST
     C                   KFLD                    pdno
     C     DL004_        KLIST
     C                   KFLD                    pdno
     C                   KFLD                    pduid
     C                   KFLD                    pduopt
     C     DL006_        KLIST
     C                   KFLD                    pruletype
     C                   KFLD                    prulename
     C     DL007_        KLIST
     C                   KFLD                    userid
     C                   KFLD                    puotype
     C     DL008_        KLIST
     C                   KFLD                    pdno
     C                   KFLD                    pddtype
     C                   KFLD                    pddcode
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
       pdno = getparm3_('pdno':'*OPT');
       AM003_ = CV_BYKEY;
       CHAIN(NE) DL003_ RKWPDBASE;
       RS003_ = RcdSts2_('GETRCD': %error: %found: %eof);
       listsize = 5;
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
       pdno = getparm3_('pdno':'*OPT');
       AM003_ = CV_BYKEY;
       CHAIN(NE) DL003_ RKWPDBASE;
       RS003_ = RcdSts2_('GETRCD': %error: %found: %eof);
       pduid = userid;
       pdutype = 'DEALER';
       AM001_ = CV_BYKEY;
       CHAIN(E) DL001_ RKWPDUSER;
       RS001_ = RcdSts2_('GETRCD': %error: %found: %eof);
       pdutype = 'OFFICE';
       if (rcdcnt = 0);
        user = getparm3_('user':'*OPT');
       endif;
       outweb_(%subst(%str(%addr(H__1(1))):1:1019));
       wfrtn__ = AfToPage_(QPGMNAM__);
       outweb_(%subst(%str(%addr(H__1(13))):60:246));
       wfrtn__ = AfToPage_(PDNO);
       outweb_(%subst(%str(%addr(H__1(16))):66:2));
       wfrtn__ = AfToPage_(PDNAME);
       outweb_(%subst(%str(%addr(H__1(16))):68:734));
       wfrtn__ = AfToPage_(QPGMNAM__);
       outweb_(%subst(%str(%addr(H__1(26))):2:28));
       wfrtn__ = AfToPage_(RND);
       outweb_(%subst(%str(%addr(H__1(26))):30:6));
       wfrtn__ = AfToPage_(PDNO);
       outweb_(%subst(%str(%addr(H__1(26))):36:1216));
       rcdcnt = 0;
       if (user <> '');
        pduid = user;
        SETLL  DL001_ RKWPDUSER;
        RS001_ = RcdSts2_('POSRCD':%error:%equal:%eof);
        READE(E) officekey RKWPDUSER;
        RS001_ = RcdSts2_('GETNXTRCD':%error:%found:%eof);
        AM001_ = CV_ByKey;
       else;
        SETLL  officekey RKWPDUSER;
        RS001_ = RcdSts2_('POSRCD':%error:%equal:%eof);
        READE(E) officekey RKWPDUSER;
        RS001_ = RcdSts2_('GETNXTRCD':%error:%found:%eof);
        AM001_ = CV_ByKey;
       endif;
       startuser = pduid;
       if (RS001_ <> '1');
       endif;
       dow ((RS001_ = '1'));
       rrn = RR_001_;
       if (rcdcnt = 0);
        startrrn = RR_001_;
       endif;
      /end-free
     C/Exec SQL
     C+  select PDCITY, PDST into :PDCITY, :PDST from KWPDLOC where PDNO = :PDNO
     C+  and PDLOC = :PDLOC
     C/End-Exec
      /free
       pdinfo = %trim(%editc(PDLOC:'P')) + '-' + %trim(pdcity) + ',' + %trim(
       pdst);
       Flip_Rc_();
       outweb_(%subst(%str(%addr(H__2(1))):1:11));
       wfrtn__ = AfToPage_(ARCLR__);
       outweb_(%subst(%str(%addr(H__2(1))):12:23));
       wfrtn__ = AfToPage_(QPGMNAM__);
       outweb_(%subst(%str(%addr(H__2(1))):35:22));
       AfToPage_(%trim(%editc(RRN:'X')));
       outweb_(%subst(%str(%addr(H__2(1))):57:13));
       AfToPage_(%trim(%editc(STARTRRN:'X')));
       outweb_(%subst(%str(%addr(H__2(1))):70:6));
       wfrtn__ = AfToPage_(PDNO);
       outweb_(%subst(%str(%addr(H__2(1))):76:95));
       wfrtn__ = AfToPage_(QPGMNAM__);
       outweb_(%subst(%str(%addr(H__2(3))):11:18));
       AfToPage_(%trim(%editc(RRN:'X')));
       outweb_(%subst(%str(%addr(H__2(3))):29:13));
       AfToPage_(%trim(%editc(STARTRRN:'X')));
       outweb_(%subst(%str(%addr(H__2(3))):42:6));
       wfrtn__ = AfToPage_(PDNO);
       outweb_(%subst(%str(%addr(H__2(3))):48:115));
       wfrtn__ = AfToPage_(PDUID);
       outweb_(%subst(%str(%addr(H__2(5))):3:25));
       wfrtn__ = AfToPage_(PDUNAME);
       outweb_(%subst(%str(%addr(H__2(5))):28:25));
       wfrtn__ = AfToPage_(PDINFO);
       outweb_(%subst(%str(%addr(H__2(5))):53:12));
       endrrn = RR_001_;
       rcdcnt = rcdcnt + 1;
       READE(E) officekey RKWPDUSER;
       RS001_ = RcdSts2_('GETNXTRCD':%error:%found:%eof);
       AM001_ = CV_ByKey;
       enddo;
       saveuser = pduid;
       pduid = startuser;
       SETLL  DL001_ RKWPDUSER;
       RS001_ = RcdSts2_('POSRCD':%error:%equal:%eof);
       READPE(E) officekey RKWPDUSER;
       RS001_ = RcdSts2_('GETPRVRCD': %error: %found: %eof);
       AM001_ = CV_ByKey;
       if (RS001_ = '1');
        prevstate = 1;
       endif;
       if (rcdcnt = listsize);
        RR_001_ = endrrn;
        pduid = saveuser;
        SETLL  DL001_ RKWPDUSER;
        RS001_ = RcdSts2_('POSRCD':%error:%equal:%eof);
        READE(E) officekey RKWPDUSER;
        RS001_ = RcdSts2_('GETNXTRCD':%error:%found:%eof);
        AM001_ = CV_ByKey;
        if (RS001_ = '1');
         endrrn = RR_001_;
         nextstate = 1;
        endif;
       endif;
       outweb_(%subst(%str(%addr(H__3(1))):1:984));

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
       pduid = userid;
       pdutype = 'DEALER';
       pdno = '';
       AM001_ = CV_BYKEY;
       CHAIN(E) DL001_ RKWPDUSER;
       RS001_ = RcdSts2_('GETRCD': %error: %found: %eof);
       user = getparm3_('user':'*OPT');
       pduid = user;
       pdutype = 'OFFICE';
       pdno = pdudealer;
       SETLL  DL001_ RKWPDUSER;
       RS001_ = RcdSts2_('POSRCD':%error:%equal:%eof);
       READPE(E) officekey RKWPDUSER;
       RS001_ = RcdSts2_('GETPRVRCD': %error: %found: %eof);
       AM001_ = CV_ByKey;
       rcdcnt = 1;
       dow ((((RS001_ = '1')) and ((rcdcnt< listsize))));
       rcdcnt = rcdcnt + 1;
       READPE(E) officekey RKWPDUSER;
       RS001_ = RcdSts2_('GETPRVRCD': %error: %found: %eof);
       AM001_ = CV_ByKey;
       enddo;
       startrrn = RR_001_;
       user = pduid;
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
       outweb_(%subst(%str(%addr(H__4(1))):1:1531));
       if (TASK__ = 'DISP');
        outweb_(%subst(%str(%addr(H__6(1))):1:93));
        wfrtn__ = AfToPage_(PDNO);
        outweb_(%subst(%str(%addr(H__6(2))):14:4));
       else;
        if (TASK__ = 'DELCONF');
         outweb_(%subst(%str(%addr(H__5(1))):1:1451));
         wfrtn__ = AfToPage_(QPGMNAM__);
         outweb_(%subst(%str(%addr(H__5(19))):12:131));
         AfToPage_(%trim(%editc(RRN:'X')));
         outweb_(%subst(%str(%addr(H__5(20))):63:62));
         wfrtn__ = AfToPage_(SAVEDRRN);
         outweb_(%subst(%str(%addr(H__5(21))):45:145));
         wfrtn__ = AfToPage_(PDUID);
         outweb_(%subst(%str(%addr(H__5(23))):30:124));
         wfrtn__ = AfToPage_(PDUEMAIL);
         outweb_(%subst(%str(%addr(H__5(24))):74:128));
         wfrtn__ = AfToPage_(PDUNAME);
         outweb_(%subst(%str(%addr(H__5(26))):42:217));
         wfrtn__ = AfToPage_(QPGMNAM__);
         outweb_(%subst(%str(%addr(H__5(29))):19:14));
         AfToPage_(%trim(%editc(RRN:'X')));
         outweb_(%subst(%str(%addr(H__5(29))):33:13));
         wfrtn__ = AfToPage_(SAVEDRRN);
         outweb_(%subst(%str(%addr(H__5(29))):46:99));
         wfrtn__ = AfToPage_(SAVEDRRN);
         outweb_(%subst(%str(%addr(H__5(30))):65:195));
        endif;
       endif;
       outweb_(%subst(%str(%addr(H__4(20))):12:44));
       wfrtn__ = AfToPage_(QPGMNAM__);
       outweb_(%subst(%str(%addr(H__4(20))):56:91));
       wfrtn__ = AfToPage_(PDNO);
       outweb_(%subst(%str(%addr(H__4(21))):67:108));
       wfrtn__ = AfToPage_(PDUID);
       outweb_(%subst(%str(%addr(H__4(23))):15:124));
       wfrtn__ = AfToPage_(PDUNAME);
       outweb_(%subst(%str(%addr(H__4(24))):59:105));
       wfrtn__ = AfToPage_(PDUTITLE);
       outweb_(%subst(%str(%addr(H__4(26))):4:101));
       wrtofficebox0();
       outweb_(%subst(%str(%addr(H__4(27))):25:108));
       wfrtn__ = AfToPage_(PDUEMAIL);
       outweb_(%subst(%str(%addr(H__4(28))):53:116));
       wfrtn__ = AfToPage_(PDUPASS);
       outweb_(%subst(%str(%addr(H__4(30))):9:92));

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
       puotype = 'EDITDLR';
       AM007_ = CV_BYKEY;
       CHAIN(NE) DL007_ RKWPUOPT;
       RS007_ = RcdSts2_('GETRCD': %error: %found: %eof);
       if ((((RS007_ = '1')) and ((puoyesno = 'N'))));
        displist0();
        return ;
       endif;
       rrn = %dec(aton_( getparm3_('rrn':'*MAND'):46:16):9:0);
       savedrrn = getparm3_('FirstRowRRN':'*OPT');
       RR_001_ = rrn;
       AM001_ = CV_BYRRN;
       CHAIN(E) RR_001_ R__ARR001;
       RS001_ = RcdSts2_('GETRCD': %error: %found: %eof);
       outweb_(%subst(%str(%addr(H__5(1))):1:1451));
       wfrtn__ = AfToPage_(QPGMNAM__);
       outweb_(%subst(%str(%addr(H__5(19))):12:131));
       AfToPage_(%trim(%editc(RRN:'X')));
       outweb_(%subst(%str(%addr(H__5(20))):63:62));
       wfrtn__ = AfToPage_(SAVEDRRN);
       outweb_(%subst(%str(%addr(H__5(21))):45:145));
       wfrtn__ = AfToPage_(PDUID);
       outweb_(%subst(%str(%addr(H__5(23))):30:124));
       wfrtn__ = AfToPage_(PDUEMAIL);
       outweb_(%subst(%str(%addr(H__5(24))):74:128));
       wfrtn__ = AfToPage_(PDUNAME);
       outweb_(%subst(%str(%addr(H__5(26))):42:217));
       wfrtn__ = AfToPage_(QPGMNAM__);
       outweb_(%subst(%str(%addr(H__5(29))):19:14));
       AfToPage_(%trim(%editc(RRN:'X')));
       outweb_(%subst(%str(%addr(H__5(29))):33:13));
       wfrtn__ = AfToPage_(SAVEDRRN);
       outweb_(%subst(%str(%addr(H__5(29))):46:99));
       wfrtn__ = AfToPage_(SAVEDRRN);
       outweb_(%subst(%str(%addr(H__5(30))):65:195));

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
        SETLL  DL001_ RKWPDUSER;
        RS001_ = RcdSts2_('POSRCD':%error:%equal:%eof);
        READPE(E) DL001_ RKWPDUSER;
        RS001_ = RcdSts2_('GETPRVRCD': %error: %found: %eof);
        AM001_ = CV_ByKey;
        savedrrn = %trim(%editc(RR_001_:'P'));
        RR_001_ = rrn;
        AM001_ = CV_BYRRN;
        CHAIN(E) RR_001_ R__ARR001;
        RS001_ = RcdSts2_('GETRCD': %error: %found: %eof);
       endif;
      /end-free
     C                   EVAL      RS001_ = DeleteRcd_('RKWPDUSER')
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
       if (rrn = 0);
        puotype = 'EDITDLR';
        AM007_ = CV_BYKEY;
        CHAIN(NE) DL007_ RKWPUOPT;
        RS007_ = RcdSts2_('GETRCD': %error: %found: %eof);
        if ((((RS007_ = '1')) and ((puoyesno = 'N'))));
         displist0();
         return ;
        endif;
        CLEAR  RKWPDUSER;
       endif;
       pdno = getparm3_('pdno':'*OPT');
       RR_001_ = rrn;
       AM001_ = CV_BYRRN;
       CHAIN(E) RR_001_ R__ARR001;
       RS001_ = RcdSts2_('GETRCD': %error: %found: %eof);
       pduopt = 'PRINTCHECKS';
       AM004_ = CV_BYKEY;
       CHAIN(NE) DL004_ RKWPDUOPT;
       RS004_ = RcdSts2_('GETRCD': %error: %found: %eof);
       prtchk = pduyesno;
       pduopt = 'REPRINTCHKS';
       AM004_ = CV_BYKEY;
       CHAIN(NE) DL004_ RKWPDUOPT;
       RS004_ = RcdSts2_('GETRCD': %error: %found: %eof);
       reprtchk = pduyesno;
       pduopt = 'UPDATECHKNOS';
       AM004_ = CV_BYKEY;
       CHAIN(NE) DL004_ RKWPDUOPT;
       RS004_ = RcdSts2_('GETRCD': %error: %found: %eof);
       updchkno = pduyesno;
       if (((client = '108') or (client = '908')));
        pduopt = 'REASNREP';
        AM004_ = CV_BYKEY;
        CHAIN(NE) DL004_ RKWPDUOPT;
        RS004_ = RcdSts2_('GETRCD': %error: %found: %eof);
        reasnrep = pduyesno;
        pduopt = 'DELAPP';
        AM004_ = CV_BYKEY;
        CHAIN(NE) DL004_ RKWPDUOPT;
        RS004_ = RcdSts2_('GETRCD': %error: %found: %eof);
        delapp = pduyesno;
        pduopt = 'UNDELAPP';
        AM004_ = CV_BYKEY;
        CHAIN(NE) DL004_ RKWPDUOPT;
        RS004_ = RcdSts2_('GETRCD': %error: %found: %eof);
        undelapp = pduyesno;
        pduopt = 'SIGNDOCS';
        AM004_ = CV_BYKEY;
        CHAIN(NE) DL004_ RKWPDUOPT;
        RS004_ = RcdSts2_('GETRCD': %error: %found: %eof);
        signdocs = pduyesno;
        pduopt = 'VIEWALL';
        AM004_ = CV_BYKEY;
        CHAIN(NE) DL004_ RKWPDUOPT;
        RS004_ = RcdSts2_('GETRCD': %error: %found: %eof);
        viewall = pduyesno;
       endif;
       pduopt = 'CHKIPADDR';
       AM004_ = CV_BYKEY;
       CHAIN(NE) DL004_ RKWPDUOPT;
       RS004_ = RcdSts2_('GETRCD': %error: %found: %eof);
       chkipaddr = pduyesno;
       outweb_(%subst(%str(%addr(H__7(1))):1:333));
       outweb_(%subst(%str(%addr(H__8(1))):1:2599));
       outweb_(%subst(%str(%addr(H__7(5))):14:529));
       wfrtn__ = AfToPage_(QPGMNAM__);
       outweb_(%subst(%str(%addr(H__7(11))):63:119));
       AfToPage_(%trim(%editc(RRN:'X')));
       outweb_(%subst(%str(%addr(H__7(13))):22:56));
       wfrtn__ = AfToPage_(SAVEDRRN);
       outweb_(%subst(%str(%addr(H__7(13))):78:49));
       wfrtn__ = AfToPage_(PDNO);
       outweb_(%subst(%str(%addr(H__7(14))):47:315));
       wfrtn__ = AfToPage_(PDNO);
       outweb_(%subst(%str(%addr(H__7(18))):42:598));
       wrtstaffbox0();
       outweb_(%subst(%str(%addr(H__7(25))):80:196));
       wfrtn__ = AfToPage_(PDUID);
       outweb_(%subst(%str(%addr(H__7(28))):36:247));
       wfrtn__ = AfToPage_(PDUPASS);
       outweb_(%subst(%str(%addr(H__7(31))):43:173));
       wrtofficebox0();
       outweb_(%subst(%str(%addr(H__7(33))):56:52));
       wrt_cust_opts0();
       outweb_(%subst(%str(%addr(H__7(34))):28:189));
       wfrtn__ = AfToPage_(PDUNAME);
       outweb_(%subst(%str(%addr(H__7(36))):57:246));
       wfrtn__ = AfToPage_(PDUTITLE);
       outweb_(%subst(%str(%addr(H__7(39))):63:248));
       wfrtn__ = AfToPage_(PDUEMAIL);
       outweb_(%subst(%str(%addr(H__7(42))):71:247));
       wfrtn__ = AfToPage_(PDUPHONE);
       outweb_(%subst(%str(%addr(H__7(45))):78:183));
       prtchkbox0();
       outweb_(%subst(%str(%addr(H__7(48))):21:159));
       reprtchkbox0();
       outweb_(%subst(%str(%addr(H__7(50))):20:161));
       updchknobox0();
       outweb_(%subst(%str(%addr(H__7(52))):21:159));
       reasnrepbox0();
       outweb_(%subst(%str(%addr(H__7(54))):20:156));
       delappbox0();
       outweb_(%subst(%str(%addr(H__7(56))):16:159));
       undelappbox0();
       outweb_(%subst(%str(%addr(H__7(58))):15:159));
       signdocsbox0();
       outweb_(%subst(%str(%addr(H__7(60))):14:162));
       viewallbox0();
       outweb_(%subst(%str(%addr(H__7(62))):16:135));
       ipaddrbox0();
       outweb_(%subst(%str(%addr(H__7(63))):71:214));
       AfToPage_(%trim(%editc(RRN:'X')));
       outweb_(%subst(%str(%addr(H__7(66))):45:2948));

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
       pduid = userid;
       pdutype = 'DEALER';
       if (mode = 'Add');
        AM001_ = CV_BYKEY;
        CHAIN(E) DL001_ RKWPDUSER;
        RS001_ = RcdSts2_('GETRCD': %error: %found: %eof);
        pdno = getparm3_('pdno':'*OPT');
        pdudealer = pdno;
        pduid = getparm3_('pduid':'*OPT');
        pduname = getparm3_('pduname':'*OPT');
        pdupass = getparm3_('pdupass':'*OPT');
        pduemail = getparm3_('pduemail':'*OPT');
        PDLOC = %dec(aton_( getparm3_('PDLOC':'*OPT'):46:16):11:0);
        pdkdsec = getparm3_('pdkdsec':'*OPT');
        pduphone = getparm3_('pduphone':'*OPT');
        pdutitle = getparm3_('pdutitle':'*OPT');
        aff_staff = getparm3_('aff_staff':'*OPT');
        pdno = getparm3_('PDNO':'*OPT');
        pddtype = 'AFF_STAFF';
        pddcode = pduid;
        AM008_ = CV_BYKEY;
        CHAIN(E) DL008_ RKWPDDATA;
        RS008_ = RcdSts2_('GETRCD': %error: %found: %eof);
        pddchar = aff_staff;
        if (RS008_ = '1');
         RS008_ = UpdateRcd_('RKWPDDATA');
        else;
         WRITE RKWPDDATA;
         RS008_ = RcdSts2_('WRTRCD': %error: %found: %eof);
        endif;
        if (PDLOC = 0);
         errmsg = 'OFFICE CANNOT BE BLANK';
         outweb_(%subst(%str(%addr(H__7(1))):1:333));
         outweb_(%subst(%str(%addr(H__8(1))):1:2599));
         outweb_(%subst(%str(%addr(H__7(5))):14:529));
         wfrtn__ = AfToPage_(QPGMNAM__);
         outweb_(%subst(%str(%addr(H__7(11))):63:119));
         AfToPage_(%trim(%editc(RRN:'X')));
         outweb_(%subst(%str(%addr(H__7(13))):22:56));
         wfrtn__ = AfToPage_(SAVEDRRN);
         outweb_(%subst(%str(%addr(H__7(13))):78:49));
         wfrtn__ = AfToPage_(PDNO);
         outweb_(%subst(%str(%addr(H__7(14))):47:315));
         wfrtn__ = AfToPage_(PDNO);
         outweb_(%subst(%str(%addr(H__7(18))):42:598));
         wrtstaffbox0();
         outweb_(%subst(%str(%addr(H__7(25))):80:196));
         wfrtn__ = AfToPage_(PDUID);
         outweb_(%subst(%str(%addr(H__7(28))):36:247));
         wfrtn__ = AfToPage_(PDUPASS);
         outweb_(%subst(%str(%addr(H__7(31))):43:173));
         wrtofficebox0();
         outweb_(%subst(%str(%addr(H__7(33))):56:52));
         wrt_cust_opts0();
         outweb_(%subst(%str(%addr(H__7(34))):28:189));
         wfrtn__ = AfToPage_(PDUNAME);
         outweb_(%subst(%str(%addr(H__7(36))):57:246));
         wfrtn__ = AfToPage_(PDUTITLE);
         outweb_(%subst(%str(%addr(H__7(39))):63:248));
         wfrtn__ = AfToPage_(PDUEMAIL);
         outweb_(%subst(%str(%addr(H__7(42))):71:247));
         wfrtn__ = AfToPage_(PDUPHONE);
         outweb_(%subst(%str(%addr(H__7(45))):78:183));
         prtchkbox0();
         outweb_(%subst(%str(%addr(H__7(48))):21:159));
         reprtchkbox0();
         outweb_(%subst(%str(%addr(H__7(50))):20:161));
         updchknobox0();
         outweb_(%subst(%str(%addr(H__7(52))):21:159));
         reasnrepbox0();
         outweb_(%subst(%str(%addr(H__7(54))):20:156));
         delappbox0();
         outweb_(%subst(%str(%addr(H__7(56))):16:159));
         undelappbox0();
         outweb_(%subst(%str(%addr(H__7(58))):15:159));
         signdocsbox0();
         outweb_(%subst(%str(%addr(H__7(60))):14:162));
         viewallbox0();
         outweb_(%subst(%str(%addr(H__7(62))):16:135));
         ipaddrbox0();
         outweb_(%subst(%str(%addr(H__7(63))):71:214));
         AfToPage_(%trim(%editc(RRN:'X')));
         outweb_(%subst(%str(%addr(H__7(66))):45:2948));
         return ;
        endif;
        if (client = '104');
         pdkdsec = getparm3_('pdkdsec':'*OPT');
         pdno = getparm3_('PDNO':'*OPT');
         pduopt = 'KDSECURITY1';
         AM004_ = CV_BYKEY;
         CHAIN(E) DL004_ RKWPDUOPT;
         RS004_ = RcdSts2_('GETRCD': %error: %found: %eof);
         pduyesno = pdkdsec;
         if (RS004_ = '1');
          RS004_ = UpdateRcd_('RKWPDUOPT');
         else;
          WRITE RKWPDUOPT;
          RS004_ = RcdSts2_('WRTRCD': %error: %found: %eof);
         endif;
        endif;
        if (((client = '108') or (client = '908')));
         pdkdsec = getparm3_('pdkdsec':'*OPT');
         pdno = getparm3_('PDNO':'*OPT');
         pduopt = 'DEALER-SECURITY';
         AM004_ = CV_BYKEY;
         CHAIN(E) DL004_ RKWPDUOPT;
         RS004_ = RcdSts2_('GETRCD': %error: %found: %eof);
         pduyesno = pdkdsec;
         if (RS004_ = '1');
          RS004_ = UpdateRcd_('RKWPDUOPT');
         else;
          WRITE RKWPDUOPT;
          RS004_ = RcdSts2_('WRTRCD': %error: %found: %eof);
         endif;
        endif;
        if (client = '116');
         kdmlocs = getparm3_('kdmlocs':'*OPT');
         pdno = getparm3_('pdno':'*OPT');
         pduopt = 'KDMLOCS';
         AM004_ = CV_BYKEY;
         CHAIN(E) DL004_ RKWPDUOPT;
         RS004_ = RcdSts2_('GETRCD': %error: %found: %eof);
         pduyesno = kdmlocs;
         if (RS004_ = '1');
          RS004_ = UpdateRcd_('RKWPDUOPT');
         else;
          WRITE RKWPDUOPT;
          RS004_ = RcdSts2_('WRTRCD': %error: %found: %eof);
         endif;
        endif;
        chkipaddr = getparm3_('chkipaddr':'*OPT');
        pduopt = 'CHKIPADDR';
        AM004_ = CV_BYKEY;
        CHAIN(E) DL004_ RKWPDUOPT;
        RS004_ = RcdSts2_('GETRCD': %error: %found: %eof);
        pduyesno = chkipaddr;
        if (RS004_ = '1');
         RS004_ = UpdateRcd_('RKWPDUOPT');
        else;
         WRITE RKWPDUOPT;
         RS004_ = RcdSts2_('WRTRCD': %error: %found: %eof);
        endif;
        viewall = getparm3_('viewall':'*OPT');
        pduopt = 'VIEWALL';
        AM004_ = CV_BYKEY;
        CHAIN(E) DL004_ RKWPDUOPT;
        RS004_ = RcdSts2_('GETRCD': %error: %found: %eof);
        pduyesno = viewall;
        if (RS004_ = '1');
         RS004_ = UpdateRcd_('RKWPDUOPT');
        else;
         WRITE RKWPDUOPT;
         RS004_ = RcdSts2_('WRTRCD': %error: %found: %eof);
        endif;
        pdutype = 'OFFICE';
        AM001_ = CV_BYKEY;
        CHAIN(NE) DL001_ RKWPDUSER;
        RS001_ = RcdSts2_('GETRCD': %error: %found: %eof);
        if (RS001_ = '1');
         errmsg = 'USER ID ALREADY EXISTS';
         outweb_(%subst(%str(%addr(H__7(1))):1:333));
         outweb_(%subst(%str(%addr(H__8(1))):1:2599));
         outweb_(%subst(%str(%addr(H__7(5))):14:529));
         wfrtn__ = AfToPage_(QPGMNAM__);
         outweb_(%subst(%str(%addr(H__7(11))):63:119));
         AfToPage_(%trim(%editc(RRN:'X')));
         outweb_(%subst(%str(%addr(H__7(13))):22:56));
         wfrtn__ = AfToPage_(SAVEDRRN);
         outweb_(%subst(%str(%addr(H__7(13))):78:49));
         wfrtn__ = AfToPage_(PDNO);
         outweb_(%subst(%str(%addr(H__7(14))):47:315));
         wfrtn__ = AfToPage_(PDNO);
         outweb_(%subst(%str(%addr(H__7(18))):42:598));
         wrtstaffbox0();
         outweb_(%subst(%str(%addr(H__7(25))):80:196));
         wfrtn__ = AfToPage_(PDUID);
         outweb_(%subst(%str(%addr(H__7(28))):36:247));
         wfrtn__ = AfToPage_(PDUPASS);
         outweb_(%subst(%str(%addr(H__7(31))):43:173));
         wrtofficebox0();
         outweb_(%subst(%str(%addr(H__7(33))):56:52));
         wrt_cust_opts0();
         outweb_(%subst(%str(%addr(H__7(34))):28:189));
         wfrtn__ = AfToPage_(PDUNAME);
         outweb_(%subst(%str(%addr(H__7(36))):57:246));
         wfrtn__ = AfToPage_(PDUTITLE);
         outweb_(%subst(%str(%addr(H__7(39))):63:248));
         wfrtn__ = AfToPage_(PDUEMAIL);
         outweb_(%subst(%str(%addr(H__7(42))):71:247));
         wfrtn__ = AfToPage_(PDUPHONE);
         outweb_(%subst(%str(%addr(H__7(45))):78:183));
         prtchkbox0();
         outweb_(%subst(%str(%addr(H__7(48))):21:159));
         reprtchkbox0();
         outweb_(%subst(%str(%addr(H__7(50))):20:161));
         updchknobox0();
         outweb_(%subst(%str(%addr(H__7(52))):21:159));
         reasnrepbox0();
         outweb_(%subst(%str(%addr(H__7(54))):20:156));
         delappbox0();
         outweb_(%subst(%str(%addr(H__7(56))):16:159));
         undelappbox0();
         outweb_(%subst(%str(%addr(H__7(58))):15:159));
         signdocsbox0();
         outweb_(%subst(%str(%addr(H__7(60))):14:162));
         viewallbox0();
         outweb_(%subst(%str(%addr(H__7(62))):16:135));
         ipaddrbox0();
         outweb_(%subst(%str(%addr(H__7(63))):71:214));
         AfToPage_(%trim(%editc(RRN:'X')));
         outweb_(%subst(%str(%addr(H__7(66))):45:2948));
         return ;
        else;
         pduid = getparm3_('pduid':'*OPT');
         WRITE RKWPDUSER;
         RS001_ = RcdSts2_('WRTRCD': %error: %found: %eof);
         Redirect2_( '?rrn=' + savedrrn + '&PDNO=' + %trim(pdno):'*SAME':'ran-
       d');
        endif;
       endif;
       if (mode = 'Change');
        rrn = %dec(aton_( getparm3_('rrn':'*MAND'):46:16):9:0);
        RR_001_ = rrn;
        AM001_ = CV_BYRRN;
        CHAIN(E) RR_001_ R__ARR001;
        RS001_ = RcdSts2_('GETRCD': %error: %found: %eof);
        pduid = getparm3_('pduid':'*OPT');
        pduname = getparm3_('pduname':'*OPT');
        pdupass = getparm3_('pdupass':'*OPT');
        pduemail = getparm3_('pduemail':'*OPT');
        PDLOC = %dec(aton_( getparm3_('PDLOC':'*OPT'):46:16):11:0);
        pduphone = getparm3_('pduphone':'*OPT');
        pdutitle = getparm3_('pdutitle':'*OPT');
        aff_staff = getparm3_('aff_staff':'*OPT');
        pdno = getparm3_('PDNO':'*OPT');
        pddtype = 'AFF_STAFF';
        pddcode = pduid;
        AM008_ = CV_BYKEY;
        CHAIN(E) DL008_ RKWPDDATA;
        RS008_ = RcdSts2_('GETRCD': %error: %found: %eof);
        pddchar = aff_staff;
        if (RS008_ = '1');
         RS008_ = UpdateRcd_('RKWPDDATA');
        else;
         WRITE RKWPDDATA;
         RS008_ = RcdSts2_('WRTRCD': %error: %found: %eof);
        endif;
        RS001_ = UpdateRcd_('RKWPDUSER');
        prtchk = getparm3_('prtchk':'*OPT');
        reprtchk = getparm3_('reprtchk':'*OPT');
        updchkno = getparm3_('updchkno':'*OPT');
        pduopt = 'PRINTCHECKS';
        AM004_ = CV_BYKEY;
        CHAIN(E) DL004_ RKWPDUOPT;
        RS004_ = RcdSts2_('GETRCD': %error: %found: %eof);
        pduyesno = prtchk;
        if (RS004_ = '1');
         RS004_ = UpdateRcd_('RKWPDUOPT');
        else;
         WRITE RKWPDUOPT;
         RS004_ = RcdSts2_('WRTRCD': %error: %found: %eof);
        endif;
        pduopt = 'REPRINTCHKS';
        AM004_ = CV_BYKEY;
        CHAIN(E) DL004_ RKWPDUOPT;
        RS004_ = RcdSts2_('GETRCD': %error: %found: %eof);
        pduyesno = reprtchk;
        if (RS004_ = '1');
         RS004_ = UpdateRcd_('RKWPDUOPT');
        else;
         WRITE RKWPDUOPT;
         RS004_ = RcdSts2_('WRTRCD': %error: %found: %eof);
        endif;
        pduopt = 'UPDATECHKNOS';
        AM004_ = CV_BYKEY;
        CHAIN(E) DL004_ RKWPDUOPT;
        RS004_ = RcdSts2_('GETRCD': %error: %found: %eof);
        pduyesno = updchkno;
        if (RS004_ = '1');
         RS004_ = UpdateRcd_('RKWPDUOPT');
        else;
         WRITE RKWPDUOPT;
         RS004_ = RcdSts2_('WRTRCD': %error: %found: %eof);
        endif;
        if (client = '104');
         pdkdsec = getparm3_('pdkdsec':'*OPT');
         pdno = getparm3_('PDNO':'*OPT');
         pduopt = 'KDSECURITY1';
         AM004_ = CV_BYKEY;
         CHAIN(E) DL004_ RKWPDUOPT;
         RS004_ = RcdSts2_('GETRCD': %error: %found: %eof);
         pduyesno = pdkdsec;
         if (RS004_ = '1');
          RS004_ = UpdateRcd_('RKWPDUOPT');
         else;
          WRITE RKWPDUOPT;
          RS004_ = RcdSts2_('WRTRCD': %error: %found: %eof);
         endif;
        endif;
        if (((client = '108') or (client = '908')));
         reasnrep = getparm3_('reasnrep':'*OPT');
         pduopt = 'REASNREP';
         AM004_ = CV_BYKEY;
         CHAIN(E) DL004_ RKWPDUOPT;
         RS004_ = RcdSts2_('GETRCD': %error: %found: %eof);
         pduyesno = reasnrep;
         if (RS004_ = '1');
          RS004_ = UpdateRcd_('RKWPDUOPT');
         else;
          WRITE RKWPDUOPT;
          RS004_ = RcdSts2_('WRTRCD': %error: %found: %eof);
         endif;
         signdocs = getparm3_('signdocs':'*OPT');
         pduopt = 'SIGNDOCS';
         AM004_ = CV_BYKEY;
         CHAIN(E) DL004_ RKWPDUOPT;
         RS004_ = RcdSts2_('GETRCD': %error: %found: %eof);
         pduyesno = signdocs;
         if (RS004_ = '1');
          RS004_ = UpdateRcd_('RKWPDUOPT');
         else;
          WRITE RKWPDUOPT;
          RS004_ = RcdSts2_('WRTRCD': %error: %found: %eof);
         endif;
         viewall = getparm3_('viewall':'*OPT');
         pduopt = 'VIEWALL';
         AM004_ = CV_BYKEY;
         CHAIN(E) DL004_ RKWPDUOPT;
         RS004_ = RcdSts2_('GETRCD': %error: %found: %eof);
         pduyesno = viewall;
         if (RS004_ = '1');
          RS004_ = UpdateRcd_('RKWPDUOPT');
         else;
          WRITE RKWPDUOPT;
          RS004_ = RcdSts2_('WRTRCD': %error: %found: %eof);
         endif;
         delapp = getparm3_('delapp':'*OPT');
         pduopt = 'DELAPP';
         AM004_ = CV_BYKEY;
         CHAIN(E) DL004_ RKWPDUOPT;
         RS004_ = RcdSts2_('GETRCD': %error: %found: %eof);
         pduyesno = delapp;
         if (RS004_ = '1');
          RS004_ = UpdateRcd_('RKWPDUOPT');
         else;
          WRITE RKWPDUOPT;
          RS004_ = RcdSts2_('WRTRCD': %error: %found: %eof);
         endif;
         undelapp = getparm3_('undelapp':'*OPT');
         pduopt = 'UNDELAPP';
         AM004_ = CV_BYKEY;
         CHAIN(E) DL004_ RKWPDUOPT;
         RS004_ = RcdSts2_('GETRCD': %error: %found: %eof);
         pduyesno = undelapp;
         if (RS004_ = '1');
          RS004_ = UpdateRcd_('RKWPDUOPT');
         else;
          WRITE RKWPDUOPT;
          RS004_ = RcdSts2_('WRTRCD': %error: %found: %eof);
         endif;
         pdkdsec = getparm3_('pdkdsec':'*OPT');
         pdno = getparm3_('PDNO':'*OPT');
         pduopt = 'DEALER-SECURITY';
         AM004_ = CV_BYKEY;
         CHAIN(E) DL004_ RKWPDUOPT;
         RS004_ = RcdSts2_('GETRCD': %error: %found: %eof);
         pduyesno = pdkdsec;
         if (RS004_ = '1');
          RS004_ = UpdateRcd_('RKWPDUOPT');
         else;
          WRITE RKWPDUOPT;
          RS004_ = RcdSts2_('WRTRCD': %error: %found: %eof);
         endif;
         if ( %trim(pdkdsec) = '3');
      /end-free
     C/Exec SQL
     C+  select cast(pddcode as integer) into :dlrcust from kwpddata where pddty
     C+ pe = 'CUSTOMER' and pdno = :pdno
     C/End-Exec
      /free
      /end-free
     C/Exec SQL
     C+  update kwcname set cdba = :pduid where ccust = :dlrcust
     C/End-Exec
      /free
         endif;
        endif;
        if (client = '116');
         kdmlocs = getparm3_('kdmlocs':'*OPT');
         pdno = getparm3_('pdno':'*OPT');
         pduopt = 'KDMLOCS';
         AM004_ = CV_BYKEY;
         CHAIN(E) DL004_ RKWPDUOPT;
         RS004_ = RcdSts2_('GETRCD': %error: %found: %eof);
         pduyesno = kdmlocs;
         if (RS004_ = '1');
          RS004_ = UpdateRcd_('RKWPDUOPT');
         else;
          WRITE RKWPDUOPT;
          RS004_ = RcdSts2_('WRTRCD': %error: %found: %eof);
         endif;
        endif;
        chkipaddr = getparm3_('chkipaddr':'*OPT');
        pduopt = 'CHKIPADDR';
        AM004_ = CV_BYKEY;
        CHAIN(E) DL004_ RKWPDUOPT;
        RS004_ = RcdSts2_('GETRCD': %error: %found: %eof);
        pduyesno = chkipaddr;
        if (RS004_ = '1');
         RS004_ = UpdateRcd_('RKWPDUOPT');
        else;
         WRITE RKWPDUOPT;
         RS004_ = RcdSts2_('WRTRCD': %error: %found: %eof);
        endif;
        Redirect2_( '?rrn=' + savedrrn + '&PDNO=' + %trim(pdno):'*SAME':'rand');
       endif;
      /end-free
     c     *PSSR         begsr
     c                   endsr
     P                 E


     P*---------------------------------------------------------------------
     P* wrtstaffbox0...             - User defined function
     P*---------------------------------------------------------------------
     P wrtstaffbox0...
     P                 B
     D wrtstaffbox0...
     D                 PI




      /free
       pddtype = 'AFF_STAFF';
       pddcode = pduid;
       OutWeb_('<select name="AFF_STAFF" id="AFF_STAFF">');
       OutWeb_(%trimr( '<option value="' + '"  >' + '   ' + '</option>'));
       AM008_ = CV_BYKEY;
       CHAIN(NE) DL008_ RKWPDDATA;
       RS008_ = RcdSts2_('GETRCD': %error: %found: %eof);
       if (RS008_ = '1');
        if (pddchar = 'Y');
         OutWeb_('<option value="N">No</option>');
         OutWeb_('<option value="Y" selected>Yes</option>');
        else;
         OutWeb_('<option value="N" selected>No</option>');
         OutWeb_('<option value="Y">Yes</option>');
        endif;
       else;
        OutWeb_('<option value="N">No</option>');
        OutWeb_('<option value="Y">Yes</option>');
       endif;
       OutWeb_('</select>');
      /end-free
     c     *PSSR         begsr
     c                   endsr
     P                 E


     P*---------------------------------------------------------------------
     P* wrtofficebox0...            - User defined function
     P*---------------------------------------------------------------------
     P wrtofficebox0...
     P                 B
     D wrtofficebox0...
     D                 PI




      /free
       OFFICE = PDLOC;
       pdno = getparm3_('pdno':'*OPT');
       OutWeb_('<select name="PDLOC" id="PDLOC" onblur="valOffice(''officeErr-
       '');">');
       OutWeb_(%trimr( '<option value="' + '"  >' + '   ' + '</option>'));
       SETLL  DL002_ RKWPDLOC;
       RS002_ = RcdSts2_('POSRCD':%error:%equal:%eof);
       READE(NE) DL002_ RKWPDLOC;
       RS002_ = RcdSts2_('GETNXTRCD':%error:%found:%eof);
       AM002_ = CV_ByKey;
       dow (RS002_ = '1');
       if (PDLOC <> 0);
        if (OFFICE = PDLOC);
         OutWeb_(%trimr( '<option value="' + %trim(%editc(PDLOC:'P')) + '" se-
       lected >'));
         OutWeb_(%trimr( %trim(%editc(PDLOC:'P')) + '-' + %trim(pdcity) + ','
        + %trim(pdst)));
         OutWeb_('</option>');
        else;
         OutWeb_(%trimr( '<option value="' + %trim(%editc(PDLOC:'P')) + '">'));
         OutWeb_(%trimr( %trim(%editc(PDLOC:'P')) + '-' + %trim(pdcity) + ','
        + %trim(pdst)));
         OutWeb_('</option>');
        endif;
       endif;
       READE(NE) DL002_ RKWPDLOC;
       RS002_ = RcdSts2_('GETNXTRCD':%error:%found:%eof);
       AM002_ = CV_ByKey;
       enddo;
       OutWeb_('</select>');
       PDLOC = OFFICE;
      /end-free
     c     *PSSR         begsr
     c                   endsr
     P                 E


     P*---------------------------------------------------------------------
     P* prtchkbox0...               - User defined function
     P*---------------------------------------------------------------------
     P prtchkbox0...
     P                 B
     D prtchkbox0...
     D                 PI




      /free
       boxtype = 'SYSTEM';
       p_ztype = 'YESNO';
       boxname = 'PRTCHK';
       boxid = 'PRTCHK';
       boxselect = prtchk;
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
     P* reprtchkbox0...             - User defined function
     P*---------------------------------------------------------------------
     P reprtchkbox0...
     P                 B
     D reprtchkbox0...
     D                 PI




      /free
       boxtype = 'SYSTEM';
       p_ztype = 'YESNO';
       boxname = 'REPRTCHK';
       boxid = 'REPRTCHK';
       boxselect = reprtchk;
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
     P* reasnrepbox0...             - User defined function
     P*---------------------------------------------------------------------
     P reasnrepbox0...
     P                 B
     D reasnrepbox0...
     D                 PI




      /free
       boxtype = 'SYSTEM';
       p_ztype = 'YESNO';
       boxname = 'REASNREP';
       boxid = 'REASNREP';
       boxselect = reasnrep;
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
     P* signdocsbox0...             - User defined function
     P*---------------------------------------------------------------------
     P signdocsbox0...
     P                 B
     D signdocsbox0...
     D                 PI




      /free
       boxtype = 'SYSTEM';
       p_ztype = 'YESNO';
       boxname = 'SIGNDOCS';
       boxid = 'SIGNDOCS';
       boxselect = signdocs;
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
     P* viewallbox0...              - User defined function
     P*---------------------------------------------------------------------
     P viewallbox0...
     P                 B
     D viewallbox0...
     D                 PI




      /free
       boxtype = 'SYSTEM';
       p_ztype = 'YESNO';
       boxname = 'VIEWALL';
       boxid = 'VIEWALL';
       boxselect = viewall;
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
     P* delappbox0...               - User defined function
     P*---------------------------------------------------------------------
     P delappbox0...
     P                 B
     D delappbox0...
     D                 PI




      /free
       boxtype = 'SYSTEM';
       p_ztype = 'YESNO';
       boxname = 'DELAPP';
       boxid = 'DELAPP';
       boxselect = delapp;
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
     P* undelappbox0...             - User defined function
     P*---------------------------------------------------------------------
     P undelappbox0...
     P                 B
     D undelappbox0...
     D                 PI




      /free
       boxtype = 'SYSTEM';
       p_ztype = 'YESNO';
       boxname = 'UNDELAPP';
       boxid = 'UNDELAPP';
       boxselect = undelapp;
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
     P* updchknobox0...             - User defined function
     P*---------------------------------------------------------------------
     P updchknobox0...
     P                 B
     D updchknobox0...
     D                 PI




      /free
       boxtype = 'SYSTEM';
       p_ztype = 'YESNO';
       boxname = 'UPDCHKNO';
       boxid = 'UPDCHKNO';
       boxselect = updchkno;
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
     P* wrt_cust_opts0...           - User defined function
     P*---------------------------------------------------------------------
     P wrt_cust_opts0...
     P                 B
     D wrt_cust_opts0...
     D                 PI




      /free
       select;
       when (client = '104');
       pduopt = 'KDSECURITY1';
       pduid = pduid;
       AM004_ = CV_BYKEY;
       CHAIN(NE) DL004_ RKWPDUOPT;
       RS004_ = RcdSts2_('GETRCD': %error: %found: %eof);
       select;
       when (pduyesno = 'Y');
       current_sec = 'Limited';
       other;
       current_sec = 'Not Limited';
       endsl;
       OutWeb_('<tr><td class="left">Security Level:</td><td class="right"><s-
       elect name="PDKDSEC" id="PDKDSEC">');
       OutWeb_('<option value="">select one...</option>');
       if (pduyesno = 'Y');
        OutWeb_('<option selected value="Y">Limited</option>');
       else;
        OutWeb_('<option value="Y">Limited</option>');
       endif;
       if (pduyesno = 'N');
        OutWeb_('<option selected value="N">Not Limited</option>');
       else;
        OutWeb_('<option value="N">Not Limited</option>');
       endif;
       OutWeb_(%trimr( '</select><br>Current Security Level: ' + %trim(
       current_sec) + '</td></tr>'));
       when (client = '107' or client = '907');
       pruletype = 'DEALER-SECURITY';
       prulename = pduid;
       AM006_ = CV_BYKEY;
       CHAIN(NE) DL006_ RKWPRULE;
       RS006_ = RcdSts2_('GETRCD': %error: %found: %eof);
       pduopt = 'DEALER-SECURITY';
       AM004_ = CV_BYKEY;
       CHAIN(NE) DL004_ RKWPDUOPT;
       RS004_ = RcdSts2_('GETRCD': %error: %found: %eof);
       select;
       when (pduyesno = '1');
       current_sec = 'Level 1 (application generator)';
       when (pduyesno = '2');
       current_sec = 'Level 2 (heart of the dealer)';
       when (pduyesno = '3');
       current_sec = 'Level 3 (golden pen)';
       other;
       current_sec = 'No security level set';
       endsl;
       OutWeb_('<tr><td class="left">Security Level:</td><td class="right"><s-
       elect name="PDKDSEC" id="PDKDSEC">');
       OutWeb_('<option value="">select one...</option>');
       if (pduyesno = '1');
        OutWeb_('<option selected value="1">Level 1 (application generator)</-
       option>');
       else;
        OutWeb_('<option value="1">Level 1 (application generator)</option>');
       endif;
       if (pduyesno = '2');
        OutWeb_('<option selected value="2">Level 2 (heart of the dealer)</op-
       tion>');
       else;
        OutWeb_('<option value="2">Level 2 (heart of the dealer)</option>');
       endif;
       if (pduyesno = '3');
        OutWeb_('<option selected value="3">Level 3 (golden pen)</option>');
       else;
        OutWeb_('<option value="3">Level 3 (golden pen)</option>');
       endif;
       OutWeb_(%trimr( '</select><br>Current Security Level: ' + %trim(
       current_sec) + '</td></tr>'));
       when (client = '116');
       pduopt = 'KDMLOCS';
       pduid = pduid;
       AM004_ = CV_BYKEY;
       CHAIN(NE) DL004_ RKWPDUOPT;
       RS004_ = RcdSts2_('GETRCD': %error: %found: %eof);
       OutWeb_('<tr><td class="left">Multiple Offices?:</td><td class="right"-
       ><select name="KDMLOCS" id="KDMLOCS">');
       OutWeb_('<option value="">select one...</option>');
       if (pduyesno = 'Y');
        OutWeb_('<option selected value="Y">Yes</option>');
       else;
        OutWeb_('<option value="Y">Yes</option>');
       endif;
       if (pduyesno = 'N');
        OutWeb_('<option selected value="N">No</option>');
       else;
        OutWeb_('<option value="N">No</option>');
       endif;
       OutWeb_('</select></td></tr>');
       other;
       endsl;
      /end-free
     c     *PSSR         begsr
     c                   endsr
     P                 E


     P*---------------------------------------------------------------------
     P* ipaddrbox0...               - User defined function
     P*---------------------------------------------------------------------
     P ipaddrbox0...
     P                 B
     D ipaddrbox0...
     D                 PI




      /free
       boxtype = 'SYSTEM';
       p_ztype = 'YESNO';
       boxname = 'CHKIPADDR';
       boxid = 'CHKIPADDR';
       boxselect = chkipaddr;
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
       if   ((file__='KWPDUSER' or file__='*ALL') and NOT %OPEN(KWPDUSER));
        if (mbr__ <> '*FIRST');
         ovrdbf_(ovrflag__:'KWPDUSER':'KWPDUSER' : '*LIBL' : mbr__);
        elseif ('KWPDUSER' <> 'KWPDUSER');
         ovrdbf_(ovrflag__:'KWPDUSER':'KWPDUSER' : '*LIBL');
        endif;
        if    erropen__ = 'Y';
         OPEN(E) KWPDUSER;             //    KWPDUSER
         if        %error;
          return %error;
         endif;
        else;
         OPEN KWPDUSER;                //    KWPDUSER
        endif;
       endif;
       if   (file__='KWPDUSER' or file__='*ALL')  and NOT %OPEN(F__ARR001);
        ovrdbf_(ovrflag__:'F__ARR001':'KWPDUSER' : '*LIBL' : mbr__);
        if   erropen__ = 'Y';
         OPEN(E) F__ARR001;          //   KWPDUSER
         if        %error;
          return %error;
         endif;
        else;
         OPEN F__ARR001;            //    KWPDUSER
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
       if   ((file__='KWPDUOPT' or file__='*ALL') and NOT %OPEN(KWPDUOPT));
        if (mbr__ <> '*FIRST');
         ovrdbf_(ovrflag__:'KWPDUOPT':'KWPDUOPT' : '*LIBL' : mbr__);
        elseif ('KWPDUOPT' <> 'KWPDUOPT');
         ovrdbf_(ovrflag__:'KWPDUOPT':'KWPDUOPT' : '*LIBL');
        endif;
        if    erropen__ = 'Y';
         OPEN(E) KWPDUOPT;                //    KWPDUOPT
         if        %error;
          return %error;
         endif;
        else;
         OPEN KWPDUOPT;                //    KWPDUOPT
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
       when      rcdfmt__='RKWPDUSER' and AM001_ = CV_ByKey and RS001_ = *ON ;
       update RKWPDUSER;
       when      rcdfmt__='RKWPDUSER' and AM001_ = CV_ByRrn and RS001_ = *ON ;
       update R__ARR001;
       when      rcdfmt__='RKWPDUOPT' and AM004_ = CV_ByKey and RS004_ = *ON ;
       update RKWPDUOPT;
       when      rcdfmt__='RKWPDDATA' and AM008_ = CV_ByKey and RS008_ = *ON ;
       update RKWPDDATA;
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
       when      rcdfmt__='RKWPDUSER' and AM001_ = CV_ByKey and RS001_ = *ON ;
       delete RKWPDUSER;
       when      rcdfmt__='RKWPDUSER' and AM001_ = CV_ByRrn and RS001_ = *ON ;
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
System Settings:  Users
**CTDATA H__1        ListHeader                       3251
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.or
g/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>
    <meta name="genera
tor" content="WebSmart" />
    <meta http-equiv="Pragma" content="no-cache" />

   <title>System Settings:  Dealer Users</title>
    <link rel="stylesheet" type
="text/css" href="/websmart/kwikloan/styles/klstylei.css" media="screen, tv, pro
jection" />
    <link rel="stylesheet" type="text/css" href="/websmart/kwikloan/
styles/klstyleInquiry3.css" media="screen, tv, projection" />
    <link rel="sty
lesheet" type="text/css" href="/websmart/kwikloan/styles/notifications.css" medi
a="screen, tv, projection" />
    <link rel="stylesheet" type="text/css" href="/
k_loan/s/tablesorter.css" media="screen, tv, projection" />
    <style type="tex
t/css">
    #sections {
    border: 1px solid #9A9AA4;
    height: 548px;
    ma
rgin-left: 10px;
    overflow-x: hidden;
    position: relative;
    width: 679p
x;
    }
    </style>
  </head>
  <body>
    <form action="" method="get">

 <input type="hidden" name="TASK" value="POST">
      <div id="wrapping">

  <div id="everything">
          <div id="pagetitle">
            <span>System
Settings:  Dealer Users &nbsp;&nbsp;-- </span>
            <span>: </span>

     </div>
          <div id="whitebg" class="whitebg">
            <!-- modal
window boxes -->
            <div id="modalOverlay" style="display: none;"></div
>
            <div id="modalContainer" style="display: none;">
              <di
v id="modalContent">
                <div class="modalHeader"><h3 id="headerText
"></h3><a id="modalCloseA" class="modalCloseA" onclick="hideStuff2();"><div id="
modalCloseImg" class="modalCloseImg"></div></a></div>
                <div id="m
odalFrameDiv"></div>
              </div>
            </div>
            <!-- en
d modal window boxes -->
            
            <div class="left">

   
              <table class="actionsTable">

                <tr><td><a href=
"?task=beginmanage&rrn=0&rnd=&PDNO="><img src="/websmart/kwikloan/images/loanInq
ADD.png"></a><span class="LSlabel"></span></td></tr>
              </table>

        </div><!--left-->
            
            <div class="right">

     
              <div id="msg1" class="msg" style="display: none;">

       <div id="msgSym1" class="msgSym">
                  <table class="msgSymb
ol">
                    <tr><td>&#33;</td></tr>
                  </table>

            </div>
                <div class="msgWrapper">
                  <t
able class="msgTable">
                    <tr><td id="msg1" class="msgTxt">This
 application has successfully been converted to an <span class="bold">OPEN LOAN<
/span>.</td></tr>
                  </table>
                </div>

  </div><!-- msg1 -->
              
             
              <div id="sectio
ns">
                
                
                
                

         <table id="mainTable" class="tablesorter">
                <thead>

              <tr>
                <th>Action</th>
                <th>User ID</
th>
                <th>User Name</th>
                <th>Office</th>

     </tr>
              </thead><tbody>
**CTDATA H__2        ListDetails                      384
<tr class="">
  <td>
    <a href="?TASK=beginmanage&rrn=&FirstRowRRN=&PDNO="><im
g src="/websmart/v7.2/Lincoln/images/edit.gif"  alt="Edit" title="Edit"></a>

 <a href="?TASK=delconf&rrn=&FirstRowRRN=&PDNO="><img src="/websmart/v7.2/Lincol
n/images/delete.gif" alt="Delete" title="Delete"></a>
  </td> 
  <td class="text
"></td>
  <td class="text"></td>
  <td class="text"></td>
</tr>

**CTDATA H__3        ListFooter                       984
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



**CTDATA H__4        RcdDisplay                       2420
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.or
g/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>
    <meta name="genera
tor" content="WebSmart" />
    <meta http-equiv="Pragma" content="no-cache" />

   <title>System Settings:  Users - Display</title>
<link rel="stylesheet" type=
"text/css" href="/websmart/kwikloan/styles/klDFtheme.css" media="screen, tv, pro
jection" title="default"/>
    <link rel="alternate stylesheet" type="text/css"
href="/websmart/kwikloan/styles/klBStheme.css" media="screen, tv, projection" ti
tle="bluesky"/>
    <link rel="alternate stylesheet" type="text/css" href="/webs
mart/kwikloan/styles/klRDtheme.css" media="screen, tv, projection" title="reddev
il"/>
    <link rel="alternate stylesheet" type="text/css" href="/websmart/kwikl
oan/styles/klOCtheme.css" media="screen, tv, projection" title="orangecrush"/>

       <link rel="stylesheet" type="text/css" href="/websmart/kwikloan/styles/kl
stylei.css" media="screen, tv, projection" />
    <script type="text/javascript"
 src="/websmart/kwikloan/javascript/klscripts.js"></script>
        <!-- removed
 klthemes.js reference -->
    <script type="text/javascript" src="/websmart/v7.
2/javascript/esdiapi010.js"></script>
    
  </head>
  <body>
  <div id="wrappin
g">
  <div id="everything">
  
  
  <div id="pagetitle">
  	<span>System Setting
s:  Users</span>
  </div>
  
  <div id="whitebg">
  <div id="EDITtitle"><span>Vi
ew User Settings</span></div>
    <div id="EDITcontents"> 
      <div id="navtop
">
        
        
      </div>
       <form action="" method="get">

   
            <input type="hidden" id="PDNO" name="PDNO" value="">
      <tabl
e>
        
        <tr>
          <td class="left">User ID:</td>
          <td
class="right"></td>
        </tr>
        
          
        <tr>
          <td
 class="left">User Name:</td>
          <td class="right"></td>
        </tr>

      <tr>
          <td class="left">User Title:</td>
          <td class="righ
t"></td>
        </tr>
        <tr>
          <td class="left">Office:</td>

      <td class="right"></td>
        </tr>
        <tr>
          <td class="le
ft">Email Address:</td>
          <td class="right"></td>
        </tr>

<tr>
        <tr>
          <td class="left">Password:</td>
          <td class=
"right"></td>
        </tr>
         
      </table>
        </form>
    </div>

  </body>
</html>



**CTDATA H__5        DelChoice                        2579

  
  
   <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http:/
/www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
  <html>
    <head>
      <m
eta name="generator" content="WebSmart" />
      <meta http-equiv="Pragma" conte
nt="no-cache" />
      <title>System Settings:  Dealers - Add or Change</title>

      <link rel="stylesheet" type="text/css" href="/websmart/kwikloan/styles/klD
Ftheme.css" media="screen, tv, projection" title="default"/>
      <link rel="st
ylesheet" type="text/css" href="/websmart/kwikloan/styles/klstylei.css" media="s
creen, tv, projection" />
      <script type="text/javascript" src="/websmart/kw
ikloan/javascript/klscripts.js"></script>
          <!-- removed klthemes.js ref
erence -->
      <script type="text/javascript" src="/websmart/v7.2/javascript/e
sdiapi010.js"></script>
          <script type="text/javascript" src="/websmart/
v8.8/javascript/jquery.min.js"></script>

      <script type="text/javascript">

		xl_AttachEvent(window, "load", WindowInit); 

		function WindowInit()
		{
			x
l_FocusFirstElement();
		}
	</script>
    </head>
    <body>
      <div id="wrap
ping">
        <div id="everything">
          
          
          <div id="pa
getitle">
            <span>System Settings:  Dealer Offices</span>
          </
div
          
          <div id="whitebg">
            <div id="EDITtitle"><spa
n>Edit Dealer</span></div>
            <div id="EDITcontents"> 
             <fo
rm action="" method="get">
            <input type="hidden" name="task" value="e
ndmanage">
            <input type="hidden" name="rrn" value="">
            <in
put type="hidden" name="FirstRowRRN" value="">
                

<table>
               <tr>
                <td class="left">User ID:</td>

           <td class="right"></td>
              </tr>
              <tr>

          <td class="left">Email:</td>
                <td class="right"></td>

             </tr>
              <tr>
                <td class="left">User Name
:</td>
                <td class="right"></td>
              </tr>  

    <tr>
                <td COLSPAN="2">Are you SURE you want to delete this re
cord?</td>
              </tr>
              <tr>
                <td>

         <a href="?task=del&rrn=&FirstRowRRN=">Yes</a>
                  &nbsp;&
nbsp;
                  <a href="javascript:location.href='?rrn='">No</a>

          </td>
              </tr>
                </table>		
              </f
orm>
            </div><!--editcontents-->
          </div></div></div>
    </bo
dy>
  </html>
  

**CTDATA H__6        RtnToList                        97
<input type="button" class="navbutton" value="Back" onclick="javascript:location
.href='?PDNO='"/>
**CTDATA H__7        RcdManage                        8192

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.o
rg/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>
    <meta name="gener
ator" content="WebSmart" />
    <meta http-equiv="Pragma" content="no-cache" />

    <title>System Settings:  Dealers - Add or Change</title>
    <style type="te
xt/css">
    
    </style>
    <script type="text/javascript" src="/websmart/kwi
kloan/javascript/klscripts.js"></script>
    <!-- removed klthemes.js reference
-->
    <script type="text/javascript" src="/websmart/v7.2/javascript/esdiapi010
.js"></script>
    <script type="text/javascript" src="/websmart/v8.8/javascript
/jquery.min.js"></script>
    
    <script type="text/javascript">
		xl_AttachEv
ent(window, "load", WindowInit); 

		function WindowInit()
		{
			xl_FocusFirstE
lement();
		}
	</script>
  </head>
  <body>
    <form action="" method="get">

    <input type="hidden" name="task" value="endmanage">
      <input type="hidde
n" name="rrn" value="">
      <input type="hidden" name="FirstRowRRN" value="">

      <input type="hidden" name="PDNO" value="">
      
      
      <div id="pa
getitle">
        <span>System Settings:  Dealer Users</span>
        <div id="t
opBtns">
          <input type="submit" class="navbutton" id="mode" name="mode"
value="Update">
          <input type="button" class="navbutton" value="Cancel"
onclick="javascript:location.href='?PDNO='"/>
        </div>
      </div>

<div id="wrapping">
        
        
        
        
        
        <div id
="whitebg">
          
          <div id="EDITcontents"> 
            

   
            <table id="holderTable">
              
              

     <tr>
                <th>Edit Dealer</th>
              </tr>

 <tr>
                <td class="holderTd">
                  <table class="deal
erTable" style="width: 500px">
                    <tr>
                      <t
d class="left">AFF Staff Account:</td>
                      <td class="right"><
/td>
                    </tr>
                    <tr>
                      <t
d class="left">Login User ID:</td>
                      <td class="right"><inpu
t type="text" name="PDUID"  value="" style="width: 110px;"></td>

     </tr>
                    <tr>
                      <td class="left">Login
 Password:</td>
                      <td class="right"><input type="text" name=
"PDUPASS" size="40" maxlength="40" value="" style="width: 110px;"></td>

            </tr>
                    <tr>
                      <td class="left
">Office:</td>
                      <td class="right"></td>

 </tr>
                    
                    <tr>
                      <td c
lass="left">User's Name:</td>
                      <td class="right"><input typ
e="text" name="PDUNAME" size="40" maxlength="40" value="" style="width: 110px;">
</td>
                    </tr>
                    <tr>
                      <
td class="left">User's Title:</td>
                      <td class="right"><inpu
t type="text" name="PDUTITLE" size="40" maxlength="40" value="" style="width: 11
0px;"></td>
                    </tr>	
                    <tr>

      <td class="left">Email Address:</td>
                      <td class="righ
t"><input type="text" name="PDUEMAIL" size="50" maxlength="50" value="" style="w
idth: 110px;"></td>
                    </tr>	
                    <tr>

              <td class="left">Phone Number:</td>
                      <td clas
s="right"><input type="text" name="PDUPHONE" size="22" maxlength="22" value=""><
/td>
                    </td>
                    </tr>
                    <tr
>
                      <td class="left">Print Checks:</td>

  <td class="right"></td> 
                    </tr>	
                    <tr>

                     <td class="left">Reprint Checks:</td>

 <td class="right"></td> 
                    </tr>	
                    <tr>

                    <td class="left">Update Check Nos:</td>

  <td class="right"></td> 
                    </tr>	
                    <tr>

                     <td class="left">Re-Assign Reps:</td>

 <td class="right"></td> 
                    </tr>	
                    <tr>

                    <td class="left">Cancel Apps:</td>
                      <td
 class="right"></td> 
                    </tr>	
                    <tr>

                <td class="left">Un-Cancel Apps:</td>
                      <td
class="right"></td> 
                    </tr>	
                    <tr>

               <td class="left">Sign Documents:</td>
                      <td c
lass="right"></td> 
                    </tr>
                    <tr>

             <td class="left">View all locations:</td>
                      <td
 class="right"></td> 
                    </tr>	
                     <tr>
    <
td class="left">Limit acess by IP Address:</td>
    <td class="right"></td> </tr
></tr>	

                  </table>
                </td>
              </tr>

          </table>
            <div id="navbottom">
              <script type="
text/javascript">
	var protkey = "";   
	if( == 0)
	{
		xl_GetFormElementByName(
"mode").value = "Add";
	} 
	else 
	{
		protkey  = xl_GetFormElementByName("PDUID
");
		protkey.readOnly = true;
		protkey.className = protkey.className + " disab
led";
		xl_GetFormElementByName("mode").value = "Change";
	}
	function cancel()

	{
		xl_GetFormElementByName("mode").value = "Cancel";
	}
	function mask(inputSt
ring,textbox,delimiterLocations,delimeter){
//only allow numeric input
	var char
acterTyped = inputString.substring(inputString.length - 1);
	if (characterTyped
!= '0'
		&& characterTyped != '1'
		&& characterTyped != '2'
		&& characterTyped
 != '3'
		&& characterTyped != '4'
		&& characterTyped != '5'
		&& characterType
d != '6'
		&& characterTyped != '7'
		&& characterTyped != '8'
		&& characterTyp
ed != '9'
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
		for (var k = 0; k
 <= inputString.length; k++)
		{
			if (k == locations[i])
			{
				if (inputStr
ing.substring(k, k+1) != delimeter)
				{
					inputString = inputString.substri
ng(0,k) + delimeter + inputString.substring(k,inputString.length);
				}
			}
		
}
	}
	textbox.value = inputString;
}
function numbersOnly(inputString,textbox){

	var characterTyped = inputString.substring(inputString.length - 1);
	if (charac
terTyped != '0'
		&& characterTyped != '1'
		&& characterTyped != '2'
		&& chara
cterTyped != '3'
		&& characterTyped != '4'
		&& characterTyped != '5'
		&& char
acterTyped != '6'
		&& characterTyped != '7'
		&& characterTyped != '8'
		&& cha
racterTyped != '9'
		&& characterTyped != '.'
		&& characterTyped != '/')
	{
		t
extbox.value = inputString.substring(0,inputString.length - 1);
		return;
	}	
}


function numbersOnlyF(inputString,textbox){
  var characterTyped = inputString.
substring(inputString.length - 1);
  if (characterTyped != '0'
    && characterT
yped != '1'
    && characterTyped != '2'
    && characterTyped != '3'
    && cha
racterTyped != '4'
    && characterTyped != '5'
    && characterTyped != '6'

 && characterTyped != '7'
    && characterTyped != '8'
    && characterTyped !=
'9'
    && characterTyped != '.')
  {
    textbox.value = inputString.substring(
0,inputString.length - 1);
    return;
  } 
}

function numbersOnlyStrict(inputS
tring,textbox){
  var characterTyped = inputString.substring(inputString.length
- 1);
  if (characterTyped != '0'
    && characterTyped != '1'
    && characterT
yped != '2'
    && characterTyped != '3'
    && characterTyped != '4'
    && cha
racterTyped != '5'
    && characterTyped != '6'
    && characterTyped != '7'

 && characterTyped != '8'
    && characterTyped != '9')
  {
    textbox.value =
inputString.substring(0,inputString.length - 1);
    return;
  } 
}</script>

         </div>		
            
          </div><!--editcontents-->
        </div
></div></form>
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

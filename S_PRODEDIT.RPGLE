     H/TITLE  System Settings:  Dealers
      * ProGen WebSmart Revision 21178
      * File overrides for compile command
      *__OV OVRDBF KWPDBASE   KWPDBASE
      *__OV OVRDBF KWPDDATA   KWPDDATA
      *__OV OVRDBF KWPDPROD   KWPDPROD
      *__OV OVRDBF KWSMNUOPT  KWSMNUOPT
      *__   Following values are used to create the server program
      *__RO Pgm  lib KWWEB      Pgm  S_PRODEDIT
      *__AG          WEBSMART
      *__CL          *OBJLIBNAM
      *__BD ECRTBND187
      *===============================================================*
      * Path:   s_prodedit.pdw
      * System: HIEU-LAPTOP
      * Project:Kwik-Loan
      * Set:    Development
      * User:   Admin
      * Date Last Generated:   2015-05-15   09:38:37
      * Last Generated CRC: E7998A12 1C645C0E 7DA21683 E4D471BE
      *===============================================================*
      */CPY *LIBL/PW_CSRC CPYRIGHT
      * File specifications
     FKWPDBASE  IF   E           K DISK    USROPN
     F                                     INFDS(FID001_   )
     F                                     RENAME(RKWPDBASE    :RWPDBASE    )
     FKWPDDATA  IF   E           K DISK    USROPN
     F                                     INFDS(FID002_   )
     FKWPDPROD  UF A E           K DISK    USROPN
     F                                     INFDS(FID003_   )
     FKWSMNUOPT IF   E           K DISK    USROPN
     F                                     INFDS(FID004_   )

     D PTL__           S             50    DIM(1) CTDATA PERRCD(1)
     D RTLLA__         S             11    DIM(180)

     D*+FLDDCL Field declarations

     Duserdata         DS                  INZ
     D client                         5A
     D userid                        32A
     D location                       5A

     D lastpgm         S             20A
     D lastpgm2        S             20A
     D mode            S             15A
     D artncod         S              5A
     D counter         S              5P 0

     D RS001_          S              1A
     D AM001_          S              1A
     D RS002_          S              1A
     D AM002_          S              1A
     D RS003_          S              1A
     D AM003_          S              1A
     D RS004_          S              1A
     D AM004_          S              1A


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


     D H__1            S             80    PERRCD(1) CTDATA DIM(12          )

     D H__2            S             80    PERRCD(1) CTDATA DIM(43          )

     D H__3            S             80    PERRCD(1) CTDATA DIM(18          )

     D H__4            S             80    PERRCD(1) CTDATA DIM(24          )

     D H__5            S             80    PERRCD(1) CTDATA DIM(15          )

     D H__6            S             80    PERRCD(1) CTDATA DIM(2           )


     D* File info DS for each file
     D FID001_         DS
     D  RR_001_              397    400B 0
     D FID002_         DS
     D  RR_002_              397    400B 0
     D FID003_         DS
     D  RR_003_              397    400B 0
     D FID004_         DS
     D  RR_004_              397    400B 0


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

     D beginmanage0...
     D                 PR
     D endmanage0...
     D                 PR
     D delconf0...
     D                 PR
     D get_write0...
     D                 PR
     D pdltypebox0...
     D                 PR
     D pdplanbox0...
     D                 PR
     D QPGMNAM__       S             20A
     D SmurfChk__      S              1A   INZ(*ON)
     D Smurf_ID__      S             64A   IMPORT
     D Smurf_Rw__      S              9B 0 IMPORT

     D pgm_lnlist      S                   LIKE(smenupgm      )

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

     C     dealerlink    KLIST
     C                   KFLD                    pdno
     C     DL003_        KLIST
     C                   KFLD                    pdno
     C                   KFLD                    pdpseq
     C     DL004_        KLIST
     C                   KFLD                    smenuclid
     C                   KFLD                    smenu
     C                   KFLD                    smenuopt
     C                   ENDSR


      * Subprocedures follow:
      *--------------------------------------------------------------------------------------------*
      * main__ - Contains the main function source code from the PML
      *--------------------------------------------------------------------------------------------*
     P main__          B
     D main__          PI

      /free
       // PML Start ----------------------------------
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
       SMENUCLID = %dec(aton_(client:46:16):46:16);
       smenu = 'USER';
       smenuopt = 'DLRLIST';
       AM004_ = CV_BYKEY;
       CHAIN(NE) DL004_ RKWSMNUOPT;
       RS004_ = RcdSts2_('GETRCD': %error: %found: %eof);
       if (RS004_ = '1');
        pgm_lnlist = %trim(smenupgm);
       else;
        pgm_lnlist = 's_dlr.pgm';
       endif;
       if (task__ = 'DEFAULT');
        taskran__ = *ON;
        beginmanage0();
       endif ;
       if (task__ = 'BEGINMANAGE');
        taskran__ = *ON;
        beginmanage0();
       endif ;
       if (task__ = 'ENDMANAGE');
        taskran__ = *ON;
        endmanage0();
       endif ;
       if (task__ = 'DELCONF');
        taskran__ = *ON;
        delconf0();
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
     P* beginmanage0...             - User defined function
     P*---------------------------------------------------------------------
     P beginmanage0...
     P                 B
     D beginmanage0...
     D                 PI




      /free
       pdno = getparm3_('pdno':'*OPT');
       outweb_(%subst(%str(%addr(H__4(1))):1:351));
       outweb_(%subst(%str(%addr(H__1(1))):1:941));
       outweb_(%subst(%str(%addr(H__4(5))):32:5));
       outweb_(%subst(%str(%addr(H__2(1))):1:3376));
       outweb_(%subst(%str(%addr(H__4(5))):37:5));
       outweb_(%subst(%str(%addr(H__3(1))):1:1434));
       outweb_(%subst(%str(%addr(H__4(5))):42:84));
       wfrtn__ = AfToPage_(QPGMNAM__);
       outweb_(%subst(%str(%addr(H__4(6))):46:121));
       wfrtn__ = AfToPage_(PDNO);
       outweb_(%subst(%str(%addr(H__4(8))):7:67));
       wfrtn__ = AfToPage_(PDNAME);
       outweb_(%subst(%str(%addr(H__4(8))):74:13));
       wfrtn__ = AfToPage_(PDNO);
       outweb_(%subst(%str(%addr(H__4(9))):7:464));
       wfrtn__ = AfToPage_(PGM_LNLIST);
       outweb_(%subst(%str(%addr(H__4(14))):71:752));
       AM001_ = CV_BYKEY;
       CHAIN(E) dealerlink RWPDBASE;
       RS001_ = RcdSts2_('GETRCD': %error: %found: %eof);
       SETLL  dealerlink RKWPDPROD;
       RS003_ = RcdSts2_('POSRCD':%error:%equal:%eof);
       READE(E) dealerlink RKWPDPROD;
       RS003_ = RcdSts2_('GETNXTRCD':%error:%found:%eof);
       AM003_ = CV_ByKey;
       if (RS003_ <> '1');
        PDPSEQ = 1;
        outweb_(%subst(%str(%addr(H__5(1))):1:10));
        AfToPage_(%trim(%editc(PDPSEQ:'4')));
        outweb_(%subst(%str(%addr(H__5(1))):11:33));
        AfToPage_(%trim(%editc(PDPSEQ:'4')));
        outweb_(%subst(%str(%addr(H__5(1))):44:12));
        AfToPage_(%trim(%editc(PDPSEQ:'4')));
        outweb_(%subst(%str(%addr(H__5(1))):56:41));
        AfToPage_(%trim(%editc(PDPSEQ:'4')));
        outweb_(%subst(%str(%addr(H__5(2))):17:19));
        wfrtn__ = AfToPage_(PDNO);
        outweb_(%subst(%str(%addr(H__5(2))):36:132));
        pdltypebox0();
        outweb_(%subst(%str(%addr(H__5(4))):8:83));
        AfToPage_(%trim(%editc(PDPSEQ:'4')));
        outweb_(%subst(%str(%addr(H__5(5))):11:14));
        AfToPage_(%trim(%editc(PDPSEQ:'4')));
        outweb_(%subst(%str(%addr(H__5(5))):25:9));
        wfrtn__ = AfToPage_(PDPDESC);
        outweb_(%subst(%str(%addr(H__5(5))):34:28));
        pdplanbox0();
        outweb_(%subst(%str(%addr(H__5(5))):62:70));
        AfToPage_(%trim(%editc(PDPSEQ:'4')));
        outweb_(%subst(%str(%addr(H__5(6))):52:15));
        AfToPage_(%trim(%editc(PDPSEQ:'4')));
        outweb_(%subst(%str(%addr(H__5(6))):67:9));
        AfToPage_(%trim(%editc(PDPLAMT:'J')));
        outweb_(%subst(%str(%addr(H__5(6))):76:94));
        AfToPage_(%trim(%editc(PDPSEQ:'4')));
        outweb_(%subst(%str(%addr(H__5(8))):10:14));
        AfToPage_(%trim(%editc(PDPSEQ:'4')));
        outweb_(%subst(%str(%addr(H__5(8))):24:9));
        AfToPage_(%trim(%editc(PPDPHAMT:'J')));
        outweb_(%subst(%str(%addr(H__5(8))):33:83));
        AfToPage_(%trim(%editc(PDPSEQ:'4')));
        outweb_(%subst(%str(%addr(H__5(9))):36:12));
        AfToPage_(%trim(%editc(PDPSEQ:'4')));
        outweb_(%subst(%str(%addr(H__5(9))):48:9));
        AfToPage_(%trim(%editc(PDPLAPR:'3')));
        outweb_(%subst(%str(%addr(H__5(9))):57:106));
        AfToPage_(%trim(%editc(PDPSEQ:'4')));
        outweb_(%subst(%str(%addr(H__5(11))):3:11));
        AfToPage_(%trim(%editc(PDPSEQ:'4')));
        outweb_(%subst(%str(%addr(H__5(11))):14:9));
        AfToPage_(%trim(%editc(PDPHAPR:'3')));
        outweb_(%subst(%str(%addr(H__5(11))):23:84));
        AfToPage_(%trim(%editc(PDPSEQ:'4')));
        outweb_(%subst(%str(%addr(H__5(12))):27:13));
        AfToPage_(%trim(%editc(PDPSEQ:'4')));
        outweb_(%subst(%str(%addr(H__5(12))):40:9));
        AfToPage_(%trim(%editc(PDPLTERM:'3')));
        outweb_(%subst(%str(%addr(H__5(12))):49:108));
        AfToPage_(%trim(%editc(PDPSEQ:'4')));
        outweb_(%subst(%str(%addr(H__5(13))):77:12));
        AfToPage_(%trim(%editc(PDPSEQ:'4')));
        outweb_(%subst(%str(%addr(H__5(14))):9:9));
        AfToPage_(%trim(%editc(PDPHTERM:'3')));
        outweb_(%subst(%str(%addr(H__5(14))):18:44));
        AfToPage_(%trim(%editc(PDPSEQ:'4')));
        outweb_(%subst(%str(%addr(H__5(14))):62:14));
        AfToPage_(%trim(%editc(PDPSEQ:'4')));
        outweb_(%subst(%str(%addr(H__5(14))):76:9));
        AfToPage_(%trim(%editc(PDPSEQ:'4')));
        outweb_(%subst(%str(%addr(H__5(15))):5:9));
       else;
        dow (RS003_ = '1');
        chain(N) DL003_ RKWPDPROD;
        RS003_ = RcdSts2_('GETRCDN':%error: %found: %eof);
        outweb_(%subst(%str(%addr(H__5(1))):1:10));
        AfToPage_(%trim(%editc(PDPSEQ:'4')));
        outweb_(%subst(%str(%addr(H__5(1))):11:33));
        AfToPage_(%trim(%editc(PDPSEQ:'4')));
        outweb_(%subst(%str(%addr(H__5(1))):44:12));
        AfToPage_(%trim(%editc(PDPSEQ:'4')));
        outweb_(%subst(%str(%addr(H__5(1))):56:41));
        AfToPage_(%trim(%editc(PDPSEQ:'4')));
        outweb_(%subst(%str(%addr(H__5(2))):17:19));
        wfrtn__ = AfToPage_(PDNO);
        outweb_(%subst(%str(%addr(H__5(2))):36:132));
        pdltypebox0();
        outweb_(%subst(%str(%addr(H__5(4))):8:83));
        AfToPage_(%trim(%editc(PDPSEQ:'4')));
        outweb_(%subst(%str(%addr(H__5(5))):11:14));
        AfToPage_(%trim(%editc(PDPSEQ:'4')));
        outweb_(%subst(%str(%addr(H__5(5))):25:9));
        wfrtn__ = AfToPage_(PDPDESC);
        outweb_(%subst(%str(%addr(H__5(5))):34:28));
        pdplanbox0();
        outweb_(%subst(%str(%addr(H__5(5))):62:70));
        AfToPage_(%trim(%editc(PDPSEQ:'4')));
        outweb_(%subst(%str(%addr(H__5(6))):52:15));
        AfToPage_(%trim(%editc(PDPSEQ:'4')));
        outweb_(%subst(%str(%addr(H__5(6))):67:9));
        AfToPage_(%trim(%editc(PDPLAMT:'J')));
        outweb_(%subst(%str(%addr(H__5(6))):76:94));
        AfToPage_(%trim(%editc(PDPSEQ:'4')));
        outweb_(%subst(%str(%addr(H__5(8))):10:14));
        AfToPage_(%trim(%editc(PDPSEQ:'4')));
        outweb_(%subst(%str(%addr(H__5(8))):24:9));
        AfToPage_(%trim(%editc(PPDPHAMT:'J')));
        outweb_(%subst(%str(%addr(H__5(8))):33:83));
        AfToPage_(%trim(%editc(PDPSEQ:'4')));
        outweb_(%subst(%str(%addr(H__5(9))):36:12));
        AfToPage_(%trim(%editc(PDPSEQ:'4')));
        outweb_(%subst(%str(%addr(H__5(9))):48:9));
        AfToPage_(%trim(%editc(PDPLAPR:'3')));
        outweb_(%subst(%str(%addr(H__5(9))):57:106));
        AfToPage_(%trim(%editc(PDPSEQ:'4')));
        outweb_(%subst(%str(%addr(H__5(11))):3:11));
        AfToPage_(%trim(%editc(PDPSEQ:'4')));
        outweb_(%subst(%str(%addr(H__5(11))):14:9));
        AfToPage_(%trim(%editc(PDPHAPR:'3')));
        outweb_(%subst(%str(%addr(H__5(11))):23:84));
        AfToPage_(%trim(%editc(PDPSEQ:'4')));
        outweb_(%subst(%str(%addr(H__5(12))):27:13));
        AfToPage_(%trim(%editc(PDPSEQ:'4')));
        outweb_(%subst(%str(%addr(H__5(12))):40:9));
        AfToPage_(%trim(%editc(PDPLTERM:'3')));
        outweb_(%subst(%str(%addr(H__5(12))):49:108));
        AfToPage_(%trim(%editc(PDPSEQ:'4')));
        outweb_(%subst(%str(%addr(H__5(13))):77:12));
        AfToPage_(%trim(%editc(PDPSEQ:'4')));
        outweb_(%subst(%str(%addr(H__5(14))):9:9));
        AfToPage_(%trim(%editc(PDPHTERM:'3')));
        outweb_(%subst(%str(%addr(H__5(14))):18:44));
        AfToPage_(%trim(%editc(PDPSEQ:'4')));
        outweb_(%subst(%str(%addr(H__5(14))):62:14));
        AfToPage_(%trim(%editc(PDPSEQ:'4')));
        outweb_(%subst(%str(%addr(H__5(14))):76:9));
        AfToPage_(%trim(%editc(PDPSEQ:'4')));
        outweb_(%subst(%str(%addr(H__5(15))):5:9));
        READE(E) dealerlink RKWPDPROD;
        RS003_ = RcdSts2_('GETNXTRCD':%error:%found:%eof);
        AM003_ = CV_ByKey;
        enddo;
       endif;
       outweb_(%subst(%str(%addr(H__6(1))):1:56));
       AfToPage_(%trim(%editc(PDPSEQ:'4')));
       outweb_(%subst(%str(%addr(H__6(1))):57:58));

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
       get_write0();
       Redirect2_( %trim(pgm_lnlist):'*SAME');
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
       pdpseq = %dec(aton_( getparm3_('pdpseq':'*OPT'):11:0):11:0);
       pdno = getparm3_('pdno':'*OPT');
       AM003_ = CV_BYKEY;
       CHAIN(E) DL003_ RKWPDPROD;
       RS003_ = RcdSts2_('GETRCD': %error: %found: %eof);
       if (RS003_ = '1');
      /end-free
     C                   EVAL      RS003_ = DeleteRcd_('RKWPDPROD')
      /free
       endif;
       Redirect2_( 's_prodedit.pgm?pdno=' + pdno:'*SAME');
      /end-free
     c     *PSSR         begsr
     c                   endsr
     P                 E


     P*---------------------------------------------------------------------
     P* get_write0...               - User defined function
     P*---------------------------------------------------------------------
     P get_write0...
     P                 B
     D get_write0...
     D                 PI



     D x               S                   LIKE(counter       )

      /free
       counter = %dec(aton_( getparm3_('counter':'*OPT'):5:0):5:0);
       pdno = getparm3_('pdno':'*OPT');
       x = 1;
       dow (x <= counter);
       PDPSEQ = %dec(aton_( getparm3_( 'PDPSEQ' + %trim(%editc(x:'P')):'*OPT'
       ):11:0):11:0);
       if (PDPSEQ <> 0);
        AM003_ = CV_BYKEY;
        CHAIN(E) DL003_ RKWPDPROD;
        RS003_ = RcdSts2_('GETRCD': %error: %found: %eof);
        pdltype = getparm3_( 'pdltype' + %trim(%editc(x:'P')):'*OPT');
        pdpdesc = getparm3_( 'prodname' + %trim(%editc(x:'P')):'*OPT');
        PDPLAMT = %dec(aton_( getparm3_( 'amtfinlow' + %trim(%editc(x:'P')):'-
       *OPT'):11:2):11:2);
        PPDPHAMT = %dec(aton_( getparm3_( 'amtfinhi' + %trim(%editc(x:'P')):'-
       *OPT'):11:2):11:2);
        PDPLAPR = %dec(aton_( getparm3_( 'aprlow' + %trim(%editc(x:'P')):'*OP-
       T'):5:2):5:2);
        PDPHAPR = %dec(aton_( getparm3_( 'aprhi' + %trim(%editc(x:'P')):'*OPT-
       '):5:2):5:2);
        PDPLTERM = %dec(aton_( getparm3_( 'termlow' + %trim(%editc(x:'P')):'*-
       OPT'):5:0):5:0);
        PDPHTERM = %dec(aton_( getparm3_( 'termhi' + %trim(%editc(x:'P')):'*O-
       PT'):5:0):5:0);
        pdplan = getparm3_( 'pdplan' + %trim(%editc(x:'P')):'*OPT');
        if (pdltype = 'AO');
         PDPSEQ = 100;
        endif;
        if (RS003_ = '1');
         RS003_ = UpdateRcd_('RKWPDPROD');
        else;
         WRITE RKWPDPROD;
         RS003_ = RcdSts2_('WRTRCD': %error: %found: %eof);
        endif;
       endif;
       x = x + 1;
       enddo;
      /end-free
     c     *PSSR         begsr
     c                   endsr
     P                 E


     P*---------------------------------------------------------------------
     P* pdltypebox0...              - User defined function
     P*---------------------------------------------------------------------
     P pdltypebox0...
     P                 B
     D pdltypebox0...
     D                 PI




      /free
       AM003_ = CV_BYKEY;
       CHAIN(E) DL003_ RKWPDPROD;
       RS003_ = RcdSts2_('GETRCD': %error: %found: %eof);
       OutWeb_(%trimr( '<select name="PDLTYPE' + %trim(%editc(PDPSEQ:'P')) +
       '" id="PDLTYPE' + %trim(%editc(PDPSEQ:'P')) + '">'));
       if (pdltype = 'AO');
        OutWeb_('<option value="AO" selected>Add-On</option>');
       else;
        OutWeb_('<option value="AO">Add-On</option>');
       endif;
       if (pdltype = 'R');
        OutWeb_('<option value="R" selected>Revolving</option>');
       else;
        OutWeb_('<option value="R">Revolving</option>');
       endif;
       if (pdltype = 'CE');
        OutWeb_('<option value="CE" selected>Retail (Closed End)</option>');
       else;
        OutWeb_('<option value="CE">Retail (Closed End)</option>');
       endif;
       OutWeb_('</select>');
      /end-free
     c     *PSSR         begsr
     c                   endsr
     P                 E


     P*---------------------------------------------------------------------
     P* pdplanbox0...               - User defined function
     P*---------------------------------------------------------------------
     P pdplanbox0...
     P                 B
     D pdplanbox0...
     D                 PI




      /free
       AM003_ = CV_BYKEY;
       CHAIN(E) DL003_ RKWPDPROD;
       RS003_ = RcdSts2_('GETRCD': %error: %found: %eof);
       OutWeb_(%trimr( '<select name="PDPLAN' + %trim(%editc(PDPSEQ:'P')) + '-
       " id="PDPLAN' + %trim(%editc(PDPSEQ:'P')) + '">'));
       if (pdplan = 'R');
        OutWeb_('<option value="R" selected>Regular</option>');
       else;
        OutWeb_('<option value="R">Regular</option>');
       endif;
       if (pdplan = 'E');
        OutWeb_('<option value="E" selected>Extended</option>');
       else;
        OutWeb_('<option value="E">Extended</option>');
       endif;
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
       if   ((file__='KWPDPROD' or file__='*ALL') and NOT %OPEN(KWPDPROD));
        if (mbr__ <> '*FIRST');
         ovrdbf_(ovrflag__:'KWPDPROD':'KWPDPROD' : '*LIBL' : mbr__);
        elseif ('KWPDPROD' <> 'KWPDPROD');
         ovrdbf_(ovrflag__:'KWPDPROD':'KWPDPROD' : '*LIBL');
        endif;
        if    erropen__ = 'Y';
         OPEN(E) KWPDPROD;                //    KWPDPROD
         if        %error;
          return %error;
         endif;
        else;
         OPEN KWPDPROD;                //    KWPDPROD
        endif;
       endif;
       if   ((file__='KWSMNUOPT' or file__='*ALL') and NOT %OPEN(KWSMNUOPT));
        if (mbr__ <> '*FIRST');
         ovrdbf_(ovrflag__:'KWSMNUOPT':'KWSMNUOPT' : '*LIBL' : mbr__);
        elseif ('KWSMNUOPT' <> 'KWSMNUOPT');
         ovrdbf_(ovrflag__:'KWSMNUOPT':'KWSMNUOPT' : '*LIBL');
        endif;
        if    erropen__ = 'Y';
         OPEN(E) KWSMNUOPT;                //    KWSMNUOPT
         if        %error;
          return %error;
         endif;
        else;
         OPEN KWSMNUOPT;                //    KWSMNUOPT
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
       when      rcdfmt__='RKWPDPROD' and AM003_ = CV_ByKey and RS003_ = *ON ;
       update RKWPDPROD;
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
       when      rcdfmt__='RKWPDPROD' and AM003_ = CV_ByKey and RS003_ = *ON ;
       delete RKWPDPROD;
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
**CTDATA H__1        manageJs                         941
<script type="text/javascript">
	var i, num;



	$(document).ready(function ()
	
{
		$("#addBut").click(function ()
		{
			var rows = $("#noRecs").val();
			addR
ows(rows);
		});

	});

	function destroyRow(trId)
	{
	$("#"+trId).remove();		
	
}
	
	function addRows(numr)
	{
		i = parseFloat($("#counter").val())+1;

		for (
var j = 0; j < numr; j++)
		{
			
			$("table.displayTable tbody tr:first").clon
e().find("input, a").each(function ()
			{
				$(this).attr(
				{
					'id': fu
nction (_, id)
					{
						id = id.replace(/[0-9]/g, '');
						return id + i
	
				},
					'name': function (_, name)
					{
						name = name.replace(/[0-9]/g
, '');
						return name + i
					},
					'value': ''
					,
					'href': "javas
cript:destroyRow('tr"+i+"');"
				});
			$(this).closest('tr').attr('id','tr'+i)
;
			}).end().appendTo("table.displayTable tbody");
			$("#PDPSEQ"+i).val(i);
		
	i++;
			
			
		}
		$("#counter").val(i-1);
	}
	

	
</script>
**CTDATA H__2        manageCss                        3376
<style type="text/css">
BODY {
background-image:url('https://sb4.compass-technol
ogies.com:8150/websmart/kwikloan/images/modalIframeBg.png'); 
background-repeat:
 repeat-x;
}

TABLE.displayTable tr {
width:100%;
}

TABLE.displayTable tr td{
	
text-align:center;
}


th.other {
text-align:center;
border-top:1px solid transp
arent;
border-left:1px solid transparent;
border-right:1px solid transparent;
bo
rder-top-left-radius:15px;
border-top-right-radius:15px;
background-color: #6C6C
6C;
color: #FFFFFF;
font-family: verdana;
font-size: 12px;
font-weight: normal;

padding: 5px;
}

th.add{
border: 1px transparent;	
}

TABLE.displayTable{
positi
on: relative;
clear: left;
width: 100%;
font-family: Verdana, Geneva, sans-serif
;
font-size: 13px;
float: left;	
margin-top:1.25%;
}

DIV.dealerInfo{

font-fami
ly: Verdana, Geneva, sans-serif;
}

TABLE.displayTable td.left {
background-colo
r: #F5FAFA;
color: #797268;
border: 1px solid #C1DAD7;
padding: 5px;
}

TABLE.di
splayTable td.right {
background-color: #FFFFFF;
border: 1px solid #C1DAD7;
colo
r: #4f6b72;
padding: 5px;
padding-left: 10px;
width:150px;
}

.input{
width:98%;

}

#addFunc{
float:left;
}
.pagetop{
vertical-align:absbottom; display:inline}

.pagetop img{
vertical-align:middle;
}

#topBtns
{
float: right;
padding-right:
12px;
margin-right: 30px;
}
.loanProd
{
border-left: 1px solid #cccccc;	
}
.hold
erTd
{
border-right: 1px solid #cccccc;
}
#stateTable
{
position: relative;
widt
h: 300px;
border-left: 1px solid #CCCCCC;	
}
.stateTable tr td
{
padding: 0px 0p
x 0px 3px;
vertical-align: top;	
}
.loanProd
{
padding: 0px 0px 0px 3px;
vertica
l-align: top;	
}
#stateOfBus
{
font-family: verdana;
font-size: 11px;	
}
#loanPr
od
{
font-family: verdana;
font-size: 11px;
}
body {
background-image: none;
col
or: #000000;
background-color: #c9c9c9;
padding-top: 0px;
padding-bottom: 0px;
p
adding-left: 0px;
padding-right: 0px;
}

#wrapping {
width: 98%;
margin-left: au
to;
margin-right: auto;
}

#everything {
width: 98%;
margin-top: 10px;
margin-le
ft: auto;
margin-right: auto;
padding-bottom: 10px;
background-color: #EAEAEA;
b
ackground-image: url('/websmart/kwikloan/images/pshadow.png');
background-positi
on: right;
background-repeat: repeat-y;
}

#pagetitle {
font-size: 14px;
color:
#FFFFFF;
width: 100%;
background-color: #839dc1;
padding: 10px;
position: fixed;

top: 0px;
left: 0px;
z-index: 9999;
}

#pagetitle span {
margin-left: 10px;
fon
t-family: verdana;
padding: 5px;
}

#whitebg {
background-color: #FFFFFF;
border
: 1px solid #999;
padding: 10px;
margin:0px auto;
width: 98%;
height:97.75%;
dis
play: table;
min-height:97.75%;
}

#whitebg table td a {
color: #06f;
}

DIV.whi
tebg {
height: 565px;	
}

DIV.left {
position: relative;
float: left;
height: 55
0px;
width: 200px;
background-color: #6d819c;
background-image: url('/websmart/k
wikloan/images/loanInqLeft.png');
}

DIV.right {
position: relative;
float: left
;
height: 550px;
width: 650px; 
}


table.dealerTable 
{
border-spacing: 0;
font
-family: verdana;
font-size: 11px;
margin-top: 8px;
padding-bottom: 5px;
left: 7
px;
position: relative;
width: 350px;
}
table.dealerTable td 
{
font-family: ver
dana;
font-size: 11px;
padding: 6px 5px 6px 0px;
vertical-align: middle;
}
table
.dealerTable td.left 
{
text-align: right;
width: 130px;
}
table.dealerTable td.
right 
{
padding-left: 8px;
text-align: left;
width: 190px;
vertical-align: midd
le;
}


</style>
**CTDATA H__3        floatHead                        1434
<style>
    .floatingHeader {
      position: fixed;
      top: 6.5%;
      visi
bility: hidden;
    }
	</style>
  <script>
    function UpdateTableHeaders() {

      $(".persist-area").each(function() {
       
           var el
 = $(this),
               offset         = el.offset(),
               scrollTo
p      = $(window).scrollTop(),
               floatingHeader = $(".floatingHead
er", this)
           
           if ((scrollTop > offset.top) && (scrollTop < o
ffset.top + el.height())) {
               floatingHeader.css({

"visibility": "visible"
               });
           } else {
               fl
oatingHeader.css({
                "visibility": "hidden"
               });
  
           };
       });
    }
    
    // DOM Ready      
    $(function() {

    
       var clonedHeaderRow;
    
       $(".persist-area").each(function()
 {
           clonedHeaderRow = $(".persist-header", this);
           clonedHea
derRow
             .before(clonedHeaderRow.clone())
             .css("width",
clonedHeaderRow.width())
             .addClass("floatingHeader");


         $(".floatingHeader th").each(function(index){
   		 var index2 = index
;
    	$(this).width(function(index2){
        return $("#table-1 th").eq(index)
.width();
   		 });
		});

       });
       
       $(window)
        .scroll(U
pdateTableHeaders)
        .trigger("scroll");
       
    });
  </script>
**CTDATA H__4        listHead                         1862
<html>
  <head>
    <title>Edit Products</title>
    <meta name="generator" cont
ent="WebSmart" />
    <meta http-equiv="Pragma" content="no-cache" />
    <title
>test</title>
    
    <script type="text/javascript" src="/websmart/kwikloan/ja
vascript/klscripts.js"></script>
    <script type="text/javascript" src="/k_loan
/jq/172.js"></script>
    
    
    
    
  </head>
  
  <body onload="">
    

   <form id="recpost" name="recpost" action="" method="POST">
      <input type=
"hidden" name="task" value="endmanage">
      <input type="hidden" name="pdno" v
alue="">
      <div id="pagetitle">
        <span>Edit Dealer Products -  / Deal
er #: </span>
        
        <div id="topBtns" style="float: right; padding-ri
ght: 12px;">
          <div id="addFunc">Records to Add:&nbsp;&nbsp;<input type=
"text" size="2" maxlength="2" id="noRecs" name="noRecs" value="1">&nbsp;&nbsp;<i
nput type="button" id="addBut" name="addBut" value="Add Records"></div>

  <input type="submit" id="subprod" name="subprod" value="Commit and Return">

        <button class="navbutton"  onclick="javascript:location.href=''; return
false;">Cancel</button>
        </div>
        
      </div>
      <div id="wrap
ping">
        <div id="whitebg">
          
          <br>
          

 <table id="table-1" class="displayTable persist-area">
            <thead>

          <tr class="persist-header">
                <th colspan="1" class="oth
er">Delete</th>
                <th colspan="1" class="other">Type</th>

        <th colspan="1" class="other">Name</th>
                <th colspan="1"
class="other">Plan</th>
                <th colspan="3" class="other">Amount Fin
anced</th>
                <th colspan="3" class="other">APR</th>

  <th colspan="3" class="other">Term</th>
              </tr>
            </thea
d>
            <tbody>
**CTDATA H__5        listDetail                       1133
<tr id="tr">
  <td class="left"><a id="delt" name="delt" onclick="" href="s_prod
edit.pgm?pdpseq=&task=delconf&pdno="><img src="/websmart/v7.2/Lincoln/images/del
ete.gif" title="Delete product record" alt="Delete product"/></td>
  <td class="
right"></td>
  <td class="left"><input  type="text" size="9" maxlength="25" name
="prodname" id="prodname" value=""></td>
  <td class="right"></td>
  <td class="
right"><input  size="9" type="text" name="amtfinlow" id="amtfinlow" value=""></t
d>
  <td class="left">to</td><td class="right"><input size="9" type="text" name=
"amtfinhi" id="amtfinhi" value=""></td>
  <td class="right"><input  type="text"
size="4" maxlength="5" name="aprlow" id="aprlow" value=""></td>
  <td class="lef
t">to</td><td class="right"><input  type="text" size="4" maxlength="5" name="apr
hi" id="aprhi" value=""></td>
  <td class="right"><input  type="text" size="1" m
axlength="2" name="termlow" id="termlow" value=""></td>
  <td class="left">to</t
d><td  class="right"><input  type="text" size="1" maxlength="2" name="termhi" id
="termhi" value=""></td>
  
  <input type="hidden" id="PDPSEQ" name="PDPSEQ" val
ue=""> 
</tr>
**CTDATA H__6        listFoot                         114
<input type="hidden" id="counter" name="counter" value="">
</tbody>
</table>
</d
iv>
</div>
</form>
</body>
</html>

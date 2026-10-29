     H/TITLE  Kwik-View
      * ProGen WebSmart Revision 28963
      * File overrides for compile command
      *__OV OVRDBF KWARCHIVE  KWARCHIVE
      *__OV OVRDBF KWPDURL    KWPDURL
      *__OV OVRDBF KWLBASE    KWLBASE
      *__OV OVRDBF KWPSBASE   KWPSBASE
      *__OV OVRDBF KWPDBASE   KWPDBASE
      *__OV OVRDBF KWHLOAN    KWHLOAN
      *__OV OVRDBF KWHBASE    KWHBASE
      *__OV OVRDBF KWHNOTE    KWHNOTE
      *__OV OVRDBF KWLSIGN    KWLSIGN
      *__OV OVRDBF KW_ASIGN   KW_ASIGN
      *__OV OVRDBF KWPSCONT   KWPSCONT
      *__OV OVRDBF KWPRULE    KWPRULE
      *__OV OVRDBF KWS_LOGPM  KWS_LOGPM
      *__OV OVRDBF KWSPOSTMK  KWSPOSTMK
      *__OV OVRDBF KWLTRAK    KWLTRAK
      *__OV OVRDBF DS_GETNAME DS_GETNAME
      *__   Following values are used to create the server program
      *__RO Pgm  lib DEVWEBSMT  Pgm  SSC_UP
      *__AG          WEBSMART
      *__CL          *OBJLIBNAM
      *__SQ
      *__BD ECRTBND204
      *===============================================================*
      * Path:   ssc_up.pdw
      * System: RAJASHEKAR
      * Project:Kwik-Loan
      * Set:    Dev Websmart
      * User:   rajashekhar.battu
      * Date Last Generated:   2020-09-01   15:58:15
      * Last Generated CRC: 8C1BC8AA DCA5CC60 A00E2853 5F98E08F
      *===============================================================*
      */CPY *LIBL/PW_CSRC CPYRIGHT
      * File specifications
     FKWARCHIVE IF A E           K DISK    USROPN
     F                                     INFDS(FID001_   )
     FKWPDURL   IF   E           K DISK    USROPN
     F                                     INFDS(FID002_   )
     FKWLBASE   IF   E           K DISK    USROPN
     F                                     INFDS(FID003_   )
     FKWPSBASE  IF   E           K DISK    USROPN
     F                                     INFDS(FID004_   )
     FKWPDBASE  IF   E           K DISK    USROPN
     F                                     INFDS(FID005_   )
     FKWHLOAN   IF   E           K DISK    USROPN
     F                                     INFDS(FID006_   )
     FKWHBASE   IF   E           K DISK    USROPN
     F                                     INFDS(FID007_   )
     FKWHNOTE   IF   E           K DISK    USROPN
     F                                     INFDS(FID008_   )
     FKWLSIGN   IF   E           K DISK    USROPN
     F                                     INFDS(FID009_   )
     FKW_ASIGN  IF   E           K DISK    USROPN
     F                                     INFDS(FID010_   )
     FKWPSCONT  IF   E           K DISK    USROPN
     F                                     INFDS(FID011_   )
     FKWPRULE   IF   E           K DISK    USROPN
     F                                     INFDS(FID012_   )
     FKWS_LOGPM IF   E           K DISK    USROPN
     F                                     INFDS(FID013_   )
     FKWSPOSTMK IF   E           K DISK    USROPN
     F                                     INFDS(FID014_   )
     FKWLTRAK   UF   E           K DISK    USROPN
     F                                     INFDS(FID015_   )

     D PTL__           S             50    DIM(1) CTDATA PERRCD(1)
     D RTLLA__         S             11    DIM(180)

     D*+FLDDCL Field declarations

     Dlogpmds        E DS                  EXTNAME(kws_logpm    ) INZ
     Dcustnameds     E DS                  EXTNAME(ds_getname   ) INZ
     Duserdata2        DS                  INZ
     D client2                        5A
     D userid2                       32A
     D location                       5A
     Duserdata1        DS                  INZ
     D client1                        5A
     D userid1                       32A
     D pdno                          25A
     D office                        11S 0
     Dzip              DS                  INZ
     D zip5                           5S 0
     D zip4                           4S 0
     Dtin              DS                  INZ
     D tin3                           3S 0
     D tin2                           2S 0
     D tin4                           4S 0

     D fromkdlr        S              1A
     D clientid        S              5A
     D returnurl       S             50A
     D task            S            100A
     D loannbr         S             22A
     D bannerhtml      S           4000A
     D confirmmsg      S            200A
     D altclientid     S              5A
     D forgotpwd       S              1A
     D title           S            200A
     D pwdlen          S              2P 0
     D openloans       S              3S 0
     D url             S            500A
     D ctin4alpha      S              4A
     D zip5alpha       S              5A
     D zip4alpha       S              4A
     D addr3           S            100A
     D phonedisplay    S             20A
     D listdisplay     S             20A
     D listhref        S            500A
     D multiple        S              1A
     D logoname        S            200A
     D totalamount     S             11S 2
     D linktext        S            200A
     D errlname        S            100A
     D errctin         S            100A
     D erruser         S            100A
     D errpwd          S            100A
     D errormessage    S            100A
     D ctin4           S              4S 0
     D resp            S            200A
     D actconfirm      S            100A
     D pmtbutton       S             20A
     D problemloanmsg  S            200A
     D isvalid         S              1A
     D statusdisplay   S             20A
     D forgot          S              1A
     D erremail        S            100A
     D uplmesg         S             40A
     D tctype          S             10A
     D toeml           S             50A
     D emlbody         S           9999A
     D rtncode         S              1A
     D subject         S            100A
     D type            S             25A
     D function        S             25A
     D frmeml          S             50A
     D path            S           1000A
     D cc              S             50A
     D bcc             S             50A
     D cust            S              9A
     D acct            S              5A
     D command         S          32000A
     D emlbody_long    S          30000A
     D apikey          S             64A
     D a_type          S              1A
     D rtncd           S              1A
     D isproccsr       S              1A
     D csrid           S             20A
     D workzip         S             10A
     D workphone       S             12A
     D bmd             S             14A
     D btd             S             14A
     D fieldlength     S              5S 0
     D character       S              1A
     D zipalpha        S             10A
     D citystzip       S            100A
     D msgdisplay      S             20A
     D tmp             S          32767A
     D tgtdir          S            500A
     D pcpath          S            500A
     D ifspath         S            200A
     D uploadmsg       S            200A
     D suc_msg         S            200A
     D err_msg         S            200A
     D tinalpha        S             12A
     D availablemsg    S            200A
     D document        S             50A
     D newappdisplay   S             20A
     D newappdsp       S             20A
     D byteswritten    S              6S 0
     D webavaildsp     S             20A
     D pastduedsp      S             20A
     D description     S             50A
     D datea           S              8A
     D timea           S              9A
     D time9           S              9S 0
     D filename        S            500A
     D fileextension   S              5A
     D strlen          S              3S 0
     D dsploanlist     S             10A
     D wdlr            S              5A
     D userid          S             32A
     D pagenum         S              5S 0
     D militarydsp     S             15A
     D allotherdsp     S             15A
     D forgotdsp       S             10A
     D endposition     S              4S 0
     D isloandoc       S              1A
     D emaildomain     S            100A
     D soshow          S             10A
     D closeshow       S             10A
     D solink          S            200A
     D x               S              1P 0
     D flag            S             10A
     D closebutton     S              1A
     D custnuma        S              7A
     D tmpcust         S              9S 0
     D snapflag        S              1A
     D dfile           S             10I 0
     D tmpfile         S             10I 0
     D myfile          S             10I 0
     D from_eml        S              1A
     D artncod         S              5A
     D client          S              5A
     D dlrcode         S             25A
     D kwiklogin       S             25A
     D n_seq           S              2S 0
     D setlibraryflag  S              1A
     D textbody        S            160A
     D parmcust        S              9S 0
     D parmacct        S              5S 0

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
     D RS015_          S              1A
     D AM015_          S              1A


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
     D rwcolor2__      S             32A   INZ('FFFFFF')


     D TASKRAN__       S              1    INZ(*OFF)


     D H__1            S             80    PERRCD(1) CTDATA DIM(114         )

     D H__2            S             80    PERRCD(1) CTDATA DIM(114         )

     D H__3            S             80    PERRCD(1) CTDATA DIM(39          )


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
     D FID015_         DS
     D  RR_015_              397    400B 0


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

     D wrt_upload0...
     D                 PR
     D wrt_upload_app0...
     D                 PR
     D upload_finish0...
     D                 PR
     D upload_file0...
     D                 PR
     D QPGM__          S             21A
     D LstPmlErr_      S              4P 0 IMPORT
     D getuser0...
     D                 PR
     D escapeblanks0...
     D                 PR
     D splitfilename0...
     D                 PR
     D emailsend0...
     D                 PR
     D CURISOD__       S               D   DATFMT(*ISO) INZ(*SYS)
     D CURYYMDN__      S              8P 0
     D LstPmlEtx_      S            256A   IMPORT
     D CURISOT__       S               T   TIMFMT(*ISO) INZ(*SYS)
     D QPGMNAM__       S             20A
     D SmurfChk__      S              1A   INZ(*ON)
     D Smurf_ID__      S             64A   IMPORT
     D Smurf_Rw__      S              9B 0 IMPORT

     D shortpath       S                   LIKE(pcpath        )
     D nconst          S                   LIKE(msseq         )
     D vers            S                   LIKE(task          )
     D notep           S                   LIKE(nline         )
     D position        S                   LIKE(strlen        )
     D startposition   S                   LIKE(fieldlength   )
     D outfield        S                   LIKE(url           )
     D workfield       S                   LIKE(url           )
     D doctitle        S                   LIKE(description   )
     D phpcli          S                   LIKE(kwk_purl1     )
     D sv_mcust        S                   LIKE(mcust         )

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

     C     DL005_        KLIST
     C                   KFLD                    pdno
     C     DL001_        KLIST
     C                   KFLD                    arcust
     C                   KFLD                    ardate
     C                   KFLD                    artime
     C     DL002_        KLIST
     C                   KFLD                    kwk_putype
     C     DL003_        KLIST
     C                   KFLD                    mcust
     C                   KFLD                    macct
     C     DL011_        KLIST
     C                   KFLD                    psc_type
     C                   KFLD                    psc_code
     C     DL012_        KLIST
     C                   KFLD                    pruletype
     C                   KFLD                    prulename
     C     DL014_        KLIST
     C                   KFLD                    clientid
     C     DL015_        KLIST
     C                   KFLD                    mcust
     C                   KFLD                    macct
     C                   KFLD                    mttype
     C                   ENDSR


      * Subprocedures follow:
      *--------------------------------------------------------------------------------------------*
      * main__ - Contains the main function source code from the PML
      *--------------------------------------------------------------------------------------------*
     P main__          B
     D main__          PI

      /free
       // PML Start ----------------------------------
       from_eml = getparm3_('fromEmail':'*OPT');
       if (from_eml <> 'Y');
        kwiklogin = getcookie2_('KWIKLOGIN');
        artncod = HasItExpired_(SMURF_ID__);
        if (artncod <> '0');
         select;
         when (kwiklogin = 'KWIKDEALER');
         Redirect2_( 'KDlogin.pgm?task=logout&clid=' + client:'*SAME');
         other;
         Redirect2_('login.pgm':'*SAME');
         endsl;
         return ;
        else;
         select;
         when (kwiklogin = 'KWIKDEALER');
         userdata1 = GetSmurf2_('KWIKDEALER');
         if ((((client1 = '')) or ((userid1 = ''))));
          Redirect2_( 'KDlogin.pgm?task=logout&clid=' + client:'*SAME');
         endif;
         returnurl = 'kdlnlist.pgm';
         userid = userid1;
         client = client1;
         wdlr = pdno;
         other;
         userdata2 = GetSmurf2_('KWIKLOAN');
         if (((client2 = '') or (userid2 = '')));
          Redirect2_('login.pgm':'*SAME');
         endif;
         pdno = getparm3_('pdno':'*OPT');
         returnurl = 'lnlist.pgm';
         userid = userid2;
         client = client2;
         endsl;
        endif;
       endif;
       if ( %trim(client) = '');
        client = getparm3_('clid':'*OPT');
       endif;
       fromkdlr = getparm3_('fromkdlr':'*OPT');
       setlibraryflag = 'N';
       setlibraryflag = rtmwrpa_('WEBSMART':'KWDB108':setlibraryflag:'*NOLOCK-
       ':'GET');
       if (setlibraryflag = 'Y');
        ExecCmd2_('addlible QGPL':%len(%trimr('addlible QGPL')));
        ExecCmd2_( 'KWSET ' + %trim(client):%len(%trimr( 'KWSET ' + %trim(
       client))));
       endif;
       Open_File_('*ALL': '*FIRST':  'Y');
       kw_wrtdataarea('*LDA':userid:'*LIBL':1:32);
       getuser0();
       if (task__ = 'DEFAULT');
        taskran__ = *ON;
        wrt_upload0();
       endif ;
       if (task__ = 'APP');
        taskran__ = *ON;
        wrt_upload_app0();
       endif ;
       if (task__ = 'UPLOAD');
        taskran__ = *ON;
        upload_file0();
       endif ;
       if (task__ = 'GETUSER');
        taskran__ = *ON;
        getuser0();
       endif ;
       if (task__ = 'UPLOADFINISH');
        taskran__ = *ON;
        upload_finish0();
       endif ;
       if (setlibraryflag = 'Y');
        ExecCmd2_('CHGLIBL LIBL(QTEMP QGPL)':%len(%trimr('CHGLIBL LIBL(QTEMP -
       QGPL)')));
       endif;

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
     P* wrt_upload0...              - User defined function
     P*---------------------------------------------------------------------
     P wrt_upload0...
     P                 B
     D wrt_upload0...
     D                 PI




      /free
       mcust = %dec(aton_( getparm3_('mcust':'*OPT'):46:16):9:0);
       macct = %dec(aton_( getparm3_('macct':'*OPT'):46:16):5:0);
       if (((mcust = 0) or (macct = 0)));
        mcust = %dec(aton_( GetSmurf2_('mcust'):46:16):9:0);
        macct = %dec(aton_( GetSmurf2_('macct'):46:16):5:0);
       endif;
       outweb_(%subst(%str(%addr(H__2(1))):1:1954));
       wfrtn__ = AfToPage_(FROMKDLR);
       outweb_(%subst(%str(%addr(H__2(25))):35:2237));
       wfrtn__ = AfToPage_(QPGMNAM__);
       outweb_(%subst(%str(%addr(H__2(53))):32:238));
       wfrtn__ = AfToPage_(CLOSEBUTTON);
       outweb_(%subst(%str(%addr(H__2(56))):30:136));
       wfrtn__ = AfToPage_(CLIENT);
       outweb_(%subst(%str(%addr(H__2(58))):6:63));
       AfToPage_(%trim(%editc(CCUST:'4')));
       outweb_(%subst(%str(%addr(H__2(58))):69:65));
       AfToPage_(%trim(%editc(MCUST:'4')));
       outweb_(%subst(%str(%addr(H__2(59))):54:65));
       AfToPage_(%trim(%editc(MACCT:'4')));
       outweb_(%subst(%str(%addr(H__2(60))):39:69));
       wfrtn__ = AfToPage_(LOANNBR);
       outweb_(%subst(%str(%addr(H__2(61))):28:69));
       wfrtn__ = AfToPage_(SUC_MSG);
       outweb_(%subst(%str(%addr(H__2(62))):17:61));
       wfrtn__ = AfToPage_(CBP);
       outweb_(%subst(%str(%addr(H__2(62))):78:73));
       wfrtn__ = AfToPage_(SHORTPATH);
       outweb_(%subst(%str(%addr(H__2(63))):71:69));
       wfrtn__ = AfToPage_(FROMKDLR);
       outweb_(%subst(%str(%addr(H__2(64))):60:73));
       wfrtn__ = AfToPage_(FROM_EML);
       outweb_(%subst(%str(%addr(H__2(65))):53:226));
       wfrtn__ = AfToPage_(ERR_MSG);
       outweb_(%subst(%str(%addr(H__2(68))):39:2306));
       wfrtn__ = AfToPage_(SUC_MSG);
       outweb_(%subst(%str(%addr(H__2(97))):25:1348));

      /end-free
     c     *PSSR         begsr
     c                   endsr
     P                 E


     P*---------------------------------------------------------------------
     P* wrt_upload_app0...          - User defined function
     P*---------------------------------------------------------------------
     P wrt_upload_app0...
     P                 B
     D wrt_upload_app0...
     D                 PI




      /free
       outweb_(%subst(%str(%addr(H__1(1))):1:3115));
       wfrtn__ = AfToPage_(FROMKDLR);
       outweb_(%subst(%str(%addr(H__1(39))):76:577));
       wfrtn__ = AfToPage_(QPGMNAM__);
       outweb_(%subst(%str(%addr(H__1(47))):13:253));
       wfrtn__ = AfToPage_(CLOSEBUTTON);
       outweb_(%subst(%str(%addr(H__1(50))):26:136));
       wfrtn__ = AfToPage_(CLIENT);
       outweb_(%subst(%str(%addr(H__1(52))):2:63));
       AfToPage_(%trim(%editc(CCUST:'4')));
       outweb_(%subst(%str(%addr(H__1(52))):65:65));
       AfToPage_(%trim(%editc(MCUST:'4')));
       outweb_(%subst(%str(%addr(H__1(53))):50:65));
       AfToPage_(%trim(%editc(MACCT:'4')));
       outweb_(%subst(%str(%addr(H__1(54))):35:69));
       wfrtn__ = AfToPage_(LOANNBR);
       outweb_(%subst(%str(%addr(H__1(55))):24:69));
       wfrtn__ = AfToPage_(SUC_MSG);
       outweb_(%subst(%str(%addr(H__1(56))):13:61));
       wfrtn__ = AfToPage_(CBP);
       outweb_(%subst(%str(%addr(H__1(56))):74:73));
       wfrtn__ = AfToPage_(SHORTPATH);
       outweb_(%subst(%str(%addr(H__1(57))):67:69));
       wfrtn__ = AfToPage_(FROMKDLR);
       outweb_(%subst(%str(%addr(H__1(58))):56:73));
       wfrtn__ = AfToPage_(FROM_EML);
       outweb_(%subst(%str(%addr(H__1(59))):49:226));
       wfrtn__ = AfToPage_(ERR_MSG);
       outweb_(%subst(%str(%addr(H__1(62))):35:2803));
       wfrtn__ = AfToPage_(SUC_MSG);
       outweb_(%subst(%str(%addr(H__1(97))):38:1358));

      /end-free
     c     *PSSR         begsr
     c                   endsr
     P                 E


     P*---------------------------------------------------------------------
     P* upload_finish0...           - User defined function
     P*---------------------------------------------------------------------
     P upload_finish0...
     P                 B
     D upload_finish0...
     D                 PI




      /free
       outweb_(%subst(%str(%addr(H__3(1))):1:3091));

      /end-free
     c     *PSSR         begsr
     c                   endsr
     P                 E


     P*---------------------------------------------------------------------
     P* upload_file0...             - User defined function
     P*---------------------------------------------------------------------
     P upload_file0...
     P                 B
     D upload_file0...
     D                 PI


     D sub_desc        S              2A

     D addesc          S                   LIKE(description   )

      /free
       kwk_putype = 'KWK_DOC';
       AM002_ = CV_BYKEY;
       CHAIN(NE) DL002_ RKWPDURL;
       RS002_ = RcdSts2_('GETRCD': %error: %found: %eof);
       description = getparm3_('description':'*OPT');
       addesc = getparm3_('addesc':'*OPT');
       isloandoc = getparm3_('isloandoc':'*OPT');
       suc_msg = getparm3_('suc_msg':'*OPT');
       shortpath = getparm3_('shortpath':'*OPT');
       vers = getparm3_('vers':'*OPT');
       snapflag = getparm3_('snapflag':'*OPT');
       select;
       when (description = 'DL');
       doctitle = 'Drivers License';
       when (description = 'PS');
       doctitle = 'Pay Stub';
       when (description = 'W2');
       doctitle = 'Most Recent W2';
       when (description = 'BS');
       doctitle = 'Bank Statement';
       when (description = 'MS');
       doctitle = 'Mortgage Statement';
       when (description = 'OT');
       doctitle = 'Other';
       other;
       doctitle = description;
       endsl;
       description = %trim(description) + ' ' + %trim(addesc);
       sub_desc = description;
       if ( %trim(description) = '');
        err_msg = 'Please enter a file description.';
        if (vers = 'upload_app');
         outweb_(%subst(%str(%addr(H__1(1))):1:3115));
         wfrtn__ = AfToPage_(FROMKDLR);
         outweb_(%subst(%str(%addr(H__1(39))):76:577));
         wfrtn__ = AfToPage_(QPGMNAM__);
         outweb_(%subst(%str(%addr(H__1(47))):13:253));
         wfrtn__ = AfToPage_(CLOSEBUTTON);
         outweb_(%subst(%str(%addr(H__1(50))):26:136));
         wfrtn__ = AfToPage_(CLIENT);
         outweb_(%subst(%str(%addr(H__1(52))):2:63));
         AfToPage_(%trim(%editc(CCUST:'4')));
         outweb_(%subst(%str(%addr(H__1(52))):65:65));
         AfToPage_(%trim(%editc(MCUST:'4')));
         outweb_(%subst(%str(%addr(H__1(53))):50:65));
         AfToPage_(%trim(%editc(MACCT:'4')));
         outweb_(%subst(%str(%addr(H__1(54))):35:69));
         wfrtn__ = AfToPage_(LOANNBR);
         outweb_(%subst(%str(%addr(H__1(55))):24:69));
         wfrtn__ = AfToPage_(SUC_MSG);
         outweb_(%subst(%str(%addr(H__1(56))):13:61));
         wfrtn__ = AfToPage_(CBP);
         outweb_(%subst(%str(%addr(H__1(56))):74:73));
         wfrtn__ = AfToPage_(SHORTPATH);
         outweb_(%subst(%str(%addr(H__1(57))):67:69));
         wfrtn__ = AfToPage_(FROMKDLR);
         outweb_(%subst(%str(%addr(H__1(58))):56:73));
         wfrtn__ = AfToPage_(FROM_EML);
         outweb_(%subst(%str(%addr(H__1(59))):49:226));
         wfrtn__ = AfToPage_(ERR_MSG);
         outweb_(%subst(%str(%addr(H__1(62))):35:2803));
         wfrtn__ = AfToPage_(SUC_MSG);
         outweb_(%subst(%str(%addr(H__1(97))):38:1358));
        else;
         outweb_(%subst(%str(%addr(H__2(1))):1:1954));
         wfrtn__ = AfToPage_(FROMKDLR);
         outweb_(%subst(%str(%addr(H__2(25))):35:2237));
         wfrtn__ = AfToPage_(QPGMNAM__);
         outweb_(%subst(%str(%addr(H__2(53))):32:238));
         wfrtn__ = AfToPage_(CLOSEBUTTON);
         outweb_(%subst(%str(%addr(H__2(56))):30:136));
         wfrtn__ = AfToPage_(CLIENT);
         outweb_(%subst(%str(%addr(H__2(58))):6:63));
         AfToPage_(%trim(%editc(CCUST:'4')));
         outweb_(%subst(%str(%addr(H__2(58))):69:65));
         AfToPage_(%trim(%editc(MCUST:'4')));
         outweb_(%subst(%str(%addr(H__2(59))):54:65));
         AfToPage_(%trim(%editc(MACCT:'4')));
         outweb_(%subst(%str(%addr(H__2(60))):39:69));
         wfrtn__ = AfToPage_(LOANNBR);
         outweb_(%subst(%str(%addr(H__2(61))):28:69));
         wfrtn__ = AfToPage_(SUC_MSG);
         outweb_(%subst(%str(%addr(H__2(62))):17:61));
         wfrtn__ = AfToPage_(CBP);
         outweb_(%subst(%str(%addr(H__2(62))):78:73));
         wfrtn__ = AfToPage_(SHORTPATH);
         outweb_(%subst(%str(%addr(H__2(63))):71:69));
         wfrtn__ = AfToPage_(FROMKDLR);
         outweb_(%subst(%str(%addr(H__2(64))):60:73));
         wfrtn__ = AfToPage_(FROM_EML);
         outweb_(%subst(%str(%addr(H__2(65))):53:226));
         wfrtn__ = AfToPage_(ERR_MSG);
         outweb_(%subst(%str(%addr(H__2(68))):39:2306));
         wfrtn__ = AfToPage_(SUC_MSG);
         outweb_(%subst(%str(%addr(H__2(97))):25:1348));
        endif;
       else;
        if (kwk_purl1 <> ' ');
         tgtdir = kwk_purl1;
        else;
         tgtdir = '/clientdata/secure/' + %trim(client) + '/uploads/';
        endif;
        pcpath = getparm3_('upfile':'*OPT');
        if (pcpath = '');
         err_msg = 'Please select a file to upload.';
         if (vers = 'upload_app');
          outweb_(%subst(%str(%addr(H__1(1))):1:3115));
          wfrtn__ = AfToPage_(FROMKDLR);
          outweb_(%subst(%str(%addr(H__1(39))):76:577));
          wfrtn__ = AfToPage_(QPGMNAM__);
          outweb_(%subst(%str(%addr(H__1(47))):13:253));
          wfrtn__ = AfToPage_(CLOSEBUTTON);
          outweb_(%subst(%str(%addr(H__1(50))):26:136));
          wfrtn__ = AfToPage_(CLIENT);
          outweb_(%subst(%str(%addr(H__1(52))):2:63));
          AfToPage_(%trim(%editc(CCUST:'4')));
          outweb_(%subst(%str(%addr(H__1(52))):65:65));
          AfToPage_(%trim(%editc(MCUST:'4')));
          outweb_(%subst(%str(%addr(H__1(53))):50:65));
          AfToPage_(%trim(%editc(MACCT:'4')));
          outweb_(%subst(%str(%addr(H__1(54))):35:69));
          wfrtn__ = AfToPage_(LOANNBR);
          outweb_(%subst(%str(%addr(H__1(55))):24:69));
          wfrtn__ = AfToPage_(SUC_MSG);
          outweb_(%subst(%str(%addr(H__1(56))):13:61));
          wfrtn__ = AfToPage_(CBP);
          outweb_(%subst(%str(%addr(H__1(56))):74:73));
          wfrtn__ = AfToPage_(SHORTPATH);
          outweb_(%subst(%str(%addr(H__1(57))):67:69));
          wfrtn__ = AfToPage_(FROMKDLR);
          outweb_(%subst(%str(%addr(H__1(58))):56:73));
          wfrtn__ = AfToPage_(FROM_EML);
          outweb_(%subst(%str(%addr(H__1(59))):49:226));
          wfrtn__ = AfToPage_(ERR_MSG);
          outweb_(%subst(%str(%addr(H__1(62))):35:2803));
          wfrtn__ = AfToPage_(SUC_MSG);
          outweb_(%subst(%str(%addr(H__1(97))):38:1358));
         else;
          outweb_(%subst(%str(%addr(H__2(1))):1:1954));
          wfrtn__ = AfToPage_(FROMKDLR);
          outweb_(%subst(%str(%addr(H__2(25))):35:2237));
          wfrtn__ = AfToPage_(QPGMNAM__);
          outweb_(%subst(%str(%addr(H__2(53))):32:238));
          wfrtn__ = AfToPage_(CLOSEBUTTON);
          outweb_(%subst(%str(%addr(H__2(56))):30:136));
          wfrtn__ = AfToPage_(CLIENT);
          outweb_(%subst(%str(%addr(H__2(58))):6:63));
          AfToPage_(%trim(%editc(CCUST:'4')));
          outweb_(%subst(%str(%addr(H__2(58))):69:65));
          AfToPage_(%trim(%editc(MCUST:'4')));
          outweb_(%subst(%str(%addr(H__2(59))):54:65));
          AfToPage_(%trim(%editc(MACCT:'4')));
          outweb_(%subst(%str(%addr(H__2(60))):39:69));
          wfrtn__ = AfToPage_(LOANNBR);
          outweb_(%subst(%str(%addr(H__2(61))):28:69));
          wfrtn__ = AfToPage_(SUC_MSG);
          outweb_(%subst(%str(%addr(H__2(62))):17:61));
          wfrtn__ = AfToPage_(CBP);
          outweb_(%subst(%str(%addr(H__2(62))):78:73));
          wfrtn__ = AfToPage_(SHORTPATH);
          outweb_(%subst(%str(%addr(H__2(63))):71:69));
          wfrtn__ = AfToPage_(FROMKDLR);
          outweb_(%subst(%str(%addr(H__2(64))):60:73));
          wfrtn__ = AfToPage_(FROM_EML);
          outweb_(%subst(%str(%addr(H__2(65))):53:226));
          wfrtn__ = AfToPage_(ERR_MSG);
          outweb_(%subst(%str(%addr(H__2(68))):39:2306));
          wfrtn__ = AfToPage_(SUC_MSG);
          outweb_(%subst(%str(%addr(H__2(97))):25:1348));
         endif;
        else;
         splitfilename0();
         if ((((((((((( %XLATE(lo__:up__:fileextension) <> 'PDF') and (
       %XLATE(lo__:up__:fileextension) <> 'DOC') and ( %XLATE(lo__:up__:
       fileextension) <> 'DOCX') and ( %XLATE(lo__:up__:fileextension) <> 'JP-
       G') and ( %XLATE(lo__:up__:fileextension) <> 'TIF') and ( %XLATE(lo__:
       up__:fileextension) <> 'TIFF') and ( %XLATE(lo__:up__:fileextension)
       <> 'JPEG') and ( %XLATE(lo__:up__:fileextension) <> 'HTM') and (
       %XLATE(lo__:up__:fileextension) <> 'HTML') and ( %XLATE(lo__:up__:
       fileextension) <> 'TXT')))))))))));
          err_msg = 'Invalid file type: .' + fileextension + ' Allowed file t-
       ypes are .tif, .pdf, .jpg, .jpeg, .doc, .docx, .txt, and .html';
          if (snapflag = 'Y');
           OutWeb_(err_msg);
          else;
           if (vers = 'upload_app');
            outweb_(%subst(%str(%addr(H__1(1))):1:3115));
            wfrtn__ = AfToPage_(FROMKDLR);
            outweb_(%subst(%str(%addr(H__1(39))):76:577));
            wfrtn__ = AfToPage_(QPGMNAM__);
            outweb_(%subst(%str(%addr(H__1(47))):13:253));
            wfrtn__ = AfToPage_(CLOSEBUTTON);
            outweb_(%subst(%str(%addr(H__1(50))):26:136));
            wfrtn__ = AfToPage_(CLIENT);
            outweb_(%subst(%str(%addr(H__1(52))):2:63));
            AfToPage_(%trim(%editc(CCUST:'4')));
            outweb_(%subst(%str(%addr(H__1(52))):65:65));
            AfToPage_(%trim(%editc(MCUST:'4')));
            outweb_(%subst(%str(%addr(H__1(53))):50:65));
            AfToPage_(%trim(%editc(MACCT:'4')));
            outweb_(%subst(%str(%addr(H__1(54))):35:69));
            wfrtn__ = AfToPage_(LOANNBR);
            outweb_(%subst(%str(%addr(H__1(55))):24:69));
            wfrtn__ = AfToPage_(SUC_MSG);
            outweb_(%subst(%str(%addr(H__1(56))):13:61));
            wfrtn__ = AfToPage_(CBP);
            outweb_(%subst(%str(%addr(H__1(56))):74:73));
            wfrtn__ = AfToPage_(SHORTPATH);
            outweb_(%subst(%str(%addr(H__1(57))):67:69));
            wfrtn__ = AfToPage_(FROMKDLR);
            outweb_(%subst(%str(%addr(H__1(58))):56:73));
            wfrtn__ = AfToPage_(FROM_EML);
            outweb_(%subst(%str(%addr(H__1(59))):49:226));
            wfrtn__ = AfToPage_(ERR_MSG);
            outweb_(%subst(%str(%addr(H__1(62))):35:2803));
            wfrtn__ = AfToPage_(SUC_MSG);
            outweb_(%subst(%str(%addr(H__1(97))):38:1358));
           else;
            outweb_(%subst(%str(%addr(H__2(1))):1:1954));
            wfrtn__ = AfToPage_(FROMKDLR);
            outweb_(%subst(%str(%addr(H__2(25))):35:2237));
            wfrtn__ = AfToPage_(QPGMNAM__);
            outweb_(%subst(%str(%addr(H__2(53))):32:238));
            wfrtn__ = AfToPage_(CLOSEBUTTON);
            outweb_(%subst(%str(%addr(H__2(56))):30:136));
            wfrtn__ = AfToPage_(CLIENT);
            outweb_(%subst(%str(%addr(H__2(58))):6:63));
            AfToPage_(%trim(%editc(CCUST:'4')));
            outweb_(%subst(%str(%addr(H__2(58))):69:65));
            AfToPage_(%trim(%editc(MCUST:'4')));
            outweb_(%subst(%str(%addr(H__2(59))):54:65));
            AfToPage_(%trim(%editc(MACCT:'4')));
            outweb_(%subst(%str(%addr(H__2(60))):39:69));
            wfrtn__ = AfToPage_(LOANNBR);
            outweb_(%subst(%str(%addr(H__2(61))):28:69));
            wfrtn__ = AfToPage_(SUC_MSG);
            outweb_(%subst(%str(%addr(H__2(62))):17:61));
            wfrtn__ = AfToPage_(CBP);
            outweb_(%subst(%str(%addr(H__2(62))):78:73));
            wfrtn__ = AfToPage_(SHORTPATH);
            outweb_(%subst(%str(%addr(H__2(63))):71:69));
            wfrtn__ = AfToPage_(FROMKDLR);
            outweb_(%subst(%str(%addr(H__2(64))):60:73));
            wfrtn__ = AfToPage_(FROM_EML);
            outweb_(%subst(%str(%addr(H__2(65))):53:226));
            wfrtn__ = AfToPage_(ERR_MSG);
            outweb_(%subst(%str(%addr(H__2(68))):39:2306));
            wfrtn__ = AfToPage_(SUC_MSG);
            outweb_(%subst(%str(%addr(H__2(97))):25:1348));
           endif;
           description = '';
          endif;
          return ;
         endif;
      /end-free
     C                   MOVEL     CURYYMDN__    datea
      /free
         time9 = gettime9();
      /end-free
     C                   MOVEL     time9         timea
      /free
         pcpath = 'uploaded' + datea + timea + '.' + fileextension;
         ifspath = getparm3_('upfile-file':'*OPT');
         pcpath = %trim(tgtdir) + %trim(pcpath);
         LSTPMLERR_ = 0;
         tmpFile = fopen_(ifspath:200: 'rb':%len('rb'));
         myFile = fopen_(pcpath:500: 'w+b,codepage=437':%len('w+b,codepage=43-
       7'));
         if (LSTPMLERR_ <> 0);
          err_msg = 'File upload failed: ' + LSTPMLETX_;
          if (vers = 'upload_app');
           outweb_(%subst(%str(%addr(H__1(1))):1:3115));
           wfrtn__ = AfToPage_(FROMKDLR);
           outweb_(%subst(%str(%addr(H__1(39))):76:577));
           wfrtn__ = AfToPage_(QPGMNAM__);
           outweb_(%subst(%str(%addr(H__1(47))):13:253));
           wfrtn__ = AfToPage_(CLOSEBUTTON);
           outweb_(%subst(%str(%addr(H__1(50))):26:136));
           wfrtn__ = AfToPage_(CLIENT);
           outweb_(%subst(%str(%addr(H__1(52))):2:63));
           AfToPage_(%trim(%editc(CCUST:'4')));
           outweb_(%subst(%str(%addr(H__1(52))):65:65));
           AfToPage_(%trim(%editc(MCUST:'4')));
           outweb_(%subst(%str(%addr(H__1(53))):50:65));
           AfToPage_(%trim(%editc(MACCT:'4')));
           outweb_(%subst(%str(%addr(H__1(54))):35:69));
           wfrtn__ = AfToPage_(LOANNBR);
           outweb_(%subst(%str(%addr(H__1(55))):24:69));
           wfrtn__ = AfToPage_(SUC_MSG);
           outweb_(%subst(%str(%addr(H__1(56))):13:61));
           wfrtn__ = AfToPage_(CBP);
           outweb_(%subst(%str(%addr(H__1(56))):74:73));
           wfrtn__ = AfToPage_(SHORTPATH);
           outweb_(%subst(%str(%addr(H__1(57))):67:69));
           wfrtn__ = AfToPage_(FROMKDLR);
           outweb_(%subst(%str(%addr(H__1(58))):56:73));
           wfrtn__ = AfToPage_(FROM_EML);
           outweb_(%subst(%str(%addr(H__1(59))):49:226));
           wfrtn__ = AfToPage_(ERR_MSG);
           outweb_(%subst(%str(%addr(H__1(62))):35:2803));
           wfrtn__ = AfToPage_(SUC_MSG);
           outweb_(%subst(%str(%addr(H__1(97))):38:1358));
          else;
           outweb_(%subst(%str(%addr(H__2(1))):1:1954));
           wfrtn__ = AfToPage_(FROMKDLR);
           outweb_(%subst(%str(%addr(H__2(25))):35:2237));
           wfrtn__ = AfToPage_(QPGMNAM__);
           outweb_(%subst(%str(%addr(H__2(53))):32:238));
           wfrtn__ = AfToPage_(CLOSEBUTTON);
           outweb_(%subst(%str(%addr(H__2(56))):30:136));
           wfrtn__ = AfToPage_(CLIENT);
           outweb_(%subst(%str(%addr(H__2(58))):6:63));
           AfToPage_(%trim(%editc(CCUST:'4')));
           outweb_(%subst(%str(%addr(H__2(58))):69:65));
           AfToPage_(%trim(%editc(MCUST:'4')));
           outweb_(%subst(%str(%addr(H__2(59))):54:65));
           AfToPage_(%trim(%editc(MACCT:'4')));
           outweb_(%subst(%str(%addr(H__2(60))):39:69));
           wfrtn__ = AfToPage_(LOANNBR);
           outweb_(%subst(%str(%addr(H__2(61))):28:69));
           wfrtn__ = AfToPage_(SUC_MSG);
           outweb_(%subst(%str(%addr(H__2(62))):17:61));
           wfrtn__ = AfToPage_(CBP);
           outweb_(%subst(%str(%addr(H__2(62))):78:73));
           wfrtn__ = AfToPage_(SHORTPATH);
           outweb_(%subst(%str(%addr(H__2(63))):71:69));
           wfrtn__ = AfToPage_(FROMKDLR);
           outweb_(%subst(%str(%addr(H__2(64))):60:73));
           wfrtn__ = AfToPage_(FROM_EML);
           outweb_(%subst(%str(%addr(H__2(65))):53:226));
           wfrtn__ = AfToPage_(ERR_MSG);
           outweb_(%subst(%str(%addr(H__2(68))):39:2306));
           wfrtn__ = AfToPage_(SUC_MSG);
           outweb_(%subst(%str(%addr(H__2(97))):25:1348));
          endif;
          return ;
         endif;
         fieldLength = fread_(tmpFile:tmp:32767);
         bytesWritten = fwrite_(myFile:tmp: fieldLength);
         dow (fieldLength = 32767);
         fieldLength = fread_(tmpFile:tmp:32767);
         bytesWritten = fwrite_(myFile:tmp: fieldLength);
         enddo;
         fclose_(tmpFile);
         fclose_(myFile);
         fdelete_(ifspath:200);
         Open_File_('KWARCHIVE': '*FIRST':  'Y');
         ARCUST = MCUST;
         ARACCT = MACCT;
         ARDATE = CURISOD__;
         ARTIME = CURISOT__;
         if (userid2 <> '');
          ardocid = 'KL';
         else;
          ardocid = 'KD';
         endif;
         ardocdesc = description;
         ararcpath = pcpath;
         WRITE RWARCHIVE;
         RS001_ = RcdSts2_('WRTRCD': %error: %found: %eof);
         mttype = 'TRACK.STIP';
         AM015_ = CV_BYKEY;
         CHAIN(E) DL015_ RKWLTRAK;
         RS015_ = RcdSts2_('GETRCD': %error: %found: %eof);
         dow (RS015_ = '1');
         if (mtcode = sub_desc);
          MTRDATE = ARDATE;
          MTRTIME = ARTIME;
          RS015_ = UpdateRcd_('RKWLTRAK');
         endif;
         READE(E) DL015_ RKWLTRAK;
         RS015_ = RcdSts2_('GETNXTRCD':%error:%found:%eof);
         AM015_ = CV_ByKey;
         enddo;
         suc_msg = %trim(suc_msg) + %trim(shortpath) + ' -- ' + %trim(
       description) + ' -- uploaded successfully.<br>';
         notep = %trim(doctitle) + ' -- ' + %trim(addesc) + ' was uploaded su-
       ccessfully.';
         n_seq = 0;
         if (from_eml = 'Y');
          SV_MCUST = MCUST;
      /end-free
     C/Exec SQL
     C+  select wpstype, wpsign into :a_type, :wpsign from kw_asign where wcust
     C+ = :mcust and wacct = :macct and wpsign not like '99%' order by wpsseq de
     C+ sc fetch first 1 row only
     C/End-Exec
      /free
      /end-free
     C/Exec SQL
     C+  select msseq into :n_seq from kwlsign where mcust = :mcust and macct =
     C+ :macct and mstype = :a_type and mssign = :wpsign
     C/End-Exec
      /free
      /end-free
     C/Exec SQL
     C+  select pdno, pdname into :pdno, :pdname from kwpdbase inner join kwlbas
     C+ e on mdlr = pdno fetch first 1 row only
     C/End-Exec
      /free
          userid = '';
          if (WPSIGN <> 0);
           MCUST = WPSIGN;
      /end-free
     C/Exec SQL
     C+  select * into :CustNameDS from table(FN_GetName(:mcust, :macct))
     C/End-Exec
      /free
           MCUST = SV_MCUST;
          endif;
         endif;
      /end-free
     C/Exec SQL
     C+  select ifnull(mcust, 0), ifnull(macct, 0), ifnull(msseq, 0), ifnull(mst
     C+ ype, 'A') into :parmcust, :parmacct, :n_seq, :a_type from kwlsign where
     C+ mssign = :mcust
     C/End-Exec
      /free
         if (parmcust = 0);
          parmcust = mcust;
          parmacct = macct;
          a_type = 'A';
          n_seq = 0;
         endif;
         huser = %XLATE(lo__:up__:userid);
      /end-free
     C                   EVAL      QPGM__=%trim('KWWEB'     ) + '/' + 'POST_N-
     C                             OTE'
     C                   CALL      QPGM__                               90
     C                   PARM                    parmcust
     C                   PARM                    parmacct
     C                   PARM                    a_type
     C                   PARM                    n_seq
     C                   PARM                    notep
     C                   PARM                    huser
     C                   IF        *IN90 = '1'
     C                   EVAL      LstPmlErr_ = 1
     C                   ELSE
     C                   EVAL      LstPmlErr_ = 0
     C                   ENDIF
      /free
         frmeml = '';
         AM003_ = CV_BYKEY;
         CHAIN(NE) DL003_ RKWLBASE;
         RS003_ = RcdSts2_('GETRCD': %error: %found: %eof);
         pdno = mdlr;
         AM005_ = CV_BYKEY;
         CHAIN(NE) DL005_ RKWPDBASE;
         RS005_ = RcdSts2_('GETRCD': %error: %found: %eof);
         subject = 'New Document Notification for account ' + mfmtacct;
         emlbody = 'A new document named "' + %trim(ardocdesc) + '" has been -
       uploaded by Dealer #' + %trim(pdno) + ': ' + %trim(pdname) + ' for the-
        following account:' + '<br><br>' + 'Customer Name: ' + %trim(cname)
       + '<br>' + 'Loan Number: ' + %trim(mfmtacct) + '<br><br>' + 'Please lo-
       g into Kwik-Loan to view the document.';
         emlbody = %trim(emlbody);
         psc_type = 'UPLOAD';
         psc_value = '';
         SETLL  DL011_ RKWPSCONT;
         RS011_ = RcdSts2_('POSRCD':%error:%equal:%eof);
         dou (RS011_ <> '1');
         READE(NE) DL011_ RKWPSCONT;
         RS011_ = RcdSts2_('GETNXTRCD':%error:%found:%eof);
         AM011_ = CV_ByKey;
         if (RS011_ = '1');
          toeml = psc_email;
          emailsend0();
         endif;
         enddo;
         pruletype = 'SYSTEM';
         prulename = 'TWILIOSMS';
         AM012_ = CV_BYKEY;
         CHAIN(NE) DL012_ RKWPRULE;
         RS012_ = RcdSts2_('GETRCD': %error: %found: %eof);
         if ((((RS012_ = '1')) and ((pruleyesno = 'Y'))));
          textbody = %trim(ardocdesc) + ' has been uploaded by Dealer: ' +
       %trim(pdno) + ' for Appl: ' + %trim(mfmtacct) + ' ' + %trim(cname);
          kwt_send(client:'UPLOAD':textbody:0:0:0:0:MCUST:MACCT);
         endif;
         kw_addevent('UPLOAD':'KWIKLOAN':' ':' ':MBR:MCUST:MACCT:'New Documen-
       tation':ararcpath);
         if (snapflag = 'Y');
          OutWeb_('1');
         else;
          if (vers = 'upload_app');
           outweb_(%subst(%str(%addr(H__1(1))):1:3115));
           wfrtn__ = AfToPage_(FROMKDLR);
           outweb_(%subst(%str(%addr(H__1(39))):76:577));
           wfrtn__ = AfToPage_(QPGMNAM__);
           outweb_(%subst(%str(%addr(H__1(47))):13:253));
           wfrtn__ = AfToPage_(CLOSEBUTTON);
           outweb_(%subst(%str(%addr(H__1(50))):26:136));
           wfrtn__ = AfToPage_(CLIENT);
           outweb_(%subst(%str(%addr(H__1(52))):2:63));
           AfToPage_(%trim(%editc(CCUST:'4')));
           outweb_(%subst(%str(%addr(H__1(52))):65:65));
           AfToPage_(%trim(%editc(MCUST:'4')));
           outweb_(%subst(%str(%addr(H__1(53))):50:65));
           AfToPage_(%trim(%editc(MACCT:'4')));
           outweb_(%subst(%str(%addr(H__1(54))):35:69));
           wfrtn__ = AfToPage_(LOANNBR);
           outweb_(%subst(%str(%addr(H__1(55))):24:69));
           wfrtn__ = AfToPage_(SUC_MSG);
           outweb_(%subst(%str(%addr(H__1(56))):13:61));
           wfrtn__ = AfToPage_(CBP);
           outweb_(%subst(%str(%addr(H__1(56))):74:73));
           wfrtn__ = AfToPage_(SHORTPATH);
           outweb_(%subst(%str(%addr(H__1(57))):67:69));
           wfrtn__ = AfToPage_(FROMKDLR);
           outweb_(%subst(%str(%addr(H__1(58))):56:73));
           wfrtn__ = AfToPage_(FROM_EML);
           outweb_(%subst(%str(%addr(H__1(59))):49:226));
           wfrtn__ = AfToPage_(ERR_MSG);
           outweb_(%subst(%str(%addr(H__1(62))):35:2803));
           wfrtn__ = AfToPage_(SUC_MSG);
           outweb_(%subst(%str(%addr(H__1(97))):38:1358));
          else;
           outweb_(%subst(%str(%addr(H__2(1))):1:1954));
           wfrtn__ = AfToPage_(FROMKDLR);
           outweb_(%subst(%str(%addr(H__2(25))):35:2237));
           wfrtn__ = AfToPage_(QPGMNAM__);
           outweb_(%subst(%str(%addr(H__2(53))):32:238));
           wfrtn__ = AfToPage_(CLOSEBUTTON);
           outweb_(%subst(%str(%addr(H__2(56))):30:136));
           wfrtn__ = AfToPage_(CLIENT);
           outweb_(%subst(%str(%addr(H__2(58))):6:63));
           AfToPage_(%trim(%editc(CCUST:'4')));
           outweb_(%subst(%str(%addr(H__2(58))):69:65));
           AfToPage_(%trim(%editc(MCUST:'4')));
           outweb_(%subst(%str(%addr(H__2(59))):54:65));
           AfToPage_(%trim(%editc(MACCT:'4')));
           outweb_(%subst(%str(%addr(H__2(60))):39:69));
           wfrtn__ = AfToPage_(LOANNBR);
           outweb_(%subst(%str(%addr(H__2(61))):28:69));
           wfrtn__ = AfToPage_(SUC_MSG);
           outweb_(%subst(%str(%addr(H__2(62))):17:61));
           wfrtn__ = AfToPage_(CBP);
           outweb_(%subst(%str(%addr(H__2(62))):78:73));
           wfrtn__ = AfToPage_(SHORTPATH);
           outweb_(%subst(%str(%addr(H__2(63))):71:69));
           wfrtn__ = AfToPage_(FROMKDLR);
           outweb_(%subst(%str(%addr(H__2(64))):60:73));
           wfrtn__ = AfToPage_(FROM_EML);
           outweb_(%subst(%str(%addr(H__2(65))):53:226));
           wfrtn__ = AfToPage_(ERR_MSG);
           outweb_(%subst(%str(%addr(H__2(68))):39:2306));
           wfrtn__ = AfToPage_(SUC_MSG);
           outweb_(%subst(%str(%addr(H__2(97))):25:1348));
          endif;
         endif;
        endif;
       endif;
      /end-free
     c     *PSSR         begsr
     c                   endsr
     P                 E


     P*---------------------------------------------------------------------
     P* getuser0...                 - User defined function
     P*---------------------------------------------------------------------
     P getuser0...
     P                 B
     D getuser0...
     D                 PI




      /free
       MCUST = %dec(aton_( getparm3_('MCUST':'*OPT'):46:16):9:0);
       MACCT = %dec(aton_( getparm3_('MACCT':'*OPT'):46:16):5:0);
       CCUST = MCUST;
       READ(NE)  RKWPSBASE;
       RS004_ = RcdSts2_('GETNXTRCD':%error:%found:%eof);
       AM004_ = CV_ByKey;
      /end-free
     C/Exec SQL
     C+  select * into :CustNameDS from table(FN_GetName(:mcust, :macct))
     C/End-Exec
      /free
      /end-free
     c     *PSSR         begsr
     c                   endsr
     P                 E


     P*---------------------------------------------------------------------
     P* escapeblanks0...            - User defined function
     P*---------------------------------------------------------------------
     P escapeblanks0...
     P                 B
     D escapeblanks0...
     D                 PI




      /free
       fieldLength = %len(%trimr( %trimr(workfield)));
       outfield = '';
       startPosition = 1;
       dow (startPosition< fieldLength);
       character = %subst(workfield:startPosition:1);
       if ((((character = '"') or (character = '#') or (character = ''''))));
        character = ' ';
       endif;
       if (character = ' ');
        outfield = %trim(outfield) + '%20';
       else;
        outfield = %trimr(outfield) + character;
       endif;
       startPosition = startPosition + 1;
       enddo;
       workfield = outfield;
      /end-free
     c     *PSSR         begsr
     c                   endsr
     P                 E


     P*---------------------------------------------------------------------
     P* splitfilename0...           - User defined function
     P*---------------------------------------------------------------------
     P splitfilename0...
     P                 B
     D splitfilename0...
     D                 PI




      /free
       strLen = %len(%trimr( %trim(pcpath)));
       position = strLen;
       dow (character <> '.');
       character = %subst(pcpath:position:1);
       position = position - 1;
       if (position = 0);
        leave;
       endif;
       enddo;
       position = position + 2;
       fileextension = %subst(pcpath:position:5);
       endPosition = position - 1;
       dow (character <> '\');
       character = %subst(pcpath:position:1);
       position = position - 1;
       if (position = 0);
        leave;
       endif;
       enddo;
       position = position + 1;
       strLen = endPosition - position;
       if (character = '\');
        strLen = strLen - 1;
        position = position + 1;
       endif;
       filename = %subst(pcpath:position:strLen);
       workfield = filename;
       escapeblanks0();
       filename = workfield;
      /end-free
     c     *PSSR         begsr
     c                   endsr
     P                 E


     P*---------------------------------------------------------------------
     P* emailsend0...               - User defined function
     P*---------------------------------------------------------------------
     P emailsend0...
     P                 B
     D emailsend0...
     D                 PI




      /free
       frmeml = 'mail@compass-technologies.com';
       apikey = '6c987672-8282-48fe-b7dd-f39209036fe0';
       AM014_ = CV_BYKEY;
       CHAIN(NE) DL014_ RKWSPOSTMK;
       RS014_ = RcdSts2_('GETRCD': %error: %found: %eof);
       if (RS014_ = '1');
        frmeml = pmemail;
        apikey = pmapikey;
       endif;
      /end-free
     C/Exec SQL
     C+  select KWK_PURL1 into :KWK_PURL1 from KWPDURL where KWK_PUTYPE='POST_SE
     C+ ND'
     C/End-Exec
      /free
      /end-free
     C/Exec SQL
     C+  select KWK_PURL1 into :PHPCLI from KWPDURL where KWK_PUTYPE='PHPCLI'
     C/End-Exec
      /free
       if (kwk_purl1 = ' ');
        kwk_purl1 = '/www/zendsvr/htdocs/wsphp/PostMark/sendemailKL.php';
       endif;
       if (phpcli = '');
        phpcli = '/usr/local/zendsvr/bin/php-cli';
       endif;
       subject = rplstr_(subject:%trim('"'):%trim('\"'));
       emlbody = rplstr_(emlbody:%trim('"'):%trim('\"'));
       subject = rplstr_(subject:%trim('&'):%trim('and'));
       if (((clientid = '107') or (clientid = '907')));
        nconst = 0;
        a_type = '';
        notep = 'Email ''' + %trim(subject) + ''' (subject) -- body: ''' +
       %trim( StripHtml_(emlbody)) + ''' was sent to  ''' + %trim(toeml) + '-
       ''.';
        huser = userid;
        parmcust = MCUST;
        parmacct = MACCT;
      /end-free
     C                   EVAL      QPGM__=%trim('KWWEB'     ) + '/' + 'POST_N-
     C                             OTE'
     C                   CALL      QPGM__                               90
     C                   PARM                    parmcust
     C                   PARM                    parmacct
     C                   PARM                    a_type
     C                   PARM                    nconst
     C                   PARM                    notep
     C                   PARM                    huser
     C                   IF        *IN90 = '1'
     C                   EVAL      LstPmlErr_ = 1
     C                   ELSE
     C                   EVAL      LstPmlErr_ = 0
     C                   ENDIF
      /free
       endif;
       command = %trim(phpcli) + ' ' + %trim(kwk_purl1) + '  "' + %trim(
       frmeml) + '" "' + %trim(toeml) + '" "' + %trim(subject) + '" "' +
       %trim(emlbody) + '" "' + %trim(path) + '" "' + %trim(type) + '" "' +
       %trim(apikey) + ' "> /dev/null';
      /end-free
     C                   EVAL      QPGM__=%trim('KWPGM'     ) + '/' + 'RUNQSH'
     C                   CALL      QPGM__                               90
     C                   PARM                    command
     C                   IF        *IN90 = '1'
     C                   EVAL      LstPmlErr_ = 1
     C                   ELSE
     C                   EVAL      LstPmlErr_ = 0
     C                   ENDIF
      /free
      /end-free
     C/Exec SQL
     C+  insert into kws_logpm (compclid, logpm_date, logpm_time, logpm_type, mc
     C+ ust, macct, pm_id, pm_message, logpm_to) values (:client, current date,
     C+ current time, 'EMAIL_SEND', :cust, :acct, :frmeml, :subject, :toeml)
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
     C                   MOVE      CURISOD__     CURYYMDN__
      /free
      /end-free
      /free
      /end-free
      /free
      /end-free
      /free
       CURISOD__ = %date();
      /end-free
      /free
       CURISOT__ = %time();
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
       if   ((file__='KWARCHIVE' or file__='*ALL') and NOT %OPEN(KWARCHIVE));
        if (mbr__ <> '*FIRST');
         ovrdbf_(ovrflag__:'KWARCHIVE':'KWARCHIVE' : '*LIBL' : mbr__);
        elseif ('KWARCHIVE' <> 'KWARCHIVE');
         ovrdbf_(ovrflag__:'KWARCHIVE':'KWARCHIVE' : '*LIBL');
        endif;
        if    erropen__ = 'Y';
         OPEN(E) KWARCHIVE;                //    KWARCHIVE
         if        %error;
          return %error;
         endif;
        else;
         OPEN KWARCHIVE;                //    KWARCHIVE
        endif;
       endif;
       if   ((file__='KWPDURL' or file__='*ALL') and NOT %OPEN(KWPDURL));
        if (mbr__ <> '*FIRST');
         ovrdbf_(ovrflag__:'KWPDURL':'KWPDURL' : '*LIBL' : mbr__);
        elseif ('KWPDURL' <> 'KWPDURL');
         ovrdbf_(ovrflag__:'KWPDURL':'KWPDURL' : '*LIBL');
        endif;
        if    erropen__ = 'Y';
         OPEN(E) KWPDURL;                //    KWPDURL
         if        %error;
          return %error;
         endif;
        else;
         OPEN KWPDURL;                //    KWPDURL
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
       if   ((file__='KWHLOAN' or file__='*ALL') and NOT %OPEN(KWHLOAN));
        if (mbr__ <> '*FIRST');
         ovrdbf_(ovrflag__:'KWHLOAN':'KWHLOAN' : '*LIBL' : mbr__);
        elseif ('KWHLOAN' <> 'KWHLOAN');
         ovrdbf_(ovrflag__:'KWHLOAN':'KWHLOAN' : '*LIBL');
        endif;
        if    erropen__ = 'Y';
         OPEN(E) KWHLOAN;                //    KWHLOAN
         if        %error;
          return %error;
         endif;
        else;
         OPEN KWHLOAN;                //    KWHLOAN
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
       if   ((file__='KWHNOTE' or file__='*ALL') and NOT %OPEN(KWHNOTE));
        if (mbr__ <> '*FIRST');
         ovrdbf_(ovrflag__:'KWHNOTE':'KWHNOTE' : '*LIBL' : mbr__);
        elseif ('KWHNOTE' <> 'KWHNOTE');
         ovrdbf_(ovrflag__:'KWHNOTE':'KWHNOTE' : '*LIBL');
        endif;
        if    erropen__ = 'Y';
         OPEN(E) KWHNOTE;                //    KWHNOTE
         if        %error;
          return %error;
         endif;
        else;
         OPEN KWHNOTE;                //    KWHNOTE
        endif;
       endif;
       if   ((file__='KWLSIGN' or file__='*ALL') and NOT %OPEN(KWLSIGN));
        if (mbr__ <> '*FIRST');
         ovrdbf_(ovrflag__:'KWLSIGN':'KWLSIGN' : '*LIBL' : mbr__);
        elseif ('KWLSIGN' <> 'KWLSIGN');
         ovrdbf_(ovrflag__:'KWLSIGN':'KWLSIGN' : '*LIBL');
        endif;
        if    erropen__ = 'Y';
         OPEN(E) KWLSIGN;                //    KWLSIGN
         if        %error;
          return %error;
         endif;
        else;
         OPEN KWLSIGN;                //    KWLSIGN
        endif;
       endif;
       if   ((file__='KW_ASIGN' or file__='*ALL') and NOT %OPEN(KW_ASIGN));
        if (mbr__ <> '*FIRST');
         ovrdbf_(ovrflag__:'KW_ASIGN':'KW_ASIGN' : '*LIBL' : mbr__);
        elseif ('KW_ASIGN' <> 'KW_ASIGN');
         ovrdbf_(ovrflag__:'KW_ASIGN':'KW_ASIGN' : '*LIBL');
        endif;
        if    erropen__ = 'Y';
         OPEN(E) KW_ASIGN;                //    KW_ASIGN
         if        %error;
          return %error;
         endif;
        else;
         OPEN KW_ASIGN;                //    KW_ASIGN
        endif;
       endif;
       if   ((file__='KWPSCONT' or file__='*ALL') and NOT %OPEN(KWPSCONT));
        if (mbr__ <> '*FIRST');
         ovrdbf_(ovrflag__:'KWPSCONT':'KWPSCONT' : '*LIBL' : mbr__);
        elseif ('KWPSCONT' <> 'KWPSCONT');
         ovrdbf_(ovrflag__:'KWPSCONT':'KWPSCONT' : '*LIBL');
        endif;
        if    erropen__ = 'Y';
         OPEN(E) KWPSCONT;                //    KWPSCONT
         if        %error;
          return %error;
         endif;
        else;
         OPEN KWPSCONT;                //    KWPSCONT
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
       if   ((file__='KWS_LOGPM' or file__='*ALL') and NOT %OPEN(KWS_LOGPM));
        if (mbr__ <> '*FIRST');
         ovrdbf_(ovrflag__:'KWS_LOGPM':'KWS_LOGPM' : '*LIBL' : mbr__);
        elseif ('KWS_LOGPM' <> 'KWS_LOGPM');
         ovrdbf_(ovrflag__:'KWS_LOGPM':'KWS_LOGPM' : '*LIBL');
        endif;
        if    erropen__ = 'Y';
         OPEN(E) KWS_LOGPM;                //    KWS_LOGPM
         if        %error;
          return %error;
         endif;
        else;
         OPEN KWS_LOGPM;                //    KWS_LOGPM
        endif;
       endif;
       if   ((file__='KWSPOSTMK' or file__='*ALL') and NOT %OPEN(KWSPOSTMK));
        if (mbr__ <> '*FIRST');
         ovrdbf_(ovrflag__:'KWSPOSTMK':'KWSPOSTMK' : '*LIBL' : mbr__);
        elseif ('KWSPOSTMK' <> 'KWSPOSTMK');
         ovrdbf_(ovrflag__:'KWSPOSTMK':'KWSPOSTMK' : '*LIBL');
        endif;
        if    erropen__ = 'Y';
         OPEN(E) KWSPOSTMK;                //    KWSPOSTMK
         if        %error;
          return %error;
         endif;
        else;
         OPEN KWSPOSTMK;                //    KWSPOSTMK
        endif;
       endif;
       if   ((file__='KWLTRAK' or file__='*ALL') and NOT %OPEN(KWLTRAK));
        if (mbr__ <> '*FIRST');
         ovrdbf_(ovrflag__:'KWLTRAK':'KWLTRAK' : '*LIBL' : mbr__);
        elseif ('KWLTRAK' <> 'KWLTRAK');
         ovrdbf_(ovrflag__:'KWLTRAK':'KWLTRAK' : '*LIBL');
        endif;
        if    erropen__ = 'Y';
         OPEN(E) KWLTRAK;                //    KWLTRAK
         if        %error;
          return %error;
         endif;
        else;
         OPEN KWLTRAK;                //    KWLTRAK
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
       when      rcdfmt__='RKWLTRAK' and AM015_ = CV_ByKey and RS015_ = *ON ;
       update RKWLTRAK;
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
Kwik-View
**CTDATA H__1        upload_app                       9075
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.or
g/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>
    <meta name="genera
tor" content="WebSmart" />
    <meta http-equiv="Pragma" content="no-cache" />

   <title>Upload Documents</title>
    <script type="text/javascript">
    var h
istory_api = typeof history.pushState !== 'undefined'

    // The previous page
asks that it not be returned to
    if (location.hash == '#no-back') {
        /
/ Push "#no-back" onto the history, making it the most recent "page"
        if
(history_api) history.pushState(null, '', '#stay')
        else location.hash =
'#stay'

        // When the back button is pressed, it will harmlessly change t
he url
        // hash from "#stay" to "#no-back", which triggers this function

            window.onhashchange = function () {
                // User tried to
 go back; warn user, rinse and repeat
                if (location.hash == '#no-
back') {
                    //alert("The previous webpage has expired and you m
ay not return to it.")
                    if (history_api) history.pushState(nu
ll, '', '#stay')
                    else location.hash = '#stay'

  }
            }
    }
	</script>
    <!-- standard stack.  these filese should
 be included in every program -->
    <link rel="stylesheet" type="text/css" hre
f="/k_com/bsLatest.css"><!-- bootstrap -->
    <link rel="stylesheet" type="text
/css" href="/k_com/bs-rLatest.css"><!-- bootstrap responsive file -->
    <link
rel="stylesheet" type="text/css" href="/k_com/bsCorrect.css"><!-- compass techno
logies modification file -->
    <link rel="stylesheet" type="text/css" href="/k
_com/faLatest.css"><!-- font awesome -->
    <link rel="stylesheet" type="text/c
ss" href="/k_com/jquery.fileupload-ui.css"><!-- font awesome -->    
    <script
 src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>

 <script src="//ajax.googleapis.com/ajax/libs/jqueryui/1.10.3/jquery-ui.min.js">
</script>
    <script type="text/javascript" src="/k_com/bsLatest.js"></script><
!-- bootstrap jquery file -->
    <script type="text/javascript" src="/k_com/jqu
ery.fileupload.js"></script><!-- bootstrap jquery file -->
    
    <!-- end sta
ndard stack -->
    
    <script type="text/javascript">

	function handleUpload
Submit()
	{
		if (document.getElementById('upfile').value == '')
		{
			alert('P
lease select a file to upload.');
			return;
		}
		if (document.getElementById('
description').value == '')
		{
			alert('Please enter a description.');
			docum
ent.getElementById('description').focus();
			return;
		}
			
		 if ($("#upfile"
).val() != "" && $("#description").val() != "")
    		{
    			$("#uploadbutton"
).text("Please wait...");
    			$("#uploadbutton").attr("disabled", "disabled")
;
    			$("#donebutton").attr("disabled", "disabled");
    			document.custinfo
.submit();
				//Sean Provost - 09/13/2013 - part of "back button" fix / auto-cl
ose new window opened when new app was started
				//setTimeout(function(){windo
w.close();},3000);	
    		}
	}
	
			function checkFromDlr() {
        if ("" ==
"Y") {
            set_height();
        }
    }
	
	function add_filename(id)
	{

		var filePath = $(id).val();
		if(filePath.match(/fakepath/)) {
			filePath =
filePath.replace(/C:\\fakepath\\/i, '');	
		}	
		
		$("#shortpath").val(filePath
);
		$('#upload-file-info').html(filePath);
		
	}
	
	function checkScroll()
	{
	
	window.parent.parent.scrollTo(0, 0);		
	}
	
	</script>
  </head>
  <body style=
"padding-top: 10px; background-color: #f7f7f7;" onload="checkFromDlr();checkScro
ll();">
    <div class="container-fluid">
      <form name="custinfo" method="po
st" action="#no-back" enctype="multipart/form-data" >
        
        <fieldset
>
        <input type="hidden" name="task" value="upload" />
        <input type
="hidden" name="vers" value="upload_app" />        
        <input type="hidden"
 name="showclose" value="" />
        <input type="hidden" name="isloandoc" id="
isloandoc" value="" />
        <input type="hidden" id="clid" name="clid" value=
"" />
        <input type="hidden" id="cust" name="cust" value="" />
        <in
put type="hidden" id="mcust" name="mcust" value="" />
        <input type="hidde
n" id="macct" name="macct" value="" />
        <input type="hidden" id="loannbr"
 name="loannbr" value="" />
        <input type="hidden" id="suc_msg" name="suc_
msg" value="" />
        <input type="hidden" name="CBP" id="CBP" value="" />

      <input type="hidden" name="shortpath" id="shortpath" value="">
        <in
put type="hidden" name="fromkdlr" id="fromkdlr" value="" />
        <input type=
"hidden" name="fromEmail" id="fromEmail" value="" />
        
        </fieldset
>
        
        
        <div id="error_alert" class="alert alert-block alert
-error" style="display: none;">
          <h4>There were errors with the upload!
</h4>
          <p id="error_msg"></p>
        </div>
        
        

<div class="row-fluid">
          <div class="span12">
            <h4>Your appl
ication is almost complete!</h4><hr>
            <p>Please upload a copy of your
 drivers license / state Id and any additional documentation that might aid Sun
shine State Credit in processing your application for extension of credit. <span
 style="font-weight: bold;">For example:</span> <span style="font-style: italic;
">Most recent Pay Stub, W2, Bank Statement, Mortgage Statement.</span><br></p>

         </div>
        </div>
        
        <div class="row-fluid" style="ma
rgin-top: 10px;">
          <div class="sect span12">
            <div class="se
ctNav"><h6>Choose a document to upload</h6></div>
            <div class="sectIn
ner">
              
              <div class="row-fluid">
                <div
class="span12">
                  <div class="control-group">

  <span class="btn btn-info fileinput-button" onclick="">

<span>Choose File...</span>
                      <input type="file" name="upfil
e" id="upfile" onchange="add_filename(this);">                      

         </span>
                    <span class="label label-info pull-right">A
llowed file types are .pdf, .jpg, .jpeg, .doc, .docx, .txt, and .html</span>
               
                    <br><br>
                    <span class="la
bel label-info" id="upload-file-info"></span>
                  </div>

       </div>
              </div>
              
              <div class="row-
fluid">
                <div class="span2 control-group">
                  <lab
el for="description" class="control-label" for="WPURP">File Description</label>

                  <select name="description" class ="input input-block-level" id
="description"/>
                  <option value=""></option>

<option value="DL">Driver's License</option>
                  <option value="PS
">Pay Stub</option>
                  <option value="W2">Most recent W2</option>

                  <option value="BS">Bank Statement</option>

<option value="MS">Mortgage Statement</option>
                  <option value="
OT">Other</option>
                  </select>
                </div>

      <div class="span4 control-group">
                  <label for="descriptio
n" class="control-label" for="addesc">Additional Description</label>

       <input type="text" class="input input-block-level" name="addesc" id="adde
sc" maxlength="50" size="50">
                </div>
              </div>
     
            </div>
            <div id="success_alert" class="alert alert-
block alert-success" style="display: none;">
              <h4>Upload Success</h
4>
              <p id="success_msg"></p>
            </div>
          </div><!-
- sect inner -->
        </div>
      </div>
      
      <div class="row-fluid"
>
        <div class="span6">
          <div class="control-group">

<button type="button" name="" id="donebutton" class="btn input-block-level btn-w
arning" onclick="back_to_app();">I'm Finished Uploading</button>
          </div
>
        </div>
        <div class="span6">
          <div class="control-group
">
            <button type="button" name="Upload" id="uploadbutton" class="btn
input-block-level btn-success" onclick="handleUploadSubmit();">Upload</button>

         </div>
        </div>
      </div>
      
    </form> 
  </div>	
  
  <
script type="text/javascript">
    function back_to_app()
    {
    	var mcust =
 $("#mcust").val();
    	
    	var macct = $("#macct").val();
    	//alert(mcust
 + " " + macct);
    	location.href='ssc_app.pgm?task=uploadfinish&mcust='+mcust
+'&macct='+macct+'&fromEmail=Y#no-back';	
    }
    $(document).ready(function (
) {
    	if($("#success_msg").text() != "")
    	{
    		$("#success_alert").sho
w();	
    	}
    	
    	if($("#error_msg").text() != "")
    	{
    		$("#error_
alert").show();	
    	}
  
  	});
  	function setHeight()
	{
		height = $('#wrap
per').outerHeight();
  		parent.setHeight(height);
  		$('#upfile').focus();	
	}

    </script>	
  
</body>
</html>

**CTDATA H__2        upload_main                      9052
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.or
g/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>
    <meta name="genera
tor" content="WebSmart" />
    <meta http-equiv="Pragma" content="no-cache" />

   <title>Upload Documents</title>
    
    <!-- standard stack.  these filese s
hould be included in every program -->
    <link rel="stylesheet" type="text/css
" href="/k_com/bsLatest.css"><!-- bootstrap -->
    <link rel="stylesheet" type=
"text/css" href="/k_com/bs-rLatest.css"><!-- bootstrap responsive file -->
    <
link rel="stylesheet" type="text/css" href="/k_com/bsCorrect.css"><!-- compass t
echnologies modification file -->
    <link rel="stylesheet" type="text/css" hre
f="/k_com/faLatest.css"><!-- font awesome -->
    <link rel="stylesheet" type="t
ext/css" href="/k_com/jquery.fileupload-ui.css"><!-- font awesome -->    
    <s
cript src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script
>
    <script src="//ajax.googleapis.com/ajax/libs/jqueryui/1.10.3/jquery-ui.min
.js"></script>
    <script type="text/javascript" src="/k_com/bsLatest.js"></scr
ipt><!-- bootstrap jquery file -->
    <script type="text/javascript" src="/k_co
m/jquery.fileupload.js"></script><!-- bootstrap jquery file -->
    
    <script
 type="text/javascript">
	function handleUploadSubmit()
	{
		if (document.getEle
mentById('upfile').value == '')
		{
			alert('Please select a file to upload.');

			return;
		}
		if (document.getElementById('description').value == '')
		{
		
	alert('Please enter a description.');
			document.getElementById('description')
.focus();
			return;
		}
			
		 if ($("#upfile").val() != "" && $("#description"
).val() != "")
    		{
    			$("#uploadbutton").text("Please wait...");
    			
$("#uploadbutton").attr("disabled", "disabled");
    			$("#donebutton").attr("d
isabled", "disabled");
    			document.custinfo.submit();

    		}
	}
	
			funct
ion checkFromDlr() {
        if ("" == "Y") {
            set_height();

}
    }
	
	function add_filename(id)
	{
		var filePath = $(id).val();
		if(fileP
ath.match(/fakepath/)) {
			filePath = filePath.replace(/C:\\fakepath\\/i, '');	

		}	
		
		$("#shortpath").val(filePath);
		$('#upload-file-info').html(filePath
);
		
	}
	
	function make_filters(){
				$('.alphanum_alphanum').keypress(functi
on(key) {
					key.charCode = Number(key.charCode);
					if((key.charCode > 64 &
& key.charCode < 91) || (key.charCode > 96 && key.charCode < 123) || (key.charCo
de > 47 && key.charCode < 58) || (key.charCode === 32) || (key.charCode === 0)){
}else{return false;}
				});
				
				$('.alphanum_alphaspace').keypress(functio
n(key) {
					key.charCode = Number(key.charCode);
					if((key.charCode > 64 &&
 key.charCode 
					< 91) || (key.charCode > 96 && key.charCode < 123) || (key.c
harCode === 32) || (key.charCode === 0)){}else{return false;}
				});
				
				$
('.alphanum_alpha').keypress(function(key) {
					key.charCode = Number(key.char
Code);
					if((key.charCode > 64 && key.charCode < 91) || (key.charCode > 96 &&
 key.charCode < 123) || (key.charCode === 0)){}else{return false;}
				});
				

				$('.alphanum_num').keypress(function(key) {
					key.charCode = Number(key.c
harCode);
					if((key.charCode < 48 || key.charCode > 57) && key.charCode !== 0
){return false;}
				});
				
				$('.alphanum_money').keypress(function(key) {

					key.charCode = Number(key.charCode);
					if((key.charCode > 47 && key.char
Code < 58) || (key.charCode === 46) || (key.charCode === 44) || (key.charCode ==
= 0)){}else{return false;}
				});
				
				$('.alphanum_date').keypress(functio
n(key) {
					key.charCode = Number(key.charCode);
					if((key.charCode < 47 ||
 key.charCode > 57) && key.charCode !== 0){return false;}
				});
				
				$('.a
lphanum_phone, .alphanum_tin').keypress(function(key) {
					key.charCode = Numb
er(key.charCode);
					if((key.charCode < 48 || key.charCode > 57) && (key.charC
ode !== 45 && key.charCode !== 0)){return false;}
				});
			}
	</script>
  </he
ad>
  <body style="padding-top: 10px; background-color: #f7f7f7;" onload="checkF
romDlr();make_filters();">
    <div class="container-fluid">
      <form name="c
ustinfo" method="post" action="" enctype="multipart/form-data" >
        

  <fieldset>
        <input type="hidden" name="task" value="upload" />

<input type="hidden" name="vers" value="upload_main" />
        <input type="hid
den" name="showclose" value="" />
        <input type="hidden" name="isloandoc"
id="isloandoc" value="" />
        <input type="hidden" id="clid" name="clid" va
lue="" />
        <input type="hidden" id="cust" name="cust" value="" />

 <input type="hidden" id="mcust" name="mcust" value="" />
        <input type="h
idden" id="macct" name="macct" value="" />
        <input type="hidden" id="loan
nbr" name="loannbr" value="" />
        <input type="hidden" id="suc_msg" name="
suc_msg" value="" />
        <input type="hidden" name="CBP" id="CBP" value="" /
>
        <input type="hidden" name="shortpath" id="shortpath" value="">

 <input type="hidden" name="fromkdlr" id="fromkdlr" value="" />
        <input t
ype="hidden" name="fromEmail" id="fromEmail" value="" />
        
        </fiel
dset>
        
        
        <div id="error_alert" class="alert alert-block a
lert-error" style="display: none;">
          <h4>There were errors with the upl
oad!</h4>
          <p id="error_msg"></p>
        </div>
        
        <div
class="row-fluid" style="margin-top: 10px;">
          <div class="sect span12">

            <div class="sectNav"><h6>Choose a document to upload</h6></div>

         <div class="sectInner">
              
              <div class="row-fl
uid">
                <div class="span12">
                  <div class="control
-group">
                    <span class="btn btn-info fileinput-button" onclick
="">
                      <span>Choose File...</span>
                      <in
put type="file" name="upfile" id="upfile" onchange="add_filename(this);">
               
                    </span>
                    <span class="lab
el label-info pull-right">Allowed file types are .pdf, .jpg, .jpeg, .doc, .docx,
 .txt, and .html</span>                            
                    <br><br>

                    <span class="label label-info" id="upload-file-info"></span
>
                    <br>
                  </div>
                </div>

         </div>
              
              <div class="row-fluid">

     <div class="span2 control-group">
                  <label for="description
" class="control-label" for="WPURP">File Description</label>
                  <
select name="description" class ="input input-block-level" id="description"/>

                <option value=""></option>
                  <option value="DL">
Driver's License</option>
                  <option value="PS">Pay Stub</option>

                  <option value="W2">Most recent W2</option>

<option value="BS">Bank Statement</option>
                  <option value="MS">
Mortgage Statement</option>
                  <option value="OT">Other</option>

                  </select>
                </div>
                <div class="s
pan4 control-group">
                  <label for="description" class="control-l
abel" for="addesc">Additional Description</label>
                  <input type=
"text" class="input input-block-level alphanum_alphanum" name="addesc" id="addes
c" maxlength="50" size="50">
                </div>
              </div>

     </div>
            <div id="success_alert" class="alert alert-block alert-s
uccess" style="display: none;">
              <h4>Upload Success</h4>

    <p id="success_msg"></p>
            </div>     
          </div><!-- sect i
nner -->
        </div>
      </div>
      
      <div class="row-fluid">

  <div class="span6">
          <div class="control-group">
            <button
type="button" name="" id="donebutton" class="btn input-block-level btn-warning"
onclick="back_to_app();">I'm Finished Uploading</button>
          </div>

  </div>
        <div class="span6">
          <div class="control-group">

       <button type="button" name="Upload" id="uploadbutton" class="btn input-bl
ock-level btn-success" onclick="handleUploadSubmit();">Upload</button>

 </div>
        </div>
      </div>
      
    </form> 
  </div>	
  
  <script t
ype="text/javascript">
    function back_to_app()
    {
    	var mcust = $("#mcu
st").val();
    	
    	var macct = $("#macct").val();
    	//alert(mcust + " " +
 macct);
    	location.href='ssc_up.pgm?clid=107&task=uploadfinish&mcust='+mcust
+'&macct='+macct;	
    }
    $(document).ready(function () {
    	if($("#success
_msg").text() != "")
    	{
    		$("#success_alert").show();	
    	}
    	

	if($("#error_msg").text() != "")
    	{
    		$("#error_alert").show();	
    	}

  
  	});
  	function setHeight()
	{
		height = $('#wrapper').outerHeight();

		parent.setHeight(height);
  		$('#upfile').focus();	
	}
    </script>	
  
</bo
dy>
</html>

**CTDATA H__3        finish                           3091
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.or
g/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>
    <meta name="genera
tor" content="WebSmart" />
    <meta http-equiv="Pragma" content="no-cache" />

   <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <t
itle>Upload Documents</title>
    <script type="text/javascript">
    var histor
y_api = typeof history.pushState !== 'undefined'

    // The previous page asks
that it not be returned to
    if (location.hash == '#no-back') {
        // Pus
h "#no-back" onto the history, making it the most recent "page"
        if (hist
ory_api) history.pushState(null, '', '#stay')
        else location.hash = '#sta
y'

        // When the back button is pressed, it will harmlessly change the ur
l
        // hash from "#stay" to "#no-back", which triggers this function

       window.onhashchange = function () {
                // User tried to go b
ack; warn user, rinse and repeat
                if (location.hash == '#no-back'
) {
                    //alert("The previous webpage has expired and you may no
t return to it.")
                    if (history_api) history.pushState(null, '
', '#stay')
                    else location.hash = '#stay'
                }

           }
    }
	</script>
    <!-- standard stack.  these filese should be i
ncluded in every program -->
    <link rel="stylesheet" type="text/css" href="/k
_com/bsLatest.css"><!-- bootstrap -->
    <link rel="stylesheet" type="text/css"
 href="/k_com/bs-rLatest.css"><!-- bootstrap responsive file -->
    <link rel="
stylesheet" type="text/css" href="/k_com/bsCorrect.css"><!-- compass technologie
s modification file -->
    <link rel="stylesheet" type="text/css" href="/k_com/
faLatest.css"><!-- font awesome -->
    <script type="text/javascript" src="/k_c
om/jqLatest.js"></script><!-- jquery -->
    <script type="text/javascript" src=
"/k_com/bsLatest.js"></script><!-- bootstrap jquery file -->
    <!-- end standa
rd stack -->
    
    <!-- custom stack.  thses files are used just on this webp
age -->
    <link rel="stylesheet" type="text/css" href="/websmart/kwik/custom/S
SC/css/datepicker.css"><!--- Date Picker--->
    <script type="text/javascript"
src="/websmart/kwik/custom/SSC/js/datepicker.js"></script><!--- Date Picker--->

    
    <!-- end custom stack -->
  </head>
  <body onload="">
    <div id="wra
pper">
      <div class="container-fluid">
        <div class="row-fluid">

     <div class="span12">
            <div class="alert alert-success">

      <h4>Success!</h4>
              Your files have successfully been uploaded
!<br><br>
            </div>
          </div>
        </div>
        <div class=
"row-fluid">
          <div class="span12" style="text-align:center;">

     <span style="font-style:italic;"></span>&#0153; - 
          </div>

 </div>
        
      </div>
    </div>
    <script type="text/javascript">


  function setHeight()
	{
		height = $('#wrapper').outerHeight();
  		parent.set
Height(height);	
	}
    </script>
  </body>
</html>

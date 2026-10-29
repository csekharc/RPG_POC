     H/TITLE  USE EPay Sale transaction
      * ProGen WebSmart Revision 28963
      * File overrides for compile command
      *__OV OVRDBF USAEPAYRSP USAEPAYRSP
      *__OV OVRDBF KWSUSAE    KWSUSAE
      *__OV OVRDBF USAEPAYP   USAEPAYP
      *__OV OVRDBF KWPSEFT    KWPSEFT
      *__OV OVRDBF KWPRULE    KWPRULE
      *__OV OVRDBF KWPDURL    KWPDURL
      *__   Following values are used to create the server program
      *__RO Pgm  lib KWWEB      Pgm  USAEPAYATH
      *__AG          WEBSMART
      *__CL          *OBJLIBNAM
      *__SQ
      *__BD ECRTBND204
      *===============================================================*
      * Path:   usaepayath.pdw
      * System: LAPTOP-R90Q9L4A
      * Project:Kwik-Loan
      * Set:    Interface
      * User:   mbergmann
      * Date Last Generated:   2018-08-24   18:41:56
      * Last Generated CRC: 20DA70B9 A7A04E7C 4F9798A0 524CFD65
      *===============================================================*
      */CPY *LIBL/PW_CSRC CPYRIGHT
      * File specifications
     FUSAEPAYRSPIF   E           K DISK    USROPN
     F                                     INFDS(FID001_   )
     FKWSUSAE   IF   E           K DISK    USROPN
     F                                     INFDS(FID002_   )
     FUSAEPAYP  IF   E           K DISK    USROPN
     F                                     INFDS(FID003_   )
     FKWPSEFT   IF   E           K DISK    USROPN
     F                                     INFDS(FID004_   )
     FKWPRULE   IF   E           K DISK    USROPN
     F                                     INFDS(FID005_   )
     FKWPDURL   IF   E           K DISK    USROPN
     F                                     INFDS(FID006_   )
     F                                     RENAME(RKWPDURL     :R__FMT01    )

     D PTL__           S             50    DIM(1) CTDATA PERRCD(1)
     D RTLLA__         S             11    DIM(180)

     D*+FLDDCL Field declarations


     D p_environment   S              3A
     D client          S              5A
     D clientno        S              5P 0
     D amount          S             10P 2
     D card            S             16P 0
     D exp             S              5A
     D cvv2            S              3P 0
     D cardholder      S            200A
     D street          S            100A
     D invoice         S             25A
     D description     S            100A
     D zip             S             10A
     D atida           S             11A
     D amounta         S             12A
     D carda           S             17A
     D cvv2a           S              4A
     D command         S           5000A
     D qshcommand      S           5000A
     D phploc          S            200A
     D usaepayloc      S            200A
     D result          S             10A
     D approved        S              5A
     D transactionid   S            100A
     D message         S            500A
     D errortxt        S            200A
     D clientn         S              5S 0
     D clienta         S              5A
     D usage           S             10A
     D usagea          S             25A
     D usaepayath      S              1A

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
     D rwcolor1__      S             32A   INZ('F0F0FF')
     D rwcolor2__      S             32A   INZ('FFFFFF')


     D TASKRAN__       S              1    INZ(*OFF)



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

     D QPGM__          S             21A
     D LstPmlErr_      S              4P 0 IMPORT
     D sale0...
     D                 PR

     D p_sys_env       S                   LIKE(kwk_purl1     )
     D p_sys_env1      S                   LIKE(kwk_purl1     )

      /COPY *LIBL/PW_CSRC,SUBPROT204
      /COPY *LIBL/PW_CSRC,GDPROTO
      /COPY *LIBL/PW_CSRC,JPROTO002

     D/COPY *LIBL/PW_USRC,usubproto

      * field renames


      /free
       // Register the condition handler. Provide pointer to Pgm status
       // data structure
       RegCndHdlr_(CndHdlrPtr: PSPtr__:  *omit);
       Pgm_Init_();
       Dfn_Pgmfs_();

      /end-free
     C     *ENTRY        PLIST
     C                   PARM                    amount
     C                   PARM                    card
     C                   PARM                    exp
     C                   PARM                    cvv2
     C                   PARM                    cardholder
     C                   PARM                    street
     C                   PARM                    zip
     C                   PARM                    invoice
     C                   PARM                    description
     C                   PARM                    approved
     C                   PARM                    transactionid
     C                   PARM                    message
     C                   PARM                    atid
     C                   PARM                    clientn
     C                   PARM                    clienta
     C                   PARM                    usage
      /free
       main__();
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
     C                   KFLD                    compclid
     C     DL003_        KLIST
     C                   KFLD                    usep_id
     C     DL006_        KLIST
     C                   KFLD                    kwk_putype
     C                   ENDSR


      * Subprocedures follow:
      *--------------------------------------------------------------------------------------------*
      * main__ - Contains the main function source code from the PML
      *--------------------------------------------------------------------------------------------*
     P main__          B
     D main__          PI

      /free
       // PML Start ----------------------------------
       phploc = '/usr/local/Zend/Core/bin/php';
       phploc = '/usr/local/zendsvr/bin/php-cli';
      /end-free
     C/Exec SQL
     C+  select KWK_PURL1 into :phploc from KWSURL where KWK_PUTYPE='PHPCLI'
     C/End-Exec
      /free
       usaepayloc = '/esdi/websmart/CCAuthorization/Usaepay/';
      /end-free
     C/Exec SQL
     C+  select psclient into :client from kwpsbase
     C/End-Exec
      /free
       clientno = %dec(aton_(client:46:16):46:16);
      /end-free
     C                   EVAL      QPGM__=%trim('*LIBL'     ) + '/' + 'SP_GET-
     C                             ENV'
     C                   CALL      QPGM__                               90
     C                   PARM                    client
     C                   PARM                    p_environment
     C                   PARM                    p_sys_env
     C                   PARM                    p_sys_env1
     C                   IF        *IN90 = '1'
     C                   EVAL      LstPmlErr_ = 1
     C                   ELSE
     C                   EVAL      LstPmlErr_ = 0
     C                   ENDIF
      /free
       if (task__ = 'DEFAULT');
        taskran__ = *ON;
        sale0();
       endif ;

       // PML End   ----------------------------------

      /end-free
     c     *PSSR         begsr
     c                   endsr
     P main__          E



     P*---------------------------------------------------------------------
     P* sale0...                    - User defined function
     P*---------------------------------------------------------------------
     P sale0...
     P                 B
     D sale0...
     D                 PI




      /free
       atid = rtv_nxt_cc_rsp_id#(clientno:0:'USAEPAYATH':' ':'I');
       encompclid = clienta;
       COMPCLID = %dec(aton_(clienta:46:16):46:16);
       cardholder = rplstr_(cardholder:%trim(''''):%trim(''''''));
       command = %trim(phploc) + ' ' + %trim(usaepayloc) + 'auth_only_cc.php -
       "' + %trim(%editc(atid:'P')) + '" "' + %trim(%editc(amount:'P')) + '" -
       "' + %trim(%editc(card:'P')) + '" "' + %trim(exp) + '" "' + %trim(
       %editc(cvv2:'P')) + '" "' + %trim(cardholder) + '" "' + %trim(street)
       + '" "' + %trim(zip) + '" "' + %trim(invoice) + '" "' + %trim(
       description) + '" "' + %trim(clienta) + '"';
       usaepayloc = %trim(usaepayloc) + 'auth_only_cc.php';
       phploc = %trim(phploc)+x'00';
       usaepayloc = %trim(usaepayloc)+x'00';
       atida = %trim( %trim(%editc(atid:'P')))+x'00';
       amounta = %trim( %trim(%editc(amount:'P')))+x'00';
       carda = %trim( %trim(%editc(card:'P')))+x'00';
       exp = %trim(exp)+x'00';
       cvv2a = %trim( %trim(%editc(cvv2:'P')))+x'00';
       cardholder = %trim(cardholder)+x'00';
       street = %trim(street)+x'00';
       zip = %trim(zip)+x'00';
       invoice = %trim(invoice)+x'00';
       description = %trim(description)+x'00';
       clienta = %trim(clienta)+x'00';
       usagea = %trim(usage)+x'00';
      /end-free
     C/Exec SQL
     C+  select pruleyesno into :usaepayath from kwprule where prulename = 'USAE
     C+ PAYAUTH'
     C/End-Exec
      /free
       if (usaepayath = 'N');
      /end-free
     C/Exec SQL
     C+  update USAEPAYRSP set ATRESULT = 'Approved', ATERROR = 'Approved', ATCV
     C+ V2RSLT = 'M', ATAVSRESLT = 'Y' where ATID = :ATID
     C/End-Exec
      /free
       else;
      /end-free
     C                   EVAL      QPGM__=%trim('QSYS'      ) + '/' + 'QP2SHELL'
     C                   CALL      QPGM__                               90
     C                   PARM                    phploc
     C                   PARM                    usaepayloc
     C                   PARM                    atida
     C                   PARM                    amounta
     C                   PARM                    carda
     C                   PARM                    exp
     C                   PARM                    cvv2a
     C                   PARM                    cardholder
     C                   PARM                    street
     C                   PARM                    zip
     C                   PARM                    invoice
     C                   PARM                    description
     C                   PARM                    clienta
     C                   PARM                    usagea
     C                   IF        *IN90 = '1'
     C                   EVAL      LstPmlErr_ = 1
     C                   ELSE
     C                   EVAL      LstPmlErr_ = 0
     C                   ENDIF
      /free
       endif;
      /end-free
     C/Exec SQL
     C+  select ATRESULTCD, ATRESULT, ATREFNUM  into :approved,:message,:transac
     C+ tionid from USAEPAYRSP where ATID=:ATID
     C/End-Exec
      /free
      /end-free
     C/Exec SQL
     C+  update USAEPAYRSP set ATPAREQ = :usage where ATID = :ATID
     C/End-Exec
      /free
       if (usage = '');
      /end-free
     C/Exec SQL
     C+  Select Usep_ID into :ATPAREQ from Usaepayp where Uesp_Activ = 'Y'
     C/End-Exec
      /free
       else;
      /end-free
     C/Exec SQL
     C+  Select Usep_ID into :ATPAREQ from Usaepayp t1  inner join KWPSEFT t2 on
     C+  USEP_Sourc = PEAUTHKEY where PEUSAGE = :usage
     C/End-Exec
      /free
       endif;
       if (atpareq <> '');
      /end-free
     C/Exec SQL
     C+  update USAEPAYRSP set ATPAREQ = :ATPAREQ where ATID = :ATID
     C/End-Exec
      /free
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

       // Initialize library list array for current job to find files
       rtlla__(1) = 'KWSYS';
       rtlla__(2) = 'KWDB108';
       rtlla__(3) = 'KWDB';

       // Set the runtime library for support object references.
       // Also, determine job type
       jobtype__ = SetRtLib_('XL_WEBSPT');

       // Register the condition handler. Use a pointer to the
       // pgm status data structure
       RegCndHdlr_(CndHdlrPtr:  PSPtr__: *omit);
       task__ = 'DEFAULT';

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
       if   ((file__='USAEPAYRSP' or file__='*ALL') and NOT %OPEN(USAEPAYRSP));
        if (mbr__ <> '*FIRST');
         ovrdbf_(ovrflag__:'USAEPAYRSP':'USAEPAYRSP' : '*LIBL' : mbr__);
        elseif ('USAEPAYRSP' <> 'USAEPAYRSP');
         ovrdbf_(ovrflag__:'USAEPAYRSP':'USAEPAYRSP' : '*LIBL');
        endif;
        if    erropen__ = 'Y';
         OPEN(E) USAEPAYRSP;                //    USAEPAYRSP
         if        %error;
          return %error;
         endif;
        else;
         OPEN USAEPAYRSP;                //    USAEPAYRSP
        endif;
       endif;
       if   ((file__='KWSUSAE' or file__='*ALL') and NOT %OPEN(KWSUSAE));
        if (mbr__ <> '*FIRST');
         ovrdbf_(ovrflag__:'KWSUSAE':'KWSUSAE' : '*LIBL' : mbr__);
        elseif ('KWSUSAE' <> 'KWSUSAE');
         ovrdbf_(ovrflag__:'KWSUSAE':'KWSUSAE' : '*LIBL');
        endif;
        if    erropen__ = 'Y';
         OPEN(E) KWSUSAE;                //    KWSUSAE
         if        %error;
          return %error;
         endif;
        else;
         OPEN KWSUSAE;                //    KWSUSAE
        endif;
       endif;
       if   ((file__='USAEPAYP' or file__='*ALL') and NOT %OPEN(USAEPAYP));
        if (mbr__ <> '*FIRST');
         ovrdbf_(ovrflag__:'USAEPAYP':'USAEPAYP' : '*LIBL' : mbr__);
        elseif ('USAEPAYP' <> 'USAEPAYP');
         ovrdbf_(ovrflag__:'USAEPAYP':'USAEPAYP' : '*LIBL');
        endif;
        if    erropen__ = 'Y';
         OPEN(E) USAEPAYP;                //    USAEPAYP
         if        %error;
          return %error;
         endif;
        else;
         OPEN USAEPAYP;                //    USAEPAYP
        endif;
       endif;
       if   ((file__='KWPSEFT' or file__='*ALL') and NOT %OPEN(KWPSEFT));
        if (mbr__ <> '*FIRST');
         ovrdbf_(ovrflag__:'KWPSEFT':'KWPSEFT' : '*LIBL' : mbr__);
        elseif ('KWPSEFT' <> 'KWPSEFT');
         ovrdbf_(ovrflag__:'KWPSEFT':'KWPSEFT' : '*LIBL');
        endif;
        if    erropen__ = 'Y';
         OPEN(E) KWPSEFT;                //    KWPSEFT
         if        %error;
          return %error;
         endif;
        else;
         OPEN KWPSEFT;                //    KWPSEFT
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

       // Close all files and shut down program:
       if ovrflag__ = '1';
        ExecCmd2_('dltovr file(*all)':17);
       endif;
       Shutdown_();                          //     Shut down completely

      /end-free
     P Exit_Immed_     E







      *+CTARRS Compile-time Arrays go here:
**CTDATA PTL__      Program title contents
USE EPay Sale transaction

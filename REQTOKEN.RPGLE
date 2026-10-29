     H/TITLE  Request Recipient Token
      * ProGen WebSmart Revision 28963
      * File overrides for compile command
      *__OV OVRDBF KWPDURL    KWPDURL
      *__   Following values are used to create the server program
      *__RO Pgm  lib KWWEB      Pgm  REQTOKEN
      *__AG          WEBSMART
      *__CL          *OBJLIBNAM
      *__SQ
      *__BD ECRTBND204
      *===============================================================*
      * Path:   REQTOKEN.pdw
      * System: REGGIE-LENOVO
      * Project:Kwik-Loan
      * Set:    DocuSignDev
      * User:   Reggie
      * Date Last Generated:   2018-09-28   07:44:02
      * Last Generated CRC: BE787C83 A01A6CEE 4A767372 3964EAE5
      *===============================================================*
      */CPY *LIBL/PW_CSRC CPYRIGHT
      * File specifications
     FKWPDURL   IF   E           K DISK    USROPN
     F                                     INFDS(FID001_   )

     D PTL__           S             50    DIM(1) CTDATA PERRCD(1)
     D RTLLA__         S             11    DIM(180)

     D*+FLDDCL Field declarations


     D header          S            200A
     D postdata        S            500A
     D postdest        S            500A
     D post_ret        S              3P 0
     D usepost         S              1A
     D client          S              9P 0
     D customer        S              9P 0
     D customera       S             10A
     D envelopeid      S            100A
     D command         S           1000A
     D errortext       S            512A
     D path            S            500A
     D status          S             15A
     D token           S            300A
     D phpcli          S            200A
     D clienta         S             10A
     D error_output    S             10I 0
     D ds_env_a        S            200A
     D ds_env          S            200A

     D RS001_          S              1A
     D AM001_          S              1A


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


     D H__1            S             80    PERRCD(1) CTDATA DIM(11          )


     D* File info DS for each file
     D FID001_         DS
     D  RR_001_              397    400B 0


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

     D generic0...
     D                 PR
     D QPGM__          S             21A
     D LstPmlErr_      S              4P 0 IMPORT
     D GetUrl2_        PR            10I 0
     D  peURL                      1024A   const
     D  peFileName                  256A   const
     D  peTimeout                    10I 0 value
     D  peHeaders                  8190A   const
     D PostUrl3_       PR            10I 0
     D  peURL                       256A   const
     D  pePostData                     *   value
     D  pePostDataLen                10I 0 value
     D  peFilename                  256A   const
     D  peTimeout                    10I 0 value
     D  peHeaders                  8190A   const
     D  peRemoteCCSID                 5U 0 value
     D  peLocalCCSID                  5U 0 value
     D  peFileCCSID                   5U 0 value
     D HTTP_SetCCSIDs  PR            10I 0
     D   pePostRem                   10I 0 value
     D   pePostLoc                   10I 0 value
     D   peProtRem                   10I 0 value options(*nopass)
     D   peProtLoc                   10I 0 value options(*nopass)
     D HTTP_SetfileCCSID...
     D                 PR
     D   peCCSID                     10I 0 value
     D InitSSL2_       PR            10I 0
     D  peAppID                     100A   const
     D LstPmlEtx_      S            256A   IMPORT

     D kwk_purl1a      S                   LIKE(kwk_purl1     )
     D sys_url         S                   LIKE(kwk_purl1     )

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
     C                   PARM                    customer
     C                   PARM                    client
     C                   PARM                    envelopeid
     C                   PARM                    token
     C                   PARM                    errortext
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

     C                   ENDSR


      * Subprocedures follow:
      *--------------------------------------------------------------------------------------------*
      * main__ - Contains the main function source code from the PML
      *--------------------------------------------------------------------------------------------*
     P main__          B
     D main__          PI

      /free
       // PML Start ----------------------------------

      /end-free
     C/Exec SQL
     C+  select kwk_purl1 into :sys_url from kwpdurl where kwk_putype = 'SYS_ENV
     C+ '
     C/End-Exec
      /free
       usepost = 'N';
       if (task__ = 'DEFAULT');
        taskran__ = *ON;
        generic0();
       endif ;
      /end-free
     C/Exec SQL
     C+  select KWK_PURL1 into :sys_url from KWPDURL where KWK_PUTYPE='SYS_ENV'
     C/End-Exec
      /free

       // PML End   ----------------------------------

      /end-free
     c     *PSSR         begsr
     c                   endsr
     P main__          E



     P*---------------------------------------------------------------------
     P* generic0...                 - User defined function
     P*---------------------------------------------------------------------
     P generic0...
     P                 B
     D generic0...
     D                 PI




      /free

      /end-free
     C/Exec SQL
     C+  select KWK_PURL1 into :KWK_PURL1 from KWPDURL where KWK_PUTYPE='ESIGN_P
     C+ HP'
     C/End-Exec
      /free
      /end-free
     C/Exec SQL
     C+  select KWK_PURL1 into :PHPCLI from KWPDURL where KWK_PUTYPE='ESIGN_PHPC
     C+ LI'
     C/End-Exec
      /free
       if (((client = 108) or (client = 908)));
        header = 'MIME-Version: 1.0'+x'0D'+''+x'25'+'		Content-type: applicat-
       ion/json'+x'0D'+''+x'25'+'		Accept: application/json'+x'0D'+''+x'25'+'-
       		';
        if (usepost = 'Y');
         postdest = %trim(sys_url) + '/odysseus/ds/requestrecipienttoken.php';
         postdata = '{"cust":"' + %trim(%editc(customer:'P')) + '","clid":"'
       + %trim(%editc(client:'P')) + '","envID":"' + %trim(envelopeid) + '"}';
         post_ret = PostUrl3_(postdest:%addr(postdata):%len(%trim(postdata)):
       '/www/kwik/htdocs/odysseus/ds/logs/kwikdealer/rrt_posturl_in.txt':90:
       header:819:0:819);
        else;
      /end-free
     C/Exec SQL
     C+  select KWK_PURL1 into :PHPCLI from KWPDURL where KWK_PUTYPE='ESIGN_PHPC
     C+ LI'
     C/End-Exec
      /free
         kwk_purl1 = '';
      /end-free
     C/Exec SQL
     C+  select KWK_PURL1 into :KWK_PURL1 from KWPDURL where KWK_PUTYPE='DS_TOKE
     C+ N'
     C/End-Exec
      /free
         if (kwk_purl1 <> '');
          kwk_purl1a = %trim( %trim(kwk_purl1))+x'00';
         else;
          kwk_purl1a = %trim('/www/kwik/htdocs/odysseus/ds/requestrecipientto-
       ken.php')+x'00';
         endif;
         phpcli = %trim( %trim(phpcli))+x'00';
         clienta = %trim( %trim(%editc(client:'P')))+x'00';
         customera = %trim( %trim(%editc(customer:'P')))+x'00';
         ds_env_a = %trim(envelopeid)+x'00';
      /end-free
     C                   EVAL      QPGM__=%trim('QSYS'      ) + '/' + 'QP2SHELL'
     C                   CALL      QPGM__                               90
     C                   PARM                    phpcli
     C                   PARM                    kwk_purl1a
     C                   PARM                    customera
     C                   PARM                    clienta
     C                   PARM                    ds_env_a
     C                   PARM                    customera
     C                   IF        *IN90 = '1'
     C                   EVAL      LstPmlErr_ = 1
     C                   ELSE
     C                   EVAL      LstPmlErr_ = 0
     C                   ENDIF
      /free
         post_ret = 1;
        endif;
        if (post_ret = -1);
        endif;
        if (post_ret = 0);
        endif;
        if (post_ret >= 1);
        endif;
       else;
        errortext = '';
        command = 'QSH CMD(''' + %trim(phpcli) + ' ' + %trim(kwk_purl1) + 'Re-
       questRecipientToken.php ' + %trim(%editc(customer:'P')) + ' ' + %trim(
       %editc(client:'P')) + ' "' + %trim(envelopeid) + '" '')';
        ExecCmd2_(command:%len(%trimr(command)));
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
       rtlla__(1) = 'KWDB';

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











      *++++++++++++++++++++++++++++++++++++++++++++++++
      * GetUrl2_ - Retrieve an HTTP document (to a file)
      *++++++++++++++++++++++++++++++++++++++++++++++++
     P GetUrl2_        B
     D GetUrl2_        PI            10I 0
     D  peURL                      1024A   const
     D  peFileName                  256A   const
     D  peTimeout                    10I 0 value
     D  peHeaders                  8190A   const

     D  rtnval         S             10I 0
     D  int01__        S             10I 0

     C                   eval      rtnval = GetUrl_(
     C                             peURL:
     C                             peFileName:
     C                             peTimeout:
     C                             peHeaders)
     C                   if        rtnval < 1
     C                   eval      lstpmletx_ = http_error_(int01__)
     C                   eval      lstpmlerr_ = int01__
     C                   else
     C                   eval      lstpmletx_ = ''
     C                   eval      lstpmlerr_ = 0
     C                   endif

     C                   return    rtnval

     P                 E

      *+++++++++++++++++++++++++++++++++++++++++++++++++
      * PostUrl3_ - Retrieve an HTTP document using POST
      *+++++++++++++++++++++++++++++++++++++++++++++++++
     P PostUrl3_       B
     D PostUrl3_       PI            10I 0
     D  peURL                       256A   const
     D  pePostData                     *   value
     D  pePostDataLen                10I 0 value
     D  peFilename                  256A   const
     D  peTimeout                    10I 0 value
     D  peHeaders                  8190A   const
     D  peRemoteCCSID                 5U 0 value
     D  peLocalCCSID                  5U 0 value
     D  peFileCCSID                   5U 0 value

     D  rtnval         S             10I 0
     D  int01__        S             10I 0

     C/free
       Http_SetCCSIDs(peRemoteCCSID:pelocalCCSID);
       HTTP_SetFileCCSID(pefileCCSID);
      /end-free
     C                   eval      rtnval = PostUrl_(
     C                             peURL:
     C                             pePostData:
     C                             pePostDataLen:
     C                             peFilename:
     C                             peTimeout:
     C                             peHeaders)
     C                   if        rtnval < 1
     C                   eval      lstpmletx_ = http_error_(int01__)
     C                   eval      lstpmlerr_ = int01__
     C                   else
     C                   eval      lstpmletx_ = ''
     C                   eval      lstpmlerr_ = 0
     C                   endif

     C                   return    rtnval

     P                 E

      *++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
      * InitSSL2 - Initialize SSL
      *++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
     P InitSSL2_       B
     D InitSSL2_       PI            10I 0
     D  peAppID                     100A   const

     D  rtnval         S             10I 0
     D  int01__        S             10I 0

     C                   eval      rtnval = https_init_(peAppID)
     C                   if        rtnval = -1
     C                   eval      lstpmletx_ = http_error_(int01__)
     C                   eval      lstpmlerr_ = int01__
     C                   endif

     C                   return    rtnval

     P                 E



      *+CTARRS Compile-time Arrays go here:
**CTDATA PTL__      Program title contents
Request Recipient Token
**CTDATA H__1        MainSeg                          830
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.or
g/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>
    <meta name="genera
tor" content="WebSmart" />
    <meta http-equiv="Pragma" content="no-cache" />

   <title>DocuSign Notification Handler</title>
    
    <link rel="stylesheet"
type="text/css" href="/websmart/v8.8/Idaho/css/screen.css" media="screen, tv, pr
ojection" />
    <link rel="stylesheet" type="text/css" href="/websmart/v8.8/Ida
ho/css/print.css" media="print" />
    <script type="text/javascript" src="/webs
mart/v8.8/javascript/jquery.min.js"></script>
  </head>
  <body>
    <div id="pa
getitle" class="pagetitle"> DocuSign Notification Handler </div>
    <div id="pa
getitleborder"></div>
    
    <div id="contents"> 
      Enter Content Here

 </div>
    
  </body>
</html>

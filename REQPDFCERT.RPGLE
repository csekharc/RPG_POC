     H/TITLE  Request Document
      * ProGen WebSmart Revision 21178
      * File overrides for compile command
      *__OV OVRDBF KWPDURL    KWPDURL
      *__OV OVRDBF KWLBASE    KWLBASE
      *__   Following values are used to create the server program
      *__RO Pgm  lib KWWEB      Pgm  REQPDFCERT
      *__AG          WEBSMART
      *__CL          *OBJLIBNAM
      *__SQ
      *__BD ECRTBND187
      *===============================================================*
      * Path:   REQPDFCERT.pdw
      * System: SEAN5FC9
      * Project:Kwik-Loan
      * Set:    DocuSignDev
      * User:   sean
      * Date Last Generated:   2016-02-09   15:00:15
      * Last Generated CRC: 422ACDB8 35DD29BF C12AE5E3 25AAB0FF
      *===============================================================*
      */CPY *LIBL/PW_CSRC CPYRIGHT
      * File specifications
     FKWPDURL   IF   E           K DISK    USROPN
     F                                     INFDS(FID001_   )
     FKWLBASE   IF   E           K DISK    USROPN
     F                                     INFDS(FID002_   )

     D PTL__           S             50    DIM(1) CTDATA PERRCD(1)
     D RTLLA__         S             11    DIM(180)

     D*+FLDDCL Field declarations


     D client          S              9P 0
     D envelopeid      S            100A
     D seqnum          S             20P 0
     D filename        S            500A
     D command         S           1000A
     D errortext       S            512A
     D path            S            500A
     D x               S              3P 0
     D phpcli          S            200A
     D signer_cnt      S              9P 0
     D doc_type        S             10A
     D doc_desc        S             25A
     D wpappa10        S             50A
     D clienta         S             10A

     D RS001_          S              1A
     D AM001_          S              1A
     D RS002_          S              1A
     D AM002_          S              1A


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
     D FID002_         DS
     D  RR_002_              397    400B 0


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
     D CURISOD__       S               D   DATFMT(*ISO) INZ(*SYS)
     D CURISOT__       S               T   TIMFMT(*ISO) INZ(*SYS)

     D date            S                   LIKE(CURISOD__     )
     D time            S                   LIKE(CURISOT__     )
     D kwk_purl1a      S                   LIKE(kwk_purl1     )

      /COPY *LIBL/PW_CSRC,SUBPROT187
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
     C                   PARM                    client
     C                   PARM                    envelopeid
     C                   PARM                    mcust
     C                   PARM                    macct
     C                   PARM                    wpappa10
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
       if (task__ = 'DEFAULT');
        taskran__ = *ON;
        generic0();
       endif ;

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
       seqnum = kw_getnextarch('ARCHIVE');
       filename = '/clientdata/secure/' + %trim(%editc(client:'P')) + '/docs/';
       filename = %trim(filename) + %trim(%editc(seqnum:'P'));
       filename = %trim(filename) + '.pdf';
       date = CURISOD__;
       time = CURISOT__;
       if (wpappa10 = 'Y');
        doc_type = 'CRA';
       else;
        doc_type = 'RIC_ACH';
       endif;
       doc_desc = 'Document Packet ' + %trim(doc_type);
      /end-free
     C/Exec SQL
     C+  insert into KWARCHIVE (ARCUST,ARDATE,ARTIME,ARACCT,ARDOCDESC,ARARCPATH,
     C+ ARERRTXT,ARDOCID) values (:MCUST,:date,:time,:MACCT,:doc_desc,:filename,
     C+ ' ','PDFCERT') with NC
     C/End-Exec
      /free
       ExecCmd2_( 'QSH CMD(''' + %trim(phpcli) + ' ' + %trim(kwk_purl1) + 'Re-
       questPDFWithCert.php ' + %trim(%editc(client:'P')) + ' "' + %trim(
       envelopeid) + '" "' + %trim(filename) + '"'')':%len(%trimr( 'QSH CMD(-
       ''' + %trim(phpcli) + ' ' + %trim(kwk_purl1) + 'RequestPDFWithCert.php-
        ' + %trim(%editc(client:'P')) + ' "' + %trim(envelopeid) + '" "' +
       %trim(filename) + '"'')')));
       if (client = 126);
        ExecCmd2_( 'QSH CMD(''' + %trim(phpcli) + ' /esdi/php/monterey/mont_s-
       ftp.php ' + %trim(%editc(mcust:'P')) + ' ' + %trim(%editc(macct:'P'))
       + ' ' + %trim(filename) + ' ' + %trim(doc_type) + ' > /dev/null'')':
       %len(%trimr( 'QSH CMD(''' + %trim(phpcli) + ' /esdi/php/monterey/mont_-
       sftp.php ' + %trim(%editc(mcust:'P')) + ' ' + %trim(%editc(macct:'P'))
        + ' ' + %trim(filename) + ' ' + %trim(doc_type) + ' > /dev/null'')'))
       );
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
      /free
       CURISOD__ = %date();
      /end-free
      /free
       CURISOT__ = %time();

       // Initialize library list array for current job to find files
       rtlla__(1) = 'KWDB999';
       rtlla__(2) = 'KWDB';

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
Request Document
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

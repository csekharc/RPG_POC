     H/TITLE  Upload Documents
      * ProGen WebSmart Revision 21923
      * File overrides for compile command
      *__OV OVRDBF X_IN       X_IN
      *__OV OVRDBF X_UP       X_UP
      *__   Following values are used to create the server program
      *__RO Pgm  lib KWWEB      Pgm  X_EXCH
      *__AG          WEBSMART
      *__CL          *OBJLIBNAM
      *__BD ECRTBND195
      *===============================================================*
      * Path:   X_EXCH.pdw
      * System: LAPTOP-Q2C0JE89
      * Project:Kwik-Loan
      * Set:    Development
      * User:   tvrba
      * Date Last Generated:   2017-07-17   08:45:28
      * Last Generated CRC: 78BC2D3B 8C21CC71 0E49E4E9 3200FD5E
      *===============================================================*
      */CPY *LIBL/PW_CSRC CPYRIGHT
      * File specifications
     FX_IN      IF A E           K DISK    USROPN
     F                                     INFDS(FID001_   )
     FX_UP      IF A E           K DISK    USROPN
     F                                     INFDS(FID002_   )

     D PTL__           S             50    DIM(1) CTDATA PERRCD(1)
     D RTLLA__         S             11    DIM(180)

     D*+FLDDCL Field declarations

     Duserdata         DS                  INZ
     D client                         5A
     D userid                        32A
     D location                       5A

     D task            S            100A
     D path            S            500A
     D confirmmsg      S            200A
     D p_ztype         S             15A
     D boxname         S             10A
     D boxid           S             10A
     D boxselect       S             25A
     D boxtype         S             10A
     D jvalidation     S             30A
     D outfield        S            200A
     D linktext        S            200A
     D resp            S            200A
     D isvalid         S              1A
     D statusdisplay   S             20A
     D forgot          S              1A
     D erremail        S            100A
     D rtncd           S              1A
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
     D pagenum         S              5S 0
     D forgotdsp       S             10A
     D endposition     S              4S 0
     D isloandoc       S              1A
     D soshow          S             10A
     D closeshow       S             10A
     D solink          S            200A
     D x               S              1P 0
     D flag            S             10A
     D closebutton     S              1A
     D startpos        S              4P 0
     D endpos          S              4P 0
     D strlength       S              4P 0
     D index           S              4P 0
     D rmvlength       S              4P 0
     D dw              S              1A
     D emailerror      S            100A
     D workfield       S            100A
     D dfile           S             10I 0
     D tmpfile         S             10I 0
     D myfile          S             10I 0
     D lastpgm         S             20A
     D artncod         S              5A
     D a_conv          S             11A
     D a_test          S              1A

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


     D H__1            S             80    PERRCD(1) CTDATA DIM(50          )


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

     D uploadfile0...
     D                 PR
     D QPGM__          S             21A
     D LstPmlErr_      S              4P 0 IMPORT
     D uploadpage0...
     D                 PR
     D splitfilename0...
     D                 PR
     D checkdw0...
     D                 PR
     D escapeblanks0...
     D                 PR
     D CURISOD__       S               D   DATFMT(*ISO) INZ(*SYS)
     D CURYYMDN__      S              8P 0
     D LstPmlEtx_      S            256A   IMPORT
     D CURISOT__       S               T   TIMFMT(*ISO) INZ(*SYS)
     D QPGMNAM__       S             20A
     D SmurfChk__      S              1A   INZ(*ON)
     D Smurf_ID__      S             64A   IMPORT
     D Smurf_Rw__      S              9B 0 IMPORT

     D uploadmsg2      S                   LIKE(uploadmsg     )
     D position        S                   LIKE(strlen        )
     D startposition   S                   LIKE(fieldlength   )

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
     C                   KFLD                    in_client
     C     DL002_        KLIST
     C                   KFLD                    in_client
     C                   KFLD                    in_conv
     C     convkey       KLIST
     C                   KFLD                    in_client
     C                   KFLD                    in_conv
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
       ExecCmd2_('ADDLIBLE LIB(KWEXCHANGE) POSITION(*LAST) ':%len(%trimr('ADD-
       LIBLE LIB(KWEXCHANGE) POSITION(*LAST) ')));
       Open_File_('*ALL': '*FIRST':  'Y');
       if (task__ = 'DEFAULT');
        taskran__ = *ON;
        uploadpage0();
       endif ;
       if (task__ = 'UPLOADFILE');
        taskran__ = *ON;
        uploadfile0();
       endif ;
       if (task__ = 'UPLOADPAGE');
        taskran__ = *ON;
        uploadpage0();
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
     P* uploadfile0...              - User defined function
     P*---------------------------------------------------------------------
     P uploadfile0...
     P                 B
     D uploadfile0...
     D                 PI




      /free
       description = getparm3_('description':'*OPT');
       if (description = '');
        uploadmsg = 'Please enter a file description.';
        checkdw0();
       else;
        tgtdir = '/clientdata/secure/' + %trim(client) + '/uploads/';
        pcpath = getparm3_('upfile':'*OPT');
        if (pcpath = '');
         uploadmsg = 'Please select a file to upload.';
         checkdw0();
        else;
         splitfilename0();
         if ( %XLATE(lo__:up__:fileextension) <> 'CSV');
          uploadmsg = 'Invalid file type: .' + fileextension + ' Allowed file-
        types are .csv';
          checkdw0();
          description = '';
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
         in_file = pcpath;
         ifspath = getparm3_('upfile-file':'*OPT');
         pcpath = %trim(tgtdir) + %trim(pcpath);
         LSTPMLERR_ = 0;
         tmpFile = fopen_(ifspath:200: 'rb':%len('rb'));
         myFile = fopen_(pcpath:500: 'w+b,codepage=437':%len('w+b,codepage=43-
       7'));
         if (LSTPMLERR_ <> 0);
          uploadmsg = 'File upload failed: ' + LSTPMLETX_;
          checkdw0();
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
         in_client = client;
         IN_CONV = 99999999999;
         SETLL  convkey RXIN;
         RS001_ = RcdSts2_('POSRCD':%error:%equal:%eof);
         READPE(NE) DL001_ RXIN;
         RS001_ = RcdSts2_('GETPRVRCD': %error: %found: %eof);
         AM001_ = CV_ByKey;
         if (RS001_ = '1');
          IN_CONV = IN_CONV + 1;
         else;
          IN_CONV = 1;
         endif;
         in_clear = 'N';
         in_test = '';
         in_vend = 'KWIK';
         WRITE RXIN;
         RS001_ = RcdSts2_('WRTRCD': %error: %found: %eof);
         IN_DATE = CURISOD__;
         IN_TIME = CURISOT__;
         in_ipaddr = getevar2_('REMOTE_ADDR');
         description = rplstr_( rplstr_(description:%trim('\'):%trim('\\')):
       %trim(''''):%trim('\'''));
         IN_BR = 1;
         IN_SEQ = 1;
         in_type = 'EXCHANGE';
         in_desc = description;
         in_path = pcpath;
         WRITE RXUP;
         RS002_ = RcdSts2_('WRTRCD': %error: %found: %eof);
      /end-free
     C                   MOVEL     IN_CONV       a_conv
      /free
      /end-free
     C                   EVAL      QPGM__=%trim('KWEXCHANGE') + '/' + 'X_IMPORT'
     C                   CALL      QPGM__                               90
     C                   PARM                    userid
     C                   PARM                    in_client
     C                   PARM                    a_conv
     C                   PARM                    a_test
     C                   IF        *IN90 = '1'
     C                   EVAL      LstPmlErr_ = 1
     C                   ELSE
     C                   EVAL      LstPmlErr_ = 0
     C                   ENDIF
      /free
        endif;
        if (LSTPMLERR_ <> 0);
         Alert_('Error(s) occurred archiving this file.');
        endif;
        uploadmsg = description + 'successfully uploaded!';
        uploadmsg2 = 'Please select additional documents to upload or press R-
       eturn to return to Archived Documents list.';
        description = '';
        checkdw0();
       endif;
      /end-free
     c     *PSSR         begsr
     c                   endsr
     P                 E


     P*---------------------------------------------------------------------
     P* uploadpage0...              - User defined function
     P*---------------------------------------------------------------------
     P uploadpage0...
     P                 B
     D uploadpage0...
     D                 PI




      /free
       outweb_(%subst(%str(%addr(H__1(1))):1:2443));
       wfrtn__ = AfToPage_(QPGMNAM__);
       outweb_(%subst(%str(%addr(H__1(31))):44:837));
       wfrtn__ = AfToPage_(DESCRIPTION);
       outweb_(%subst(%str(%addr(H__1(42))):1:265));
       wfrtn__ = AfToPage_(UPLOADMSG);
       outweb_(%subst(%str(%addr(H__1(45))):26:8));
       wfrtn__ = AfToPage_(UPLOADMSG2);
       outweb_(%subst(%str(%addr(H__1(45))):34:194));
       wfrtn__ = AfToPage_(CLOSEBUTTON);
       outweb_(%subst(%str(%addr(H__1(47))):68:144));
       wfrtn__ = AfToPage_(NEWAPPDISPLAY);
       outweb_(%subst(%str(%addr(H__1(49))):52:50));

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
     P* checkdw0...                 - User defined function
     P*---------------------------------------------------------------------
     P checkdw0...
     P                 B
     D checkdw0...
     D                 PI




      /free
       outweb_(%subst(%str(%addr(H__1(1))):1:2443));
       wfrtn__ = AfToPage_(QPGMNAM__);
       outweb_(%subst(%str(%addr(H__1(31))):44:837));
       wfrtn__ = AfToPage_(DESCRIPTION);
       outweb_(%subst(%str(%addr(H__1(42))):1:265));
       wfrtn__ = AfToPage_(UPLOADMSG);
       outweb_(%subst(%str(%addr(H__1(45))):26:8));
       wfrtn__ = AfToPage_(UPLOADMSG2);
       outweb_(%subst(%str(%addr(H__1(45))):34:194));
       wfrtn__ = AfToPage_(CLOSEBUTTON);
       outweb_(%subst(%str(%addr(H__1(47))):68:144));
       wfrtn__ = AfToPage_(NEWAPPDISPLAY);
       outweb_(%subst(%str(%addr(H__1(49))):52:50));

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
       rtlla__(1) = 'KWEXCHANGE';

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
       if   ((file__='X_IN' or file__='*ALL') and NOT %OPEN(X_IN));
        if (mbr__ <> '*FIRST');
         ovrdbf_(ovrflag__:'X_IN':'X_IN' : '*LIBL' : mbr__);
        elseif ('X_IN' <> 'X_IN');
         ovrdbf_(ovrflag__:'X_IN':'X_IN' : '*LIBL');
        endif;
        if    erropen__ = 'Y';
         OPEN(E) X_IN;                //    X_IN
         if        %error;
          return %error;
         endif;
        else;
         OPEN X_IN;                //    X_IN
        endif;
       endif;
       if   ((file__='X_UP' or file__='*ALL') and NOT %OPEN(X_UP));
        if (mbr__ <> '*FIRST');
         ovrdbf_(ovrflag__:'X_UP':'X_UP' : '*LIBL' : mbr__);
        elseif ('X_UP' <> 'X_UP');
         ovrdbf_(ovrflag__:'X_UP':'X_UP' : '*LIBL');
        endif;
        if    erropen__ = 'Y';
         OPEN(E) X_UP;                //    X_UP
         if        %error;
          return %error;
         endif;
        else;
         OPEN X_UP;                //    X_UP
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
Upload Documents
**CTDATA H__1        uploadSeg                        3941
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.or
g/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>
    <meta name="genera
tor" content="WebSmart" />
    <meta http-equiv="Pragma" content="no-cache" />

   <title>Kwik-Doc</title>
    <link rel="stylesheet" type="text/css" href="/web
smart/kwikloan/styles/inmodal.css" media="screen, tv, projection" />
    <style
type="text/css">
    #upfile
    {
    color:#4f6b72;	
    }
    </style>
    <s
cript type="text/javascript" src="/websmart/kwikloan/javascript/klscripts.js"></
script>
    <script type="text/javascript" src="/websmart/kwikloan/javascript/kl
themes.js"></script>
    <script type="text/javascript" src="compass/javascript/
esdiapi011.js"></script>
    <script type="text/javascript">
    
   	function g
etHref()
    {
    if (parent.location.pathname == "/kwik/doclist.pgm")
    	{

   	parent.hideStuff2();
    	}	
    else
    	{	
    	window.location.href='lnv
iew.pgm'; return false;
    	}
    	
    }
			xl_AttachEvent(window, "load", Win
dowInit); 
	
			function WindowInit()
			{
				xl_FocusFirstElement();
				
				
 
			 
			}
			
			var msgWindow = null;
				
		 
			
		 
			
			var liWindow =
null;
			
		 
			
			function handleUploadSubmit()
			{
				if (document.getElem
entById('upfile').value == '')
				{
					alert('Please select a file to upload.
');
					return;
				}
				if (document.getElementById('description').value == '
')
				{
					alert('Please enter a description.');
					document.getElementById
('description').focus();
					return;
				}
				
				if (document.getElementById
('loandoc').checked)
					document.getElementById('isloandoc').value = 'Y';
				

				document.getElementById('uploadbutton').disabled = true;
				document.custi
nfo.submit();
			}
		</script>
    <link rel="stylesheet" href="compass/tools/dh
tmlwindow/windowfiles/dhtmlwindow.css" type="text/css" />
    <script type="text
/javascript" src="compass/tools/dhtmlwindow/windowfiles/dhtmlwindow.js">
		/****
*******************************************
		* DHTML Window Widget- ) Dynamic D
rive (www.dynamicdrive.com)
		* This notice must stay intact for legal use.
		*
Visit http://www.dynamicdrive.com/ for full source code
		**********************
*************************/
		</script>
  </head>
  <body style="margin: 0px; pad
ding: 0px; margin: 0 0 0 0">
    <div id="uploadcontents">
      
      
      <
form name="custinfo" method="post" action="" enctype="multipart/form-data" >

     
        <table class="mainlist" width="95%" align="center" style="margin-l
eft: auto; margin-right: auto; font-size: 14px; padding: 5px;" border="0">

     
          
          <tr>
            <th colspan="2" align="center"><a hr
ef="#" onclick="javascript:window.location.href='doclist.pgm'; return false;"><i
mg src="/websmart/kwikloan/images/loanInqRT.png"></a></th>
          </tr>

     
          <tr>
            <td><span id="instructions">Select File to impo
rt: </span></td>
            <td><input type="file" name="upfile" id="upfile" si
ze="37" /></td>
          </tr>
          <tr>
            <td><label for="descr
iption" alt="Description">File Description:</label></td>
            <td><input
type="text" name="description" id="description" size="50" maxlength="50" value="
"/></td>
          </tr>
          <tr>
            <td colspan="2">

   
              <input type="button" name="Upload" id="uploadbutton" value="Im
port" onclick="handleUploadSubmit();" /><br><br>
              <span style="colo
r: red;font-size: 12px;"><br><br></span>
            </td>
          </tr>

    
        </table>
        
        <input type="hidden" name="task" value="u
ploadfile" />
        <input type="hidden" name="showclose" value="" />

<input type="hidden" name="isloandoc" id="isloandoc" value="" />
        

  <input type="hidden" name="newappdisplay" value="" />
      </form>			
    </d
iv>
  </body>
</html>

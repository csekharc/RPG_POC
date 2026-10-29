     H/TITLE  x
      * ProGen WebSmart Revision 21178
      * File overrides for compile command
      *__OV OVRDBF KWLCOLLV   KWLCOLLV
      *__OV OVRDBF KWPDUSER   KWPDUSER
      *__OV OVRDBF KWLBASE    KWLBASE
      *__OV OVRDBF KWLURL     KWLURL
      *__OV OVRDBF KWLSIGN    KWLSIGN
      *__OV OVRDBF KWZ_POSTI  KWZ_POSTI
      *__OV OVRDBF KWZ_POSTO  KWZ_POSTO
      *__OV OVRDBF KWHBASE    KWHBASE
      *__   Following values are used to create the server program
      *__RO Pgm  lib KWWEB      Pgm  WAIVE_FEES
      *__AG          WEBSMART
      *__CL          *OBJLIBNAM
      *__BD ECRTBND204
      *===============================================================*
      * Path:   waive_fees.pdw
      * System: LEIFPERRY7B1F
      * Project:Kwik-Loan
      * Set:    Kwik-Loan R-D
      * User:   leif
      * Date Last Generated:   2015-05-01   15:35:53
      * Last Generated CRC: 2FAE3F1C 1CAE4B07 7ABA7149 B150306B
      *===============================================================*
      */CPY *LIBL/PW_CSRC CPYRIGHT
      * File specifications
     FKWLCOLLV  IF   E           K DISK    USROPN
     F                                     INFDS(FID001_   )
     FKWPDUSER  IF   E           K DISK    USROPN
     F                                     INFDS(FID002_   )
     FKWLBASE   IF   E           K DISK    USROPN
     F                                     INFDS(FID003_   )
     FKWLURL    IF   E           K DISK    USROPN
     F                                     INFDS(FID004_   )
     FKWLSIGN   IF   E           K DISK    USROPN
     F                                     INFDS(FID005_   )
     FKWHBASE   IF   E           K DISK    USROPN
     F                                     INFDS(FID008_   )

     D PTL__           S             50    DIM(1) CTDATA PERRCD(1)
     D RTLLA__         S             11    DIM(180)

     D*+FLDDCL Field declarations

     Dpostinds       E DS                  EXTNAME(kwz_posti    ) INZ
     Dpostoutds      E DS                  EXTNAME(kwz_posto    ) INZ

     D login_type      S             50A
     D login_redirect  S            255A
     D location        S              5A
     D kwiklogin       S             25A
     D vin             S             50A
     D phpcli          S            200A
     D client          S              5A
     D cust            S              9A
     D userid          S             32A
     D acct            S              5A
     D command         S          32000A

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
     D rwcolor1__      S             32A   INZ('F0F0FF')
     D rwcolor2__      S             32A   INZ('FFFFFF')


     D TASKRAN__       S              1    INZ(*OFF)


     D H__1            S             80    PERRCD(1) CTDATA DIM(5           )


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

     D QPGM__          S             21A
     D LstPmlErr_      S              4P 0 IMPORT
     D waive_exp0...
     D                 PR
     D waive_lc0...
     D                 PR
     D post0...
     D                 PR
     D CURISOD__       S               D   DATFMT(*ISO) INZ(*SYS)

     D rtn             S                   LIKE(cust          )

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

     C     DL003_        KLIST
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
       login_type = 'KWIKANY';
       login_redirect = '';
       pdloc = 0;
       kwiklogin = getcookie2_('KWIKLOGIN');
      /end-free
     C                   EVAL      QPGM__=%trim('KWWEB'     ) + '/' + 'SMURFRTN'
     C                   CALL      QPGM__                               90
     C                   PARM                    login_type
     C                   PARM                    login_redirect
     C                   PARM                    client
     C                   PARM                    userid
     C                   PARM                    location
     C                   PARM                    pdno
     C                   IF        *IN90 = '1'
     C                   EVAL      LstPmlErr_ = 1
     C                   ELSE
     C                   EVAL      LstPmlErr_ = 0
     C                   ENDIF
      /free
       ExecCmd2_( 'KWSET ' + %trim(client):%len(%trimr( 'KWSET ' + %trim(
       client))));
       Open_File_('*ALL': '*FIRST':  'Y');
       if (task__ = 'WAIVE_EXP');
        taskran__ = *ON;
        waive_exp0();
       endif ;
       if (task__ = 'WAIVE_LC');
        taskran__ = *ON;
        waive_lc0();
       endif ;

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
     P* waive_exp0...               - User defined function
     P*---------------------------------------------------------------------
     P waive_exp0...
     P                 B
     D waive_exp0...
     D                 PI




      /free
       mcust = %dec(aton_( getparm3_('mcust':'*OPT'):9:0):9:0);
       macct = %dec(aton_( getparm3_('macct':'*OPT'):5:0):5:0);
       AM003_ = CV_BYKEY;
       CHAIN(NE) DL003_ RKWLBASE;
       RS003_ = RcdSts2_('GETRCD': %error: %found: %eof);
       type = 'PAYMENT';
       TC = KW_gettc('EXPWAIVE');
       AMT = MEXPBAL1;
       DATEH = CURISOD__;
       EFF = CURISOD__;
       GLAMT = AMT;
       glnbr = %trim(%editc(70300:'P'));
       post0();
       if (LSTPMLERR_ = 0);
        OutWeb_('1');
       else;
        OutWeb_('0');
       endif;
      /end-free
     c     *PSSR         begsr
     c                   endsr
     P                 E


     P*---------------------------------------------------------------------
     P* waive_lc0...                - User defined function
     P*---------------------------------------------------------------------
     P waive_lc0...
     P                 B
     D waive_lc0...
     D                 PI




      /free
       mcust = %dec(aton_( getparm3_('mcust':'*OPT'):9:0):9:0);
       macct = %dec(aton_( getparm3_('macct':'*OPT'):5:0):5:0);
       AM003_ = CV_BYKEY;
       CHAIN(NE) DL003_ RKWLBASE;
       RS003_ = RcdSts2_('GETRCD': %error: %found: %eof);
       type = 'PAYMENT';
       TC = KW_gettc('LCHGWAIVE');
       AMT = MLCBAL;
       DATEH = CURISOD__;
       EFF = CURISOD__;
       GLAMT = AMT;
       glnbr = %trim(%editc(70400:'P'));
       post0();
       if (LSTPMLERR_ = 0);
        OutWeb_('1');
       else;
        OutWeb_('0');
       endif;
      /end-free
     c     *PSSR         begsr
     c                   endsr
     P                 E


     P*---------------------------------------------------------------------
     P* post0...                    - User defined function
     P*---------------------------------------------------------------------
     P post0...
     P                 B
     D post0...
     D                 PI




      /free
       action = 'POST';
       p_client = %dec(aton_(client:46:16):46:16);
       user = userid;
       BR = %dec(aton_(location:46:16):46:16);
       PCUST = MCUST;
       PACCT = MACCT;
       clear PostOutDS;
       PostOutDS = kwpost(PostInDS);
       clear PostInDS;
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

       // Initialize library list array for current job to find files
       rtlla__(1) = 'KWDB';
       rtlla__(2) = 'KWPGM';

       // Set the runtime library for support object references.
       // Also, determine job type
       jobtype__ = SetRtLib_('XL_WEBSPT');

       // Register the condition handler. Use a pointer to the
       // pgm status data structure
       RegCndHdlr_(CndHdlrPtr:  PSPtr__: *omit);

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
       if   ((file__='KWLCOLLV' or file__='*ALL') and NOT %OPEN(KWLCOLLV));
        if (mbr__ <> '*FIRST');
         ovrdbf_(ovrflag__:'KWLCOLLV':'KWLCOLLV' : '*LIBL' : mbr__);
        elseif ('KWLCOLLV' <> 'KWLCOLLV');
         ovrdbf_(ovrflag__:'KWLCOLLV':'KWLCOLLV' : '*LIBL');
        endif;
        if    erropen__ = 'Y';
         OPEN(E) KWLCOLLV;                //    KWLCOLLV
         if        %error;
          return %error;
         endif;
        else;
         OPEN KWLCOLLV;                //    KWLCOLLV
        endif;
       endif;
       if   ((file__='KWPDUSER' or file__='*ALL') and NOT %OPEN(KWPDUSER));
        if (mbr__ <> '*FIRST');
         ovrdbf_(ovrflag__:'KWPDUSER':'KWPDUSER' : '*LIBL' : mbr__);
        elseif ('KWPDUSER' <> 'KWPDUSER');
         ovrdbf_(ovrflag__:'KWPDUSER':'KWPDUSER' : '*LIBL');
        endif;
        if    erropen__ = 'Y';
         OPEN(E) KWPDUSER;                //    KWPDUSER
         if        %error;
          return %error;
         endif;
        else;
         OPEN KWPDUSER;                //    KWPDUSER
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
       if   ((file__='KWLURL' or file__='*ALL') and NOT %OPEN(KWLURL));
        if (mbr__ <> '*FIRST');
         ovrdbf_(ovrflag__:'KWLURL':'KWLURL' : '*LIBL' : mbr__);
        elseif ('KWLURL' <> 'KWLURL');
         ovrdbf_(ovrflag__:'KWLURL':'KWLURL' : '*LIBL');
        endif;
        if    erropen__ = 'Y';
         OPEN(E) KWLURL;                //    KWLURL
         if        %error;
          return %error;
         endif;
        else;
         OPEN KWLURL;                //    KWLURL
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
x
**CTDATA H__1        MainSeg                          354
<html>
  <body>  
    <form method="post">
      <input type="hidden" name="task
" id="task" value="check_vin">
      <input type="hidden" name="mcust" value="1"
>
      <input type="hidden" name="macct" value="1">
      <input type="text" na
me="vin" id="vin">
      <button type="submit" name="sub_btn">Check VIN</button>

    </form>    
  </body>
</html>

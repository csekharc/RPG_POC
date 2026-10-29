     H/TITLE  GLOBAL SMURF CHECK
      * ProGen WebSmart Revision 9484
      * File overrides for compile command
      *__OV OVRDBF KWLBASE    KWLBASE
      *__   Following values are used to create the server program
      *__RO Pgm  lib KWWEB      Pgm  SMURFRTN
      *__AG          WEBSMART
      *__CL          *OBJLIBNAM
      *__BD ECRTBND115
      *===============================================================*
      * Path:   SMURFRTN.pdw
      * System: LEIFPERRY7B1F
      * Project:Kwik-Loan
      * Set:    Global
      * User:   leif
      * Date Last Generated:   2014-02-17   15:17:34
      * Last Generated CRC: 9713F9C0 0C6DDB88 EDBD8253 4B5FB9A9
      *===============================================================*
      */CPY *LIBL/PW_CSRC CPYRIGHT
      * File specifications
     FKWLBASE   IF   E           K DISK    USROPN
     F                                     INFDS(FID001_   )

     D PTL__           S             50    DIM(1) CTDATA PERRCD(1)
     D RTLLA__         S             11    DIM(180)

     D*+FLDDCL Field declarations

     Dkl_userdata      DS                  INZ
     D kl_client                      5A
     D kl_userid                     32A
     D kl_location                    5A
     Dkd_userdata      DS                  INZ
     D kd_clientid                    5A
     D kd_userid                     32A
     D kd_pdno                       25A
     D kd_office                     11S 0
     Dkv_userdata      DS                  INZ
     D kv_clientid                    5A
     D kv_userid                     50A

     D login_type      S             50A
     D login_redirect  S            255A
     D global_client   S              5A
     D global_userid   S             50A
     D artncod         S              5A

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
     D prmreq__        S              5A
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

     D login_chk0      PR
     D SmurfChk__      S              1A   INZ(*ON)
     D Smurf_ID__      S             64A   IMPORT
     D Smurf_Rw__      S              9B 0 IMPORT

     D global_loc      S                   LIKE(kl_location   )
     D global_pdno     S                   LIKE(kd_pdno       )

      /COPY *LIBL/PW_CSRC,SUBPROT115
      /COPY *LIBL/PW_CSRC,GDPROTO
      /COPY *LIBL/PW_CSRC,JPROTO001

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
     C                   PARM                    login_type
     C                   PARM                    login_redirect
     C                   PARM                    global_client
     C                   PARM                    global_userid
     C                   PARM                    global_loc
     C                   PARM                    global_pdno
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
        login_chk0();
       endif ;

       // PML End   ----------------------------------

      /end-free
     c     *PSSR         begsr
     c                   endsr
     P main__          E



     P*---------------------------------------------------------------------
     P* login_chk0                  - User defined function
     P*---------------------------------------------------------------------
     P login_chk0      B
     D login_chk0      PI




      /free
       if ('KWIKANY' = login_type);
        login_type = '';
        if ('' <> GetSmurf2_('KWIKVIEW'));
         login_type = 'KwikView';
        endif;
        if ('' <> GetSmurf2_('KWIKDEALER'));
         login_type = 'KwikDealer';
        endif;
        if ('' = login_type);
         login_type = 'KwikLoan';
        endif;
       endif;
       if ('' = login_redirect);
        select;
        when ('KwikLoan' = login_type);
        login_redirect = 'login.pgm';
        when ('KwikDealer' = login_type);
        kd_clientid = getcookie2_('KWIKDEALER');
        login_redirect = 'kdlogin.pgm?clid' + kd_clientid;
        when ('KwikView' = login_type);
        login_redirect = 'kvlogin.pgm?clid=104';
        endsl;
       endif;
       artncod = HasItExpired_(SMURF_ID__);
       if (artncod <> '0');
        Redirect2_(login_redirect:'*SAME');
        return ;
       endif;
       select;
       when ('KwikLoan' = login_type);
       kl_userdata = GetSmurf2_('KWIKLOAN');
       if (((kl_client = '') or (kl_userid = '')));
        Redirect2_(login_redirect:'*SAME');
        return ;
       endif;
       global_client = kl_client;
       global_userid = kl_userid;
       global_loc = kl_location;
       when ('KwikDealer' = login_type);
       kd_userdata = GetSmurf2_('KWIKDEALER');
       if ((((kd_clientid = '') or (kd_userid = '') or (kd_pdno = ''))));
        Redirect2_(login_redirect:'*SAME');
        return ;
       endif;
       global_client = kd_clientid;
       global_userid = kd_userid;
       global_pdno = kd_pdno;
       global_loc = %trim(%editc(kd_office:'P'));
       when ('KwikView' = login_type);
       kv_userdata = GetSmurf2_('KWIKVIEW');
       if (((kv_clientid = '') or (kv_userid = '')));
        Alert_('Your login has expired; please login again');
        Redirect2_(login_redirect:'*SAME');
        return ;
       endif;
       global_client = kv_clientid;
       global_userid = kv_userid;
       endsl;
      /end-free
     c     *PSSR         begsr
     c                   endsr
     P login_chk0      E


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
       if  jobtype__ = '1';
        prmreq__ = '*DAA';
       endif;

       // Register the condition handler. Use a pointer to the
       // pgm status data structure
       RegCndHdlr_(CndHdlrPtr:  PSPtr__: *omit);

      /end-free
      /free
       SmurfChk__ = *OFF;

       // If Smurfid parm is missing, or value is blank, write error page:
       if  ChkSmurfID_(SmurfChk__ : prmreq__)=*ON;
        UnRegCndHdlr_(CndHdlrPtr : *omit);

        // Close all files and shut down program:
        if   Persists__ = *OFF;
         *inlr = *ON;
        endif;
        ShutDown_();
       endif;
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
       if   ((file__='KWLBASE' or file__='*ALL') and NOT %OPEN(KWLBASE));
        if   (mbr__ <>'*FIRST');
         ovrdbf_(ovrflag__:'KWLBASE':'KWLBASE' : '*LIBL' : mbr__);
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
GLOBAL SMURF CHECK

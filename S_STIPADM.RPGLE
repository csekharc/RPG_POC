     H/TITLE  x
      * ProGen WebSmart Revision 9484
      * File overrides for compile command
      *__OV OVRDBF KWLCOLLV   KWLCOLLV
      *__OV OVRDBF KWPDUSER   KWPDUSER
      *__OV OVRDBF KWLBASE    KWLBASE
      *__OV OVRDBF KWPUBASE   KWPUBASE
      *__OV OVRDBF KWP_DATA   KWP_DATA
      *__OV OVRDBF KWS_DATA   KWS_DATA
      *__   Following values are used to create the server program
      *__RO Pgm  lib KWWEB      Pgm  S_STIPADM
      *__AG          WEBSMART
      *__CL          *OBJLIBNAM
      *__SQ
      *__BD ECRTBND115
      *===============================================================*
      * Path:   s_stipadm.pdw
      * System: MARY-THINKPAD
      * Project:Kwik-Loan
      * Set:    Kwik-Loan R-D
      * User:   Jacob
      * Date Last Generated:   2014-11-05   10:47:33
      * Last Generated CRC: 26A12DD6 0DA1F749 1095456A 2D17AE9B
      *===============================================================*
      */CPY *LIBL/PW_CSRC CPYRIGHT
      * File specifications
     FKWLCOLLV  IF   E           K DISK    USROPN
     F                                     INFDS(FID001_   )
     FKWPDUSER  IF   E           K DISK    USROPN
     F                                     INFDS(FID002_   )
     FKWLBASE   IF   E           K DISK    USROPN
     F                                     INFDS(FID003_   )
     FKWPUBASE  IF   E           K DISK    USROPN
     F                                     INFDS(FID004_   )
     FKWP_DATA  UF A E           K DISK    USROPN
     F                                     INFDS(FID005_   )
     FKWS_DATA  IF   E           K DISK    USROPN
     F                                     INFDS(FID006_   )

     D PTL__           S             50    DIM(1) CTDATA PERRCD(1)
     D RTLLA__         S             11    DIM(180)

     D*+FLDDCL Field declarations


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
     D mstipa          S          32000A
     D idx             S             30P 0
     D grp_exists      S              1P 0
     D mode            S             10A

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
     D prmreq__        S              5A
     D pgsizelm__      S              9P 0 IMPORT('PGSIZELM')

     D Up__            C                   'ABCDEFGHIJKLMNOPQRSTUVWXYZ'
     D Lo__            C                   'abcdefghijklmnopqrstuvwxyz'

     D arclr__         S              8A
     D rwcolor1__      S             32A   INZ('F0F0FF')
     D rwcolor2__      S             32A   INZ('FFFFFF')


     D TASKRAN__       S              1    INZ(*OFF)


     D H__1            S              1    PERRCD(80) CTDATA DIM(1229     )

     D H__2            S              1    PERRCD(80) CTDATA DIM(2835     )

     D H__3            S              1    PERRCD(80) CTDATA DIM(81       )

     D H__4            S              1    PERRCD(80) CTDATA DIM(279      )

     D H__5            S              1    PERRCD(80) CTDATA DIM(577      )

     D H__6            S              1    PERRCD(80) CTDATA DIM(3567     )

     D H__7            S              1    PERRCD(80) CTDATA DIM(104      )

     D H__8            S              1    PERRCD(80) CTDATA DIM(1337     )


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

     D QPGM__          S             21A
     D LstPmlErr_      S              4P 0 IMPORT
     D edit_stipg0     PR
     D submit0         PR
     D del_stipg0      PR
     D grp_list0       PR
     D add_stipg0      PR
     D stipbox0        PR
     D QPGMNAM__       S             20A
     D SmurfChk__      S              1A   INZ(*ON)
     D Smurf_ID__      S             64A   IMPORT
     D Smurf_Rw__      S              9B 0 IMPORT

     D rtn             S                   LIKE(cust          )
     D stip            S                   LIKE(p_zkeya       )
     D grp_name        S                   LIKE(p_ztype       )

      /COPY *LIBL/PW_CSRC,SUBPROT115
      /COPY *LIBL/PW_CSRC,GDPROTO
      /COPY *LIBL/PW_CSRC,JPROTO001

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

     C     DL004_        KLIST
     C                   KFLD                    userid
     C     DL005_        KLIST
     C                   KFLD                    p_ztype
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
       AM004_ = CV_BYKEY;
       CHAIN(NE) DL004_ RKWPUBASE;
       RS004_ = RcdSts2_('GETRCD': %error: %found: %eof);
       if (puprofile <> 'ADMINISTRATOR');
        Alert_('You do not have authority to access this tool.');
        Redirect2_( GetSmurf2_('LASTPGM'):'*SAME');
       endif;
       if (task__ = 'DEFAULT');
        taskran__ = *ON;
        grp_list0();
       endif ;
       if (task__ = 'ADD_STIPG');
        taskran__ = *ON;
        add_stipg0();
       endif ;
       if (task__ = 'EDIT_STIPG');
        taskran__ = *ON;
        edit_stipg0();
       endif ;
       if (task__ = 'DEL_STIPG');
        taskran__ = *ON;
        del_stipg0();
       endif ;
       if (task__ = 'SUBMIT');
        taskran__ = *ON;
        submit0();
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
     P* edit_stipg0                 - User defined function
     P*---------------------------------------------------------------------
     P edit_stipg0     B
     D edit_stipg0     PI




      /free
       mode = 'edit';
       p_ztype = getparm2_('p_ztype':'*OPT');
       SETLL  DL005_ RKWPDATA;
       RS005_ = RcdSts2_('POSRCD':%error:%equal:%eof);
       READE(E) DL005_ RKWPDATA;
       RS005_ = RcdSts2_('GETNXTRCD':%error:%found:%eof);
       AM005_ = CV_ByKey;
       dow (RS005_ = '1');
       mstipa = %trim(mstipa) + %trim(p_zkeya) + ',';
       READE(E) DL005_ RKWPDATA;
       RS005_ = RcdSts2_('GETNXTRCD':%error:%found:%eof);
       AM005_ = CV_ByKey;
       if (RS005_ <> '1');
        mstipa = %subst(mstipa:1: %len(%trimr(mstipa)) - 1);
       endif;
       enddo;
       p_ztype = %subst(p_ztype:6:10);
       WrtCTASeg_(H__8(1):1:20);
       WrtCTASeg_(H__6(1):1:1047);
       wfrtn__ = AfToPage_(QPGMNAM__);
       WrtCTASeg_(H__6(1):1048:1665);
       wfrtn__ = AfToPage_(MODE);
       WrtCTASeg_(H__6(1):2713:54);
       wfrtn__ = AfToPage_(MSTIPA);
       WrtCTASeg_(H__6(1):2767:801);
       WrtCTASeg_(H__8(1):21:5);
       WrtCTASeg_(H__5(1):1:577);
       WrtCTASeg_(H__8(1):26:405);
       wfrtn__ = AfToPage_(MSTIPA);
       WrtCTASeg_(H__8(1):431:253);
       wfrtn__ = AfToPage_(P_ZTYPE);
       WrtCTASeg_(H__8(1):684:142);
       stipbox0();
       WrtCTASeg_(H__8(1):826:512);

      /end-free
     c     *PSSR         begsr
     c                   endsr
     P edit_stipg0     E


     P*---------------------------------------------------------------------
     P* submit0                     - User defined function
     P*---------------------------------------------------------------------
     P submit0         B
     D submit0         PI




      /free
       mstipa = getparm2_('mstipa':'*OPT');
       p_ztype = getparm2_('p_ztype':'*OPT');
       mode = getparm2_('mode':'*OPT');
       p_ztype = 'GSTP.' + %trim(p_ztype);
       if (mode = 'edit');
        SETLL  DL005_ RKWPDATA;
        RS005_ = RcdSts2_('POSRCD':%error:%equal:%eof);
        READE(E) DL005_ RKWPDATA;
        RS005_ = RcdSts2_('GETNXTRCD':%error:%found:%eof);
        AM005_ = CV_ByKey;
        dow (RS005_ = '1');
      /end-free
     C                   EVAL      RS005_ = DeleteRcd_('RKWPDATA')
      /free
        READE(E) DL005_ RKWPDATA;
        RS005_ = RcdSts2_('GETNXTRCD':%error:%found:%eof);
        AM005_ = CV_ByKey;
        enddo;
       endif;
      /end-free
     C/Exec SQL
     C+  select count(*) into :grp_exists from kwp_data  where p_ztype = :p_ztyp
     C+ e
     C/End-Exec
      /free
       if (grp_exists = 1);
        Alert_('This stipulations group has already been created. Please choo-
       se a unique group name.');
        if (mode = 'edit');
         edit_stipg0();
        else;
         add_stipg0();
        endif;
        Exit_Immed_();
       endif;
       mstipa = %trim(mstipa);
       idx = scanstr_(',': mstipa: 1);
       if (idx = 0);
        p_zkeya = mstipa;
      /end-free
     C/Exec SQL
     C+  select s_zdesc into :p_zdesc from kws_data where s_ztype = 'TRACK.STIP'
     C+  and s_zkeya = :p_zkeya
     C/End-Exec
      /free
        WRITE RKWPDATA;
        RS005_ = RcdSts2_('WRTRCD': %error: %found: %eof);
       endif;
       dow (idx <> 0);
       stip = %subst(mstipa:1: idx - 1);
       p_zkeya = %trim(stip);
      /end-free
     C/Exec SQL
     C+  select s_zdesc into :p_zdesc from kws_data where s_ztype = 'TRACK.STIP'
     C+  and s_zkeya = :p_zkeya
     C/End-Exec
      /free
       WRITE RKWPDATA;
       RS005_ = RcdSts2_('WRTRCD': %error: %found: %eof);
       mstipa = %subst(mstipa: idx + 1: %len(%trimr(mstipa)));
       idx = scanstr_(',': mstipa: 1);
       if (idx = 0);
        p_zkeya = %trim(mstipa);
      /end-free
     C/Exec SQL
     C+  select s_zdesc into :p_zdesc from kws_data where s_ztype = 'TRACK.STIP'
     C+  and s_zkeya = :p_zkeya
     C/End-Exec
      /free
        WRITE RKWPDATA;
        RS005_ = RcdSts2_('WRTRCD': %error: %found: %eof);
       endif;
       enddo;
       Redirect2_(QPGMNAM__:'*SAME');
      /end-free
     c     *PSSR         begsr
     c                   endsr
     P submit0         E


     P*---------------------------------------------------------------------
     P* del_stipg0                  - User defined function
     P*---------------------------------------------------------------------
     P del_stipg0      B
     D del_stipg0      PI




      /free
       p_ztype = getparm2_('p_ztype':'*OPT');
      /end-free
     C/Exec SQL
     C+  delete from kwp_data where p_ztype = :p_ztype
     C/End-Exec
      /free
      /end-free
     c     *PSSR         begsr
     c                   endsr
     P del_stipg0      E


     P*---------------------------------------------------------------------
     P* grp_list0                   - User defined function
     P*---------------------------------------------------------------------
     P grp_list0       B
     D grp_list0       PI




      /free
       WrtCTASeg_(H__2(1):1:451);
       WrtCTASeg_(H__5(1):1:577);
       WrtCTASeg_(H__2(1):452:2384);

      /end-free
     C/Exec SQL
     C+  declare sgrps scroll cursor for select		distinct p_ztype from kwp_data
     C+ where p_ztype like 'GSTP.%'
     C/End-Exec
      /free
      /end-free
     C/Exec SQL
     C+  open sgrps
     C/End-Exec
      /free
      /end-free
     C/Exec SQL
     C+  fetch next from sgrps into :p_ztype
     C/End-Exec
      /free
       if (sqlcod = 100);
        WrtCTASeg_(H__7(1):1:104);
       endif;
       dow (((sqlcod <> 100) and (sqlcod >= 0)));
       mstipa = '';
       SETLL  DL005_ RKWPDATA;
       RS005_ = RcdSts2_('POSRCD':%error:%equal:%eof);
       READE(E) DL005_ RKWPDATA;
       RS005_ = RcdSts2_('GETNXTRCD':%error:%found:%eof);
       AM005_ = CV_ByKey;
       dow (RS005_ = '1');
       mstipa = %trim(mstipa) + '-' + p_zdesc + '<br>';
       READE(E) DL005_ RKWPDATA;
       RS005_ = RcdSts2_('GETNXTRCD':%error:%found:%eof);
       AM005_ = CV_ByKey;
       enddo;
       grp_name = %subst(p_ztype:6:10);
       WrtCTASeg_(H__4(1):1:64);
       wfrtn__ = AfToPage_(P_ZTYPE);
       WrtCTASeg_(H__4(1):65:7);
       wfrtn__ = AfToPage_(GRP_NAME);
       WrtCTASeg_(H__4(1):72:10);
       wfrtn__ = AfToPage_(MSTIPA);
       WrtCTASeg_(H__4(1):82:198);

      /end-free
     C/Exec SQL
     C+  fetch next from sgrps into :p_ztype
     C/End-Exec
      /free
       enddo;
      /end-free
     C/Exec SQL
     C+  close sgrps
     C/End-Exec
      /free
       WrtCTASeg_(H__3(1):1:52);
       WrtCTASeg_(H__6(1):1:1047);
       wfrtn__ = AfToPage_(QPGMNAM__);
       WrtCTASeg_(H__6(1):1048:1665);
       wfrtn__ = AfToPage_(MODE);
       WrtCTASeg_(H__6(1):2713:54);
       wfrtn__ = AfToPage_(MSTIPA);
       WrtCTASeg_(H__6(1):2767:801);
       WrtCTASeg_(H__3(1):53:29);

      /end-free
     c     *PSSR         begsr
     c                   endsr
     P grp_list0       E


     P*---------------------------------------------------------------------
     P* add_stipg0                  - User defined function
     P*---------------------------------------------------------------------
     P add_stipg0      B
     D add_stipg0      PI




      /free
       WrtCTASeg_(H__1(1):1:17);
       WrtCTASeg_(H__6(1):1:1047);
       wfrtn__ = AfToPage_(QPGMNAM__);
       WrtCTASeg_(H__6(1):1048:1665);
       wfrtn__ = AfToPage_(MODE);
       WrtCTASeg_(H__6(1):2713:54);
       wfrtn__ = AfToPage_(MSTIPA);
       WrtCTASeg_(H__6(1):2767:801);
       WrtCTASeg_(H__1(1):18:2);
       WrtCTASeg_(H__5(1):1:577);
       WrtCTASeg_(H__1(1):20:698);
       stipbox0();
       WrtCTASeg_(H__1(1):718:512);

      /end-free
     c     *PSSR         begsr
     c                   endsr
     P add_stipg0      E


     P*---------------------------------------------------------------------
     P* stipbox0                    - User defined function
     P*---------------------------------------------------------------------
     P stipbox0        B
     D stipbox0        PI




      /free
       OutWeb_('<select multiple=''multiple'' class=''multiselect required'' -
       id=''MSTIPS'' name=''MSTIPS''>');
      /end-free
     C/Exec SQL
     C+  declare stips scroll cursor for 		select s_zkeya, s_zdesc from kws_data
     C+  where s_ztype = 'TRACK.STIP' order by s_zkeya	
     C/End-Exec
      /free
      /end-free
     C/Exec SQL
     C+  open stips
     C/End-Exec
      /free
      /end-free
     C/Exec SQL
     C+  fetch next from stips into :s_zkeya, :s_zdesc
     C/End-Exec
      /free
       dow (((sqlcod <> 100) and (sqlcod >= 0)));
       OutWeb_(%trimr( '<option value=''' + %trim(s_zkeya) + '''>' + %trim(
       s_zdesc) + '</option>'));
      /end-free
     C/Exec SQL
     C+  fetch next from stips into :s_zkeya, :s_zdesc
     C/End-Exec
      /free
       enddo;
      /end-free
     C/Exec SQL
     C+  close stips
     C/End-Exec
      /free
       OutWeb_('</select>');
      /end-free
     c     *PSSR         begsr
     c                   endsr
     P stipbox0        E


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
       if  jobtype__ = '1';
        prmreq__ = '*DAA';
       endif;

       // Register the condition handler. Use a pointer to the
       // pgm status data structure
       RegCndHdlr_(CndHdlrPtr:  PSPtr__: *omit);

       // If Smurfid parm is missing, or value is blank, write error page:
       if  ChkSmurfID_(SmurfChk__ : prmreq__)=*ON;
        UnRegCndHdlr_(CndHdlrPtr : *omit);

        // Close all files and shut down program:
        if   Persists__ = *OFF;
         *inlr = *ON;
        endif;
        ShutDown_();
       endif;

       // Set default page size limit to 2Mb.
       if PgSizeLm__ = 0;
        PgSizeLm__ = 2000000;
       endif;

       //  Get the task. If none provided, use the default:
       task__ = getparm2_('TASK':prmreq__);
       if  task__ = '';
        task__ = 'DEFAULT';
       else;
        //  Convert the parameter value to upper case:
        task__ = %XLATE(lo__: up__  :task__);
       endif;

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
        if   (mbr__ <>'*FIRST');
         ovrdbf_(ovrflag__:'KWLCOLLV':'KWLCOLLV' : '*LIBL' : mbr__);
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
        if   (mbr__ <>'*FIRST');
         ovrdbf_(ovrflag__:'KWPDUSER':'KWPDUSER' : '*LIBL' : mbr__);
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
       if   ((file__='KWPUBASE' or file__='*ALL') and NOT %OPEN(KWPUBASE));
        if   (mbr__ <>'*FIRST');
         ovrdbf_(ovrflag__:'KWPUBASE':'KWPUBASE' : '*LIBL' : mbr__);
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
        if   (mbr__ <>'*FIRST');
         ovrdbf_(ovrflag__:'KWP_DATA':'KWP_DATA' : '*LIBL' : mbr__);
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
       if   ((file__='KWS_DATA' or file__='*ALL') and NOT %OPEN(KWS_DATA));
        if   (mbr__ <>'*FIRST');
         ovrdbf_(ovrflag__:'KWS_DATA':'KWS_DATA' : '*LIBL' : mbr__);
        endif;
        if    erropen__ = 'Y';
         OPEN(E) KWS_DATA;                //    KWS_DATA
         if        %error;
          return %error;
         endif;
        else;
         OPEN KWS_DATA;                //    KWS_DATA
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
       when      rcdfmt__='RKWPDATA' and AM005_ = CV_ByKey and RS005_ = *ON ;
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
**CTDATA H__1        AddSeg                           1229
<html>
  <head>
	
	
    <title>Add Stipulation Group</title>
  </head>
  <body>
 
    <div class="container">
      <div class="page-header"><h2>Add Stipulation
 Group</h2></div>
      <form method="post" id="stip_form">
        <input type=
"hidden" name="task" id="task" value="submit">
        <input type="hidden" id="
mstipa" name="mstipa">
        <div class="row">
          <div class="col-lg-2
form-group">
            <label class="control-label">Group Name</label>

     <input type="text" class="form-control required" name="p_ztype" id="p_ztype
" maxlength="10">
          </div>
          <div class="col-lg-4 form-group">

           <label class="control-label">Stipulations</label><br>
            

        </div>
          <div class="col-lg-3 col-lg-offset-1 form-group">

       <label class="control-label">Selected Stipulations</label>            

          <div id="stiplist" class="alert alert-info"></div>
          </div>

        <div class="col-lg-2 form-group">
            <label class="control-labe
l" style="width:200px">&nbsp;</label>
            <button class="btn btn-primary
" type="submit">Submit</button>
          </div>
        </div>
      </form>

  </div>   
  </body>
</html>
**CTDATA H__2        page                             2835
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta http-equiv="Content-type" co
ntent="text/html; charset=utf-8" />
    <meta http-equiv="cache-control" content
="max-age=0" />
    <meta http-equiv="cache-control" content="no-cache" />
    <
meta http-equiv="expires" content="0" />
    <meta http-equiv="expires" content=
"Tue, 01 Jan 1980 1:00:00 GMT" />
    <meta http-equiv="pragma" content="no-cach
e" />
    <title>KL Stipulation Groups</title>
    
  </head>
  <body>
    <div
class="container">
           <!-- modal window boxes -->
      <div class="moda
l fade" id="ays_del">
        <div class="modal-dialog">
          <div class="m
odal-content">
            <div class="modal-header">
              <h4 class="m
odal-title"><strong>Are You Sure</strong>
              <button type="button" cl
ass="close" data-dismiss="modal">&times;</button>
              </h4>  

    </div>
            <div class="modal-body" id="ays-body">Are you sure you wi
sh to delete this stipulation group?
            </div>
            <div class="
modal-footer">
              <button type="button" class="btn btn-primary" id="d
elconf">Yes</button>
              <button type="button" class="btn btn-default"
 data-dismiss="modal">No</button>              
            </div>
          </d
iv><!-- /.modal-content -->
        </div><!-- /.modal-dialog -->
      </div><!
-- /.modal -->   
      
      <div class="modal fade" id="info">
        <div c
lass="modal-dialog">
          <div class="modal-content">
            <div clas
s="modal-header">
              <button type="button" class="close" data-dismiss
="modal" aria-hidden="true">&times;</button>
              <h4 class="modal-titl
e" id="md-title"></h4>
            </div>
            <div id="modal-id" class="
modal-body">
            </div>
          </div><!-- /.modal-content -->

 </div><!-- /.modal-dialog -->
      </div><!-- /.modal -->
      
      <div cl
ass="page-header"><h2>Stipulation Groups</h2></div>
      <div class="panel-grou
p" id="accordion">
        <div class="panel panel-default">
          <div clas
s="panel panel-heading">
            <!--<h5 class="panel-title"><a class="accor
dion-toggle" data-toggle="collapse" data-parent="#accordion" href="#filters">Tog
gle Filters</a>-->        
            <button type="button" id="new_stipg" clas
s="btn btn-primary">New Stipulation Group</button>     
            <div class="
pull-right">     
              <ul id="pgnt"></ul>
            </div>     

      </div>      
        </div>
      </div>
      <br>
      
      <table id
="data" class="table table-condensed table-bordered table-striped sortable">

     <thead>
          <tr>
            <th>Group Name</th>
            <th>Stip
ulations</th>
            <th>Actions</th>
          </tr>
        </thead>

    <tbody id="container">

**CTDATA H__3        page_close                       81
              </tbody>
            </table>    
    
    </div>
  </body>
</html
>
**CTDATA H__4        data                             279
<tr>
<input type="hidden" name="p_ztype" class="p_ztype" value="">
<td></td>
<td
></td>
<td><a href="#" class="edit_stipg" style="color:black;"><i class="fa fa-c
og fa-2x"></i></a><a href="#" class="del_stipg" style="color:black;"><i class="f
a fa-trash-o fa-2x"></i></a></td>
</tr>
**CTDATA H__5        css                              577
    <link rel="stylesheet" type="text/css" href="/k_com/bootstrap/3/bootstrap.mi
n.css"><!-- bootstrap -->
    <link rel="stylesheet" type="text/css" href="/k_co
m/bootstrap-multiselect/bootstrap-multiselect.css"><!-- bootstrap -->
    <link
rel="stylesheet" type="text/css" href="/k_com/fontAwesome/4.0/css/font-awesome.m
in.css"><!-- font awesome -->
    <link rel="stylesheet" type="text/css" href="/
/ajax.googleapis.com/ajax/libs/jqueryui/1.10.3/themes/smoothness/jquery-ui.css">
   
    <style type="text/css">
    .error-div{ font-weight:bold; color: #B94A48
 } 
    </style>

**CTDATA H__6        js                               3567
<script src="//ajax.googleapis.com/ajax/libs/jquery/2.0.3/jquery.min.js"></scrip
t>
<script src="//ajax.googleapis.com/ajax/libs/jqueryui/1.10.3/jquery-ui.min.js
"></script>
<script type="text/javascript" src="/k_com/bootstrap/3/bootstrap.min
.js"></script><!-- bootstrap jquery file -->
<script type="text/javascript" src=
"/k_com/bootstrap-multiselect/bootstrap-multiselect.js"></script><!-- bootstrap
jquery file -->
<script type="text/javascript" src="/k_com/bootstrap-formhelpers
-selectbox.js"></script>
<script type="text/javascript" src="/k_com/bootstrap-fo
rmhelpers-states.en_US.js"></script>
<script type="text/javascript" src="/k_com/
bootstrap-formhelpers-states.js"></script>
<script type="text/javascript" src="/
k_com/jquery.validate.min.js"></script>
<script type="text/javascript" src="/k_c
om/additional-methods.js"></script>
<script type="text/javascript" src="/k_com/j
query.mask.min.js"></script>
<script type="text/javascript" src="/k_com/numeric.
js"></script>
<script type="text/javascript">

	function del_stipg(p_ztype){
		$
.post("", { task: 'del_stipg', p_ztype: p_ztype }, function(dta){ location.reloa
d(); });	
	}
	
    $(document).ready(function(){
    
    
    	$.validator.addC
lassRules("required", { required: true });
    	
    	$("#stip_form").validate({


            errorPlacement: function(error, element) {
            	$(element)
.closest('.form-group').find('.error-div').remove();
            	$(element).clo
sest('.form-group').append("<div class='error-div'>" + error.text() + "</div>");
         
            },
            highlight: function(element) {

    	$(element).closest('.form-group').addClass('has-error');

            },

          unhighlight: function(element) {
            	$(element).closest('.for
m-group').find('.error-div').remove();
            	$(element).closest('.form-gr
oup').removeClass("has-error")
            }
        });
            	
    	var
$form = $("#stip_form");
		if ($form.length !== 0){
			var validator = $form.dat
a('validator');
			validator.settings.ignore = ':hidden:not(".multiselect")';

      }
        
    	$(".multiselect").multiselect({buttonWidth:'100%', maxHeig
ht: 400, numberDisplayed: 0}).change(function(){ 
    			var vals = "";
    			v
ar input = "";
    			var len = $(".multiselect option:selected").length;

    	
		$(".multiselect option:selected").each(function(i, el){ 
    				vals = vals +
 "<strong>-</strong>" + $(el).text() + "<br>";
    				
    				if ( i == len -
1){
    					input = input + $(el).val();
    				}
    				else {
    				input
 = input + $(el).val() + ",";
    				}
    			});
    			
    			$("#mstipa").v
al(input);
    		    $("#stiplist").html(vals);
    	 });

		
    	if ("" == "ed
it"){
    		var vals = "";
    		var array = "".split(",");
    		$("#MSTIPS").m
ultiselect('select', array);

    			$(".multiselect option:selected").each(func
tion(i, el){ 
    				vals = vals + "<strong>-</strong>" + $(el).text() + "<br>"
;
    			});
    			
    			$("#stiplist").html(vals);
    	}
    				
		$(".del
_stipg").click(function(evt){
				evt.preventDefault();
				var p_ztype = $(this
).parent().parent().find(".p_ztype").val();
				$("#delconf").click(function(){
del_stipg(p_ztype); });
				$("#ays_del").modal();	
		});
		
		$(".edit_stipg").
click(function(evt){
			evt.preventDefault();
			var p_ztype = $(this).parent().
parent().find(".p_ztype").val();
			location.href="?task=edit_stipg&p_ztype="+p_
ztype;
		});
		
		$("#new_stipg").click(function(){
			location.href = "?task=ad
d_stipg";	
		});
        
    });
    </script>
**CTDATA H__7        not_found                        104
<tr>
<td colspan="3" style="font-weight:bold; text-align:center">No stipulation
groups found.</td>
</tr>
**CTDATA H__8        EditSeg                          1337
<html>
  <head>
    
    
    <title>Edit Stipulation Group</title>
  </head>

<body>  
    <div class="container">
      <div class="page-header"><h2>Edit Sti
pulation Group</h2></div>
      <form method="post" id="stip_form">
        <inp
ut type="hidden" name="task" id="task" value="submit">
        <input type="hidd
en" name="mode" id="mode" value="edit">        
        <input type="hidden" id=
"mstipa" name="mstipa" value="">
        <div class="row">
          <div class=
"col-lg-2 form-group">
            <label class="control-label">Group Name</labe
l>
            <input type="text" class="form-control required" readonly name="p
_ztype" id="p_ztype" maxlength="10" value="">
          </div>
          <div cl
ass="col-lg-4 form-group">
            <label class="control-label">Stipulations
</label><br>
            
          </div>
          <div class="col-lg-3 col-lg
-offset-1 form-group">
            <label class="control-label">Selected Stipula
tions</label>            
            <div id="stiplist" class="alert alert-info
"></div>
          </div>
          <div class="col-lg-2 form-group">

  <label class="control-label" style="width:200px">&nbsp;</label>
            <b
utton class="btn btn-primary" type="submit">Submit</button>
          </div>

     </div>
      </form>
    </div>   
  </body>
</html>

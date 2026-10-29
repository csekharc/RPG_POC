     H/TITLE  Company Settings
      * ProGen WebSmart Revision 21923
      * File overrides for compile command
      *__OV OVRDBF KWPSBASE   KWPSBASE
      *__OV OVRDBF KWPUBASE   KWPUBASE
      *__OV OVRDBF KWPSCONT   KWPSCONT
      *__OV OVRDBF USAEPAYP   USAEPAYP
      *__OV OVRDBF KWPSEFT    KWPSEFT
      *__   Following values are used to create the server program
      *__RO Pgm  lib KWWEB      Pgm  S_CO
      *__AG          WEBSMART
      *__CL          *OBJLIBNAM
      *__BD ECRTBND195
      *===============================================================*
      * Path:   s_co.pdw
      * System: DESKTOP-HRQ4U30
      * Project:Kwik-Loan
      * Set:    Development
      * User:   seanp
      * Date Last Generated:   2018-04-08   10:13:48
      * Last Generated CRC: F12A5B97 4B5A5ECF F78AFECC F0663C04
      *===============================================================*
      */CPY *LIBL/PW_CSRC CPYRIGHT
      * File specifications
     FKWPSBASE  UF   E           K DISK    USROPN
     F                                     INFDS(FID001_   )
     FKWPUBASE  IF   E           K DISK    USROPN
     F                                     INFDS(FID002_   )
     FKWPSCONT  UF A E           K DISK    USROPN
     F                                     INFDS(FID003_   )
     FUSAEPAYP  UF   E           K DISK    USROPN
     F                                     INFDS(FID004_   )
     FKWPSEFT   UF   E           K DISK    USROPN
     F                                     INFDS(FID005_   )

     D PTL__           S             50    DIM(1) CTDATA PERRCD(1)
     D RTLLA__         S             11    DIM(180)

     D*+FLDDCL Field declarations

     Duserdata         DS                  INZ
     D client                         5A
     D userid                        32A
     D location                       5A

     D rrn             S              9P 0
     D p_ztype         S             15A
     D p_zkeya         S             25A
     D boxname         S             10A
     D boxid           S             10A
     D boxtype         S             10A
     D jvalidation     S             30A
     D artncod         S              5A
     D target          S            128A
     D disabled        S             10A

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


     D H__1            S             80    PERRCD(1) CTDATA DIM(69          )

     D H__2            S             80    PERRCD(1) CTDATA DIM(33          )

     D H__3            S             80    PERRCD(1) CTDATA DIM(7           )


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

     D dspbase0...
     D                 PR
     D updbase0...
     D                 PR
     D psstbox0...
     D                 PR
     D QPGM__          S             21A
     D LstPmlErr_      S              4P 0 IMPORT
     D prodbox0...
     D                 PR
     D wrtusa0...
     D                 PR
     D QPGMNAM__       S             20A
     D SmurfChk__      S              1A   INZ(*ON)
     D Smurf_ID__      S             64A   IMPORT
     D Smurf_Rw__      S              9B 0 IMPORT

     D boxselect       S                   LIKE(p_zkeya       )
     D userprofile     S                   LIKE(puprofile     )
     D psc_emailm      S                   LIKE(psc_email     )
     D psc_emailu      S                   LIKE(psc_email     )
     D psc_emaill      S                   LIKE(psc_email     )
     D saveusa         S                   LIKE(usep_id       )

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

     C     DL002_        KLIST
     C                   KFLD                    puid
     C     DL003_        KLIST
     C                   KFLD                    psc_type
     C                   ENDSR


      * Subprocedures follow:
      *--------------------------------------------------------------------------------------------*
      * main__ - Contains the main function source code from the PML
      *--------------------------------------------------------------------------------------------*
     P main__          B
     D main__          PI

      /free
       // PML Start ----------------------------------
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
       target = 'dash.pgm';
       if (task__ = 'DEFAULT');
        taskran__ = *ON;
        dspbase0();
       endif ;
       if (task__ = 'UPDBASE');
        taskran__ = *ON;
        updbase0();
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
     P* dspbase0...                 - User defined function
     P*---------------------------------------------------------------------
     P dspbase0...
     P                 B
     D dspbase0...
     D                 PI




      /free
       puid = userid;
       AM002_ = CV_BYKEY;
       CHAIN(NE) DL002_ RKWPUBASE;
       RS002_ = RcdSts2_('GETRCD': %error: %found: %eof);
       userprofile = puprofile;
       if (userprofile <> 'ADMINISTRATOR');
        disabled = 'disabled';
       else;
        disabled = '';
       endif;
       READ(NE)  RKWPSBASE;
       RS001_ = RcdSts2_('GETNXTRCD':%error:%found:%eof);
       AM001_ = CV_ByKey;
       if (((client = '107') or (client = '907')));
        psc_type = 'MESSAGE';
        AM003_ = CV_BYKEY;
        CHAIN(E) DL003_ RKWPSCONT;
        RS003_ = RcdSts2_('GETRCD': %error: %found: %eof);
        psc_emailm = psc_email;
        psc_type = 'LOAN';
        AM003_ = CV_BYKEY;
        CHAIN(E) DL003_ RKWPSCONT;
        RS003_ = RcdSts2_('GETRCD': %error: %found: %eof);
        psc_emaill = psc_email;
        psc_type = 'UPLOAD';
        AM003_ = CV_BYKEY;
        CHAIN(E) DL003_ RKWPSCONT;
        RS003_ = RcdSts2_('GETRCD': %error: %found: %eof);
        psc_emailu = psc_email;
       endif;
       outweb_(%subst(%str(%addr(H__1(1))):1:316));
       outweb_(%subst(%str(%addr(H__2(1))):1:2601));
       outweb_(%subst(%str(%addr(H__1(4))):77:51));
       wfrtn__ = AfToPage_(QPGMNAM__);
       outweb_(%subst(%str(%addr(H__1(5))):48:133));
       AfToPage_(%trim(%editc(RRN:'X')));
       outweb_(%subst(%str(%addr(H__1(7))):21:356));
       if (client = '106');
        OutWeb_('<button class= "navbutton"  onclick="javascript:location.hre-
       f=''ait_co.pgm'';return false;">Tax Settings<button>');
       endif;
       outweb_(%subst(%str(%addr(H__1(11))):57:595));
       wfrtn__ = AfToPage_(PSNAM1);
       outweb_(%subst(%str(%addr(H__1(19))):12:3));
       wfrtn__ = AfToPage_(DISABLED);
       outweb_(%subst(%str(%addr(H__1(19))):15:228));
       wfrtn__ = AfToPage_(PSNAM2);
       outweb_(%subst(%str(%addr(H__1(22))):3:2));
       wfrtn__ = AfToPage_(DISABLED);
       outweb_(%subst(%str(%addr(H__1(22))):5:227));
       wfrtn__ = AfToPage_(PSADR1);
       outweb_(%subst(%str(%addr(H__1(24))):72:2));
       wfrtn__ = AfToPage_(DISABLED);
       outweb_(%subst(%str(%addr(H__1(24))):74:227));
       wfrtn__ = AfToPage_(PSADR2);
       outweb_(%subst(%str(%addr(H__1(27))):61:2));
       wfrtn__ = AfToPage_(DISABLED);
       outweb_(%subst(%str(%addr(H__1(27))):63:225));
       wfrtn__ = AfToPage_(PSCITY);
       outweb_(%subst(%str(%addr(H__1(30))):48:2));
       wfrtn__ = AfToPage_(DISABLED);
       outweb_(%subst(%str(%addr(H__1(30))):50:161));
       psstbox0();
       outweb_(%subst(%str(%addr(H__1(32))):51:227));
       wfrtn__ = AfToPage_(%trim(%editw(PSZIP:'     -    ')));
       outweb_(%subst(%str(%addr(H__1(35))):38:43));
       wfrtn__ = AfToPage_(DISABLED);
       outweb_(%subst(%str(%addr(H__1(36))):1:226));
       wfrtn__ = AfToPage_(%trim(%editw(PSPHON:'   -   -    ')));
       outweb_(%subst(%str(%addr(H__1(38))):67:45));
       wfrtn__ = AfToPage_(DISABLED);
       outweb_(%subst(%str(%addr(H__1(39))):32:58));
       if (((client = '107') or (client = '907')));
        outweb_(%subst(%str(%addr(H__3(1))):1:147));
        wfrtn__ = AfToPage_(PSC_EMAILM);
        outweb_(%subst(%str(%addr(H__3(2))):68:159));
        wfrtn__ = AfToPage_(PSC_EMAILL);
        outweb_(%subst(%str(%addr(H__3(4))):67:161));
        wfrtn__ = AfToPage_(PSC_EMAILU);
        outweb_(%subst(%str(%addr(H__3(6))):68:14));
       endif;
       outweb_(%subst(%str(%addr(H__1(40))):10:194));
       wfrtn__ = AfToPage_(%trim(%editw(PSTIN:'   -  -    ')));
       outweb_(%subst(%str(%addr(H__1(42))):44:45));
       wfrtn__ = AfToPage_(DISABLED);
       outweb_(%subst(%str(%addr(H__1(43))):9:223));
       AfToPage_(%trim(%editc(PSROLLP:'J')));
       outweb_(%subst(%str(%addr(H__1(45))):72:2));
       wfrtn__ = AfToPage_(DISABLED);
       outweb_(%subst(%str(%addr(H__1(45))):74:156));
       prodbox0();
       outweb_(%subst(%str(%addr(H__1(47))):70:159));
       wrtusa0();
       outweb_(%subst(%str(%addr(H__1(49))):69:1551));

      /end-free
     c     *PSSR         begsr
     c                   endsr
     P                 E


     P*---------------------------------------------------------------------
     P* updbase0...                 - User defined function
     P*---------------------------------------------------------------------
     P updbase0...
     P                 B
     D updbase0...
     D                 PI




      /free
       puid = userid;
       AM002_ = CV_BYKEY;
       CHAIN(NE) DL002_ RKWPUBASE;
       RS002_ = RcdSts2_('GETRCD': %error: %found: %eof);
       userprofile = puprofile;
       if (userprofile = 'ADMINISTRATOR');
        READ(E)  RKWPSBASE;
        RS001_ = RcdSts2_('GETNXTRCD':%error:%found:%eof);
        AM001_ = CV_ByKey;
        psnam1 = getparm3_('psnam1':'*OPT');
        psnam2 = getparm3_('psnam2':'*OPT');
        psadr1 = getparm3_('psadr1':'*OPT');
        psadr2 = getparm3_('psadr2':'*OPT');
        pscity = getparm3_('pscity':'*OPT');
        psst = getparm3_('psst':'*OPT');
        PSZIP = %dec(aton_( getparm3_('PSZIP':'*OPT'):46:16):9:0);
        pszipf = getparm3_('pszipf':'*OPT');
        PSPHON = %dec(aton_( getparm3_('PSPHON':'*OPT'):46:16):10:0);
        PSTIN = %dec(aton_( getparm3_('PSTIN':'*OPT'):46:16):9:0);
        PSROLLP = %dec(aton_( getparm3_('PSROLLP':'*OPT'):46:16):5:3);
        pslnprod = getparm3_('pslnprod':'*OPT');
        RS001_ = UpdateRcd_('RKWPSBASE');
        if (((client = '107') or (client = '907')));
         psc_emailu = getparm3_('psc_emailu':'*OPT');
         psc_emailm = getparm3_('psc_emailm':'*OPT');
         psc_emaill = getparm3_('psc_emaill':'*OPT');
         psc_type = 'MESSAGE';
         AM003_ = CV_BYKEY;
         CHAIN(E) DL003_ RKWPSCONT;
         RS003_ = RcdSts2_('GETRCD': %error: %found: %eof);
         psc_email = psc_emailm;
         if (RS003_ = '1');
          RS003_ = UpdateRcd_('RKWPSCONT');
         else;
          WRITE RKWPSCONT;
          RS003_ = RcdSts2_('WRTRCD': %error: %found: %eof);
         endif;
         psc_type = 'UPLOAD';
         AM003_ = CV_BYKEY;
         CHAIN(E) DL003_ RKWPSCONT;
         RS003_ = RcdSts2_('GETRCD': %error: %found: %eof);
         psc_email = psc_emailu;
         if (RS003_ = '1');
          RS003_ = UpdateRcd_('RKWPSCONT');
         else;
          WRITE RKWPSCONT;
          RS003_ = RcdSts2_('WRTRCD': %error: %found: %eof);
         endif;
         psc_type = 'LOAN';
         AM003_ = CV_BYKEY;
         CHAIN(E) DL003_ RKWPSCONT;
         RS003_ = RcdSts2_('GETRCD': %error: %found: %eof);
         psc_email = psc_emaill;
         if (RS003_ = '1');
          RS003_ = UpdateRcd_('RKWPSCONT');
         else;
          WRITE RKWPSCONT;
          RS003_ = RcdSts2_('WRTRCD': %error: %found: %eof);
         endif;
        endif;
        usep_id = getparm3_('usep_id':'*OPT');
        if (usep_id <> '');
         READ(E)  RKWPSEFT;
         RS005_ = RcdSts2_('GETNXTRCD':%error:%found:%eof);
         AM005_ = CV_ByKey;
         if (peusage <> '');
          READ(E)  RKWPSEFT;
          RS005_ = RcdSts2_('GETNXTRCD':%error:%found:%eof);
          AM005_ = CV_ByKey;
         endif;
         if (peusage <> '');
          READ(E)  RKWPSEFT;
          RS005_ = RcdSts2_('GETNXTRCD':%error:%found:%eof);
          AM005_ = CV_ByKey;
         endif;
         saveusa = usep_id;
         usep_id = '';
         SETLL  *LOVAL RUSAEPAYP;
         RS004_ = RcdSts2_('POSRCD':%error:%equal:%eof);
         READ(E)  RUSAEPAYP;
         RS004_ = RcdSts2_('GETNXTRCD':%error:%found:%eof);
         AM004_ = CV_ByKey;
         dow (RS004_ = '1');
         if (usep_id = saveusa);
          uesp_activ = 'Y';
          pepwd = usep_pin;
          peauthkey = usep_sourc;
          RS005_ = UpdateRcd_('RKWPSEFT');
         else;
          uesp_activ = 'N';
         endif;
         RS004_ = UpdateRcd_('RUSAEPAYP');
         READ(E)  RUSAEPAYP;
         RS004_ = RcdSts2_('GETNXTRCD':%error:%found:%eof);
         AM004_ = CV_ByKey;
         enddo;
        endif;
       endif;
       Redirect2_(target:'*SAME');
      /end-free
     c     *PSSR         begsr
     c                   endsr
     P                 E


     P*---------------------------------------------------------------------
     P* psstbox0...                 - User defined function
     P*---------------------------------------------------------------------
     P psstbox0...
     P                 B
     D psstbox0...
     D                 PI




      /free
       boxtype = 'SYSTEM';
       p_ztype = 'STATECODE';
       boxname = 'PSST';
       boxid = 'PSST';
       boxselect = psst;
       jvalidation = 'valState(''stateErr'');';
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
     P* prodbox0...                 - User defined function
     P*---------------------------------------------------------------------
     P prodbox0...
     P                 B
     D prodbox0...
     D                 PI




      /free
       p_ztype = 'KWPPBASE';
       boxname = 'PSLNPROD';
       boxid = 'PSLNPROD';
       boxselect = pslnprod;
       boxtype = 'OTHER';
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
     P* wrtusa0...                  - User defined function
     P*---------------------------------------------------------------------
     P wrtusa0...
     P                 B
     D wrtusa0...
     D                 PI




      /free
       boxname = 'USEP_ID';
       boxid = 'USEP_ID';
       boxselect = '';
       boxtype = 'OTHER';
       OutWeb_('<select name="');
       OutWeb_(%trimr(boxname));
       OutWeb_('"');
       OutWeb_(' id="');
       OutWeb_(%trimr(boxid));
       OutWeb_('" onblur="');
       OutWeb_(%trimr(jvalidation));
       OutWeb_('"');
       OutWeb_(' size="1"');
       OutWeb_('>');
       OutWeb_('<option value=""></option>');
       usep_id = '';
       SETLL  *LOVAL RUSAEPAYP;
       RS004_ = RcdSts2_('POSRCD':%error:%equal:%eof);
       READ(NE)  RUSAEPAYP;
       RS004_ = RcdSts2_('GETNXTRCD':%error:%found:%eof);
       AM004_ = CV_ByKey;
       dow (RS004_ = '1');
       OutWeb_('<option value="');
       OutWeb_(%trimr(usep_id));
       OutWeb_('"');
       if (uesp_activ = 'Y');
        OutWeb_(' selected');
       endif;
       OutWeb_('>');
       OutWeb_(%trimr(usep_name));
       OutWeb_('</option>');
       READ(NE)  RUSAEPAYP;
       RS004_ = RcdSts2_('GETNXTRCD':%error:%found:%eof);
       AM004_ = CV_ByKey;
       enddo;
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
       if   ((file__='KWPUBASE' or file__='*ALL') and NOT %OPEN(KWPUBASE));
        if (mbr__ <> '*FIRST');
         ovrdbf_(ovrflag__:'KWPUBASE':'KWPUBASE' : '*LIBL' : mbr__);
        elseif ('KWPUBASE' <> 'KWPUBASE');
         ovrdbf_(ovrflag__:'KWPUBASE':'KWPUBASE' : '*LIBL');
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
       when      rcdfmt__='RKWPSBASE' and AM001_ = CV_ByKey and RS001_ = *ON ;
       update RKWPSBASE;
       when      rcdfmt__='RKWPSCONT' and AM003_ = CV_ByKey and RS003_ = *ON ;
       update RKWPSCONT;
       when      rcdfmt__='RUSAEPAYP' and AM004_ = CV_ByKey and RS004_ = *ON ;
       update RUSAEPAYP;
       when      rcdfmt__='RKWPSEFT' and AM005_ = CV_ByKey and RS005_ = *ON ;
       update RKWPSEFT;
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
Company Settings
**CTDATA H__1        BASE                             5459
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.or
g/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>
    <meta name="genera
tor" content="WebSmart" />
    <meta http-equiv="Pragma" content="no-cache" />

   <title>Company Settings - Change</title>
    <style type="text/css">
    

 </style>
  </head>
  <body>
    <form action="" name="compform" method="get">

     <input type="hidden" name="TASK" value="updbase">
      <input type="hidden
" name="rrn" value="">
      
      <div id="pagetitle">
        <span>Company S
ettings</span>
        <div id="topBtns" >
          <input type="button" class=
"navbutton" name="updtBtn" id="updtBtn" onclick="subCompSettings();" value="Upda
te Settings">
          <button class="navbutton" onclick="javascript:location.h
ref='dash.pgm';return false;">Cancel</button>
          
        </div>
      </
div>
      <div id="wrapping">
        
        <div id="whitebg" class="whitebg
">
          <div id="EDITcontents"> 
            
            
            <tab
le id="holderTable">
              <tr>
                <th>Company Information<
/th>
              </tr>
              <tr>
                <td class="holderTd"
>
                  <table class="dealerTable" style="">
                    <tr
>
                      <td class="left">Institution Name 1:</td>

        <td class="right"><input type="text" name="PSNAM1" size="40" maxlength="
40" value=""  > </td>
                    </tr>
                    <tr>

               <td class="left">Institution Name 2:</td>
                      <
td class="right"><input type="text" name="PSNAM2" size="40" maxlength="40" value
="" ></td>
                    </tr>
                    <tr>

    <td class="left">Institution Addr 3:</td>
                      <td class="r
ight"><input type="text" name="PSADR1" size="40" maxlength="40" value="" ></td>

                    </tr>
                    <tr>
                      <td cla
ss="left">Institution Addr 4:</td>
                      <td class="right"><inpu
t type="text" name="PSADR2" size="40" maxlength="40" value="" ></td>

         </tr>
                    <tr>
                      <td class="left">I
nstitution City:</td>
                      <td class="right"><input type="text"
 name="PSCITY" size="30" maxlength="30" value="" ></td>
                    </tr
>
                    <tr>
                      <td class="left">Institution St
ate:</td>
                      <td class="right"></td>
                    </tr
>
                    <tr>
                      <td class="left">Institution Zi
p Code:</td>
                      <td class="right"><input type="text" name="PS
ZIP" size="10" maxlength="10" value="" onkeyup="mask(this.value,this,'5','-');"
></td>
                    </tr>
                    <tr>

<td class="left">Institution Phone:</td>
                      <td class="right"
><input type="text" name="PSPHON" size="12" maxlength="12" value="" onkeyup="mas
k(this.value,this,'3,7','-');" ></td>
                    </tr>     

                 
                    <tr>
                      <td class="left
">Tax ID No.:</td>
                      <td class="right"><input type="text" na
me="PSTIN" size="11" maxlength="11" value="" onkeyup="mask(this.value,this,'3,6'
,'-');" ></td>
                    </tr>
                    <tr>

        <td class="left">Roll Percentage:</td>
                      <td class="
right"><input type="text" name="PSROLLP" size="5" maxlength="5" value="" ></td>

                    </tr>
                    <tr>
                      <td cla
ss="left">Loan Product:</td>
                      <td class="right"></td>

               </tr>
                    <tr>
                      <td class="l
eft">USAEPAY Settings:</td>
                      <td class="right"></td>

              </tr>
                  </table>
                </td>

   </tr>
            </table>
            <div id="navbottom" style="display:non
e;">
              <input class="navbutton" type="submit" value="Change">

        <button class="navbutton" onclick="javascript:location.href='dash.pgm';r
eturn false;">Cancel</button>
            </div>
            
          </form>

        </div><!--editcontents-->
      </div><!--whiteBg-->
    </div><!--wrapp
ing-->
    
  </body>
  <script type="text/javascript">
function mask(inputStrin
g,textbox,delimiterLocations,delimeter){
	//only allow numeric input
	var charac
terTyped = inputString.substring(inputString.length - 1);
	if (characterTyped !=
 '0'
	&& characterTyped != '1'
	&& characterTyped != '2'
	&& characterTyped != '
3'
	&& characterTyped != '4'
	&& characterTyped != '5'
	&& characterTyped != '6'

	&& characterTyped != '7'
	&& characterTyped != '8'
	&& characterTyped != '9'
	
&& characterTyped != '.')
	{
		textbox.value = inputString.substring(0,inputStri
ng.length - 1);
		return;
	}
	var locations = delimiterLocations.split(',');
	fo
r (var i = 0; i <= locations.length; i++)
	{
		for (var k = 0; k <= inputString.
length; k++)
		{
			if (k == locations[i])
			{
				if (inputString.substring(k,
 k+1) != delimeter)
				{
				inputString = inputString.substring(0,k) + delimet
er + inputString.substring(k,inputString.length);
				}
			}
		}
	}
	textbox.val
ue = inputString;
}
function subCompSettings()
{
	document.compform.submit();	
}

</script>
</html>

**CTDATA H__2        manageCSS                        2601
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


**CTDATA H__3        ssc_rows                         481
<tr>
  <td class="left">Message Notification Email:</td>
  <td class="right"><in
put type="text" name="psc_emailm" size="12" maxlength="100" value=""></td>
</tr>
 
<tr>
  <td class="left">Loan Notification Email:</td>
  <td class="right"><inp
ut type="text" name="psc_emaill" size="12" maxlength="100" value=""></td>
</tr>

<tr>
  <td class="left">Upload Notification Email:</td>
  <td class="right"><in
put type="text" name="psc_emailu" size="12" maxlength="100" value=""></td>
</tr>


     H/TITLE  x
      * ProGen WebSmart Revision 21178
      * File overrides for compile command
      *__OV OVRDBF KWLCOLLV   KWLCOLLV
      *__OV OVRDBF KWPDUSER   KWPDUSER
      *__OV OVRDBF KWLBASE    KWLBASE
      *__OV OVRDBF KWPUBASE   KWPUBASE
      *__OV OVRDBF KWP_DATA   KWP_DATA
      *__OV OVRDBF KWS_DATA   KWS_DATA
      *__OV OVRDBF KWPEMAIL   KWPEMAIL
      *__OV OVRDBF KWPDBASE   KWPDBASE
      *__OV OVRDBF KWLAPPL    KWLAPPL
      *__OV OVRDBF KWPDSTAT   KWPDSTAT
      *__   Following values are used to create the server program
      *__RO Pgm  lib KWWEB      Pgm  S_SUBSTAT
      *__AG          WEBSMART
      *__CL          *OBJLIBNAM
      *__SQ
      *__BD ECRTBND187
      *===============================================================*
      * Path:   s_substat.pdw
      * System: LEIFPERRY7B1F
      * Project:Kwik-Loan
      * Set:    Kwik-Loan R-D
      * User:   leif
      * Date Last Generated:   2015-07-13   12:29:40
      * Last Generated CRC: 1A870B00 30B06E69 50E2078B 51962084
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
     FKWPEMAIL  IF   E           K DISK    USROPN
     F                                     INFDS(FID007_   )
     FKWPDBASE  IF   E           K DISK    USROPN
     F                                     INFDS(FID008_   )
     FKWLAPPL   IF   E           K DISK    USROPN
     F                                     INFDS(FID009_   )
     FKWPDSTAT  IF   E           K DISK    USROPN
     F                                     INFDS(FID010_   )

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
     D rrn             S              9P 0
     D x               S              9P 0
     D msgtype         S              1A
     D query           S           2048A
     D listsize        S              9P 0
     D nx              S              5P 0
     D boxname         S             10A
     D boxid           S             10A
     D boxtype         S             10A
     D jvalidation     S             30A

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


     D H__1            S             80    PERRCD(1) CTDATA DIM(16          )

     D H__2            S             80    PERRCD(1) CTDATA DIM(45          )

     D H__3            S             80    PERRCD(1) CTDATA DIM(2           )

     D H__4            S             80    PERRCD(1) CTDATA DIM(4           )

     D H__5            S             80    PERRCD(1) CTDATA DIM(8           )

     D H__6            S             80    PERRCD(1) CTDATA DIM(46          )

     D H__7            S             80    PERRCD(1) CTDATA DIM(2           )

     D H__8            S             80    PERRCD(1) CTDATA DIM(17          )


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
     D mainstat_box0...
     D                 PR
     D del_all0...
     D                 PR
     D edit_substat0...
     D                 PR
     D submit0...
     D                 PR
     D del_substat0...
     D                 PR
     D count0...
     D                 PR
     D substat_list0...
     D                 PR
     D add_substat0...
     D                 PR
     D dlrbox0...
     D                 PR
     D QPGMNAM__       S             20A
     D SmurfChk__      S              1A   INZ(*ON)
     D Smurf_ID__      S             64A   IMPORT
     D Smurf_Rw__      S              9B 0 IMPORT

     D fpdno           S                   LIKE(pdno          )
     D rtn             S                   LIKE(cust          )
     D stip            S                   LIKE(p_zkeya       )
     D grp_name        S                   LIKE(p_ztype       )
     D pagenum         S                   LIKE(listsize      )
     D rcdcnt          S                   LIKE(listsize      )
     D pagemax         S                   LIKE(listsize      )
     D boxselect       S                   LIKE(p_zkeya       )

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

     C     DL004_        KLIST
     C                   KFLD                    userid
     C     DL005_        KLIST
     C                   KFLD                    p_ztype
     C                   KFLD                    p_zkeya
     C                   KFLD                    p_zkeyn
     C     DL007_        KLIST
     C                   KFLD                    pemltype
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
       listsize = 50;
       AM004_ = CV_BYKEY;
       CHAIN(NE) DL004_ RKWPUBASE;
       RS004_ = RcdSts2_('GETRCD': %error: %found: %eof);
       if (puprofile <> 'ADMINISTRATOR');
        Alert_('You do not have authority to access this tool.');
        Redirect2_( GetSmurf2_('LASTPGM'):'*SAME');
       endif;
       if (task__ = 'DEFAULT');
        taskran__ = *ON;
        substat_list0();
       endif ;
       if (task__ = 'ADD_SUBSTAT');
        taskran__ = *ON;
        add_substat0();
       endif ;
       if (task__ = 'DEL_ALL');
        taskran__ = *ON;
        del_all0();
       endif ;
       if (task__ = 'EDIT_SUBSTAT');
        taskran__ = *ON;
        edit_substat0();
       endif ;
       if (task__ = 'DEL_SUBSTAT');
        taskran__ = *ON;
        del_substat0();
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
     P* mainstat_box0...            - User defined function
     P*---------------------------------------------------------------------
     P mainstat_box0...
     P                 B
     D mainstat_box0...
     D                 PI




      /free
       p_ztype = 'KWPDSTAT';
       boxname = 'KASTAT';
       boxid = 'KASTAT';
       boxselect = kastat;
       boxtype = 'OTHER';
       OutWeb_('<select class="form-control" name="');
       OutWeb_(%trimr(boxname));
       OutWeb_('"');
       OutWeb_(' id="');
       OutWeb_(%trimr(boxid));
       OutWeb_('" onchange="');
       OutWeb_(%trimr(jvalidation));
       OutWeb_('"');
       OutWeb_(' size="1"');
       OutWeb_('>');
       OutWeb_('<option value=""></option>');
       SETLL  *LOVAL RKWPDSTAT;
       RS010_ = RcdSts2_('POSRCD':%error:%equal:%eof);
       READ(NE)  RKWPDSTAT;
       RS010_ = RcdSts2_('GETNXTRCD':%error:%found:%eof);
       AM010_ = CV_ByKey;
       dow (RS010_ = '1');
       if (kastat = kpstat);
        OutWeb_('<option value="');
        OutWeb_(%trimr(kpstat));
        OutWeb_('"');
        OutWeb_(' selected');
        OutWeb_('>');
        OutWeb_(%trimr(kpstat));
        OutWeb_(' - ');
        OutWeb_(%trimr(kpdesc));
        OutWeb_('</option>');
       else;
        OutWeb_('<option value="');
        OutWeb_(%trimr(kpstat));
        OutWeb_('"');
        OutWeb_('>');
        OutWeb_(%trimr(kpstat));
        OutWeb_(' - ');
        OutWeb_(%trimr(kpdesc));
        OutWeb_('</option>');
       endif;
       READ(NE)  RKWPDSTAT;
       RS010_ = RcdSts2_('GETNXTRCD':%error:%found:%eof);
       AM010_ = CV_ByKey;
       enddo;
       OutWeb_('</select>');
      /end-free
     c     *PSSR         begsr
     c                   endsr
     P                 E


     P*---------------------------------------------------------------------
     P* del_all0...                 - User defined function
     P*---------------------------------------------------------------------
     P del_all0...
     P                 B
     D del_all0...
     D                 PI




      /free

      /end-free
     C/Exec SQL
     C+  delete from kwpemail where pemlsubj = 'DLRDECMSG'
     C/End-Exec
      /free
       Redirect2_(QPGMNAM__:'*SAME');
      /end-free
     c     *PSSR         begsr
     c                   endsr
     P                 E


     P*---------------------------------------------------------------------
     P* edit_substat0...            - User defined function
     P*---------------------------------------------------------------------
     P edit_substat0...
     P                 B
     D edit_substat0...
     D                 PI




      /free
       mode = 'edit';
       rrn = %dec(aton_( getparm3_('rrn':'*OPT'):9:0):9:0);
      /end-free
     C/Exec SQL
     C+  select p_zkeya, p_zkeyn, p_zusage, p_zdesc into :p_zkeya, :p_zkeyn, :p_
     C+ zusage, :p_zdesc from kwp_data where rrn(kwp_data) = :rrn
     C/End-Exec
      /free
       outweb_(%subst(%str(%addr(H__8(1))):1:20));
       outweb_(%subst(%str(%addr(H__6(1))):1:1067));
       wfrtn__ = AfToPage_(QPGMNAM__);
       outweb_(%subst(%str(%addr(H__6(14))):28:219));
       AfToPage_(%trim(%editc(PAGENUM:'3')));
       outweb_(%subst(%str(%addr(H__6(17))):7:21));
       AfToPage_(%trim(%editc(PAGEMAX:'3')));
       outweb_(%subst(%str(%addr(H__6(17))):28:2301));
       outweb_(%subst(%str(%addr(H__8(1))):21:5));
       outweb_(%subst(%str(%addr(H__5(1))):1:571));
       outweb_(%subst(%str(%addr(H__8(1))):26:304));
       wfrtn__ = AfToPage_(MODE);
       outweb_(%subst(%str(%addr(H__8(5))):10:54));
       AfToPage_(%trim(%editc(P_ZKEYN:'3')));
       outweb_(%subst(%str(%addr(H__8(5))):64:208));
       wfrtn__ = AfToPage_(P_ZKEYA);
       outweb_(%subst(%str(%addr(H__8(8))):32:228));
       wfrtn__ = AfToPage_(P_ZUSAGE);
       outweb_(%subst(%str(%addr(H__8(11))):20:240));
       wfrtn__ = AfToPage_(P_ZDESC);
       outweb_(%subst(%str(%addr(H__8(14))):20:300));

      /end-free
     c     *PSSR         begsr
     c                   endsr
     P                 E


     P*---------------------------------------------------------------------
     P* submit0...                  - User defined function
     P*---------------------------------------------------------------------
     P submit0...
     P                 B
     D submit0...
     D                 PI




      /free
       msgtype = getparm3_('msgtype':'*OPT');
       mode = getparm3_('mode':'*OPT');
       select;
       when (mode = 'add');
       kastat = getparm3_('kastat':'*OPT');
       p_ztype = 'SUBSTATUS';
       p_zkeya = kastat;
       p_zkeyn = 0;
      /end-free
     C/Exec SQL
     C+  select max(ifnull(p_zkeyn, 0))+1 into :p_zkeyn from kwp_data where p_zt
     C+ ype = 'SUBSTATUS' and p_zkeya = :p_zkeya
     C/End-Exec
      /free
       p_zusage = getparm3_('p_zusage':'*OPT');
       p_zdesc = getparm3_('p_zdesc':'*OPT');
       WRITE RKWPDATA;
       RS005_ = RcdSts2_('WRTRCD': %error: %found: %eof);
       when (mode = 'edit');
       p_ztype = 'SUBSTATUS';
       p_zkeya = getparm3_('p_zkeya':'*OPT');
       p_zkeyn = %dec(aton_( getparm3_('p_zkeyn':'*OPT'):11:0):11:0);
       AM005_ = CV_BYKEY;
       CHAIN(E) DL005_ RKWPDATA;
       RS005_ = RcdSts2_('GETRCD': %error: %found: %eof);
       p_zdesc = getparm3_('p_zdesc':'*OPT');
       p_zusage = getparm3_('p_zusage':'*OPT');
       RS005_ = UpdateRcd_('RKWPDATA');
       endsl;
       Redirect2_(QPGMNAM__:'*SAME');
      /end-free
     c     *PSSR         begsr
     c                   endsr
     P                 E


     P*---------------------------------------------------------------------
     P* del_substat0...             - User defined function
     P*---------------------------------------------------------------------
     P del_substat0...
     P                 B
     D del_substat0...
     D                 PI




      /free
       rrn = %dec(aton_( getparm3_('rrn':'*OPT'):9:0):9:0);
      /end-free
     C/Exec SQL
     C+  delete from kwp_data where rrn(kwp_data) = :rrn
     C/End-Exec
      /free
      /end-free
     c     *PSSR         begsr
     c                   endsr
     P                 E


     P*---------------------------------------------------------------------
     P* count0...                   - User defined function
     P*---------------------------------------------------------------------
     P count0...
     P                 B
     D count0...
     D                 PI




      /free
       query = 'select count(*) FROM KWP_DATA where p_ztype = ''SUBSTATUS''';
       if (kastat <> '');
        query = %trim(query) + ' and p_zkeya = ''' + %trim(kastat) + '''';
       endif;
      /end-free
     C/Exec SQL
     C+            Declare CNT Scroll Cursor
     C+            For CNT
     C/End-Exec
     C/Exec SQL
     C+            Prepare CNT
     C+            From :query
     C/End-Exec
      /free
       if (sqlcod >= 0);
      /end-free
     C/Exec SQL
     C+            Open CNT
     C/End-Exec
      /free
       endif;
      /end-free
     C/Exec SQL
     C+  fetch next from CNT into :rcdcnt
     C/End-Exec
      /free
      /end-free
     C/Exec SQL
     C+  close CNT
     C/End-Exec
      /free
      /end-free
     c     *PSSR         begsr
     c                   endsr
     P                 E


     P*---------------------------------------------------------------------
     P* substat_list0...            - User defined function
     P*---------------------------------------------------------------------
     P substat_list0...
     P                 B
     D substat_list0...
     D                 PI




      /free
       pagenum = %dec(aton_( getparm3_('page':'*OPT'):9:0):9:0);
       if (pagenum = 0);
        pagenum = 1;
       endif;
       kastat = getparm3_('kastat':'*OPT');
       count0();
      /end-free
     C                   EVAL(H)   pagemax = rcdcnt / listsize
      /free
       if ((rcdcnt / listsize)> pagemax);
        pagemax = pagemax + 1;
       endif;
       if (pagemax = 0);
        pagemax = 1;
       endif;
       nx = ( ( ( pagenum - 1) * listsize) + 1);
       outweb_(%subst(%str(%addr(H__2(1))):1:454));
       outweb_(%subst(%str(%addr(H__5(1))):1:571));
       outweb_(%subst(%str(%addr(H__2(6))):55:2116));
       mainstat_box0();
       outweb_(%subst(%str(%addr(H__2(33))):11:969));
       query = 'select p_zkeya, p_zkeyn, p_zdesc, p_zusage, rrn(KWP_DATA) fro-
       m kwp_data where p_ztype = ''SUBSTATUS''';
       if (kastat <> '');
        query = %trim(query) + ' and p_zkeya = ''' + %trim(kastat) + '''';
       endif;
       query = %trim(query) + ' order by p_zkeya, p_zusage';
      /end-free
     C/Exec SQL
     C+            Declare substat Scroll Cursor
     C+            For substat
     C/End-Exec
     C/Exec SQL
     C+            Prepare substat
     C+            From :query
     C/End-Exec
      /free
       if (sqlcod >= 0);
      /end-free
     C/Exec SQL
     C+            Open substat
     C/End-Exec
      /free
       endif;
      /end-free
     C/Exec SQL
     C+  fetch relative :nx from substat into :p_zkeya, :p_zkeyn, :p_zdesc, :p_z
     C+ usage, :rrn
     C/End-Exec
      /free
       if (sqlcod = 100);
        outweb_(%subst(%str(%addr(H__7(1))):1:98));
       endif;
       dow ((((sqlcod <> 100) and (sqlcod >= 0) and (x <= listsize))));
       outweb_(%subst(%str(%addr(H__4(1))):1:45));
       AfToPage_(%trim(%editc(RRN:'3')));
       outweb_(%subst(%str(%addr(H__4(1))):46:7));
       wfrtn__ = AfToPage_(P_ZKEYA);
       outweb_(%subst(%str(%addr(H__4(1))):53:10));
       wfrtn__ = AfToPage_(P_ZUSAGE);
       outweb_(%subst(%str(%addr(H__4(1))):63:10));
       wfrtn__ = AfToPage_(P_ZDESC);
       outweb_(%subst(%str(%addr(H__4(1))):73:202));

      /end-free
     C/Exec SQL
     C+  fetch next from substat into :p_zkeya, :p_zkeyn, :p_zdesc, :p_zusage, :
     C+ rrn
     C/End-Exec
      /free
       x = x + 1;
       enddo;
      /end-free
     C/Exec SQL
     C+  close substat
     C/End-Exec
      /free
       outweb_(%subst(%str(%addr(H__3(1))):1:52));
       outweb_(%subst(%str(%addr(H__6(1))):1:1067));
       wfrtn__ = AfToPage_(QPGMNAM__);
       outweb_(%subst(%str(%addr(H__6(14))):28:219));
       AfToPage_(%trim(%editc(PAGENUM:'3')));
       outweb_(%subst(%str(%addr(H__6(17))):7:21));
       AfToPage_(%trim(%editc(PAGEMAX:'3')));
       outweb_(%subst(%str(%addr(H__6(17))):28:2301));
       outweb_(%subst(%str(%addr(H__3(1))):53:29));

      /end-free
     c     *PSSR         begsr
     c                   endsr
     P                 E


     P*---------------------------------------------------------------------
     P* add_substat0...             - User defined function
     P*---------------------------------------------------------------------
     P add_substat0...
     P                 B
     D add_substat0...
     D                 PI




      /free
       outweb_(%subst(%str(%addr(H__1(1))):1:20));
       outweb_(%subst(%str(%addr(H__6(1))):1:1067));
       wfrtn__ = AfToPage_(QPGMNAM__);
       outweb_(%subst(%str(%addr(H__6(14))):28:219));
       AfToPage_(%trim(%editc(PAGENUM:'3')));
       outweb_(%subst(%str(%addr(H__6(17))):7:21));
       AfToPage_(%trim(%editc(PAGEMAX:'3')));
       outweb_(%subst(%str(%addr(H__6(17))):28:2301));
       outweb_(%subst(%str(%addr(H__1(1))):21:5));
       outweb_(%subst(%str(%addr(H__5(1))):1:571));
       outweb_(%subst(%str(%addr(H__1(1))):26:464));
       mainstat_box0();
       outweb_(%subst(%str(%addr(H__1(7))):10:760));

      /end-free
     c     *PSSR         begsr
     c                   endsr
     P                 E


     P*---------------------------------------------------------------------
     P* dlrbox0...                  - User defined function
     P*---------------------------------------------------------------------
     P dlrbox0...
     P                 B
     D dlrbox0...
     D                 PI




      /free
       OutWeb_('<label class=''control-label''>Individual Dealer</label>');
       if (mode = 'edit');
        OutWeb_('<select readonly class=''required form-control'' id=''MDLR''-
        name=''MDLR''>');
       else;
        OutWeb_('<select class=''required form-control'' id=''MDLR'' name=''M-
       DLR''>');
       endif;
       OutWeb_('<option value=''''></option>');
      /end-free
     C/Exec SQL
     C+  declare dlrs scroll cursor for 		select PDNO, PDNAME from kwpdbase orde
     C+ r by cast(pdno as float) asc
     C/End-Exec
      /free
      /end-free
     C/Exec SQL
     C+  open dlrs
     C/End-Exec
      /free
      /end-free
     C/Exec SQL
     C+  fetch next from dlrs into :pdno, :pdname
     C/End-Exec
      /free
       dow (((sqlcod <> 100) and (sqlcod >= 0)));
       if (pemltype = pdno);
        OutWeb_(%trimr( '<option selected value=''' + %trim(pdno) + '''>' +
       %trim(pdno) + ' - ' + %trim(pdname) + '</option>'));
       else;
        OutWeb_(%trimr( '<option value=''' + %trim(pdno) + '''>' + %trim(
       pdno) + ' - ' + %trim(pdname) + '</option>'));
       endif;
      /end-free
     C/Exec SQL
     C+  fetch next from dlrs into :pdno, :pdname
     C/End-Exec
      /free
       enddo;
      /end-free
     C/Exec SQL
     C+  close dlrs
     C/End-Exec
      /free
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
       if   ((file__='KWP_DATA' or file__='*ALL') and NOT %OPEN(KWP_DATA));
        if (mbr__ <> '*FIRST');
         ovrdbf_(ovrflag__:'KWP_DATA':'KWP_DATA' : '*LIBL' : mbr__);
        elseif ('KWP_DATA' <> 'KWP_DATA');
         ovrdbf_(ovrflag__:'KWP_DATA':'KWP_DATA' : '*LIBL');
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
        if (mbr__ <> '*FIRST');
         ovrdbf_(ovrflag__:'KWS_DATA':'KWS_DATA' : '*LIBL' : mbr__);
        elseif ('KWS_DATA' <> 'KWS_DATA');
         ovrdbf_(ovrflag__:'KWS_DATA':'KWS_DATA' : '*LIBL');
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
       if   ((file__='KWPEMAIL' or file__='*ALL') and NOT %OPEN(KWPEMAIL));
        if (mbr__ <> '*FIRST');
         ovrdbf_(ovrflag__:'KWPEMAIL':'KWPEMAIL' : '*LIBL' : mbr__);
        elseif ('KWPEMAIL' <> 'KWPEMAIL');
         ovrdbf_(ovrflag__:'KWPEMAIL':'KWPEMAIL' : '*LIBL');
        endif;
        if    erropen__ = 'Y';
         OPEN(E) KWPEMAIL;                //    KWPEMAIL
         if        %error;
          return %error;
         endif;
        else;
         OPEN KWPEMAIL;                //    KWPEMAIL
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
       if   ((file__='KWLAPPL' or file__='*ALL') and NOT %OPEN(KWLAPPL));
        if (mbr__ <> '*FIRST');
         ovrdbf_(ovrflag__:'KWLAPPL':'KWLAPPL' : '*LIBL' : mbr__);
        elseif ('KWLAPPL' <> 'KWLAPPL');
         ovrdbf_(ovrflag__:'KWLAPPL':'KWLAPPL' : '*LIBL');
        endif;
        if    erropen__ = 'Y';
         OPEN(E) KWLAPPL;                //    KWLAPPL
         if        %error;
          return %error;
         endif;
        else;
         OPEN KWLAPPL;                //    KWLAPPL
        endif;
       endif;
       if   ((file__='KWPDSTAT' or file__='*ALL') and NOT %OPEN(KWPDSTAT));
        if (mbr__ <> '*FIRST');
         ovrdbf_(ovrflag__:'KWPDSTAT':'KWPDSTAT' : '*LIBL' : mbr__);
        elseif ('KWPDSTAT' <> 'KWPDSTAT');
         ovrdbf_(ovrflag__:'KWPDSTAT':'KWPDSTAT' : '*LIBL');
        endif;
        if    erropen__ = 'Y';
         OPEN(E) KWPDSTAT;                //    KWPDSTAT
         if        %error;
          return %error;
         endif;
        else;
         OPEN KWPDSTAT;                //    KWPDSTAT
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
       when      rcdfmt__='RKWPDATA' and AM005_ = CV_ByKey and RS005_ = *ON ;
       update RKWPDATA;
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
**CTDATA H__1        AddSeg                           1249
<html>
  <head>
    
    
    <title>Add Sub-Status</title>
  </head>
  <body>

    <div class="container">
      <div class="page-header"><h2>Add Sub-Status</
h2></div>
      <form method="post" id="substat_form">
        <input type="hidd
en" name="task" id="task" value="submit">
        <input type="hidden" name="mod
e" id="mode" value="add">
        <div class="row">
          <div class="col-lg
-4 form-group">
            <label class="control-label">Main Status</label>

         
          </div>
          <div class="col-lg-2 form-group">

 	<label class="control-label">Sub-Status Name</label>
          	<input type="t
ext" class="form-control" name="p_zusage" id="p_zusage" maxlength="10">

  </div>
          <div class="col-lg-4 form-group">
            <label class="c
ontrol-label">Sub-Status Description</label>
            <textarea class="form-c
ontrol required" maxlength="80" name="p_zdesc" id="p_zdesc" rows="3"></textarea>

          </div>
          <div class="col-lg-2 form-group">
            <label
 class="control-label" style="width:200px">&nbsp;</label>
            <button cl
ass="btn btn-primary" type="submit">Submit</button>
          </div>
        </d
iv>
      </form>
    </div>   
  </body>
</html>
**CTDATA H__2        page                             3539
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
    <title>Dealer Decision Messages</title>
    
  </head>
  <body>
    <d
iv class="container">
      <!-- modal window boxes -->
      <div class="modal
fade" id="ays_del">
        <div class="modal-dialog">
          <div class="mod
al-content">
            <div class="modal-header">
              <h4 class="mod
al-title"><strong>Are You Sure</strong>
              <button type="button" clas
s="close" data-dismiss="modal">&times;</button>
              </h4>  

  </div>
            <div class="modal-body" id="ays-body">Are you sure you wish
 to delete this sub-status?
            </div>
            <div class="modal-foo
ter">
              <button type="button" class="btn btn-primary" id="delconf">Y
es</button>
              <button type="button" class="btn btn-default" data-dis
miss="modal">No</button>              
            </div>
          </div><!-- /
.modal-content -->
        </div><!-- /.modal-dialog -->
      </div><!-- /.moda
l -->   
      
      <div class="modal fade" id="info">
        <div class="mod
al-dialog">
          <div class="modal-content">
            <div class="modal-
header">
              <button type="button" class="close" data-dismiss="modal"
aria-hidden="true">&times;</button>
              <h4 class="modal-title" id="md
-title"></h4>
            </div>
            <div id="modal-id" class="modal-bod
y">
            </div>
          </div><!-- /.modal-content -->
        </div><!
-- /.modal-dialog -->
      </div><!-- /.modal -->
      
      <div class="page
-header"><h2>Loan Sub-Statuses</h2></div>
      <div class="panel-group" id="acc
ordion">
        <div class="panel panel-default">
          <div class="panel p
anel-heading">
            <!--<h5 class="panel-title"><a class="accordion-toggl
e" data-toggle="collapse" data-parent="#accordion" href="#filters">Toggle Filter
s</a>-->        
            <form name="search_form" id="search_form" class="fo
rm-inline">
              <input type="hidden" name="task" value="DEFAULT">

          <div class="form-group col-lg-1">
                <strong>Status:</str
ong>
              </div>
              <div class="form-group col-lg-4">

          
              </div>
              <div class="form-group col-lg-1">

                <button type="submit" class="btn btn-primary">Search</button>	

             </div>
              <div class="form-group col-lg-4">

    <button type="button" id="new_substat" class="btn btn-default">New Sub-Statu
s</button>   
                <button type="button" id="del_all" class="btn btn-
danger">Delete All</button>  
              </div>
            </form> 

    <div class="pull-right">     
              <ul id="pgnt"></ul>

</div>     
          </div>      
        </div>
      </div>
      <br>


      <table id="data" class="table table-condensed table-bordered table-stripe
d sortable">
        <thead>
          <tr>
            <th>Main Status</th>

         <th>Sub Status Name</th>
            <th>Sub Status Description</th>

          <th>Actions</th>
          </tr>
        </thead>
        <tbody id="c
ontainer">

**CTDATA H__3        page_close                       81
              </tbody>
            </table>    
    
    </div>
  </body>
</html
>
**CTDATA H__4        data                             274
<tr>
<input type="hidden" class="rrn" value="">
<td></td>
<td></td>
<td></td>
<t
d><a href="#" class="edit_substat" style="color:black;"><i class="fa fa-cog fa-2
x"></i></a><a href="#" class="del_substat" style="color:black;"><i class="fa fa-
trash-o fa-2x"></i></a></td>
</tr>
**CTDATA H__5        css                              571
    <link rel="stylesheet" type="text/css" href="/k_com/bootstrap/3/bootstrap.mi
n.css"><!-- bootstrap -->
    <link rel="stylesheet" type="text/css" href="/k_co
m/bootstrap-sortable.css">
    <link rel="stylesheet" type="text/css" href="/k_c
om/fontAwesome/4.0/css/font-awesome.min.css"><!-- font awesome -->
    <link rel
="stylesheet" type="text/css" href="//ajax.googleapis.com/ajax/libs/jqueryui/1.1
0.3/themes/smoothness/jquery-ui.css">   
    <style type="text/css">
    .error-
div{ font-weight:bold; color: #B94A48 } 
    #pgnt{ margin:auto !important; }

  </style>

**CTDATA H__6        js                               3608
<script src="//ajax.googleapis.com/ajax/libs/jquery/2.0.3/jquery.min.js"></scrip
t>
<script src="//ajax.googleapis.com/ajax/libs/jqueryui/1.10.3/jquery-ui.min.js
"></script>
<script type="text/javascript" src="/k_com/bootstrap/3/bootstrap.min
.js"></script><!-- bootstrap jquery file -->
<script type="text/javascript" src=
"/k_com/bootstrap-paginator.js"></script>
<script type="text/javascript" src="/k
_com/bootstrap-formhelpers-selectbox.js"></script>
<script type="text/javascript
" src="/k_com/bootstrap-formhelpers-states.en_US.js"></script>
<script type="tex
t/javascript" src="/k_com/bootstrap-formhelpers-states.js"></script>
<script typ
e="text/javascript" src="/k_com/bootstrap-sortable.js"></script>
<script type="t
ext/javascript" src="/k_com/jquery.validate.min.js"></script>
<script type="text
/javascript" src="/k_com/additional-methods.js"></script>
<script type="text/jav
ascript" src="/k_com/jquery.mask.min.js"></script>
<script type="text/javascript
" src="/k_com/numeric.js"></script>
<script type="text/javascript">

	function d
el_substat(rrn){
		$.post("", { task: 'del_substat', rrn: rrn }, function(dta){
location.reload(); });	
	}
	
    $(document).ready(function(){
    	
    	
			va
r options = {
				
				bootstrapMajorVersion: 3,
				size: "small",
				currentP
age: "", 
				totalPages: "",
				pageUrl: function(type, page, current){

					
var url = setGetParameter("page", page);

					return url;
            	}				
		
	}
			
			$("#pgnt").bootstrapPaginator(options);
			
    	$(".numeric").numeric
();
    
    	$.validator.addClassRules("required", { required: true });
    	

   	$("#substat_form").validate({

            errorPlacement: function(error, e
lement) {
            	$(element).closest('.form-group').find('.error-div').remo
ve();
            	$(element).closest('.form-group').append("<div class='error-d
iv'>" + error.text() + "</div>");         
            },
            highlight:
 function(element) {
                	$(element).closest('.form-group').addClass
('has-error');

            },
            unhighlight: function(element) {

        	$(element).closest('.form-group').find('.error-div').remove();

    	$(element).closest('.form-group').removeClass("has-error")
            }

      });
          
				
		$(".del_substat").click(function(evt){
				evt.preve
ntDefault();
				var rrn = $(this).parent().parent().find(".rrn").val();
				$("
#delconf").click(function(){ del_substat(rrn); });
				$("#ays_del").modal();	
	
	});
		
		$(".edit_substat").click(function(evt){
			evt.preventDefault();
			va
r rrn = $(this).parent().parent().find(".rrn").val();
			location.href="?task=ed
it_substat&rrn="+rrn;
		});
		
		$("#new_substat").click(function(){
			location
.href = "?task=add_substat";	
		});
		
		$("#del_all").click(function(){
			
			
var r = confirm("Are you sure you wish to delete all loan sub-statuses?");
			if
 (r == true){
				location.href= "?task=del_all";
			}
		});
        
    });

  
    function setGetParameter(paramName, paramValue)
{
    var url = window.lo
cation.href;
    if (url.indexOf(paramName + "=") >= 0)
    {
        var prefix
 = url.substring(0, url.indexOf(paramName));
        var suffix = url.substring(
url.indexOf(paramName)).substring(url.indexOf("=") + 1);
        suffix = (suffi
x.indexOf("&") >= 0) ? suffix.substring(suffix.indexOf("&")) : "";
        url =
 prefix + paramName + "=" + paramValue + suffix;
    }
    else
    {
    if (ur
l.indexOf("?") < 0)
        url += "?" + paramName + "=" + paramValue;
    else

        url += "&" + paramName + "=" + paramValue;
    }
    return url;
}
    <
/script>
**CTDATA H__7        not_found                        98
<tr>
<td colspan="4" style="font-weight:bold; text-align:center">No sub-statuses
 found.</td>
</tr>
**CTDATA H__8        EditSeg                          1359
<html>
  <head>
    
    
    <title>Edit Sub Status</title>
  </head>
  <body>
 
    <div class="container">
      <div class="page-header"><h2>Edit Sub Status
</h2></div>
      <form method="post" id="mesg_form">
        <input type="hidde
n" name="task" id="task" value="submit">
        <input type="hidden" name="mode
" value="">
        <input type="hidden" name="p_zkeyn" value="">
        <div c
lass="row">
          <div class="col-lg-2 form-group">
            <label class
="control-label">Main Status</label>
            <input type="text" name="p_zkey
a" class="form-control" value="" readonly>
          </div>
          <div class
="col-lg-2 form-group">
            <label class="control-label">Sub Status Name
</label>
            <input type="text" name="p_zusage" class="form-control" max
length="10" value="">
          </div>
          <div class="col-lg-4 form-group
">
            <label class="control-label">Sub Status Description</label>

       <textarea class="form-control required" maxlength="80" name="p_zdesc" id=
"p_zdesc" rows="3"></textarea>
          </div>
          <div class="col-lg-2 f
orm-group">
            <label class="control-label" style="width:200px">&nbsp;<
/label>
            <button class="btn btn-primary" type="submit">Submit</button
>
          </div>
        </div>
      </form>
    </div>   
  </body>
</html>

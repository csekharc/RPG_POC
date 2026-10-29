     H/TITLE  loan listing
      * ProGen WebSmart Revision 28963
      * File overrides for compile command
      *__OV OVRDBF KWLBASE    KWLBASE
      *__OV OVRDBF KWPDSTAT   KWPDSTAT
      *__OV OVRDBF KWLAPPL    KWLAPPL
      *__OV OVRDBF KWSMNUOPT  KWSMNUOPT
      *__OV OVRDBF KWCCONT    KWCCONT
      *__OV OVRDBF KW_APPL    KW_APPL
      *__OV OVRDBF KWPDURL    KWPDURL
      *__OV OVRDBF KWPDBASE   KWPDBASE
      *__OV OVRDBF KWPUOPT    KWPUOPT
      *__OV OVRDBF KWPUBASE   KWPUBASE
      *__OV OVRDBF KWPDLOC    KWPDLOC
      *__   Following values are used to create the server program
      *__RO Pgm  lib DEVWEBSMT  Pgm  S_DLRO
      *__AG          WEBSMART
      *__CL          *OBJLIBNAM
      *__SQ
      *__BD ECRTBND204
      *===============================================================*
      * Path:   s_dlro_new.pdw
      * System: RAJASHEKAR
      * Project:Kwik-Loan
      * Set:    Dev Websmart
      * User:   rajashekhar.battu
      * Date Last Generated:   2020-07-30   13:49:17
      * Last Generated CRC: 38BDFB0D DF69A2FF 0932E05A DEA234D0
      *===============================================================*
      */CPY *LIBL/PW_CSRC CPYRIGHT
      * File specifications
     FKWLBASE   IF   E           K DISK    USROPN
     F                                     INFDS(FID001_   )
     FKWPDSTAT  IF   E           K DISK    USROPN
     F                                     INFDS(FID002_   )
     FKWLAPPL   IF   E           K DISK    USROPN
     F                                     INFDS(FID003_   )
     FKWSMNUOPT IF   E           K DISK    USROPN
     F                                     INFDS(FID004_   )
     FKWCCONT   IF   E           K DISK    USROPN
     F                                     INFDS(FID005_   )
     FKW_APPL   IF   E           K DISK    USROPN
     F                                     INFDS(FID006_   )
     FKWPDURL   IF   E           K DISK    USROPN
     F                                     INFDS(FID007_   )
     FKWPDBASE  IF   E           K DISK    USROPN
     F                                     INFDS(FID008_   )
     FKWPUOPT   IF   E           K DISK    USROPN
     F                                     INFDS(FID009_   )
     FKWPUBASE  IF   E           K DISK    USROPN
     F                                     INFDS(FID010_   )
     FKWPDLOC   IF   E           K DISK    USROPN
     F                                     INFDS(FID011_   )

     D PTL__           S             50    DIM(1) CTDATA PERRCD(1)
     D RTLLA__         S             11    DIM(180)

     D*+FLDDCL Field declarations

     Duserdata         DS                  INZ
     D client                         5A
     D userid                        32A
     D location                       5A

     D artncod         S              5A
     D nx              S              5P 0
     D pgm             S             30A
     D mode            S              4A
     D cookie_fld      S           1024A
     D tryflag         S              1A
     D lastpgm         S             10A
     D box_lnk         S           1024A
     D addhref         S            200A
     D query           S           2048A
     D whrlink         S             15A
     D idisplaylength  S             11A
     D secho           S              5A
     D ssearch         S           1024A
     D x               S             11P 0
     D sort            S             64A
     D sort_col        S            128A
     D filt            S           1024A
     D columns_filt    S             20A     DIM(12       )
     D columns_sort    S             20A     DIM(12       )
     D disabled        S             10A
     D sort_alpha      S              2A
     D sort_int        S              2P 0
     D rrn             S              9P 0
     D csz             S            100A
     D setlibraryflag  S              1A

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
     D rwcolor1__      S             32A   INZ('altcol1')
     D rwcolor2__      S             32A   INZ('altcol2')


     D TASKRAN__       S              1    INZ(*OFF)


     D H__1            S             80    PERRCD(1) CTDATA DIM(12          )

     D H__2            S             80    PERRCD(1) CTDATA DIM(71          )

     D H__3            S             80    PERRCD(1) CTDATA DIM(35          )

     D H__4            S             80    PERRCD(1) CTDATA DIM(1           )


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

     D callpgm0...
     D                 PR
     D init_list0...
     D                 PR
     D wrt_list0...
     D                 PR
     D set_filt0...
     D                 PR
     D set_sort0...
     D                 PR
     D cnt_rcd0...
     D                 PR
     D bld_query0...
     D                 PR
     D trans_cols0...
     D                 PR
     D set_optbox0...
     D                 PR
     D QPGMNAM__       S             20A
     D SmurfChk__      S              1A   INZ(*ON)
     D Smurf_ID__      S             64A   IMPORT
     D Smurf_Rw__      S              9B 0 IMPORT

     D pagenum         S                   LIKE(x             )
     D idisplaystart   S                   LIKE(x             )
     D itotalrecords   S                   LIKE(x             )
     D icolumns        S                   LIKE(x             )
     D isortingcols    S                   LIKE(x             )
     D itotaldisp      S                   LIKE(x             )
     D max_row         S                   LIKE(x             )
     D secho_r         S                   LIKE(x             )

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

     C     DL004_        KLIST
     C                   KFLD                    smenuclid
     C                   KFLD                    smenu
     C                   KFLD                    smenuopt
     C     DL009_        KLIST
     C                   KFLD                    userid
     C                   KFLD                    puotype
     C     DL010_        KLIST
     C                   KFLD                    puid
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
     C+  SET OPTION DATFMT = *USA
     C/End-Exec
      /free
       PGSIZELM__ = 999999999;
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
       setlibraryflag = 'N';
       setlibraryflag = rtmwrpa_('WEBSMART':'KWDB108':setlibraryflag:'*NOLOCK-
       ':'GET');
       if (setlibraryflag = 'Y');
        ExecCmd2_( 'KWSET ' + %trim(client):%len(%trimr( 'KWSET ' + %trim(
       client))));
       endif;
       Open_File_('*ALL': '*FIRST':  'Y');
       kw_wrtdataarea('*LDA':userid:'*LIBL':1:32);
       if (task__ = 'DEFAULT');
        taskran__ = *ON;
        init_list0();
       endif ;
       if (task__ = 'WRT_LIST');
        taskran__ = *ON;
        wrt_list0();
       endif ;
       if (task__ = 'CALLPGM');
        taskran__ = *ON;
        callpgm0();
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
     P* callpgm0...                 - User defined function
     P*---------------------------------------------------------------------
     P callpgm0...
     P                 B
     D callpgm0...
     D                 PI




      /free
       pgm = getparm3_('pgm':'*OPT');
       mcust = %dec(aton_( getparm3_('mcust':'*OPT'):46:16):9:0);
       macct = %dec(aton_( getparm3_('macct':'*OPT'):46:16):5:0);
       mode = getparm3_('mode':'*OPT');
       if (pgm = 'kwnewapp.pgm');
        pgm = 'lnappl.pgm';
        MACCT = KWnewapp(client:userid:MCUST);
       endif;
       SetSmurf_('MCUST':%editc(MCUST:'L'));
       SetSmurf_('MACCT':%editc(MACCT:'L'));
       Redirect2_( %trim(pgm) + '?mode=' + mode:'*SAME');
      /end-free
     c     *PSSR         begsr
     c                   endsr
     P                 E


     P*---------------------------------------------------------------------
     P* init_list0...               - User defined function
     P*---------------------------------------------------------------------
     P init_list0...
     P                 B
     D init_list0...
     D                 PI




      /free
       pdno = getparm3_('pdno':'*OPT');
       puid = userid;
       AM010_ = CV_BYKEY;
       CHAIN(NE) DL010_ RKWPUBASE;
       RS010_ = RcdSts2_('GETRCD': %error: %found: %eof);
       puotype = 'ADDDLR';
       AM009_ = CV_BYKEY;
       CHAIN(NE) DL009_ RKWPUOPT;
       RS009_ = RcdSts2_('GETRCD': %error: %found: %eof);
       select;
       when ((RS009_ = '1') and (puoyesno = 'N'));
       addhref = '';
       disabled = 'disabled';
       when ((puprofile <> 'ADMINISTRATOR') and (puoyesno <> 'Y'));
       addhref = '';
       disabled = 'disabled';
       other;
       addhref = 's_dlro_old.pgm?task=beginmanage&rrn=0&PDNO=' + %trim(pdno);
       endsl;
      /end-free
     C/Exec SQL
     C+  SELECT COUNT(*) INTO :iTotalRecords FROM KWPDLOC where PDNO = :PDNO and
     C+  PDLOC <> 0
     C/End-Exec
      /free
       outweb_(%subst(%str(%addr(H__3(1))):1:490));
       outweb_(%subst(%str(%addr(H__1(1))):1:952));
       outweb_(%subst(%str(%addr(H__3(7))):11:667));
       wfrtn__ = AfToPage_(PDNO);
       outweb_(%subst(%str(%addr(H__3(15))):38:159));
       wfrtn__ = AfToPage_(ADDHREF);
       outweb_(%subst(%str(%addr(H__3(17))):37:1405));
       outweb_(%subst(%str(%addr(H__2(1))):1:1211));
       wfrtn__ = AfToPage_(QPGMNAM__);
       outweb_(%subst(%str(%addr(H__2(16))):12:2218));
       wfrtn__ = AfToPage_(PDNO);
       outweb_(%subst(%str(%addr(H__2(43))):70:211));
       AfToPage_(%trim(%editc(ITOTALRECORDS:'3')));
       outweb_(%subst(%str(%addr(H__2(46))):41:1074));
       wfrtn__ = AfToPage_(QPGMNAM__);
       outweb_(%subst(%str(%addr(H__2(59))):75:182));
       wfrtn__ = AfToPage_(QPGMNAM__);
       outweb_(%subst(%str(%addr(H__2(62))):17:770));
       outweb_(%subst(%str(%addr(H__3(35))):2:18));

      /end-free
     c     *PSSR         begsr
     c                   endsr
     P                 E


     P*---------------------------------------------------------------------
     P* wrt_list0...                - User defined function
     P*---------------------------------------------------------------------
     P wrt_list0...
     P                 B
     D wrt_list0...
     D                 PI




      /free
       idisplaystart = %dec(aton_( getparm3_('idisplaystart':'*OPT'):46:16):
       11:0);
       idisplaylength = getparm3_('idisplaylength':'*OPT');
       isortingcols = %dec(aton_( getparm3_('isortingcols':'*OPT'):46:16):11:0);
       ssearch = getparm3_('ssearch':'*OPT');
       secho = getparm3_('secho':'*OPT');
       itotalrecords = %dec(aton_( getparm3_('itotalrecords':'*OPT'):46:16):
       11:0);
       icolumns = %dec(aton_( getparm3_('icolumns':'*OPT'):46:16):11:0);
       pdno = getparm3_('pdno':'*OPT');
       trans_cols0();
       secho_r = %dec(aton_(secho:46:16):46:16);
       set_filt0();
       cnt_rcd0();
       if (((idisplaylength = '-1') or (idisplaylength = 'ALL')));
        idisplaylength = %trim(%editc(itotalrecords:'P'));
       endif;
       set_sort0();
       sort = ' order by ' + sort_col;
       bld_query0();
      /end-free
     C/Exec SQL
     C+            Declare LN Scroll Cursor
     C+            For LN
     C/End-Exec
     C/Exec SQL
     C+            Prepare LN
     C+            From :query
     C/End-Exec
      /free
       if (sqlcod >= 0);
      /end-free
     C/Exec SQL
     C+            Open LN
     C/End-Exec
      /free
       endif;
      /end-free
     C/Exec SQL
     C+  FETCH NEXT FROM LN INTO :rrn, :PDLOC, :PDNAM1, :PDADR1, :PDCITY, :PDST,
     C+  :PDZIP
     C/End-Exec
      /free
       if (((sqlcod <> 100) and (sqlcod >= 0)));
        OutWeb_( '{ "sEcho":' + %trim(%editc(secho_r:'P')) + ',"iTotalRecords-
       ":' + %trim(%editc(itotalrecords:'P')) + ',"iTotalDisplayRecords":' +
       %trim(%editc(itotaldisp:'P')) + ', "aaData": [');
       else;
        OutWeb_( '{"sEcho":' + %trim(%editc(secho_r:'P')) + ',"iTotalRecords"-
       :0,"iTotalDisplayRecords":0,"aaData": []}');
       endif;
       x = 1;
       dow (((sqlcod <> 100) and (sqlcod >= 0)));
       if (pdcity <> '');
        csz = %trim(pdcity) + ', ' + pdst + ' ' + %editw(PDZIP:'     -    ');
       endif;
       set_optbox0();
       outweb_(%subst(%str(%addr(H__4(1))):1:12));
       wfrtn__ = AfToPage_(BOX_LNK);
       outweb_(%subst(%str(%addr(H__4(1))):13:14));
       AfToPage_(%trim(%editc(PDLOC:'3')));
       outweb_(%subst(%str(%addr(H__4(1))):27:14));
       wfrtn__ = AfToPage_(PDNAM1);
       outweb_(%subst(%str(%addr(H__4(1))):41:14));
       wfrtn__ = AfToPage_(PDADR1);
       outweb_(%subst(%str(%addr(H__4(1))):55:11));
       wfrtn__ = AfToPage_(CSZ);
       outweb_(%subst(%str(%addr(H__4(1))):66:1));

      /end-free
     C/Exec SQL
     C+  FETCH NEXT FROM LN INTO :rrn, :PDLOC, :PDNAM1, :PDADR1, :PDCITY, :PDST,
     C+  :PDZIP
     C/End-Exec
      /free
       if (((sqlcod <> 100) and (sqlcod >= 0)));
        OutWeb_('},');
       else;
        OutWeb_('}]}');
       endif;
       x = x + 1;
       enddo;
      /end-free
     C/Exec SQL
     C+  CLOSE LN
     C/End-Exec
      /free
      /end-free
     c     *PSSR         begsr
     c                   endsr
     P                 E


     P*---------------------------------------------------------------------
     P* set_filt0...                - User defined function
     P*---------------------------------------------------------------------
     P set_filt0...
     P                 B
     D set_filt0...
     D                 PI




      /free
       whrlink = ' AND ';
       if (ssearch <> '');
        x = 1;
        dow (x< icolumns);
        if (x = 1);
         filt = %trim(filt) + ' ' + %trim(whrlink) + ' (' + %trim(
       columns_filt(x)) + ' like ''%' + %trim(ssearch) + '%'' ';
        else;
         filt = %trim(filt) + ' ' + %trim(whrlink) + ' ' + %trim(
       columns_filt(x)) + ' like ''%' + %trim(ssearch) + '%'' ';
        endif;
        whrlink = ' OR ';
        x = x + 1;
        enddo;
        filt = %trim(filt) + ')';
       endif;
       x = 0;
       dow (x< icolumns);
       if ( getparm3_( 'sSearch_' + %trim(%editc(x:'P')):'*OPT') <> '');
        if ( %trim(filt) <> '');
         whrlink = ' AND ';
        endif;
        if (columns_filt( x + 1) = 'BS.MODATE');
         filt = %trim(filt) + ' ' + %trim(whrlink) + ' CAST(' + %trim(
       columns_filt( x + 1)) + ' AS CHAR(10)) like ''%' + %trim( getparm3_( '-
       sSearch_' + %trim(%editc(x:'P')):'*OPT')) + '%'' ';
        else;
         filt = %trim(filt) + ' ' + %trim(whrlink) + ' ' + %trim(
       columns_filt( x + 1)) + ' like ''%' + %trim( getparm3_( 'sSearch_' +
       %trim(%editc(x:'P')):'*OPT')) + '%'' ';
        endif;
       endif;
       x = x + 1;
       enddo;
      /end-free
     c     *PSSR         begsr
     c                   endsr
     P                 E


     P*---------------------------------------------------------------------
     P* set_sort0...                - User defined function
     P*---------------------------------------------------------------------
     P set_sort0...
     P                 B
     D set_sort0...
     D                 PI




      /free
       x = 0;
       dow (x< isortingcols);
       sort_alpha = getparm3_( 'iSortCol_' + %trim(%editc(x:'P')):'*OPT');
       if (sort_alpha <> '');
        sort_int = %dec(aton_(sort_alpha:46:16):46:16);
        if (sort_int <= 0);
         sort_int = 1;
        endif;
        sort_col = %trim(sort_col) + ' ' + %trim(columns_sort(sort_int)) + ' -
       ' + getparm3_( 'sSortDir_' + %trim(%editc(x:'P')):'*OPT');
        if ( getparm3_( 'iSortCol_' + %trim(%editc( x + 1:'P')):'*OPT') <> '');
         sort_col = %trim(sort_col) + ',';
        endif;
       endif;
       x = x + 1;
       enddo;
       if ( %trim(sort_col) = '');
        sort_col = ' PDLOC ASC';
       endif;
      /end-free
     c     *PSSR         begsr
     c                   endsr
     P                 E


     P*---------------------------------------------------------------------
     P* cnt_rcd0...                 - User defined function
     P*---------------------------------------------------------------------
     P cnt_rcd0...
     P                 B
     D cnt_rcd0...
     D                 PI




      /free
       query = 'SELECT COUNT(*) FROM KWPDLOC WHERE PDNO = ''' + %trim(pdno)
       + ''' and PDLOC <> 0';
       query = %trim(query) + ' ' + %trim(filt);
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
     C+  FETCH FIRST FROM CNT INTO :iTotalDisp
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
     P* bld_query0...               - User defined function
     P*---------------------------------------------------------------------
     P bld_query0...
     P                 B
     D bld_query0...
     D                 PI




      /free
       max_row = idisplaystart + %dec(aton_(idisplaylength:46:16):46:16);
       query = 'WITH QUERY AS ' + '(SELECT rrn(KWPDLOC), PDLOC, PDNAM1, PDADR-
       1, PDCITY, PDST, PDZIP, ' + 'ROW_NUMBER() OVER (' + %trim(sort) + ') A-
       S RN ' + 'FROM KWPDLOC WHERE PDNO = ''' + %trim(pdno) + ''' and PDLOC -
       <> 0 ';
       query = %trim(query) + ' ' + %trim(filt);
       query = %trim(query) + ' ) ' + 'SELECT * ' + 'FROM QUERY ' + 'WHERE RN-
        BETWEEN ' + %trim( %trim(%editc( idisplaystart + 1:'P'))) + ' AND '
       + %trim( %trim(%editc(max_row:'P')));
      /end-free
     c     *PSSR         begsr
     c                   endsr
     P                 E


     P*---------------------------------------------------------------------
     P* trans_cols0...              - User defined function
     P*---------------------------------------------------------------------
     P trans_cols0...
     P                 B
     D trans_cols0...
     D                 PI




      /free
       x = 1;
       dow (x< icolumns);
       select;
       when ( getparm3_( 'mDataProp_' + %trim(%editc(x:'P')):'*OPT') = 'ofclo-
       c');
       columns_filt(x) = 'PDLOC';
       columns_sort(x) = 'PDLOC';
       when ( getparm3_( 'mDataProp_' + %trim(%editc(x:'P')):'*OPT') = 'ofcna-
       m');
       columns_filt(x) = 'PDNAM1';
       columns_sort(x) = 'PDNAM1';
       when ( getparm3_( 'mDataProp_' + %trim(%editc(x:'P')):'*OPT') = 'ofcad-
       r');
       columns_filt(x) = 'PDADR1';
       columns_sort(x) = 'PDADR1';
       when ( getparm3_( 'mDataProp_' + %trim(%editc(x:'P')):'*OPT') = 'csz');
       columns_filt(x) = 'PDCITY';
       columns_sort(x) = 'PDCITY';
       endsl;
       x = x + 1;
       enddo;
      /end-free
     c     *PSSR         begsr
     c                   endsr
     P                 E


     P*---------------------------------------------------------------------
     P* set_optbox0...              - User defined function
     P*---------------------------------------------------------------------
     P set_optbox0...
     P                 B
     D set_optbox0...
     D                 PI




      /free
       box_lnk = '<a href=\"S_DLRO_OLD.PGM?TASK=beginmanage&rrn=' + %trim(
       %editc(rrn:'Z')) + '&PDNO=' + %trim(pdno) + '\"><img src=\"/websmart/v-
       7.2/Lincoln/images/edit.gif\"  alt=\"Edit\" title=\"Edit\"></a><a href-
       =\"S_DLRO_OLD.PGM?TASK=delconf&rrn=' + %trim( %editc(rrn:'Z')) + '&PDN-
       O=' + %trim(pdno) + '\"><img src=\"/websmart/v7.2/Lincoln/images/delet-
       e.gif\" alt=\"Delete\" title=\"Delete\"></a>';
       box_lnk = %trim(box_lnk);
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
       if   ((file__='KWSMNUOPT' or file__='*ALL') and NOT %OPEN(KWSMNUOPT));
        if (mbr__ <> '*FIRST');
         ovrdbf_(ovrflag__:'KWSMNUOPT':'KWSMNUOPT' : '*LIBL' : mbr__);
        elseif ('KWSMNUOPT' <> 'KWSMNUOPT');
         ovrdbf_(ovrflag__:'KWSMNUOPT':'KWSMNUOPT' : '*LIBL');
        endif;
        if    erropen__ = 'Y';
         OPEN(E) KWSMNUOPT;                //    KWSMNUOPT
         if        %error;
          return %error;
         endif;
        else;
         OPEN KWSMNUOPT;                //    KWSMNUOPT
        endif;
       endif;
       if   ((file__='KWCCONT' or file__='*ALL') and NOT %OPEN(KWCCONT));
        if (mbr__ <> '*FIRST');
         ovrdbf_(ovrflag__:'KWCCONT':'KWCCONT' : '*LIBL' : mbr__);
        elseif ('KWCCONT' <> 'KWCCONT');
         ovrdbf_(ovrflag__:'KWCCONT':'KWCCONT' : '*LIBL');
        endif;
        if    erropen__ = 'Y';
         OPEN(E) KWCCONT;                //    KWCCONT
         if        %error;
          return %error;
         endif;
        else;
         OPEN KWCCONT;                //    KWCCONT
        endif;
       endif;
       if   ((file__='KW_APPL' or file__='*ALL') and NOT %OPEN(KW_APPL));
        if (mbr__ <> '*FIRST');
         ovrdbf_(ovrflag__:'KW_APPL':'KW_APPL' : '*LIBL' : mbr__);
        elseif ('KW_APPL' <> 'KW_APPL');
         ovrdbf_(ovrflag__:'KW_APPL':'KW_APPL' : '*LIBL');
        endif;
        if    erropen__ = 'Y';
         OPEN(E) KW_APPL;                //    KW_APPL
         if        %error;
          return %error;
         endif;
        else;
         OPEN KW_APPL;                //    KW_APPL
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
       if   ((file__='KWPUOPT' or file__='*ALL') and NOT %OPEN(KWPUOPT));
        if (mbr__ <> '*FIRST');
         ovrdbf_(ovrflag__:'KWPUOPT':'KWPUOPT' : '*LIBL' : mbr__);
        elseif ('KWPUOPT' <> 'KWPUOPT');
         ovrdbf_(ovrflag__:'KWPUOPT':'KWPUOPT' : '*LIBL');
        endif;
        if    erropen__ = 'Y';
         OPEN(E) KWPUOPT;                //    KWPUOPT
         if        %error;
          return %error;
         endif;
        else;
         OPEN KWPUOPT;                //    KWPUOPT
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
       if   ((file__='KWPDLOC' or file__='*ALL') and NOT %OPEN(KWPDLOC));
        if (mbr__ <> '*FIRST');
         ovrdbf_(ovrflag__:'KWPDLOC':'KWPDLOC' : '*LIBL' : mbr__);
        elseif ('KWPDLOC' <> 'KWPDLOC');
         ovrdbf_(ovrflag__:'KWPDLOC':'KWPDLOC' : '*LIBL');
        endif;
        if    erropen__ = 'Y';
         OPEN(E) KWPDLOC;                //    KWPDLOC
         if        %error;
          return %error;
         endif;
        else;
         OPEN KWPDLOC;                //    KWPDLOC
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
loan listing
**CTDATA H__1        css                              952
<link rel="stylesheet" type="text/css" href="/k_com/bsLatest.css">
<link rel="st
ylesheet" type="text/css" href="/k_com/bs-rLatest.css">
<link rel="stylesheet" t
ype="text/css" href="/k_com/bsCorrect.css">
<link rel="stylesheet" type="text/cs
s" href="/k_com/dtLatest.css">
<link rel="stylesheet" type="text/css" href="/k_c
om/for_testing/TableTools.css"> <!--used by TableTools -->
<link rel="stylesheet
" type="text/css" href="/k_com/for_testing/ColVis.css"> <!--used by ColVis -->
<
style type="text/css">
body .modal {
  width: 60%; /* desired relative width */

  left: 20%; /* (100%-width)/2 */
  margin: auto auto auto auto; /* place center
 */
}

#info .modal-body{ max-height:800px; }

#data thead tr th
{
	border-left:
 1px solid #EEE;
	border-right: 1px solid #EEE;
}

.small{
	width:100px;
}	
.hea
der{
	clear:both;margin-right:20px;
}
.btn-styled{
    margin-right:20px;margin-
top:-5px;margin-bottom:10px;	
}

#btn-toggle{
	width:120px;
}


</style>
**CTDATA H__2        js                               5666
<script type="text/javascript" src="/k_com/jqLatest.js"></script>
<script type="
text/javascript" src="/k_com/dtLatest.js"></script>
<script type="text/javascrip
t" src="/k_com/exLatest.js"></script>
<script type="text/javascript" src="/k_com
/bsLatest.js"></script>

<script type="text/javascript">
        var oTable;

     var timeout = undefined;

        $(document).ready(function () {
			

       $.ajaxSetup({
                cache: false
            }); //disable cach
ing of AJAX

            oTable = $('#data').dataTable({
                "sDom":
 "<'datatable-header'lfT>tr<'datatable-footer'ip>",

                 "oLanguage
": {
                    "sSearch": "<span>Search:_INPUT_</span>",

       "sLengthMenu": "<span>Show entries:&nbsp;&nbsp;&nbsp;_MENU_</span>",

                "sZeroRecords": "No records found."
                },

       "aLengthMenu": [
                    [10, 15, 20, 25, 30, 35, 40, 45, 50,
 75, 100, -1],
                    [10, 15, 20, 25, 30, 35, 40, 45, 50, 75, 100,
 "ALL"]
                ],
                "bSortCellsTop": true,

  "bJQueryUI": false,
                "bAutoWidth": false,
                "sAja
xSource": "?task=wrt_list",

                "oTableTools": {

  "sSwfPath": "/k_com/for_testing/copy_csv_xls_pdf.swf",
                    "aB
uttons": [
                        "copy",
                        "print", {

                      "sExtends": "collection",
                        "sButton
Text": 'Save <span class="caret" />',
                        "aButtons": ["csv"
, "xls", "pdf"]
                    }]
                },
				
				/*
				NOTE O
N MDATA -- These are the column names which are passed to the server.
								 S
ee trans_cols() in the PML to see how these names are translated
								 to act
ual database columns, used for filtering/sorting.
				*/
  				

"aoColumns": [{
                    "mData": "stbox",
                    "bSear
chable": false,
                    "bSortable": false
                }, {

                "mData": "ofcloc"
                }, {
                    "mDat
a": "ofcnam"
                }, {
                	"mData": "ofcadr"

     }, {
                	"mData": "csz"
                }],



"bDeferRender": true,
                "bServerSide": true,
                "bSta
teSave": true,
                "bProcessing": true,
                "fnInitCompl
ete": function () {
                    loading('hide');
                    ini
t_colfilt(); //set up event handlers for column filters
                    rest
ore_filt(); //restore any individual column filter values
                    oT
able.fnSetFilteringDelay(); //delay main search field queries
                },

                
				
                "fnStateSave": function (oSettings, oData
) {
                    localStorage.setItem('DataTables_sdlrolist', JSON.string
ify(oData));
                },
                "fnStateLoad": function (oSettin
gs) {
                    return JSON.parse(localStorage.getItem('DataTables_sdl
rolist'));
                },
                

                "bScrollCollapse
": true,
                "sPaginationType": "full_numbers",
                "fnS
erverParams": function (aoData) {
                	
                	aoData.push
({
                    "name": "PDNO",
                    "value": ""

           });
                    //additional parameters sent on every AJAX ca
ll
                    aoData.push({
                        "name": "iTotalReco
rds",
                        "value": ""
                    });

  }
            });
			
        });

        function reload_ajax() {

  oTable.fnDraw();
        }
        

        function loading(code) {

    var loadingId = "#loadingWrapper";
            if (code == "show") {

         $(loadingId).show();
            }
            if (code == "hide") {

              $(loadingId).hide();
            }
        }

        function ini
t_colfilt() {
            $(document).on("keyup", "input.small", function () {

               var $this = this;
                window.clearTimeout(timeout);


               	timeout = window.setTimeout(function () {
               	   var
 realIndex = oTable.fnVisibleToColumnIndex($($this).parent().index());

      	   realIndex--; //decrement to account for actions column 

     oTable.fnFilter($($this).val(), realIndex, true)
               	}, 500);

               
            });
        }

        function handleOption(cust, a
cct, url) {
            if (url == "lnsign.pgm") {
                url = '?task=
callpgm&pgm=' + url + '&MACCT=' + acct + '&MCUST=' + cust;

                wind
ow.open(url, '_new');
                return false;
            }

            l
ocation.href = '?mode=edit&task=callpgm&pgm=' + url + '&MACCT=' + acct + '&MCUST
=' + cust;
        }

        //clears individual column filters and redraws the
 table
        function clr_filt() {
            $("input.small").val("");


        var oSettings = oTable.fnSettings();
            for (iCol = 0; iCol < o
Settings.aoPreSearchCols.length; iCol++) {
                oSettings.aoPreSearch
Cols[iCol].sSearch = '';
            }
            
            oTable.fnDraw();

        }

        //restores column filters based on state-saved data

function restore_filt() {
            var oSettings = oTable.fnSettings();

       $("input.small").each(function (i) {
                $(this).val(oSetting
s.aoPreSearchCols[i].sSearch);
            });
        }
</script>
**CTDATA H__3        page                             2739
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="e
n">
  <head>
    <meta http-equiv="Content-type" content="text/html; charset=utf
-8" />
    <meta http-equiv="cache-control" content="max-age=0" />
    <meta htt
p-equiv="cache-control" content="no-cache" />
    <meta http-equiv="expires" con
tent="0" />
    <meta http-equiv="expires" content="Tue, 01 Jan 1980 1:00:00 GMT
" />
    <meta http-equiv="pragma" content="no-cache" />
    <title>Loan List</t
itle>
    
  </head>
  <body>
    
    <!--snapshot info-->
    <div id="info" c
lass="modal hide fade">     
      
      <div class="modal-body"></div>
    </d
iv>
    
    <!-- loading screen -->
    <div id="loadingWrapper" class="loading
Wrapper">
      <div class="loadingImg"><img src="/k_loan/i/icon_loading_1.gif">
</div>
      <div class="loadingMsg">Building List</div>
    </div>
    
    <di
v class="container-fluid">
      
      <div class="row-fluid">
        <div cla
ss="span12">
          <div class="navbar">
            
            <div class=
"navbar-inner" style="padding-top:10px;">
              
              <h5 class
="header pull-left">Office Search -- 
              </h5> 
              

        <div class="btn-styled pull-left">
                <button type="button"
 onclick="javascript:location.href=''; return false;" class="btn" aria-hidden="t
rue" id="fdbck">Add New Office</button>
              </div>
              

        </div> <!--navbar-inner-->
          </div><!-- .navbar -->
          <d
iv class="table-overflow">
            <table id="data" class="table table-strip
ed">
              <thead>
                <tr>
                  <th>Actions</t
h>
                  <th>Office Location</th>
                  <th>Office Name<
/th>
                  <th>Address</th>
                  <th>City, State Zip</t
h>                  
                </tr>
                <tr>

  <th style="text-align:left;vertical-align:middle">
                    <button
 type="button" onclick="clr_filt();" class="btn">Clear</button>

  </th>
                  <th><input class="small" type="text" id="ofcloc" name=
"ofcloc"></th>
                  <th><input class="small" type="text" id="ofcnam
" name="ofcnam"></th>
                  <th><input class="small" type="text" id=
"ofcadr" name="ofcadr"></th>   
                  <th><input class="small" type=
"text" id="csz" name="csz"></th>                                 

  </tr>
              </thead>
              <tbody>
              </tbody>

        </table>
          </div><!-- .table-overflow -->
        </div><!-- .sp
an12 -->
      </div><!-- .row-fluid -->
    </div><!-- .container-fluid -->

 
  </body>
</html>
**CTDATA H__4        data                             66
{
"stbox": "",
"ofcloc": "",
"ofcnam": "",
"ofcadr": "",
"csz": ""

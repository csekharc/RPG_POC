     H/TITLE  Test
      * ProGen WebSmart Revision 6406
      * File overrides for compile command
      *__OV OVRDBF KWLBASE    KWDB/KWLBASE
      *__   Following values are used to create the server program
      *__RO Pgm  lib KWWEB      Pgm  TEST
      *__AG          WEBSMART
      *__SQ
      *__BD ECRTBND113
      *===============================================================*
      * Path:   C:\Users\Dano\Desktop\Compass\Clover\test.cdw
      * System: DC-LAPTOP
      * Project:N/A
      * Set:    N/A
      * User:   Dano
      * Date:   2010-05-19   14:14:17
      *===============================================================*
      */CPY *LIBL/PW_CSRC CPYRIGHT
      * File specifications

     D PTL__           S             50    DIM(1) CTDATA PERRCD(1)
     D RTLLA__         S             11    DIM(180)

     D*+FLDDCL Field declarations





      * Global variables:
     D firstls__       S              1A   INZ(*ON)
     D flush__         S              1A   INZ(*ON)
     D wfrtn__         S              1A
     D slrtn__         S              1A
     D rpml__          S              5I 0
     D msgdta__        S             70A
     D webdta__        S          32767A   Export
     D n30pm__         S             30A
     D voidrtn__a      S              1A
     D voidrtn__n      S              5P 0
     D persists__      S              1A   INZ(*OFF)

     D pltfrm__        S             10A   INZ('CLOVER')
     D prmreq__        S              5A
     D pgsizelm__      S              9P 0 IMPORT('PGSIZELM')

     D eof__           S              1A   INZ('0')
     D doof__          S              1A   INZ('0')
     D fcyc__          S              1A   INZ('1')
     D fpag__          S              1A   INZ('1')
     D pfmt__          S              3A
     D prtf__          S              1A   INZ('0')
     D of__            S              1A   INZ('0')
     D pfrcnt__        S              7P 0
     D crln__          S              7P 0
     D tsto__          S              3P 0
     D stbf__          S              2P 0
     D adof__          S              2P 0
     D pfsl__          S              1A   INZ('0')
     D ctlbrk__        S              2P 0
     D sqlsel__        S          32000A
     D sqldynsel_      S          32000A
     D rcdcnt__        S              8P 0
     D sqlrs01_        S              1
     D ovrfl_          S              3p 0 inz(66)
     D qtot__          S              1A   INZ('0')

     D in_MCUST        S              4B 0
     D in_MACCT        S              4B 0
     D in_MLNAME       S              4B 0
     D in_MFNAME       S              4B 0
     D in_MQUEUE       S              4B 0
     D PFWKDS__        DS                  inz

     D MCUST                          9P 0
     D MACCT                          5P 0
     D MLNAME                        25A
     D MFNAME                        20A
     D MQUEUE                        25A


     D PFSVDS__        S                   LIKE(PFWKDS__)
     D PFBFDS__        S                   LIKE(PFWKDS__)

     D Up__            C                   'ABCDEFGHIJKLMNOPQRSTUVWXYZ'
     D Lo__            C                   'abcdefghijklmnopqrstuvwxyz'

     D arclr__         S              8A
     D rwcolor1__      S              7A   INZ('altcol1')
     D rwcolor2__      S              7A   INZ('altcol2')


     D TASKRAN__       S              1    INZ(*ON)


     D H__1            S              1    PERRCD(80) CTDATA DIM(1552     )
     D HH_1            S              1    PERRCD(80) CTDATA DIM(5         )

     D H__2            S              1    PERRCD(80) CTDATA DIM(303      )
     D HH_2            S              1    PERRCD(80) CTDATA DIM(35        )

     D H__3            S              1    PERRCD(80) CTDATA DIM(466      )
     D HH_3            S              1    PERRCD(80) CTDATA DIM(5         )


     D* File info DS for each file


     D Open_File_      PR             1A
     D OpnFile__                     10A   value
     D OpnMbr__                      10A   value
     D erropen__                      1A   value

     D Pgm_Init_       PR

     D Dfn_Klsts_      PR
     D Dfn_Pgmfs_      PR

     D Read_           PR
     D Procr_          PR
     D Tstcb_          PR
     D totc_           PR
     D Toto_           PR
     D Movt_           PR
     D Hddto_          PR
     D Detc_           PR
     D lro_            PR
     D Tstof_          PR

     D UpdateRcd_      PR             1A
     D UpdRfmt__                     10A   value

     D DeleteRcd_      PR             1A
     D DltRfmt__                     10A   value


     D wrtdet_2        PR


     D wrtban_1        PR

     D wrttot_3        PR
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

     D pgm_init0       PR


      /COPY *LIBL/PW_CSRC,SUBPROT113
      /COPY *LIBL/PW_CSRC,GDPROTO


      /free
       // Register the condition handler. Provide pointer to Pgm status
       // data structure
       RegCndHdlr_(CndHdlrPtr: PSPtr__:  *omit);
       WasInit_();
       Pgm_Init_();
       Dfn_Pgmfs_();

       // Execute the primary SQL statement
      /end-free
     C/Exec SQL
     C+            SET OPTION DATFMT = *ISO
     C/End-Exec
     C/Exec SQL
     C+            Declare PFSEL Scroll Cursor
     C+            For PFSEL
     C/End-Exec
     C/Exec SQL
     C+            Prepare PFSEL
     C+            From :sqlsel__
     C/End-Exec
     C/Exec SQL
     C+            Open PFSEL
     C/End-Exec
      /free

       // Print headings or detail lines...
       Hddto_();

       // Until End of File...
       dou *inlr = *on;

       // Read and select a record from primary file...
       Read_();

       // IF record selected from primary file
       if EOF__ <> True;

        // Process selected record:
        Procr_();

        // ELSE No record found
       else;
        *INLR = *ON;
       endif;
       enddo;

       // If EOF__ flag not = 'Y' then LR set when upper limit
       // reached.  Restore previous record value in case of overflow.
       if EOF__ <> True;
        PFWKDS__ = PFBFDS__;
       endif;

       // Set control level counter to highest value...
       CTLBRK__ = 99;

       // Perform Total calculations...
       totc_();

       // Perform Total output...
       toto_();

       // Perform Last Record output...
       lro_();

       // Flush HTML buffer
       if  flush__ = *ON;
        outweb_('');
       endif;
       UnRegCndHdlr_(CndHdlrPtr : *omit);

       //  Close all files and shut down program
       if ovrflag__ = '1';
        ExecCmd2_('dltovr file(*all)':17);
       endif;
       *INLR = *ON;

      /end-free

     C/Exec SQL
     C+            Close PFSEL
     C/End-Exec

      *--------------------------------------------------------------*
      * *PSSR  - Program exception/error handler.
      *--------------------------------------------------------------*
     C     *PSSR         BEGSR
      *   Call error handler to close error page HTML properly, and write it to browser:
     C                   CALLP     ErrHandlr_('CLOSE' : PSDS__)
      *   Exit program immediately:
     C                   EVAL      *INLR      = *ON
     C                   RETURN
     C                   ENDSR     '*CANCL'

      *--------------------------------------------------------------*
      * Klistdcl__ - Subroutine to globally declare all KLISTS.
      *--------------------------------------------------------------*
     C     Klistdcl__    BEGSR

     C                   ENDSR


      *--------------------------------------------------------------*
      * Read_ - Read and select record from Primary file
      *--------------------------------------------------------------*
     P Read_           B
     D Read_           PI
      /free
       // Initialize 'Primary File record selected' flag (set on in detc_)
       // (Gets set on in Detc_)
       PFSL__ = False;
       SQLRS01_ = *OFF;
       //   Initialize 'Select condition met' flag...

       //   Read record from primary file until select condition met
       //   or until end of file...
      /end-free
     C/Exec SQL
     C+  FETCH NEXT FROM PFSEL INTO :MCUST :in_MCUST, :MACCT :in_MACCT, :MLNAME
     C+ :in_MLNAME, :MFNAME :in_MFNAME, :MQUEUE :in_MQUEUE
     C/End-Exec
      /free
       // sqlcod -181 is invalid date, allows these through
       if sqlcod <> 100 and sqlcod >= 0;
        //*PFSL Actions prior to record selection

        //   Perform condition test, if any...
        //*CDPF    if(a = b) slcm__ = True
       ELSE;
        //   Set end of file flag
        EOF__ = True;
       ENDIF;

      /end-free
     P Read_           E

      *--------------------------------------------------------------*
      * Procr_ - Process selected record from Primary file
      *--------------------------------------------------------------*
     P Procr_          B
     D Procr_          PI
      /free
       // Set 'Primary File record selected' flag on...
       // (This field conditions printing of detail records)
       PFSL__ = True;
       SQLRS01_ = *ON;
       // Store current version of fields in Save DS...
       PFSVDS__ = PFWKDS__;
       // Test for Control Breaks...
       tstcb_();
       // IF this is first cycle, set 'Do overflow' print flag on...
       if FCYC__ = True;
        DOOF__ = True;
        // ELSE this is not the first cycle...
       else;
        // Make previous version of fields active version
        PFWKDS__ = PFBFDS__;
        // Perform Total-time calculations (if any)
        totc_();
        // Perform Total-time output (if any)
        toto_();
       endif;

       //  For each record:
       //  Make data available from last record read...
       PFWKDS__ = PFSVDS__;
       PFBFDS__ = PFSVDS__;
       //   Map in fields from DBF to work fields  concatenated, substr
       //*MAPI
       //*PFGT Generated code: Primary file get record
       //  Perform detail calcs...
       detc_();
       //  Set flag to indicate first cycle completed...
       FCYC__ = False;
       //  Set off 'Print first page' flag...
       FPAG__ = False;
       //*BPFP   Before primary file print
       //  Print headings or detail lines...
       PFMT__ = 'PS';
       hddto_();
       //  Move data for curr rcd to fields stored for total lines...
       movt_();
       //   Initialize control break index
       clear CTLBRK__;
       //*APFP   After primary file print

      /end-free
     P Procr_          E

      *--------------------------------------------------------------*
      * Tstcb_ - Test for Control Breaks
      *--------------------------------------------------------------*
     P Tstcb_          B
     D Tstcb_          PI
      /free
       //   Initialize control break index
       clear CTLBRK__;
       //   For first cycle, set control break counter to highest
       //   value to ensure level break processing is done...
       if FCYC__ = True;
        CtlBrk__ = 99;
        //   After first cycle, test each record for control break...
       else;
        CLEAR CtlBrk__;
        //   Set control break index...

        //*SCBI
       endif;
       //   Store saved values for fields used for level breaks...

       //*CDST

      /end-free
     P Tstcb_          E

      *--------------------------------------------------------------*
      * totc_  - Perform Total time calculations
      *--------------------------------------------------------------*
     P totc_           B
     D totc_           PI
      /free

      /end-free
     P totc_           E

      *--------------------------------------------------------------*
      * Toto_  - Perform Total time calculations
      *--------------------------------------------------------------*
     P Toto_           B
     D Toto_           PI
      /free

       //*ATTO   Actions after total-time records printed

      /end-free
     P Toto_           E

      *--------------------------------------------------------------*
      * Movt_  - Move data for curr rcd to stored Total fields
      *--------------------------------------------------------------*
     P Movt_           B
     D Movt_           PI
      /free

      /end-free
     P Movt_           E

      *--------------------------------------------------------------*
      * Hddto_ - Print Headings or Details...
      *--------------------------------------------------------------*
     P Hddto_          B
     D Hddto_          PI
      /free

       //  DO until 'Do print routines' flag is off...
       DOU PRTF__ = False;

       //   Execute subroutines to print on various conditions...
       //*PRSB
       if PFMT__ = 'PS';
        //   Print when primary file record selected...
        wrtdet_2();
       else;
        wrtban_1();
       endif;

       //*PSSB

       //   Print on user controlled condition...
       //*UCSB

       //   IF Overflow detected...
       if OF__ = True;
        //     Set 'Do Overflow Output' flag on
        //     Set 'Do Print routines' flag on
        //     Set 'Overflow detected' flag off...
        DOOF__ = True;
        PRTF__ = True;
        OF__ = False;
        //   ELSE, No overflow: exit loop...
       else;
        //     Set 'Do overflow Output' flag off
        //     Set 'Do Print routines' flag off...
        DOOF__ = False;
        PRTF__ = False;
       endif;
       //  END: Until 'Do print routines' flag is off
       enddo;
       clear PFMT__;

      /end-free
     P Hddto_          E

      *--------------------------------------------------------------*
      * Detc_  - Perform Detail calcs for primary file record
      *--------------------------------------------------------------*
     P Detc_           B
     D Detc_           PI
      /free

       //    For each output record format that requires it, initialize
       //    fields from auxilliary files, then retrieve them
       //*GTDS
       //    Count # of records selected...
       PFRCNT__ = PFRCNT__ + 1;
       //    Perform any other detail calcs, including subtotalling...

       //*DETC
      /end-free
     P Detc_           E

      *--------------------------------------------------------------*
      * lro_   - Last Record output
      *--------------------------------------------------------------*
     P lro_            B
     D lro_            PI
      /free
       WrtSeg_('Total' : TRUE);
      /end-free
     P lro_            E

      *--------------------------------------------------------------*
      * Tstof_ - Test for page overflow prior to printing each line
      *--------------------------------------------------------------*
     P Tstof_          B
     D Tstof_          PI
      /free

       //DO if not already in overflow processing
       if DOOF__ = False;
        //  IF  'Skip-to before printing line # >0 AND  <= Curr line #
        if STBF__ > 0 and STBF__ <= CRLN__;
         OF__ = True;
        endif;
        //If increment value for current line # >0
        if ADOF__ > 0;
         // Add # lines to space before print to current line value...
         TSTO__ = CRLN__ + ADOF__;
         // If Current line+ # Lines to space before print exceeds
         // the overflow line, set the Overflow Detected flag on...
         //*TSTO
         if TSTO__ >= OVRFL_;
          OF__ = True;
         endif;
        endif;
       endif;
       // Reset 'skip-to line #' value and 'next increment' value...
       clear STBF__;
       clear ADOF__;

      /end-free
     P Tstof_          E




     P*---------------------------------------------------------------------
     P* pgm_init0                   - User defined function
     P*---------------------------------------------------------------------
     P pgm_init0       B
     D pgm_init0       PI




      /free
       Setlibl_('*FILES' :rtlla__);
      /end-free
     c     *PSSR         begsr
     c                   endsr
     P pgm_init0       E



      * Subprocedures follow:

      *--------------------------------------------------------------------------------------------*
      * Pgm_Init_ - Program initialization
      *--------------------------------------------------------------------------------------------*
     P Pgm_Init_       B
     D Pgm_Init_       PI
      /free

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

       // Set default page size limit to 2Mb.
       PgSizeLm__ = 2000000;
       pgm_init0();
       sqlsel__ = 'select MCUST, MACCT, MLNAME, MFNAME, MQUEUE from KWLBASE w-
       here MSTAT = ''P''';
       if sqlDynSel_ <> ' ';
        sqlsel__ = %trim(sqlDynsel_);
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
      /end-free

     C                   return    *in90
     P Open_File_      E




      *---------------------------------------------------------------------------------------------
      * WrtSeg_  Subprocedure  - Write a segment of HTML.
      *---------------------------------------------------------------------------------------------
     P WrtSeg_         B
     D WrtSeg_         PI
      * Parameters: Name of segment, and flag to control retrieving auxiliary file info
     D SegName                       32A   value
     D Rtvauxflg                      1A
      /free
       SegName = %XLATE(LO__:UP__: SegName);
       select;
       WHEN      SegName= 'BANNER';
       MrgHtml3_(SegName:H__1(1):1552: HH_1(1):%paddr(WrtDBFld_):%paddr(
       RunHTMLFn_));
       WHEN      SegName= 'DETAILS';
       exsr  Flip_RwC_;
       MrgHtml3_(SegName:H__2(1):303: HH_2(1):%paddr(WrtDBFld_):%paddr(
       RunHTMLFn_));
       WHEN      SegName= 'TOTAL';
       MrgHtml3_(SegName:H__3(1):466: HH_3(1):%paddr(WrtDBFld_):%paddr(
       RunHTMLFn_));
       endsl;

       //----------------------------------------------------------------
       // Flip_RwC_ - Flip background color for alternating rows in table
       //----------------------------------------------------------------
       BEGSR   Flip_RwC_;
       if ARCLR__ = RWCOLOR1__;
        ARCLR__ = RWCOLOR2__;
       else;
        ARCLR__ = RWCOLOR1__;
       endif;
       ENDSR;

      /end-free
     P WrtSeg_         E


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
      * Exit_Immed_ - Exit program immediately. Flush current HTML buffer.
      *--------------------------------------------------------------------------------------------*
     P Exit_Immed_     B                   Export
     D Exit_Immed_     PI
      /free
       outweb_('');                           // Flush HTML buffer

       // Close all files and shut down program:
       if ovrflag__ = '1';
        ExecCmd2_('dltovr file(*all)':17);
       endif;
       Shutdown_();                          //     Shut down completely

      /end-free
     P Exit_Immed_     E

      *--------------------------------------------------------------------------------------------*
      * Wrtdbfld_   - Subprocedure to Write database field to web page.
      *--------------------------------------------------------------------------------------------*
     P Wrtdbfld_       B                   Export
     D Wrtdbfld_       PI
     D SegName                       32A
     D dbfld__                       10P 0
      /free
       select;
       when SegName= 'BANNER';
       select;
       endsl;
       when SegName= 'DETAILS';
       select;
       when      dbfld__ = 1;
       wfrtn__ = AfToPage_(ARCLR__);
       when      dbfld__ = 2;
       wfrtn__ = AfToPage_(%trim(%editc(MCUST:'4')));
       when      dbfld__ = 3;
       wfrtn__ = AfToPage_(%trim(%editc(MACCT:'4')));
       when      dbfld__ = 4;
       wfrtn__ = AfToPage_(MLNAME);
       when      dbfld__ = 5;
       wfrtn__ = AfToPage_(MFNAME);
       when      dbfld__ = 6;
       wfrtn__ = AfToPage_(MQUEUE);
       endsl;
       when SegName= 'TOTAL';
       select;
       endsl;
       endsl;
      /end-free
     P Wrtdbfld_       E

      *--------------------------------------------------------------------------------------------*
      * RunHtmlFn_  - Subprocedure to Run HTML-embedded functions when encountered
      *--------------------------------------------------------------------------------------------*
     P RunHtmlFn_      B                   Export
     D RunHtmlFn_      PI
     D fnname__                      32A
      /free
       select;
       endsl;
      /end-free
     P RunHtmlFn_      E


      *--------------------------------------------------------------------------------------------*
      * wrtdet_   - Subprocedure to write a details line.
      *--------------------------------------------------------------------------------------------*
     P wrtdet_2        B
     D wrtdet_2        PI
      /free
       WrtSeg_('Details                         ' : TRUE);

      /end-free
     P wrtdet_2        E



      *--------------------------------------------------------------------------------------------*
      * wrtban_   - Subprocedure to write a banner line.
      *--------------------------------------------------------------------------------------------*
     P wrtban_1        B
     D wrtban_1        PI
      /free
       WrtSeg_('Banner                          ' : TRUE);

      /end-free
     P wrtban_1        E


      *--------------------------------------------------------------------------------------------*
      * wrttot_   - Subprocedure to write a total line.
      *--------------------------------------------------------------------------------------------*
     P wrttot_3        B
     D wrttot_3        PI
      /free
       if CTLBRK__ >= 100     ;
        WrtSeg_('Total                           ' : TRUE);
       endif;

      /end-free
     P wrttot_3        E








      *+CTARRS Compile-time Arrays go here:
**CTDATA PTL__      Program title contents
Test
**CTDATA H__1        Banner                           1552
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.or
g/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
	<meta name="generator"
content="WebSmart" />
	<meta http-equiv="Pragma" content="no-cache" />
	<title>T
est</title>
	<link rel="stylesheet" type="text/css" href="/websmart/v7.2/idaho/c
ss/screen.css" media="screen, tv, projection" />
	<link rel="stylesheet" type="t
ext/css" href="/websmart/v7.2/idaho/css/print.css" media="print" />
	
	
	
	<!---
->
    	<link rel="stylesheet" type="text/css" href="/websmart/kwikloan/styles/k
lstylepage.css" media="screen, tv, projection">
	<link rel="stylesheet" type="te
xt/css" href="/websmart/kwikloan/styles/compass.css" media="screen, tv, projecti
on">
	<!---->
	
</head>
<body>





		<!---->
		
		<div id="wrapping">
			<div i
d="everything">
				<div id="PageTitle">
					<span>[Section/Page Title]</span>

				</div>
				
		<!---->
				
		
		
		
		
		
		
		
		<!---->
				
				<div clas
s="whitebg">
					<div class="PageSectionTitle">
						<span>[Subtitle/minor sec
tion title]</span>
					</div>

					<div class="PageContents">					  
						
		
				
				<!---->
					
					
							  	<table class="mainlist">
								
							
			<tr>
										
											<th width="90" class="htext" >Customer No.</th>
		
									<th width="50" class="htext" >Account No.</th>
											<th width="25
0" class="htext" >Last Name</th>
											<th width="200" class="htext" >First
 Name</th>
											<th width="250" class="htext" >Collection Queue</th>
					
					</tr> 
										
									
**CTDATA HH_1        Banner                           5
00000
**CTDATA H__2        Details                          303
										<tr class="%%0000000001">
											<td class="text right">%%00000000
02</td>
											<td class="text right">%%0000000003</td>
											<td class
="text">%%0000000004</td>
											<td class="text">%%0000000005</td>
								
			<td class="text">%%0000000006</td>
										</tr>
									
**CTDATA HH_2        Details                          35
00022000710012300169002150026100000
**CTDATA H__3        Total                            466
										<tr>
										<td class="breakhead" colspan="5">
										Final Tota
ls
										</td></tr>
										<tr><td></td>
										<td></td>
										<t
d></td>
										<td></td>
										<td></td>
								</tr>
								</table>




				

					</div><!--END PageContents-->
				</div><!-- END whitebg-->

		<!--
-->
				
				
				
				
				
				
		
		
		<!---->		

				</div><!--END everythin
g-->
		</div><!--END wrapping-->

		<!---->
		
		
</body>
</html>

**CTDATA HH_3        Total                            5
00000

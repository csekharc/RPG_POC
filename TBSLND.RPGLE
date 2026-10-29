     H/TITLE  The Bedroom Store landing page
      * ProGen WebSmart Revision 21923
      * File overrides for compile command
      *__OV OVRDBF KWPDBASE   KWPDBASE
      *__OV OVRDBF KWPDLOC    KWPDLOC
      *__   Following values are used to create the server program
      *__RO Pgm  lib KWWEB      Pgm  TBSLND
      *__AG          WEBSMART
      *__CL          *OBJLIBNAM
      *__SQ
      *__BD ECRTBND195
      *===============================================================*
      * Path:   tbslnd.pdw
      * System: SEAN5FC9
      * Project:Kwik-Loan
      * Set:    Landing Pages
      * User:   sean
      * Date Last Generated:   2016-09-21   16:29:31
      * Last Generated CRC: D61575F6 6E56845F 9CE07F2A 7CB9ACB3
      *===============================================================*
      */CPY *LIBL/PW_CSRC CPYRIGHT
      * File specifications
     FKWPDBASE  IF   E           K DISK    USROPN
     F                                     INFDS(FID001_   )
     FKWPDLOC   IF   E           K DISK    USROPN
     F                                     INFDS(FID002_   )

     D PTL__           S             50    DIM(1) CTDATA PERRCD(1)
     D RTLLA__         S             11    DIM(180)

     D*+FLDDCL Field declarations


     D clid            S              3A
     D zip_hld         S              9A
     D zip5            S              5A
     D zip_hld2        S              9A
     D zip52           S              5A
     D shortname       S              1A

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


     D H__1            S             80    PERRCD(1) CTDATA DIM(78          )


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

     D output0...
     D                 PR
     D all_box0...
     D                 PR

     D pdmod           S                   LIKE(pdloc         )

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
     C                   KFLD                    pdno
     C     DL001_        KLIST
     C                   KFLD                    pdno
     C                   ENDSR


      * Subprocedures follow:
      *--------------------------------------------------------------------------------------------*
      * main__ - Contains the main function source code from the PML
      *--------------------------------------------------------------------------------------------*
     P main__          B
     D main__          PI

      /free
       // PML Start ----------------------------------
       clid = '108';
       ExecCmd2_('ADDLIBLE QGPL':%len(%trimr('ADDLIBLE QGPL')));
       ExecCmd2_( 'KWSET ' + %trim(clid):%len(%trimr( 'KWSET ' + %trim(clid))));
       Open_File_('*ALL': '*FIRST':  'Y');
       if (task__ = 'DEFAULT');
        taskran__ = *ON;
        output0();
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
     P* output0...                  - User defined function
     P*---------------------------------------------------------------------
     P output0...
     P                 B
     D output0...
     D                 PI




      /free
       AM001_ = CV_BYKEY;
       CHAIN(NE) DL001_ RKWPDBASE;
       RS001_ = RcdSts2_('GETRCD': %error: %found: %eof);
       outweb_(%subst(%str(%addr(H__1(1))):1:4168));
       all_box0();
       outweb_(%subst(%str(%addr(H__1(53))):9:2013));

      /end-free
     c     *PSSR         begsr
     c                   endsr
     P                 E


     P*---------------------------------------------------------------------
     P* all_box0...                 - User defined function
     P*---------------------------------------------------------------------
     P all_box0...
     P                 B
     D all_box0...
     D                 PI




      /free
       OutWeb_('<select class="form-control office-sel" type="select-one" sty-
       le="width: 100%;">');
       OutWeb_('<option value="">Select a Location....</option>');
       pdno = '38';
       SETLL  DL002_ RKWPDLOC;
       RS002_ = RcdSts2_('POSRCD':%error:%equal:%eof);
       READE(NE) DL002_ RKWPDLOC;
       RS002_ = RcdSts2_('GETNXTRCD':%error:%found:%eof);
       AM002_ = CV_ByKey;
      /end-free
     C/Exec SQL
     C+  select PDLOC, PDNAM1 into :PDLOC, :PDNAM1 from KWPDLOC where PDNO=:PDNO
     C/End-Exec
      /free
       dow (RS002_ = '1');
       shortname = %subst(pdnam2:1:1);
       if (shortname <> 'X');
        zip_hld2 = %trim(%editc(PDZIP:'P'));
        zip52 = %subst(zip_hld2:1:5);
        if (PDLOC <> 0);
         OutWeb_(%trimr( '<option value="' + %trim(%editc(PDLOC:'P')) + '" da-
       ta-dealer="' + %trim(pdno) + '">' + %trim(pdnam1) + ' (' + zip52 + ')<-
       /option>'));
        else;
        endif;
       else;
       endif;
       READE(NE) DL002_ RKWPDLOC;
       RS002_ = RcdSts2_('GETNXTRCD':%error:%found:%eof);
       AM002_ = CV_ByKey;
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

       // Initialize library list array for current job to find files
       rtlla__(1) = 'KWDB108';

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
The Bedroom Store landing page
**CTDATA H__1        page                             6181
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.or
g/TR/xhtml1/DTD/xhtml1-transitional.dtd" >
<html>
<head>
	<meta name="generator"
 content="Bluefish 2.0.2" />
	<meta http-equiv="Pragma" content="no-cache" />
	<
title>
		The Bedroom Store Credit Application
	</title>
	<!-- standard stack.  t
hese filese should be included in every program -->
	<link rel="stylesheet" type
="text/css" href="/k_com/bsLatest.css" ><!-- bootstrap -->
	<link rel="styleshee
t" type="text/css" href="/k_com/bs-rLatest.css" ><!-- bootstrap responsive file
-->
	<link rel="stylesheet" type="text/css" href="/k_com/bsCorrect.css" ><!-- co
mpass technologies modification file -->
	<link rel="stylesheet" type="text/css"
 href="/k_com/faLatest.css" ><!-- font awesome -->
	<link rel="stylesheet" type=
"text/css" href="//ajax.googleapis.com/ajax/libs/jqueryui/1.10.3/themes/smoothne
ss/jquery-ui.css" >
	<script type="text/javascript" src="/k_com/jqLatest.js" ></
script><!-- jquery -->
	<script src="//ajax.googleapis.com/ajax/libs/jqueryui/1.
10.3/jquery-ui.min.js" ></script><!--datepicker-->
	<script type="text/javascrip
t" src="/k_com/bsLatest.js" ></script><!-- bootstrap jquery file -->
	<style typ
e="text/css">
		body{
			padding: 0px 20px;	
		}
		.sectNav{
			line-height: 40p
x;	
		}
		.ul-std{
			font-size: 16px;
			margin-bottom: 40px;
		}
		.ul-std li{

			margin-bottom: 5px;		
		}
		.emph{
			font-size: 18px;	
		}
		.emph-l{
			fo
nt-size: 16px;	
		}
		.text-red{
			color: #f02a3b;
		}
		.text-blue{
			color:
#142140;
		}
		.text-bigger{
			font-size: 18px;	
		}
	</style>
	<script type="t
ext/javascript">
	$(document).ready(function(){
		
		$('.office-sel').change(fun
ction(){
			//get variables from select element
			var sel = $(this).find('optio
n:selected');
       		var dlr = sel.data('dealer'); 
       		var off = $(this)
.val();
			
			//set .dlr field, which is used when the "go" button is clicked
	
		$('.dlr').val(dlr);
			
			//if this is a multi entity dealer, check to see if
 there is a dash (-) 
			//in the value retrieved (returns -1 if there is no das
h (-))
			offsub = off.search('-');
			
			//check if this is, or is not, an add
itional entity, and set office field accordingly
			if(offsub >= 0){
				//is su
b entity
				offnew = off.substr(0,Number(offsub));
				$('.office').val(offnew)
;	
			} else {
				//main entity
				$('.office').val(off);
			}
		});
		
		$(do
cument).on('click','.go',function(){
			var dlr = $('.dlr').val();
			var office
 = $('.office').val();
			if(office == "" || dlr == ""){
				alert("Please selec
t an office before moving on to the application.");
			} else {
				location.hre
f="https://sv1.americanfirstfinance.com:8158/kwik/AFF_APP.PGM?fromweb=Y&clid=108
&wdlr="+dlr+"&office_dlr="+dlr+"&office_loc="+office+"&agent=WebLanding";
			}	

		});
	});
	</script>
</head>
 
 
<body>
	<div id="wrapper" >
		<div class="cont
ainer-fluid">
			
			<div class="row-fluid">
				<div class="span8">
			
					<d
iv class="page-header" style="margin-bottom: 15px;">
						<table style="width:
100%">
							<tr>
								<td style="width: 210px;"><img src="/k_dealer/i/tbs_l
ogo.jpg"></td>
								<td>
									<h2>
										The Bedroom Store<br>
						
				<small>Applying for financing with American First Finance</small>
									<
/h2>
								</td>
							</tr>
						</table>
					</div>
					
					<div class
="row-fluid">
						<div class="span12 text-bigger">
							<p>&nbsp;</p>
						
	<p>American First Finance offers high approval amounts, no money down options,
and 90 days Same as Cash.  Credit is not required for approval.</p>

							<p>S
imply select the store location you would like to shop at and click Start Applic
ation to begin.</p>
							<p>&nbsp;</p>
						</div>
					</div>
				
					<div
 class="row-fluid">
						<div class="span12 sect">
				            <div class="
sectNav">
				            	Please choose a location to apply with <strong>Americ
an First Finance</strong>
				            </div>
				            <div class="sec
tInner" >
				            	
				            	<div class="row-fluid">
				
     		<div class="span5">
									<label><strong>Locations:</strong></label>
	
								
				            		</div>
				            		<input type="hidden" value="
" class="dlr">
				            		<input type="hidden" value="" class="office">
	
			            	</div>
				            </div>
				        </div>
				    </div>

				    
				    <div class="row-fluid">
						<div class="span12">
				
	<button type="button" class="btn go">Start Application</button>
				        </d
iv>
				    </div>
		    	
		    	</div>
		    	<div class="span4">
		    		<div
 class="page-header" style="margin-bottom: 15px;">
						<img src="/k_dealer/i/a
fflogo.png">
					</div>
					
					<div class="row-fluid">
						<div class="sp
an12">
							<p><span class="emph">Take your items home today with:</span></p>
 
							
							<ul class="ul-std"><li>$0 down at Signing</li><li>Terms up to 2
4 months</li><li>90 days same as cash</li></ul> 
							
							<p><span class="
emph">Make equal payments that fit your income schedule</span></p>  
							
			
				<ul class="ul-std" style="margin-bottom: 20px;"><li>Weekly Payments Availabl
e</li><li>Bi-Weekly Payments Available</li><li>Monthly Payments Available</li><l
i>Semi-Monthly Payments Available</li></ul> 
							
							<p style="margin-top
: 30px;">
							<span class="emph-l"><strong>Have Questions?</strong></span><br
>
							Get more info from American First Finance at:
							</p>
							
					
		<p><span class="emph-l">
							1-855-721-1188<br>
							info@americanfirstfi
nance.com<br>
							<a href="https://www.americanfirstfinance.com/contact-us.ht
ml">www.americanfirstfinance.com</a>
							</span>
							</p>
							
							<
p style="margin-top: 30px;">
							<span class="emph-l"><strong>Already have an
 account?</strong></span><br>
							Manage your American First Finance account
at:
							</p>
							
							<p><span class="emph-l">
							<a href="https://
sv1.americanfirstfinance.com:8158/k_dealer/f/AFFkv.html">Customer Login</a>
				
			</span>
							</p>
							 
						</div>
					</div>
		    	</div>
		</div>

	    
	</div>
</body>

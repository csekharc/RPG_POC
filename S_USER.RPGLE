     H/TITLE  System Settings:  Users
      * ProGen WebSmart Revision 28963
      * File overrides for compile command
      *__OV OVRDBF KWPUBASE   KWPUBASE
      *__OV OVRDBF F__ARR001  KWPUBASE
      *__OV OVRDBF KWPUAMT    KWPUAMT
      *__OV OVRDBF KWPUCASH   KWPUCASH
      *__OV OVRDBF KWPULOC    KWPULOC
      *__OV OVRDBF KWIKUSER   KWIKUSER
      *__OV OVRDBF KWPUOPT    KWPUOPT
      *__OV OVRDBF KWPLBASE   KWPLBASE
      *__OV OVRDBF KWP_DATA   KWP_DATA
      *__OV OVRDBF KWPUTWILIO KWPUTWILIO
      *__OV OVRDBF KWPUFSP    KWPUFSP
      *__OV OVRDBF KWPUTIME   KWPUTIME
      *__OV OVRDBF KWPUOPT2   KWPUOPT2
      *__   Following values are used to create the server program
      *__RO Pgm  lib KWWEB      Pgm  S_USER
      *__AG          WEBSMART
      *__CL          *OBJLIBNAM
      *__SQ
      *__BD ECRTBND204
      *===============================================================*
      * Path:   s_user.pdw
      * System: L-IT-SPROVOST
      * Project:Kwik-Loan
      * Set:    Sean KW (MDCMS)
      * User:   sprovost
      * Date Last Generated:   2020-06-02   17:19:46
      * Last Generated CRC: 67AE47A7 C40330F4 30D87A6C C3BF140E
      *===============================================================*
      * AECP-2557 Y.Kumar  SOX User Role updates
      * 2022-04-27    Modification Tag - YK01
      *===============================================================*
      * AECP-2557 Y.Kumar  SOX Taking out Administrator Check
      * 2022-06-27    Modification Tag - YK02
      *===============================================================*
      * AECP-3126 Y.Kumar  SOX - RPG - Modify KL Login screen
      * 2022-08-10         to force the correct port
      *===============================================================*
      * AECP-3335 Y.Kumar  WARRANTY - SOX KL User Role Update
      * 2022-09-07    Modification Tag - YK05
      *===============================================================*
      * AECP-3639 Ram Maddukuri RPG - Update S_USER (user settings) to include records from KWLROPT
      * 2023-01-09    Modification Tag - RM01
      *===============================================================*
      * AFF-20824 Neelima E     RPG - Fix S_USER.pgm to manage missing user settings.
      * 2023-12-22    Modification Tag - EN01
      *===============================================================*
      */CPY *LIBL/PW_CSRC CPYRIGHT
      * File specifications
     FKWPUBASE  UF A E           K DISK    USROPN
     F                                     INFDS(FID001_   )
     FF__ARR001 UF A E             DISK    USROPN
     F                                     RENAME(RKWPUBASE    :R__ARR001   )
     FKWPUAMT   UF A E           K DISK    USROPN
     F                                     INFDS(FID002_   )
     FKWPUCASH  UF A E           K DISK    USROPN
     F                                     INFDS(FID003_   )
     FKWPULOC   UF A E           K DISK    USROPN
     F                                     INFDS(FID004_   )
     F                                     RENAME(RKWPULOC     :R__FMT01    )
     FKWIKUSER  UF A E           K DISK    USROPN
     F                                     INFDS(FID005_   )
     FKWPUOPT   UF A E           K DISK    USROPN
     F                                     INFDS(FID006_   )
     FKWPLBASE  IF   E           K DISK    USROPN
     F                                     INFDS(FID007_   )
     FKWP_DATA  UF A E           K DISK    USROPN
     F                                     INFDS(FID008_   )
     FKWPUTWILIOUF A E           K DISK    USROPN
     F                                     INFDS(FID009_   )
     FKWPUFSP   UF A E           K DISK    USROPN
     F                                     INFDS(FID010_   )
     F                                     RENAME(RKWPUBASE    :R__FMT02    )
     FKWPUTIME  IF   E           K DISK    USROPN
     F                                     INFDS(FID011_   )
     FKWPUOPT2  UF A E           K DISK    USROPN
     F                                     INFDS(FID012_   )
     F                                     RENAME(RKWPUOPT     :R__FMT03    )

     D PTL__           S             50    DIM(1) CTDATA PERRCD(1)
     D RTLLA__         S             11    DIM(180)

     D*+FLDDCL Field declarations

     Duserdata         DS                  INZ
     D client                         5A
     D userid                        32A
     D location                       5A

     D rnd             S              6A
     D boxname         S             10A
     D boxid           S             10A
     D cacflag         S              1A
     D boxtype         S             10A
     D jvalidation     S             30A
     D viewlett        S              1A
YK01 D rolefound       S              1A
YK04 D wprevyesno      S              1A
YK04 D wprevrole       S             12A
     D viewcall        S              1A
     D edtfcodes       S              1A
     D edtfcnta        S              1A
     D edtfcntb        S              1A
     D edtfacctc       S              1A
     D edtflncds       S              1A
     D edtfpaycrd      S              1A
     D artncod         S              5A
     D startrrn        S              9P 0
     D endrrn          S              9P 0
     D rcdcnt          S              5P 0
     D prevstate       S              5P 0
     D nextstate       S              5P 0
     D listsize        S              5P 0
     D rrn             S              9P 0
     D savedrrn        S              9A
     D disphref        S            200A
     D edithref        S            200A
     D delhref         S            200A
     D addhref         S            200A
     D pagenum         S              5P 0
     D splitpmt        S              1A
     D deletedoc       S              1A
     D chkipaddr       S              1A
     D titleamort      S              1A
     D denial_fico     S              3P 0
     D deviance_fico   S              3P 0
     D usrpin          S              1A
     D edtintfld       S              1A
     D mode            S             15A
     D supquery        S           1024A
YK01 D supqry          S           1024A
     D timquery        S           1024A

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
     D RS012_          S              1A
     D AM012_          S              1A


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


     D H__1            S             80    PERRCD(1) CTDATA DIM(38          )

     D H__2            S             80    PERRCD(1) CTDATA DIM(8           )

     D H__3            S             80    PERRCD(1) CTDATA DIM(10          )

     D H__4            S             80    PERRCD(1) CTDATA DIM(39          )

     D H__5            S             80    PERRCD(1) CTDATA DIM(3           )

     D H__6            S             80    PERRCD(1) CTDATA DIM(1           )

     D H__7            S             80    PERRCD(1) CTDATA DIM(264         )

     D H__8            S             80    PERRCD(1) CTDATA DIM(33          )

     D H__9            S             80    PERRCD(1) CTDATA DIM(2           )


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
     D FID012_         DS
     D  RR_012_              397    400B 0
     D KWLROLEDS     E DS                  ExtName(KWLROLE)
     D                                     PreFix(d)

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

     D ChkDbg_         PR             1A   EXTPROC('CHKDBG_')
     D ChkDbgPgmNam__                10A
     D ChkDbgPgmLib__                10A

     D PW_DBGPUT       PR                  extpgm('XL_WEBSPT/PW_DBGPUT')
     D   PGMNAME                     10A   const
     D   PGMLIB                      10A   const

     D PW_DBGEND       PR                  extpgm('XL_WEBSPT/PW_DBGEND')
     D   PGMNAME                     10A   const
     D   PGMLIB                      10A   const

     D SndPgmMsg_      PR             1A
     D Msid                           7A   value
     D Msfil                         10A   value
     D Mslib                         10A   value
     D Msdata                        70A

     D snpmr__         S              1A
     D qrystr__        S           1024A

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

     D show_ip_btn0...
     D                 PR
     D displist0...
     D                 PR
     D prev0...
     D                 PR
     D disprcd0...
     D                 PR
     D delconf0...
     D                 PR
     D deletercd0...
     D                 PR
     D beginmanage0...
     D                 PR
     D endmanage0...
     D                 PR
     D puprofilebox0...
     D                 PR
     D QPGM__          S             21A
     D LstPmlErr_      S              4P 0 IMPORT
     D prodbox0...
     D                 PR
     D supbox0...
     D                 PR
YK01 D rolbox0...
Yk01 D                 PR
     D depbox0...
     D                 PR
     D locbox0...
     D                 PR
     D optcollbox0...
     D                 PR
     D optascollbox0...
     D                 PR
     D optadmcollbox0...
     D                 PR
     D optapprovebox0...
     D                 PR
     D optvoidbox0...
     D                 PR
     D optrembox0...
     D                 PR
     D optassconbox0...
     D                 PR
     D optmodbox0...
     D                 PR
     D optjudgebox0...
     D                 PR
     D optbankrbox0...
     D                 PR
     D optcpmtbox0...
     D                 PR
     D optrepobox0...
     D                 PR
     D optcoffbox0...
     D                 PR
     D optdenybox0...
     D                 PR
     D apprentbox0...
     D                 PR
     D postpmtbox0...
     D                 PR
     D specresbox0...
     D                 PR
     D transorbox0...
     D                 PR
     D rtoretbox0...
     D                 PR
     D putwitypebox0...
     D                 PR
     D transfixbox0...
     D                 PR
     D abatebox0...
     D                 PR
     D revpmtbox0...
     D                 PR
     D waivefeebox0...
     D                 PR
     D chgduebox0...
     D                 PR
     D chgratebox0...
     D                 PR
     D chgamtbox0...
     D                 PR
     D adddlrbox0...
     D                 PR
     D editdlrbox0...
     D                 PR
     D addpgmbox0...
     D                 PR
     D editpgmbox0...
     D                 PR
     D splitpmtbox0...
     D                 PR
     D getlimits0...
     D                 PR
     D getoptions0...
     D                 PR
     D deletedocbox0...
     D                 PR
     D deletenotebox0...
     D                 PR
     D deletestipbox0...
     D                 PR
     D ipaddrbox0...
     D                 PR
     D titleamortbox0...
     D                 PR
     D overbox0...
     D                 PR
     D lnexpovrbox0...
     D                 PR
     D cnclappbox0...
     D                 PR
     D lnopnovrbox0...
     D                 PR
     D lnfundovrbox0...
     D                 PR
     D edtscraflgbox0...
     D                 PR
     D spechandlbox0...
     D                 PR
     D view_letters_bx0...
     D                 PR
     D view_callrec_bx0...
     D                 PR
     D edtfld_codes_bx0...
     D                 PR
     D edtfld_cnta_bx0...
     D                 PR
     D edtfld_cntb_bx0...
     D                 PR
     D edtfld_acctc_bx0...
     D                 PR
     D edtfld_lncds_bx0...
     D                 PR
     D edtfld_paycrd_bx0...
     D                 PR
     D edtfld_usrpin_bx0...
     D                 PR
     D timebox0...
     D                 PR
     D edtfld_edtintfld_bx0...
     D                 PR
     D CURTIME__       S              6P 0
     D QPGMNAM__       S             20A
     D SmurfChk__      S              1A   INZ(*ON)
     D Smurf_ID__      S             64A   IMPORT
     D Smurf_Rw__      S              9B 0 IMPORT

     D boxselect       S                   LIKE(p_zkeya       )
     D unseclimit      S                   LIKE(puaamt        )
     D goodslimit      S                   LIKE(puaamt        )
     D autolimit       S                   LIKE(puaamt        )
     D userprofile     S                   LIKE(puprofile     )
     D fpuid           S                   LIKE(puid          )
     D sup             S                   LIKE(puid          )
     D deletenote      S                   LIKE(deletedoc     )
     D deletestip      S                   LIKE(deletedoc     )
     D prevpage        S                   LIKE(pagenum       )
     D nextpage        S                   LIKE(pagenum       )
     D optapprove      S                   LIKE(puotype       )
     D optvoid         S                   LIKE(puotype       )
     D optrem          S                   LIKE(puotype       )
     D optasscon       S                   LIKE(puotype       )
     D optmodify       S                   LIKE(puotype       )
     D optbankr        S                   LIKE(puotype       )
     D optrepo         S                   LIKE(puotype       )
     D optjudge        S                   LIKE(puotype       )
     D optcpmt         S                   LIKE(puotype       )
     D optcoff         S                   LIKE(puotype       )
     D opttransfix     S                   LIKE(puotype       )
     D optabate        S                   LIKE(puotype       )
     D optdeny         S                   LIKE(puotype       )
     D optcoll         S                   LIKE(puotype       )
     D optascoll       S                   LIKE(puotype       )
     D optadmcoll      S                   LIKE(puotype       )
     D approval_score  S                   LIKE(puaamt        )
     D approval_drat   S                   LIKE(puaamt        )
     D approval_gross  S                   LIKE(puaamt        )
     D approval_tiftr  S                   LIKE(puaamt        )
     D approval_ramt   S                   LIKE(puaamt        )
     D approval_ravl   S                   LIKE(puaamt        )
     D approval_t30    S                   LIKE(puaamt        )
     D approval_t60    S                   LIKE(puaamt        )
     D approval_t90    S                   LIKE(puaamt        )
     D approval_bkmo   S                   LIKE(puaamt        )
     D approval_r      S                   LIKE(puoyesno      )
     D postpmt         S                   LIKE(puoyesno      )
     D specres         S                   LIKE(puoyesno      )
     D transor         S                   LIKE(puoyesno      )
     D revpmt          S                   LIKE(puoyesno      )
     D waivefee        S                   LIKE(puoyesno      )
     D chgdue          S                   LIKE(puoyesno      )
     D chgrate         S                   LIKE(puoyesno      )
     D chgamt          S                   LIKE(puoyesno      )
     D adddlr          S                   LIKE(puoyesno      )
     D editdlr         S                   LIKE(puoyesno      )
     D addpgm          S                   LIKE(puoyesno      )
     D editpgm         S                   LIKE(puoyesno      )
     D suppuid         S                   LIKE(puid          )
YK01 D roleid          S             40A   INZ
YK01 D usrrole         S             50A   INZ
     D department      S                   LIKE(puvalue       )
YK01 D usrPuvalue      S                   LIKE(puvalue       )
YK01 D wPuvalue        S                   LIKE(puvalue       )
YK01 D wRoleid         S                   LIKE(puvalue       )
YK04 D wprevRolid      S                   LIKE(puvalue       )
YK04 D waftRolid       S                   LIKE(puvalue       )
YK04 D wloggedRid      S                   LIKE(puvalue       )
YK01 D @Roleid         S                   LIKE(puvalue       )
YK01 D edtrole         S                   LIKE(puoyesno      )
YK05 D WPUOYESNO       S                   LIKE(puoyesno      )
YK05 D wFnd            S                   LIKE(puoyesno      )
     D rtoret          S                   LIKE(puoyesno      )
     D overver         S                   LIKE(puoyesno      )
     D lnexpovr        S                   LIKE(puoyesno      )
     D cnclapp         S                   LIKE(puoyesno      )
     D lnopnovr        S                   LIKE(puoyesno      )
     D lnfundovr       S                   LIKE(puoyesno      )
     D edtscraflg      S                   LIKE(puoyesno      )
     D spechandl       S                   LIKE(puoyesno      )
     D timecode        S                   LIKE(kwutmcode     )
RM01 D roleType        S                   LIKE(puotype       )
RM01 D roleYesNo       S                   LIKE(puoyesno      )
RM01 D roleValue       S                   LIKE(puvalue       )

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

       //  Log program call in job log:
       msgdta__=PGMNAME__ + PGMLIB__;
       snpmr__=SndPgmMsg_('APP5001':'PW_RTMSGF':  'XL_WEBSPT':msgdta__);
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

       // End debug
       if  chkdbg_(pgmname__: pgmlib__) = *ON;
        CALLP pw_dbgend(PGMNAME__:PGMLIB__);
       endif;

       // *PSSR  - Program exception/error handler.
       BEGSR *PSSR;
       // error handler closes error page HTML and writes it to browser:
       CALLP     ErrHandlr_('CLOSE' : PSDS__);
       // Exit program immediately:
       *INLR = *ON;

       // End debug
       if  chkdbg_(pgmname__: pgmlib__) = *ON;
        CALLP pw_dbgend(PGMNAME__:PGMLIB__);
       endif;
       RETURN;
       ENDSR;

      /end-free

      *--------------------------------------------------------------------------------------------*
      * Klistdcl__ - Subroutine to globally declare all KLISTS.
      *--------------------------------------------------------------------------------------------*
     C     Klistdcl__    BEGSR

     C     pfklist       KLIST
     C                   KFLD                    puid
     C     DL002_        KLIST
     C                   KFLD                    puid
     C                   KFLD                    puatype
     C     DL003_        KLIST
     C                   KFLD                    puid
     C                   KFLD                    pulno
     C     DL004_        KLIST
     C                   KFLD                    puid
     C                   KFLD                    plno
     C     DL005_        KLIST
     C                   KFLD                    kw_uclient
     C                   KFLD                    puid
     C     DL006_        KLIST
     C                   KFLD                    puid
     C                   KFLD                    puotype
     C     DL007_        KLIST
     C                   KFLD                    plno
     C     DL008_        KLIST
     C                   KFLD                    p_ztype
     C                   KFLD                    p_zkeya
     C                   KFLD                    p_zkeyn
     C     DL009_        KLIST
     C                   KFLD                    puid
     C     DL010_        KLIST
     C                   KFLD                    puid
     C     DL011_        KLIST
     C                   KFLD                    kwutmcode
     C     DL012_        KLIST
     C                   KFLD                    puid
     C                   KFLD                    puotype
     C                   ENDSR

YK01 C     DL999_        KLIST
YK01 C                   KFLD                    puid
YK01 C                   KFLD                    puvalue

      * Subprocedures follow:
      *--------------------------------------------------------------------------------------------*
      * main__ - Contains the main function source code from the PML
      *--------------------------------------------------------------------------------------------*
     P main__          B
     D main__          PI

      /free
       // PML Start ----------------------------------

       // PML Line:33*
       rnd = %trim(%editc(CURTIME__:'P'));

       // PML Line:71*
       artncod = HasItExpired_(SMURF_ID__);

       // PML Line:72*
       if (artncod <> '0');

        // PML Line:74*
        Redirect2_('login.pgm':'*SAME');

        // PML Line:75*
        return ;

        // PML Line:78*
       else;

        // PML Line:80*
        userdata = GetSmurf2_('KWIKLOAN');

        // PML Line:81*
        if (((client = '') or (userid = '')));

         // PML Line:83*
         Redirect2_('login.pgm':'*SAME');

         // PML Line:84*
         return ;
        endif;
       endif;

       // PML Line:90*
       ExecCmd2_('ADDLIBLE QGPL':%len(%trimr('ADDLIBLE QGPL')));

       // PML Line:94*
       ExecCmd2_( 'KWSET ' + %trim(client):%len(%trimr( 'KWSET ' + %trim(
       client))));

       // PML Line:96*
       Open_File_('*ALL': '*FIRST':  'Y');

       // PML Line:98*
       kw_wrtdataarea('*LDA':userid:'*LIBL':1:32);

       // PML Line:129*
       listsize = 10;

       // PML Line:157*
       startrrn = %dec(aton_( getparm3_('rrn':'*OPT'):46:16):9:0);

       // PML Line:232*
       if (task__ = 'DEFAULT');
        taskran__ = *ON;
        displist0();
       endif ;

       // PML Line:233*
       if (task__ = 'PREV');
        taskran__ = *ON;
        prev0();
       endif ;

       // PML Line:236*
       if (task__ = 'DISP');
        taskran__ = *ON;
        disprcd0();
       endif ;

       // PML Line:239*
       if (task__ = 'DELCONF');
        taskran__ = *ON;
        delconf0();
       endif ;

       // PML Line:240*
       if (task__ = 'DEL');
        taskran__ = *ON;
        deletercd0();
       endif ;

       // PML Line:243*
       if (task__ = 'BEGINMANAGE');
        taskran__ = *ON;
        beginmanage0();
       endif ;

       // PML Line:244*
       if (task__ = 'ENDMANAGE');
        taskran__ = *ON;
        endmanage0();
       endif ;

       // PML Line:248*
       ExecCmd2_('CHGLIBL LIBL(QTEMP QGPL)':%len(%trimr('CHGLIBL LIBL(QTEMP Q-
       GPL)')));

       // PML End   ----------------------------------
       if (taskran__ = *OFF and Jobtype__ ='0');

        // Get query string environment variable:
        rpml__=GetEvar_('QUERY_STRING' :  qrystr__:  %size(qrystr__));

        // Log query string used in job log:
        snpmr__=SndPgmMsg_('APP5002':'PW_RTMSGF': 'XL_WEBSPT':qrystr__);

        // Write page for missing/incorrect TASK parm
        WriteNoTaskPg_();
       endif;
      /end-free
     c     *PSSR         begsr
     c                   endsr
     P main__          E



       // PML Line:252*

     P*---------------------------------------------------------------------
     P* show_ip_btn0...             - User defined function
     P*---------------------------------------------------------------------
     P show_ip_btn0...
     P                 B
     D show_ip_btn0...
     D                 PI




      /free

       // PML Line:254*
 yk02  //if (userprofile = 'ADMINISTRATOR');

        // PML Line:255*
        outweb_(%subst(%str(%addr(H__9(1))):1:81));
 yk02  //endif;

       // PML Line:258*
      /end-free
     c     *PSSR         begsr
     c                   endsr
     P                 E


       // PML Line:260*

     P*---------------------------------------------------------------------
     P* displist0...                - User defined function
     P*---------------------------------------------------------------------
     P displist0...
     P                 B
     D displist0...
     D                 PI




      /free

       // PML Line:263*
       puid = userid;

       // PML Line:264*
       AM001_ = CV_BYKEY;
       CHAIN(NE) pfklist RKWPUBASE;
       RS001_ = RcdSts2_('GETRCD': %error: %found: %eof);

       // PML Line:265*
       userprofile = puprofile;

       // PML Line:266*
 yk02  //if (userprofile <> 'ADMINISTRATOR');

        // PML Line:267*
 yk02   //addhref = '';

        // PML Line:268*
 yk02  //else;

        // PML Line:270*
        addhref = 'window.location=''s_user.pgm?task=beginmanage&rrn=0&rnd='
       + %trim(rnd) + '''';
 yk02  //endif;

       // PML Line:272*
       puid = '';

       // PML Line:273*
       fpuid = getparm3_('fPUID':'*OPT');

       // PML Line:274*
       if (fpuid <> '');

        // PML Line:275*
        puid = fpuid;
       endif;

       // PML Line:279*
       outweb_(%subst(%str(%addr(H__1(1))):1:962));
       wfrtn__ = AfToPage_(QPGMNAM__);
       outweb_(%subst(%str(%addr(H__1(13))):3:28));
       wfrtn__ = AfToPage_(RND);
       outweb_(%subst(%str(%addr(H__1(13))):31:193));
       wfrtn__ = AfToPage_(ADDHREF);
       outweb_(%subst(%str(%addr(H__1(15))):64:192));
       wfrtn__ = AfToPage_(QPGMNAM__);
       outweb_(%subst(%str(%addr(H__1(18))):16:15));
       AfToPage_(%trim(%editc(STARTRRN:'X')));
       outweb_(%subst(%str(%addr(H__1(18))):31:176));
       wfrtn__ = AfToPage_(QPGMNAM__);
       outweb_(%subst(%str(%addr(H__1(20))):47:5));
       AfToPage_(%trim(%editc(ENDRRN:'X')));
       outweb_(%subst(%str(%addr(H__1(20))):52:214));
       wfrtn__ = AfToPage_(QPGMNAM__);
       outweb_(%subst(%str(%addr(H__1(23))):26:289));
       wfrtn__ = AfToPage_(FPUID);
       outweb_(%subst(%str(%addr(H__1(26))):75:200));

       // HTML Segment (1) ListHeader Line:37*
       show_ip_btn0();
       outweb_(%subst(%str(%addr(H__1(29))):35:711));

       // PML Line:280*
       rcdcnt = 0;

       // PML Line:284*
       if (startrrn> 0);

        // PML Line:286*
        RR_001_ = startrrn;

        // PML Line:287*
        AM001_ = CV_BYRRN;
        CHAIN(NE) RR_001_ R__ARR001;
        RS001_ = RcdSts2_('GETRCD': %error: %found: %eof);
       endif;

       // PML Line:289*
       prevpage = %dec(aton_( getparm3_('prevpage':'*OPT'):46:16):5:0);
       nextpage = %dec(aton_( getparm3_('nextpage':'*OPT'):46:16):5:0);

       // PML Line:292*
       if (prevpage> 1);

        // PML Line:294*
        RR_001_ = prevpage - 1;

        // PML Line:295*
        AM001_ = CV_BYRRN;
        CHAIN(NE) RR_001_ R__ARR001;
        RS001_ = RcdSts2_('GETRCD': %error: %found: %eof);
       endif;

       // PML Line:297*
       if (nextpage> 0);

        // PML Line:299*
        RR_001_ = nextpage;

        // PML Line:300*
        AM001_ = CV_BYRRN;
        CHAIN(NE) RR_001_ R__ARR001;
        RS001_ = RcdSts2_('GETRCD': %error: %found: %eof);
       endif;

       // PML Line:303*
       SETLL  pfklist RKWPUBASE;
       RS001_ = RcdSts2_('POSRCD':%error:%equal:%eof);

       // PML Line:305*
       if (fpuid <> '');

        // PML Line:306*
        READE(E) pfklist RKWPUBASE;
        RS001_ = RcdSts2_('GETNXTRCD':%error:%found:%eof);
        AM001_ = CV_ByKey;

        // PML Line:308*
       else;

        // PML Line:309*
        READ(E)  RKWPUBASE;
        RS001_ = RcdSts2_('GETNXTRCD':%error:%found:%eof);
        AM001_ = CV_ByKey;
       endif;

       // PML Line:313*
       if (RS001_ <> '1');

        // PML Line:315*
        SETLL  *HIVAL RKWPUBASE;
        RS001_ = RcdSts2_('POSRCD':%error:%equal:%eof);

        // PML Line:316*
        READ(E)  RKWPUBASE;
        RS001_ = RcdSts2_('GETNXTRCD':%error:%found:%eof);
        AM001_ = CV_ByKey;
       endif;

       // PML Line:319*
       dow ((((RS001_ = '1')) and ((rcdcnt< listsize))));

       // PML Line:322*
       rrn = RR_001_;

       // PML Line:325*
       if (rcdcnt = 0);

        // PML Line:328*
        startrrn = RR_001_;
       endif;

       // PML Line:332*
       disphref = '<a href="s_user.pgm?TASK=disp&rrn=' + %trim(%editc(rrn:'P'
       )) + '&FirstRowRRN=' + %trim(%editc(startrrn:'P')) + '"><img src="/web-
       smart/v7.2/Lincoln/images/view.gif" alt="Display" title="Display"></a>-
       ';

       // PML Line:333*
 yk02  //if (userprofile <> 'ADMINISTRATOR');

        // PML Line:335*
 yk02       //edithref = '';

        // PML Line:336*
 yk02    //delhref = '';

        // PML Line:338*
 yk02   //   else;

        // PML Line:340*
        edithref = '<a href="s_user.pgm?TASK=beginmanage&rrn=' + %trim(
       %editc(rrn:'P')) + '&FirstRowRRN=' + %trim(%editc(startrrn:'P')) + '">-
       <img src="/websmart/v7.2/Lincoln/images/edit.gif"  alt="Edit" title="E-
       dit"></a>';

        // PML Line:341*
        delhref = '<a href="s_user.pgm?TASK=delconf&rrn=' + %trim(%editc(rrn:
       'P')) + '&FirstRowRRN=' + %trim(%editc(startrrn:'P')) + '"><img src="/-
       websmart/v7.2/Lincoln/images/delete.gif" alt="Delete" title="Delete"><-
       /a>';
 yk02  //endif;

       // PML Line:345*
       if (prevpage = 0);

        // PML Line:346*
        prevpage = RR_001_;
       endif;

       // PML Line:347*
       nextpage = RR_001_;

       // PML Line:350*
       Flip_Rc_();
       outweb_(%subst(%str(%addr(H__2(1))):1:11));
       wfrtn__ = AfToPage_(ARCLR__);
       outweb_(%subst(%str(%addr(H__2(1))):12:22));
       wfrtn__ = AfToPage_(QPGMNAM__);
       outweb_(%subst(%str(%addr(H__2(1))):34:15));
       AfToPage_(%trim(%editc(RRN:'X')));
       outweb_(%subst(%str(%addr(H__2(1))):49:13));
       AfToPage_(%trim(%editc(STARTRRN:'X')));
       outweb_(%subst(%str(%addr(H__2(1))):62:104));
       wfrtn__ = AfToPage_(QPGMNAM__);
       outweb_(%subst(%str(%addr(H__2(3))):6:22));
       AfToPage_(%trim(%editc(RRN:'X')));
       outweb_(%subst(%str(%addr(H__2(3))):28:13));
       AfToPage_(%trim(%editc(STARTRRN:'X')));
       outweb_(%subst(%str(%addr(H__2(3))):41:99));
       wfrtn__ = AfToPage_(QPGMNAM__);
       outweb_(%subst(%str(%addr(H__2(4))):60:18));
       AfToPage_(%trim(%editc(RRN:'X')));
       outweb_(%subst(%str(%addr(H__2(4))):78:13));
       AfToPage_(%trim(%editc(STARTRRN:'X')));
       outweb_(%subst(%str(%addr(H__2(5))):11:127));
       wfrtn__ = AfToPage_(EDITHREF);
       outweb_(%subst(%str(%addr(H__2(6))):58:7));
       wfrtn__ = AfToPage_(DELHREF);
       outweb_(%subst(%str(%addr(H__2(6))):65:32));
       wfrtn__ = AfToPage_(PUID);
       outweb_(%subst(%str(%addr(H__2(7))):17:25));
       wfrtn__ = AfToPage_(PUPROFILE);
       outweb_(%subst(%str(%addr(H__2(7))):42:25));
       wfrtn__ = AfToPage_(PUNAME);
       outweb_(%subst(%str(%addr(H__2(7))):67:25));
       wfrtn__ = AfToPage_(PUEMAIL);
       outweb_(%subst(%str(%addr(H__2(8))):12:12));

       // PML Line:353*
       endrrn = RR_001_;

       // PML Line:356*
       rcdcnt = rcdcnt + 1;

       // PML Line:358*
       if (fpuid <> '');

        // PML Line:359*
        READE(E) pfklist RKWPUBASE;
        RS001_ = RcdSts2_('GETNXTRCD':%error:%found:%eof);
        AM001_ = CV_ByKey;

        // PML Line:361*
       else;

        // PML Line:362*
        READ(E)  RKWPUBASE;
        RS001_ = RcdSts2_('GETNXTRCD':%error:%found:%eof);
        AM001_ = CV_ByKey;
       endif;
       enddo;

       // PML Line:366*
       if (rcdcnt = listsize);

        // PML Line:371*
        READ(NE)  R__ARR001;
        RS001_ = RcdSts2_('GETNXTRCD':%error:%found:%eof);
        AM001_ = CV_ByRrn;

        // PML Line:372*
        if (RS001_ = '1');

         // PML Line:374*
         endrrn = RR_001_;

         // PML Line:375*
         nextstate = 1;
        endif;
       endif;

       // PML Line:381*
       RR_001_ = startrrn;

       // PML Line:382*
       AM001_ = CV_BYRRN;
       CHAIN(NE) RR_001_ R__ARR001;
       RS001_ = RcdSts2_('GETRCD': %error: %found: %eof);

       // PML Line:383*
       SETLL  pfklist RKWPUBASE;
       RS001_ = RcdSts2_('POSRCD':%error:%equal:%eof);

       // PML Line:384*
       READP(NE)  R__ARR001;
       RS001_ = RcdSts2_('GETPRVRCD': %error: %found: %eof);
       AM001_ = CV_ByRrn;

       // PML Line:386*
       if (RS001_ = '1');

        // PML Line:387*
        prevstate = 1;
       endif;

       // PML Line:390*
       outweb_(%subst(%str(%addr(H__3(1))):1:53));
       AfToPage_(%trim(%editc(PREVPAGE:'X')));
       outweb_(%subst(%str(%addr(H__3(1))):54:47));
       AfToPage_(%trim(%editc(NEXTPAGE:'X')));
       outweb_(%subst(%str(%addr(H__3(2))):21:254));
       AfToPage_(%trim(%editc(STARTRRN:'P')));
       outweb_(%subst(%str(%addr(H__3(5))):35:118));
       wfrtn__ = AfToPage_(QPGMNAM__);
       outweb_(%subst(%str(%addr(H__3(6))):73:15));
       AfToPage_(%trim(%editc(STARTRRN:'X')));
       outweb_(%subst(%str(%addr(H__3(7))):8:52));
       AfToPage_(%trim(%editc(ENDRRN:'P')));
       outweb_(%subst(%str(%addr(H__3(7))):60:119));
       wfrtn__ = AfToPage_(QPGMNAM__);
       outweb_(%subst(%str(%addr(H__3(9))):19:18));
       AfToPage_(%trim(%editc(ENDRRN:'X')));
       outweb_(%subst(%str(%addr(H__3(9))):37:95));

       // PML Line:392*
      /end-free
     c     *PSSR         begsr
     c                   endsr
     P                 E


       // PML Line:396*

     P*---------------------------------------------------------------------
     P* prev0...                    - User defined function
     P*---------------------------------------------------------------------
     P prev0...
     P                 B
     D prev0...
     D                 PI




      /free

       // PML Line:398*
       RR_001_ = startrrn;

       // PML Line:399*
       AM001_ = CV_BYRRN;
       CHAIN(NE) RR_001_ R__ARR001;
       RS001_ = RcdSts2_('GETRCD': %error: %found: %eof);

       // PML Line:401*
       SETLL  pfklist RKWPUBASE;
       RS001_ = RcdSts2_('POSRCD':%error:%equal:%eof);

       // PML Line:402*
       READP(E)  RKWPUBASE;
       RS001_ = RcdSts2_('GETPRVRCD': %error: %found: %eof);
       AM001_ = CV_ByKey;

       // PML Line:403*
       rcdcnt = 1;

       // PML Line:404*
       dow ((((RS001_ = '1')) and ((rcdcnt< listsize))));

       // PML Line:406*
       rcdcnt = rcdcnt + 1;

       // PML Line:407*
       READP(E)  RKWPUBASE;
       RS001_ = RcdSts2_('GETPRVRCD': %error: %found: %eof);
       AM001_ = CV_ByKey;
       enddo;

       // PML Line:411*
       startrrn = RR_001_;

       // PML Line:413*
       displist0();

       // PML Line:414*
      /end-free
     c     *PSSR         begsr
     c                   endsr
     P                 E


       // PML Line:419*

     P*---------------------------------------------------------------------
     P* disprcd0...                 - User defined function
     P*---------------------------------------------------------------------
     P disprcd0...
     P                 B
     D disprcd0...
     D                 PI




      /free

       // PML Line:422*
       rrn = %dec(aton_( getparm3_('rrn':'*MAND'):46:16):9:0);

       // PML Line:425*
       savedrrn = getparm3_('FirstRowRRN':'*OPT');

       // PML Line:428*
       RR_001_ = rrn;

       // PML Line:429*
       AM001_ = CV_BYRRN;
       CHAIN(E) RR_001_ R__ARR001;
       RS001_ = RcdSts2_('GETRCD': %error: %found: %eof);

       // PML Line:431*
       getlimits0();

       // PML Line:432*
       getoptions0();

       // PML Line:434*
       SETLL  pfklist RKWPUCASH;
       RS003_ = RcdSts2_('POSRCD':%error:%equal:%eof);

       // PML Line:435*
       READE(NE) pfklist RKWPUCASH;
       RS003_ = RcdSts2_('GETNXTRCD':%error:%found:%eof);
       AM003_ = CV_ByKey;

       // PML Line:437*
       chain(N) DL003_ RKWPUCASH;
       RS003_ = RcdSts2_('GETRCDN':%error: %found: %eof);
       outweb_(%subst(%str(%addr(H__4(1))):1:1577));
       if (TASK__ = 'DISP');

        // HTML Segment (4) RcdDisplay Line:31*
        outweb_(%subst(%str(%addr(H__6(1))):1:48));
        wfrtn__ = AfToPage_(SAVEDRRN);
        outweb_(%subst(%str(%addr(H__6(1))):49:17));
       else;
        if (TASK__ = 'DELCONF');

         // HTML Segment (4) RcdDisplay Line:33*
         outweb_(%subst(%str(%addr(H__5(1))):1:61));
         wfrtn__ = AfToPage_(QPGMNAM__);
         outweb_(%subst(%str(%addr(H__5(1))):62:14));
         AfToPage_(%trim(%editc(RRN:'X')));
         outweb_(%subst(%str(%addr(H__5(1))):76:13));
         wfrtn__ = AfToPage_(SAVEDRRN);
         outweb_(%subst(%str(%addr(H__5(2))):9:63));
         wfrtn__ = AfToPage_(SAVEDRRN);
         outweb_(%subst(%str(%addr(H__5(2))):72:10));
        endif;
       endif;
       outweb_(%subst(%str(%addr(H__4(20))):58:128));
       wfrtn__ = AfToPage_(PUID);
       outweb_(%subst(%str(%addr(H__4(22))):26:107));
       wfrtn__ = AfToPage_(PUPROFILE);
       outweb_(%subst(%str(%addr(H__4(23))):53:104));
       wfrtn__ = AfToPage_(PUNAME);
       outweb_(%subst(%str(%addr(H__4(24))):77:105));
       wfrtn__ = AfToPage_(PUTITLE);
       outweb_(%subst(%str(%addr(H__4(26))):22:108));
       wfrtn__ = AfToPage_(PUEMAIL);
       outweb_(%subst(%str(%addr(H__4(27))):50:103));
       wfrtn__ = AfToPage_(PUINIT);
       outweb_(%subst(%str(%addr(H__4(28))):73:107));
       wfrtn__ = AfToPage_(PULNPROD);
       outweb_(%subst(%str(%addr(H__4(30))):20:107));
       AfToPage_(%trim(%editc(PUCBAL:'J')));
       outweb_(%subst(%str(%addr(H__4(31))):47:112));
       AfToPage_(%trim(%editc(PUCLIM1:'J')));
       outweb_(%subst(%str(%addr(H__4(32))):79:112));
       AfToPage_(%trim(%editc(PUCLIM2:'J')));
       outweb_(%subst(%str(%addr(H__4(34))):31:120));
       AfToPage_(%trim(%editc(UNSECLIMIT:'J')));
       outweb_(%subst(%str(%addr(H__4(35))):71:116));
       AfToPage_(%trim(%editc(GOODSLIMIT:'J')));
       outweb_(%subst(%str(%addr(H__4(37))):27:118));
       AfToPage_(%trim(%editc(AUTOLIMIT:'J')));
       outweb_(%subst(%str(%addr(H__4(38))):65:72));

       // PML Line:438*
      /end-free
     c     *PSSR         begsr
     c                   endsr
     P                 E


       // PML Line:441*

     P*---------------------------------------------------------------------
     P* delconf0...                 - User defined function
     P*---------------------------------------------------------------------
     P delconf0...
     P                 B
     D delconf0...
     D                 PI




      /free

       // PML Line:444*
       rrn = %dec(aton_( getparm3_('rrn':'*MAND'):46:16):9:0);

       // PML Line:447*
       savedrrn = getparm3_('FirstRowRRN':'*OPT');

       // PML Line:450*
       RR_001_ = rrn;

       // PML Line:451*
       AM001_ = CV_BYRRN;
       CHAIN(E) RR_001_ R__ARR001;
       RS001_ = RcdSts2_('GETRCD': %error: %found: %eof);

       // PML Line:453*
       chain(N) DL003_ RKWPUCASH;
       RS003_ = RcdSts2_('GETRCDN':%error: %found: %eof);
       outweb_(%subst(%str(%addr(H__4(1))):1:1577));
       if (TASK__ = 'DISP');

        // HTML Segment (4) RcdDisplay Line:31*
        outweb_(%subst(%str(%addr(H__6(1))):1:48));
        wfrtn__ = AfToPage_(SAVEDRRN);
        outweb_(%subst(%str(%addr(H__6(1))):49:17));
       else;
        if (TASK__ = 'DELCONF');

         // HTML Segment (4) RcdDisplay Line:33*
         outweb_(%subst(%str(%addr(H__5(1))):1:61));
         wfrtn__ = AfToPage_(QPGMNAM__);
         outweb_(%subst(%str(%addr(H__5(1))):62:14));
         AfToPage_(%trim(%editc(RRN:'X')));
         outweb_(%subst(%str(%addr(H__5(1))):76:13));
         wfrtn__ = AfToPage_(SAVEDRRN);
         outweb_(%subst(%str(%addr(H__5(2))):9:63));
         wfrtn__ = AfToPage_(SAVEDRRN);
         outweb_(%subst(%str(%addr(H__5(2))):72:10));
        endif;
       endif;
       outweb_(%subst(%str(%addr(H__4(20))):58:128));
       wfrtn__ = AfToPage_(PUID);
       outweb_(%subst(%str(%addr(H__4(22))):26:107));
       wfrtn__ = AfToPage_(PUPROFILE);
       outweb_(%subst(%str(%addr(H__4(23))):53:104));
       wfrtn__ = AfToPage_(PUNAME);
       outweb_(%subst(%str(%addr(H__4(24))):77:105));
       wfrtn__ = AfToPage_(PUTITLE);
       outweb_(%subst(%str(%addr(H__4(26))):22:108));
       wfrtn__ = AfToPage_(PUEMAIL);
       outweb_(%subst(%str(%addr(H__4(27))):50:103));
       wfrtn__ = AfToPage_(PUINIT);
       outweb_(%subst(%str(%addr(H__4(28))):73:107));
       wfrtn__ = AfToPage_(PULNPROD);
       outweb_(%subst(%str(%addr(H__4(30))):20:107));
       AfToPage_(%trim(%editc(PUCBAL:'J')));
       outweb_(%subst(%str(%addr(H__4(31))):47:112));
       AfToPage_(%trim(%editc(PUCLIM1:'J')));
       outweb_(%subst(%str(%addr(H__4(32))):79:112));
       AfToPage_(%trim(%editc(PUCLIM2:'J')));
       outweb_(%subst(%str(%addr(H__4(34))):31:120));
       AfToPage_(%trim(%editc(UNSECLIMIT:'J')));
       outweb_(%subst(%str(%addr(H__4(35))):71:116));
       AfToPage_(%trim(%editc(GOODSLIMIT:'J')));
       outweb_(%subst(%str(%addr(H__4(37))):27:118));
       AfToPage_(%trim(%editc(AUTOLIMIT:'J')));
       outweb_(%subst(%str(%addr(H__4(38))):65:72));

       // PML Line:454*
      /end-free
     c     *PSSR         begsr
     c                   endsr
     P                 E


       // PML Line:456*

     P*---------------------------------------------------------------------
     P* deletercd0...               - User defined function
     P*---------------------------------------------------------------------
     P deletercd0...
     P                 B
     D deletercd0...
     D                 PI




      /free

       // PML Line:459*
       rrn = %dec(aton_( getparm3_('rrn':'*MAND'):46:16):9:0);

       // PML Line:462*
       savedrrn = getparm3_('FirstRowRRN':'*OPT');

       // PML Line:465*
       RR_001_ = rrn;

       // PML Line:466*
       AM001_ = CV_BYRRN;
       CHAIN(E) RR_001_ R__ARR001;
       RS001_ = RcdSts2_('GETRCD': %error: %found: %eof);

       // PML Line:470*
       if (rrn = %dec(aton_(savedrrn:46:16):46:16));

        // PML Line:473*
        SETLL  pfklist RKWPUBASE;
        RS001_ = RcdSts2_('POSRCD':%error:%equal:%eof);

        // PML Line:474*
        READP(E)  RKWPUBASE;
        RS001_ = RcdSts2_('GETPRVRCD': %error: %found: %eof);
        AM001_ = CV_ByKey;

        // PML Line:477*
        savedrrn = %trim(%editc(RR_001_:'P'));

        // PML Line:480*
        RR_001_ = rrn;

        // PML Line:481*
        AM001_ = CV_BYRRN;
        CHAIN(E) RR_001_ R__ARR001;
        RS001_ = RcdSts2_('GETRCD': %error: %found: %eof);
       endif;

       // PML Line:485*
      /end-free
     C                   EVAL      RS001_ = DeleteRcd_('RKWPUBASE')
      /free

       // PML Line:486*
       AM009_ = CV_BYKEY;
       CHAIN(E) DL009_ RKWPUTWILI;
       RS009_ = RcdSts2_('GETRCD': %error: %found: %eof);

       // PML Line:487*
      /end-free
     C                   EVAL      RS009_ = DeleteRcd_('RKWPUTWILI')
      /free

       // PML Line:489*
       p_ztype = 'KWPUBASE';

       // PML Line:490*
       p_zkeya = puid;

       // PML Line:491*
       AM008_ = CV_BYKEY;
       CHAIN(E) DL008_ RKWPDATA;
       RS008_ = RcdSts2_('GETRCD': %error: %found: %eof);

       // PML Line:492*
       if (RS008_ = '1');

        // PML Line:493*
      /end-free
     C                   EVAL      RS008_ = DeleteRcd_('RKWPDATA')
      /free
       endif;

       // PML Line:496*
       KW_UCLIENT = %dec(aton_(client:46:16):46:16);

       // PML Line:497*
       AM005_ = CV_BYKEY;
       CHAIN(E) DL005_ RKWUSER;
       RS005_ = RcdSts2_('GETRCD': %error: %found: %eof);

       // PML Line:498*
       if (RS005_ = '1');

        // PML Line:499*
      /end-free
     C                   EVAL      RS005_ = DeleteRcd_('RKWUSER')
      /free
       endif;

       // PML Line:502*
       SETLL  pfklist RKWPULOC;
       RS002_ = RcdSts2_('POSRCD':%error:%equal:%eof);

       // PML Line:503*
       READE(E) pfklist RKWPULOC;
       RS002_ = RcdSts2_('GETNXTRCD':%error:%found:%eof);
       AM002_ = CV_ByKey;

       // PML Line:504*
       dow (RS002_ = '1');

       // PML Line:506*
      /end-free
     C                   EVAL      RS002_ = DeleteRcd_('RKWPULOC')
      /free

       // PML Line:507*
       READE(E) pfklist RKWPULOC;
       RS002_ = RcdSts2_('GETNXTRCD':%error:%found:%eof);
       AM002_ = CV_ByKey;
       enddo;

       // PML Line:510*
       SETLL  pfklist RKWPUCASH;
       RS003_ = RcdSts2_('POSRCD':%error:%equal:%eof);

       // PML Line:511*
       READE(E) pfklist RKWPUCASH;
       RS003_ = RcdSts2_('GETNXTRCD':%error:%found:%eof);
       AM003_ = CV_ByKey;

       // PML Line:512*
       dow (RS003_ = '1');

       // PML Line:514*
      /end-free
     C                   EVAL      RS003_ = DeleteRcd_('RKWPUCASH')
      /free

       // PML Line:515*
       READE(E) pfklist RKWPUCASH;
       RS003_ = RcdSts2_('GETNXTRCD':%error:%found:%eof);
       AM003_ = CV_ByKey;
       enddo;

       // PML Line:518*
       SETLL  pfklist R__FMT01;
       RS004_ = RcdSts2_('POSRCD':%error:%equal:%eof);

       // PML Line:519*
       READE(E) pfklist R__FMT01;
       RS004_ = RcdSts2_('GETNXTRCD':%error:%found:%eof);
       AM004_ = CV_ByKey;

       // PML Line:520*
       dow (RS004_ = '1');

       // PML Line:522*
      /end-free
     C                   EVAL      RS004_ = DeleteRcd_('R__FMT01')
      /free

       // PML Line:523*
       READE(E) pfklist R__FMT01;
       RS004_ = RcdSts2_('GETNXTRCD':%error:%found:%eof);
       AM004_ = CV_ByKey;
       enddo;
       //Get Logged User RoleId
       //AECP-3116  Start
        wloggedRid = *Zeros;
        Exec sql
        select RL_roleid into :wloggedRid
        from kwlrole WHERE RL_ROLEID =
        (select puvalue from kwpuopt where puid = :userid
         and puotype = 'USERROLE');
       //AECP-3116  End

       // PML Line:526*
       SETLL  pfklist RKWPUOPT;
       RS006_ = RcdSts2_('POSRCD':%error:%equal:%eof);

       // PML Line:527*
       READE(E) pfklist RKWPUOPT;
       RS006_ = RcdSts2_('GETNXTRCD':%error:%found:%eof);
       AM006_ = CV_ByKey;

       // PML Line:528*
       dow (RS006_ = '1');
      //AECP-3116   Start
        if ( PUOTYPE = 'USERROLE');
        exec sql
        select PUVALUE into :wprevRolid from KWPUOPT
        where PUID = :PUID and PUOTYPE = 'USERROLE';
        Exec Sql
          insert into klsyschg(KL_USERID,KL_ROLEID,KL_FIELDCHG,KL_VALBCHG,
                      KL_VALACHG,CREATE_USER_NAME)
          values(:userid, :wloggedRid, :puotype, :wprevRolid, 'Deleted',:puid);
        else;
        Exec Sql
          insert into klsyschg(KL_USERID,KL_ROLEID,KL_FIELDCHG,KL_VALBCHG,
                      KL_VALACHG,CREATE_USER_NAME)
            values(:userid, :wloggedRid, :puotype, :puoyesno, 'Deleted',:puid);
        EndIf;
      //AECP-3116   End

       // PML Line:530*
      /end-free
     C                   EVAL      RS006_ = DeleteRcd_('RKWPUOPT')
      /free

       // PML Line:531*
       READE(E) pfklist RKWPUOPT;
       RS006_ = RcdSts2_('GETNXTRCD':%error:%found:%eof);
       AM006_ = CV_ByKey;
       enddo;

       // PML Line:535*
       Redirect2_( '?rrn=' + savedrrn:'*SAME');

       // PML Line:536*
      /end-free
     c     *PSSR         begsr
     c                   endsr
     P                 E


       // PML Line:541*

     P*---------------------------------------------------------------------
     P* beginmanage0...             - User defined function
     P*---------------------------------------------------------------------
     P beginmanage0...
     P                 B
     D beginmanage0...
     D                 PI




      /free

       // PML Line:544*
       rrn = %dec(aton_( getparm3_('rrn':'*MAND'):46:16):9:0);

       // PML Line:547*
       savedrrn = getparm3_('FirstRowRRN':'*OPT');

       // PML Line:550*
       RR_001_ = rrn;

       // PML Line:551*
       AM001_ = CV_BYRRN;
       CHAIN(E) RR_001_ R__ARR001;
       RS001_ = RcdSts2_('GETRCD': %error: %found: %eof);

       // PML Line:553*
       if (RS001_ = '1');

        // PML Line:555*
        getlimits0();

        // PML Line:556*
        getoptions0();

        // PML Line:557*
        SETLL  pfklist RKWPUCASH;
        RS003_ = RcdSts2_('POSRCD':%error:%equal:%eof);

        // PML Line:558*
        READE(NE) pfklist RKWPUCASH;
        RS003_ = RcdSts2_('GETNXTRCD':%error:%found:%eof);
        AM003_ = CV_ByKey;

        // PML Line:561*
        KW_UCLIENT = %dec(aton_(client:46:16):46:16);

        // PML Line:562*
        AM005_ = CV_BYKEY;
        CHAIN(NE) DL005_ RKWUSER;
        RS005_ = RcdSts2_('GETRCD': %error: %found: %eof);

        // PML Line:563*
        AM009_ = CV_BYKEY;
        CHAIN(NE) DL009_ RKWPUTWILI;
        RS009_ = RcdSts2_('GETRCD': %error: %found: %eof);
       endif;

       // PML Line:567*
       outweb_(%subst(%str(%addr(H__7(1))):1:330));

       // HTML Segment (7) RcdManage Line:8*
       outweb_(%subst(%str(%addr(H__8(1))):1:2601));
 YK01  outweb_('</style>');
 YK01  outweb_('<script src="https://code.jquery.com/jquery-3.5.1.min.js">');
 YK01  outweb_('</script><script>');
 YK01  outweb_('$(document).ready(function(){');
 YK01  outweb_('$("#SPECRES").prop("disabled", true);');
 YK01  outweb_('$("#OPTABATE").prop("disabled", true);');
 YK01  outweb_('$("#ADDDLR").prop("disabled", true);');
 YK01  outweb_('$("#EDITDLR").prop("disabled", true);');
 YK01  outweb_('$("#ADDPGM").prop("disabled", true);');
 YK01  outweb_('$("#EDITPGM").prop("disabled", true);');
 YK01  outweb_('$("#SPECHANDL").prop("disabled", true);');
 YK01  outweb_('$("#DELETEDOC").prop("disabled", true);');
 YK01  outweb_('$("#DELETENOTE").prop("disabled", true);');
 YK01  outweb_('$("#EDTFACCTC").prop("disabled", true);');
 YK01  outweb_('$("#DELETESTIP").prop("disabled", true);');
 YK01  outweb_('$("#OPTTRANSFIX").prop("disabled", true);');
 YK01  outweb_('$("#DEPARTMENT").prop("disabled", true);');
 YK01  outweb_('$("#USRPIN").prop("disabled", true);');
 YK01  outweb_('$("#EDTSCRAFLG").prop("disabled", true);');
 YK01  outweb_('$("#EDTINTFLD").prop("disabled", true);');
 YK01  outweb_('$("#EDTFPAYCRD").prop("disabled", true);');
 YK01  outweb_('$("#WAIVEFEE").prop("disabled", true);');
 YK01  outweb_('$("#OPTVOID").prop("disabled", true);');
 YK01  outweb_('$("#VIEWLETT").prop("disabled", true);');
 YK01  outweb_('$("#VIEWCALL").prop("disabled", true);');
 YK01  outweb_('$("#TITLEAMORT").prop("disabled", true);');
 YK01  outweb_('$("#SPLITPMT").prop("disabled", true);');
 YK01  outweb_('$("#RTORET").prop("disabled", true);');
 YK01  outweb_('$("#REVPMT").prop("disabled", true);');
 YK01  outweb_('$("#OPTREPO").prop("disabled", true);');
 YK01  outweb_('$("#OPTREM").prop("disabled", true);');
 YK01  outweb_('$("#POSTPMT").prop("disabled", true);');
 YK01  outweb_('$("#OVERVER").prop("disabled", true);');
 YK01  outweb_('$("#OPTMODIFY").prop("disabled", true);');
 YK01  outweb_('$("#LNOPNOVR").prop("disabled", true);');
 YK01  outweb_('$("#LNFUNDOVR").prop("disabled", true);');
 YK01  outweb_('$("#LNEXPOVR").prop("disabled", true);');
 YK01  outweb_('$("#OPTJUDGE").prop("disabled", true);');
 YK01  outweb_('$("#EDTFLNCDS").prop("disabled", true);');
 YK01  outweb_('$("#EDTFCODES").prop("disabled", true);');
 YK01  outweb_('$("#EDTFCNTB").prop("disabled", true);');
 YK01  outweb_('$("#EDTFCNTA").prop("disabled", true);');
 YK01  outweb_('$("#OPTDENY").prop("disabled", true);');
 YK01  outweb_('$("#CNCLAPP").prop("disabled", true);');
 YK01  outweb_('$("#CHKIPADDR").prop("disabled", true);');
 YK01  outweb_('$("#CHGRATE").prop("disabled", true);');
 YK01  outweb_('$("#CHGDUE").prop("disabled", true);');
 YK01  outweb_('$("#CHGAMT").prop("disabled", true);');
 YK01  outweb_('$("#OPTADMCOLL").prop("disabled", true);');
 YK01  outweb_('$("#OPTCOLL").prop("disabled", true);');
 YK01  outweb_('$("#APPROVAL_R").prop("disabled", true);');
 YK01  outweb_('$("#OPTAPPROVE").prop("disabled", true);');
 YK01  outweb_('$("#OPTASSCON").prop("disabled", true);');
 YK01  outweb_('$("#OPTASCOLL").prop("disabled", true);');
 YK01  outweb_('$("#OPTBANKR").prop("disabled", true);');
 YK01  outweb_('$("#TRANSOR").prop("disabled", true);');
 YK01  outweb_('$("#OPTCOFF").prop("disabled", true);');
 YK01  outweb_('});</script>');
       outweb_(%subst(%str(%addr(H__7(5))):11:2182));
       wfrtn__ = AfToPage_(QPGMNAM__);
       outweb_(%subst(%str(%addr(H__7(32))):33:119));
       AfToPage_(%trim(%editc(RRN:'X')));
       outweb_(%subst(%str(%addr(H__7(33))):72:56));
       wfrtn__ = AfToPage_(SAVEDRRN);
       outweb_(%subst(%str(%addr(H__7(34))):48:65));
       wfrtn__ = AfToPage_(CACFLAG);
       outweb_(%subst(%str(%addr(H__7(35))):33:273));
       wfrtn__ = AfToPage_(SAVEDRRN);
       outweb_(%subst(%str(%addr(H__7(38))):66:773));
       wfrtn__ = AfToPage_(PUID);
       outweb_(%subst(%str(%addr(H__7(48))):39:235));
       wfrtn__ = AfToPage_(KW_UPASS);

       outweb_(%subst(%str(%addr(H__7(51))):34:284));
YK01    // HTML Segment
YK01
YK01   // HTML Code for User Role
YK01   OutWeb_('                   <tr> '+x'0D'+''+x'25'+'                     -
YK01    <td class="left">User Role:</td> '+x'0D'+''+x'25'+'                    -
YK01      <td class="right"><select type="select-one" name="ROLES" -
YK01   id="ROLES"onblur=">');
Yk01   Rolbox0();
YK01   //HTML segment
YK01    OutWeb_('                                            </tr> -
YK01    '+x'0D'+''+x'25'+' ');
Yk01
YK01   // HTML Code for User Profile
YK01   OutWeb_('                 <tr> '+x'0D'+''+x'25'+'                       -
YK01      <td class="left">User Profile:</td> '+x'0D'+''+x'25'+'               -
YK01        <td class="right"><input type="text" name="PUPROFILE" -
YK01      id="PUPROFILE" value = "');
YK01   wfrtn__ = AfToPage_(PUPROFILE);
YK01   OutWeb_('" readonly>');
       // HTML Segment (7) RcdManage Line:126*
YK01   //puprofilebox0();
       outweb_(%subst(%str(%addr(H__7(54))):78:217));
       wfrtn__ = AfToPage_(PUNAME);
       outweb_(%subst(%str(%addr(H__7(57))):55:221));
       wfrtn__ = AfToPage_(PUTITLE);
       outweb_(%subst(%str(%addr(H__7(60))):36:153));

       // HTML Segment (7) RcdManage Line:138*
       locbox0();
       outweb_(%subst(%str(%addr(H__7(62))):29:153));

       // HTML Segment (7) RcdManage Line:142*
       depbox0();
       outweb_(%subst(%str(%addr(H__7(64))):22:153));

       // HTML Segment (7) RcdManage Line:146*
       supbox0();
       outweb_(%subst(%str(%addr(H__7(66))):15:168));

       // HTML Segment (7) RcdManage Line:150*
       specresbox0();
       outweb_(%subst(%str(%addr(H__7(68))):23:203));

       // HTML Segment (7) RcdManage Line:155*
       spechandlbox0();
       outweb_(%subst(%str(%addr(H__7(70))):66:181));

       // HTML Segment (7) RcdManage Line:159*
       transorbox0();
       outweb_(%subst(%str(%addr(H__7(73))):7:194));
       wfrtn__ = AfToPage_(PULNGRP);
       outweb_(%subst(%str(%addr(H__7(75))):41:268));
       wfrtn__ = AfToPage_(PUTWIOVUSR);
       outweb_(%subst(%str(%addr(H__7(78))):69:250));
       wfrtn__ = AfToPage_(PUTWIOVPWD);
       outweb_(%subst(%str(%addr(H__7(81))):79:224));
       wfrtn__ = AfToPage_(PUEMAIL);
       outweb_(%subst(%str(%addr(H__7(84))):63:216));
       wfrtn__ = AfToPage_(PUINIT);
       outweb_(%subst(%str(%addr(H__7(87))):39:157));

       // HTML Segment (7) RcdManage Line:184*
       prodbox0();
       outweb_(%subst(%str(%addr(H__7(89))):36:220));
       AfToPage_(%trim(%editc(PUCBAL:'J')));
       outweb_(%subst(%str(%addr(H__7(92))):16:228));
       AfToPage_(%trim(%editc(PUCLIM1:'J')));
       outweb_(%subst(%str(%addr(H__7(95))):4:228));
       AfToPage_(%trim(%editc(PUCLIM2:'J')));
       outweb_(%subst(%str(%addr(H__7(97))):72:239));
       AfToPage_(%trim(%editc(UNSECLIMIT:'J')));
       outweb_(%subst(%str(%addr(H__7(100))):71:245));
       AfToPage_(%trim(%editc(GOODSLIMIT:'J')));
       outweb_(%subst(%str(%addr(H__7(103))):76:236));
       AfToPage_(%trim(%editc(AUTOLIMIT:'J')));
       outweb_(%subst(%str(%addr(H__7(106))):72:161));

       // HTML Segment (7) RcdManage Line:212*
       optadmcollbox0();
       outweb_(%subst(%str(%addr(H__7(108))):73:166));

       // HTML Segment (7) RcdManage Line:216*
       optascollbox0();
       outweb_(%subst(%str(%addr(H__7(110))):79:159));

       // HTML Segment (7) RcdManage Line:220*
       optcollbox0();
       outweb_(%subst(%str(%addr(H__7(112))):78:166));

       // HTML Segment (7) RcdManage Line:224*
       optmodbox0();
       outweb_(%subst(%str(%addr(H__7(115))):4:164));

       // HTML Segment (7) RcdManage Line:228*
       optjudgebox0();
       outweb_(%subst(%str(%addr(H__7(117))):8:165));

       // HTML Segment (7) RcdManage Line:232*
       optbankrbox0();
       outweb_(%subst(%str(%addr(H__7(119))):13:75));

       // HTML Segment (7) RcdManage Line:235*
       if (client <> '104');

        // HTML Segment (7) RcdManage Line:238*
        OutWeb_('<tr><td class="left">Repo Authority:</td>'+x'0D'+''+x'25'+' -
                            <td class="right">');

        // HTML Segment (7) RcdManage Line:238*
        optrepobox0();

        // HTML Segment (7) RcdManage Line:238*
        OutWeb_('</td></tr>');

        // HTML Segment (7) RcdManage Line:240*
       else;

        // HTML Segment (7) RcdManage Line:242*
        OutWeb_('<tr><td class="left">Card Payment Authority:</td>'+x'0D'+''
       +x'25'+'                      <td class="right">');

        // HTML Segment (7) RcdManage Line:242*
        optcpmtbox0();

        // HTML Segment (7) RcdManage Line:242*
        OutWeb_('</td></tr>');
       endif;
       outweb_(%subst(%str(%addr(H__7(120))):8:132));

       // HTML Segment (7) RcdManage Line:247*
       optcoffbox0();
       outweb_(%subst(%str(%addr(H__7(121))):60:183));

       // HTML Segment (7) RcdManage Line:251*
       optapprovebox0();
       outweb_(%subst(%str(%addr(H__7(124))):3:172));

       // HTML Segment (7) RcdManage Line:255*
       optrembox0();
       outweb_(%subst(%str(%addr(H__7(126))):15:163));

       // HTML Segment (7) RcdManage Line:259*
       optvoidbox0();
       outweb_(%subst(%str(%addr(H__7(128))):18:165));

       // HTML Segment (7) RcdManage Line:263*
       optassconbox0();
       outweb_(%subst(%str(%addr(H__7(130))):23:160));

       // HTML Segment (7) RcdManage Line:267*
       optdenybox0();
       outweb_(%subst(%str(%addr(H__7(132))):23:182));

       // HTML Segment (7) RcdManage Line:272*
       rtoretbox0();
       outweb_(%subst(%str(%addr(H__7(134))):45:179));

       // HTML Segment (7) RcdManage Line:277*
       postpmtbox0();
       outweb_(%subst(%str(%addr(H__7(136))):64:182));

       // HTML Segment (7) RcdManage Line:282*
       revpmtbox0();
       outweb_(%subst(%str(%addr(H__7(139))):6:176));

       // HTML Segment (7) RcdManage Line:287*
       waivefeebox0();
       outweb_(%subst(%str(%addr(H__7(141))):22:209));

       // HTML Segment (7) RcdManage Line:293*
       overbox0();
       outweb_(%subst(%str(%addr(H__7(143))):71:182));

       // HTML Segment (7) RcdManage Line:298*
       chgduebox0();
       outweb_(%subst(%str(%addr(H__7(146))):13:186));

       // HTML Segment (7) RcdManage Line:303*
       abatebox0();
       outweb_(%subst(%str(%addr(H__7(148))):39:178));

       // HTML Segment (7) RcdManage Line:308*
       chgratebox0();
       outweb_(%subst(%str(%addr(H__7(150))):57:224));

       // HTML Segment (7) RcdManage Line:315*
       chgamtbox0();
       outweb_(%subst(%str(%addr(H__7(153))):41:176));

       // HTML Segment (7) RcdManage Line:320*
       adddlrbox0();
       outweb_(%subst(%str(%addr(H__7(155))):57:177));

       // HTML Segment (7) RcdManage Line:325*
       editdlrbox0();
       outweb_(%subst(%str(%addr(H__7(157))):74:178));

       // HTML Segment (7) RcdManage Line:330*
       addpgmbox0();
       outweb_(%subst(%str(%addr(H__7(160))):12:179));

       // HTML Segment (7) RcdManage Line:335*
       editpgmbox0();
       outweb_(%subst(%str(%addr(H__7(162))):31:180));

       // HTML Segment (7) RcdManage Line:340*
       splitpmtbox0();
       outweb_(%subst(%str(%addr(H__7(164))):51:176));

       // HTML Segment (7) RcdManage Line:345*
       deletedocbox0();
       outweb_(%subst(%str(%addr(H__7(166))):67:178));

       // HTML Segment (7) RcdManage Line:350*
       deletenotebox0();
       outweb_(%subst(%str(%addr(H__7(169))):5:177));

       // HTML Segment (7) RcdManage Line:355*
       deletestipbox0();
       outweb_(%subst(%str(%addr(H__7(171))):22:191));

       // HTML Segment (7) RcdManage Line:360*
       ipaddrbox0();
       outweb_(%subst(%str(%addr(H__7(173))):53:172));

       // HTML Segment (7) RcdManage Line:364*
       transfixbox0();
       outweb_(%subst(%str(%addr(H__7(175))):65:165));

       // HTML Segment (7) RcdManage Line:368*
       titleamortbox0();
       outweb_(%subst(%str(%addr(H__7(177))):70:214));
       AfToPage_(%trim(%editc(DENIAL_FICO:'4')));
       outweb_(%subst(%str(%addr(H__7(180))):44:223));
       AfToPage_(%trim(%editc(DEVIANCE_FICO:'4')));
       outweb_(%subst(%str(%addr(H__7(183))):27:244));
       AfToPage_(%trim(%editc(APPROVAL_SCORE:'3')));
       outweb_(%subst(%str(%addr(H__7(186))):31:242));
       AfToPage_(%trim(%editc(APPROVAL_DRAT:'3')));
       outweb_(%subst(%str(%addr(H__7(189))):33:171));

       // HTML Segment (7) RcdManage Line:388*
       apprentbox0();
       outweb_(%subst(%str(%addr(H__7(191))):44:223));
       AfToPage_(%trim(%editc(APPROVAL_GROSS:'3')));
       outweb_(%subst(%str(%addr(H__7(194))):27:245));
       AfToPage_(%trim(%editc(APPROVAL_TIFTR:'3')));
       outweb_(%subst(%str(%addr(H__7(197))):32:239));
       AfToPage_(%trim(%editc(APPROVAL_RAMT:'3')));
       outweb_(%subst(%str(%addr(H__7(200))):31:241));
       AfToPage_(%trim(%editc(APPROVAL_RAVL:'3')));
       outweb_(%subst(%str(%addr(H__7(203))):32:240));
       AfToPage_(%trim(%editc(APPROVAL_T30:'3')));
       outweb_(%subst(%str(%addr(H__7(206))):32:240));
       AfToPage_(%trim(%editc(APPROVAL_T60:'3')));
       outweb_(%subst(%str(%addr(H__7(209))):32:240));
       AfToPage_(%trim(%editc(APPROVAL_T90:'3')));
       outweb_(%subst(%str(%addr(H__7(212))):32:244));
       AfToPage_(%trim(%editc(APPROVAL_BKMO:'3')));
       outweb_(%subst(%str(%addr(H__7(215))):36:165));

       // HTML Segment (7) RcdManage Line:423*
       lnexpovrbox0();
       outweb_(%subst(%str(%addr(H__7(217))):41:172));

       // HTML Segment (7) RcdManage Line:427*
       cnclappbox0();
       outweb_(%subst(%str(%addr(H__7(219))):53:162));

       // HTML Segment (7) RcdManage Line:431*
       lnopnovrbox0();
       outweb_(%subst(%str(%addr(H__7(221))):55:165));

       // HTML Segment (7) RcdManage Line:435*
       lnfundovrbox0();
       outweb_(%subst(%str(%addr(H__7(223))):60:162));

       // HTML Segment (7) RcdManage Line:439*
       edtscraflgbox0();
       outweb_(%subst(%str(%addr(H__7(225))):62:493));

       // HTML Segment (7) RcdManage Line:452*
       view_letters_bx0();
       outweb_(%subst(%str(%addr(H__7(231))):75:200));

       // HTML Segment (7) RcdManage Line:456*
       view_callrec_bx0();
       outweb_(%subst(%str(%addr(H__7(234))):35:203));

       // HTML Segment (7) RcdManage Line:460*
       edtfld_codes_bx0();
       outweb_(%subst(%str(%addr(H__7(236))):78:208));

       // HTML Segment (7) RcdManage Line:464*
       edtfld_cnta_bx0();
       outweb_(%subst(%str(%addr(H__7(239))):46:208));

       // HTML Segment (7) RcdManage Line:468*
       edtfld_cntb_bx0();
       outweb_(%subst(%str(%addr(H__7(242))):14:201));

       // HTML Segment (7) RcdManage Line:472*
       edtfld_acctc_bx0();
       outweb_(%subst(%str(%addr(H__7(244))):55:195));

       // HTML Segment (7) RcdManage Line:476*
       edtfld_lncds_bx0();
       outweb_(%subst(%str(%addr(H__7(247))):10:199));

       // HTML Segment (7) RcdManage Line:480*
       edtfld_paycrd_bx0();
       outweb_(%subst(%str(%addr(H__7(249))):49:188));

       // HTML Segment (7) RcdManage Line:484*
       edtfld_usrpin_bx0();
       outweb_(%subst(%str(%addr(H__7(251))):77:186));

       // HTML Segment (7) RcdManage Line:488*
       timebox0();
       outweb_(%subst(%str(%addr(H__7(254))):23:209));

       // HTML Segment (7) RcdManage Line:492*
       edtfld_edtintfld_bx0();
       outweb_(%subst(%str(%addr(H__7(256))):72:220));
       AfToPage_(%trim(%editc(RRN:'X')));
       outweb_(%subst(%str(%addr(H__7(259))):52:393));

       // PML Line:568*
      /end-free
     c     *PSSR         begsr
     c                   endsr
     P                 E


       // PML Line:571*

     P*---------------------------------------------------------------------
     P* endmanage0...               - User defined function
     P*---------------------------------------------------------------------
     P endmanage0...
     P                 B
     D endmanage0...
     D                 PI




      /free

       // PML Line:575*
       mode = getparm3_('mode':'*OPT');
       //Get Logged User RoleId
       //AECP-3116  Start
        wloggedRid = *Zeros;
        Exec Sql
        select RL_roleid into :wloggedRid
        from kwlrole WHERE RL_ROLEID =
        (select puvalue from kwpuopt where puid = :userid
         and puotype = 'USERROLE');
       //AECP-3116  End

       // PML Line:578*
       savedrrn = getparm3_('FirstRowRRN':'*OPT');

       // PML Line:580*
       if (mode = 'Add');


        // PML Line:584*
YK01    @Roleid = *zeros;
YK01    //usrrole = getparm3_('ROLES' : '*OPT');
YK01    @Roleid = %dec(aton_( getparm3_('ROLES':'*OPT'):46:16):11:2);

YK01    //Start YK01- AECP-2557
        exec sql
        //select * into :KWLROLEDS from KWLROLE where TITLE = :usrrole ;
        select * into :KWLROLEDS from KWLROLE where RL_ROLEID = :@Roleid ;
YK01    //End-YK01    AECP-2557


YK01    //rtoret = getparm3_('rtoret':'*OPT');
YK01    rtoret = DRTORET;
        puid = getparm3_('puid':'*OPT');
YK01    //puprofile = getparm3_('puprofile':'*OPT');
YK01    puprofile = DPROFILE;
        puname = getparm3_('puname':'*OPT');
        putitle = getparm3_('putitle':'*OPT');
        puemail = getparm3_('puemail':'*OPT');
        puinit = getparm3_('puinit':'*OPT');
        pulngrp = getparm3_('pulngrp':'*OPT');
        pulnprod = getparm3_('pulnprod':'*OPT');
        PUCBAL = %dec(aton_( getparm3_('PUCBAL':'*OPT'):46:16):11:2);
        PUCLIM1 = %dec(aton_( getparm3_('PUCLIM1':'*OPT'):46:16):11:2);
        PUCLIM2 = %dec(aton_( getparm3_('PUCLIM2':'*OPT'):46:16):11:2);
        UNSECLIMIT = %dec(aton_( getparm3_('UNSECLIMIT':'*OPT'):46:16):11:2);
        GOODSLIMIT = %dec(aton_( getparm3_('GOODSLIMIT':'*OPT'):46:16):11:2);
        AUTOLIMIT = %dec(aton_( getparm3_('AUTOLIMIT':'*OPT'):46:16):11:2);
YK01    //optabate = getparm3_('optabate':'*OPT');
YK01    optabate = DABATEAUTH;
YK01    //opttransfix = getparm3_('opttransfix':'*OPT');
YK01    opttransfix = DTRANSFIX;
YK01    //optapprove = getparm3_('optapprove':'*OPT');
YK01    optapprove = DAPPROVE;
YK01    //optvoid = getparm3_('optvoid':'*OPT');
YK01    optvoid = DVOID;
YK01    //optrem = getparm3_('optrem':'*OPT');
YK01    optrem = DREM;
YK01    //optasscon = getparm3_('optasscon':'*OPT');
YK01    optasscon = DASSCON;
        sup = getparm3_('sup':'*OPT');
YK01    //optmodify = getparm3_('optmodify':'*OPT');
YK01    optmodify = DMODIFY;
YK01    //optcpmt = getparm3_('optcpmt':'*OPT');
YK01    optcpmt = DCARDPMT;
YK01    //optbankr = getparm3_('optbankr':'*OPT');
YK01    optbankr = DBANKRUPTCY;
YK01    //optcoff = getparm3_('optcoff':'*OPT');
YK01    optcoff = DCHARGEOFF;
YK01    //optrepo = getparm3_('optrepo':'*OPT');
YK01    optrepo = DREPO;
YK01    optjudge = getparm3_('optjudge':'*OPT');
YK01    optjudge = DJUDGEMENT;
YK01    //optdeny = getparm3_('optdeny':'*OPT');
YK01    optdeny = DDENY;
YK01    //optcoll = getparm3_('optcoll':'*OPT');
YK01    optcoll = DCOLL;
YK01    //optascoll = getparm3_('optascoll':'*OPT');
YK01    optascoll = DASSIGNCOLL;
YK01    //optadmcoll = getparm3_('optadmcoll':'*OPT');
YK01    optadmcoll = DADMCOLL;
        APPROVAL_BKMO = %dec(aton_( getparm3_('APPROVAL_BKMO':'*OPT'):46:16):
       11:2);
        APPROVAL_DRAT = %dec(aton_( getparm3_('APPROVAL_DRAT':'*OPT'):46:16):
       11:2);
        APPROVAL_GROSS = %dec(aton_( getparm3_('APPROVAL_GROSS':'*OPT'):46:
       16):11:2);
        APPROVAL_RAMT = %dec(aton_( getparm3_('APPROVAL_RAMT':'*OPT'):46:16):
       11:2);
        APPROVAL_RAVL = %dec(aton_( getparm3_('APPROVAL_RAVL':'*OPT'):46:16):
       11:2);
 YK01   //specres = getparm3_('specres':'*OPT');
 YK01   specres = DSPECRES;
 YK01   //spechandl = getparm3_('spechandl':'*OPT');
 YK01   spechandl = DSPECHANDL;
 YK01   transor = getparm3_('transor':'*OPT');
 YK01   transor = DTRANSOR;
        APPROVAL_SCORE = %dec(aton_( getparm3_('APPROVAL_SCORE':'*OPT'):46:
       16):11:2);
        APPROVAL_T30 = %dec(aton_( getparm3_('APPROVAL_T30':'*OPT'):46:16):
       11:2);
        APPROVAL_T60 = %dec(aton_( getparm3_('APPROVAL_T60':'*OPT'):46:16):
       11:2);
        APPROVAL_T90 = %dec(aton_( getparm3_('APPROVAL_T90':'*OPT'):46:16):
       11:2);
        APPROVAL_TIFTR = %dec(aton_( getparm3_('APPROVAL_TIFTR':'*OPT'):46:
       16):11:2);
YK01    //approval_r = getparm3_('approval_r':'*OPT');
YK01    approval_r = DAPRVLRENT;
YK01    //postpmt = getparm3_('postpmt':'*OPT');
YK01    postpmt = DPOSTPMT;
YK01    //revpmt = getparm3_('revpmt':'*OPT');
YK01    revpmt = DREVPMT;
YK01    //waivefee = getparm3_('waivefee':'*OPT');
YK01    waivefee = DWAIVEFEE;
YK01    //chgdue = getparm3_('chgdue':'*OPT');
YK01    chgdue = DCHGDUE;
YK01    //chgrate = getparm3_('chgrate':'*OPT');
YK01    chgrate = DCHGRATE;
YK01    //chgamt = getparm3_('chgamt':'*OPT');
YK01    chgamt = DCHGAMT;
        DEPARTMENT = %dec(aton_( getparm3_('DEPARTMENT':'*OPT'):46:16):11:2);
YK01    //DEPARTMENT = DDEPARTMENT;
YK01    //adddlr = getparm3_('adddlr':'*OPT');
YK01    adddlr = DADDDLR;
YK01    //editdlr = getparm3_('editdlr':'*OPT');
YK01    editdlr = DEDITDLR;
YK01    //edtfcodes = getparm3_('edtfcodes':'*OPT');
YK01    edtfcodes = DEDTFCODES;
YK01    //edtfcnta = getparm3_('edtfcnta':'*OPT');
YK01    edtfcnta = DEDTFCNTA;
YK01    //edtfcntb = getparm3_('edtfcntb':'*OPT');
YK01    edtfcntb = DEDTFCNTB;
YK01    //edtfacctc = getparm3_('edtfacctc':'*OPT');
YK01    edtfacctc = DEDTFACCTC;
YK01    //edtflncds = getparm3_('edtflncds':'*OPT');
YK01    edtflncds = DEDTFLNCDS;
YK01    //edtfpaycrd = getparm3_('edtfpaycrd':'*OPT');
YK01    edtfpaycrd = DEDTFPAYCRD;
YK01    addpgm = getparm3_('addpgm':'*OPT');
YK01    addpgm = DADDPGM;
YK01    //editpgm = getparm3_('editpgm':'*OPT');
YK01    editpgm = DEDITPGM;
YK01    //splitpmt = getparm3_('splitpmt':'*OPT');
YK01    splitpmt = DSPLITPMT;
        putwiovusr = getparm3_('putwiovusr':'*OPT');
        putwiovpwd = getparm3_('putwiovpwd':'*OPT');
 YK01   //deletedoc = getparm3_('deletedoc':'*OPT');
 YK01   deletedoc = DDELETEDOC;
 YK01   //deletenote = getparm3_('deletenote':'*OPT');
 YK01   deletenote = DDELETENOTE;
 YK01   //deletestip = getparm3_('deletestip':'*OPT');
 YK01   deletestip = DDELETESTIP;
 YK01   //chkipaddr = getparm3_('chkipaddr':'*OPT');
 YK01   chkipaddr = DCHKIPADDR;
 YK01   //titleamort = getparm3_('titleamort':'*OPT');
 YK01   titleamort = DTITLEAMORT;
        denial_fico = %dec(aton_( getparm3_('denial_fico':'*OPT'):46:16):3:0);
        deviance_fico = %dec(aton_( getparm3_('deviance_fico':'*OPT'):46:16):
       3:0);
 YK01   //overver = getparm3_('overver':'*OPT');
 YK01   overver = DOVERVER;
 YK01   //lnexpovr = getparm3_('lnexpovr':'*OPT');
 YK01   lnexpovr = DLNEXPOVR;
 YK01   //cnclapp = getparm3_('cnclapp':'*OPT');
 YK01   cnclapp = DCNCLAPP;
 YK01   //lnopnovr = getparm3_('lnopnovr':'*OPT');
 YK01   lnopnovr = DLNOPNOVR;
 YK01   //lnfundovr = getparm3_('lnfundovr':'*OPT');
 YK01   lnfundovr = DLNFUNDOVR;
 YK01   //edtscraflg = getparm3_('edtscraflg':'*OPT');
 YK01   edtscraflg = DEDTSCRAFLG;
 YK01   //viewlett = getparm3_('viewlett':'*OPT');
 YK01   viewlett = DVIEWLETT;
 YK01   //viewcall = getparm3_('viewcall':'*OPT');
 YK01   viewcall = DVIEWCALL;
 YK01   //usrpin = getparm3_('usrpin':'*OPT');
 YK01   usrpin = DUSRPIN;
        timecode = getparm3_('timecode':'*OPT');
 YK01   //edtintfld = getparm3_('edtintfld':'*OPT');
 YK01   edtintfld = DEDTINTFLD;

        // PML Line:591*
        WRITE RKWPUBASE;
        RS001_ = RcdSts2_('WRTRCD': %error: %found: %eof);

        // PML Line:593*
        p_ztype = 'KWPUBASE';

        // PML Line:594*
        p_zkeya = puid;

        // PML Line:595*
        p_zdesc = puname;

        // PML Line:596*
        WRITE RKWPDATA;
        RS008_ = RcdSts2_('WRTRCD': %error: %found: %eof);

        // PML Line:598*
        WRITE RKWPUTWILI;
        RS009_ = RcdSts2_('WRTRCD': %error: %found: %eof);
       endif;

       // PML Line:602*
       if (mode = 'Change');

        // PML Line:605*
        rrn = %dec(aton_( getparm3_('rrn':'*MAND'):46:16):9:0);

        // PML Line:608*
        RR_001_ = rrn;

        // PML Line:609*
        AM001_ = CV_BYRRN;
        CHAIN(E) RR_001_ R__ARR001;
        RS001_ = RcdSts2_('GETRCD': %error: %found: %eof);

YK01    @Roleid = *zeros;
YK01    @Roleid = %dec(aton_( getparm3_('ROLES':'*OPT'):46:16):11:2);
YK01    //usrrole = getparm3_('ROLES' : '*OPT');
YK01    //Start YK01- AECP-2557
        exec sql
        //select * into :KWLROLEDS from KWLROLE where TITLE = :usrrole ;
        select * into :KWLROLEDS from KWLROLE where RL_ROLEID = :@Roleid ;
YK01    //End-YK01    AECP-2557
        // PML Line:612*
 YK01   //rtoret = getparm3_('rtoret':'*OPT');
 YK01   rtoret = DRTORET;
 YK01   //puprofile = getparm3_('puprofile':'*OPT');
 YK01   puprofile = DPROFILE;
        puname = getparm3_('puname':'*OPT');
        putitle = getparm3_('putitle':'*OPT');
        puemail = getparm3_('puemail':'*OPT');
        pulngrp = getparm3_('pulngrp':'*OPT');
        puinit = getparm3_('puinit':'*OPT');
        pulnprod = getparm3_('pulnprod':'*OPT');
        PUCBAL = %dec(aton_( getparm3_('PUCBAL':'*OPT'):46:16):11:2);
        PUCLIM1 = %dec(aton_( getparm3_('PUCLIM1':'*OPT'):46:16):11:2);
        PUCLIM2 = %dec(aton_( getparm3_('PUCLIM2':'*OPT'):46:16):11:2);
        UNSECLIMIT = %dec(aton_( getparm3_('UNSECLIMIT':'*OPT'):46:16):11:2);
        GOODSLIMIT = %dec(aton_( getparm3_('GOODSLIMIT':'*OPT'):46:16):11:2);
        AUTOLIMIT = %dec(aton_( getparm3_('AUTOLIMIT':'*OPT'):46:16):11:2);
 YK01   //opttransfix = getparm3_('opttransfix':'*OPT');
 YK01   opttransfix = DTRANSFIX;
 YK01   //optabate = getparm3_('optabate':'*OPT');
 YK01   optabate = DABATEAUTH;
 YK01   //optapprove = getparm3_('optapprove':'*OPT');
 YK01   optapprove = DAPPROVE;
 YK01   //optvoid = getparm3_('optvoid':'*OPT');
 YK01   optvoid = DVOID;
 YK01   //optrem = getparm3_('optrem':'*OPT');
 YK01   optrem = DREM;
 YK01   //optasscon = getparm3_('optasscon':'*OPT');
 YK01   optasscon = DASSCON;
        sup = getparm3_('sup':'*OPT');
 YK01   //optmodify = getparm3_('optmodify':'*OPT');
 YK01   optmodify = DMODIFY;
 YK01   //optcpmt = getparm3_('optcpmt':'*OPT');
 YK01   optcpmt = DCARDPMT;
 YK01   //optbankr = getparm3_('optbankr':'*OPT');
 YK01   optbankr = DBANKRUPTCY;
 YK01   //optcoff = getparm3_('optcoff':'*OPT');
 YK01   optcoff = DCHARGEOFF;
 YK01   //optrepo = getparm3_('optrepo':'*OPT');
 YK01   optrepo = DREPO;
 YK01   //optjudge = getparm3_('optjudge':'*OPT');
 YK01   optjudge = DJUDGEMENT;
 YK01   //optdeny = getparm3_('optdeny':'*OPT');
 YK01   optdeny = DDENY;
 YK01   //optcoll = getparm3_('optcoll':'*OPT');
 YK01   optcoll = DCOLL;
 YK01   //optascoll = getparm3_('optascoll':'*OPT');
 YK01   optascoll = DASSIGNCOLL;
 YK01   //optadmcoll = getparm3_('optadmcoll':'*OPT');
 YK01   optadmcoll = DADMCOLL;
        APPROVAL_BKMO = %dec(aton_( getparm3_('APPROVAL_BKMO':'*OPT'):46:16):
       11:2);
        APPROVAL_DRAT = %dec(aton_( getparm3_('APPROVAL_DRAT':'*OPT'):46:16):
       11:2);
        APPROVAL_GROSS = %dec(aton_( getparm3_('APPROVAL_GROSS':'*OPT'):46:
       16):11:2);
        APPROVAL_RAMT = %dec(aton_( getparm3_('APPROVAL_RAMT':'*OPT'):46:16):
       11:2);
 YK01   //specres = getparm3_('specres':'*OPT');
 YK01   specres = DSPECRES;
 YK01   //spechandl = getparm3_('spechandl':'*OPT');
 YK01   spechandl = DSPECHANDL;
 YK01   //transor = getparm3_('transor':'*OPT');
 YK01   transor = DTRANSOR;
        APPROVAL_RAVL = %dec(aton_( getparm3_('APPROVAL_RAVL':'*OPT'):46:16):
       11:2);
        APPROVAL_SCORE = %dec(aton_( getparm3_('APPROVAL_SCORE':'*OPT'):46:
       16):11:2);
        APPROVAL_T30 = %dec(aton_( getparm3_('APPROVAL_T30':'*OPT'):46:16):
       11:2);
        APPROVAL_T60 = %dec(aton_( getparm3_('APPROVAL_T60':'*OPT'):46:16):
       11:2);
        APPROVAL_T90 = %dec(aton_( getparm3_('APPROVAL_T90':'*OPT'):46:16):
       11:2);
        APPROVAL_TIFTR = %dec(aton_( getparm3_('APPROVAL_TIFTR':'*OPT'):46:
       16):11:2);
 YK01   //approval_r = getparm3_('approval_r':'*OPT');
 YK01   approval_r = DAPRVLRENT;
 YK01   //postpmt = getparm3_('postpmt':'*OPT');
 YK01   postpmt = DPOSTPMT;
 YK01   //revpmt = getparm3_('revpmt':'*OPT');
 YK01   revpmt = DREVPMT;
 YK01   //waivefee = getparm3_('waivefee':'*OPT');
 YK01   waivefee = DWAIVEFEE;
 YK01   //chgdue = getparm3_('chgdue':'*OPT');
 YK01   chgdue = DCHGDUE;
 YK01  //chgrate = getparm3_('chgrate':'*OPT');
 YK01  chgrate = DCHGRATE;
 YK01   //chgamt = getparm3_('chgamt':'*OPT');
 YK01   chgamt = DCHGAMT;
        DEPARTMENT = %dec(aton_( getparm3_('DEPARTMENT':'*OPT'):46:16):11:2);
 YK01   //DEPARTMENT = DDEPARTMENT;
 YK01   //adddlr = getparm3_('adddlr':'*OPT');
 YK01   adddlr = DADDDLR;
 YK01   //editdlr = getparm3_('editdlr':'*OPT');
 YK01   editdlr = DEDITDLR;
 YK01   //edtfcodes = getparm3_('edtfcodes':'*OPT');
 YK01   edtfcodes = DEDTFCODES;
 YK01   //edtfcnta = getparm3_('edtfcnta':'*OPT');
 YK01   edtfcnta = DEDTFCNTA;
 YK01   //edtfcntb = getparm3_('edtfcntb':'*OPT');
 YK01   edtfcntb = DEDTFCNTB;
 YK01   //edtfacctc = getparm3_('edtfacctc':'*OPT');
 YK01   edtfacctc = DEDTFACCTC;
 YK01   //edtflncds = getparm3_('edtflncds':'*OPT');
 YK01   edtflncds = DEDTFLNCDS;
 YK01   //edtfpaycrd = getparm3_('edtfpaycrd':'*OPT');
 YK01   edtfpaycrd = DEDTFPAYCRD;
 YK01   //addpgm = getparm3_('addpgm':'*OPT');
 YK01   addpgm = DADDPGM;
 YK01   //editpgm = getparm3_('editpgm':'*OPT');
 YK01   editpgm = DEDITPGM;
 YK01   //splitpmt = getparm3_('splitpmt':'*OPT');
 YK01   splitpmt = DSPLITPMT;
 YK01   //deletedoc = getparm3_('deletedoc':'*OPT');
 YK01   deletedoc = DDELETEDOC;
 YK01   //deletenote = getparm3_('deletenote':'*OPT');
 YK01   deletenote = DDELETENOTE;
 YK01   //deletestip = getparm3_('deletestip':'*OPT');
 YK01   deletestip = DDELETESTIP;
 YK01   //chkipaddr = getparm3_('chkipaddr':'*OPT');
 YK01   chkipaddr = DCHKIPADDR;
 YK01   //titleamort = getparm3_('titleamort':'*OPT');
 YK01   titleamort = DTITLEAMORT;
        denial_fico = %dec(aton_( getparm3_('denial_fico':'*OPT'):46:16):3:0);
        deviance_fico = %dec(aton_( getparm3_('deviance_fico':'*OPT'):46:16):
       3:0);
 YK01   //overver = getparm3_('overver':'*OPT');
 YK01   overver = DOVERVER;
 YK01   //lnexpovr = getparm3_('lnexpovr':'*OPT');
 YK01   lnexpovr = DLNEXPOVR;
 YK01   cnclapp = getparm3_('cnclapp':'*OPT');
 YK01   cnclapp = DCNCLAPP;
 YK01   //lnopnovr = getparm3_('lnopnovr':'*OPT');
 YK01   lnopnovr = DLNOPNOVR;
 YK01   //lnfundovr = getparm3_('lnfundovr':'*OPT');
 YK01   lnfundovr = DLNFUNDOVR;
 YK01   //edtscraflg = getparm3_('edtscraflg':'*OPT');
 YK01   edtscraflg = DEDTSCRAFLG;
 YK01   //viewlett = getparm3_('viewlett':'*OPT');
 YK01   viewlett = DVIEWLETT;
 YK01   //viewcall = getparm3_('viewcall':'*OPT');
 YK01   viewcall = DVIEWCALL;
 YK01   //usrpin = getparm3_('usrpin':'*OPT');
 YK01   usrpin = DUSRPIN;
        timecode = getparm3_('timecode':'*OPT');
 YK01   //edtintfld = getparm3_('edtintfld':'*OPT');
 YK01   edtintfld = DEDTINTFLD;

        // PML Line:616*
        RS001_ = UpdateRcd_('RKWPUBASE');

        // PML Line:618*
        p_ztype = 'KWPUBASE';

        // PML Line:619*
        p_zkeya = puid;

        // PML Line:620*
        AM008_ = CV_BYKEY;
        CHAIN(E) DL008_ RKWPDATA;
        RS008_ = RcdSts2_('GETRCD': %error: %found: %eof);

        // PML Line:621*
        p_zdesc = puname;

        // PML Line:622*
        if (RS008_ = '1');

         // PML Line:623*
         RS008_ = UpdateRcd_('RKWPDATA');

         // PML Line:624*
        else;

         // PML Line:625*
         WRITE RKWPDATA;
         RS008_ = RcdSts2_('WRTRCD': %error: %found: %eof);
        endif;

        // PML Line:627*
        AM009_ = CV_BYKEY;
        CHAIN(E) DL009_ RKWPUTWILI;
        RS009_ = RcdSts2_('GETRCD': %error: %found: %eof);

        // PML Line:628*
        putwiovusr = getparm3_('putwiovusr':'*OPT');
        putwiovpwd = getparm3_('putwiovpwd':'*OPT');

        // PML Line:629*
        if (RS009_ = '1');

         // PML Line:630*
         RS009_ = UpdateRcd_('RKWPUTWILI');

         // PML Line:631*
        else;

         // PML Line:632*
         WRITE RKWPUTWILI;
         RS009_ = RcdSts2_('WRTRCD': %error: %found: %eof);
        endif;

        // PML Line:635*
        RS001_ = UpdateRcd_('RKWPUBASE');
       endif;

       //AFF-20824  -- EN01 Start
       puotype = 'BNKRUPTC2';
       AM006_ = CV_BYKEY;
       CHAIN(E) DL006_ RKWPUOPT;
       RS006_ = RcdSts2_('GETRCD': %error: %found: %eof);
       wprevyesno = puoyesno;

       puoyesno = %subst(DBNKRUPTC2:1:1);
       if (RS006_ = '1');
         RS006_ = UpdateRcd_('RKWPUOPT');
         Exec Sql
           insert into klsyschg(KL_USERID,KL_ROLEID,KL_FIELDCHG,KL_VALBCHG,
           KL_VALACHG,CREATE_USER_NAME)
           values(:userid, :wloggedRid, :puotype, :wprevyesno, :puoyesno,:puid);
       else;
         WRITE RKWPUOPT;
         RS006_ = RcdSts2_('WRTRCD': %error: %found: %eof);
         Exec Sql
           insert into klsyschg(KL_USERID,KL_ROLEID,KL_FIELDCHG,KL_VALBCHG,
           KL_VALACHG, CREATE_USER_NAME)
           values(:userid, :wloggedRid, :puotype, '' , :puoyesno,:puid);
       endif;


       puotype = 'CANCOMPLON';
       AM006_ = CV_BYKEY;
       CHAIN(E) DL006_ RKWPUOPT;
       RS006_ = RcdSts2_('GETRCD': %error: %found: %eof);
       wprevyesno = puoyesno;
       puoyesno = %subst(DCANCOMPLON:1:1);
       if (RS006_ = '1');
         RS006_ = UpdateRcd_('RKWPUOPT');
         Exec Sql
           insert into klsyschg(KL_USERID,KL_ROLEID,KL_FIELDCHG,KL_VALBCHG,
           KL_VALACHG,CREATE_USER_NAME)
           values(:userid, :wloggedRid, :puotype, :wprevyesno, :puoyesno,:puid);
       else;
         WRITE RKWPUOPT;
         RS006_ = RcdSts2_('WRTRCD': %error: %found: %eof);
         Exec Sql
           insert into klsyschg(KL_USERID,KL_ROLEID,KL_FIELDCHG,KL_VALBCHG,
           KL_VALACHG, CREATE_USER_NAME)
           values(:userid, :wloggedRid, :puotype, '' , :puoyesno,:puid);
       endif;
       puotype = 'CANLOANTRM';
       AM006_ = CV_BYKEY;
       CHAIN(E) DL006_ RKWPUOPT;
       RS006_ = RcdSts2_('GETRCD': %error: %found: %eof);
       wprevyesno = puoyesno;

       puoyesno = %subst(DCANLOANTRM:1:1);
       if (RS006_ = '1');
         RS006_ = UpdateRcd_('RKWPUOPT');
         Exec Sql
           insert into klsyschg(KL_USERID,KL_ROLEID,KL_FIELDCHG,KL_VALBCHG,
           KL_VALACHG,CREATE_USER_NAME)
           values(:userid, :wloggedRid, :puotype, :wprevyesno, :puoyesno,:puid);
       else;
         WRITE RKWPUOPT;
         RS006_ = RcdSts2_('WRTRCD': %error: %found: %eof);
         Exec Sql
           insert into klsyschg(KL_USERID,KL_ROLEID,KL_FIELDCHG,KL_VALBCHG,
           KL_VALACHG, CREATE_USER_NAME)
           values(:userid, :wloggedRid, :puotype, '' , :puoyesno,:puid);
       endif;

       puotype = 'EDTFQUE';
       AM006_ = CV_BYKEY;
       CHAIN(E) DL006_ RKWPUOPT;
       RS006_ = RcdSts2_('GETRCD': %error: %found: %eof);
       wprevyesno = puoyesno;

       puoyesno = %subst(DEDTFQUE:1:1);
       if (RS006_ = '1');
         RS006_ = UpdateRcd_('RKWPUOPT');
         Exec Sql
           insert into klsyschg(KL_USERID,KL_ROLEID,KL_FIELDCHG,KL_VALBCHG,
           KL_VALACHG,CREATE_USER_NAME)
           values(:userid, :wloggedRid, :puotype, :wprevyesno, :puoyesno,:puid);
       else;
         WRITE RKWPUOPT;
         RS006_ = RcdSts2_('WRTRCD': %error: %found: %eof);
         Exec Sql
           insert into klsyschg(KL_USERID,KL_ROLEID,KL_FIELDCHG,KL_VALBCHG,
           KL_VALACHG, CREATE_USER_NAME)
           values(:userid, :wloggedRid, :puotype, '' , :puoyesno,:puid);
       endif;
       //AFF-20824  -- EN01 End

       //AECP-3335  -- YK05 Start

       // ARBTOPTFLG add

       // PML Line:639*

       puotype = 'ARBTOPTFLG';

       // PML Line:640*
       AM006_ = CV_BYKEY;
       CHAIN(E) DL006_ RKWPUOPT;
       RS006_ = RcdSts2_('GETRCD': %error: %found: %eof);

       wprevyesno = puoyesno;
       // PML Line:641*
       puoyesno = %subst(DARBTOPTFLG:1:1);

       // PML Line:642*
       if (RS006_ = '1');

        // PML Line:643*
        RS006_ = UpdateRcd_('RKWPUOPT');
        Exec Sql
          insert into klsyschg(KL_USERID,KL_ROLEID,KL_FIELDCHG,KL_VALBCHG,
                      KL_VALACHG,CREATE_USER_NAME)
          values(:userid, :wloggedRid, :puotype, :wprevyesno, :puoyesno,:puid);

        // PML Line:644*
       else;

        // PML Line:645*
        WRITE RKWPUOPT;
        RS006_ = RcdSts2_('WRTRCD': %error: %found: %eof);

        Exec Sql
          insert into klsyschg(KL_USERID,KL_ROLEID,KL_FIELDCHG,KL_VALBCHG,
                      KL_VALACHG, CREATE_USER_NAME)
        values(:userid, :wloggedRid, :puotype, '' , :puoyesno,:puid);

       endif;


       // LEGREPFLG  add

       // PML Line:639*

       puotype = 'LEGREPFLG';

       // PML Line:640*
       AM006_ = CV_BYKEY;
       CHAIN(E) DL006_ RKWPUOPT;
       RS006_ = RcdSts2_('GETRCD': %error: %found: %eof);

       wprevyesno = puoyesno;
       // PML Line:641*
       puoyesno = %subst(DLEGREPFLG:1:1);

       // PML Line:642*
       if (RS006_ = '1');

        // PML Line:643*
        RS006_ = UpdateRcd_('RKWPUOPT');
        Exec Sql
          insert into klsyschg(KL_USERID,KL_ROLEID,KL_FIELDCHG,KL_VALBCHG,
                      KL_VALACHG,CREATE_USER_NAME)
          values(:userid, :wloggedRid, :puotype, :wprevyesno, :puoyesno,:puid);
       // EndIf;

        // PML Line:644*
       else;

        // PML Line:645*
        WRITE RKWPUOPT;
        RS006_ = RcdSts2_('WRTRCD': %error: %found: %eof);

        Exec Sql
          insert into klsyschg(KL_USERID,KL_ROLEID,KL_FIELDCHG,KL_VALBCHG,
                      KL_VALACHG, CREATE_USER_NAME)
        values(:userid, :wloggedRid, :puotype, '' , :puoyesno,:puid);

       endif;



       // 'CEASDESFLG' add

       // PML Line:639*

       puotype = 'CEASDESFLG';

       // PML Line:640*
       AM006_ = CV_BYKEY;
       CHAIN(E) DL006_ RKWPUOPT;
       RS006_ = RcdSts2_('GETRCD': %error: %found: %eof);

       wprevyesno = puoyesno;
       // PML Line:641*
       puoyesno = %subst(DCEASDESFLG:1:1);

       // PML Line:642*
       if (RS006_ = '1');

        // PML Line:643*
        RS006_ = UpdateRcd_('RKWPUOPT');
        Exec Sql
          insert into klsyschg(KL_USERID,KL_ROLEID,KL_FIELDCHG,KL_VALBCHG,
                      KL_VALACHG,CREATE_USER_NAME)
          values(:userid, :wloggedRid, :puotype, :wprevyesno, :puoyesno,:puid);

        // PML Line:644*
       else;

        // PML Line:645*
        WRITE RKWPUOPT;
        RS006_ = RcdSts2_('WRTRCD': %error: %found: %eof);

        Exec Sql
          insert into klsyschg(KL_USERID,KL_ROLEID,KL_FIELDCHG,KL_VALBCHG,
                      KL_VALACHG, CREATE_USER_NAME)
        values(:userid, :wloggedRid, :puotype, '' , :puoyesno,:puid);

       endif;

       // 'NOSOLISFLG' add

       // PML Line:639*

       puotype = 'NOSOLISFLG';

       // PML Line:640*
       AM006_ = CV_BYKEY;
       CHAIN(E) DL006_ RKWPUOPT;
       RS006_ = RcdSts2_('GETRCD': %error: %found: %eof);

       wprevyesno = puoyesno;
       // PML Line:641*
       puoyesno = %subst(DNOSOLISFLG:1:1);

       // PML Line:642*
       if (RS006_ = '1');

        // PML Line:643*
        RS006_ = UpdateRcd_('RKWPUOPT');
        Exec Sql
          insert into klsyschg(KL_USERID,KL_ROLEID,KL_FIELDCHG,KL_VALBCHG,
                      KL_VALACHG,CREATE_USER_NAME)
          values(:userid, :wloggedRid, :puotype, :wprevyesno, :puoyesno,:puid);

        // PML Line:644*
       else;

        // PML Line:645*
        WRITE RKWPUOPT;
        RS006_ = RcdSts2_('WRTRCD': %error: %found: %eof);

        Exec Sql
          insert into klsyschg(KL_USERID,KL_ROLEID,KL_FIELDCHG,KL_VALBCHG,
                      KL_VALACHG, CREATE_USER_NAME)
        values(:userid, :wloggedRid, :puotype, '' , :puoyesno,:puid);

       endif;

       // 'SUBCOMPFLG' add

       // PML Line:639*

       puotype = 'SUBCOMPFLG';

       // PML Line:640*
       AM006_ = CV_BYKEY;
       CHAIN(E) DL006_ RKWPUOPT;
       RS006_ = RcdSts2_('GETRCD': %error: %found: %eof);

       wprevyesno = puoyesno;
       // PML Line:641*
       puoyesno = %subst(DSUBCOMPFLG:1:1);

       // PML Line:642*
       if (RS006_ = '1');

        // PML Line:643*
        RS006_ = UpdateRcd_('RKWPUOPT');
        Exec Sql
          insert into klsyschg(KL_USERID,KL_ROLEID,KL_FIELDCHG,KL_VALBCHG,
                      KL_VALACHG,CREATE_USER_NAME)
          values(:userid, :wloggedRid, :puotype, :wprevyesno, :puoyesno,:puid);

        // PML Line:644*
       else;

        // PML Line:645*
        WRITE RKWPUOPT;
        RS006_ = RcdSts2_('WRTRCD': %error: %found: %eof);

        Exec Sql
          insert into klsyschg(KL_USERID,KL_ROLEID,KL_FIELDCHG,KL_VALBCHG,
                      KL_VALACHG, CREATE_USER_NAME)
        values(:userid, :wloggedRid, :puotype, '' , :puoyesno,:puid);

       endif;


       // 'COMPLICFLG' add

       // PML Line:639*

       puotype = 'COMPLICFLG';

       // PML Line:640*
       AM006_ = CV_BYKEY;
       CHAIN(E) DL006_ RKWPUOPT;
       RS006_ = RcdSts2_('GETRCD': %error: %found: %eof);

       wprevyesno = puoyesno;
       // PML Line:641*
       puoyesno = %subst(DCOMPLICFLG:1:1);

       // PML Line:642*
       if (RS006_ = '1');

        // PML Line:643*
        RS006_ = UpdateRcd_('RKWPUOPT');
        Exec Sql
          insert into klsyschg(KL_USERID,KL_ROLEID,KL_FIELDCHG,KL_VALBCHG,
                      KL_VALACHG,CREATE_USER_NAME)
          values(:userid, :wloggedRid, :puotype, :wprevyesno, :puoyesno,:puid);

        // PML Line:644*
       else;

        // PML Line:645*
        WRITE RKWPUOPT;
        RS006_ = RcdSts2_('WRTRCD': %error: %found: %eof);

        Exec Sql
          insert into klsyschg(KL_USERID,KL_ROLEID,KL_FIELDCHG,KL_VALBCHG,
                      KL_VALACHG, CREATE_USER_NAME)
        values(:userid, :wloggedRid, :puotype, '' , :puoyesno,:puid);

       endif;


       // 'CHGPMTDAT'  add

       // PML Line:639*

       puotype = 'CHGPMTDAT' ;

       // PML Line:640*
       AM006_ = CV_BYKEY;
       CHAIN(E) DL006_ RKWPUOPT;
       RS006_ = RcdSts2_('GETRCD': %error: %found: %eof);

       wprevyesno = puoyesno;
       // PML Line:641*
       puoyesno = %subst(DCHGPMTDAT:1:1);

       // PML Line:642*
       if (RS006_ = '1');

        // PML Line:643*
        RS006_ = UpdateRcd_('RKWPUOPT');
        Exec Sql
          insert into klsyschg(KL_USERID,KL_ROLEID,KL_FIELDCHG,KL_VALBCHG,
                      KL_VALACHG,CREATE_USER_NAME)
          values(:userid, :wloggedRid, :puotype, :wprevyesno, :puoyesno,:puid);

        // PML Line:644*
       else;

        // PML Line:645*
        WRITE RKWPUOPT;
        RS006_ = RcdSts2_('WRTRCD': %error: %found: %eof);

        Exec Sql
          insert into klsyschg(KL_USERID,KL_ROLEID,KL_FIELDCHG,KL_VALBCHG,
                      KL_VALACHG, CREATE_USER_NAME)
        values(:userid, :wloggedRid, :puotype, '' , :puoyesno,:puid);

       endif;


       // 'LDWOPTOUT'  add

       // PML Line:639*

       puotype = 'LDWOPTOUT' ;

       // PML Line:640*
       AM006_ = CV_BYKEY;
       CHAIN(E) DL006_ RKWPUOPT;
       RS006_ = RcdSts2_('GETRCD': %error: %found: %eof);

       wprevyesno = puoyesno;
       // PML Line:641*
       puoyesno = %subst(DLDWOPTOUT:1:1);

       // PML Line:642*
       if (RS006_ = '1');

        // PML Line:643*
        RS006_ = UpdateRcd_('RKWPUOPT');
        Exec Sql
          insert into klsyschg(KL_USERID,KL_ROLEID,KL_FIELDCHG,KL_VALBCHG,
                      KL_VALACHG,CREATE_USER_NAME)
          values(:userid, :wloggedRid, :puotype, :wprevyesno, :puoyesno,:puid);

        // PML Line:644*
       else;

        // PML Line:645*
        WRITE RKWPUOPT;
        RS006_ = RcdSts2_('WRTRCD': %error: %found: %eof);

        Exec Sql
          insert into klsyschg(KL_USERID,KL_ROLEID,KL_FIELDCHG,KL_VALBCHG,
                      KL_VALACHG, CREATE_USER_NAME)
        values(:userid, :wloggedRid, :puotype, '' , :puoyesno,:puid);

       endif;

       // 'SCRAFLG' add

       // PML Line:639*

       puotype = 'SCRAFLG' ;

       // PML Line:640*
       AM006_ = CV_BYKEY;
       CHAIN(E) DL006_ RKWPUOPT;
       RS006_ = RcdSts2_('GETRCD': %error: %found: %eof);

       wprevyesno = puoyesno;
       // PML Line:641*
       puoyesno = %subst(DSCRAFLG:1:1);

       // PML Line:642*
       if (RS006_ = '1');

        // PML Line:643*
        RS006_ = UpdateRcd_('RKWPUOPT');
        Exec Sql
          insert into klsyschg(KL_USERID,KL_ROLEID,KL_FIELDCHG,KL_VALBCHG,
                      KL_VALACHG,CREATE_USER_NAME)
          values(:userid, :wloggedRid, :puotype, :wprevyesno, :puoyesno,:puid);

        // PML Line:644*
       else;

        // PML Line:645*
        WRITE RKWPUOPT;
        RS006_ = RcdSts2_('WRTRCD': %error: %found: %eof);

        Exec Sql
          insert into klsyschg(KL_USERID,KL_ROLEID,KL_FIELDCHG,KL_VALBCHG,
                      KL_VALACHG, CREATE_USER_NAME)
        values(:userid, :wloggedRid, :puotype, '' , :puoyesno,:puid);

       endif;

       // 'MT2CRRPTC' -add

       // PML Line:639*

       puotype = 'MT2CRRPTC';

       // PML Line:640*
       AM006_ = CV_BYKEY;
       CHAIN(E) DL006_ RKWPUOPT;
       RS006_ = RcdSts2_('GETRCD': %error: %found: %eof);

       wprevyesno = puoyesno;
       // PML Line:641*
       puoyesno = %subst(DMT2CRRPTC:1:1);

       // PML Line:642*
       if (RS006_ = '1');

        // PML Line:643*
        RS006_ = UpdateRcd_('RKWPUOPT');
        Exec Sql
          insert into klsyschg(KL_USERID,KL_ROLEID,KL_FIELDCHG,KL_VALBCHG,
                      KL_VALACHG,CREATE_USER_NAME)
          values(:userid, :wloggedRid, :puotype, :wprevyesno, :puoyesno,:puid);

        // PML Line:644*
       else;

        // PML Line:645*
        WRITE RKWPUOPT;
        RS006_ = RcdSts2_('WRTRCD': %error: %found: %eof);

        Exec Sql
          insert into klsyschg(KL_USERID,KL_ROLEID,KL_FIELDCHG,KL_VALBCHG,
                      KL_VALACHG, CREATE_USER_NAME)
        values(:userid, :wloggedRid, :puotype, '' , :puoyesno,:puid);

       endif;

       // 'PRVCYREQST'-add

       // PML Line:639*

       puotype = 'PRVCYREQST';

       // PML Line:640*
       AM006_ = CV_BYKEY;
       CHAIN(E) DL006_ RKWPUOPT;
       RS006_ = RcdSts2_('GETRCD': %error: %found: %eof);

       wprevyesno = puoyesno;
       // PML Line:641*
       puoyesno = %subst(DPRVCYREQST:1:1);

       // PML Line:642*
       if (RS006_ = '1');

        // PML Line:643*
        RS006_ = UpdateRcd_('RKWPUOPT');
        Exec Sql
          insert into klsyschg(KL_USERID,KL_ROLEID,KL_FIELDCHG,KL_VALBCHG,
                      KL_VALACHG,CREATE_USER_NAME)
          values(:userid, :wloggedRid, :puotype, :wprevyesno, :puoyesno,:puid);

        // PML Line:644*
       else;

        // PML Line:645*
        WRITE RKWPUOPT;
        RS006_ = RcdSts2_('WRTRCD': %error: %found: %eof);

        Exec Sql
          insert into klsyschg(KL_USERID,KL_ROLEID,KL_FIELDCHG,KL_VALBCHG,
                      KL_VALACHG, CREATE_USER_NAME)
        values(:userid, :wloggedRid, :puotype, '' , :puoyesno,:puid);

       endif;



       // 'PMTAMTDTSC'-add

       // PML Line:639*

       puotype = 'PMTAMTDTSC';

       // PML Line:640*
       AM006_ = CV_BYKEY;
       CHAIN(E) DL006_ RKWPUOPT;
       RS006_ = RcdSts2_('GETRCD': %error: %found: %eof);

       wprevyesno = puoyesno;
       // PML Line:641*
       puoyesno = %subst(DPMTAMTDTSC:1:1);

       // PML Line:642*
       if (RS006_ = '1');

        // PML Line:643*
        RS006_ = UpdateRcd_('RKWPUOPT');
        Exec Sql
          insert into klsyschg(KL_USERID,KL_ROLEID,KL_FIELDCHG,KL_VALBCHG,
                      KL_VALACHG,CREATE_USER_NAME)
          values(:userid, :wloggedRid, :puotype, :wprevyesno, :puoyesno,:puid);

        // PML Line:644*
       else;

        // PML Line:645*
        WRITE RKWPUOPT;
        RS006_ = RcdSts2_('WRTRCD': %error: %found: %eof);

        Exec Sql
          insert into klsyschg(KL_USERID,KL_ROLEID,KL_FIELDCHG,KL_VALBCHG,
                      KL_VALACHG, CREATE_USER_NAME)
        values(:userid, :wloggedRid, :puotype, '' , :puoyesno,:puid);

       endif;


       // 'EPDEPOFLG'-add

       // PML Line:639*

       puotype = 'EPDEPOFLG';

       // PML Line:640*
       AM006_ = CV_BYKEY;
       CHAIN(E) DL006_ RKWPUOPT;
       RS006_ = RcdSts2_('GETRCD': %error: %found: %eof);

       wprevyesno = puoyesno;
       // PML Line:641*
       puoyesno = %subst(DEPDEPOFLG:1:1);

       // PML Line:642*
       if (RS006_ = '1');

        // PML Line:643*
        RS006_ = UpdateRcd_('RKWPUOPT');
        Exec Sql
          insert into klsyschg(KL_USERID,KL_ROLEID,KL_FIELDCHG,KL_VALBCHG,
                      KL_VALACHG,CREATE_USER_NAME)
          values(:userid, :wloggedRid, :puotype, :wprevyesno, :puoyesno,:puid);

        // PML Line:644*
       else;

        // PML Line:645*
        WRITE RKWPUOPT;
        RS006_ = RcdSts2_('WRTRCD': %error: %found: %eof);

        Exec Sql
          insert into klsyschg(KL_USERID,KL_ROLEID,KL_FIELDCHG,KL_VALBCHG,
                      KL_VALACHG, CREATE_USER_NAME)
        values(:userid, :wloggedRid, :puotype, '' , :puoyesno,:puid);

       endif;


       // 'BNKRUPTCY'-add

       // PML Line:639*

       puotype = 'BNKRUPTCY';

       // PML Line:640*
       AM006_ = CV_BYKEY;
       CHAIN(E) DL006_ RKWPUOPT;
       RS006_ = RcdSts2_('GETRCD': %error: %found: %eof);

       wprevyesno = puoyesno;
       // PML Line:641*
       puoyesno = %subst(DBNKRUPTCY:1:1);

       // PML Line:642*
       if (RS006_ = '1');

        // PML Line:643*
        RS006_ = UpdateRcd_('RKWPUOPT');
        Exec Sql
          insert into klsyschg(KL_USERID,KL_ROLEID,KL_FIELDCHG,KL_VALBCHG,
                      KL_VALACHG,CREATE_USER_NAME)
          values(:userid, :wloggedRid, :puotype, :wprevyesno, :puoyesno,:puid);

        // PML Line:644*
       else;

        // PML Line:645*
        WRITE RKWPUOPT;
        RS006_ = RcdSts2_('WRTRCD': %error: %found: %eof);

        Exec Sql
          insert into klsyschg(KL_USERID,KL_ROLEID,KL_FIELDCHG,KL_VALBCHG,
                      KL_VALACHG, CREATE_USER_NAME)
        values(:userid, :wloggedRid, :puotype, '' , :puoyesno,:puid);

       endif;


       // 'TAXEXPTADJ'-add

       // PML Line:639*

       puotype = 'TAXEXPTADJ';

       // PML Line:640*
       AM006_ = CV_BYKEY;
       CHAIN(E) DL006_ RKWPUOPT;
       RS006_ = RcdSts2_('GETRCD': %error: %found: %eof);

       wprevyesno = puoyesno;
       // PML Line:641*
       puoyesno = %subst(DTAXEXPTADJ:1:1);

       // PML Line:642*
       if (RS006_ = '1');

        // PML Line:643*
        RS006_ = UpdateRcd_('RKWPUOPT');
        Exec Sql
          insert into klsyschg(KL_USERID,KL_ROLEID,KL_FIELDCHG,KL_VALBCHG,
                      KL_VALACHG,CREATE_USER_NAME)
          values(:userid, :wloggedRid, :puotype, :wprevyesno, :puoyesno,:puid);

        // PML Line:644*
       else;

        // PML Line:645*
        WRITE RKWPUOPT;
        RS006_ = RcdSts2_('WRTRCD': %error: %found: %eof);

        Exec Sql
          insert into klsyschg(KL_USERID,KL_ROLEID,KL_FIELDCHG,KL_VALBCHG,
                      KL_VALACHG, CREATE_USER_NAME)
        values(:userid, :wloggedRid, :puotype, '' , :puoyesno,:puid);

       endif;

       //AECP-3335 --YK05 End

       // PML Line:639*
       puotype = 'EDTFCODES';

       // PML Line:640*
       AM006_ = CV_BYKEY;
       CHAIN(E) DL006_ RKWPUOPT;
       RS006_ = RcdSts2_('GETRCD': %error: %found: %eof);

       wprevyesno = puoyesno;
       // PML Line:641*
       puoyesno = edtfcodes;

       // PML Line:642*
       if (RS006_ = '1');

        // PML Line:643*
        RS006_ = UpdateRcd_('RKWPUOPT');
      //AECP-3116   Start
        //If ( puoyesno <> wprevyesno);
        Exec Sql
          insert into klsyschg(KL_USERID,KL_ROLEID,KL_FIELDCHG,KL_VALBCHG,
                      KL_VALACHG,CREATE_USER_NAME)
          values(:userid, :wloggedRid, :puotype, :wprevyesno, :puoyesno,:puid);
       // EndIf;
      //AECP-3116   End

        // PML Line:644*
       else;

        // PML Line:645*
        WRITE RKWPUOPT;
        RS006_ = RcdSts2_('WRTRCD': %error: %found: %eof);
      //AECP-3116   Start
        Exec Sql
          insert into klsyschg(KL_USERID,KL_ROLEID,KL_FIELDCHG,KL_VALBCHG,
                      KL_VALACHG, CREATE_USER_NAME)
        values(:userid, :wloggedRid, :puotype, '' , :puoyesno,:puid);
      //AECP-3116   End

       endif;

       // PML Line:648*
       puotype = 'EDTFCNTA';

       // PML Line:649*
       AM006_ = CV_BYKEY;
       CHAIN(E) DL006_ RKWPUOPT;
       RS006_ = RcdSts2_('GETRCD': %error: %found: %eof);

       wprevyesno = puoyesno;
       // PML Line:650*
       puoyesno = edtfcnta;

       // PML Line:651*
       if (RS006_ = '1');

        // PML Line:652*
        RS006_ = UpdateRcd_('RKWPUOPT');

      //AECP-3116   Start
        //If ( puoyesno <> wprevyesno);
        Exec Sql
          insert into klsyschg(KL_USERID,KL_ROLEID,KL_FIELDCHG,KL_VALBCHG,
                      KL_VALACHG,CREATE_USER_NAME)
          values(:userid, :wloggedRid, :puotype, :wprevyesno, :puoyesno,:puid);
       // EndIf;
      //AECP-3116   End
        // PML Line:653*
       else;

        // PML Line:654*
        WRITE RKWPUOPT;
        RS006_ = RcdSts2_('WRTRCD': %error: %found: %eof);
      //AECP-3116   Start
        Exec sql
          insert into klsyschg(KL_USERID,KL_ROLEID,KL_FIELDCHG,KL_VALBCHG,
                      KL_VALACHG, CREATE_USER_NAME)
        values(:userid, :wloggedRid, :puotype, '' , :puoyesno,:puid);
      //AECP-3116   End
       endif;

       // PML Line:657*
       puotype = 'EDTFCNTB';

       // PML Line:658*
       AM006_ = CV_BYKEY;
       CHAIN(E) DL006_ RKWPUOPT;
       RS006_ = RcdSts2_('GETRCD': %error: %found: %eof);
       wprevyesno = puoyesno;

       // PML Line:659*
       puoyesno = edtfcntb;

       // PML Line:660*
       if (RS006_ = '1');

        // PML Line:661*
        RS006_ = UpdateRcd_('RKWPUOPT');
      //AECP-3116   Start
        //If ( puoyesno <> wprevyesno);
        Exec Sql
          insert into klsyschg(KL_USERID,KL_ROLEID,KL_FIELDCHG,KL_VALBCHG,
                      KL_VALACHG,CREATE_USER_NAME)
          values(:userid, :wloggedRid, :puotype, :wprevyesno, :puoyesno,:puid);
        //EndIf;
      //AECP-3116   End

        // PML Line:662*
       else;

        // PML Line:663*
        WRITE RKWPUOPT;
        RS006_ = RcdSts2_('WRTRCD': %error: %found: %eof);
      //AECP-3116   Start
        Exec sql
          insert into klsyschg(KL_USERID,KL_ROLEID,KL_FIELDCHG,KL_VALBCHG,
                      KL_VALACHG, CREATE_USER_NAME)
        values(:userid, :wloggedRid, :puotype, '' , :puoyesno,:puid);
      //AECP-3116   End
       endif;

       // PML Line:666*
       puotype = 'EDTFACCTC';

       // PML Line:667*
       AM006_ = CV_BYKEY;
       CHAIN(E) DL006_ RKWPUOPT;
       RS006_ = RcdSts2_('GETRCD': %error: %found: %eof);
       wprevyesno = puoyesno;

       // PML Line:668*
       puoyesno = edtfacctc;

       // PML Line:669*
       if (RS006_ = '1');

        // PML Line:670*
        RS006_ = UpdateRcd_('RKWPUOPT');
      //AECP-3116   Start
        //If ( puoyesno <> wprevyesno);
        Exec Sql
          insert into klsyschg(KL_USERID,KL_ROLEID,KL_FIELDCHG,KL_VALBCHG,
                      KL_VALACHG,CREATE_USER_NAME)
          values(:userid, :wloggedRid, :puotype, :wprevyesno, :puoyesno,:puid);
        //EndIf;
      //AECP-3116   End

        // PML Line:671*
       else;

        // PML Line:672*
        WRITE RKWPUOPT;
        RS006_ = RcdSts2_('WRTRCD': %error: %found: %eof);
      //AECP-3116   Start
        Exec sql
          insert into klsyschg(KL_USERID,KL_ROLEID,KL_FIELDCHG,KL_VALBCHG,
                      KL_VALACHG, CREATE_USER_NAME)
        values(:userid, :wloggedRid, :puotype, '' , :puoyesno,:puid);
      //AECP-3116   End
       endif;

       // PML Line:675*
       puotype = 'EDTFLNCDS';

       // PML Line:676*
       AM006_ = CV_BYKEY;
       CHAIN(E) DL006_ RKWPUOPT;
       RS006_ = RcdSts2_('GETRCD': %error: %found: %eof);
       wprevyesno = puoyesno;

       // PML Line:677*
       puoyesno = edtflncds;

       // PML Line:678*
       if (RS006_ = '1');

        // PML Line:679*
        RS006_ = UpdateRcd_('RKWPUOPT');
      //AECP-3116   Start
        //If ( puoyesno <> wprevyesno);
        Exec Sql
          insert into klsyschg(KL_USERID,KL_ROLEID,KL_FIELDCHG,KL_VALBCHG,
                      KL_VALACHG,CREATE_USER_NAME)
          values(:userid, :wloggedRid, :puotype, :wprevyesno, :puoyesno,:puid);
        //EndIf;
      //AECP-3116   End

        // PML Line:680*
       else;

        // PML Line:681*
        WRITE RKWPUOPT;
        RS006_ = RcdSts2_('WRTRCD': %error: %found: %eof);
      //AECP-3116   Start
        Exec sql
          insert into klsyschg(KL_USERID,KL_ROLEID,KL_FIELDCHG,KL_VALBCHG,
                      KL_VALACHG, CREATE_USER_NAME)
        values(:userid, :wloggedRid, :puotype, '' , :puoyesno,:puid);
      //AECP-3116   End
       endif;

       // PML Line:684*
       puotype = 'EDTFPAYCRD';

       // PML Line:685*
       AM006_ = CV_BYKEY;
       CHAIN(E) DL006_ RKWPUOPT;
       RS006_ = RcdSts2_('GETRCD': %error: %found: %eof);

       wprevyesno = puoyesno;
       // PML Line:686*
       puoyesno = edtfpaycrd;

       // PML Line:687*
       if (RS006_ = '1');

        // PML Line:688*
        RS006_ = UpdateRcd_('RKWPUOPT');
      //AECP-3116   Start
        //If ( puoyesno <> wprevyesno);
        Exec Sql
          insert into klsyschg(KL_USERID,KL_ROLEID,KL_FIELDCHG,KL_VALBCHG,
                      KL_VALACHG,CREATE_USER_NAME)
          values(:userid, :wloggedRid, :puotype, :wprevyesno, :puoyesno,:puid);
       // EndIf;
      //AECP-3116   End

        // PML Line:689*
       else;

        // PML Line:690*
        WRITE RKWPUOPT;
        RS006_ = RcdSts2_('WRTRCD': %error: %found: %eof);
      //AECP-3116   Start
        Exec sql
          insert into klsyschg(KL_USERID,KL_ROLEID,KL_FIELDCHG,KL_VALBCHG,
                      KL_VALACHG, CREATE_USER_NAME)
        values(:userid, :wloggedRid, :puotype, '' , :puoyesno,:puid);
      //AECP-3116   End
       endif;

       // PML Line:692*
       puatype = 'DENIAL_FICO';

       // PML Line:693*
       AM002_ = CV_BYKEY;
       CHAIN(E) DL002_ RKWPULOC;
       RS002_ = RcdSts2_('GETRCD': %error: %found: %eof);

       // PML Line:694*
       PUAAMT = denial_fico;

       // PML Line:695*
       if (RS002_ = '1');

        // PML Line:696*
        RS002_ = UpdateRcd_('RKWPULOC');

        // PML Line:697*
       else;

        // PML Line:698*
        WRITE RKWPULOC;
        RS002_ = RcdSts2_('WRTRCD': %error: %found: %eof);
       endif;

       // PML Line:700*
       puatype = 'DEVIANCE_FICO';

       // PML Line:701*
       AM002_ = CV_BYKEY;
       CHAIN(E) DL002_ RKWPULOC;
       RS002_ = RcdSts2_('GETRCD': %error: %found: %eof);

       // PML Line:702*
       PUAAMT = deviance_fico;

       // PML Line:703*
       if (RS002_ = '1');

        // PML Line:704*
        RS002_ = UpdateRcd_('RKWPULOC');

        // PML Line:705*
       else;

        // PML Line:706*
        WRITE RKWPULOC;
        RS002_ = RcdSts2_('WRTRCD': %error: %found: %eof);
       endif;

       // PML Line:708*
       puatype = 'APPROVAL_UNSECURED';

       // PML Line:709*
       AM002_ = CV_BYKEY;
       CHAIN(E) DL002_ RKWPULOC;
       RS002_ = RcdSts2_('GETRCD': %error: %found: %eof);

       // PML Line:710*
       PUAAMT = UNSECLIMIT;

       // PML Line:711*
       if (RS002_ = '1');

        // PML Line:712*
        RS002_ = UpdateRcd_('RKWPULOC');

        // PML Line:713*
       else;

        // PML Line:714*
        WRITE RKWPULOC;
        RS002_ = RcdSts2_('WRTRCD': %error: %found: %eof);
       endif;

       // PML Line:716*
       puatype = 'APPROVAL_GOODS';

       // PML Line:717*
       AM002_ = CV_BYKEY;
       CHAIN(E) DL002_ RKWPULOC;
       RS002_ = RcdSts2_('GETRCD': %error: %found: %eof);

       // PML Line:718*
       PUAAMT = GOODSLIMIT;

       // PML Line:719*
       if (RS002_ = '1');

        // PML Line:720*
        RS002_ = UpdateRcd_('RKWPULOC');

        // PML Line:721*
       else;

        // PML Line:722*
        WRITE RKWPULOC;
        RS002_ = RcdSts2_('WRTRCD': %error: %found: %eof);
       endif;

       // PML Line:724*
       puatype = 'APPROVAL_VEHICLE';

       // PML Line:725*
       AM002_ = CV_BYKEY;
       CHAIN(E) DL002_ RKWPULOC;
       RS002_ = RcdSts2_('GETRCD': %error: %found: %eof);

       // PML Line:726*
       PUAAMT = AUTOLIMIT;

       // PML Line:727*
       if (RS002_ = '1');

        // PML Line:728*
        RS002_ = UpdateRcd_('RKWPULOC');

        // PML Line:729*
       else;

        // PML Line:730*
        WRITE RKWPULOC;
        RS002_ = RcdSts2_('WRTRCD': %error: %found: %eof);
       endif;

       // PML Line:732*
       puotype = 'COLL';

       // PML Line:733*
       AM006_ = CV_BYKEY;
       CHAIN(E) DL006_ RKWPUOPT;
       RS006_ = RcdSts2_('GETRCD': %error: %found: %eof);
yk04   wprevyesno = puoyesno;

       // PML Line:734*
       puoyesno = optcoll;

       // PML Line:735*
       if (RS006_ = '1');

        // PML Line:736*
        RS006_ = UpdateRcd_('RKWPUOPT');
      //AECP-3116   Start
        //If ( puoyesno <> wprevyesno);
        Exec Sql
          insert into klsyschg(KL_USERID,KL_ROLEID,KL_FIELDCHG,KL_VALBCHG,
                      KL_VALACHG,CREATE_USER_NAME)
          values(:userid, :wloggedRid, :puotype, :wprevyesno, :puoyesno,:puid);
       // EndIf;
      //AECP-3116   End

        // PML Line:737*
       else;

        // PML Line:738*
        WRITE RKWPUOPT;
        RS006_ = RcdSts2_('WRTRCD': %error: %found: %eof);
      //AECP-3116   Start
        Exec sql
          insert into klsyschg(KL_USERID,KL_ROLEID,KL_FIELDCHG,KL_VALBCHG,
                      KL_VALACHG, CREATE_USER_NAME)
        values(:userid, :wloggedRid, :puotype, '' , :puoyesno,:puid);
      //AECP-3116   End
       endif;

       // PML Line:740*
       puotype = 'DEPARTMENT';
 YK01  If (DDEPARTMENT = 'Yes');
 YK01    PUOYESNO = 'Y';
 YK01  Else;
 YK01    PUOYESNO = 'N';
 YK01  Endif;

       // PML Line:741*
       AM006_ = CV_BYKEY;
       CHAIN(E) DL006_ RKWPUOPT;
       RS006_ = RcdSts2_('GETRCD': %error: %found: %eof);
yk04   wprevyesno = puoyesno;

       // PML Line:742*
       PUVALUE = DEPARTMENT;

       // PML Line:743*
       if (RS006_ = '1');

        // PML Line:744*
        RS006_ = UpdateRcd_('RKWPUOPT');
      //AECP-3116   Start
        //If ( puoyesno <> wprevyesno);
        Exec Sql
          insert into klsyschg(KL_USERID,KL_ROLEID,KL_FIELDCHG,KL_VALBCHG,
                      KL_VALACHG,CREATE_USER_NAME)
          values(:userid, :wloggedRid, :puotype, :wprevyesno, :puoyesno,:puid);
        //EndIf;
      //AECP-3116   End

        // PML Line:745*
       else;

        // PML Line:746*
        WRITE RKWPUOPT;
        RS006_ = RcdSts2_('WRTRCD': %error: %found: %eof);
      //AECP-3116   Start
        Exec sql
          insert into klsyschg(KL_USERID,KL_ROLEID,KL_FIELDCHG,KL_VALBCHG,
                      KL_VALACHG, CREATE_USER_NAME)
        values(:userid, :wloggedRid, :puotype, '' , :puoyesno,:puid);
      //AECP-3116   End
       endif;
YK01
YK01   //Write or update User Role in KWPUOPT file
YK01   puotype = *blanks;
YK01   puotype = 'USERROLE';
YK01
YK01   // PML Line:741*
YK01   AM006_ = CV_BYKEY;
YK01   UsrPuValue = PUVALUE;
YK01   edtrole  = 'N';
YK01   //CHAIN(E) DL006_ RKWPUOPT;
YK01   //RS006_ = RcdSts2_('GETRCD': %error: %found: %eof);
YK01
YK01    //Start YK01- AECP-2557
        exec sql
        select 'Y', PUVALUE into :rolefound, :wprevRolid from KWPUOPT
        where PUID = :PUID and PUOTYPE = 'USERROLE';
YK01    //End-YK01    AECP-2557
YK01   // Update user role in KWPUOPT if already there for user
YK01   //if ((((sqlcod <> 100)) and ((sqlcod >= 0)))) and
YK01     if ( rolefound = 'Y');
YK01    // PML Line:744*
YK01    //RS006_ = UpdateRcd_('RKWPUOPT');
YK01    //Start -YK01 AECP-2557
        exec sql
         // update kwpuopt set PUROLE = :usrrole , PUOYESNO = :EDTROLE,
         // PUOTYPE = 'USERROLE'
         // where PUID = :PUID and PUVALUE = 9999.00;
          update kwpuopt set PUVALUE = :DROLEID , PUOYESNO = :EDTROLE
          where PUID = :PUID and PUOTYPE = 'USERROLE';
YK01    //End-YK01    AECP-2557
        //exec sql
        //select PUVALUE into :waftRolid from KWPUOPT
        //where PUID = :PUID and PUOTYPE = 'USERROLE';
        //wprevrole = %char(waftRolid);
yk04   wprevyesno = EDTROLE;
      //AECP-3116   Start
        Exec Sql
          insert into klsyschg(KL_USERID,KL_ROLEID,KL_FIELDCHG,KL_VALBCHG,
                      KL_VALACHG,CREATE_USER_NAME)
          values(:userid, :wloggedRid, :puotype,:wprevRolid, :@Roleid,:puid);
      //AECP-3116   End
YK01   if (sqlcod <> 100);
YK01   EndIf;
YK01    // PML Line:745*
YK01   else;
YK01
YK01    // Write record for User role if record not there for user
YK01    PUOTYPE = 'USERROLE';
YK01    //PUROLE  = usrrole;
YK01    PUVALUE = DROLEID;
YK01    PUOYESNO = edtrole;
YK01    WRITE RKWPUOPT;
YK01    RS006_ = RcdSts2_('WRTRCD': %error: %found: %eof);
      //AECP-3116   Start
        Exec sql
          insert into klsyschg(KL_USERID,KL_ROLEID,KL_FIELDCHG,KL_VALBCHG,
                      KL_VALACHG, CREATE_USER_NAME)
        values(:userid, :wloggedRid, :puotype, '' , :@Roleid,:puid);
      //AECP-3116   End
YK01   endif;
YK01   //PUVALUE = DROLEID;
YK01   PUOTYPE = *Blanks;
       PUVALUE = 0;

       //AECP-3639 -- RM01 Start

       @Roleid = *Zeros;

       Exec sql
       select RL_roleid into :@Roleid
       from kwlrole WHERE RL_ROLEID =
       (select puvalue from kwpuopt where puid = :puid
        and puotype = 'USERROLE');

       exec sql
         declare roleOpts cursor for
          select substr(RLOTYPE,4), RLOYESNO, RLOVALUE
            from kwlropt
       //EN01    where rlid = :@Roleid;
           where rlid = :@Roleid and RLOYESNO <> 'V';                            //EN01

       exec sql open roleOpts;

       exec Sql
         fetch roleOpts into :roleType, :roleYesNo, :roleValue;

       dow sqlcode = 0;

       wprevyesno = *Blanks;

       exec SQL
         select puoyesno into :wprevyesno from kwpuopt
          where puid = :puid and puotype = :roleType;

       if sqlcode = 0;

         exec SQL
           update kwpuopt set puid = :puid, puotype = :roleType,
                              puoyesno = :roleYesNo, puvalue = :roleValue
                        where puid = :puid and puotype = :roleType;

         exec Sql
           insert into klsyschg (KL_USERID,KL_ROLEID,KL_FIELDCHG,KL_VALBCHG,
                                 KL_VALACHG,CREATE_USER_NAME)
                values (:userid,:@Roleid,:roleType,:wprevyesno,
                        :roleYesNo,:puid);

       else;

         exec sql
           insert into kwpuopt (puid,puotype,puoyesno,puvalue)
                values (:puid,:roleType,:roleYesNo,:roleValue);

         exec Sql
           insert into klsyschg (KL_USERID,KL_ROLEID,KL_FIELDCHG,KL_VALBCHG,
                                 KL_VALACHG,CREATE_USER_NAME)
                values (:userid,:@Roleid,:roleType,' ',:RoleYesNo,:puid);

       endif;

       exec Sql
         fetch roleOpts into :roleType, :roleYesNo, :roleValue;

       enddo;

       exec sql close roleOpts;

       //AECP-3639 -- RM01 End

       // PML Line:748*
       puotype = 'RTORET';

       // PML Line:749*
       AM006_ = CV_BYKEY;
       CHAIN(E) DL006_ RKWPUOPT;
       RS006_ = RcdSts2_('GETRCD': %error: %found: %eof);
yk04   wprevyesno = puoyesno;

       // PML Line:750*
       puoyesno = rtoret;

       // PML Line:751*
       if (RS006_ = '1');

        // PML Line:752*
        RS006_ = UpdateRcd_('RKWPUOPT');
      //AECP-3116   Start
        //If ( puoyesno <> wprevyesno);
        Exec Sql
          insert into klsyschg(KL_USERID,KL_ROLEID,KL_FIELDCHG,KL_VALBCHG,
                      KL_VALACHG,CREATE_USER_NAME)
          values(:userid, :wloggedRid, :puotype, :wprevyesno, :puoyesno,:puid);
        //EndIf;
      //AECP-3116   End

        // PML Line:753*
       else;

        // PML Line:754*
        WRITE RKWPUOPT;
        RS006_ = RcdSts2_('WRTRCD': %error: %found: %eof);
      //AECP-3116   Start
        Exec sql
          insert into klsyschg(KL_USERID,KL_ROLEID,KL_FIELDCHG,KL_VALBCHG,
                      KL_VALACHG, CREATE_USER_NAME)
        values(:userid, :wloggedRid, :puotype, '' , :puoyesno,:puid);
      //AECP-3116   End
       endif;

       // PML Line:756*
       puotype = 'OVERVER';

       // PML Line:757*
       AM006_ = CV_BYKEY;
       CHAIN(E) DL006_ RKWPUOPT;
       RS006_ = RcdSts2_('GETRCD': %error: %found: %eof);
 yk04   wprevyesno = puoyesno;

       // PML Line:758*
       puoyesno = overver;

       // PML Line:759*
       if (RS006_ = '1');

        // PML Line:760*
        RS006_ = UpdateRcd_('RKWPUOPT');
      //AECP-3116   Start
        //If ( puoyesno <> wprevyesno);
        Exec Sql
          insert into klsyschg(KL_USERID,KL_ROLEID,KL_FIELDCHG,KL_VALBCHG,
                      KL_VALACHG,CREATE_USER_NAME)
          values(:userid, :wloggedRid, :puotype, :wprevyesno, :puoyesno,:puid);
        //EndIf;
      //AECP-3116   End

        // PML Line:761*
       else;

        // PML Line:762*
        WRITE RKWPUOPT;
        RS006_ = RcdSts2_('WRTRCD': %error: %found: %eof);
      //AECP-3116   Start
        Exec sql
          insert into klsyschg(KL_USERID,KL_ROLEID,KL_FIELDCHG,KL_VALBCHG,
                      KL_VALACHG, CREATE_USER_NAME)
        values(:userid, :wloggedRid, :puotype, '' , :puoyesno,:puid);
      //AECP-3116   End
       endif;

       // PML Line:764*
       puotype = 'LNEXPOVR';

       // PML Line:765*
       AM006_ = CV_BYKEY;
       CHAIN(E) DL006_ RKWPUOPT;
       RS006_ = RcdSts2_('GETRCD': %error: %found: %eof);
 yk04   wprevyesno = puoyesno;

       // PML Line:766*
       puoyesno = lnexpovr;

       // PML Line:767*
       if (RS006_ = '1');

        // PML Line:768*
        RS006_ = UpdateRcd_('RKWPUOPT');
      //AECP-3116   Start
        Exec Sql
          insert into klsyschg(KL_USERID,KL_ROLEID,KL_FIELDCHG,KL_VALBCHG,
                      KL_VALACHG,CREATE_USER_NAME)
          values(:userid, :wloggedRid, :puotype, :wprevyesno, :puoyesno,:puid);
      //AECP-3116   End

        // PML Line:769*
       else;

        // PML Line:770*
        WRITE RKWPUOPT;
        RS006_ = RcdSts2_('WRTRCD': %error: %found: %eof);
      //AECP-3116   Start
        Exec sql
          insert into klsyschg(KL_USERID,KL_ROLEID,KL_FIELDCHG,KL_VALBCHG,
                      KL_VALACHG, CREATE_USER_NAME)
        values(:userid, :wloggedRid, :puotype, '' , :puoyesno,:puid);
      //AECP-3116   End
       endif;

       // PML Line:772*
       puotype = 'CNCLAPP';

       // PML Line:773*
       AM006_ = CV_BYKEY;
       CHAIN(E) DL006_ RKWPUOPT;
       RS006_ = RcdSts2_('GETRCD': %error: %found: %eof);
yk04   wprevyesno = puoyesno;

       // PML Line:774*
       puoyesno = cnclapp;

       // PML Line:775*
       if (RS006_ = '1');

        // PML Line:776*
        RS006_ = UpdateRcd_('RKWPUOPT');
      //AECP-3116   Start
        //If ( puoyesno <> wprevyesno);
        Exec Sql
          insert into klsyschg(KL_USERID,KL_ROLEID,KL_FIELDCHG,KL_VALBCHG,
                      KL_VALACHG,CREATE_USER_NAME)
          values(:userid, :wloggedRid, :puotype, :wprevyesno, :puoyesno,:puid);
        //EndIf;
      //AECP-3116   End

        // PML Line:777*
       else;

        // PML Line:778*
        WRITE RKWPUOPT;
        RS006_ = RcdSts2_('WRTRCD': %error: %found: %eof);
      //AECP-3116   Start
        Exec sql
          insert into klsyschg(KL_USERID,KL_ROLEID,KL_FIELDCHG,KL_VALBCHG,
                      KL_VALACHG, CREATE_USER_NAME)
        values(:userid, :wloggedRid, :puotype, '' , :puoyesno,:puid);
      //AECP-3116   End
       endif;

       // PML Line:781*
       puotype = 'LNOPNOVR';

       // PML Line:782*
       AM006_ = CV_BYKEY;
       CHAIN(E) DL006_ RKWPUOPT;
       RS006_ = RcdSts2_('GETRCD': %error: %found: %eof);
yk04   wprevyesno = puoyesno;

       // PML Line:783*
       puoyesno = lnopnovr;

       // PML Line:784*
       if (RS006_ = '1');

        // PML Line:785*
        RS006_ = UpdateRcd_('RKWPUOPT');
      //AECP-3116   Start
        //If ( puoyesno <> wprevyesno);
        Exec Sql
          insert into klsyschg(KL_USERID,KL_ROLEID,KL_FIELDCHG,KL_VALBCHG,
                      KL_VALACHG,CREATE_USER_NAME)
          values(:userid, :wloggedRid, :puotype, :wprevyesno, :puoyesno,:puid);
        //EndIf;
      //AECP-3116   End

        // PML Line:786*
       else;

        // PML Line:787*
        WRITE RKWPUOPT;
        RS006_ = RcdSts2_('WRTRCD': %error: %found: %eof);
      //AECP-3116   Start
        Exec sql
          insert into klsyschg(KL_USERID,KL_ROLEID,KL_FIELDCHG,KL_VALBCHG,
                      KL_VALACHG, CREATE_USER_NAME)
        values(:userid, :wloggedRid, :puotype, '' , :puoyesno,:puid);
      //AECP-3116   End
       endif;

       // PML Line:789*
       puotype = 'LNFUNDOVR';

       // PML Line:790*
       AM006_ = CV_BYKEY;
       CHAIN(E) DL006_ RKWPUOPT;
       RS006_ = RcdSts2_('GETRCD': %error: %found: %eof);
yk04   wprevyesno = puoyesno;

       // PML Line:791*
       puoyesno = lnfundovr;

       // PML Line:792*
       if (RS006_ = '1');

        // PML Line:793*
        RS006_ = UpdateRcd_('RKWPUOPT');

      //AECP-3116   Start
        //If ( puoyesno <> wprevyesno);
        Exec Sql
          insert into klsyschg(KL_USERID,KL_ROLEID,KL_FIELDCHG,KL_VALBCHG,
                      KL_VALACHG,CREATE_USER_NAME)
          values(:userid, :wloggedRid, :puotype, :wprevyesno, :puoyesno,:puid);
        //EndIf;
      //AECP-3116   End
        // PML Line:794*
       else;

        // PML Line:795*
        WRITE RKWPUOPT;
        RS006_ = RcdSts2_('WRTRCD': %error: %found: %eof);
      //AECP-3116   Start
        Exec sql
          insert into klsyschg(KL_USERID,KL_ROLEID,KL_FIELDCHG,KL_VALBCHG,
                      KL_VALACHG, CREATE_USER_NAME)
        values(:userid, :wloggedRid, :puotype, '' , :puoyesno,:puid);
      //AECP-3116   End
       endif;

       // PML Line:798*
       puotype = 'EDTSCRAFLG';

       // PML Line:799*
       AM006_ = CV_BYKEY;
       CHAIN(E) DL006_ RKWPUOPT;
       RS006_ = RcdSts2_('GETRCD': %error: %found: %eof);
yk04   wprevyesno = puoyesno;

       // PML Line:800*
       puoyesno = edtscraflg;

       // PML Line:801*
       if (RS006_ = '1');

        // PML Line:802*
        RS006_ = UpdateRcd_('RKWPUOPT');

      //AECP-3116   Start
        //If ( puoyesno <> wprevyesno);
        Exec Sql
          insert into klsyschg(KL_USERID,KL_ROLEID,KL_FIELDCHG,KL_VALBCHG,
                      KL_VALACHG,CREATE_USER_NAME)
          values(:userid, :wloggedRid, :puotype, :wprevyesno, :puoyesno,:puid);
        //EndIf;
      //AECP-3116   End
        // PML Line:803*
       else;

        // PML Line:804*
        WRITE RKWPUOPT;
        RS006_ = RcdSts2_('WRTRCD': %error: %found: %eof);
      //AECP-3116   Start
        Exec sql
          insert into klsyschg(KL_USERID,KL_ROLEID,KL_FIELDCHG,KL_VALBCHG,
                      KL_VALACHG, CREATE_USER_NAME)
        values(:userid, :wloggedRid, :puotype, '' , :puoyesno,:puid);
      //AECP-3116   End
       endif;

       // PML Line:807*
       puotype = 'SPECHANDL';

       // PML Line:808*
       AM006_ = CV_BYKEY;
       CHAIN(E) DL006_ RKWPUOPT;
       RS006_ = RcdSts2_('GETRCD': %error: %found: %eof);
yk04   wprevyesno = puoyesno;

       // PML Line:809*
       puoyesno = spechandl;

       // PML Line:810*
       if (RS006_ = '1');

        // PML Line:811*
        RS006_ = UpdateRcd_('RKWPUOPT');

      //AECP-3116   Start
        //If ( puoyesno <> wprevyesno);
        Exec Sql
          insert into klsyschg(KL_USERID,KL_ROLEID,KL_FIELDCHG,KL_VALBCHG,
                      KL_VALACHG,CREATE_USER_NAME)
          values(:userid, :wloggedRid, :puotype, :wprevyesno, :puoyesno,:puid);
        //EndIf;
      //AECP-3116   End
        // PML Line:812*
       else;

        // PML Line:813*
        WRITE RKWPUOPT;
        RS006_ = RcdSts2_('WRTRCD': %error: %found: %eof);
      //AECP-3116   Start
        Exec sql
          insert into klsyschg(KL_USERID,KL_ROLEID,KL_FIELDCHG,KL_VALBCHG,
                      KL_VALACHG, CREATE_USER_NAME)
        values(:userid, :wloggedRid, :puotype, '' , :puoyesno,:puid);
      //AECP-3116   End
       endif;

       // PML Line:816*
       puotype = 'USRPIN';

       // PML Line:817*
       AM006_ = CV_BYKEY;
       CHAIN(E) DL006_ RKWPUOPT;
       RS006_ = RcdSts2_('GETRCD': %error: %found: %eof);
 yk04   wprevyesno = puoyesno;

       // PML Line:818*
       puoyesno = usrpin;

       // PML Line:819*
       if (RS006_ = '1');

        // PML Line:820*
        RS006_ = UpdateRcd_('RKWPUOPT');
      //AECP-3116   Start
        //If ( puoyesno <> wprevyesno);
        Exec Sql
          insert into klsyschg(KL_USERID,KL_ROLEID,KL_FIELDCHG,KL_VALBCHG,
                      KL_VALACHG,CREATE_USER_NAME)
          values(:userid, :wloggedRid, :puotype, :wprevyesno, :puoyesno,:puid);
        //EndIf;
      //AECP-3116   End

        // PML Line:821*
       else;

        // PML Line:822*
        WRITE RKWPUOPT;
        RS006_ = RcdSts2_('WRTRCD': %error: %found: %eof);
      //AECP-3116   Start
        Exec sql
          insert into klsyschg(KL_USERID,KL_ROLEID,KL_FIELDCHG,KL_VALBCHG,
                      KL_VALACHG, CREATE_USER_NAME)
        values(:userid, :wloggedRid, :puotype, '' , :puoyesno,:puid);
      //AECP-3116   End
       endif;

       // PML Line:825*
       puotype = 'TIMECODE';

       // PML Line:826*
       AM012_ = CV_BYKEY;
       CHAIN(E) DL012_ R__FMT03;
       RS012_ = RcdSts2_('GETRCD': %error: %found: %eof);

       // PML Line:827*
       puocode = timecode;

       // PML Line:828*
       if (RS012_ = '1');

        // PML Line:829*
        RS012_ = UpdateRcd_('R__FMT03');

        // PML Line:830*
       else;

        // PML Line:831*
        WRITE R__FMT03;
        RS012_ = RcdSts2_('WRTRCD': %error: %found: %eof);
       endif;

       // PML Line:834*
       puotype = 'EDTINTFLD';

       // PML Line:835*
       AM006_ = CV_BYKEY;
       CHAIN(E) DL006_ RKWPUOPT;
       RS006_ = RcdSts2_('GETRCD': %error: %found: %eof);
 yk04   wprevyesno = puoyesno;

       // PML Line:836*
       puoyesno = edtintfld;

       // PML Line:837*
       if (RS006_ = '1');

        // PML Line:838*
        RS006_ = UpdateRcd_('RKWPUOPT');
      //AECP-3116   Start
        //IF ( puoyesno <> wprevyesno);
        Exec Sql
          insert into klsyschg(KL_USERID,KL_ROLEID,KL_FIELDCHG,KL_VALBCHG,
                      KL_VALACHG,CREATE_USER_NAME)
          values(:userid, :wloggedRid, :puotype, :wprevyesno, :puoyesno,:puid);
        //EndIf;
      //AECP-3116   End

        // PML Line:839*
       else;

        // PML Line:840*
        WRITE RKWPUOPT;
        RS006_ = RcdSts2_('WRTRCD': %error: %found: %eof);
      //AECP-3116   Start
        Exec sql
          insert into klsyschg(KL_USERID,KL_ROLEID,KL_FIELDCHG,KL_VALBCHG,
                      KL_VALACHG, CREATE_USER_NAME)
        values(:userid, :wloggedRid, :puotype, '' , :puoyesno,:puid);
      //AECP-3116   End
       endif;

       // PML Line:842*
       puotype = 'ADMCOLL';

       // PML Line:843*
       AM006_ = CV_BYKEY;
       CHAIN(E) DL006_ RKWPUOPT;
       RS006_ = RcdSts2_('GETRCD': %error: %found: %eof);
 yk04   wprevyesno = puoyesno;

       // PML Line:844*
       puoyesno = optadmcoll;

       // PML Line:845*
       if (RS006_ = '1');

        // PML Line:846*
        RS006_ = UpdateRcd_('RKWPUOPT');
      //AECP-3116   Start
        //If ( puoyesno <> wprevyesno);
        Exec Sql
          insert into klsyschg(KL_USERID,KL_ROLEID,KL_FIELDCHG,KL_VALBCHG,
                      KL_VALACHG,CREATE_USER_NAME)
          values(:userid, :wloggedRid, :puotype, :wprevyesno, :puoyesno,:puid);
        //EndIf;
      //AECP-3116   End

        // PML Line:847*
       else;

        // PML Line:848*
        WRITE RKWPUOPT;
        RS006_ = RcdSts2_('WRTRCD': %error: %found: %eof);
      //AECP-3116   Start
        Exec sql
          insert into klsyschg(KL_USERID,KL_ROLEID,KL_FIELDCHG,KL_VALBCHG,
                      KL_VALACHG, CREATE_USER_NAME)
        values(:userid, :wloggedRid, :puotype, '' , :puoyesno,:puid);
      //AECP-3116   End
       endif;

       // PML Line:850*
       puotype = 'ASSIGNCOLL';

       // PML Line:851*
       AM006_ = CV_BYKEY;
       CHAIN(E) DL006_ RKWPUOPT;
       RS006_ = RcdSts2_('GETRCD': %error: %found: %eof);
 yk04   wprevyesno = puoyesno;

       // PML Line:852*
       puoyesno = optascoll;

       // PML Line:853*
       if (RS006_ = '1');

        // PML Line:854*
        RS006_ = UpdateRcd_('RKWPUOPT');
      //AECP-3116   Start
        //If ( puoyesno <> wprevyesno);
        Exec Sql
          insert into klsyschg(KL_USERID,KL_ROLEID,KL_FIELDCHG,KL_VALBCHG,
                      KL_VALACHG,CREATE_USER_NAME)
          values(:userid, :wloggedRid, :puotype, :wprevyesno, :puoyesno,:puid);
       // EndIf;
      //AECP-3116   End

        // PML Line:855*
       else;

        // PML Line:856*
        WRITE RKWPUOPT;
        RS006_ = RcdSts2_('WRTRCD': %error: %found: %eof);
      //AECP-3116   Start
        Exec sql
          insert into klsyschg(KL_USERID,KL_ROLEID,KL_FIELDCHG,KL_VALBCHG,
                      KL_VALACHG, CREATE_USER_NAME)
        values(:userid, :wloggedRid, :puotype, '' , :puoyesno,:puid);
      //AECP-3116   End
       endif;

       // PML Line:858*
       puotype = 'DENY';

       // PML Line:859*
       AM006_ = CV_BYKEY;
       CHAIN(E) DL006_ RKWPUOPT;
       RS006_ = RcdSts2_('GETRCD': %error: %found: %eof);
 yk04   wprevyesno = puoyesno;

       // PML Line:860*
       puoyesno = optdeny;

       // PML Line:861*
       if (RS006_ = '1');

        // PML Line:862*
        RS006_ = UpdateRcd_('RKWPUOPT');

      //AECP-3116   Start
        //If ( puoyesno <> wprevyesno);
        Exec Sql
          insert into klsyschg(KL_USERID,KL_ROLEID,KL_FIELDCHG,KL_VALBCHG,
                      KL_VALACHG,CREATE_USER_NAME)
          values(:userid, :wloggedRid, :puotype, :wprevyesno, :puoyesno,:puid);
        //EndIf;
      //AECP-3116   End
        // PML Line:863*
       else;

        // PML Line:864*
        WRITE RKWPUOPT;
        RS006_ = RcdSts2_('WRTRCD': %error: %found: %eof);
      //AECP-3116   Start
        Exec sql
          insert into klsyschg(KL_USERID,KL_ROLEID,KL_FIELDCHG,KL_VALBCHG,
                      KL_VALACHG, CREATE_USER_NAME)
        values(:userid, :wloggedRid, :puotype, '' , :puoyesno,:puid);
      //AECP-3116   End
       endif;

       // PML Line:866*
       puotype = 'APPROVE';

       // PML Line:867*
       AM006_ = CV_BYKEY;
       CHAIN(E) DL006_ RKWPUOPT;
       RS006_ = RcdSts2_('GETRCD': %error: %found: %eof);
yk04   wprevyesno = puoyesno;

       // PML Line:868*
       puoyesno = optapprove;

       // PML Line:869*
       if (RS006_ = '1');

        // PML Line:870*
        RS006_ = UpdateRcd_('RKWPUOPT');
      //AECP-3116   Start
        //If ( puoyesno <> wprevyesno);
        Exec Sql
          insert into klsyschg(KL_USERID,KL_ROLEID,KL_FIELDCHG,KL_VALBCHG,
                      KL_VALACHG,CREATE_USER_NAME)
          values(:userid, :wloggedRid, :puotype, :wprevyesno, :puoyesno,:puid);
        //EndIf;
      //AECP-3116   End

        // PML Line:871*
       else;

        // PML Line:872*
        WRITE RKWPUOPT;
        RS006_ = RcdSts2_('WRTRCD': %error: %found: %eof);
      //AECP-3116   Start
        Exec sql
          insert into klsyschg(KL_USERID,KL_ROLEID,KL_FIELDCHG,KL_VALBCHG,
                      KL_VALACHG, CREATE_USER_NAME)
        values(:userid, :wloggedRid, :puotype, '' , :puoyesno,:puid);
      //AECP-3116   End
       endif;

       // PML Line:874*
       puotype = 'VOID';

       // PML Line:875*
       AM006_ = CV_BYKEY;
       CHAIN(E) DL006_ RKWPUOPT;
       RS006_ = RcdSts2_('GETRCD': %error: %found: %eof);
 yk04  wprevyesno = puoyesno;

       // PML Line:876*
       puoyesno = optvoid;

       // PML Line:877*
       if (RS006_ = '1');

        // PML Line:878*
        RS006_ = UpdateRcd_('RKWPUOPT');
      //AECP-3116   Start
        //If ( puoyesno <> wprevyesno);
        Exec Sql
          insert into klsyschg(KL_USERID,KL_ROLEID,KL_FIELDCHG,KL_VALBCHG,
                      KL_VALACHG,CREATE_USER_NAME)
          values(:userid, :wloggedRid, :puotype, :wprevyesno, :puoyesno,:puid);
        //EndIf;
      //AECP-3116   End

        // PML Line:879*
       else;

        // PML Line:880*
        WRITE RKWPUOPT;
        RS006_ = RcdSts2_('WRTRCD': %error: %found: %eof);
      //AECP-3116   Start
        Exec sql
          insert into klsyschg(KL_USERID,KL_ROLEID,KL_FIELDCHG,KL_VALBCHG,
                      KL_VALACHG, CREATE_USER_NAME)
        values(:userid, :wloggedRid, :puotype, '' , :puoyesno,:puid);
      //AECP-3116   End
       endif;

       // PML Line:882*
       puotype = 'REM';

       // PML Line:883*
       AM006_ = CV_BYKEY;
       CHAIN(E) DL006_ RKWPUOPT;
       RS006_ = RcdSts2_('GETRCD': %error: %found: %eof);
yk04   wprevyesno = puoyesno;

       // PML Line:884*
       puoyesno = optrem;

       // PML Line:885*
       if (RS006_ = '1');

        // PML Line:886*
        RS006_ = UpdateRcd_('RKWPUOPT');
      //AECP-3116   Start
        //If ( puoyesno <> wprevyesno);
        Exec Sql
          insert into klsyschg(KL_USERID,KL_ROLEID,KL_FIELDCHG,KL_VALBCHG,
                      KL_VALACHG,CREATE_USER_NAME)
          values(:userid, :wloggedRid, :puotype, :wprevyesno, :puoyesno,:puid);
       // EndIf;
      //AECP-3116   End

        // PML Line:887*
       else;

        // PML Line:888*
        WRITE RKWPUOPT;
        RS006_ = RcdSts2_('WRTRCD': %error: %found: %eof);
      //AECP-3116   Start
        Exec sql
          insert into klsyschg(KL_USERID,KL_ROLEID,KL_FIELDCHG,KL_VALBCHG,
                      KL_VALACHG, CREATE_USER_NAME)
        values(:userid, :wloggedRid, :puotype, '' , :puoyesno,:puid);
      //AECP-3116   End
       endif;

       // PML Line:890*
       puotype = 'ASSCON';

       // PML Line:891*
       AM006_ = CV_BYKEY;
       CHAIN(E) DL006_ RKWPUOPT;
       RS006_ = RcdSts2_('GETRCD': %error: %found: %eof);
yk04   wprevyesno = puoyesno;

       // PML Line:892*
       puoyesno = optasscon;

       // PML Line:893*
       if (RS006_ = '1');

        // PML Line:894*
        RS006_ = UpdateRcd_('RKWPUOPT');
      //AECP-3116   Start
        //If ( puoyesno <> wprevyesno);
        Exec Sql
          insert into klsyschg(KL_USERID,KL_ROLEID,KL_FIELDCHG,KL_VALBCHG,
                      KL_VALACHG,CREATE_USER_NAME)
          values(:userid, :wloggedRid, :puotype, :wprevyesno, :puoyesno,:puid);
       // EndIf;
      //AECP-3116   End

        // PML Line:895*
       else;

        // PML Line:896*
        WRITE RKWPUOPT;
        RS006_ = RcdSts2_('WRTRCD': %error: %found: %eof);
      //AECP-3116   Start
        Exec sql
          insert into klsyschg(KL_USERID,KL_ROLEID,KL_FIELDCHG,KL_VALBCHG,
                      KL_VALACHG, CREATE_USER_NAME)
        values(:userid, :wloggedRid, :puotype, '' , :puoyesno,:puid);
      //AECP-3116   End
       endif;

       // PML Line:902*
       AM010_ = CV_BYKEY;
       CHAIN(E) DL010_ R__FMT02;
       RS010_ = RcdSts2_('GETRCD': %error: %found: %eof);

       // PML Line:903*
       psid = sup;

       // PML Line:904*
       if (RS010_ = '1');

        // PML Line:905*
        RS010_ = UpdateRcd_('R__FMT02');

        // PML Line:906*
       else;

        // PML Line:907*
        WRITE R__FMT02;
        RS010_ = RcdSts2_('WRTRCD': %error: %found: %eof);
       endif;

       // PML Line:909*
       puotype = 'ABATEAUTH';

       // PML Line:910*
       AM006_ = CV_BYKEY;
       CHAIN(E) DL006_ RKWPUOPT;
       RS006_ = RcdSts2_('GETRCD': %error: %found: %eof);
yk04   wprevyesno = puoyesno;

       // PML Line:911*
       puoyesno = optabate;

       // PML Line:912*
       if (RS006_ = '1');

        // PML Line:913*
        RS006_ = UpdateRcd_('RKWPUOPT');
      //AECP-3116   Start
        //If ( puoyesno <> wprevyesno);
        Exec Sql
          insert into klsyschg(KL_USERID,KL_ROLEID,KL_FIELDCHG,KL_VALBCHG,
                      KL_VALACHG,CREATE_USER_NAME)
          values(:userid, :wloggedRid, :puotype, :wprevyesno, :puoyesno,:puid);
       // EndIf;
      //AECP-3116   End

        // PML Line:914*
       else;

        // PML Line:915*
        WRITE RKWPUOPT;
        RS006_ = RcdSts2_('WRTRCD': %error: %found: %eof);
      //AECP-3116   Start
        Exec sql
          insert into klsyschg(KL_USERID,KL_ROLEID,KL_FIELDCHG,KL_VALBCHG,
                      KL_VALACHG, CREATE_USER_NAME)
        values(:userid, :wloggedRid, :puotype, '' , :puoyesno,:puid);
      //AECP-3116   End
       endif;

       // PML Line:917*
       puotype = 'TRANSFIX';

       // PML Line:918*
       AM006_ = CV_BYKEY;
       CHAIN(E) DL006_ RKWPUOPT;
       RS006_ = RcdSts2_('GETRCD': %error: %found: %eof);
yk04   wprevyesno = puoyesno;

       // PML Line:919*
       puoyesno = opttransfix;

       // PML Line:920*
       if (RS006_ = '1');

        // PML Line:921*
        RS006_ = UpdateRcd_('RKWPUOPT');
      //AECP-3116   Start
        //If ( puoyesno <> wprevyesno);
        Exec Sql
          insert into klsyschg(KL_USERID,KL_ROLEID,KL_FIELDCHG,KL_VALBCHG,
                      KL_VALACHG,CREATE_USER_NAME)
          values(:userid, :wloggedRid, :puotype, :wprevyesno, :puoyesno,:puid);
        //EndIf;
      //AECP-3116   End

        // PML Line:922*
       else;

        // PML Line:923*
        WRITE RKWPUOPT;
        RS006_ = RcdSts2_('WRTRCD': %error: %found: %eof);
      //AECP-3116   Start
        Exec sql
          insert into klsyschg(KL_USERID,KL_ROLEID,KL_FIELDCHG,KL_VALBCHG,
                      KL_VALACHG, CREATE_USER_NAME)
        values(:userid, :wloggedRid, :puotype, '' , :puoyesno,:puid);
      //AECP-3116   End
       endif;

       // PML Line:925*
       puotype = 'MODIFY';

       // PML Line:926*
       AM006_ = CV_BYKEY;
       CHAIN(E) DL006_ RKWPUOPT;
       RS006_ = RcdSts2_('GETRCD': %error: %found: %eof);
yk04   wprevyesno = puoyesno;

       // PML Line:927*
       puoyesno = optmodify;

       // PML Line:928*
       if (RS006_ = '1');

        // PML Line:929*
        RS006_ = UpdateRcd_('RKWPUOPT');
      //AECP-3116   Start
        //If ( puoyesno <> wprevyesno);
        Exec Sql
          insert into klsyschg(KL_USERID,KL_ROLEID,KL_FIELDCHG,KL_VALBCHG,
                      KL_VALACHG,CREATE_USER_NAME)
          values(:userid, :wloggedRid, :puotype, :wprevyesno, :puoyesno,:puid);
       // EndIf;
      //AECP-3116   End

        // PML Line:930*
       else;

        // PML Line:931*
        WRITE RKWPUOPT;
        RS006_ = RcdSts2_('WRTRCD': %error: %found: %eof);
      //AECP-3116   Start
        Exec sql
          insert into klsyschg(KL_USERID,KL_ROLEID,KL_FIELDCHG,KL_VALBCHG,
                      KL_VALACHG, CREATE_USER_NAME)
        values(:userid, :wloggedRid, :puotype, '' , :puoyesno,:puid);
      //AECP-3116   End
       endif;

       // PML Line:933*
       puotype = 'JUDGEMENT';

       // PML Line:934*
       AM006_ = CV_BYKEY;
       CHAIN(E) DL006_ RKWPUOPT;
       RS006_ = RcdSts2_('GETRCD': %error: %found: %eof);

       // PML Line:935*
       puoyesno = optjudge;

       // PML Line:936*
       if (RS006_ = '1');

        // PML Line:937*
        RS006_ = UpdateRcd_('RKWPUOPT');
      //AECP-3116   Start
        //If ( puoyesno <> wprevyesno);
        Exec Sql
          insert into klsyschg(KL_USERID,KL_ROLEID,KL_FIELDCHG,KL_VALBCHG,
                      KL_VALACHG,CREATE_USER_NAME)
          values(:userid, :wloggedRid, :puotype, :wprevyesno, :puoyesno,:puid);
        //EndIf;
      //AECP-3116   End

        // PML Line:938*
       else;

        // PML Line:939*
        WRITE RKWPUOPT;
        RS006_ = RcdSts2_('WRTRCD': %error: %found: %eof);
      //AECP-3116   Start
        Exec sql
          insert into klsyschg(KL_USERID,KL_ROLEID,KL_FIELDCHG,KL_VALBCHG,
                      KL_VALACHG, CREATE_USER_NAME)
        values(:userid, :wloggedRid, :puotype, '' , :puoyesno,:puid);
      //AECP-3116   End
       endif;

       // PML Line:941*
       puotype = 'BANKRUPTCY';

       // PML Line:942*
       AM006_ = CV_BYKEY;
       CHAIN(E) DL006_ RKWPUOPT;
       RS006_ = RcdSts2_('GETRCD': %error: %found: %eof);
yk04   wprevyesno = puoyesno;

       // PML Line:943*
       puoyesno = optbankr;

       // PML Line:944*
       if (RS006_ = '1');

        // PML Line:945*
        RS006_ = UpdateRcd_('RKWPUOPT');
      //AECP-3116   Start
        //If ( puoyesno <> wprevyesno);
        Exec Sql
          insert into klsyschg(KL_USERID,KL_ROLEID,KL_FIELDCHG,KL_VALBCHG,
                      KL_VALACHG,CREATE_USER_NAME)
          values(:userid, :wloggedRid, :puotype, :wprevyesno, :puoyesno,:puid);
        //EndIf;
      //AECP-3116   End

        // PML Line:946*
       else;

        // PML Line:947*
        WRITE RKWPUOPT;
        RS006_ = RcdSts2_('WRTRCD': %error: %found: %eof);
      //AECP-3116   Start
        Exec sql
          insert into klsyschg(KL_USERID,KL_ROLEID,KL_FIELDCHG,KL_VALBCHG,
                      KL_VALACHG, CREATE_USER_NAME)
        values(:userid, :wloggedRid, :puotype, '' , :puoyesno,:puid);
      //AECP-3116   End
       endif;

       // PML Line:949*
       puotype = 'REPO';

       // PML Line:950*
       AM006_ = CV_BYKEY;
       CHAIN(E) DL006_ RKWPUOPT;
       RS006_ = RcdSts2_('GETRCD': %error: %found: %eof);
yk04   wprevyesno = puoyesno;

       // PML Line:951*
       puoyesno = optrepo;

       // PML Line:952*
       if (RS006_ = '1');

        // PML Line:953*
        RS006_ = UpdateRcd_('RKWPUOPT');

      //AECP-3116   Start
        //If ( puoyesno <> wprevyesno);
        Exec Sql
          insert into klsyschg(KL_USERID,KL_ROLEID,KL_FIELDCHG,KL_VALBCHG,
                      KL_VALACHG,CREATE_USER_NAME)
          values(:userid, :wloggedRid, :puotype, :wprevyesno, :puoyesno,:puid);
        //EndIf;
      //AECP-3116   End

        // PML Line:954*
       else;

        // PML Line:955*
        WRITE RKWPUOPT;
        RS006_ = RcdSts2_('WRTRCD': %error: %found: %eof);
      //AECP-3116   Start
        Exec sql
          insert into klsyschg(KL_USERID,KL_ROLEID,KL_FIELDCHG,KL_VALBCHG,
                      KL_VALACHG, CREATE_USER_NAME)
        values(:userid, :wloggedRid, :puotype, '' , :puoyesno,:puid);
      //AECP-3116   End
       endif;

       // PML Line:957*
       puotype = 'CHARGEOFF';

       // PML Line:958*
       AM006_ = CV_BYKEY;
       CHAIN(E) DL006_ RKWPUOPT;
       RS006_ = RcdSts2_('GETRCD': %error: %found: %eof);
yk04   wprevyesno = puoyesno;

       // PML Line:959*
       puoyesno = optcoff;

       // PML Line:960*
       if (RS006_ = '1');

        // PML Line:961*
        RS006_ = UpdateRcd_('RKWPUOPT');
      //AECP-3116   Start
        //If ( puoyesno <> wprevyesno);
        Exec Sql
          insert into klsyschg(KL_USERID,KL_ROLEID,KL_FIELDCHG,KL_VALBCHG,
                      KL_VALACHG,CREATE_USER_NAME)
          values(:userid, :wloggedRid, :puotype, :wprevyesno, :puoyesno,:puid);
        //EndIf;
      //AECP-3116   End

        // PML Line:962*
       else;

        // PML Line:963*
        WRITE RKWPUOPT;
        RS006_ = RcdSts2_('WRTRCD': %error: %found: %eof);
      //AECP-3116   Start
        Exec sql
          insert into klsyschg(KL_USERID,KL_ROLEID,KL_FIELDCHG,KL_VALBCHG,
                      KL_VALACHG, CREATE_USER_NAME)
        values(:userid, :wloggedRid, :puotype, '' , :puoyesno,:puid);
      //AECP-3116   End
       endif;

       // PML Line:965*
       puotype = 'CARDPMT';

       // PML Line:966*
       AM006_ = CV_BYKEY;
       CHAIN(E) DL006_ RKWPUOPT;
       RS006_ = RcdSts2_('GETRCD': %error: %found: %eof);
yk04   wprevyesno = puoyesno;

       // PML Line:967*
       puoyesno = optcpmt;

       // PML Line:968*
       if (RS006_ = '1');

        // PML Line:969*
        RS006_ = UpdateRcd_('RKWPUOPT');
      //AECP-3116   Start
        //If ( puoyesno <> wprevyesno);
        Exec Sql
          insert into klsyschg(KL_USERID,KL_ROLEID,KL_FIELDCHG,KL_VALBCHG,
                      KL_VALACHG,CREATE_USER_NAME)
          values(:userid, :wloggedRid, :puotype, :wprevyesno, :puoyesno,:puid);
       // EndIf;
      //AECP-3116   End

        // PML Line:970*
       else;

        // PML Line:971*
        WRITE RKWPUOPT;
        RS006_ = RcdSts2_('WRTRCD': %error: %found: %eof);
      //AECP-3116   Start
        Exec sql
          insert into klsyschg(KL_USERID,KL_ROLEID,KL_FIELDCHG,KL_VALBCHG,
                      KL_VALACHG, CREATE_USER_NAME)
        values(:userid, :wloggedRid, :puotype, '' , :puoyesno,:puid);
      //AECP-3116   End
       endif;

       // PML Line:975*
       puatype = 'APPROVAL_SCORE';

       // PML Line:976*
       AM002_ = CV_BYKEY;
       CHAIN(E) DL002_ RKWPULOC;
       RS002_ = RcdSts2_('GETRCD': %error: %found: %eof);

       // PML Line:977*
       PUAAMT = APPROVAL_SCORE;

       // PML Line:978*
       if (RS002_ = '1');

        // PML Line:979*
        RS002_ = UpdateRcd_('RKWPULOC');

        // PML Line:980*
       else;

        // PML Line:981*
        WRITE RKWPULOC;
        RS002_ = RcdSts2_('WRTRCD': %error: %found: %eof);
       endif;

       // PML Line:983*
       puatype = 'APPROVAL_DRATIO  ';

       // PML Line:984*
       AM002_ = CV_BYKEY;
       CHAIN(E) DL002_ RKWPULOC;
       RS002_ = RcdSts2_('GETRCD': %error: %found: %eof);

       // PML Line:985*
       PUAAMT = APPROVAL_DRAT;

       // PML Line:986*
       if (RS002_ = '1');

        // PML Line:987*
        RS002_ = UpdateRcd_('RKWPULOC');

        // PML Line:988*
       else;

        // PML Line:989*
        WRITE RKWPULOC;
        RS002_ = RcdSts2_('WRTRCD': %error: %found: %eof);
       endif;

       // PML Line:991*
       puatype = 'APPROVAL_GROSS';

       // PML Line:992*
       AM002_ = CV_BYKEY;
       CHAIN(E) DL002_ RKWPULOC;
       RS002_ = RcdSts2_('GETRCD': %error: %found: %eof);

       // PML Line:993*
       PUAAMT = APPROVAL_GROSS;

       // PML Line:994*
       if (RS002_ = '1');

        // PML Line:995*
        RS002_ = UpdateRcd_('RKWPULOC');

        // PML Line:996*
       else;

        // PML Line:997*
        WRITE RKWPULOC;
        RS002_ = RcdSts2_('WRTRCD': %error: %found: %eof);
       endif;

       // PML Line:999*
       puatype = 'APPROVAL_TIF+TR';

       // PML Line:1000*
       AM002_ = CV_BYKEY;
       CHAIN(E) DL002_ RKWPULOC;
       RS002_ = RcdSts2_('GETRCD': %error: %found: %eof);

       // PML Line:1001*
       PUAAMT = APPROVAL_TIFTR;

       // PML Line:1002*
       if (RS002_ = '1');

        // PML Line:1003*
        RS002_ = UpdateRcd_('RKWPULOC');

        // PML Line:1004*
       else;

        // PML Line:1005*
        WRITE RKWPULOC;
        RS002_ = RcdSts2_('WRTRCD': %error: %found: %eof);
       endif;

       // PML Line:1007*
       puatype = 'APPROVAL_REVAMT    ';

       // PML Line:1008*
       AM002_ = CV_BYKEY;
       CHAIN(E) DL002_ RKWPULOC;
       RS002_ = RcdSts2_('GETRCD': %error: %found: %eof);

       // PML Line:1009*
       PUAAMT = APPROVAL_RAMT;

       // PML Line:1010*
       if (RS002_ = '1');

        // PML Line:1011*
        RS002_ = UpdateRcd_('RKWPULOC');

        // PML Line:1012*
       else;

        // PML Line:1013*
        WRITE RKWPULOC;
        RS002_ = RcdSts2_('WRTRCD': %error: %found: %eof);
       endif;

       // PML Line:1015*
       puatype = 'APPROVAL_REVAVAIL    ';

       // PML Line:1016*
       AM002_ = CV_BYKEY;
       CHAIN(E) DL002_ RKWPULOC;
       RS002_ = RcdSts2_('GETRCD': %error: %found: %eof);

       // PML Line:1017*
       PUAAMT = APPROVAL_RAVL;

       // PML Line:1018*
       if (RS002_ = '1');

        // PML Line:1019*
        RS002_ = UpdateRcd_('RKWPULOC');

        // PML Line:1020*
       else;

        // PML Line:1021*
        WRITE RKWPULOC;
        RS002_ = RcdSts2_('WRTRCD': %error: %found: %eof);
       endif;

       // PML Line:1023*
       puatype = 'APPROVAL_TRADE30    ';

       // PML Line:1024*
       AM002_ = CV_BYKEY;
       CHAIN(E) DL002_ RKWPULOC;
       RS002_ = RcdSts2_('GETRCD': %error: %found: %eof);

       // PML Line:1025*
       PUAAMT = APPROVAL_T30;

       // PML Line:1026*
       if (RS002_ = '1');

        // PML Line:1027*
        RS002_ = UpdateRcd_('RKWPULOC');

        // PML Line:1028*
       else;

        // PML Line:1029*
        WRITE RKWPULOC;
        RS002_ = RcdSts2_('WRTRCD': %error: %found: %eof);
       endif;

       // PML Line:1031*
       puatype = 'APPROVAL_TRADE60    ';

       // PML Line:1032*
       AM002_ = CV_BYKEY;
       CHAIN(E) DL002_ RKWPULOC;
       RS002_ = RcdSts2_('GETRCD': %error: %found: %eof);

       // PML Line:1033*
       PUAAMT = APPROVAL_T60;

       // PML Line:1034*
       if (RS002_ = '1');

        // PML Line:1035*
        RS002_ = UpdateRcd_('RKWPULOC');

        // PML Line:1036*
       else;

        // PML Line:1037*
        WRITE RKWPULOC;
        RS002_ = RcdSts2_('WRTRCD': %error: %found: %eof);
       endif;

       // PML Line:1039*
       puatype = 'APPROVAL_TRADE90    ';

       // PML Line:1040*
       AM002_ = CV_BYKEY;
       CHAIN(E) DL002_ RKWPULOC;
       RS002_ = RcdSts2_('GETRCD': %error: %found: %eof);

       // PML Line:1041*
       PUAAMT = APPROVAL_T90;

       // PML Line:1042*
       if (RS002_ = '1');

        // PML Line:1043*
        RS002_ = UpdateRcd_('RKWPULOC');

        // PML Line:1044*
       else;

        // PML Line:1045*
        WRITE RKWPULOC;
        RS002_ = RcdSts2_('WRTRCD': %error: %found: %eof);
       endif;

       // PML Line:1047*
       puatype = 'APPROVAL_BANKMO        ';

       // PML Line:1048*
       AM002_ = CV_BYKEY;
       CHAIN(E) DL002_ RKWPULOC;
       RS002_ = RcdSts2_('GETRCD': %error: %found: %eof);

       // PML Line:1049*
       PUAAMT = APPROVAL_BKMO;

       // PML Line:1050*
       if (RS002_ = '1');

        // PML Line:1051*
        RS002_ = UpdateRcd_('RKWPULOC');

        // PML Line:1052*
       else;

        // PML Line:1053*
        WRITE RKWPULOC;
        RS002_ = RcdSts2_('WRTRCD': %error: %found: %eof);
       endif;

       // PML Line:1055*
       puotype = 'APPROVAL_RENT';

       // PML Line:1056*
       AM006_ = CV_BYKEY;
       CHAIN(E) DL006_ RKWPUOPT;
       RS006_ = RcdSts2_('GETRCD': %error: %found: %eof);
yk04   wprevyesno = puoyesno;

       // PML Line:1057*
       puoyesno = approval_r;

       // PML Line:1058*
       if (RS006_ = '1');

        // PML Line:1059*
        RS006_ = UpdateRcd_('RKWPUOPT');
      //AECP-3116   Start
        //If ( puoyesno <> wprevyesno);
        Exec Sql
          insert into klsyschg(KL_USERID,KL_ROLEID,KL_FIELDCHG,KL_VALBCHG,
                      KL_VALACHG,CREATE_USER_NAME)
          values(:userid, :wloggedRid, :puotype, :wprevyesno, :puoyesno,:puid);
        //EndIf;
      //AECP-3116   End

        // PML Line:1060*
       else;

        // PML Line:1061*
        WRITE RKWPUOPT;
        RS006_ = RcdSts2_('WRTRCD': %error: %found: %eof);
      //AECP-3116   Start
        Exec sql
          insert into klsyschg(KL_USERID,KL_ROLEID,KL_FIELDCHG,KL_VALBCHG,
                      KL_VALACHG, CREATE_USER_NAME)
        values(:userid, :wloggedRid, :puotype, '' , :puoyesno,:puid);
      //AECP-3116   End
       endif;

       // PML Line:1063*
       puotype = 'POSTPMT';

       // PML Line:1064*
       AM006_ = CV_BYKEY;
       CHAIN(E) DL006_ RKWPUOPT;
       RS006_ = RcdSts2_('GETRCD': %error: %found: %eof);
yk04   wprevyesno = puoyesno;

       // PML Line:1065*
       puoyesno = postpmt;

       // PML Line:1066*
       if (RS006_ = '1');

        // PML Line:1067*
        RS006_ = UpdateRcd_('RKWPUOPT');
      //AECP-3116   Start
        //If ( puoyesno <> wprevyesno);
        Exec Sql
          insert into klsyschg(KL_USERID,KL_ROLEID,KL_FIELDCHG,KL_VALBCHG,
                      KL_VALACHG,CREATE_USER_NAME)
          values(:userid, :wloggedRid, :puotype, :wprevyesno, :puoyesno,:puid);
       // EndIf;
      //AECP-3116   End

        // PML Line:1068*
       else;

        // PML Line:1069*
        WRITE RKWPUOPT;
        RS006_ = RcdSts2_('WRTRCD': %error: %found: %eof);
      //AECP-3116   Start
        Exec sql
          insert into klsyschg(KL_USERID,KL_ROLEID,KL_FIELDCHG,KL_VALBCHG,
                      KL_VALACHG, CREATE_USER_NAME)
        values(:userid, :wloggedRid, :puotype, '' , :puoyesno,:puid);
      //AECP-3116   End
       endif;

       // PML Line:1071*
       puotype = 'SPECRES';

       // PML Line:1072*
       AM006_ = CV_BYKEY;
       CHAIN(E) DL006_ RKWPUOPT;
       RS006_ = RcdSts2_('GETRCD': %error: %found: %eof);
yk04   wprevyesno = puoyesno;

       // PML Line:1073*
       puoyesno = specres;

       // PML Line:1074*
       if (RS006_ = '1');

        // PML Line:1075*
        RS006_ = UpdateRcd_('RKWPUOPT');
      //AECP-3116   Start
        //If ( puoyesno <> wprevyesno);
        Exec Sql
          insert into klsyschg(KL_USERID,KL_ROLEID,KL_FIELDCHG,KL_VALBCHG,
                      KL_VALACHG,CREATE_USER_NAME)
          values(:userid, :wloggedRid, :puotype, :wprevyesno, :puoyesno,:puid);
        //EndIf;
      //AECP-3116   End

        // PML Line:1076*
       else;

        // PML Line:1077*
        WRITE RKWPUOPT;
        RS006_ = RcdSts2_('WRTRCD': %error: %found: %eof);
      //AECP-3116   Start
        Exec sql
          insert into klsyschg(KL_USERID,KL_ROLEID,KL_FIELDCHG,KL_VALBCHG,
                      KL_VALACHG, CREATE_USER_NAME)
        values(:userid, :wloggedRid, :puotype, '' , :puoyesno,:puid);
      //AECP-3116   End
       endif;

       // PML Line:1080*
       puotype = 'TRANSOR';

       // PML Line:1081*
       AM006_ = CV_BYKEY;
       CHAIN(E) DL006_ RKWPUOPT;
       RS006_ = RcdSts2_('GETRCD': %error: %found: %eof);
yk04   wprevyesno = puoyesno;

       // PML Line:1082*
       puoyesno = transor;

       // PML Line:1083*
       if (RS006_ = '1');

        // PML Line:1084*
        RS006_ = UpdateRcd_('RKWPUOPT');
      //AECP-3116   Start
        //If ( puoyesno <> wprevyesno);
        Exec Sql
          insert into klsyschg(KL_USERID,KL_ROLEID,KL_FIELDCHG,KL_VALBCHG,
                      KL_VALACHG,CREATE_USER_NAME)
          values(:userid, :wloggedRid, :puotype, :wprevyesno, :puoyesno,:puid);
        //EndIf;
      //AECP-3116   End

        // PML Line:1085*
       else;

        // PML Line:1086*
        WRITE RKWPUOPT;
        RS006_ = RcdSts2_('WRTRCD': %error: %found: %eof);
      //AECP-3116   Start
        Exec sql
          insert into klsyschg(KL_USERID,KL_ROLEID,KL_FIELDCHG,KL_VALBCHG,
                      KL_VALACHG, CREATE_USER_NAME)
        values(:userid, :wloggedRid, :puotype, '' , :puoyesno,:puid);
      //AECP-3116   End
       endif;

       // PML Line:1088*
       puotype = 'REVPMT';

       // PML Line:1089*
       AM006_ = CV_BYKEY;
       CHAIN(E) DL006_ RKWPUOPT;
       RS006_ = RcdSts2_('GETRCD': %error: %found: %eof);
yk04   wprevyesno = puoyesno;

       // PML Line:1090*
       puoyesno = revpmt;

       // PML Line:1091*
       if (RS006_ = '1');

        // PML Line:1092*
        RS006_ = UpdateRcd_('RKWPUOPT');

      //AECP-3116   Start
        //If ( puoyesno <> wprevyesno);
        Exec Sql
          insert into klsyschg(KL_USERID,KL_ROLEID,KL_FIELDCHG,KL_VALBCHG,
                      KL_VALACHG,CREATE_USER_NAME)
          values(:userid, :wloggedRid, :puotype, :wprevyesno, :puoyesno,:puid);
        //EndIf;
      //AECP-3116   End
        // PML Line:1093*
       else;

        // PML Line:1094*
        WRITE RKWPUOPT;
        RS006_ = RcdSts2_('WRTRCD': %error: %found: %eof);
      //AECP-3116   Start
        Exec sql
          insert into klsyschg(KL_USERID,KL_ROLEID,KL_FIELDCHG,KL_VALBCHG,
                      KL_VALACHG, CREATE_USER_NAME)
        values(:userid, :wloggedRid, :puotype, '' , :puoyesno,:puid);
      //AECP-3116   End
       endif;

       // PML Line:1096*
       puotype = 'WAIVEFEE';

       // PML Line:1097*
       AM006_ = CV_BYKEY;
       CHAIN(E) DL006_ RKWPUOPT;
       RS006_ = RcdSts2_('GETRCD': %error: %found: %eof);
yk04   wprevyesno = puoyesno;

       // PML Line:1098*
       puoyesno = waivefee;

       // PML Line:1099*
       if (RS006_ = '1');

        // PML Line:1100*
        RS006_ = UpdateRcd_('RKWPUOPT');
      //AECP-3116   Start
        //If ( puoyesno <> wprevyesno);
        Exec Sql
          insert into klsyschg(KL_USERID,KL_ROLEID,KL_FIELDCHG,KL_VALBCHG,
                      KL_VALACHG,CREATE_USER_NAME)
          values(:userid, :wloggedRid, :puotype, :wprevyesno, :puoyesno,:puid);
       // EndIf;
      //AECP-3116   End

        // PML Line:1101*
       else;

        // PML Line:1102*
        WRITE RKWPUOPT;
        RS006_ = RcdSts2_('WRTRCD': %error: %found: %eof);
      //AECP-3116   Start
        Exec sql
          insert into klsyschg(KL_USERID,KL_ROLEID,KL_FIELDCHG,KL_VALBCHG,
                      KL_VALACHG, CREATE_USER_NAME)
        values(:userid, :wloggedRid, :puotype, '' , :puoyesno,:puid);
      //AECP-3116   End
       endif;

       // PML Line:1104*
       puotype = 'CHGDUE';

       // PML Line:1105*
       AM006_ = CV_BYKEY;
       CHAIN(E) DL006_ RKWPUOPT;
       RS006_ = RcdSts2_('GETRCD': %error: %found: %eof);
yk04   wprevyesno = puoyesno;

       // PML Line:1106*
       puoyesno = chgdue;

       // PML Line:1107*
       if (RS006_ = '1');

        // PML Line:1108*
        RS006_ = UpdateRcd_('RKWPUOPT');
      //AECP-3116   Start
        //If ( puoyesno <> wprevyesno);
        Exec Sql
          insert into klsyschg(KL_USERID,KL_ROLEID,KL_FIELDCHG,KL_VALBCHG,
                      KL_VALACHG,CREATE_USER_NAME)
          values(:userid, :wloggedRid, :puotype, :wprevyesno, :puoyesno,:puid);
       // EndIf;
      //AECP-3116   End

        // PML Line:1109*
       else;

        // PML Line:1110*
        WRITE RKWPUOPT;
        RS006_ = RcdSts2_('WRTRCD': %error: %found: %eof);
      //AECP-3116   Start
        Exec sql
          insert into klsyschg(KL_USERID,KL_ROLEID,KL_FIELDCHG,KL_VALBCHG,
                      KL_VALACHG, CREATE_USER_NAME)
        values(:userid, :wloggedRid, :puotype, '' , :puoyesno,:puid);
      //AECP-3116   End
       endif;

       // PML Line:1112*
       puotype = 'CHGRATE';

       // PML Line:1113*
       AM006_ = CV_BYKEY;
       CHAIN(E) DL006_ RKWPUOPT;
       RS006_ = RcdSts2_('GETRCD': %error: %found: %eof);
yk04   wprevyesno = puoyesno;

       // PML Line:1114*
       puoyesno = chgrate;

       // PML Line:1115*
       if (RS006_ = '1');

        // PML Line:1116*
        RS006_ = UpdateRcd_('RKWPUOPT');
      //AECP-3116   Start
        //If ( puoyesno <> wprevyesno);
        Exec Sql
          insert into klsyschg(KL_USERID,KL_ROLEID,KL_FIELDCHG,KL_VALBCHG,
                      KL_VALACHG,CREATE_USER_NAME)
          values(:userid, :wloggedRid, :puotype, :wprevyesno, :puoyesno,:puid);
        //EndIf;
      //AECP-3116   End

        // PML Line:1117*
       else;

        // PML Line:1118*
        WRITE RKWPUOPT;
        RS006_ = RcdSts2_('WRTRCD': %error: %found: %eof);
      //AECP-3116   Start
        Exec sql
          insert into klsyschg(KL_USERID,KL_ROLEID,KL_FIELDCHG,KL_VALBCHG,
                      KL_VALACHG, CREATE_USER_NAME)
        values(:userid, :wloggedRid, :puotype, '' , :puoyesno,:puid);
      //AECP-3116   End
       endif;

       // PML Line:1120*
       puotype = 'CHGAMT';

       // PML Line:1121*
       AM006_ = CV_BYKEY;
       CHAIN(E) DL006_ RKWPUOPT;
       RS006_ = RcdSts2_('GETRCD': %error: %found: %eof);
yk04   wprevyesno = puoyesno;

       // PML Line:1122*
       puoyesno = chgamt;

       // PML Line:1123*
       if (RS006_ = '1');

        // PML Line:1124*
        RS006_ = UpdateRcd_('RKWPUOPT');
      //AECP-3116   Start
        //If ( puoyesno <> wprevyesno);
        Exec Sql
          insert into klsyschg(KL_USERID,KL_ROLEID,KL_FIELDCHG,KL_VALBCHG,
                      KL_VALACHG,CREATE_USER_NAME)
          values(:userid, :wloggedRid, :puotype, :wprevyesno, :puoyesno,:puid);
        //EndIf;
      //AECP-3116   End

        // PML Line:1125*
       else;

        // PML Line:1126*
        WRITE RKWPUOPT;
        RS006_ = RcdSts2_('WRTRCD': %error: %found: %eof);
      //AECP-3116   Start
        Exec sql
          insert into klsyschg(KL_USERID,KL_ROLEID,KL_FIELDCHG,KL_VALBCHG,
                      KL_VALACHG, CREATE_USER_NAME)
        values(:userid, :wloggedRid, :puotype, '' , :puoyesno,:puid);
      //AECP-3116   End
       endif;

       // PML Line:1128*
       puotype = 'ADDDLR';

       // PML Line:1129*
       AM006_ = CV_BYKEY;
       CHAIN(E) DL006_ RKWPUOPT;
       RS006_ = RcdSts2_('GETRCD': %error: %found: %eof);
yk04   wprevyesno = puoyesno;

       // PML Line:1130*
       puoyesno = adddlr;

       // PML Line:1131*
       if (RS006_ = '1');

        // PML Line:1132*
        RS006_ = UpdateRcd_('RKWPUOPT');
      //AECP-3116   Start
        //If ( puoyesno <> wprevyesno);
        Exec Sql
          insert into klsyschg(KL_USERID,KL_ROLEID,KL_FIELDCHG,KL_VALBCHG,
                      KL_VALACHG,CREATE_USER_NAME)
          values(:userid, :wloggedRid, :puotype, :wprevyesno, :puoyesno,:puid);
        //EndIf;
      //AECP-3116   End

        // PML Line:1133*
       else;

        // PML Line:1134*
        WRITE RKWPUOPT;
        RS006_ = RcdSts2_('WRTRCD': %error: %found: %eof);
      //AECP-3116   Start
        Exec sql
          insert into klsyschg(KL_USERID,KL_ROLEID,KL_FIELDCHG,KL_VALBCHG,
                      KL_VALACHG, CREATE_USER_NAME)
        values(:userid, :wloggedRid, :puotype, '' , :puoyesno,:puid);
      //AECP-3116   End
       endif;

       // PML Line:1136*
       puotype = 'EDITDLR';

       // PML Line:1137*
       AM006_ = CV_BYKEY;
       CHAIN(E) DL006_ RKWPUOPT;
       RS006_ = RcdSts2_('GETRCD': %error: %found: %eof);
yk04   wprevyesno = puoyesno;

       // PML Line:1138*
       puoyesno = editdlr;

       // PML Line:1139*
       if (RS006_ = '1');

        // PML Line:1140*
        RS006_ = UpdateRcd_('RKWPUOPT');

      //AECP-3116   Start
        //If ( puoyesno <> wprevyesno);
        Exec Sql
          insert into klsyschg(KL_USERID,KL_ROLEID,KL_FIELDCHG,KL_VALBCHG,
                      KL_VALACHG,CREATE_USER_NAME)
          values(:userid, :wloggedRid, :puotype, :wprevyesno, :puoyesno,:puid);
       // EndIf;
      //AECP-3116   End
        // PML Line:1141*
       else;

        // PML Line:1142*
        WRITE RKWPUOPT;
        RS006_ = RcdSts2_('WRTRCD': %error: %found: %eof);
      //AECP-3116   Start
        Exec sql
          insert into klsyschg(KL_USERID,KL_ROLEID,KL_FIELDCHG,KL_VALBCHG,
                      KL_VALACHG, CREATE_USER_NAME)
        values(:userid, :wloggedRid, :puotype, '' , :puoyesno,:puid);
      //AECP-3116   End
       endif;

       // PML Line:1144*
       puotype = 'ADDPGM';

       // PML Line:1145*
       AM006_ = CV_BYKEY;
       CHAIN(E) DL006_ RKWPUOPT;
       RS006_ = RcdSts2_('GETRCD': %error: %found: %eof);
yk04   wprevyesno = puoyesno;

       // PML Line:1146*
       puoyesno = addpgm;

       // PML Line:1147*
       if (RS006_ = '1');

        // PML Line:1148*
        RS006_ = UpdateRcd_('RKWPUOPT');
      //AECP-3116   Start
        //If ( puoyesno <> wprevyesno);
        Exec Sql
          insert into klsyschg(KL_USERID,KL_ROLEID,KL_FIELDCHG,KL_VALBCHG,
                      KL_VALACHG,CREATE_USER_NAME)
          values(:userid, :wloggedRid, :puotype, :wprevyesno, :puoyesno,:puid);
       // EndIf;
      //AECP-3116   End

        // PML Line:1149*
       else;

        // PML Line:1150*
        WRITE RKWPUOPT;
        RS006_ = RcdSts2_('WRTRCD': %error: %found: %eof);
      //AECP-3116   Start
        Exec sql
          insert into klsyschg(KL_USERID,KL_ROLEID,KL_FIELDCHG,KL_VALBCHG,
                      KL_VALACHG, CREATE_USER_NAME)
        values(:userid, :wloggedRid, :puotype, '' , :puoyesno,:puid);
      //AECP-3116   End
       endif;

       // PML Line:1152*
       puotype = 'EDITPGM';

       // PML Line:1153*
       AM006_ = CV_BYKEY;
       CHAIN(E) DL006_ RKWPUOPT;
       RS006_ = RcdSts2_('GETRCD': %error: %found: %eof);
yk04   wprevyesno = puoyesno;

       // PML Line:1154*
       puoyesno = editpgm;

       // PML Line:1155*
       if (RS006_ = '1');

        // PML Line:1156*
        RS006_ = UpdateRcd_('RKWPUOPT');
      //AECP-3116   Start
        //If ( puoyesno <> wprevyesno);
        Exec Sql
          insert into klsyschg(KL_USERID,KL_ROLEID,KL_FIELDCHG,KL_VALBCHG,
                      KL_VALACHG,CREATE_USER_NAME)
          values(:userid, :wloggedRid, :puotype, :wprevyesno, :puoyesno,:puid);
        //EndIf;
      //AECP-3116   End

        // PML Line:1157*
       else;

        // PML Line:1158*
        WRITE RKWPUOPT;
        RS006_ = RcdSts2_('WRTRCD': %error: %found: %eof);
      //AECP-3116   Start
        Exec sql
          insert into klsyschg(KL_USERID,KL_ROLEID,KL_FIELDCHG,KL_VALBCHG,
                      KL_VALACHG, CREATE_USER_NAME)
        values(:userid, :wloggedRid, :puotype, '' , :puoyesno,:puid);
      //AECP-3116   End
       endif;

       // PML Line:1161*
       puotype = 'SPLITPMT';

       // PML Line:1162*
       AM006_ = CV_BYKEY;
       CHAIN(E) DL006_ RKWPUOPT;
       RS006_ = RcdSts2_('GETRCD': %error: %found: %eof);
yk04   wprevyesno = puoyesno;

       // PML Line:1163*
       puoyesno = splitpmt;

       // PML Line:1164*
       if (RS006_ = '1');

        // PML Line:1165*
        RS006_ = UpdateRcd_('RKWPUOPT');
      //AECP-3116   Start
        //If ( puoyesno <> wprevyesno);
        Exec Sql
          insert into klsyschg(KL_USERID,KL_ROLEID,KL_FIELDCHG,KL_VALBCHG,
                      KL_VALACHG,CREATE_USER_NAME)
          values(:userid, :wloggedRid, :puotype, :wprevyesno, :puoyesno,:puid);
        //EndIf;
      //AECP-3116   End

        // PML Line:1166*
       else;

        // PML Line:1167*
        WRITE RKWPUOPT;
        RS006_ = RcdSts2_('WRTRCD': %error: %found: %eof);
      //AECP-3116   Start
        Exec sql
          insert into klsyschg(KL_USERID,KL_ROLEID,KL_FIELDCHG,KL_VALBCHG,
                      KL_VALACHG, CREATE_USER_NAME)
        values(:userid, :wloggedRid, :puotype, '' , :puoyesno,:puid);
      //AECP-3116   End
       endif;

       // PML Line:1170*
       puotype = 'DELETEDOC';

       // PML Line:1171*
       AM006_ = CV_BYKEY;
       CHAIN(E) DL006_ RKWPUOPT;
       RS006_ = RcdSts2_('GETRCD': %error: %found: %eof);
yk04   wprevyesno = puoyesno;

       // PML Line:1172*
       puoyesno = deletedoc;

       // PML Line:1173*
       if (RS006_ = '1');

        // PML Line:1174*
        RS006_ = UpdateRcd_('RKWPUOPT');
      //AECP-3116   Start
        //If ( puoyesno <> wprevyesno);
        Exec Sql
          insert into klsyschg(KL_USERID,KL_ROLEID,KL_FIELDCHG,KL_VALBCHG,
                      KL_VALACHG,CREATE_USER_NAME)
          values(:userid, :wloggedRid, :puotype, :wprevyesno, :puoyesno,:puid);
       // EndIf;
      //AECP-3116   End

        // PML Line:1175*
       else;

        // PML Line:1176*
        WRITE RKWPUOPT;
        RS006_ = RcdSts2_('WRTRCD': %error: %found: %eof);
      //AECP-3116   Start
        Exec sql
          insert into klsyschg(KL_USERID,KL_ROLEID,KL_FIELDCHG,KL_VALBCHG,
                      KL_VALACHG, CREATE_USER_NAME)
        values(:userid, :wloggedRid, :puotype, '' , :puoyesno,:puid);
      //AECP-3116   End
       endif;

       // PML Line:1178*
       puotype = 'DELETENOTE';

       // PML Line:1179*
       AM006_ = CV_BYKEY;
       CHAIN(E) DL006_ RKWPUOPT;
       RS006_ = RcdSts2_('GETRCD': %error: %found: %eof);
yk04   wprevyesno = puoyesno;

       // PML Line:1180*
       puoyesno = deletenote;

       // PML Line:1181*
       if (RS006_ = '1');

        // PML Line:1182*
        RS006_ = UpdateRcd_('RKWPUOPT');
      //AECP-3116   Start
        //If ( puoyesno <> wprevyesno);
        Exec Sql
          insert into klsyschg(KL_USERID,KL_ROLEID,KL_FIELDCHG,KL_VALBCHG,
                      KL_VALACHG,CREATE_USER_NAME)
          values(:userid, :wloggedRid, :puotype, :wprevyesno, :puoyesno,:puid);
        //EndIf;
      //AECP-3116   End

        // PML Line:1183*
       else;

        // PML Line:1184*
        WRITE RKWPUOPT;
        RS006_ = RcdSts2_('WRTRCD': %error: %found: %eof);
      //AECP-3116   Start
        Exec sql
          insert into klsyschg(KL_USERID,KL_ROLEID,KL_FIELDCHG,KL_VALBCHG,
                      KL_VALACHG, CREATE_USER_NAME)
        values(:userid, :wloggedRid, :puotype, '' , :puoyesno,:puid);
      //AECP-3116   End
       endif;

       // PML Line:1186*
       puotype = 'DELETESTIP';

       // PML Line:1187*
       AM006_ = CV_BYKEY;
       CHAIN(E) DL006_ RKWPUOPT;
       RS006_ = RcdSts2_('GETRCD': %error: %found: %eof);
yk04   wprevyesno = puoyesno;

       // PML Line:1188*
       puoyesno = deletestip;

       // PML Line:1189*
       if (RS006_ = '1');

        // PML Line:1190*
        RS006_ = UpdateRcd_('RKWPUOPT');

      //AECP-3116   Start
        //if ( puoyesno <> wprevyesno);
        Exec Sql
          insert into klsyschg(KL_USERID,KL_ROLEID,KL_FIELDCHG,KL_VALBCHG,
                      KL_VALACHG,CREATE_USER_NAME)
          values(:userid, :wloggedRid, :puotype, :wprevyesno, :puoyesno,:puid);
        //EndIf;
      //AECP-3116   End
        // PML Line:1191*
       else;

        // PML Line:1192*
        WRITE RKWPUOPT;
        RS006_ = RcdSts2_('WRTRCD': %error: %found: %eof);
      //AECP-3116   Start
        Exec sql
          insert into klsyschg(KL_USERID,KL_ROLEID,KL_FIELDCHG,KL_VALBCHG,
                      KL_VALACHG, CREATE_USER_NAME)
        values(:userid, :wloggedRid, :puotype, '' , :puoyesno,:puid);
      //AECP-3116   End
       endif;

       // PML Line:1194*
       puotype = 'TITLEAMORT';

       // PML Line:1195*
       AM006_ = CV_BYKEY;
       CHAIN(E) DL006_ RKWPUOPT;
       RS006_ = RcdSts2_('GETRCD': %error: %found: %eof);
yk04   wprevyesno = puoyesno;

       // PML Line:1196*
       puoyesno = titleamort;

       // PML Line:1197*
       if (RS006_ = '1');

        // PML Line:1198*
        RS006_ = UpdateRcd_('RKWPUOPT');
      //AECP-3116   Start
        //If ( puoyesno <> wprevyesno);
        Exec Sql
          insert into klsyschg(KL_USERID,KL_ROLEID,KL_FIELDCHG,KL_VALBCHG,
                      KL_VALACHG,CREATE_USER_NAME)
          values(:userid, :wloggedRid, :puotype, :wprevyesno, :puoyesno,:puid);
        //EndIf;
      //AECP-3116   End

        // PML Line:1199*
       else;

        // PML Line:1200*
        WRITE RKWPUOPT;
        RS006_ = RcdSts2_('WRTRCD': %error: %found: %eof);
      //AECP-3116   Start
        Exec sql
          insert into klsyschg(KL_USERID,KL_ROLEID,KL_FIELDCHG,KL_VALBCHG,
                      KL_VALACHG, CREATE_USER_NAME)
        values(:userid, :wloggedRid, :puotype, '' , :puoyesno,:puid);
      //AECP-3116   End
       endif;

       // PML Line:1202*
       puotype = 'CHKIPADDR';

       // PML Line:1203*
       AM006_ = CV_BYKEY;
       CHAIN(E) DL006_ RKWPUOPT;
       RS006_ = RcdSts2_('GETRCD': %error: %found: %eof);
yk04   wprevyesno = puoyesno;

       // PML Line:1204*
       puoyesno = chkipaddr;

       // PML Line:1205*
       if (RS006_ = '1');

        // PML Line:1206*
        RS006_ = UpdateRcd_('RKWPUOPT');
      //AECP-3116   Start
        //If ( puoyesno <> wprevyesno);
        Exec Sql
          insert into klsyschg(KL_USERID,KL_ROLEID,KL_FIELDCHG,KL_VALBCHG,
                      KL_VALACHG,CREATE_USER_NAME)
          values(:userid, :wloggedRid, :puotype, :wprevyesno, :puoyesno,:puid);
        //EndIf;
      //AECP-3116   End

        // PML Line:1207*
       else;

        // PML Line:1208*
        WRITE RKWPUOPT;
        RS006_ = RcdSts2_('WRTRCD': %error: %found: %eof);
      //AECP-3116   Start
        Exec sql
          insert into klsyschg(KL_USERID,KL_ROLEID,KL_FIELDCHG,KL_VALBCHG,
                      KL_VALACHG, CREATE_USER_NAME)
        values(:userid, :wloggedRid, :puotype, '' , :puoyesno,:puid);
      //AECP-3116   End
       endif;

       // PML Line:1211*
       puotype = 'VIEWCALL';

       // PML Line:1212*
       AM006_ = CV_BYKEY;
       CHAIN(E) DL006_ RKWPUOPT;
       RS006_ = RcdSts2_('GETRCD': %error: %found: %eof);
yk04   wprevyesno = puoyesno;

       // PML Line:1213*
       puoyesno = viewcall;

       // PML Line:1214*
       if (RS006_ = '1');

        // PML Line:1215*
        RS006_ = UpdateRcd_('RKWPUOPT');
      //AECP-3116   Start
        //If ( puoyesno <> wprevyesno);
        Exec Sql
          insert into klsyschg(KL_USERID,KL_ROLEID,KL_FIELDCHG,KL_VALBCHG,
                      KL_VALACHG,CREATE_USER_NAME)
          values(:userid, :wloggedRid, :puotype, :wprevyesno, :puoyesno,:puid);
       // EndIf;
      //AECP-3116   End

        // PML Line:1216*
       else;

        // PML Line:1217*
        WRITE RKWPUOPT;
        RS006_ = RcdSts2_('WRTRCD': %error: %found: %eof);
      //AECP-3116   Start
        Exec sql
          insert into klsyschg(KL_USERID,KL_ROLEID,KL_FIELDCHG,KL_VALBCHG,
                      KL_VALACHG, CREATE_USER_NAME)
        values(:userid, :wloggedRid, :puotype, '' , :puoyesno,:puid);
      //AECP-3116   End
       endif;

       // PML Line:1220*
       puotype = 'VIEWLETT';

       // PML Line:1221*
       AM006_ = CV_BYKEY;
       CHAIN(E) DL006_ RKWPUOPT;
       RS006_ = RcdSts2_('GETRCD': %error: %found: %eof);
yk04   wprevyesno = puoyesno;

       // PML Line:1222*
       puoyesno = viewlett;

       // PML Line:1223*
       if (RS006_ = '1');

        // PML Line:1224*
        RS006_ = UpdateRcd_('RKWPUOPT');
      //AECP-3116   Start
        //If ( puoyesno <> wprevyesno);
        Exec Sql
          insert into klsyschg(KL_USERID,KL_ROLEID,KL_FIELDCHG,KL_VALBCHG,
                      KL_VALACHG,CREATE_USER_NAME)
          values(:userid, :wloggedRid, :puotype, :wprevyesno, :puoyesno,:puid);
        //EndIf;
      //AECP-3116   End

        // PML Line:1225*
       else;

        // PML Line:1226*
        WRITE RKWPUOPT;
        RS006_ = RcdSts2_('WRTRCD': %error: %found: %eof);
      //AECP-3116   Start
        Exec sql
          insert into klsyschg(KL_USERID,KL_ROLEID,KL_FIELDCHG,KL_VALBCHG,
                      KL_VALACHG, CREATE_USER_NAME)
        values(:userid, :wloggedRid, :puotype, '' , :puoyesno,:puid);
      //AECP-3116   End
       endif;

       // PML Line:1228*
       KW_UCLIENT = %dec(aton_(client:46:16):46:16);

       // PML Line:1229*
       AM005_ = CV_BYKEY;
       CHAIN(E) DL005_ RKWUSER;
       RS005_ = RcdSts2_('GETRCD': %error: %found: %eof);

       // PML Line:1230*
       kw_upass = getparm3_('kw_upass':'*OPT');

       // PML Line:1231*
       kw_uname = puname;

       // PML Line:1232*
       kw_uemail = puemail;

       // PML Line:1233*
       if (RS005_ = '1');

        // PML Line:1234*
        RS005_ = UpdateRcd_('RKWUSER');

        // PML Line:1235*
       else;

        // PML Line:1237*
        kw_uid = puid;

        // PML Line:1238*
        WRITE RKWUSER;
        RS005_ = RcdSts2_('WRTRCD': %error: %found: %eof);
       endif;

       // PML Line:1241*
       if (PULNO = 0);

        // PML Line:1242*
        PULNO = 1;
       endif;

       // PML Line:1244*
       AM003_ = CV_BYKEY;
       CHAIN(E) DL003_ RKWPUCASH;
       RS003_ = RcdSts2_('GETRCD': %error: %found: %eof);

       // PML Line:1245*
       PUCBAL = %dec(aton_( getparm3_('PUCBAL':'*OPT'):46:16):11:2);
       PUCLIM1 = %dec(aton_( getparm3_('PUCLIM1':'*OPT'):46:16):11:2);
       PUCLIM2 = %dec(aton_( getparm3_('PUCLIM2':'*OPT'):46:16):11:2);

       // PML Line:1246*
       if (RS003_ = '1');

        // PML Line:1247*
        RS003_ = UpdateRcd_('RKWPUCASH');

        // PML Line:1248*
       else;

        // PML Line:1249*
        WRITE RKWPUCASH;
        RS003_ = RcdSts2_('WRTRCD': %error: %found: %eof);
       endif;

       // PML Line:1251*
       PLNO = 0;

       // PML Line:1252*
       SETLL  DL007_ RKWPLBASE;
       RS007_ = RcdSts2_('POSRCD':%error:%equal:%eof);

       // PML Line:1253*
       READ(NE)  RKWPLBASE;
       RS007_ = RcdSts2_('GETNXTRCD':%error:%found:%eof);
       AM007_ = CV_ByKey;

       // PML Line:1254*
       dow (RS007_ = '1');

       // PML Line:1256*
       PULNO = PLNO;

       // PML Line:1257*
       AM004_ = CV_BYKEY;
       CHAIN(NE) DL004_ R__FMT01;
       RS004_ = RcdSts2_('GETRCD': %error: %found: %eof);

       // PML Line:1258*
       if (RS004_ <> '1');

        // PML Line:1260*
        WRITE R__FMT01;
        RS004_ = RcdSts2_('WRTRCD': %error: %found: %eof);
       endif;

       // PML Line:1261*
       READ(NE)  RKWPLBASE;
       RS007_ = RcdSts2_('GETNXTRCD':%error:%found:%eof);
       AM007_ = CV_ByKey;
       enddo;

       // PML Line:1265*
       Redirect2_( '?rrn=' + savedrrn:'*SAME':'rand');

       // PML Line:1266*
      /end-free
     c     *PSSR         begsr
     c                   endsr
     P                 E


       // PML Line:1269*

     P*---------------------------------------------------------------------
     P* puprofilebox0...            - User defined function
     P*---------------------------------------------------------------------
     P puprofilebox0...
     P                 B
     D puprofilebox0...
     D                 PI




      /free

       // PML Line:1271*
       boxtype = 'SYSTEM';

       // PML Line:1272*
       p_ztype = 'USERPROFILE';

       // PML Line:1273*
       boxname = 'PUPROFILE';

       // PML Line:1274*
       boxid = 'PUPROFILE';

       // PML Line:1275*
       boxselect = puprofile;

       // PML Line:1276*
       jvalidation = '';

       // PML Line:1277*
      /end-free
     C                   EVAL      QPGM__=%trim('KWWEB'     ) + '/' + 'SELBOX3'
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

       // PML Line:1279*
      /end-free
     c     *PSSR         begsr
     c                   endsr
     P                 E


       // PML Line:1283*

     P*---------------------------------------------------------------------
     P* prodbox0...                 - User defined function
     P*---------------------------------------------------------------------
     P prodbox0...
     P                 B
     D prodbox0...
     D                 PI




      /free

       // PML Line:1286*
       p_ztype = 'KWPPBASE';

       // PML Line:1287*
       boxname = 'PULNPROD';

       // PML Line:1288*
       boxid = 'PULNPROD';

       // PML Line:1289*
       boxselect = pulnprod;

       // PML Line:1290*
       boxtype = 'OTHER';

       // PML Line:1292*
      /end-free
     C                   EVAL      QPGM__=%trim('KWWEB'     ) + '/' + 'SELBOX3'
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

       // PML Line:1293*
      /end-free
     c     *PSSR         begsr
     c                   endsr
     P                 E


       // PML Line:1299*

     P*---------------------------------------------------------------------
     P* supbox0...                  - User defined function
     P*---------------------------------------------------------------------
     P supbox0...
     P                 B
     D supbox0...
     D                 PI




      /free

       // PML Line:1301*
       OutWeb_('<select name="SUP" id="SUP">');

       // PML Line:1302*
       OutWeb_('<option value="">-- Select User --</option>');

       // PML Line:1305*
 yk02  //supquery = 'SELECT PUID FROM KWPUBASE WHERE PUID <> ''' + puid + ''' A-
 yk02  //ND (PUPROFILE = ''ADMINISTRATOR'' OR PUPROFILE = ''SUPERVISOR'') ORDER-
 uk02  // BY PUID ASC';
 yk02  supquery = 'SELECT PUID FROM KWPUBASE WHERE PUID <> ''' + puid + ''' -
 yk02   ORDER BY PUID ASC';
      /end-free
     C/Exec SQL
     C+            Declare SUPS Scroll Cursor
     C+            For SUPS
     C/End-Exec
     C/Exec SQL
     C+            Prepare SUPS
     C+            From :supquery
     C/End-Exec
      /free
       if (sqlcod >= 0);
      /end-free
     C/Exec SQL
     C+            Open SUPS
     C/End-Exec
      /free
       endif;
      /end-free
     C/Exec SQL
     C+  FETCH NEXT FROM SUPS INTO :SUPPUID
     C/End-Exec
      /free

       // PML Line:1309*
       AM010_ = CV_BYKEY;
       CHAIN(NE) DL010_ R__FMT02;
       RS010_ = RcdSts2_('GETRCD': %error: %found: %eof);

       // PML Line:1310*
       dow ((((sqlcod <> 100)) and ((sqlcod >= 0))));

       // PML Line:1311*
       if (suppuid = psid);

        // PML Line:1312*
        OutWeb_(%trimr( '<option selected value="' + suppuid + '">' +
       suppuid + '</option>'));

        // PML Line:1313*
       else;

        // PML Line:1314*
        OutWeb_(%trimr( '<option value="' + suppuid + '">' + suppuid + '</opt-
       ion>'));
       endif;
      /end-free
     C/Exec SQL
     C+  FETCH NEXT FROM SUPS INTO :SUPPUID
     C/End-Exec
      /free
       enddo;
      /end-free
     C/Exec SQL
     C+  CLOSE SUPS
     C/End-Exec
      /free

       // PML Line:1320*
       OutWeb_('</select>');

       // PML Line:1321*
      /end-free
     c     *PSSR         begsr
     c                   endsr
     P                 E


       // PML Line:1323*


YK01    //Start YK01- AECP-2557
     P*---------------------------------------------------------------------
     P* rolbox0...                  - User defined function
     P*---------------------------------------------------------------------
     P rolbox0...
     P                 B
     D rolbox0...
     D                 PI



      /free

        wpuvalue = *zeros;
        exec sql
        select PUVALUE into :wpuvalue from KWPUOPT
        where PUID = :PUID and PUOTYPE = 'USERROLE';

       // PML Line:1301*
       OutWeb_('<select name="ROLES" id="ROLES">');

       // PML Line:1302*
       OutWeb_('<option value="">-- Select User Role --</option>');

       // PML Line:1305*
       supqry = 'SELECT RL_TITLE, RL_ROLEID FROM KWLROLE ORDER BY RL_TITLE';
      /end-free
     C/Exec SQL
     C+            Declare ROLES Scroll Cursor
     C+            For ROLES
     C/End-Exec
     C/Exec SQL
     C+            Prepare ROLES
     C+            From :supqry
     C/End-Exec
      /free
       if (sqlcod >= 0);
      /end-free
     C/Exec SQL
     C+            Open ROLES
     C/End-Exec
      /free
       endif;
      /end-free
     C/Exec SQL
     C+  FETCH NEXT FROM ROLES INTO :ROLEID, :wROLEID
     C/End-Exec
      /free

       // PML Line:1309*
       // PML Line:1310*
       dow ((((sqlcod <> 100)) and ((sqlcod >= 0))));

       // PML Line:1311*
       if (wpuvalue =  wROLEID);

        // PML Line:1312*
        OutWeb_('<option selected value="' + %trim(%editc(WROLEID:'P')) + '">'
          + ROLEID + '</option>');

        // PML Line:1313*
       else;

        // PML Line:1314*
        OutWeb_(%trimr( '<option value="' + %trim(%editc(WROLEID:'P')) + '">'
         + roleid + '</opt-ion>'));
       endif;
      /end-free
     C/Exec SQL
     C+  FETCH NEXT FROM ROLES INTO :ROLEID, :wROLEID
     C/End-Exec
      /free
       enddo;
      /end-free
     C/Exec SQL
     C+  CLOSE ROLES
     C/End-Exec
      /free

       // PML Line:1320*
       OutWeb_('</select>');

       // PML Line:1321*
      /end-free
     c     *PSSR         begsr
     c                   endsr
     P                 E


YK01    //End-YK01    AECP-2557
     P*---------------------------------------------------------------------
     P* depbox0...                  - User defined function
     P*---------------------------------------------------------------------
     P depbox0...
     P                 B
     D depbox0...
     D                 PI




      /free

       // PML Line:1324*
       OutWeb_('<select name="DEPARTMENT" id="DEPARTMENT">');

       // PML Line:1325*
       OutWeb_('<option value="">-- Select Department --</option>');
      /end-free
     C/Exec SQL
     C+  SELECT PUVALUE into :PUVALUE from KWPUOPT where PUID = :PUID and PUOTYP
     C+ E = 'DEPARTMENT'
     C/End-Exec
      /free
      /end-free
     C/Exec SQL
     C+  declare dep cursor for SELECT P_ZKEYN,P_ZDESC from KWP_DATA where P_ZTY
     C+ PE = 'DEPARTMENT'
     C/End-Exec
      /free
      /end-free
     C/Exec SQL
     C+  open dep
     C/End-Exec
      /free
      /end-free
     C/Exec SQL
     C+  FETCH NEXT FROM dep INTO :P_ZKEYN,:P_ZDESC
     C/End-Exec
      /free

       // PML Line:1333*
       dow ((((sqlcod <> 100)) and ((sqlcod >= 0))));

       // PML Line:1334*
       if (PUVALUE = P_ZKEYN);

        // PML Line:1335*
        OutWeb_(%trimr( '<option selected value="' + %trim(%editc(P_ZKEYN:'P'
       )) + '">' + p_zdesc + '</option>'));

        // PML Line:1336*
       else;

        // PML Line:1337*
        OutWeb_(%trimr( '<option value="' + %trim(%editc(P_ZKEYN:'P')) + '">'
        + p_zdesc + '</option>'));
       endif;
      /end-free
     C/Exec SQL
     C+  FETCH NEXT FROM dep INTO :P_ZKEYN,:P_ZDESC
     C/End-Exec
      /free
       enddo;
      /end-free
     C/Exec SQL
     C+  CLOSE dep
     C/End-Exec
      /free

       // PML Line:1343*
       OutWeb_('</select>');

       // PML Line:1344*
      /end-free
     c     *PSSR         begsr
     c                   endsr
     P                 E


       // PML Line:1346*

     P*---------------------------------------------------------------------
     P* locbox0...                  - User defined function
     P*---------------------------------------------------------------------
     P locbox0...
     P                 B
     D locbox0...
     D                 PI




      /free

       // PML Line:1349*
       p_ztype = 'KWPLBASE';

       // PML Line:1350*
       boxname = 'PULNO';

       // PML Line:1351*
       boxid = 'PULNO';

       // PML Line:1352*
       boxselect = %trim(%editc(PULNO:'P'));

       // PML Line:1353*
       boxtype = 'OTHER';

       // PML Line:1355*
      /end-free
     C                   EVAL      QPGM__=%trim('KWWEB'     ) + '/' + 'SELBOX3'
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

       // PML Line:1357*
      /end-free
     c     *PSSR         begsr
     c                   endsr
     P                 E


       // PML Line:1359*

     P*---------------------------------------------------------------------
     P* optcollbox0...              - User defined function
     P*---------------------------------------------------------------------
     P optcollbox0...
     P                 B
     D optcollbox0...
     D                 PI




      /free

       // PML Line:1361*
       boxtype = 'SYSTEM';

       // PML Line:1362*
       p_ztype = 'YESNO';

       // PML Line:1363*
       boxname = 'OPTCOLL';

       // PML Line:1364*
       boxid = 'OPTCOLL';

       // PML Line:1365*
       boxselect = optcoll;

       // PML Line:1366*
       jvalidation = '';

       // PML Line:1367*
      /end-free
     C                   EVAL      QPGM__=%trim('KWWEB'     ) + '/' + 'SELBOX3'
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

       // PML Line:1369*
      /end-free
     c     *PSSR         begsr
     c                   endsr
     P                 E


       // PML Line:1370*

     P*---------------------------------------------------------------------
     P* optascollbox0...            - User defined function
     P*---------------------------------------------------------------------
     P optascollbox0...
     P                 B
     D optascollbox0...
     D                 PI




      /free

       // PML Line:1372*
       boxtype = 'SYSTEM';

       // PML Line:1373*
       p_ztype = 'YESNO';

       // PML Line:1374*
       boxname = 'OPTASCOLL';

       // PML Line:1375*
       boxid = 'OPTASCOLL';

       // PML Line:1376*
       boxselect = optascoll;

       // PML Line:1377*
       jvalidation = '';

       // PML Line:1378*
      /end-free
     C                   EVAL      QPGM__=%trim('KWWEB'     ) + '/' + 'SELBOX3'
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

       // PML Line:1380*
      /end-free
     c     *PSSR         begsr
     c                   endsr
     P                 E


       // PML Line:1381*

     P*---------------------------------------------------------------------
     P* optadmcollbox0...           - User defined function
     P*---------------------------------------------------------------------
     P optadmcollbox0...
     P                 B
     D optadmcollbox0...
     D                 PI




      /free

       // PML Line:1383*
       boxtype = 'SYSTEM';

       // PML Line:1384*
       p_ztype = 'YESNO';

       // PML Line:1385*
       boxname = 'OPTADMCOLL';

       // PML Line:1386*
       boxid = 'OPTADMCOLL';

       // PML Line:1387*
       boxselect = optadmcoll;

       // PML Line:1388*
       jvalidation = '';

       // PML Line:1389*
      /end-free
     C                   EVAL      QPGM__=%trim('KWWEB'     ) + '/' + 'SELBOX3'
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

       // PML Line:1391*
      /end-free
     c     *PSSR         begsr
     c                   endsr
     P                 E


       // PML Line:1392*

     P*---------------------------------------------------------------------
     P* optapprovebox0...           - User defined function
     P*---------------------------------------------------------------------
     P optapprovebox0...
     P                 B
     D optapprovebox0...
     D                 PI




      /free

       // PML Line:1394*
       boxtype = 'SYSTEM';

       // PML Line:1395*
       p_ztype = 'YESNO';

       // PML Line:1396*
       boxname = 'OPTAPPROVE';

       // PML Line:1397*
       boxid = 'OPTAPPROVE';

       // PML Line:1398*
       boxselect = optapprove;

       // PML Line:1399*
       jvalidation = '';

       // PML Line:1400*
      /end-free
     C                   EVAL      QPGM__=%trim('KWWEB'     ) + '/' + 'SELBOX3'
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

       // PML Line:1402*
      /end-free
     c     *PSSR         begsr
     c                   endsr
     P                 E


       // PML Line:1404*

     P*---------------------------------------------------------------------
     P* optvoidbox0...              - User defined function
     P*---------------------------------------------------------------------
     P optvoidbox0...
     P                 B
     D optvoidbox0...
     D                 PI




      /free

       // PML Line:1406*
       boxtype = 'SYSTEM';

       // PML Line:1407*
       p_ztype = 'YESNO';

       // PML Line:1408*
       boxname = 'OPTVOID';

       // PML Line:1409*
       boxid = 'OPTVOID';

       // PML Line:1410*
       boxselect = optvoid;

       // PML Line:1411*
       jvalidation = '';

       // PML Line:1412*
      /end-free
     C                   EVAL      QPGM__=%trim('KWWEB'     ) + '/' + 'SELBOX3'
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

       // PML Line:1414*
      /end-free
     c     *PSSR         begsr
     c                   endsr
     P                 E


       // PML Line:1416*

     P*---------------------------------------------------------------------
     P* optrembox0...               - User defined function
     P*---------------------------------------------------------------------
     P optrembox0...
     P                 B
     D optrembox0...
     D                 PI




      /free

       // PML Line:1418*
       boxtype = 'SYSTEM';

       // PML Line:1419*
       p_ztype = 'YESNO';

       // PML Line:1420*
       boxname = 'OPTREM';

       // PML Line:1421*
       boxid = 'OPTREM';

       // PML Line:1422*
       boxselect = optrem;

       // PML Line:1423*
       jvalidation = '';

       // PML Line:1424*
      /end-free
     C                   EVAL      QPGM__=%trim('KWWEB'     ) + '/' + 'SELBOX3'
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

       // PML Line:1426*
      /end-free
     c     *PSSR         begsr
     c                   endsr
     P                 E


       // PML Line:1428*

     P*---------------------------------------------------------------------
     P* optassconbox0...            - User defined function
     P*---------------------------------------------------------------------
     P optassconbox0...
     P                 B
     D optassconbox0...
     D                 PI




      /free

       // PML Line:1430*
       boxtype = 'SYSTEM';

       // PML Line:1431*
       p_ztype = 'YESNO';

       // PML Line:1432*
       boxname = 'OPTASSCON';

       // PML Line:1433*
       boxid = 'OPTASSCON';

       // PML Line:1434*
       boxselect = optasscon;

       // PML Line:1435*
       jvalidation = '';

       // PML Line:1436*
      /end-free
     C                   EVAL      QPGM__=%trim('KWWEB'     ) + '/' + 'SELBOX3'
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

       // PML Line:1438*
      /end-free
     c     *PSSR         begsr
     c                   endsr
     P                 E


       // PML Line:1440*

     P*---------------------------------------------------------------------
     P* optmodbox0...               - User defined function
     P*---------------------------------------------------------------------
     P optmodbox0...
     P                 B
     D optmodbox0...
     D                 PI




      /free

       // PML Line:1442*
       boxtype = 'SYSTEM';

       // PML Line:1443*
       p_ztype = 'YESNO';

       // PML Line:1444*
       boxname = 'OPTMODIFY';

       // PML Line:1445*
       boxid = 'OPTMODIFY';

       // PML Line:1446*
       boxselect = optmodify;

       // PML Line:1447*
       jvalidation = '';

       // PML Line:1448*
      /end-free
     C                   EVAL      QPGM__=%trim('KWWEB'     ) + '/' + 'SELBOX3'
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

       // PML Line:1449*
      /end-free
     c     *PSSR         begsr
     c                   endsr
     P                 E


       // PML Line:1451*

     P*---------------------------------------------------------------------
     P* optjudgebox0...             - User defined function
     P*---------------------------------------------------------------------
     P optjudgebox0...
     P                 B
     D optjudgebox0...
     D                 PI




      /free

       // PML Line:1453*
       boxtype = 'SYSTEM';

       // PML Line:1454*
       p_ztype = 'YESNO';

       // PML Line:1455*
       boxname = 'OPTJUDGE';

       // PML Line:1456*
       boxid = 'OPTJUDGE';

       // PML Line:1457*
       boxselect = optjudge;

       // PML Line:1458*
       jvalidation = '';

       // PML Line:1459*
      /end-free
     C                   EVAL      QPGM__=%trim('KWWEB'     ) + '/' + 'SELBOX3'
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

       // PML Line:1461*
      /end-free
     c     *PSSR         begsr
     c                   endsr
     P                 E


       // PML Line:1463*

     P*---------------------------------------------------------------------
     P* optbankrbox0...             - User defined function
     P*---------------------------------------------------------------------
     P optbankrbox0...
     P                 B
     D optbankrbox0...
     D                 PI




      /free

       // PML Line:1465*
       boxtype = 'SYSTEM';

       // PML Line:1466*
       p_ztype = 'YESNO';

       // PML Line:1467*
       boxname = 'OPTBANKR';

       // PML Line:1468*
       boxid = 'OPTBANKR';

       // PML Line:1469*
       boxselect = optbankr;

       // PML Line:1470*
       jvalidation = '';

       // PML Line:1471*
      /end-free
     C                   EVAL      QPGM__=%trim('KWWEB'     ) + '/' + 'SELBOX3'
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

       // PML Line:1473*
      /end-free
     c     *PSSR         begsr
     c                   endsr
     P                 E


       // PML Line:1475*

     P*---------------------------------------------------------------------
     P* optcpmtbox0...              - User defined function
     P*---------------------------------------------------------------------
     P optcpmtbox0...
     P                 B
     D optcpmtbox0...
     D                 PI




      /free

       // PML Line:1477*
       boxtype = 'SYSTEM';

       // PML Line:1478*
       p_ztype = 'YESNO';

       // PML Line:1479*
       boxname = 'OPTCPMT';

       // PML Line:1480*
       boxid = 'OPTCPMT';

       // PML Line:1481*
       boxselect = optcpmt;

       // PML Line:1482*
       jvalidation = '';

       // PML Line:1483*
      /end-free
     C                   EVAL      QPGM__=%trim('KWWEB'     ) + '/' + 'SELBOX3'
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

       // PML Line:1485*
      /end-free
     c     *PSSR         begsr
     c                   endsr
     P                 E


       // PML Line:1487*

     P*---------------------------------------------------------------------
     P* optrepobox0...              - User defined function
     P*---------------------------------------------------------------------
     P optrepobox0...
     P                 B
     D optrepobox0...
     D                 PI




      /free

       // PML Line:1489*
       boxtype = 'SYSTEM';

       // PML Line:1490*
       p_ztype = 'YESNO';

       // PML Line:1491*
       boxname = 'OPTREPO';

       // PML Line:1492*
       boxid = 'OPTREPO';

       // PML Line:1493*
       boxselect = optrepo;

       // PML Line:1494*
       jvalidation = '';

       // PML Line:1495*
      /end-free
     C                   EVAL      QPGM__=%trim('KWWEB'     ) + '/' + 'SELBOX3'
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

       // PML Line:1497*
      /end-free
     c     *PSSR         begsr
     c                   endsr
     P                 E


       // PML Line:1499*

     P*---------------------------------------------------------------------
     P* optcoffbox0...              - User defined function
     P*---------------------------------------------------------------------
     P optcoffbox0...
     P                 B
     D optcoffbox0...
     D                 PI




      /free

       // PML Line:1501*
       boxtype = 'SYSTEM';

       // PML Line:1502*
       p_ztype = 'YESNO';

       // PML Line:1503*
       boxname = 'OPTCOFF';

       // PML Line:1504*
       boxid = 'OPTCOFF';

       // PML Line:1505*
       boxselect = optcoff;

       // PML Line:1506*
       jvalidation = '';

       // PML Line:1507*
      /end-free
     C                   EVAL      QPGM__=%trim('KWWEB'     ) + '/' + 'SELBOX3'
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

       // PML Line:1509*
      /end-free
     c     *PSSR         begsr
     c                   endsr
     P                 E


       // PML Line:1511*

     P*---------------------------------------------------------------------
     P* optdenybox0...              - User defined function
     P*---------------------------------------------------------------------
     P optdenybox0...
     P                 B
     D optdenybox0...
     D                 PI




      /free

       // PML Line:1513*
       boxtype = 'SYSTEM';

       // PML Line:1514*
       p_ztype = 'YESNO';

       // PML Line:1515*
       boxname = 'OPTDENY';

       // PML Line:1516*
       boxid = 'OPTDENY';

       // PML Line:1517*
       boxselect = optdeny;

       // PML Line:1518*
       jvalidation = '';

       // PML Line:1519*
      /end-free
     C                   EVAL      QPGM__=%trim('KWWEB'     ) + '/' + 'SELBOX3'
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

       // PML Line:1521*
      /end-free
     c     *PSSR         begsr
     c                   endsr
     P                 E


       // PML Line:1523*

     P*---------------------------------------------------------------------
     P* apprentbox0...              - User defined function
     P*---------------------------------------------------------------------
     P apprentbox0...
     P                 B
     D apprentbox0...
     D                 PI




      /free

       // PML Line:1525*
       boxtype = 'SYSTEM';

       // PML Line:1526*
       p_ztype = 'YESNO';

       // PML Line:1527*
       boxname = 'APPROVAL_R';

       // PML Line:1528*
       boxid = 'APPROVAL_R';

       // PML Line:1529*
       boxselect = approval_r;

       // PML Line:1530*
       jvalidation = '';

       // PML Line:1531*
      /end-free
     C                   EVAL      QPGM__=%trim('KWWEB'     ) + '/' + 'SELBOX3'
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

       // PML Line:1533*
      /end-free
     c     *PSSR         begsr
     c                   endsr
     P                 E


       // PML Line:1536*

     P*---------------------------------------------------------------------
     P* postpmtbox0...              - User defined function
     P*---------------------------------------------------------------------
     P postpmtbox0...
     P                 B
     D postpmtbox0...
     D                 PI




      /free

       // PML Line:1538*
       boxtype = 'SYSTEM';

       // PML Line:1539*
       p_ztype = 'YESNO';

       // PML Line:1540*
       boxname = 'POSTPMT';

       // PML Line:1541*
       boxid = 'POSTPMT';

       // PML Line:1542*
       boxselect = postpmt;

       // PML Line:1543*
       jvalidation = '';

       // PML Line:1544*
      /end-free
     C                   EVAL      QPGM__=%trim('KWWEB'     ) + '/' + 'SELBOX3'
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

       // PML Line:1546*
      /end-free
     c     *PSSR         begsr
     c                   endsr
     P                 E


       // PML Line:1548*

     P*---------------------------------------------------------------------
     P* specresbox0...              - User defined function
     P*---------------------------------------------------------------------
     P specresbox0...
     P                 B
     D specresbox0...
     D                 PI




      /free

       // PML Line:1550*
       boxtype = 'SYSTEM';

       // PML Line:1551*
       p_ztype = 'YESNO';

       // PML Line:1552*
       boxname = 'SPECRES';

       // PML Line:1553*
       boxid = 'SPECRES';

       // PML Line:1554*
       boxselect = specres;

       // PML Line:1555*
       jvalidation = '';

       // PML Line:1556*
      /end-free
     C                   EVAL      QPGM__=%trim('KWWEB'     ) + '/' + 'SELBOX3'
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

       // PML Line:1558*
      /end-free
     c     *PSSR         begsr
     c                   endsr
     P                 E


       // PML Line:1560*

     P*---------------------------------------------------------------------
     P* transorbox0...              - User defined function
     P*---------------------------------------------------------------------
     P transorbox0...
     P                 B
     D transorbox0...
     D                 PI




      /free

       // PML Line:1562*
       boxtype = 'SYSTEM';

       // PML Line:1563*
       p_ztype = 'YESNO';

       // PML Line:1564*
       boxname = 'TRANSOR';

       // PML Line:1565*
       boxid = 'TRANSOR';

       // PML Line:1566*
       boxselect = transor;

       // PML Line:1567*
       jvalidation = '';

       // PML Line:1568*
      /end-free
     C                   EVAL      QPGM__=%trim('KWWEB'     ) + '/' + 'SELBOX3'
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

       // PML Line:1570*
      /end-free
     c     *PSSR         begsr
     c                   endsr
     P                 E


       // PML Line:1572*

     P*---------------------------------------------------------------------
     P* rtoretbox0...               - User defined function
     P*---------------------------------------------------------------------
     P rtoretbox0...
     P                 B
     D rtoretbox0...
     D                 PI




      /free

       // PML Line:1575*
       puotype = 'RTORET';

       // PML Line:1576*
       AM006_ = CV_BYKEY;
       CHAIN(NE) DL006_ RKWPUOPT;
       RS006_ = RcdSts2_('GETRCD': %error: %found: %eof);

       // PML Line:1577*
       if (RS006_ = '1');

        // PML Line:1578*
        rtoret = puoyesno;
       endif;

       // PML Line:1580*
       OutWeb_('<select type="select-one" name="RTORET" id="RTORET"><option v-
       alue=""></option>');

       // PML Line:1581*
       if (rtoret = 'N');

        // PML Line:1582*
        OutWeb_('<option value="N" selected="">No</option>');

        // PML Line:1583*
       else;

        // PML Line:1584*
        OutWeb_('<option value="N">No</option>');
       endif;

       // PML Line:1586*
       if (rtoret = 'Y');

        // PML Line:1587*
        OutWeb_('<option value="Y" selected="">Yes</option>');

        // PML Line:1588*
       else;

        // PML Line:1589*
        OutWeb_('<option value="Y">Yes</option>');
       endif;

       // PML Line:1591*
       OutWeb_('</select>');

       // PML Line:1592*
      /end-free
     c     *PSSR         begsr
     c                   endsr
     P                 E


       // PML Line:1594*

     P*---------------------------------------------------------------------
     P* putwitypebox0...            - User defined function
     P*---------------------------------------------------------------------
     P putwitypebox0...
     P                 B
     D putwitypebox0...
     D                 PI




      /free

      /end-free
     C/Exec SQL
     C+  SELECT PUTWITYPE INTO :PUTWITYPE FROM KWPUTWILIO WHERE PUID = :PUID
     C/End-Exec
      /free

       // PML Line:1598*
       OutWeb_('<select name="PUTWITYPE" id="PUTWITYPE">');

       // PML Line:1600*
       if (putwitype = '');

        // PML Line:1601*
        OutWeb_('<option selected value=""></option>');

        // PML Line:1602*
       else;

        // PML Line:1603*
        OutWeb_('<option value=""></option>');
       endif;

       // PML Line:1605*
       if (putwitype = 'Device');

        // PML Line:1606*
        OutWeb_('<option selected value="Device">Device Phone</option>');

        // PML Line:1607*
       else;

        // PML Line:1608*
        OutWeb_('<option value="Device">Device Phone</option>');
       endif;

       // PML Line:1610*
       if (putwitype = 'Soft');

        // PML Line:1611*
        OutWeb_('<option selected value="Soft">Soft Phone</option>');

        // PML Line:1612*
       else;

        // PML Line:1613*
        OutWeb_('<option value="Soft">Soft Phone</option>');
       endif;

       // PML Line:1615*
       OutWeb_('</select>');

       // PML Line:1616*
      /end-free
     c     *PSSR         begsr
     c                   endsr
     P                 E


       // PML Line:1618*

     P*---------------------------------------------------------------------
     P* transfixbox0...             - User defined function
     P*---------------------------------------------------------------------
     P transfixbox0...
     P                 B
     D transfixbox0...
     D                 PI




      /free

       // PML Line:1621*
       puotype = 'TRANSFIX';

       // PML Line:1622*
       AM006_ = CV_BYKEY;
       CHAIN(NE) DL006_ RKWPUOPT;
       RS006_ = RcdSts2_('GETRCD': %error: %found: %eof);

       // PML Line:1623*
       if (RS006_ = '1');

        // PML Line:1624*
        opttransfix = puoyesno;
       endif;

       // PML Line:1626*
       OutWeb_('<select type="select-one" name="OPTTRANSFIX" id="OPTTRANSFIX"-
       ><option value=""></option>');

       // PML Line:1627*
       if (opttransfix = 'N');

        // PML Line:1628*
        OutWeb_('<option value="N" selected="">No</option>');

        // PML Line:1629*
       else;

        // PML Line:1630*
        OutWeb_('<option value="N">No</option>');
       endif;

       // PML Line:1632*
       if (opttransfix = 'Y');

        // PML Line:1633*
        OutWeb_('<option value="Y" selected="">Yes</option>');

        // PML Line:1634*
       else;

        // PML Line:1635*
        OutWeb_('<option value="Y">Yes</option>');
       endif;

       // PML Line:1637*
       OutWeb_('</select>');

       // PML Line:1638*
      /end-free
     c     *PSSR         begsr
     c                   endsr
     P                 E


       // PML Line:1640*

     P*---------------------------------------------------------------------
     P* abatebox0...                - User defined function
     P*---------------------------------------------------------------------
     P abatebox0...
     P                 B
     D abatebox0...
     D                 PI




      /free

       // PML Line:1643*
       puotype = 'ABATEAUTH';

       // PML Line:1644*
       AM006_ = CV_BYKEY;
       CHAIN(NE) DL006_ RKWPUOPT;
       RS006_ = RcdSts2_('GETRCD': %error: %found: %eof);

       // PML Line:1645*
       if (RS006_ = '1');

        // PML Line:1646*
        optabate = puoyesno;
       endif;

       // PML Line:1648*
       OutWeb_('<select type="select-one" name="OPTABATE" id="OPTABATE"><opti-
       on value=""></option>');

       // PML Line:1649*
       if (optabate = 'N');

        // PML Line:1650*
        OutWeb_('<option value="N" selected="">No</option>');

        // PML Line:1651*
       else;

        // PML Line:1652*
        OutWeb_('<option value="N">No</option>');
       endif;

       // PML Line:1654*
       if (optabate = 'Y');

        // PML Line:1655*
        OutWeb_('<option value="Y" selected="">Yes</option>');

        // PML Line:1656*
       else;

        // PML Line:1657*
        OutWeb_('<option value="Y">Yes</option>');
       endif;

       // PML Line:1659*
       OutWeb_('</select>');

       // PML Line:1660*
      /end-free
     c     *PSSR         begsr
     c                   endsr
     P                 E


       // PML Line:1662*

     P*---------------------------------------------------------------------
     P* revpmtbox0...               - User defined function
     P*---------------------------------------------------------------------
     P revpmtbox0...
     P                 B
     D revpmtbox0...
     D                 PI




      /free

       // PML Line:1664*
       boxtype = 'SYSTEM';

       // PML Line:1665*
       p_ztype = 'YESNO';

       // PML Line:1666*
       boxname = 'REVPMT';

       // PML Line:1667*
       boxid = 'REVPMT';

       // PML Line:1668*
       boxselect = revpmt;

       // PML Line:1669*
       jvalidation = '';

       // PML Line:1670*
      /end-free
     C                   EVAL      QPGM__=%trim('KWWEB'     ) + '/' + 'SELBOX3'
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

       // PML Line:1672*
      /end-free
     c     *PSSR         begsr
     c                   endsr
     P                 E


       // PML Line:1673*

     P*---------------------------------------------------------------------
     P* waivefeebox0...             - User defined function
     P*---------------------------------------------------------------------
     P waivefeebox0...
     P                 B
     D waivefeebox0...
     D                 PI




      /free

       // PML Line:1675*
       boxtype = 'SYSTEM';

       // PML Line:1676*
       p_ztype = 'YESNO';

       // PML Line:1677*
       boxname = 'WAIVEFEE';

       // PML Line:1678*
       boxid = 'WAIVEFEE';

       // PML Line:1679*
       boxselect = waivefee;

       // PML Line:1680*
       jvalidation = '';

       // PML Line:1681*
      /end-free
     C                   EVAL      QPGM__=%trim('KWWEB'     ) + '/' + 'SELBOX3'
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

       // PML Line:1683*
      /end-free
     c     *PSSR         begsr
     c                   endsr
     P                 E


       // PML Line:1684*

     P*---------------------------------------------------------------------
     P* chgduebox0...               - User defined function
     P*---------------------------------------------------------------------
     P chgduebox0...
     P                 B
     D chgduebox0...
     D                 PI




      /free

       // PML Line:1686*
       boxtype = 'SYSTEM';

       // PML Line:1687*
       p_ztype = 'YESNO';

       // PML Line:1688*
       boxname = 'CHGDUE';

       // PML Line:1689*
       boxid = 'CHGDUE';

       // PML Line:1690*
       boxselect = chgdue;

       // PML Line:1691*
       jvalidation = '';

       // PML Line:1692*
      /end-free
     C                   EVAL      QPGM__=%trim('KWWEB'     ) + '/' + 'SELBOX3'
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

       // PML Line:1694*
      /end-free
     c     *PSSR         begsr
     c                   endsr
     P                 E


       // PML Line:1695*

     P*---------------------------------------------------------------------
     P* chgratebox0...              - User defined function
     P*---------------------------------------------------------------------
     P chgratebox0...
     P                 B
     D chgratebox0...
     D                 PI




      /free

       // PML Line:1697*
       boxtype = 'SYSTEM';

       // PML Line:1698*
       p_ztype = 'YESNO';

       // PML Line:1699*
       boxname = 'CHGRATE';

       // PML Line:1700*
       boxid = 'CHGRATE';

       // PML Line:1701*
       boxselect = chgrate;

       // PML Line:1702*
       jvalidation = '';

       // PML Line:1703*
      /end-free
     C                   EVAL      QPGM__=%trim('KWWEB'     ) + '/' + 'SELBOX3'
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

       // PML Line:1705*
      /end-free
     c     *PSSR         begsr
     c                   endsr
     P                 E


       // PML Line:1706*

     P*---------------------------------------------------------------------
     P* chgamtbox0...               - User defined function
     P*---------------------------------------------------------------------
     P chgamtbox0...
     P                 B
     D chgamtbox0...
     D                 PI




      /free

       // PML Line:1708*
       boxtype = 'SYSTEM';

       // PML Line:1709*
       p_ztype = 'YESNO';

       // PML Line:1710*
       boxname = 'CHGAMT';

       // PML Line:1711*
       boxid = 'CHGAMT';

       // PML Line:1712*
       boxselect = chgamt;

       // PML Line:1713*
       jvalidation = '';

       // PML Line:1714*
      /end-free
     C                   EVAL      QPGM__=%trim('KWWEB'     ) + '/' + 'SELBOX3'
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

       // PML Line:1716*
      /end-free
     c     *PSSR         begsr
     c                   endsr
     P                 E


       // PML Line:1718*

     P*---------------------------------------------------------------------
     P* adddlrbox0...               - User defined function
     P*---------------------------------------------------------------------
     P adddlrbox0...
     P                 B
     D adddlrbox0...
     D                 PI




      /free

       // PML Line:1720*
       boxtype = 'SYSTEM';

       // PML Line:1721*
       p_ztype = 'YESNO';

       // PML Line:1722*
       boxname = 'ADDDLR';

       // PML Line:1723*
       boxid = 'ADDDLR';

       // PML Line:1724*
       boxselect = adddlr;

       // PML Line:1725*
       jvalidation = '';

       // PML Line:1726*
      /end-free
     C                   EVAL      QPGM__=%trim('KWWEB'     ) + '/' + 'SELBOX3'
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

       // PML Line:1728*
      /end-free
     c     *PSSR         begsr
     c                   endsr
     P                 E


       // PML Line:1729*

     P*---------------------------------------------------------------------
     P* editdlrbox0...              - User defined function
     P*---------------------------------------------------------------------
     P editdlrbox0...
     P                 B
     D editdlrbox0...
     D                 PI




      /free

       // PML Line:1731*
       boxtype = 'SYSTEM';

       // PML Line:1732*
       p_ztype = 'YESNO';

       // PML Line:1733*
       boxname = 'EDITDLR';

       // PML Line:1734*
       boxid = 'EDITDLR';

       // PML Line:1735*
       boxselect = editdlr;

       // PML Line:1736*
       jvalidation = '';

       // PML Line:1737*
      /end-free
     C                   EVAL      QPGM__=%trim('KWWEB'     ) + '/' + 'SELBOX3'
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

       // PML Line:1739*
      /end-free
     c     *PSSR         begsr
     c                   endsr
     P                 E


       // PML Line:1740*

     P*---------------------------------------------------------------------
     P* addpgmbox0...               - User defined function
     P*---------------------------------------------------------------------
     P addpgmbox0...
     P                 B
     D addpgmbox0...
     D                 PI




      /free

       // PML Line:1742*
       boxtype = 'SYSTEM';

       // PML Line:1743*
       p_ztype = 'YESNO';

       // PML Line:1744*
       boxname = 'ADDPGM';

       // PML Line:1745*
       boxid = 'ADDPGM';

       // PML Line:1746*
       boxselect = addpgm;

       // PML Line:1747*
       jvalidation = '';

       // PML Line:1748*
      /end-free
     C                   EVAL      QPGM__=%trim('KWWEB'     ) + '/' + 'SELBOX3'
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

       // PML Line:1750*
      /end-free
     c     *PSSR         begsr
     c                   endsr
     P                 E


       // PML Line:1751*

     P*---------------------------------------------------------------------
     P* editpgmbox0...              - User defined function
     P*---------------------------------------------------------------------
     P editpgmbox0...
     P                 B
     D editpgmbox0...
     D                 PI




      /free

       // PML Line:1753*
       boxtype = 'SYSTEM';

       // PML Line:1754*
       p_ztype = 'YESNO';

       // PML Line:1755*
       boxname = 'EDITPGM';

       // PML Line:1756*
       boxid = 'EDITPGM';

       // PML Line:1757*
       boxselect = editpgm;

       // PML Line:1758*
       jvalidation = '';

       // PML Line:1759*
      /end-free
     C                   EVAL      QPGM__=%trim('KWWEB'     ) + '/' + 'SELBOX3'
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

       // PML Line:1761*
      /end-free
     c     *PSSR         begsr
     c                   endsr
     P                 E


       // PML Line:1763*

     P*---------------------------------------------------------------------
     P* splitpmtbox0...             - User defined function
     P*---------------------------------------------------------------------
     P splitpmtbox0...
     P                 B
     D splitpmtbox0...
     D                 PI




      /free

       // PML Line:1765*
       boxtype = 'SYSTEM';

       // PML Line:1766*
       p_ztype = 'YESNO';

       // PML Line:1767*
       boxname = 'SPLITPMT';

       // PML Line:1768*
       boxid = 'SPLITPMT';

       // PML Line:1769*
       boxselect = splitpmt;

       // PML Line:1770*
       jvalidation = '';

       // PML Line:1771*
      /end-free
     C                   EVAL      QPGM__=%trim('KWWEB'     ) + '/' + 'SELBOX3'
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

       // PML Line:1773*
      /end-free
     c     *PSSR         begsr
     c                   endsr
     P                 E


       // PML Line:1776*

     P*---------------------------------------------------------------------
     P* getlimits0...               - User defined function
     P*---------------------------------------------------------------------
     P getlimits0...
     P                 B
     D getlimits0...
     D                 PI




      /free

       // PML Line:1779*
       puatype = 'DENIAL_FICO';

       // PML Line:1780*
       AM002_ = CV_BYKEY;
       CHAIN(NE) DL002_ RKWPULOC;
       RS002_ = RcdSts2_('GETRCD': %error: %found: %eof);

       // PML Line:1781*
       if (RS002_ = '1');

        // PML Line:1782*
        denial_fico = PUAAMT;
       endif;

       // PML Line:1784*
       puatype = 'DEVIANCE_FICO';

       // PML Line:1785*
       AM002_ = CV_BYKEY;
       CHAIN(NE) DL002_ RKWPULOC;
       RS002_ = RcdSts2_('GETRCD': %error: %found: %eof);

       // PML Line:1786*
       if (RS002_ = '1');

        // PML Line:1787*
        deviance_fico = PUAAMT;
       endif;

       // PML Line:1789*
       puatype = 'APPROVAL_UNSECURED';

       // PML Line:1790*
       AM002_ = CV_BYKEY;
       CHAIN(NE) DL002_ RKWPULOC;
       RS002_ = RcdSts2_('GETRCD': %error: %found: %eof);

       // PML Line:1791*
       if (RS002_ = '1');

        // PML Line:1792*
        UNSECLIMIT = PUAAMT;
       endif;

       // PML Line:1794*
       puatype = 'APPROVAL_GOODS';

       // PML Line:1795*
       AM002_ = CV_BYKEY;
       CHAIN(NE) DL002_ RKWPULOC;
       RS002_ = RcdSts2_('GETRCD': %error: %found: %eof);

       // PML Line:1796*
       if (RS002_ = '1');

        // PML Line:1797*
        GOODSLIMIT = PUAAMT;
       endif;

       // PML Line:1799*
       puatype = 'APPROVAL_VEHICLE';

       // PML Line:1800*
       AM002_ = CV_BYKEY;
       CHAIN(NE) DL002_ RKWPULOC;
       RS002_ = RcdSts2_('GETRCD': %error: %found: %eof);

       // PML Line:1801*
       if (RS002_ = '1');

        // PML Line:1802*
        AUTOLIMIT = PUAAMT;
       endif;

       // PML Line:1804*
       puatype = 'APPROVAL_SCORE';

       // PML Line:1805*
       AM002_ = CV_BYKEY;
       CHAIN(NE) DL002_ RKWPULOC;
       RS002_ = RcdSts2_('GETRCD': %error: %found: %eof);

       // PML Line:1806*
       if (RS002_ = '1');

        // PML Line:1807*
        APPROVAL_SCORE = PUAAMT;
       endif;

       // PML Line:1809*
       puatype = 'APPROVAL_DRATIO  ';

       // PML Line:1810*
       AM002_ = CV_BYKEY;
       CHAIN(NE) DL002_ RKWPULOC;
       RS002_ = RcdSts2_('GETRCD': %error: %found: %eof);

       // PML Line:1811*
       if (RS002_ = '1');

        // PML Line:1812*
        APPROVAL_DRAT = PUAAMT;
       endif;

       // PML Line:1814*
       puatype = 'APPROVAL_GROSS';

       // PML Line:1815*
       AM002_ = CV_BYKEY;
       CHAIN(NE) DL002_ RKWPULOC;
       RS002_ = RcdSts2_('GETRCD': %error: %found: %eof);

       // PML Line:1816*
       if (RS002_ = '1');

        // PML Line:1817*
        APPROVAL_GROSS = PUAAMT;
       endif;

       // PML Line:1819*
       puatype = 'APPROVAL_TIF+TR';

       // PML Line:1820*
       AM002_ = CV_BYKEY;
       CHAIN(NE) DL002_ RKWPULOC;
       RS002_ = RcdSts2_('GETRCD': %error: %found: %eof);

       // PML Line:1821*
       if (RS002_ = '1');

        // PML Line:1822*
        APPROVAL_TIFTR = PUAAMT;
       endif;

       // PML Line:1824*
       puatype = 'APPROVAL_REVAMT    ';

       // PML Line:1825*
       AM002_ = CV_BYKEY;
       CHAIN(NE) DL002_ RKWPULOC;
       RS002_ = RcdSts2_('GETRCD': %error: %found: %eof);

       // PML Line:1826*
       if (RS002_ = '1');

        // PML Line:1827*
        APPROVAL_RAMT = PUAAMT;
       endif;

       // PML Line:1829*
       puatype = 'APPROVAL_REVAVAIL    ';

       // PML Line:1830*
       AM002_ = CV_BYKEY;
       CHAIN(NE) DL002_ RKWPULOC;
       RS002_ = RcdSts2_('GETRCD': %error: %found: %eof);

       // PML Line:1831*
       if (RS002_ = '1');

        // PML Line:1832*
        APPROVAL_RAVL = PUAAMT;
       endif;

       // PML Line:1834*
       puatype = 'APPROVAL_TRADE30    ';

       // PML Line:1835*
       AM002_ = CV_BYKEY;
       CHAIN(NE) DL002_ RKWPULOC;
       RS002_ = RcdSts2_('GETRCD': %error: %found: %eof);

       // PML Line:1836*
       if (RS002_ = '1');

        // PML Line:1837*
        APPROVAL_T30 = PUAAMT;
       endif;

       // PML Line:1839*
       puatype = 'APPROVAL_TRADE60    ';

       // PML Line:1840*
       AM002_ = CV_BYKEY;
       CHAIN(NE) DL002_ RKWPULOC;
       RS002_ = RcdSts2_('GETRCD': %error: %found: %eof);

       // PML Line:1841*
       if (RS002_ = '1');

        // PML Line:1842*
        APPROVAL_T60 = PUAAMT;
       endif;

       // PML Line:1844*
       puatype = 'APPROVAL_TRADE90    ';

       // PML Line:1845*
       AM002_ = CV_BYKEY;
       CHAIN(NE) DL002_ RKWPULOC;
       RS002_ = RcdSts2_('GETRCD': %error: %found: %eof);

       // PML Line:1846*
       if (RS002_ = '1');

        // PML Line:1847*
        APPROVAL_T90 = PUAAMT;
       endif;

       // PML Line:1849*
       puatype = 'APPROVAL_BANKMO        ';

       // PML Line:1850*
       AM002_ = CV_BYKEY;
       CHAIN(NE) DL002_ RKWPULOC;
       RS002_ = RcdSts2_('GETRCD': %error: %found: %eof);

       // PML Line:1851*
       if (RS002_ = '1');

        // PML Line:1852*
        APPROVAL_BKMO = PUAAMT;
       endif;

       // PML Line:1854*
      /end-free
     c     *PSSR         begsr
     c                   endsr
     P                 E


       // PML Line:1856*

     P*---------------------------------------------------------------------
     P* getoptions0...              - User defined function
     P*---------------------------------------------------------------------
     P getoptions0...
     P                 B
     D getoptions0...
     D                 PI




      /free

       // PML Line:1859*
       puotype = 'APPROVE';

       // PML Line:1860*
       AM006_ = CV_BYKEY;
       CHAIN(NE) DL006_ RKWPUOPT;
       RS006_ = RcdSts2_('GETRCD': %error: %found: %eof);

       // PML Line:1861*
       if (RS006_ = '1');

        // PML Line:1862*
        optapprove = puoyesno;
       endif;

       // PML Line:1864*
       puotype = 'VOID';

       // PML Line:1865*
       AM006_ = CV_BYKEY;
       CHAIN(NE) DL006_ RKWPUOPT;
       RS006_ = RcdSts2_('GETRCD': %error: %found: %eof);

       // PML Line:1866*
       if (RS006_ = '1');

        // PML Line:1867*
        optvoid = puoyesno;
       endif;

       // PML Line:1869*
       puotype = 'REM';

       // PML Line:1870*
       AM006_ = CV_BYKEY;
       CHAIN(NE) DL006_ RKWPUOPT;
       RS006_ = RcdSts2_('GETRCD': %error: %found: %eof);

       // PML Line:1871*
       if (RS006_ = '1');

        // PML Line:1872*
        optrem = puoyesno;
       endif;

       // PML Line:1874*
       puotype = 'ASSCON';

       // PML Line:1875*
       AM006_ = CV_BYKEY;
       CHAIN(NE) DL006_ RKWPUOPT;
       RS006_ = RcdSts2_('GETRCD': %error: %found: %eof);

       // PML Line:1876*
       if (RS006_ = '1');

        // PML Line:1877*
        optasscon = puoyesno;
       endif;

       // PML Line:1879*
       puotype = 'DENY';

       // PML Line:1880*
       AM006_ = CV_BYKEY;
       CHAIN(NE) DL006_ RKWPUOPT;
       RS006_ = RcdSts2_('GETRCD': %error: %found: %eof);

       // PML Line:1881*
       if (RS006_ = '1');

        // PML Line:1882*
        optdeny = puoyesno;
       endif;

       // PML Line:1884*
       puotype = 'TRANSFIX';

       // PML Line:1885*
       AM006_ = CV_BYKEY;
       CHAIN(NE) DL006_ RKWPUOPT;
       RS006_ = RcdSts2_('GETRCD': %error: %found: %eof);

       // PML Line:1886*
       if (RS006_ = '1');

        // PML Line:1887*
        opttransfix = puoyesno;
       endif;

       // PML Line:1889*
       puotype = 'RTORET';

       // PML Line:1890*
       AM006_ = CV_BYKEY;
       CHAIN(NE) DL006_ RKWPUOPT;
       RS006_ = RcdSts2_('GETRCD': %error: %found: %eof);

       // PML Line:1891*
       if (RS006_ = '1');

        // PML Line:1892*
        rtoret = puoyesno;
       endif;

       // PML Line:1895*
       puotype = 'OVERVER';

       // PML Line:1896*
       AM006_ = CV_BYKEY;
       CHAIN(NE) DL006_ RKWPUOPT;
       RS006_ = RcdSts2_('GETRCD': %error: %found: %eof);

       // PML Line:1897*
       if (RS006_ = '1');

        // PML Line:1898*
        overver = puoyesno;
       endif;

       // PML Line:1900*
       puotype = 'LNEXPOVR';

       // PML Line:1901*
       AM006_ = CV_BYKEY;
       CHAIN(NE) DL006_ RKWPUOPT;
       RS006_ = RcdSts2_('GETRCD': %error: %found: %eof);

       // PML Line:1902*
       if (RS006_ = '1');

        // PML Line:1903*
        lnexpovr = puoyesno;
       endif;

       // PML Line:1905*
       puotype = 'CNCLAPP';

       // PML Line:1906*
       AM006_ = CV_BYKEY;
       CHAIN(NE) DL006_ RKWPUOPT;
       RS006_ = RcdSts2_('GETRCD': %error: %found: %eof);

       // PML Line:1907*
       if (RS006_ = '1');

        // PML Line:1908*
        cnclapp = puoyesno;
       endif;

       // PML Line:1910*
       puotype = 'LNOPNOVR';

       // PML Line:1911*
       AM006_ = CV_BYKEY;
       CHAIN(NE) DL006_ RKWPUOPT;
       RS006_ = RcdSts2_('GETRCD': %error: %found: %eof);

       // PML Line:1912*
       if (RS006_ = '1');

        // PML Line:1913*
        lnopnovr = puoyesno;
       endif;

       // PML Line:1915*
       puotype = 'LNFUNDOVR';

       // PML Line:1916*
       AM006_ = CV_BYKEY;
       CHAIN(NE) DL006_ RKWPUOPT;
       RS006_ = RcdSts2_('GETRCD': %error: %found: %eof);

       // PML Line:1917*
       if (RS006_ = '1');

        // PML Line:1918*
        lnfundovr = puoyesno;
       endif;

       // PML Line:1928*
       puotype = 'EDTSCRAFLG';

       // PML Line:1929*
       AM006_ = CV_BYKEY;
       CHAIN(NE) DL006_ RKWPUOPT;
       RS006_ = RcdSts2_('GETRCD': %error: %found: %eof);

       // PML Line:1930*
       if (RS006_ = '1');

        // PML Line:1931*
        if (puoyesno <> '');

         // PML Line:1932*
         edtscraflg = puoyesno;

         // PML Line:1933*
        else;

         // PML Line:1934*
         edtscraflg = 'N';
        endif;

        // PML Line:1937*
       else;

        // PML Line:1938*
        edtscraflg = 'N';
       endif;

       // PML Line:1942*
       puotype = 'ABATEAUTH';

       // PML Line:1943*
       AM006_ = CV_BYKEY;
       CHAIN(NE) DL006_ RKWPUOPT;
       RS006_ = RcdSts2_('GETRCD': %error: %found: %eof);

       // PML Line:1944*
       if (RS006_ = '1');

        // PML Line:1945*
        optabate = puoyesno;
       endif;

       // PML Line:1947*
       puotype = 'MODIFY';

       // PML Line:1948*
       AM006_ = CV_BYKEY;
       CHAIN(NE) DL006_ RKWPUOPT;
       RS006_ = RcdSts2_('GETRCD': %error: %found: %eof);

       // PML Line:1949*
       if (RS006_ = '1');

        // PML Line:1950*
        optmodify = puoyesno;
       endif;

       // PML Line:1952*
       puotype = 'JUDGEMENT';

       // PML Line:1953*
       AM006_ = CV_BYKEY;
       CHAIN(NE) DL006_ RKWPUOPT;
       RS006_ = RcdSts2_('GETRCD': %error: %found: %eof);

       // PML Line:1954*
       if (RS006_ = '1');

        // PML Line:1955*
        optjudge = puoyesno;
       endif;

       // PML Line:1957*
       puotype = 'BANKRUPTCY';

       // PML Line:1958*
       AM006_ = CV_BYKEY;
       CHAIN(NE) DL006_ RKWPUOPT;
       RS006_ = RcdSts2_('GETRCD': %error: %found: %eof);

       // PML Line:1959*
       if (RS006_ = '1');

        // PML Line:1960*
        optbankr = puoyesno;
       endif;

       // PML Line:1962*
       puotype = 'REPO';

       // PML Line:1963*
       AM006_ = CV_BYKEY;
       CHAIN(NE) DL006_ RKWPUOPT;
       RS006_ = RcdSts2_('GETRCD': %error: %found: %eof);

       // PML Line:1964*
       if (RS006_ = '1');

        // PML Line:1965*
        optrepo = puoyesno;
       endif;

       // PML Line:1967*
       puotype = 'CHARGEOFF';

       // PML Line:1968*
       AM006_ = CV_BYKEY;
       CHAIN(NE) DL006_ RKWPUOPT;
       RS006_ = RcdSts2_('GETRCD': %error: %found: %eof);

       // PML Line:1969*
       if (RS006_ = '1');

        // PML Line:1970*
        optcoff = puoyesno;
       endif;

       // PML Line:1972*
       puotype = 'CARDPMT';

       // PML Line:1973*
       AM006_ = CV_BYKEY;
       CHAIN(NE) DL006_ RKWPUOPT;
       RS006_ = RcdSts2_('GETRCD': %error: %found: %eof);

       // PML Line:1974*
       if (RS006_ = '1');

        // PML Line:1975*
        optcpmt = puoyesno;
       endif;

       // PML Line:1977*
       puotype = 'COLL';

       // PML Line:1978*
       AM006_ = CV_BYKEY;
       CHAIN(NE) DL006_ RKWPUOPT;
       RS006_ = RcdSts2_('GETRCD': %error: %found: %eof);

       // PML Line:1979*
       if (RS006_ = '1');

        // PML Line:1980*
        optcoll = puoyesno;
       endif;

       // PML Line:1982*
       puotype = 'ASSIGNCOLL';

       // PML Line:1983*
       AM006_ = CV_BYKEY;
       CHAIN(NE) DL006_ RKWPUOPT;
       RS006_ = RcdSts2_('GETRCD': %error: %found: %eof);

       // PML Line:1984*
       if (RS006_ = '1');

        // PML Line:1985*
        optascoll = puoyesno;
       endif;

       // PML Line:1987*
       puotype = 'ADMCOLL';

       // PML Line:1988*
       AM006_ = CV_BYKEY;
       CHAIN(NE) DL006_ RKWPUOPT;
       RS006_ = RcdSts2_('GETRCD': %error: %found: %eof);

       // PML Line:1989*
       if (RS006_ = '1');

        // PML Line:1990*
        optadmcoll = puoyesno;
       endif;

       // PML Line:1992*
       puotype = 'APPROVAL_RENT';

       // PML Line:1993*
       AM006_ = CV_BYKEY;
       CHAIN(NE) DL006_ RKWPUOPT;
       RS006_ = RcdSts2_('GETRCD': %error: %found: %eof);

       // PML Line:1994*
       if (RS006_ = '1');

        // PML Line:1995*
        approval_r = puoyesno;
       endif;

       // PML Line:1997*
       puotype = 'POSTPMT';

       // PML Line:1998*
       AM006_ = CV_BYKEY;
       CHAIN(NE) DL006_ RKWPUOPT;
       RS006_ = RcdSts2_('GETRCD': %error: %found: %eof);

       // PML Line:1999*
       if (RS006_ = '1');

        // PML Line:2000*
        postpmt = puoyesno;
       endif;

       // PML Line:2002*
       puotype = 'SPECRES';

       // PML Line:2003*
       AM006_ = CV_BYKEY;
       CHAIN(NE) DL006_ RKWPUOPT;
       RS006_ = RcdSts2_('GETRCD': %error: %found: %eof);

       // PML Line:2004*
       if (RS006_ = '1');

        // PML Line:2005*
        specres = puoyesno;
       endif;

       // PML Line:2007*
       puotype = 'TRANSOR';

       // PML Line:2008*
       AM006_ = CV_BYKEY;
       CHAIN(NE) DL006_ RKWPUOPT;
       RS006_ = RcdSts2_('GETRCD': %error: %found: %eof);

       // PML Line:2009*
       if (RS006_ = '1');

        // PML Line:2010*
        transor = puoyesno;
       endif;

       // PML Line:2012*
       puotype = 'REVPMT';

       // PML Line:2013*
       AM006_ = CV_BYKEY;
       CHAIN(NE) DL006_ RKWPUOPT;
       RS006_ = RcdSts2_('GETRCD': %error: %found: %eof);

       // PML Line:2014*
       if (RS006_ = '1');

        // PML Line:2015*
        revpmt = puoyesno;
       endif;

       // PML Line:2017*
       puotype = 'WAIVEFEE';

       // PML Line:2018*
       AM006_ = CV_BYKEY;
       CHAIN(NE) DL006_ RKWPUOPT;
       RS006_ = RcdSts2_('GETRCD': %error: %found: %eof);

       // PML Line:2019*
       if (RS006_ = '1');

        // PML Line:2020*
        waivefee = puoyesno;
       endif;

       // PML Line:2022*
       puotype = 'CHGDUE';

       // PML Line:2023*
       AM006_ = CV_BYKEY;
       CHAIN(NE) DL006_ RKWPUOPT;
       RS006_ = RcdSts2_('GETRCD': %error: %found: %eof);

       // PML Line:2024*
       if (RS006_ = '1');

        // PML Line:2025*
        chgdue = puoyesno;
       endif;

       // PML Line:2027*
       puotype = 'CHGRATE';

       // PML Line:2028*
       AM006_ = CV_BYKEY;
       CHAIN(NE) DL006_ RKWPUOPT;
       RS006_ = RcdSts2_('GETRCD': %error: %found: %eof);

       // PML Line:2029*
       if (RS006_ = '1');

        // PML Line:2030*
        chgrate = puoyesno;
       endif;

       // PML Line:2032*
       puotype = 'CHGAMT';

       // PML Line:2033*
       AM006_ = CV_BYKEY;
       CHAIN(NE) DL006_ RKWPUOPT;
       RS006_ = RcdSts2_('GETRCD': %error: %found: %eof);

       // PML Line:2034*
       if (RS006_ = '1');

        // PML Line:2035*
        chgamt = puoyesno;
       endif;

       // PML Line:2037*
       puotype = 'ADDDLR';

       // PML Line:2038*
       AM006_ = CV_BYKEY;
       CHAIN(NE) DL006_ RKWPUOPT;
       RS006_ = RcdSts2_('GETRCD': %error: %found: %eof);

       // PML Line:2039*
       if (RS006_ = '1');

        // PML Line:2040*
        adddlr = puoyesno;
       endif;

       // PML Line:2042*
       puotype = 'EDITDLR';

       // PML Line:2043*
       AM006_ = CV_BYKEY;
       CHAIN(NE) DL006_ RKWPUOPT;
       RS006_ = RcdSts2_('GETRCD': %error: %found: %eof);

       // PML Line:2044*
       if (RS006_ = '1');

        // PML Line:2045*
        editdlr = puoyesno;
       endif;

       // PML Line:2047*
       puotype = 'ADDPGM';

       // PML Line:2048*
       AM006_ = CV_BYKEY;
       CHAIN(NE) DL006_ RKWPUOPT;
       RS006_ = RcdSts2_('GETRCD': %error: %found: %eof);

       // PML Line:2049*
       if (RS006_ = '1');

        // PML Line:2050*
        addpgm = puoyesno;
       endif;

       // PML Line:2052*
       puotype = 'EDITPGM';

       // PML Line:2053*
       AM006_ = CV_BYKEY;
       CHAIN(NE) DL006_ RKWPUOPT;
       RS006_ = RcdSts2_('GETRCD': %error: %found: %eof);

       // PML Line:2054*
       if (RS006_ = '1');

        // PML Line:2055*
        editpgm = puoyesno;
       endif;

       // PML Line:2058*
       puotype = 'SPLITPMT';

       // PML Line:2059*
       AM006_ = CV_BYKEY;
       CHAIN(NE) DL006_ RKWPUOPT;
       RS006_ = RcdSts2_('GETRCD': %error: %found: %eof);

       // PML Line:2060*
       if (RS006_ = '1');

        // PML Line:2061*
        splitpmt = puoyesno;
       endif;

       // PML Line:2064*
       puotype = 'DELETEDOC';

       // PML Line:2065*
       AM006_ = CV_BYKEY;
       CHAIN(NE) DL006_ RKWPUOPT;
       RS006_ = RcdSts2_('GETRCD': %error: %found: %eof);

       // PML Line:2066*
       if (RS006_ = '1');

        // PML Line:2067*
        deletedoc = puoyesno;
       endif;

       // PML Line:2069*
       puotype = 'DELETENOTE';

       // PML Line:2070*
       AM006_ = CV_BYKEY;
       CHAIN(NE) DL006_ RKWPUOPT;
       RS006_ = RcdSts2_('GETRCD': %error: %found: %eof);

       // PML Line:2071*
       if (RS006_ = '1');

        // PML Line:2072*
        deletenote = puoyesno;
       endif;

       // PML Line:2074*
       puotype = 'DELETESTIP';

       // PML Line:2075*
       AM006_ = CV_BYKEY;
       CHAIN(NE) DL006_ RKWPUOPT;
       RS006_ = RcdSts2_('GETRCD': %error: %found: %eof);

       // PML Line:2076*
       if (RS006_ = '1');

        // PML Line:2077*
        deletestip = puoyesno;
       endif;

       // PML Line:2079*
       puotype = 'TITLEAMORT';

       // PML Line:2080*
       AM006_ = CV_BYKEY;
       CHAIN(NE) DL006_ RKWPUOPT;
       RS006_ = RcdSts2_('GETRCD': %error: %found: %eof);

       // PML Line:2081*
       if (RS006_ = '1');

        // PML Line:2082*
        titleamort = puoyesno;
       endif;

       // PML Line:2084*
       puotype = 'CHKIPADDR';

       // PML Line:2085*
       AM006_ = CV_BYKEY;
       CHAIN(NE) DL006_ RKWPUOPT;
       RS006_ = RcdSts2_('GETRCD': %error: %found: %eof);

       // PML Line:2086*
       if (RS006_ = '1');

        // PML Line:2087*
        chkipaddr = puoyesno;
       endif;

       // PML Line:2090*
       puotype = 'SPECHANDL';

       // PML Line:2091*
       AM006_ = CV_BYKEY;
       CHAIN(NE) DL006_ RKWPUOPT;
       RS006_ = RcdSts2_('GETRCD': %error: %found: %eof);

       // PML Line:2092*
       if (RS006_ = '1');

        // PML Line:2093*
        spechandl = puoyesno;
       endif;

       // PML Line:2096*
       puotype = 'VIEWCALL';

       // PML Line:2097*
       AM006_ = CV_BYKEY;
       CHAIN(NE) DL006_ RKWPUOPT;
       RS006_ = RcdSts2_('GETRCD': %error: %found: %eof);

       // PML Line:2098*
       if (RS006_ = '1');

        // PML Line:2099*
        viewcall = puoyesno;
       endif;

       // PML Line:2102*
       puotype = 'VIEWLETT';

       // PML Line:2103*
       AM006_ = CV_BYKEY;
       CHAIN(NE) DL006_ RKWPUOPT;
       RS006_ = RcdSts2_('GETRCD': %error: %found: %eof);

       // PML Line:2104*
       if (RS006_ = '1');

        // PML Line:2105*
        viewlett = puoyesno;
       endif;

       // PML Line:2108*
       puotype = 'EDTFCODES';

       // PML Line:2109*
       AM006_ = CV_BYKEY;
       CHAIN(NE) DL006_ RKWPUOPT;
       RS006_ = RcdSts2_('GETRCD': %error: %found: %eof);

       // PML Line:2110*
       if (RS006_ = '1');

        // PML Line:2111*
        edtfcodes = puoyesno;
       endif;

       // PML Line:2114*
       puotype = 'EDTFCNTA';

       // PML Line:2115*
       AM006_ = CV_BYKEY;
       CHAIN(NE) DL006_ RKWPUOPT;
       RS006_ = RcdSts2_('GETRCD': %error: %found: %eof);

       // PML Line:2116*
       if (RS006_ = '1');

        // PML Line:2117*
        edtfcnta = puoyesno;
       endif;

       // PML Line:2120*
       puotype = 'EDTFCNTB';

       // PML Line:2121*
       AM006_ = CV_BYKEY;
       CHAIN(NE) DL006_ RKWPUOPT;
       RS006_ = RcdSts2_('GETRCD': %error: %found: %eof);

       // PML Line:2122*
       if (RS006_ = '1');

        // PML Line:2123*
        edtfcntb = puoyesno;
       endif;

       // PML Line:2126*
       puotype = 'EDTFACCTC';

       // PML Line:2127*
       AM006_ = CV_BYKEY;
       CHAIN(NE) DL006_ RKWPUOPT;
       RS006_ = RcdSts2_('GETRCD': %error: %found: %eof);

       // PML Line:2128*
       if (RS006_ = '1');

        // PML Line:2129*
        edtfacctc = puoyesno;
       endif;

       // PML Line:2132*
       puotype = 'EDTFLNCDS';

       // PML Line:2133*
       AM006_ = CV_BYKEY;
       CHAIN(NE) DL006_ RKWPUOPT;
       RS006_ = RcdSts2_('GETRCD': %error: %found: %eof);

       // PML Line:2134*
       if (RS006_ = '1');

        // PML Line:2135*
        edtflncds = puoyesno;
       endif;

       // PML Line:2138*
       puotype = 'EDTFPAYCRD';

       // PML Line:2139*
       AM006_ = CV_BYKEY;
       CHAIN(NE) DL006_ RKWPUOPT;
       RS006_ = RcdSts2_('GETRCD': %error: %found: %eof);

       // PML Line:2140*
       if (RS006_ = '1');

        // PML Line:2141*
        edtfpaycrd = puoyesno;
       endif;

       // PML Line:2143*
       puotype = 'USRPIN';

       // PML Line:2144*
       AM006_ = CV_BYKEY;
       CHAIN(NE) DL006_ RKWPUOPT;
       RS006_ = RcdSts2_('GETRCD': %error: %found: %eof);

       // PML Line:2145*
       if (RS006_ = '1');

        // PML Line:2146*
        usrpin = puoyesno;
       endif;

       // PML Line:2148*
       puotype = 'TIMECODE';

       // PML Line:2149*
       AM012_ = CV_BYKEY;
       CHAIN(NE) DL012_ R__FMT03;
       RS012_ = RcdSts2_('GETRCD': %error: %found: %eof);

       // PML Line:2150*
       if (RS012_ = '1');

        // PML Line:2151*
        timecode = puocode;
       endif;

       // PML Line:2153*
       puotype = 'EDTINTFLD';

       // PML Line:2154*
       AM006_ = CV_BYKEY;
       CHAIN(NE) DL006_ RKWPUOPT;
       RS006_ = RcdSts2_('GETRCD': %error: %found: %eof);

       // PML Line:2155*
       if (RS006_ = '1');

        // PML Line:2156*
        edtintfld = puoyesno;
       endif;

       // PML Line:2158*
      /end-free
     c     *PSSR         begsr
     c                   endsr
     P                 E


       // PML Line:2161*

     P*---------------------------------------------------------------------
     P* deletedocbox0...            - User defined function
     P*---------------------------------------------------------------------
     P deletedocbox0...
     P                 B
     D deletedocbox0...
     D                 PI




      /free

       // PML Line:2163*
       boxtype = 'SYSTEM';

       // PML Line:2164*
       p_ztype = 'YESNO';

       // PML Line:2165*
       boxname = 'DELETEDOC';

       // PML Line:2166*
       boxid = 'DELETEDOC';

       // PML Line:2167*
       boxselect = deletedoc;

       // PML Line:2168*
       jvalidation = '';

       // PML Line:2169*
      /end-free
     C                   EVAL      QPGM__=%trim('KWWEB'     ) + '/' + 'SELBOX3'
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

       // PML Line:2171*
      /end-free
     c     *PSSR         begsr
     c                   endsr
     P                 E


       // PML Line:2173*

     P*---------------------------------------------------------------------
     P* deletenotebox0...           - User defined function
     P*---------------------------------------------------------------------
     P deletenotebox0...
     P                 B
     D deletenotebox0...
     D                 PI




      /free

       // PML Line:2175*
       boxtype = 'SYSTEM';

       // PML Line:2176*
       p_ztype = 'YESNO';

       // PML Line:2177*
       boxname = 'DELETENOTE';

       // PML Line:2178*
       boxid = 'DELETENOTE';

       // PML Line:2179*
       boxselect = deletenote;

       // PML Line:2180*
       jvalidation = '';

       // PML Line:2181*
      /end-free
     C                   EVAL      QPGM__=%trim('KWWEB'     ) + '/' + 'SELBOX3'
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

       // PML Line:2183*
      /end-free
     c     *PSSR         begsr
     c                   endsr
     P                 E


       // PML Line:2186*

     P*---------------------------------------------------------------------
     P* deletestipbox0...           - User defined function
     P*---------------------------------------------------------------------
     P deletestipbox0...
     P                 B
     D deletestipbox0...
     D                 PI




      /free

       // PML Line:2188*
       boxtype = 'SYSTEM';

       // PML Line:2189*
       p_ztype = 'YESNO';

       // PML Line:2190*
       boxname = 'DELETESTIP';

       // PML Line:2191*
       boxid = 'DELETESTIP';

       // PML Line:2192*
       boxselect = deletestip;

       // PML Line:2193*
       jvalidation = '';

       // PML Line:2194*
      /end-free
     C                   EVAL      QPGM__=%trim('KWWEB'     ) + '/' + 'SELBOX3'
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

       // PML Line:2196*
      /end-free
     c     *PSSR         begsr
     c                   endsr
     P                 E


       // PML Line:2199*

     P*---------------------------------------------------------------------
     P* ipaddrbox0...               - User defined function
     P*---------------------------------------------------------------------
     P ipaddrbox0...
     P                 B
     D ipaddrbox0...
     D                 PI




      /free

       // PML Line:2201*
       boxtype = 'SYSTEM';

       // PML Line:2202*
       p_ztype = 'YESNO';

       // PML Line:2203*
       boxname = 'CHKIPADDR';

       // PML Line:2204*
       boxid = 'CHKIPADDR';

       // PML Line:2205*
       boxselect = chkipaddr;

       // PML Line:2206*
       jvalidation = '';

       // PML Line:2207*
      /end-free
     C                   EVAL      QPGM__=%trim('KWWEB'     ) + '/' + 'SELBOX3'
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

       // PML Line:2209*
      /end-free
     c     *PSSR         begsr
     c                   endsr
     P                 E


       // PML Line:2213*

     P*---------------------------------------------------------------------
     P* titleamortbox0...           - User defined function
     P*---------------------------------------------------------------------
     P titleamortbox0...
     P                 B
     D titleamortbox0...
     D                 PI




      /free

       // PML Line:2215*
       boxtype = 'SYSTEM';

       // PML Line:2216*
       p_ztype = 'YESNO';

       // PML Line:2217*
       boxname = 'TITLEAMORT';

       // PML Line:2218*
       boxid = 'TITLEAMORT';

       // PML Line:2219*
       boxselect = titleamort;

       // PML Line:2220*
       jvalidation = '';

       // PML Line:2221*
      /end-free
     C                   EVAL      QPGM__=%trim('KWWEB'     ) + '/' + 'SELBOX3'
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

       // PML Line:2223*
      /end-free
     c     *PSSR         begsr
     c                   endsr
     P                 E


       // PML Line:2227*

     P*---------------------------------------------------------------------
     P* overbox0...                 - User defined function
     P*---------------------------------------------------------------------
     P overbox0...
     P                 B
     D overbox0...
     D                 PI




      /free

       // PML Line:2229*
       boxtype = 'SYSTEM';

       // PML Line:2230*
       p_ztype = 'YESNO';

       // PML Line:2231*
       boxname = 'OVERVER';

       // PML Line:2232*
       boxid = 'OVERVER';

       // PML Line:2233*
       boxselect = overver;

       // PML Line:2234*
       jvalidation = '';

       // PML Line:2235*
      /end-free
     C                   EVAL      QPGM__=%trim('KWWEB'     ) + '/' + 'SELBOX3'
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

       // PML Line:2237*
      /end-free
     c     *PSSR         begsr
     c                   endsr
     P                 E


       // PML Line:2238*

     P*---------------------------------------------------------------------
     P* lnexpovrbox0...             - User defined function
     P*---------------------------------------------------------------------
     P lnexpovrbox0...
     P                 B
     D lnexpovrbox0...
     D                 PI




      /free

       // PML Line:2240*
       boxtype = 'SYSTEM';

       // PML Line:2241*
       p_ztype = 'YESNO';

       // PML Line:2242*
       boxname = 'LNEXPOVR';

       // PML Line:2243*
       boxid = 'LNEXPOVR';

       // PML Line:2244*
       boxselect = lnexpovr;

       // PML Line:2245*
       jvalidation = '';

       // PML Line:2246*
      /end-free
     C                   EVAL      QPGM__=%trim('KWWEB'     ) + '/' + 'SELBOX3'
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

       // PML Line:2248*
      /end-free
     c     *PSSR         begsr
     c                   endsr
     P                 E


       // PML Line:2249*

     P*---------------------------------------------------------------------
     P* cnclappbox0...              - User defined function
     P*---------------------------------------------------------------------
     P cnclappbox0...
     P                 B
     D cnclappbox0...
     D                 PI




      /free

       // PML Line:2251*
       boxtype = 'SYSTEM';

       // PML Line:2252*
       p_ztype = 'YESNO';

       // PML Line:2253*
       boxname = 'CNCLAPP';

       // PML Line:2254*
       boxid = 'CNCLAPP';

       // PML Line:2255*
       boxselect = cnclapp;

       // PML Line:2256*
       jvalidation = '';

       // PML Line:2257*
      /end-free
     C                   EVAL      QPGM__=%trim('KWWEB'     ) + '/' + 'SELBOX3'
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

       // PML Line:2259*
      /end-free
     c     *PSSR         begsr
     c                   endsr
     P                 E


       // PML Line:2262*

     P*---------------------------------------------------------------------
     P* lnopnovrbox0...             - User defined function
     P*---------------------------------------------------------------------
     P lnopnovrbox0...
     P                 B
     D lnopnovrbox0...
     D                 PI




      /free

       // PML Line:2264*
       boxtype = 'SYSTEM';

       // PML Line:2265*
       p_ztype = 'YESNO';

       // PML Line:2266*
       boxname = 'LNOPNOVR';

       // PML Line:2267*
       boxid = 'LNOPNOVR';

       // PML Line:2268*
       boxselect = lnopnovr;

       // PML Line:2269*
       jvalidation = '';

       // PML Line:2270*
      /end-free
     C                   EVAL      QPGM__=%trim('KWWEB'     ) + '/' + 'SELBOX3'
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

       // PML Line:2272*
      /end-free
     c     *PSSR         begsr
     c                   endsr
     P                 E


       // PML Line:2274*

     P*---------------------------------------------------------------------
     P* lnfundovrbox0...            - User defined function
     P*---------------------------------------------------------------------
     P lnfundovrbox0...
     P                 B
     D lnfundovrbox0...
     D                 PI




      /free

       // PML Line:2276*
       boxtype = 'SYSTEM';

       // PML Line:2277*
       p_ztype = 'YESNO';

       // PML Line:2278*
       boxname = 'LNFUNDOVR';

       // PML Line:2279*
       boxid = 'LNFUNDOVR';

       // PML Line:2280*
       boxselect = lnfundovr;

       // PML Line:2281*
       jvalidation = '';

       // PML Line:2282*
      /end-free
     C                   EVAL      QPGM__=%trim('KWWEB'     ) + '/' + 'SELBOX3'
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

       // PML Line:2284*
      /end-free
     c     *PSSR         begsr
     c                   endsr
     P                 E


       // PML Line:2287*

     P*---------------------------------------------------------------------
     P* edtscraflgbox0...           - User defined function
     P*---------------------------------------------------------------------
     P edtscraflgbox0...
     P                 B
     D edtscraflgbox0...
     D                 PI




      /free

       // PML Line:2289*
       boxtype = 'SYSTEM';

       // PML Line:2290*
       p_ztype = 'YESNO';

       // PML Line:2291*
       boxname = 'EDTSCRAFLG';

       // PML Line:2292*
       boxid = 'EDTSCRAFLG';

       // PML Line:2293*
       boxselect = edtscraflg;

       // PML Line:2294*
       jvalidation = '';

       // PML Line:2295*
      /end-free
     C                   EVAL      QPGM__=%trim('KWWEB'     ) + '/' + 'SELBOX3'
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

       // PML Line:2296*
      /end-free
     c     *PSSR         begsr
     c                   endsr
     P                 E


       // PML Line:2299*

     P*---------------------------------------------------------------------
     P* spechandlbox0...            - User defined function
     P*---------------------------------------------------------------------
     P spechandlbox0...
     P                 B
     D spechandlbox0...
     D                 PI




      /free

       // PML Line:2301*
       boxtype = 'SYSTEM';

       // PML Line:2302*
       p_ztype = 'YESNO';

       // PML Line:2303*
       boxname = 'SPECHANDL';

       // PML Line:2304*
       boxid = 'SPECHANDL';

       // PML Line:2305*
       boxselect = spechandl;

       // PML Line:2306*
       jvalidation = '';

       // PML Line:2307*
      /end-free
     C                   EVAL      QPGM__=%trim('KWWEB'     ) + '/' + 'SELBOX3'
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

       // PML Line:2308*
      /end-free
     c     *PSSR         begsr
     c                   endsr
     P                 E


       // PML Line:2310*

     P*---------------------------------------------------------------------
     P* view_letters_bx0...         - User defined function
     P*---------------------------------------------------------------------
     P view_letters_bx0...
     P                 B
     D view_letters_bx0...
     D                 PI




      /free

       // PML Line:2312*
       boxtype = 'SYSTEM';

       // PML Line:2313*
       p_ztype = 'YESNO';

       // PML Line:2314*
       boxname = 'VIEWLETT';

       // PML Line:2315*
       boxid = 'VIEWLETT';

       // PML Line:2316*
       boxselect = viewlett;

       // PML Line:2317*
       jvalidation = '';

       // PML Line:2318*
      /end-free
     C                   EVAL      QPGM__=%trim('KWWEB'     ) + '/' + 'SELBOX3'
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

       // PML Line:2319*
      /end-free
     c     *PSSR         begsr
     c                   endsr
     P                 E


       // PML Line:2321*

     P*---------------------------------------------------------------------
     P* view_callrec_bx0...         - User defined function
     P*---------------------------------------------------------------------
     P view_callrec_bx0...
     P                 B
     D view_callrec_bx0...
     D                 PI




      /free

       // PML Line:2323*
       boxtype = 'SYSTEM';

       // PML Line:2324*
       p_ztype = 'YESNO';

       // PML Line:2325*
       boxname = 'VIEWCALL';

       // PML Line:2326*
       boxid = 'VIEWCALL';

       // PML Line:2327*
       boxselect = viewcall;

       // PML Line:2328*
       jvalidation = '';

       // PML Line:2329*
      /end-free
     C                   EVAL      QPGM__=%trim('KWWEB'     ) + '/' + 'SELBOX3'
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

       // PML Line:2330*
      /end-free
     c     *PSSR         begsr
     c                   endsr
     P                 E


       // PML Line:2332*

     P*---------------------------------------------------------------------
     P* edtfld_codes_bx0...         - User defined function
     P*---------------------------------------------------------------------
     P edtfld_codes_bx0...
     P                 B
     D edtfld_codes_bx0...
     D                 PI




      /free

       // PML Line:2334*
       boxtype = 'SYSTEM';

       // PML Line:2335*
       p_ztype = 'YESNO';

       // PML Line:2336*
       boxname = 'EDTFCODES';

       // PML Line:2337*
       boxid = 'EDTFCODES';

       // PML Line:2338*
       boxselect = edtfcodes;

       // PML Line:2339*
       jvalidation = '';

       // PML Line:2340*
      /end-free
     C                   EVAL      QPGM__=%trim('KWWEB'     ) + '/' + 'SELBOX3'
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

       // PML Line:2341*
      /end-free
     c     *PSSR         begsr
     c                   endsr
     P                 E


       // PML Line:2343*

     P*---------------------------------------------------------------------
     P* edtfld_cnta_bx0...          - User defined function
     P*---------------------------------------------------------------------
     P edtfld_cnta_bx0...
     P                 B
     D edtfld_cnta_bx0...
     D                 PI




      /free

       // PML Line:2345*
       boxtype = 'SYSTEM';

       // PML Line:2346*
       p_ztype = 'YESNO';

       // PML Line:2347*
       boxname = 'EDTFCNTA';

       // PML Line:2348*
       boxid = 'EDTFCNTA';

       // PML Line:2349*
       boxselect = edtfcnta;

       // PML Line:2350*
       jvalidation = '';

       // PML Line:2351*
      /end-free
     C                   EVAL      QPGM__=%trim('KWWEB'     ) + '/' + 'SELBOX3'
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

       // PML Line:2352*
      /end-free
     c     *PSSR         begsr
     c                   endsr
     P                 E


       // PML Line:2354*

     P*---------------------------------------------------------------------
     P* edtfld_cntb_bx0...          - User defined function
     P*---------------------------------------------------------------------
     P edtfld_cntb_bx0...
     P                 B
     D edtfld_cntb_bx0...
     D                 PI




      /free

       // PML Line:2356*
       boxtype = 'SYSTEM';

       // PML Line:2357*
       p_ztype = 'YESNO';

       // PML Line:2358*
       boxname = 'EDTFCNTB';

       // PML Line:2359*
       boxid = 'EDTFCNTB';

       // PML Line:2360*
       boxselect = edtfcntb;

       // PML Line:2361*
       jvalidation = '';

       // PML Line:2362*
      /end-free
     C                   EVAL      QPGM__=%trim('KWWEB'     ) + '/' + 'SELBOX3'
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

       // PML Line:2363*
      /end-free
     c     *PSSR         begsr
     c                   endsr
     P                 E


       // PML Line:2365*

     P*---------------------------------------------------------------------
     P* edtfld_acctc_bx0...         - User defined function
     P*---------------------------------------------------------------------
     P edtfld_acctc_bx0...
     P                 B
     D edtfld_acctc_bx0...
     D                 PI




      /free

       // PML Line:2367*
       boxtype = 'SYSTEM';

       // PML Line:2368*
       p_ztype = 'YESNO';

       // PML Line:2369*
       boxname = 'EDTFACCTC';

       // PML Line:2370*
       boxid = 'EDTFACCTC';

       // PML Line:2371*
       boxselect = edtfacctc;

       // PML Line:2372*
       jvalidation = '';

       // PML Line:2373*
      /end-free
     C                   EVAL      QPGM__=%trim('KWWEB'     ) + '/' + 'SELBOX3'
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

       // PML Line:2374*
      /end-free
     c     *PSSR         begsr
     c                   endsr
     P                 E


       // PML Line:2376*

     P*---------------------------------------------------------------------
     P* edtfld_lncds_bx0...         - User defined function
     P*---------------------------------------------------------------------
     P edtfld_lncds_bx0...
     P                 B
     D edtfld_lncds_bx0...
     D                 PI




      /free

       // PML Line:2378*
       boxtype = 'SYSTEM';

       // PML Line:2379*
       p_ztype = 'YESNO';

       // PML Line:2380*
       boxname = 'EDTFLNCDS';

       // PML Line:2381*
       boxid = 'EDTFLNCDS';

       // PML Line:2382*
       boxselect = edtflncds;

       // PML Line:2383*
       jvalidation = '';

       // PML Line:2384*
      /end-free
     C                   EVAL      QPGM__=%trim('KWWEB'     ) + '/' + 'SELBOX3'
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

       // PML Line:2385*
      /end-free
     c     *PSSR         begsr
     c                   endsr
     P                 E


       // PML Line:2387*

     P*---------------------------------------------------------------------
     P* edtfld_paycrd_bx0...        - User defined function
     P*---------------------------------------------------------------------
     P edtfld_paycrd_bx0...
     P                 B
     D edtfld_paycrd_bx0...
     D                 PI




      /free

       // PML Line:2389*
       boxtype = 'SYSTEM';

       // PML Line:2390*
       p_ztype = 'YESNO';

       // PML Line:2391*
       boxname = 'EDTFPAYCRD';

       // PML Line:2392*
       boxid = 'EDTFPAYCRD';

       // PML Line:2393*
       boxselect = edtfpaycrd;

       // PML Line:2394*
       jvalidation = '';

       // PML Line:2395*
      /end-free
     C                   EVAL      QPGM__=%trim('KWWEB'     ) + '/' + 'SELBOX3'
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

       // PML Line:2396*
      /end-free
     c     *PSSR         begsr
     c                   endsr
     P                 E


       // PML Line:2399*

     P*---------------------------------------------------------------------
     P* edtfld_usrpin_bx0...        - User defined function
     P*---------------------------------------------------------------------
     P edtfld_usrpin_bx0...
     P                 B
     D edtfld_usrpin_bx0...
     D                 PI




      /free

       // PML Line:2401*
       boxtype = 'SYSTEM';

       // PML Line:2402*
       p_ztype = 'YESNO';

       // PML Line:2403*
       boxname = 'USRPIN';

       // PML Line:2404*
       boxid = 'USRPIN';

       // PML Line:2405*
       boxselect = usrpin;

       // PML Line:2406*
       jvalidation = '';

       // PML Line:2407*
      /end-free
     C                   EVAL      QPGM__=%trim('KWWEB'     ) + '/' + 'SELBOX3'
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

       // PML Line:2408*
      /end-free
     c     *PSSR         begsr
     c                   endsr
     P                 E


       // PML Line:2410*

     P*---------------------------------------------------------------------
     P* timebox0...                 - User defined function
     P*---------------------------------------------------------------------
     P timebox0...
     P                 B
     D timebox0...
     D                 PI




      /free

       // PML Line:2412*
       OutWeb_('<select name="TIMECODE" id="TIMECODE">');

       // PML Line:2413*
       OutWeb_('<option value="">-- Select Time --</option>');

       // PML Line:2416*
       timquery = 'SELECT KWUTMCODE, KWUTMDESC from KWPUTIME';
      /end-free
     C/Exec SQL
     C+            Declare TIMES Scroll Cursor
     C+            For TIMES
     C/End-Exec
     C/Exec SQL
     C+            Prepare TIMES
     C+            From :timquery
     C/End-Exec
      /free
       if (sqlcod >= 0);
      /end-free
     C/Exec SQL
     C+            Open TIMES
     C/End-Exec
      /free
       endif;
      /end-free
     C/Exec SQL
     C+  FETCH NEXT FROM TIMES INTO :KWUTMCODE, :KWUTMDESC
     C/End-Exec
      /free

       // PML Line:2421*
       dow ((((sqlcod <> 100)) and ((sqlcod >= 0))));

       // PML Line:2422*
       if (timecode = kwutmcode);

        // PML Line:2423*
        OutWeb_(%trimr( '<option selected value="' + kwutmcode + '">' +
       kwutmdesc + '</option>'));

        // PML Line:2424*
       else;

        // PML Line:2425*
        OutWeb_(%trimr( '<option value="' + kwutmcode + '">' + kwutmdesc + '<-
       /option>'));
       endif;
      /end-free
     C/Exec SQL
     C+  FETCH NEXT FROM TIMES INTO :KWUTMCODE, :KWUTMDESC
     C/End-Exec
      /free
       enddo;
      /end-free
     C/Exec SQL
     C+  CLOSE TIMES
     C/End-Exec
      /free

       // PML Line:2431*
       OutWeb_('</select>');

       // PML Line:2432*
      /end-free
     c     *PSSR         begsr
     c                   endsr
     P                 E


       // PML Line:2434*

     P*---------------------------------------------------------------------
     P* edtfld_edtintfld_bx0...     - User defined function
     P*---------------------------------------------------------------------
     P edtfld_edtintfld_bx0...
     P                 B
     D edtfld_edtintfld_bx0...
     D                 PI




      /free

       // PML Line:2436*
       boxtype = 'SYSTEM';

       // PML Line:2437*
       p_ztype = 'YESNO';

       // PML Line:2438*
       boxname = 'EDTINTFLD';

       // PML Line:2439*
       boxid = 'EDTINTFLD';

       // PML Line:2440*
       boxselect = edtintfld;

       // PML Line:2441*
       jvalidation = '';

       // PML Line:2442*
      /end-free
     C                   EVAL      QPGM__=%trim('KWWEB'     ) + '/' + 'SELBOX3'
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

       // PML Line:2443*
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
     C                   TIME                    CURTIME__
      /free
      /end-free
      /free
       QPGMNAM__=%trim(PGMNAME__) + '.pgm';

       // Initialize library list array for current job to find files
       rtlla__(1) = 'KWDB';
       rtlla__(2) = 'KWIK';
       rtlla__(3) = 'KWDB108';

       // Set the runtime library for support object references.
       // Also, determine job type
       jobtype__ = SetRtLib_('XL_WEBSPT');

       // Test for debug being active for this program.
       if  chkdbg_(pgmname__: pgmlib__) = *ON;
        CALLP pw_dbgput(PGMNAME__:PGMLIB__);
       endif;

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

        // End debug
        if  chkdbg_(pgmname__: pgmlib__) = *ON;
         CALLP pw_dbgend(PGMNAME__:PGMLIB__);
        endif;
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
       if   ((file__='KWPUBASE' or file__='*ALL') and NOT %OPEN(KWPUBASE));
        if (mbr__ <> '*FIRST');
         ovrdbf_(ovrflag__:'KWPUBASE':'KWPUBASE' : '*LIBL' : mbr__);
        elseif ('KWPUBASE' <> 'KWPUBASE');
         ovrdbf_(ovrflag__:'KWPUBASE':'KWPUBASE' : '*LIBL');
        endif;
        if    erropen__ = 'Y';
         OPEN(E) KWPUBASE;             //    KWPUBASE
         if        %error;
          return %error;
         endif;
        else;
         OPEN KWPUBASE;                //    KWPUBASE
        endif;
       endif;
       if   (file__='KWPUBASE' or file__='*ALL')  and NOT %OPEN(F__ARR001);
        ovrdbf_(ovrflag__:'F__ARR001':'KWPUBASE' : '*LIBL' : mbr__);
        if   erropen__ = 'Y';
         OPEN(E) F__ARR001;          //   KWPUBASE
         if        %error;
          return %error;
         endif;
        else;
         OPEN F__ARR001;            //    KWPUBASE
        endif;
       endif;
       if   ((file__='KWPUAMT' or file__='*ALL') and NOT %OPEN(KWPUAMT));
        if (mbr__ <> '*FIRST');
         ovrdbf_(ovrflag__:'KWPUAMT':'KWPUAMT' : '*LIBL' : mbr__);
        elseif ('KWPUAMT' <> 'KWPUAMT');
         ovrdbf_(ovrflag__:'KWPUAMT':'KWPUAMT' : '*LIBL');
        endif;
        if    erropen__ = 'Y';
         OPEN(E) KWPUAMT;                //    KWPUAMT
         if        %error;
          return %error;
         endif;
        else;
         OPEN KWPUAMT;                //    KWPUAMT
        endif;
       endif;
       if   ((file__='KWPUCASH' or file__='*ALL') and NOT %OPEN(KWPUCASH));
        if (mbr__ <> '*FIRST');
         ovrdbf_(ovrflag__:'KWPUCASH':'KWPUCASH' : '*LIBL' : mbr__);
        elseif ('KWPUCASH' <> 'KWPUCASH');
         ovrdbf_(ovrflag__:'KWPUCASH':'KWPUCASH' : '*LIBL');
        endif;
        if    erropen__ = 'Y';
         OPEN(E) KWPUCASH;                //    KWPUCASH
         if        %error;
          return %error;
         endif;
        else;
         OPEN KWPUCASH;                //    KWPUCASH
        endif;
       endif;
       if   ((file__='KWPULOC' or file__='*ALL') and NOT %OPEN(KWPULOC));
        if (mbr__ <> '*FIRST');
         ovrdbf_(ovrflag__:'KWPULOC':'KWPULOC' : '*LIBL' : mbr__);
        elseif ('KWPULOC' <> 'KWPULOC');
         ovrdbf_(ovrflag__:'KWPULOC':'KWPULOC' : '*LIBL');
        endif;
        if    erropen__ = 'Y';
         OPEN(E) KWPULOC;                //    KWPULOC
         if        %error;
          return %error;
         endif;
        else;
         OPEN KWPULOC;                //    KWPULOC
        endif;
       endif;
       if   ((file__='KWIKUSER' or file__='*ALL') and NOT %OPEN(KWIKUSER));
        if (mbr__ <> '*FIRST');
         ovrdbf_(ovrflag__:'KWIKUSER':'KWIKUSER' : '*LIBL' : mbr__);
        elseif ('KWIKUSER' <> 'KWIKUSER');
         ovrdbf_(ovrflag__:'KWIKUSER':'KWIKUSER' : '*LIBL');
        endif;
        if    erropen__ = 'Y';
         OPEN(E) KWIKUSER;                //    KWIKUSER
         if        %error;
          return %error;
         endif;
        else;
         OPEN KWIKUSER;                //    KWIKUSER
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
       if   ((file__='KWPLBASE' or file__='*ALL') and NOT %OPEN(KWPLBASE));
        if (mbr__ <> '*FIRST');
         ovrdbf_(ovrflag__:'KWPLBASE':'KWPLBASE' : '*LIBL' : mbr__);
        elseif ('KWPLBASE' <> 'KWPLBASE');
         ovrdbf_(ovrflag__:'KWPLBASE':'KWPLBASE' : '*LIBL');
        endif;
        if    erropen__ = 'Y';
         OPEN(E) KWPLBASE;                //    KWPLBASE
         if        %error;
          return %error;
         endif;
        else;
         OPEN KWPLBASE;                //    KWPLBASE
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
       if   ((file__='KWPUTWILIO' or file__='*ALL') and NOT %OPEN(KWPUTWILIO));
        if (mbr__ <> '*FIRST');
         ovrdbf_(ovrflag__:'KWPUTWILIO':'KWPUTWILIO' : '*LIBL' : mbr__);
        elseif ('KWPUTWILIO' <> 'KWPUTWILIO');
         ovrdbf_(ovrflag__:'KWPUTWILIO':'KWPUTWILIO' : '*LIBL');
        endif;
        if    erropen__ = 'Y';
         OPEN(E) KWPUTWILIO;                //    KWPUTWILIO
         if        %error;
          return %error;
         endif;
        else;
         OPEN KWPUTWILIO;                //    KWPUTWILIO
        endif;
       endif;
       if   ((file__='KWPUFSP' or file__='*ALL') and NOT %OPEN(KWPUFSP));
        if (mbr__ <> '*FIRST');
         ovrdbf_(ovrflag__:'KWPUFSP':'KWPUFSP' : '*LIBL' : mbr__);
        elseif ('KWPUFSP' <> 'KWPUFSP');
         ovrdbf_(ovrflag__:'KWPUFSP':'KWPUFSP' : '*LIBL');
        endif;
        if    erropen__ = 'Y';
         OPEN(E) KWPUFSP;                //    KWPUFSP
         if        %error;
          return %error;
         endif;
        else;
         OPEN KWPUFSP;                //    KWPUFSP
        endif;
       endif;
       if   ((file__='KWPUTIME' or file__='*ALL') and NOT %OPEN(KWPUTIME));
        if (mbr__ <> '*FIRST');
         ovrdbf_(ovrflag__:'KWPUTIME':'KWPUTIME' : '*LIBL' : mbr__);
        elseif ('KWPUTIME' <> 'KWPUTIME');
         ovrdbf_(ovrflag__:'KWPUTIME':'KWPUTIME' : '*LIBL');
        endif;
        if    erropen__ = 'Y';
         OPEN(E) KWPUTIME;                //    KWPUTIME
         if        %error;
          return %error;
         endif;
        else;
         OPEN KWPUTIME;                //    KWPUTIME
        endif;
       endif;
       if   ((file__='KWPUOPT2' or file__='*ALL') and NOT %OPEN(KWPUOPT2));
        if (mbr__ <> '*FIRST');
         ovrdbf_(ovrflag__:'KWPUOPT2':'KWPUOPT2' : '*LIBL' : mbr__);
        elseif ('KWPUOPT2' <> 'KWPUOPT2');
         ovrdbf_(ovrflag__:'KWPUOPT2':'KWPUOPT2' : '*LIBL');
        endif;
        if    erropen__ = 'Y';
         OPEN(E) KWPUOPT2;                //    KWPUOPT2
         if        %error;
          return %error;
         endif;
        else;
         OPEN KWPUOPT2;                //    KWPUOPT2
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
       when      rcdfmt__='RKWPUBASE' and AM001_ = CV_ByKey and RS001_ = *ON ;
       update RKWPUBASE;
       when      rcdfmt__='RKWPUBASE' and AM001_ = CV_ByRrn and RS001_ = *ON ;
       update R__ARR001;
       when      rcdfmt__='RKWPULOC' and AM002_ = CV_ByKey and RS002_ = *ON ;
       update RKWPULOC;
       when      rcdfmt__='RKWPUCASH' and AM003_ = CV_ByKey and RS003_ = *ON ;
       update RKWPUCASH;
       when      rcdfmt__='RKWUSER' and AM005_ = CV_ByKey and RS005_ = *ON ;
       update RKWUSER;
       when      rcdfmt__='RKWPUOPT' and AM006_ = CV_ByKey and RS006_ = *ON ;
       update RKWPUOPT;
       when      rcdfmt__='RKWPDATA' and AM008_ = CV_ByKey and RS008_ = *ON ;
       update RKWPDATA;
       when      rcdfmt__='RKWPUTWILI' and AM009_ = CV_ByKey and RS009_ = *ON ;
       update RKWPUTWILI;
       when      rcdfmt__='R__FMT02' and AM010_ = CV_ByKey and RS010_ = *ON ;
       update R__FMT02;
       when      rcdfmt__='R__FMT03' and AM012_ = CV_ByKey and RS012_ = *ON ;
       update R__FMT03;
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
       when      rcdfmt__='RKWPUBASE' and AM001_ = CV_ByKey and RS001_ = *ON ;
       delete RKWPUBASE;
       when      rcdfmt__='RKWPUBASE' and AM001_ = CV_ByRrn and RS001_ = *ON ;
       delete R__ARR001;
       when      rcdfmt__='RKWPULOC' and AM002_ = CV_ByKey and RS002_ = *ON ;
       delete RKWPULOC;
       when      rcdfmt__='RKWPUCASH' and AM003_ = CV_ByKey and RS003_ = *ON ;
       delete RKWPUCASH;
       when      rcdfmt__='R__FMT01' and AM004_ = CV_ByKey and RS004_ = *ON ;
       delete R__FMT01;
       when      rcdfmt__='RKWUSER' and AM005_ = CV_ByKey and RS005_ = *ON ;
       delete RKWUSER;
       when      rcdfmt__='RKWPUOPT' and AM006_ = CV_ByKey and RS006_ = *ON ;
       delete RKWPUOPT;
       when      rcdfmt__='RKWPDATA' and AM008_ = CV_ByKey and RS008_ = *ON ;
       delete RKWPDATA;
       when      rcdfmt__='RKWPUTWILI' and AM009_ = CV_ByKey and RS009_ = *ON ;
       delete RKWPUTWILI;
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

       // End debug
       if  chkdbg_(pgmname__: pgmlib__) = *ON;
        CALLP pw_dbgend(PGMNAME__:PGMLIB__);
       endif;

       // Close all files and shut down program:
       if ovrflag__ = '1';
        ExecCmd2_('dltovr file(*all)':17);
       endif;
       Shutdown_();                          //     Shut down completely

      /end-free
     P Exit_Immed_     E



      *--------------------------------------------------------------------------------------------*
      * SndPgmMsg_  - Send Program Message to previous program message queue
      *--------------------------------------------------------------------------------------------*
     P SndPgmMsg_      B
     D SndPgmMsg_      PI             1A
     D Msid                           7A   value
     D Msfil                         10A   value
     D Mslib                         10A   value
     D Msdata                        70A

     D  MSQFIL         S             20
     D  MSDLEN         S              8B 0 INZ(70)
     D  MSTYP          S             10
     D  MSQUE          S             10
     D  MSTAK_         S              8B 0
     D  MSKEY          S              4

     D  rtncd          S              1

     D ERRDS           DS
     D  ERBP                   1      4B 0
     D  ERBA                   5      8B 0
     D  EREXCP                 9     15
     D  ERRESV                10     10
     D  EREXDT                11    266
     C                   Z-ADD     266           ERBP
     C                   CLEAR                   ERBA

     C                   eval      msqfil =msfil+mslib

     C                   CALL      'QMHSNDPM'
     C                   PARM                    MSID
     C                   PARM                    MSQFIL
     C                   PARM                    MSData
     C                   PARM      70            MSDLEN
      * Value of * for msque and 1 for stack causes msg to be sent to previous
      * Pgm msgq in this job's program stack:
     C                   PARM      '*DIAG  '     MSTYP
     C                   PARM      '*'           MSQUE
     C                   PARM      1             MSTAK_
     C                   PARM                    MSKEY
      * Error info on call to api:
     C                   PARM                    ERRDS

     C                   RETURN                  rtncd
     P SndPgmMsg_      E





      *+CTARRS Compile-time Arrays go here:
**CTDATA PTL__      Program title contents
System Settings:  Users
**CTDATA H__1        ListHeader                       2985
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.or
g/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>
    <meta name="genera
tor" content="WebSmart" />
    <meta http-equiv="Pragma" content="no-cache" />

   <title>System Settings:  Users</title>
    <link rel="stylesheet" type="text/
css" href="/websmart/kwikloan/styles/klstylei.css" media="screen, tv, projection
" />
    <link rel="stylesheet" type="text/css" href="/websmart/kwikloan/styles/
klstyleInquiryList.css" media="screen, tv, projection" />
    <script type="text
/javascript" src="/websmart/kwikloan/javascript/klscripts.js"></script>
  </head
>
  <body>
    <div id="wrapping">
      <div id="everything">
        <div id="
pagetitle">
          <span>Loan Search</span>
        </div>  
        <div id=
"whitebg" class="whitebg">
          <div class="left">
            <table class
="actionsTable">
              <!-- <tr><td><a href="#" onclick="window.location
='?task=beginmanage&rrn=0&rnd='"><img src="https://sv1.americanfirstfinance.com:
8158/websmart/kwikloan/images/modalIconsAN.png"></a><span class="LSlabel"></span
></td></tr>-->     
              <tr><td><a href="#" onclick=""><img src="https
://sv1.americanfirstfinance.com:8158/websmart/kwikloan/images/loanInqADD.png"></
a><span class="LSlabel"></span></td></tr>     
              <tr><td><a id="prev
linkbot" href="?task=prev&rrn=" class="nonDisplay"><img src="https://sv1.america
nfirstfinance.com:8158/websmart/kwikloan/images/loanInqLSpp.png"> </a></td></tr>
 
         <tr><td> <a id="nextlinkbot" href="?rrn=" class="nonDisplay"><img src
="https://sv1.americanfirstfinance.com:8158/websmart/kwikloan/images/loanInqLSnp
.png"></a> </td></tr>
        
            </table> 
            
            <f
orm method="get" action="">
              <input type="hidden" name="task" value
="DEFAULT">
              <table class="accountInfo" id="loanSearchTable">

           <tr>
                  <td id="Lname"><span class="LSlabel">User ID:<
/span><br><input type="text" name="fPUID" size="32" maxlength="32" value=""></td
>
                </tr>
                <tr>
                  <td><br><br><inpu
t type="submit" value="Filter Results"><br>
                  </td>

    </tr>
                <tr><td></td></tr>
              </table> 

 </form>
            
          </div><!--left-->
          <div class="right">

            <div id="scroller">
              <div id="sections">

  <ul>
                <li>
                
                <table class="mainl
ist">
                  <tr>
                    
                    

           <th width="100">Action</th>
                    <th width="320" valig
n="top">User ID</th>
                    <th width="250">User Profile</th>

               <th width="400">User Name</th>
                    <th width="400
">Email Address</th>
                    
                    

 </tr>

**CTDATA H__2        ListDetails                      583
<tr class="">
 <!-- <td><a href="?TASK=disp&rrn=&FirstRowRRN="><img src="/websma
rt/v7.2/Lincoln/images/view.gif" alt="Display" title="Display"></a>
        <a h
ref="?TASK=beginmanage&rrn=&FirstRowRRN="><img src="/websmart/v7.2/Lincoln/image
s/edit.gif"  alt="Edit" title="Edit"></a>
        <a href="?TASK=delconf&rrn=&Fi
rstRowRRN="><img src="/websmart/v7.2/Lincoln/images/delete.gif" alt="Delete" tit
le="Delete"></a>
      </td> -->
      <td>
      
      
      
      </td>
  <
td class="text"></td>
  <td class="text"></td>
  <td class="text"></td>
  <td cl
ass="text"></td>
</tr>

**CTDATA H__3        ListFooter                       771
</table>
<input type="hidden" name="prevpage" value="">
<input type="hidden" nam
e="nextpage" value="">
</form>
</li>
</ul>
</div><!--sections-->
</div><!--scrol
ler-->
</div><!--right-->
</div><!--whitebg-->
</div><!--everything-->
</div><!-
-wrapping-->

<script type="text/javascript">
function handleButtons() {
	// wri
te the PREV link if necessary
	if( > 0)
	{
	 
		document.getElementById("prevlin
kbot").className ="";
	 
		document.getElementById("prevlinkbot").href="?task=pr
ev&rrn=";
		
	}
	
	// write the NEXT link if necessary
	if( > 0)
	{
	 
		documen
t.getElementById("nextlinkbot").className ="";
		 
		document.getElementById("ne
xtlinkbot").href="?task=DEFAULT&rrn=";
	}
}
	
</script>
<script type="text/javas
cript">
handleButtons();
</script>
</body>
</html>

**CTDATA H__4        RcdDisplay                       3096
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.or
g/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>
    <meta name="genera
tor" content="WebSmart" />
    <meta http-equiv="Pragma" content="no-cache" />

   <title>System Settings:  Users - Display</title>
<link rel="stylesheet" type=
"text/css" href="/websmart/kwikloan/styles/klDFtheme.css" media="screen, tv, pro
jection" title="default"/>
    <link rel="alternate stylesheet" type="text/css"
href="/websmart/kwikloan/styles/klBStheme.css" media="screen, tv, projection" ti
tle="bluesky"/>
    <link rel="alternate stylesheet" type="text/css" href="/webs
mart/kwikloan/styles/klRDtheme.css" media="screen, tv, projection" title="reddev
il"/>
    <link rel="alternate stylesheet" type="text/css" href="/websmart/kwikl
oan/styles/klOCtheme.css" media="screen, tv, projection" title="orangecrush"/>

       <link rel="stylesheet" type="text/css" href="/websmart/kwikloan/styles/kl
stylei.css" media="screen, tv, projection" />
    <script type="text/javascript"
 src="/websmart/kwikloan/javascript/klscripts.js"></script>
    <script type="te
xt/javascript" src="/websmart/kwikloan/javascript/klthemes.js"></script>
    <sc
ript type="text/javascript" src="/websmart/v7.2/javascript/esdiapi010.js"></scri
pt>
    
  </head>
  <body>
  <div id="wrapping">
  <div id="everything">
  
  

  <div id="pagetitle">
  	<span>System Settings:  Users</span>
  </div>
  
  <di
v id="whitebg">
  <div id="EDITtitle"><span>View User Settings</span></div>

<div id="EDITcontents"> 
      <div id="navtop">
        
        
      </div>

      <table>
        
        <tr>
          <td class="left">User ID:</td>

       <td class="right"></td>
        </tr>
        <tr>
          <td class="l
eft">User Profile:</td>
          <td class="right"></td>
        </tr>

<tr>
          <td class="left">User Name:</td>
          <td class="right"></td
>
        </tr>
        <tr>
          <td class="left">User Title:</td>

   <td class="right"></td>
        </tr>
        <tr>
          <td class="left"
>Email Address:</td>
          <td class="right"></td>
        </tr>
        <tr
>
          <td class="left">Initials:</td>
          <td class="right"></td>

      </tr>
        <tr>
          <td class="left">Loan Product:</td>

 <td class="right"></td>
        </tr>
        <tr>
          <td class="left">M
inimum Cash:</td>
          <td class="right"></td>
        </tr>
        <tr>

         <td class="left">User Cash Limit 1:</td>
          <td class="right"></
td>
        </tr>
        <tr>
          <td class="left">User Cash Limit 2:</td
>
          <td class="right"></td>
        </tr>
         <tr>
          <td cl
ass="left">Unsecured Approval Limit:</td>
          <td class="right"></td>

    </tr>
         <tr>
          <td class="left">Goods Approval Limit:</td>

        <td class="right"></td>
        </tr>
         <tr>
          <td class=
"left">Vehicle Approval Limit:</td>
          <td class="right"></td>
        </
tr>

      </table>
      
    </div>
  </body>
</html>

**CTDATA H__5        DelChoice                        161
<p>Are you SURE you want to delete this record?</p>
<a href="?task=del&rrn=&Firs
tRowRRN=">Yes</a>
&nbsp;&nbsp;
<a href="javascript:location.href='?rrn='">No</a>


**CTDATA H__6        RtnToList                        65
<button onClick="javascript:location.href='?rrn=;'">Back</button>
**CTDATA H__7        RcdManage                        21084
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.or
g/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>
    <meta name="genera
tor" content="WebSmart" />
    <meta http-equiv="Pragma" content="no-cache" />

   <title>System Settings:  Users - Add or Change</title>
    <style type="text/
css">
    
    <!/style>    <script type="text/javascript" src="/websmart/kwiklo
an/javascript/klscripts.js"></script>
    <script type="text/javascript" src="/w
ebsmart/kwikloan/javascript/klthemes.js"></script>
    <script type="text/javasc
ript" src="/websmart/v7.2/javascript/esdiapi010.js"></script>
    <script type="
text/javascript" src="/k_dealer/jq/182.js" ></script>
    <script type="text/jav
ascript">
		xl_AttachEvent(window, "load", WindowInit); 

		function WindowInit(
)
		{
			xl_FocusFirstElement();
		}
function mask(inputString,textbox,delimiter
Locations,delimeter){
	//only allow numeric input
    var characterTyped = input
String.substring(inputString.length - 1);
    if (characterTyped != '0'

&& characterTyped != '1'
        && characterTyped != '2'
        && characterTy
ped != '3'
        && characterTyped != '4'
        && characterTyped != '5'

     && characterTyped != '6'
        && characterTyped != '7'
        && charac
terTyped != '8'
        && characterTyped != '9')
    {
        textbox.value =
inputString.substring(0,inputString.length - 1);
        return;
    }
    

var locations = delimiterLocations.split(',');
    
    for (var i = 0; i <= loc
ations.length; i++)
    {
        for (var k = 0; k <= inputString.length; k++)

        {
            if (k == locations[i])
            {
                if (i
nputString.substring(k, k+1) != delimeter)
                {

 inputString = inputString.substring(0,k) + delimeter + inputString.substring(k,
inputString.length);
                }
            }
        }
    }
    textbox
.value = inputString;
}
function numbersOnly(inputString,textbox){
	var characte
rTyped = inputString.substring(inputString.length - 1);
	if (characterTyped != '
0'
	&& characterTyped != '1'
	&& characterTyped != '2'
	&& characterTyped != '3'

	&& characterTyped != '4'
	&& characterTyped != '5'
	&& characterTyped != '6'
	
&& characterTyped != '7'
	&& characterTyped != '8'
	&& characterTyped != '9'
	&&
 characterTyped != '.'
	&& characterTyped != '/')
{
textbox.value = inputString.
substring(0,inputString.length - 1);
return;
}
}
	</script>
    
  </head>
  <bo
dy onload="">
    <form action="" method="get">
      <input type="hidden" name=
"task" value="endmanage">
      <input type="hidden" name="rrn" value="">

<input type="hidden" name="FirstRowRRN" value="">
      <input type="hidden" nam
e="cacflag" id="cacflag" value="">
      <div id="pagetitle">
        <span>Syst
em Settings:  Users</span>
        
        <div id="topBtns" >
          <input
 type="submit" class="navbutton" name="mode" value="Add">
          
          <
button class="navbutton" onclick="javascript:location.href='?rrn=;return false;'
">Cancel</button>
        </div>
        
      </div>
      <div id="wrapping">

        <div id="whitebg">
          
          
          
          <div id="
EDITcontents"> 
            
            
            
            <table id="ho
lderTable">
              
              
              <tr>
                <th
 colspan="2">User Settings</th>
              </tr>
              <tr>

       
                <!-- First Column starts here -->
                <!-- F
irst Column -->
                <td class="holderTd" style="width: 400px;">

              <table class="dealerTable">
                    <tr>

         <td class="left">User ID:</td>
                      <td class="right">
<input type="text" name="PUID" value=""></td>                      

        </tr>
                    <tr>
                      <td class="left">Pa
ssword:</td>
                      <!-- AFF-3851 <td class="right"><input type="
password" name="KW_UPASS" value=""></td> -->
                      <td class="ri
ght"><input type="text" name="KW_UPASS" value="Password is self-service" disable
d></td>
                    </tr>
                    <!--tr>

 <td class="left">User Profile:</td>
                    <td class="right"--></t
d>
                    </tr>
                    <tr>
                      <td
class="left">User Name:</td>
                      <td class="right"><input type
="text" name="PUNAME" size="40" maxlength="40" value=""></td>

  </tr>
                    <tr>
                      <td class="left">User Tit
le:</td>
                      <td class="right"><input type="text" name="PUTITL
E" size="40" maxlength="40" value=""></td>
                    </tr>

         <tr>
                      <td class="left">Location:</td>

          <td class="right"></td>
                    </tr>

<tr>
                      <td class="left">Department:</td>

   <td class="right"></td>
                    </tr>
                    <tr>

                    <td class="left">Supervisor:</td>
                      <td
class="right"></td>
                    </tr>
                    <tr>

             <td class="left">Customer Advocacy Agent:</td>

    <td class="right"></td>
                    </tr>
                    <!--AF
F 6188 -->
                    <tr> 
                      <td class="left">Spec
ial Handling Agent:</td>
                      <td class="right"></td>

           </tr>
                    <tr>
                      <td class="left"
>Allow User to Post Manual Transactions:</td>
                      <td class="r
ight"></td>
                    </tr>
                    <tr>

     <td class="left">Loan Group:</td>
                      <td class="right"><
input type="text" name="PULNGRP" value=""></td>
                    </tr>

              
                    <tr>
                      <td class="left">O
penVBX Username:</td>
                      <td class="right"><input type="text"
 name="PUTWIOVUSR" id="PUTWIOVUSR" size="40" maxlength="64"  value=""></td>

                </tr>
                    <tr>
                      <td class="
left">OpenVBX Password:</td>
                      <td class="right"><input type
="password" name="PUTWIOVPWD" id="PUTWIOVPWD" size="40" maxlength="32" value="">
</td>
                    </tr>
                    <tr>
                      <
td class="left">Email Address:</td>
                      <td class="right"><inp
ut type="text" name="PUEMAIL" size="40" maxlength="40" value=""></td>

          </tr>
                    <tr>
                      <td class="left">
Initials:</td>
                      <td class="right"><input type="text" name="
PUINIT" size="5" maxlength="5" value=""></td>
                    </tr>

            <tr>
                      <td class="left">Loan Product:</td>

                 <td class="right"></td>
                    </tr>

       <tr>
                      <td class="left">Minimum Cash:</td>

            <td class="right"><input type="text" name="PUCBAL" size="11" maxleng
th="11" value=""></td>
                    </tr>
                    <tr>

                <td class="left">User Cash Limit 1:</td>
                      <
td class="right"><input type="text" name="PUCLIM1" size="11" maxlength="11" valu
e=""></td>
                    </tr>
                    <tr>

    <td class="left">User Cash Limit 2:</td>
                      <td class="ri
ght"><input type="text" name="PUCLIM2" size="11" maxlength="11" value=""></td>

                   </tr>	
                    <tr>
                      <td cla
ss="left">Unsecured Approval Limit:</td>
                      <td class="right"
><input type="text" name="UNSECLIMIT" size="11" maxlength="11" value=""></td>

                  </tr>	
                    <tr>
                      <td clas
s="left">Purchased Goods Approval Limit:</td>
                      <td class="r
ight"><input type="text" name="GOODSLIMIT" size="11" maxlength="11" value=""></t
d>
                    </tr>	
                    <tr>
                      <td
 class="left">Vehicle Approval Limit:</td>
                      <td class="righ
t"><input type="text" name="AUTOLIMIT" size="11" maxlength="11" value=""></td>

                   </tr>
                    <tr>
                      <td clas
s="left">Collection Admin:</td>
                      <td class="right"></td> 

                   </tr>	
                    <tr>
                      <td cla
ss="left">Can Assign Collectors:</td>
                      <td class="right"></
td> 
                    </tr>	
                    <tr>
                      <
td class="left">Is A Collector:</td>
                      <td class="right"></t
d> 
                    </tr>
                    <tr>
                      <td
 class="left">Modification Authority:</td>
                      <td class="righ
t"></td> 
                    </tr>	
                    <tr>

    <td class="left">Judgement Authority:</td>
                      <td class="
right"></td> 
                    </tr>	
                    <tr>

        <td class="left">Bankruptcy Authority:</td>
                      <td cl
ass="right"></td> 
                    </tr>	
                    

       
                    <tr>
                      <td class="left">Charge-O
ff Authority:</td>
                      <td class="right"></td> 

      </tr>	                    
                    <tr>

<td class="left">Approval Authority:</td>
                      <td class="right
"></td> 
                    </tr>
                    <tr>

  <td class="left">Remove Application Authority:</td>
                      <td
class="right"></td> 
                    </tr>
                    <tr>

              <td class="left">Void Loan Authority:</td>
                      <
td class="right"></td> 
                    </tr>
                    <tr>

                 <td class="left">Assign Contract Terms:</td>

    <td class="right"></td> 
                    </tr>
                    <tr>

                      <td class="left">Denial Authority:</td>

    <td class="right"></td> 
                    </tr>
                    

                <tr>
                      <td class="left">RTO Return Option:</
td>
                      <td class="right"></td> 
                    </tr>	

                  
                    <tr>
                      <td class="lef
t">Post Payments:</td>
                      <td class="right"></td> 

          </tr>	
                    
                    <tr>

     <td class="left">Reverse Payments:</td>
                      <td class="ri
ght"></td> 
                    </tr>	
                    

<tr>
                      <td class="left">Waive Fees:</td>

   <td class="right"></td>
                      
                    </tr>	

                 
                    <tr>
                      <td class="left
">Override Verification:</td>
                      <td class="right"></td> 

                 </tr>	
                    
                    <tr>

            <td class="left">Change Due Dates:</td>
                      <td cl
ass="right"></td> 
                    </tr>
                    

      <tr>
                      <td class="left">Change Abatement Date:</td>

                    <td class="right"></td> 
                    </tr>	

            
                    <tr>
                      <td class="left">Cha
nge Rates:</td>
                      <td class="right"></td> 

     
                    </tr>	
                    
                    

               <tr>
                      <td class="left">Change Amounts:</td>

                      <td class="right"></td> 
                    </tr>	

              
                    <tr>
                      <td class="left">A
dd Dealer:</td>
                      <td class="right"></td> 

   </tr>	
                    
                    <tr>
                      <t
d class="left">Edit Dealer:</td>
                      <td class="right"></td> 

                    </tr>	
                    
                    <tr>

               <td class="left">Add Programs:</td>
                      <td cla
ss="right"></td> 
                    </tr>	
                    

      <tr>
                      <td class="left">Edit Programs:</td>

            <td class="right"></td> 
                    </tr>	

    
                    <tr>
                      <td class="left">Split Payme
nts:</td>
                      <td class="right"></td>
                    </tr
>	
                    
                    <tr>
                      <td class
="left">Delete Docs:</td>
                      <td class="right"></td> 

             </tr>	
                    
                    <tr>

        <td class="left">Delete Notes:</td>
                      <td class="rig
ht"></td>
                    </tr>	
                    
                    <t
r>
                      <td class="left">Delete Stips:</td>

   <td class="right"></td> 
                    </tr>	
                    

                <tr>
                      <td class="left">Limit acess by IP Ad
dress:</td>
                      <td class="right"></td> 
                    <
/tr>	
                    <tr>
                      <td class="left">View Alter
nate Transactions:</td>
                      <td class="right"></td> 

           </tr>
                    <tr>
                      <td class="left"
>Title Loan Int Change:</td>
                      <td class="right"></td>

               </tr>	
                    <tr>
                      <td class="
left">Denial FICO:</td>
                      <td class="right"><input type="tex
t" name="DENIAL_FICO" maxlength="3" value=""</td>
                    </tr>

                <tr>
                      <td class="left">Deviance from FICO:<
/td>
                      <td class="right"><input type="text" name="DEVIANCE_F
ICO" maxlength="3" value=""</td>
                    </tr>
                    <
tr>
                      <td class="left">Approval Limit-Credit Score:</td>

                   <td class="right"><input type="text" name="APPROVAL_SCORE" si
ze="11" maxlength="11" value=""></td>
                    </tr>

    <tr>
                      <td class="left">Approval Limit-Debt Ratio:</td>

                      <td class="right"><input type="text" name="APPROVAL_DRAT"
size="11" maxlength="11" value=""></td>
                    </tr>

      <tr>
                      <td class="left">Approval Authority-Renters:</t
d>
                      <td class="right"></td> </tr>
                    <tr>

                      <td class="left">Approval Limit-Gross Income:</td>

               <td class="right"><input type="text" name="APPROVAL_GROSS" size="
11" maxlength="11" value=""></td>
                    </tr>

<tr>
                      <td class="left">Approval Limit-TIF + Trades:</td>

                    <td class="right"><input type="text" name="APPROVAL_TIFTR" s
ize="11" maxlength="11" value=""></td>
                    </tr>

     <tr>
                      <td class="left">Approval Limit-REV Amt:</td>

                    <td class="right"><input type="text" name="APPROVAL_RAMT" si
ze="11" maxlength="11" value=""></td>
                    </tr>

    <tr>
                      <td class="left">Approval Limit-REV Avail:</td>

                     <td class="right"><input type="text" name="APPROVAL_RAVL" s
ize="11" maxlength="11" value=""></td>
                    </tr>

     <tr>
                      <td class="left">Approval Limit-Trades>30:</td>

                      <td class="right"><input type="text" name="APPROVAL_T30" s
ize="11" maxlength="11" value=""></td>
                    </tr>

     <tr>
                      <td class="left">Approval Limit-Trades>60:</td>

                      <td class="right"><input type="text" name="APPROVAL_T60" s
ize="11" maxlength="11" value=""></td>
                    </tr>

     <tr>
                      <td class="left">Approval Limit-Trades>90:</td>

                      <td class="right"><input type="text" name="APPROVAL_T90" s
ize="11" maxlength="11" value=""></td>
                    </tr>

     <tr>
                      <td class="left">Approval Limit-Bankrupt Mos:</t
d>
                      <td class="right"><input type="text" name="APPROVAL_BKM
O" size="11" maxlength="11" value=""></td>
                    </tr>

         <tr>
                      <td class="left">Loan Expire Override:</td>

                      <td class="right"></td> 
                    </tr>

             <tr>
                      <td class="left">Cancel Application Auth
ority:</td>
                      <td class="right"></td> 
                    <
/tr>
                    <tr>
                      <td class="left">Loan Open O
verride:</td>
                      <td class="right"></td> 

 </tr>
                    <tr>
                      <td class="left">Loan Fund
ing Override:</td>
                      <td class="right"></td> 

      </tr>
                    <tr>
                      <td class="left">Can
edit SCRA Flag:</td>
                      <td class="right"></td> 

        </tr>                    
                  </table>
                </t
d>
                <!-- End of First Column -->
                

 
                <!-- Second Column starts here -->
                <!-- Second
 Column -->
                <td class="holderTd">
                  <table class
="dealerTable">
                    <tr>
                      <td class="left">
Can access 'LETTERS' screen:</td>
                      <td class="right"></td>
                     
                    </tr>
                    <tr>

               <td class="left">Can access 'CALL RECORDINGS' screen:</td>

                <td class="right"></td>                      

  </tr>
                    <tr>
                      <td class="left">Can acce
ss 'EDIT LOAN -> CODES' fields:</td>
                      <td class="right"></t
d>                      
                    </tr>
                    <tr>

                  <td class="left">Can access 'EDIT LOAN -> COUNTERS A' fields:<
/td>
                      <td class="right"></td>                      

             </tr>
                    <tr>
                      <td class="lef
t">Can access 'EDIT LOAN -> COUNTERS B' fields:</td>
                      <td c
lass="right"></td>                      
                    </tr>

       <tr>
                      <td class="left">Can access 'ACCOUNT CONTROLS'
 fields:</td>
                      <td class="right"></td>
 
                    </tr>
                    <tr>
                      <td c
lass="left">Can access 'LOAN CODES' fields:</td>
                      <td class
="right"></td>                      
                    </tr>

   <tr>
                      <td class="left">Can edit who gets 'Payment Credit
':</td>
                      <td class="right"></td>                      

                </tr>
                     <tr>
                      <td class=
"left">2 Factor Auth Required:</td>
                      <td class="right"></td
>                      
                    </tr>
                     <tr>

                  <td class="left">2 :Login Time Period:</td>

    <td class="right"></td>                      
                    </tr>

                <tr>
                      <td class="left">Can view Interest Ra
tes in 'Edit Loan/Lease':</td>
                      <td class="right"></td>
                  
                    </tr>
                  </table>

        </td>
              </tr>
            </table>
            <script type=
"text/javascript">
				var protkey = "";   
				if( == 0)
				{
					
					xl_Ge
tFormElementByName("mode").value = "Add";
				} 
				else 
				{
					protkey  =
 xl_GetFormElementByName("PUID");
					protkey.disabled = true;
					protkey.cla
ssName = protkey.className + " disabled";
					xl_GetFormElementByName("mode").v
alue = "Change";
				}
			</script>
          </form>
        </div><!--editcont
ents-->
      </div></div>
  </body>
</html>
**CTDATA H__8        manageCSS                        2601
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


**CTDATA H__9        ip_btn                           81
<input type="button" onclick="location.href='lnipaddr.pgm'" value="IP Addresses"
>

     H/TITLE  System Settings:  Dealers
      * ProGen WebSmart Revision 28963
      * File overrides for compile command
      *__OV OVRDBF KWPDBASE   KWPDBASE
      *__OV OVRDBF KWPDLOC    KWPDLOC
      *__OV OVRDBF KWPDPGM    KWPDPGM
      *__OV OVRDBF KWP_DATA   KWP_DATA
      *__OV OVRDBF KWPUBASE   KWPUBASE
      *__OV OVRDBF KWS_DATA   KWS_DATA
      *__OV OVRDBF KWPPBASE   KWPPBASE
      *__OV OVRDBF KWPDDATA   KWPDDATA
      *__OV OVRDBF KWPSUCOD   KWPSUCOD
      *__OV OVRDBF KWPSUFLD   KWPSUFLD
      *__OV OVRDBF KWPUOPT    KWPUOPT
      *__OV OVRDBF KWPDUSER   KWPDUSER
      *__OV OVRDBF KWCCONT    KWCCONT
      *__OV OVRDBF KWCBASE    KWCBASE
      *__OV OVRDBF KWCADDR    KWCADDR
      *__OV OVRDBF KWCNAME    KWCNAME
      *__OV OVRDBF KWPDECMOD  KWPDECMOD
      *__OV OVRDBF KWPRULE    KWPRULE
      *__OV OVRDBF KWSMNUOPT  KWSMNUOPT
      *__OV OVRDBF KW_APPL    KW_APPL
      *__OV OVRDBF KWPPGM     KWPPGM
      *__OV OVRDBF KWPDRATE   KWPDRATE
      *__OV OVRDBF KWPEEVENT  KWPEEVENT
      *__OV OVRDBF KWPDECRATE KWPDECRATE
      *__OV OVRDBF KWPDURL    KWPDURL
      *__   Following values are used to create the server program
      *__RO Pgm  lib DEVWEBSMT  Pgm  S_DLR
      *__AG          WEBSMART
      *__CL          *OBJLIBNAM
      *__SQ
      *__BD ECRTBND204
      *===============================================================*
      * Path:   s_dlr.pdw
      * System: LAPTOP-V1M2S55E
      * Project:Kwik-Loan
      * Set:    MD Dev
      * User:   mduncan
      * Date Last Generated:   2018-10-01   16:22:09
      * Last Generated CRC: A6252357 D278763F 39866744 8BF5DBEC
      *===============================================================*
      */CPY *LIBL/PW_CSRC CPYRIGHT
      * File specifications
     FKWPDBASE  UF A E           K DISK    USROPN
     F                                     INFDS(FID001_   )
     F                                     RENAME(RKWPDBASE    :RWPDBASE    )
     FKWPDLOC   UF A E           K DISK    USROPN
     F                                     INFDS(FID002_   )
     FKWPDPGM   UF A E           K DISK    USROPN
     F                                     INFDS(FID003_   )
     F                                     RENAME(RKWPDPGM     :RWPDPGM     )
     FKWP_DATA  IF   E           K DISK    USROPN
     F                                     INFDS(FID004_   )
     FKWPUBASE  IF   E           K DISK    USROPN
     F                                     INFDS(FID005_   )
     FKWS_DATA  IF   E           K DISK    USROPN
     F                                     INFDS(FID006_   )
     FKWPPBASE  IF   E           K DISK    USROPN
     F                                     INFDS(FID007_   )
     FKWPDDATA  UF A E           K DISK    USROPN
     F                                     INFDS(FID008_   )
     FKWPSUCOD  IF   E           K DISK    USROPN
     F                                     INFDS(FID009_   )
     FKWPSUFLD  IF   E           K DISK    USROPN
     F                                     INFDS(FID010_   )
     FKWPUOPT   IF   E           K DISK    USROPN
     F                                     INFDS(FID011_   )
     FKWPDUSER  UF A E           K DISK    USROPN
     F                                     INFDS(FID012_   )
     FKWCCONT   UF A E           K DISK    USROPN
     F                                     INFDS(FID013_   )
     FKWCBASE   UF   E           K DISK    USROPN
     F                                     INFDS(FID014_   )
     FKWCADDR   UF A E           K DISK    USROPN
     F                                     INFDS(FID015_   )
     FKWCNAME   UF   E           K DISK    USROPN
     F                                     INFDS(FID016_   )
     FKWPDECMOD IF   E           K DISK    USROPN
     F                                     INFDS(FID017_   )
     FKWPRULE   IF   E           K DISK    USROPN
     F                                     INFDS(FID018_   )
     FKWSMNUOPT IF   E           K DISK    USROPN
     F                                     INFDS(FID019_   )
     FKW_APPL   IF   E           K DISK    USROPN
     F                                     INFDS(FID020_   )
     FKWPPGM    IF   E           K DISK    USROPN
     F                                     INFDS(FID021_   )
     FKWPDRATE  UF A E           K DISK    USROPN
     F                                     INFDS(FID022_   )
     FKWPEEVENT IF   E           K DISK    USROPN
     F                                     INFDS(FID023_   )
     FKWPDECRATEIF   E           K DISK    USROPN
     F                                     INFDS(FID024_   )
     FKWPDURL   IF   E           K DISK    USROPN
     F                                     INFDS(FID025_   )

     D PTL__           S             50    DIM(1) CTDATA PERRCD(1)
     D RTLLA__         S             11    DIM(180)

     D*+FLDDCL Field declarations

     Duserdata         DS                  INZ
     D client                         5A
     D userid                        32A
     D location                       5A

     D ondev           S              1A
     D rnd             S              6A
     D dlraltdisp      S              1A
     D pagenum         S              5P 0
     D dsname          S             40A
     D apitoken        S             40A
     D lastpgm         S             20A
     D lastpgm2        S             20A
     D mode            S             15A
     D c               S              5P 0
     D states          S             50A     DIM(63       )
     D products        S             50A     DIM(20       )
     D dividepos       S              2P 0
     D dividebef       S              2P 0
     D divideaft       S              2P 0
     D fldlength       S              2P 0
     D selstring       S           3500A   varying
     D omanu           S             20A
     D dlrnote         S             80A
     D pdzipx          S              5A
     D datemsg         S             80A
     D inputdate       S             10A
     D isodate         S               D   DATFMT(*ISO      )
     D dlrpin          S              1A
     D signpin         S              1A
     D boxname         S             10A
     D boxid           S             10A
     D code            S             25A
     D pdapprd         S             10A
     D desc            S             40A
     D boxtype         S             10A
     D jvalidation     S             30A
     D disabled        S             10A
     D artncod         S              5A
     D longlat         S             80A
     D startrrn        S              9P 0
     D endrrn          S              9P 0
     D rcdcnt          S              5P 0
     D prevstate       S              5P 0
     D nextstate       S              5P 0
     D listsize        S              5P 0
     D counter         S              5P 0
     D rrn             S              9P 0
     D savedrrn        S              9A
     D disphref        S            200A
     D edithref        S            200A
     D delhref         S            200A
     D addhref         S            200A
     D e_dlr           S              1A
     D e_prod          S              1A
     D e_ofc           S              1A
     D e_usr           S              1A
     D e_tax           S              1A
     D e_3rd           S              1A
     D e_rcn           S              1A
     D pdglvend        S             80A
     D eftbatch        S              1A
     D dlrreset        S              1A
     D renttoown       S              1A
     D rtoyesno        S              1A
     D maxlnamt        S             11S 2
     D maxlnterm       S              5S 0
     D signtype        S             25A
     D dlrstyn         S              1A
     D usaepayath      S              1A
     D discpct         S              5P 2
     D commpct         S              5P 2
     D epdpct          S              5P 2
     D ficopct         S              5P 2
     D ficoscore       S              5P 0
     D emplpct         S              5P 2
     D riskper         S              8S 5
     D downpmt         S             11P 2
     D sql_state       S            100A
     D ficoyn          S              1A
     D prtoproc        S             11S 2
     D epofee          S             11S 2
     D epopct          S             11S 2
     D rtopmt          S             11S 2
     D orgpct          S             11S 2
     D incent_average  S             11P 2
     D incent_disc     S             11P 2
     D new_days        S             11P 2
     D new_discount    S             11P 2
     D empl_date       S               D   DATFMT(*ISO      )
     D empl_days       S             11P 2
     D empl_amount     S             11P 2
     D rate_tier       S             25A
     D sac_days        S             11P 2
     D movolume        S             11P 2
     D qshcommand      S            256A
     D command         S            256A
     D phploc          S            200A
     D usaepayloc      S            200A

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
     D RS013_          S              1A
     D AM013_          S              1A
     D RS014_          S              1A
     D AM014_          S              1A
     D RS015_          S              1A
     D AM015_          S              1A
     D RS016_          S              1A
     D AM016_          S              1A
     D RS017_          S              1A
     D AM017_          S              1A
     D RS018_          S              1A
     D AM018_          S              1A
     D RS019_          S              1A
     D AM019_          S              1A
     D RS020_          S              1A
     D AM020_          S              1A
     D RS021_          S              1A
     D AM021_          S              1A
     D RS022_          S              1A
     D AM022_          S              1A
     D RS023_          S              1A
     D AM023_          S              1A
     D RS024_          S              1A
     D AM024_          S              1A
     D RS025_          S              1A
     D AM025_          S              1A


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
     D rwcolor2__      S             32A   INZ('odd')


     D TASKRAN__       S              1    INZ(*OFF)


     D H__1            S             80    PERRCD(1) CTDATA DIM(18          )

     D H__2            S             80    PERRCD(1) CTDATA DIM(41          )

     D H__3            S             80    PERRCD(1) CTDATA DIM(7           )

     D H__4            S             80    PERRCD(1) CTDATA DIM(46          )

     D H__5            S             80    PERRCD(1) CTDATA DIM(33          )

     D H__6            S             80    PERRCD(1) CTDATA DIM(446         )

     D H__7            S             80    PERRCD(1) CTDATA DIM(3           )


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
     D FID013_         DS
     D  RR_013_              397    400B 0
     D FID014_         DS
     D  RR_014_              397    400B 0
     D FID015_         DS
     D  RR_015_              397    400B 0
     D FID016_         DS
     D  RR_016_              397    400B 0
     D FID017_         DS
     D  RR_017_              397    400B 0
     D FID018_         DS
     D  RR_018_              397    400B 0
     D FID019_         DS
     D  RR_019_              397    400B 0
     D FID020_         DS
     D  RR_020_              397    400B 0
     D FID021_         DS
     D  RR_021_              397    400B 0
     D FID022_         DS
     D  RR_022_              397    400B 0
     D FID023_         DS
     D  RR_023_              397    400B 0
     D FID024_         DS
     D  RR_024_              397    400B 0
     D FID025_         DS
     D  RR_025_              397    400B 0


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

     D displist0...
     D                 PR
     D dlroptbox0...
     D                 PR
     D beginmanage0...
     D                 PR
     D endmanage0...
     D                 PR
     D getdealerparms0...
     D                 PR
     D file                          10A
     D                                     VALUE
     D getemails0...
     D                 PR
     D counter                        2P 0
     D                                     VALUE
     D pdnusebox0...
     D                 PR
     D achtypebox0...
     D                 PR
     D QPGM__          S             21A
     D LstPmlErr_      S              4P 0 IMPORT
     D locbox0...
     D                 PR
     D wrtpdstbox0...
     D                 PR
     D salesrepbox0...
     D                 PR
     D leadsrcbox0...
     D                 PR
     D hobox0...
     D                 PR
     D appdecpbox0...
     D                 PR
     D repodlrbox0...
     D                 PR
     D appdecsbox0...
     D                 PR
     D docbefappbox0...
     D                 PR
     D permitaddonbox0...
     D                 PR
     D riskbpbox0...
     D                 PR
     D nocdocbox0...
     D                 PR
     D fbfbox0...
     D                 PR
     D paytypebox0...
     D                 PR
     D dlrstatbox0...
     D                 PR
     D credbox0...
     D                 PR
     D manubox0...
     D                 PR
     D psold1box0...
     D                 PR
     D psold2box0...
     D                 PR
     D psold3box0...
     D                 PR
     D wrtstateofbus0...
     D                 PR
     D wrtloantypes0...
     D                 PR
     D wrtprodbox0...
     D                 PR
     D offselyesno0...
     D                 PR
     D pdlocbox0...
     D                 PR
     D dealersign0...
     D                 PR
     D custemail0...
     D                 PR
     D decmodbox0...
     D                 PR
     D webmodbox0...
     D                 PR
     D eftbatchbox0...
     D                 PR
     D donotfundbox0...
     D                 PR
     D emailstatusbox0...
     D                 PR
     D rtoynbox0...
     D                 PR
     D stipgrpbox0...
     D                 PR
     D signtypebox0...
     D                 PR
     D dlrstynbox0...
     D                 PR
     D categorybox0...
     D                 PR
     D new_app_box0...
     D                 PR
     D new_sapp_box0...
     D                 PR
     D gas_cash_box0...
     D                 PR
     D new_ll_box0...
     D                 PR
     D proc_ov_box0...
     D                 PR
     D new_ibvr_box0...
     D                 PR
     D dlrdbtbox0...
     D                 PR
     D pinbox0...
     D                 PR
     D pinsbox0...
     D                 PR
     D cvvbox0...
     D                 PR
     D avsbox0...
     D                 PR
     D ibvbox0...
     D                 PR
     D walletbox0...
     D                 PR
     D ibvwbox0...
     D                 PR
     D walletwbox0...
     D                 PR
     D dlrrepbox0...
     D                 PR
     D pdpgmbox0...
     D                 PR
     D usaepayathbox0...
     D                 PR
     D cashpmtbox0...
     D                 PR
     D salestaxbox0...
     D                 PR
     D autotaxbox0...
     D                 PR
     D ficoynbox0...
     D                 PR
     D ficoscorebox0...
     D                 PR
     D emplpctbox0...
     D                 PR
     D ibvsbox0...
     D                 PR
     D dpoptbox0...
     D                 PR
     D tierbox0...
     D                 PR
     D bankstipbox0...
     D                 PR
     D approveallbox0...
     D                 PR
     D nocreditbox0...
     D                 PR
     D abasearchbox0...
     D                 PR
     D textappbox0...
     D                 PR
     D dlrsignbox0...
     D                 PR
     D dispcollbox0...
     D                 PR
     D deldatebox0...
     D                 PR
     D pmtcalcbox0...
     D                 PR
     D fundlistbox0...
     D                 PR
     D pfndlistbox0...
     D                 PR
     D ltodepbox0...
     D                 PR
     D ldwoptbox0...
     D                 PR
     D adddownbox0...
     D                 PR
     D deliverybox0...
     D                 PR
     D warrantybox0...
     D                 PR
     D downpctbox0...
     D                 PR
     D apprpendbox0...
     D                 PR
     D dsignbox0...
     D                 PR
     D storisfastbox0...
     D                 PR
     D fundpartbox0...
     D                 PR
     D ppcardbox0...
     D                 PR
     D bankstmtibvbox0...
     D                 PR
     D ppibvbox0...
     D                 PR
     D appdaysbox0...
     D                 PR
     D addrvalidbox0...
     D                 PR
     D vlddate10...
     D                 PR
     D CURTIME__       S              6P 0
     D CURISOD__       S               D   DATFMT(*ISO) INZ(*SYS)
     D QPGMNAM__       S             20A
     D SmurfChk__      S              1A   INZ(*ON)
     D Smurf_ID__      S             64A   IMPORT
     D Smurf_Rw__      S              9B 0 IMPORT

     D prevpage        S                   LIKE(pagenum       )
     D nextpage        S                   LIKE(pagenum       )
     D opsold1         S                   LIKE(omanu         )
     D opsold2         S                   LIKE(omanu         )
     D opsold3         S                   LIKE(omanu         )
     D pdemail2        S                   LIKE(pdemail       )
     D dba             S                   LIKE(pdemail       )
     D appdecp         S                   LIKE(pdemail       )
     D appdecs         S                   LIKE(pdemail       )
     D docbefapp       S                   LIKE(pdemail       )
     D permitaddon     S                   LIKE(pdemail       )
     D dlrnote2        S                   LIKE(dlrnote       )
     D dlrnote3        S                   LIKE(dlrnote       )
     D dlrnote4        S                   LIKE(dlrnote       )
     D dlrnote5        S                   LIKE(dlrnote       )
     D dlrnote6        S                   LIKE(dlrnote       )
     D fundnote        S                   LIKE(dlrnote       )
     D seloffice       S                   LIKE(pddchar       )
     D dlrname         S                   LIKE(pdname        )
     D riskbp          S                   LIKE(permitaddon   )
     D nocdoc          S                   LIKE(permitaddon   )
     D webmodel        S                   LIKE(pdmodel       )
     D cashpmt         S                   LIKE(permitaddon   )
     D salestax        S                   LIKE(permitaddon   )
     D autotax         S                   LIKE(permitaddon   )
     D bankstip        S                   LIKE(permitaddon   )
     D textapp         S                   LIKE(permitaddon   )
     D dlrsign         S                   LIKE(permitaddon   )
     D fbf             S                   LIKE(permitaddon   )
     D repodlr         S                   LIKE(pdemail       )
     D dispcoll        S                   LIKE(permitaddon   )
     D deldate         S                   LIKE(permitaddon   )
     D approveall      S                   LIKE(permitaddon   )
     D pmtcalc         S                   LIKE(permitaddon   )
     D fundlist        S                   LIKE(permitaddon   )
     D parfund         S                   LIKE(permitaddon   )
     D nocredit        S                   LIKE(permitaddon   )
     D abasearch       S                   LIKE(permitaddon   )
     D ltodep          S                   LIKE(permitaddon   )
     D ldwopt          S                   LIKE(permitaddon   )
     D adddown         S                   LIKE(permitaddon   )
     D warranty        S                   LIKE(permitaddon   )
     D delivery        S                   LIKE(permitaddon   )
     D downpct         S                   LIKE(permitaddon   )
     D apprpend        S                   LIKE(permitaddon   )
     D addrvalid       S                   LIKE(permitaddon   )
     D docusign        S                   LIKE(permitaddon   )
     D ppcard          S                   LIKE(permitaddon   )
     D ppibv           S                   LIKE(permitaddon   )
     D bankstmtibv     S                   LIKE(permitaddon   )
     D storisfast      S                   LIKE(permitaddon   )
     D fundpart        S                   LIKE(permitaddon   )
     D boxselect       S                   LIKE(p_zkeya       )
     D saveloc         S                   LIKE(pdloc         )
     D frverify        S                   LIKE(pddchar       )
     D vhomeimp        S                   LIKE(pddchar       )
     D vrebate         S                   LIKE(pddchar       )
     D dlrcode         S                   LIKE(pdno          )
     D apprdays        S                   LIKE(pddchar       )
     D stipgrp         S                   LIKE(p_ztype       )
     D dlrstynopt      S                   LIKE(pruleyesno    )
     D email1          S                   LIKE(pddchar       )
     D email2          S                   LIKE(pddchar       )
     D email3          S                   LIKE(pddchar       )
     D email4          S                   LIKE(pddchar       )
     D email5          S                   LIKE(pddchar       )
     D savepdno        S                   LIKE(pdno          )
     D signemail       S                   LIKE(cemail        )
     D phpdlrnote      S                   LIKE(pruleyesno    )
     D approvalexp     S                   LIKE(pruleyesno    )
     D donotfund       S                   LIKE(pruleyesno    )
     D fundflag        S                   LIKE(pruleyesno    )
     D email_status    S                   LIKE(pruleyesno    )
     D emailstyn       S                   LIKE(pruleyesno    )
     D pgm_lnlist      S                   LIKE(smenupgm      )
     D kwpedate        S                   LIKE(ccontdate     )
     D sys_env         S                   LIKE(kwk_purl1     )

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

     C     pfklist       KLIST
     C                   KFLD                    pdno
     C     DL002_        KLIST
     C                   KFLD                    pdno
     C                   KFLD                    pdloc
     C     DL003_        KLIST
     C                   KFLD                    pdno
     C     DL005_        KLIST
     C                   KFLD                    puid
     C     DL006_        KLIST
     C                   KFLD                    p_ztype
     C     DL004_        KLIST
     C                   KFLD                    p_ztype
     C     DL007_        KLIST
     C                   KFLD                    pprod
     C     prodkey       KLIST
     C                   KFLD                    pdno
     C                   KFLD                    pddtype
     C     DL008_        KLIST
     C                   KFLD                    pdno
     C                   KFLD                    pddtype
     C                   KFLD                    pddcode
     C     codekey       KLIST
     C                   KFLD                    pdno
     C                   KFLD                    pddtype
     C     typelink      KLIST
     C                   KFLD                    pddtype
     C     dealerlink    KLIST
     C                   KFLD                    pdno
     C     DL009_        KLIST
     C                   KFLD                    psusrfile
     C                   KFLD                    psusrno
     C                   KFLD                    psusrcode
     C     DL010_        KLIST
     C                   KFLD                    psusrfile
     C                   KFLD                    psusrtype
     C     userkey       KLIST
     C                   KFLD                    psusrfile
     C                   KFLD                    psusrtype
     C     seqkey        KLIST
     C                   KFLD                    psusrfile
     C                   KFLD                    psusrno
     C     DL011_        KLIST
     C                   KFLD                    userid
     C                   KFLD                    puotype
     C     DL012_        KLIST
     C                   KFLD                    pdutype
     C                   KFLD                    pdno
     C                   KFLD                    pduid
     C     DL013_        KLIST
     C                   KFLD                    ccust
     C                   KFLD                    conttype
     C     DL014_        KLIST
     C                   KFLD                    ccust
     C     DL015_        KLIST
     C                   KFLD                    ccust
     C                   KFLD                    cadate
     C     DL016_        KLIST
     C                   KFLD                    ccust
     C     DL018_        KLIST
     C                   KFLD                    pruletype
     C                   KFLD                    prulename
     C     DL017_        KLIST
     C                   KFLD                    pdmodel
     C     DL019_        KLIST
     C                   KFLD                    smenuclid
     C                   KFLD                    smenu
     C                   KFLD                    smenuopt
     C     DL021_        KLIST
     C                   KFLD                    psprogram
     C     DL023_        KLIST
     C                   KFLD                    pemltype
     C     eventkey      KLIST
     C                   KFLD                    pdno
     C                   KFLD                    pddtype
     C     DL022_        KLIST
     C                   KFLD                    pdno
     C                   KFLD                    pdrtype
     C     DL024_        KLIST
     C                   KFLD                    pdrcode
     C                   ENDSR


      * Subprocedures follow:
      *--------------------------------------------------------------------------------------------*
      * main__ - Contains the main function source code from the PML
      *--------------------------------------------------------------------------------------------*
     P main__          B
     D main__          PI

      /free
       // PML Start ----------------------------------
       rnd = %trim(%editc(CURTIME__:'P'));
       lastpgm = GetSmurf2_('LASTPGM');
       if (lastpgm = 'LNVIEW.pgm');
        lastpgm = 'LNLIST.pgm';
       else;
        lastpgm2 = lastpgm;
       endif;
       if (lastpgm = 'LNM_MAIN.pgm');
        lastpgm = 'lnlist.pgm';
       endif;
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
       kw_wrtdataarea('*LDA':userid:'*LIBL':1:32);
       listsize = 20;
       startrrn = %dec(aton_( getparm3_('rrn':'*OPT'):46:16):9:0);
       pruletype = 'SYSTEM';
       prulename = 'PHPDLRNOTE';
       AM018_ = CV_BYKEY;
       CHAIN(E) DL018_ RKWPRULE;
       RS018_ = RcdSts2_('GETRCD': %error: %found: %eof);
       phpdlrnote = 'N';
       if (RS018_ = '1');
        phpdlrnote = pruleyesno;
       endif;
       pruletype = 'SYSTEM';
       prulename = 'RENTTOOWN';
       AM018_ = CV_BYKEY;
       CHAIN(E) DL018_ RKWPRULE;
       RS018_ = RcdSts2_('GETRCD': %error: %found: %eof);
       if (RS018_ = '1');
        renttoown = pruleyesno;
       endif;
       pruletype = 'S_DLR';
       prulename = 'DLRSTYNOPT';
       AM018_ = CV_BYKEY;
       CHAIN(E) DL018_ RKWPRULE;
       RS018_ = RcdSts2_('GETRCD': %error: %found: %eof);
       if (RS018_ = '1');
        dlrstynopt = pruleyesno;
       endif;
       pruletype = 'S_DLR';
       prulename = 'APPROVALEXP';
       AM018_ = CV_BYKEY;
       CHAIN(E) DL018_ RKWPRULE;
       RS018_ = RcdSts2_('GETRCD': %error: %found: %eof);
       if (RS018_ = '1');
        approvalexp = pruleyesno;
       endif;
       pruletype = 'S_DLR';
       prulename = 'FUNDFLAG';
       AM018_ = CV_BYKEY;
       CHAIN(E) DL018_ RKWPRULE;
       RS018_ = RcdSts2_('GETRCD': %error: %found: %eof);
       if (RS018_ = '1');
        fundflag = pruleyesno;
       endif;
       pruletype = 'S_DLR';
       prulename = 'EMAILSTATUS';
       AM018_ = CV_BYKEY;
       CHAIN(E) DL018_ RKWPRULE;
       RS018_ = RcdSts2_('GETRCD': %error: %found: %eof);
       if (RS018_ = '1');
        email_status = pruleyesno;
       endif;
       SMENUCLID = %dec(aton_(client:46:16):46:16);
       smenu = 'USER';
       smenuopt = 'DLRLIST';
       AM019_ = CV_BYKEY;
       CHAIN(NE) DL019_ RKWSMNUOPT;
       RS019_ = RcdSts2_('GETRCD': %error: %found: %eof);
       if (RS019_ = '1');
        pgm_lnlist = %trim(smenupgm);
       else;
        pgm_lnlist = 's_dlr.pgm';
       endif;
       ondev = 'N';
      /end-free
     C/Exec SQL
     C+  select kwk_purl1 into :sys_env from kwpdurl where kwk_putype = 'SYS_ENV
     C+ '
     C/End-Exec
      /free
       if (((( scanstr_('sv2': sys_env: 1) <> 0) or ( scanstr_('sv7':
       sys_env: 1) <> 0) or ( scanstr_('sv12': sys_env: 1) <> 0))));
        ondev = 'Y';
       endif;
       if (task__ = 'DEFAULT');
        taskran__ = *ON;
        displist0();
       endif ;
       if (task__ = 'BEGINMANAGE');
        taskran__ = *ON;
        beginmanage0();
       endif ;
       if (task__ = 'ENDMANAGE');
        taskran__ = *ON;
        endmanage0();
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
     P* displist0...                - User defined function
     P*---------------------------------------------------------------------
     P displist0...
     P                 B
     D displist0...
     D                 PI




      /free
       pdno = GetSmurf2_('dlistPDNO');
       dlrname = getparm3_('dlrname':'*OPT');
       dlrcode = getparm3_('dlrcode':'*OPT');
       dlrreset = getparm3_('dlrreset':'*OPT');
       if (dlrcode <> '');
        SetSmurf_('dlistPDNO':dlrcode);
        pdno = dlrcode;
       endif;
       if (dlrreset = 'Y');
        SetSmurf_('dlistPDNO':dlrcode);
        pdno = '';
       endif;
       puid = userid;
       AM005_ = CV_BYKEY;
       CHAIN(NE) DL005_ RKWPUBASE;
       RS005_ = RcdSts2_('GETRCD': %error: %found: %eof);
       puotype = 'ADDDLR';
       AM011_ = CV_BYKEY;
       CHAIN(NE) DL011_ RKWPUOPT;
       RS011_ = RcdSts2_('GETRCD': %error: %found: %eof);
       select;
       when ((RS011_ = '1') and (puoyesno = 'N'));
       addhref = '';
       disabled = 'disabled';
       when ((puprofile <> 'ADMINISTRATOR') and (puoyesno <> 'Y'));
       addhref = '';
       disabled = 'disabled';
       other;
       addhref = 'window.location=''s_dlr.pgm?task=beginmanage&mode=new&rrn=0-
       &rnd=' + %trim(rnd) + '''';
       endsl;
       if (client = '105');
        disabled = '';
       endif;
       outweb_(%subst(%str(%addr(H__2(1))):1:658));
       outweb_(%subst(%str(%addr(H__1(1))):1:1434));
       outweb_(%subst(%str(%addr(H__2(9))):19:911));
       if (client = '119');
        outweb_(%subst(%str(%addr(H__7(1))):1:190));
       endif;
       outweb_(%subst(%str(%addr(H__2(20))):50:48));
       wfrtn__ = AfToPage_(ADDHREF);
       outweb_(%subst(%str(%addr(H__2(21))):18:185));
       wfrtn__ = AfToPage_(QPGMNAM__);
       outweb_(%subst(%str(%addr(H__2(23))):43:191));
       wfrtn__ = AfToPage_(DLRNAME);
       outweb_(%subst(%str(%addr(H__2(25))):74:264));
       wfrtn__ = AfToPage_(PDNO);
       outweb_(%subst(%str(%addr(H__2(29))):18:330));
       wfrtn__ = AfToPage_(QPGMNAM__);
       outweb_(%subst(%str(%addr(H__2(33))):28:647));
       puotype = 'EDITDLR';
       AM011_ = CV_BYKEY;
       CHAIN(NE) DL011_ RKWPUOPT;
       RS011_ = RcdSts2_('GETRCD': %error: %found: %eof);
       select;
       when ((RS011_ = '1') and (puoyesno = 'N'));
       e_dlr = 'N';
       e_prod = 'N';
       e_ofc = 'N';
       e_usr = 'U';
       e_tax = 'N';
       e_3rd = 'N';
       e_rcn = 'N';
       disabled = 'disabled';
       if (client = '105');
        disabled = '';
       endif;
       when ((puprofile <> 'ADMINISTRATOR') and (puoyesno <> 'Y'));
       e_dlr = 'N';
       e_prod = 'N';
       e_ofc = 'N';
       e_usr = 'N';
       e_tax = 'N';
       e_3rd = 'N';
       e_rcn = 'N';
       disabled = 'disabled';
       if (client = '105');
        disabled = '';
       endif;
       other;
       e_dlr = 'E';
       e_prod = 'P';
       e_ofc = 'O';
       e_usr = 'U';
       e_tax = 'T';
       e_3rd = '3';
       e_rcn = '4';
       endsl;
       if (dlrname = '');
        SETLL  pfklist RWPDBASE;
        RS001_ = RcdSts2_('POSRCD':%error:%equal:%eof);
        READ(E)  RWPDBASE;
        RS001_ = RcdSts2_('GETNXTRCD':%error:%found:%eof);
        AM001_ = CV_ByKey;
        counter = 1;
        rcdcnt = 0;
        dow ((RS001_ = '1'));
        rrn = RR_001_;
        Flip_Rc_();
        outweb_(%subst(%str(%addr(H__3(1))):1:11));
        wfrtn__ = AfToPage_(ARCLR__);
        outweb_(%subst(%str(%addr(H__3(1))):12:46));
        AfToPage_(%trim(%editc(COUNTER:'Z')));
        outweb_(%subst(%str(%addr(H__3(1))):58:39));
        AfToPage_(%trim(%editc(RRN:'Z')));
        outweb_(%subst(%str(%addr(H__3(2))):17:2));
        wfrtn__ = AfToPage_(PDNO);
        outweb_(%subst(%str(%addr(H__3(2))):19:64));
        wfrtn__ = AfToPage_(E_DLR);
        outweb_(%subst(%str(%addr(H__3(3))):3:43));
        wfrtn__ = AfToPage_(E_PROD);
        outweb_(%subst(%str(%addr(H__3(3))):46:45));
        wfrtn__ = AfToPage_(E_OFC);
        outweb_(%subst(%str(%addr(H__3(4))):11:39));
        wfrtn__ = AfToPage_(E_USR);
        outweb_(%subst(%str(%addr(H__3(4))):50:37));
        wfrtn__ = AfToPage_(E_TAX);
        outweb_(%subst(%str(%addr(H__3(5))):7:44));
        wfrtn__ = AfToPage_(E_3RD);
        outweb_(%subst(%str(%addr(H__3(5))):51:47));
        wfrtn__ = AfToPage_(E_RCN);
        outweb_(%subst(%str(%addr(H__3(6))):18:74));
        wfrtn__ = AfToPage_(PDNO);
        outweb_(%subst(%str(%addr(H__3(7))):12:25));
        wfrtn__ = AfToPage_(PDNAME);
        outweb_(%subst(%str(%addr(H__3(7))):37:12));
        rcdcnt = rcdcnt + 1;
        counter = counter + 1;
        READ(E)  RWPDBASE;
        RS001_ = RcdSts2_('GETNXTRCD':%error:%found:%eof);
        AM001_ = CV_ByKey;
        enddo;
       else;
        counter = 1;
        rcdcnt = 0;
        selstring = 'SELECT RRN(KWPDBASE), PDNO, PDNAME FROM KWPDBASE WHERE u-
       pper(PDNAME) like ''%' + %trim( %XLATE(lo__:up__:dlrname)) + '%''';
      /end-free
     C/Exec SQL
     C+            Declare MC Scroll Cursor
     C+            For MC
     C/End-Exec
     C/Exec SQL
     C+            Prepare MC
     C+            From :selstring
     C/End-Exec
      /free
        if (sqlcod >= 0);
      /end-free
     C/Exec SQL
     C+            Open MC
     C/End-Exec
      /free
        endif;
      /end-free
     C/Exec SQL
     C+  FETCH NEXT FROM MC INTO :rrn, :PDNO, :PDNAME
     C/End-Exec
      /free
        dow (((SQLCOD <> 100) and (SQLCOD >= 0)));
        Flip_Rc_();
        outweb_(%subst(%str(%addr(H__3(1))):1:11));
        wfrtn__ = AfToPage_(ARCLR__);
        outweb_(%subst(%str(%addr(H__3(1))):12:46));
        AfToPage_(%trim(%editc(COUNTER:'Z')));
        outweb_(%subst(%str(%addr(H__3(1))):58:39));
        AfToPage_(%trim(%editc(RRN:'Z')));
        outweb_(%subst(%str(%addr(H__3(2))):17:2));
        wfrtn__ = AfToPage_(PDNO);
        outweb_(%subst(%str(%addr(H__3(2))):19:64));
        wfrtn__ = AfToPage_(E_DLR);
        outweb_(%subst(%str(%addr(H__3(3))):3:43));
        wfrtn__ = AfToPage_(E_PROD);
        outweb_(%subst(%str(%addr(H__3(3))):46:45));
        wfrtn__ = AfToPage_(E_OFC);
        outweb_(%subst(%str(%addr(H__3(4))):11:39));
        wfrtn__ = AfToPage_(E_USR);
        outweb_(%subst(%str(%addr(H__3(4))):50:37));
        wfrtn__ = AfToPage_(E_TAX);
        outweb_(%subst(%str(%addr(H__3(5))):7:44));
        wfrtn__ = AfToPage_(E_3RD);
        outweb_(%subst(%str(%addr(H__3(5))):51:47));
        wfrtn__ = AfToPage_(E_RCN);
        outweb_(%subst(%str(%addr(H__3(6))):18:74));
        wfrtn__ = AfToPage_(PDNO);
        outweb_(%subst(%str(%addr(H__3(7))):12:25));
        wfrtn__ = AfToPage_(PDNAME);
        outweb_(%subst(%str(%addr(H__3(7))):37:12));

      /end-free
     C/Exec SQL
     C+  FETCH NEXT FROM MC INTO :rrn, :PDNO, :PDNAME
     C/End-Exec
      /free
        rcdcnt = rcdcnt + 1;
        counter = counter + 1;
        enddo;
      /end-free
     C/Exec SQL
     C+  close MC
     C/End-Exec
      /free
       endif;
       outweb_(%subst(%str(%addr(H__4(1))):1:694));
       AfToPage_(%trim(%editc(RCDCNT:'Z')));
       outweb_(%subst(%str(%addr(H__4(9))):55:54));
       wfrtn__ = AfToPage_(MODE);
       outweb_(%subst(%str(%addr(H__4(10))):29:2284));
       wfrtn__ = AfToPage_(QPGMNAM__);
       outweb_(%subst(%str(%addr(H__4(38))):73:629));

      /end-free
     c     *PSSR         begsr
     c                   endsr
     P                 E


     P*---------------------------------------------------------------------
     P* dlroptbox0...               - User defined function
     P*---------------------------------------------------------------------
     P dlroptbox0...
     P                 B
     D dlroptbox0...
     D                 PI




      /free

      /end-free
     c     *PSSR         begsr
     c                   endsr
     P                 E


     P*---------------------------------------------------------------------
     P* beginmanage0...             - User defined function
     P*---------------------------------------------------------------------
     P beginmanage0...
     P                 B
     D beginmanage0...
     D                 PI




      /free
       puotype = 'EDITDLR';
       AM011_ = CV_BYKEY;
       CHAIN(NE) DL011_ RKWPUOPT;
       RS011_ = RcdSts2_('GETRCD': %error: %found: %eof);
       if ((((RS011_ = '1')) and ((puoyesno = 'N'))));
        disabled = 'disabled';
       endif;
       rrn = %dec(aton_( getparm3_('rrn':'*MAND'):46:16):9:0);
       pdno = getparm3_('pdno':'*OPT');
       mode = getparm3_('mode':'*OPT');
       AM001_ = CV_BYKEY;
       CHAIN(E) dealerlink RWPDBASE;
       RS001_ = RcdSts2_('GETRCD': %error: %found: %eof);
       pdutype = 'DEALER';
       pduid = '';
      /end-free
     C/Exec SQL
     C+  select PDUID, PDUPASS into :PDUID, :PDUPASS  from KWPDUSER where PDUDEA
     C+ LER =:PDNO and PDUTYPE = :PDUTYPE
     C/End-Exec
      /free
       SaveLoc = Pdloc;
       Pdloc = 0;
       AM002_ = CV_BYKEY;
       CHAIN(NE) DL002_ RKWPDLOC;
       RS002_ = RcdSts2_('GETRCD': %error: %found: %eof);
       PDLOC = SaveLoc;
      /end-free
     C                   MOVEL     PDZIP         pdzipx
      /free
       pddtype = 'DLRINPUT';
       pddcode = 'WEBMODEL';
       AM008_ = CV_BYKEY;
       CHAIN(NE) DL008_ RKWPDDATA;
       RS008_ = RcdSts2_('GETRCD': %error: %found: %eof);
       webmodel = pddchar;
       pddtype = 'DLRINPUT';
       pddcode = 'PDEDATE';
       AM008_ = CV_BYKEY;
       CHAIN(NE) DL008_ RKWPDDATA;
       RS008_ = RcdSts2_('GETRCD': %error: %found: %eof);
       if (RS008_ = '1');
        KWPEDATE = AlpToDate_(pddchar:'*ISO');
       else;
        KWPEDATE = CURISOD__;
       endif;
       pddchar = '';
       pddtype = 'DLRINPUT';
       pddcode = 'APITOKEN';
       AM008_ = CV_BYKEY;
       CHAIN(NE) DL008_ RKWPDDATA;
       RS008_ = RcdSts2_('GETRCD': %error: %found: %eof);
       apitoken = pddchar;
       pddtype = 'DLRINPUT';
       pddcode = 'RTOYESNO';
       AM008_ = CV_BYKEY;
       CHAIN(NE) DL008_ RKWPDDATA;
       RS008_ = RcdSts2_('GETRCD': %error: %found: %eof);
       rtoyesno = pddchar;
       pddtype = 'DLRINPUT';
       pddcode = 'APPRDAYS';
       AM008_ = CV_BYKEY;
       CHAIN(NE) DL008_ RKWPDDATA;
       RS008_ = RcdSts2_('GETRCD': %error: %found: %eof);
       apprdays = pddchar;
       pddtype = 'DLRINPUT';
       pddcode = 'DLRSTYN';
       AM008_ = CV_BYKEY;
       CHAIN(NE) DL008_ RKWPDDATA;
       RS008_ = RcdSts2_('GETRCD': %error: %found: %eof);
       dlrstyn = pddchar;
       pddtype = 'DLRINPUT';
       pddcode = 'USAEPAYATH';
       AM008_ = CV_BYKEY;
       CHAIN(NE) DL008_ RKWPDDATA;
       RS008_ = RcdSts2_('GETRCD': %error: %found: %eof);
       usaepayath = pddchar;
       pddtype = 'DLRINPUT';
       pddcode = 'EMAILSTYN';
       AM008_ = CV_BYKEY;
       CHAIN(NE) DL008_ RKWPDDATA;
       RS008_ = RcdSts2_('GETRCD': %error: %found: %eof);
       emailstyn = pddchar;
       if (fundflag = 'Y');
        pddtype = 'DLRINPUT';
        pddcode = 'DONOTFUND';
        AM008_ = CV_BYKEY;
        CHAIN(NE) DL008_ RKWPDDATA;
        RS008_ = RcdSts2_('GETRCD': %error: %found: %eof);
        if (RS008_ = '1');
         donotfund = pddchar;
        endif;
        if (donotfund = 'Y');
         pddtype = 'DLRINPUT';
         pddcode = 'FUNDNOTE';
         AM008_ = CV_BYKEY;
         CHAIN(NE) DL008_ RKWPDDATA;
         RS008_ = RcdSts2_('GETRCD': %error: %found: %eof);
         if (RS008_ = '1');
          fundnote = pddchar;
         endif;
        endif;
       endif;
       AM003_ = CV_BYKEY;
       CHAIN(NE) DL003_ RWPDPGM;
       RS003_ = RcdSts2_('GETRCD': %error: %found: %eof);
       pddtype = 'DLRINPUT';
       pddcode = 'STIPGRP';
       AM008_ = CV_BYKEY;
       CHAIN(NE) DL008_ RKWPDDATA;
       RS008_ = RcdSts2_('GETRCD': %error: %found: %eof);
       stipgrp = pddchar;
       pddtype = 'DLRINPUT';
       pddcode = 'FRVERIFY';
       AM008_ = CV_BYKEY;
       CHAIN(NE) DL008_ RKWPDDATA;
       RS008_ = RcdSts2_('GETRCD': %error: %found: %eof);
       if (RS008_ = '1');
        frverify = pddchar;
       endif;
       pddtype = 'DLRINPUT';
       pddcode = 'VHOMEIMP';
       AM008_ = CV_BYKEY;
       CHAIN(NE) DL008_ RKWPDDATA;
       RS008_ = RcdSts2_('GETRCD': %error: %found: %eof);
       if (RS008_ = '1');
        vhomeimp = pddchar;
       endif;
       pddtype = 'DLRINPUT';
       pddcode = 'VREBATE';
       AM008_ = CV_BYKEY;
       CHAIN(NE) DL008_ RKWPDDATA;
       RS008_ = RcdSts2_('GETRCD': %error: %found: %eof);
       if (RS008_ = '1');
        vrebate = pddchar;
       endif;
       pddtype = 'DLRINPUT';
       pddcode = 'DBA';
       AM008_ = CV_BYKEY;
       CHAIN(NE) DL008_ RKWPDDATA;
       RS008_ = RcdSts2_('GETRCD': %error: %found: %eof);
       dba = pddchar;
       pddtype = 'DLRINPUT';
       pddcode = 'APPDECP';
       AM008_ = CV_BYKEY;
       CHAIN(NE) DL008_ RKWPDDATA;
       RS008_ = RcdSts2_('GETRCD': %error: %found: %eof);
       appdecp = pddchar;
       pddtype = 'DLRINPUT';
       pddcode = 'REPODLR';
       AM008_ = CV_BYKEY;
       CHAIN(NE) DL008_ RKWPDDATA;
       RS008_ = RcdSts2_('GETRCD': %error: %found: %eof);
       repodlr = pddchar;
       pddtype = 'DLRINPUT';
       pddcode = 'PDEMAIL2';
       AM008_ = CV_BYKEY;
       CHAIN(NE) DL008_ RKWPDDATA;
       RS008_ = RcdSts2_('GETRCD': %error: %found: %eof);
       pdemail2 = pddchar;
       pddtype = 'DLRINPUT';
       pddcode = 'LONGLAT';
       AM008_ = CV_BYKEY;
       CHAIN(NE) DL008_ RKWPDDATA;
       RS008_ = RcdSts2_('GETRCD': %error: %found: %eof);
       longlat = pddchar;
       pddtype = 'DLRINPUT';
       pddcode = 'APPDECS';
       AM008_ = CV_BYKEY;
       CHAIN(NE) DL008_ RKWPDDATA;
       RS008_ = RcdSts2_('GETRCD': %error: %found: %eof);
       appdecs = pddchar;
       pddtype = 'DLRINPUT';
       pddcode = 'DOCBEFAPP';
       AM008_ = CV_BYKEY;
       CHAIN(NE) DL008_ RKWPDDATA;
       RS008_ = RcdSts2_('GETRCD': %error: %found: %eof);
       docbefapp = pddchar;
       pddtype = 'DLRINPUT';
       pddcode = 'PERMITADDON';
       AM008_ = CV_BYKEY;
       CHAIN(NE) DL008_ RKWPDDATA;
       RS008_ = RcdSts2_('GETRCD': %error: %found: %eof);
       permitaddon = pddchar;
       pddtype = 'DLRINPUT';
       pddcode = 'OMANU';
       AM008_ = CV_BYKEY;
       CHAIN(NE) DL008_ RKWPDDATA;
       RS008_ = RcdSts2_('GETRCD': %error: %found: %eof);
       omanu = pddchar;
       pddtype = 'DLRINPUT';
       pddcode = 'OPSOLD1';
       AM008_ = CV_BYKEY;
       CHAIN(NE) DL008_ RKWPDDATA;
       RS008_ = RcdSts2_('GETRCD': %error: %found: %eof);
       opsold1 = pddchar;
       pddtype = 'DLRINPUT';
       pddcode = 'OPSOLD2';
       AM008_ = CV_BYKEY;
       CHAIN(NE) DL008_ RKWPDDATA;
       RS008_ = RcdSts2_('GETRCD': %error: %found: %eof);
       opsold2 = pddchar;
       pddtype = 'DLRINPUT';
       pddcode = 'OPSOLD3';
       AM008_ = CV_BYKEY;
       CHAIN(NE) DL008_ RKWPDDATA;
       RS008_ = RcdSts2_('GETRCD': %error: %found: %eof);
       opsold3 = pddchar;
       pddtype = 'DLRINPUT';
       pddcode = 'DLRNOTE';
       AM008_ = CV_BYKEY;
       CHAIN(NE) DL008_ RKWPDDATA;
       RS008_ = RcdSts2_('GETRCD': %error: %found: %eof);
       dlrnote = pddchar;
       pddtype = 'DLRINPUT';
       pddcode = 'DLRNOTE2';
       AM008_ = CV_BYKEY;
       CHAIN(NE) DL008_ RKWPDDATA;
       RS008_ = RcdSts2_('GETRCD': %error: %found: %eof);
       dlrnote2 = pddchar;
       pddtype = 'DLRINPUT';
       pddcode = 'DLRNOTE3';
       AM008_ = CV_BYKEY;
       CHAIN(NE) DL008_ RKWPDDATA;
       RS008_ = RcdSts2_('GETRCD': %error: %found: %eof);
       dlrnote3 = pddchar;
       pddtype = 'DLRINPUT';
       pddcode = 'DLRNOTE4';
       AM008_ = CV_BYKEY;
       CHAIN(NE) DL008_ RKWPDDATA;
       RS008_ = RcdSts2_('GETRCD': %error: %found: %eof);
       dlrnote4 = pddchar;
       pddtype = 'DLRINPUT';
       pddcode = 'DLRALTYN';
       AM008_ = CV_BYKEY;
       CHAIN(NE) DL008_ RKWPDDATA;
       RS008_ = RcdSts2_('GETRCD': %error: %found: %eof);
       dlraltdisp = pddchar;
       pddtype = 'DLRINPUT';
       pddcode = 'DLRNOTE6';
       AM008_ = CV_BYKEY;
       CHAIN(NE) DL008_ RKWPDDATA;
       RS008_ = RcdSts2_('GETRCD': %error: %found: %eof);
       dlrnote6 = pddchar;
       pddtype = 'DLRINPUT';
       pddcode = 'DLRNOTE5';
       AM008_ = CV_BYKEY;
       CHAIN(NE) DL008_ RKWPDDATA;
       RS008_ = RcdSts2_('GETRCD': %error: %found: %eof);
       dlrnote5 = pddchar;
       pddtype = 'DLRINPUT';
       pddcode = 'DLRNOTE6';
       AM008_ = CV_BYKEY;
       CHAIN(NE) DL008_ RKWPDDATA;
       RS008_ = RcdSts2_('GETRCD': %error: %found: %eof);
       dlrnote6 = pddchar;
       pddtype = 'DLRINPUT';
       pddcode = 'GLVEND';
       AM008_ = CV_BYKEY;
       CHAIN(NE) DL008_ RKWPDDATA;
       RS008_ = RcdSts2_('GETRCD': %error: %found: %eof);
       pdglvend = pddchar;
       if (client = '105');
        disabled = '';
        pddtype = 'DLRINPUT';
        pddcode = 'RISKBP';
        AM008_ = CV_BYKEY;
        CHAIN(NE) DL008_ RKWPDDATA;
        RS008_ = RcdSts2_('GETRCD': %error: %found: %eof);
        riskbp = pddchar;
        disabled = '';
        pddtype = 'DLRINPUT';
        pddcode = 'NOCDOC';
        AM008_ = CV_BYKEY;
        CHAIN(NE) DL008_ RKWPDDATA;
        RS008_ = RcdSts2_('GETRCD': %error: %found: %eof);
        nocdoc = pddchar;
       endif;
       if ((((client = '108')) or ((client = '908'))));
        disabled = '';
        pddtype = 'DLRINPUT';
        pddcode = 'CASHPMT';
        AM008_ = CV_BYKEY;
        CHAIN(NE) DL008_ RKWPDDATA;
        RS008_ = RcdSts2_('GETRCD': %error: %found: %eof);
        if (RS008_ = '1');
         cashpmt = pddchar;
        endif;
        disabled = '';
        pddtype = 'DLRINPUT';
        pddcode = 'SALESTAX';
        AM008_ = CV_BYKEY;
        CHAIN(NE) DL008_ RKWPDDATA;
        RS008_ = RcdSts2_('GETRCD': %error: %found: %eof);
        if (RS008_ = '1');
         salestax = pddchar;
        endif;
        disabled = '';
        pddtype = 'DLRINPUT';
        pddcode = 'AUTOTAX';
        AM008_ = CV_BYKEY;
        CHAIN(NE) DL008_ RKWPDDATA;
        RS008_ = RcdSts2_('GETRCD': %error: %found: %eof);
        if (RS008_ = '1');
         autotax = pddchar;
        endif;
       endif;
       pddtype = 'DLRINPUT';
       pddcode = 'BANKSTIP';
       AM008_ = CV_BYKEY;
       CHAIN(NE) DL008_ RKWPDDATA;
       RS008_ = RcdSts2_('GETRCD': %error: %found: %eof);
       if (RS008_ = '1');
        bankstip = pddchar;
       endif;
       pddtype = 'DLRINPUT';
       pddcode = 'APPROVEALL';
       AM008_ = CV_BYKEY;
       CHAIN(NE) DL008_ RKWPDDATA;
       RS008_ = RcdSts2_('GETRCD': %error: %found: %eof);
       if (RS008_ = '1');
        approveall = pddchar;
       endif;
       pddtype = 'DLRINPUT';
       pddcode = 'NOCREDIT';
       AM008_ = CV_BYKEY;
       CHAIN(NE) DL008_ RKWPDDATA;
       RS008_ = RcdSts2_('GETRCD': %error: %found: %eof);
       if (RS008_ = '1');
        nocredit = pddchar;
       endif;
       pddtype = 'DLRINPUT';
       pddcode = 'ABASEARCH';
       AM008_ = CV_BYKEY;
       CHAIN(NE) DL008_ RKWPDDATA;
       RS008_ = RcdSts2_('GETRCD': %error: %found: %eof);
       if (RS008_ = '1');
        abasearch = pddchar;
       endif;
       pddtype = 'DLRINPUT';
       pddcode = 'DLRSIGN';
       AM008_ = CV_BYKEY;
       CHAIN(NE) DL008_ RKWPDDATA;
       RS008_ = RcdSts2_('GETRCD': %error: %found: %eof);
       if (RS008_ = '1');
        dlrsign = pddchar;
       endif;
       pddtype = 'DLRINPUT';
       pddcode = 'TEXTAPP';
       AM008_ = CV_BYKEY;
       CHAIN(NE) DL008_ RKWPDDATA;
       RS008_ = RcdSts2_('GETRCD': %error: %found: %eof);
       if (RS008_ = '1');
        textapp = pddchar;
       endif;
       pddtype = 'DLRINPUT';
       pddcode = 'DISPCOLL';
       AM008_ = CV_BYKEY;
       CHAIN(NE) DL008_ RKWPDDATA;
       RS008_ = RcdSts2_('GETRCD': %error: %found: %eof);
       if (RS008_ = '1');
        dispcoll = pddchar;
       endif;
       pddtype = 'DLRINPUT';
       pddcode = 'DELDATE';
       AM008_ = CV_BYKEY;
       CHAIN(NE) DL008_ RKWPDDATA;
       RS008_ = RcdSts2_('GETRCD': %error: %found: %eof);
       if (RS008_ = '1');
        deldate = pddchar;
       endif;
       pddtype = 'DLRINPUT';
       pddcode = 'PMTCALC';
       AM008_ = CV_BYKEY;
       CHAIN(NE) DL008_ RKWPDDATA;
       RS008_ = RcdSts2_('GETRCD': %error: %found: %eof);
       if (RS008_ = '1');
        pmtcalc = pddchar;
       endif;
       pddtype = 'DLRINPUT';
       pddcode = 'FUNDLIST';
       AM008_ = CV_BYKEY;
       CHAIN(NE) DL008_ RKWPDDATA;
       RS008_ = RcdSts2_('GETRCD': %error: %found: %eof);
       if (RS008_ = '1');
        fundlist = pddchar;
       endif;
       pddtype = 'DLRINPUT';
       pddcode = 'PARFUND';
       AM008_ = CV_BYKEY;
       CHAIN(NE) DL008_ RKWPDDATA;
       RS008_ = RcdSts2_('GETRCD': %error: %found: %eof);
       if (RS008_ = '1');
        parfund = pddchar;
       endif;
       pddtype = 'DLRINPUT';
       pddcode = 'LTODEP';
       AM008_ = CV_BYKEY;
       CHAIN(NE) DL008_ RKWPDDATA;
       RS008_ = RcdSts2_('GETRCD': %error: %found: %eof);
       if (RS008_ = '1');
        ltodep = pddchar;
       endif;
       pddtype = 'DLRINPUT';
       pddcode = 'LDWOPT';
       AM008_ = CV_BYKEY;
       CHAIN(NE) DL008_ RKWPDDATA;
       RS008_ = RcdSts2_('GETRCD': %error: %found: %eof);
       if (RS008_ = '1');
        ldwopt = pddchar;
       endif;
       pddtype = 'DLRINPUT';
       pddcode = 'ADDDOWN';
       AM008_ = CV_BYKEY;
       CHAIN(NE) DL008_ RKWPDDATA;
       RS008_ = RcdSts2_('GETRCD': %error: %found: %eof);
       if (RS008_ = '1');
        adddown = pddchar;
       endif;
       pddtype = 'DLRINPUT';
       pddcode = 'DELIVERY';
       AM008_ = CV_BYKEY;
       CHAIN(NE) DL008_ RKWPDDATA;
       RS008_ = RcdSts2_('GETRCD': %error: %found: %eof);
       if (RS008_ = '1');
        delivery = pddchar;
       endif;
       pddtype = 'DLRINPUT';
       pddcode = 'DOWNPCT';
       AM008_ = CV_BYKEY;
       CHAIN(NE) DL008_ RKWPDDATA;
       RS008_ = RcdSts2_('GETRCD': %error: %found: %eof);
       if (RS008_ = '1');
        downpct = pddchar;
       endif;
       pddtype = 'DLRINPUT';
       pddcode = 'WARRANTY';
       AM008_ = CV_BYKEY;
       CHAIN(NE) DL008_ RKWPDDATA;
       RS008_ = RcdSts2_('GETRCD': %error: %found: %eof);
       if (RS008_ = '1');
        warranty = pddchar;
       endif;
       pddtype = 'DLRINPUT';
       pddcode = 'APPRPEND';
       AM008_ = CV_BYKEY;
       CHAIN(NE) DL008_ RKWPDDATA;
       RS008_ = RcdSts2_('GETRCD': %error: %found: %eof);
       if (RS008_ = '1');
        apprpend = pddchar;
       endif;
       pddtype = 'DLRINPUT';
       pddcode = 'ADDRVALID';
       AM008_ = CV_BYKEY;
       CHAIN(NE) DL008_ RKWPDDATA;
       RS008_ = RcdSts2_('GETRCD': %error: %found: %eof);
       if (RS008_ = '1');
        addrvalid = pddchar;
       endif;
       pddtype = 'DLRINPUT';
       pddcode = 'DOCUSIGN';
       AM008_ = CV_BYKEY;
       CHAIN(NE) DL008_ RKWPDDATA;
       RS008_ = RcdSts2_('GETRCD': %error: %found: %eof);
       if (RS008_ = '1');
        docusign = pddchar;
       endif;
       pddtype = 'DLRINPUT';
       pddcode = 'PPCARD';
       AM008_ = CV_BYKEY;
       CHAIN(NE) DL008_ RKWPDDATA;
       RS008_ = RcdSts2_('GETRCD': %error: %found: %eof);
       if (RS008_ = '1');
        ppcard = pddchar;
       endif;
       pddtype = 'DLRINPUT';
       pddcode = 'PPIBV';
       AM008_ = CV_BYKEY;
       CHAIN(NE) DL008_ RKWPDDATA;
       RS008_ = RcdSts2_('GETRCD': %error: %found: %eof);
       if (RS008_ = '1');
        ppibv = pddchar;
       endif;
       pddtype = 'DLRINPUT';
       pddcode = 'BANKSTMTIBV';
       AM008_ = CV_BYKEY;
       CHAIN(NE) DL008_ RKWPDDATA;
       RS008_ = RcdSts2_('GETRCD': %error: %found: %eof);
       if (RS008_ = '1');
        bankstmtibv = pddchar;
       endif;
       pddtype = 'DLRINPUT';
       pddcode = 'STORISFAST';
       AM008_ = CV_BYKEY;
       CHAIN(NE) DL008_ RKWPDDATA;
       RS008_ = RcdSts2_('GETRCD': %error: %found: %eof);
       if (RS008_ = '1');
        storisfast = pddchar;
       endif;
       pddtype = 'DLRINPUT';
       pddcode = 'FUNDPART';
       AM008_ = CV_BYKEY;
       CHAIN(NE) DL008_ RKWPDDATA;
       RS008_ = RcdSts2_('GETRCD': %error: %found: %eof);
       if (RS008_ = '1');
        fundpart = pddchar;
       endif;
       if (client = '104');
        disabled = '';
        pddtype = 'DLRINPUT';
        pddcode = 'FBF';
        AM008_ = CV_BYKEY;
        CHAIN(NE) DL008_ RKWPDDATA;
        RS008_ = RcdSts2_('GETRCD': %error: %found: %eof);
        fbf = pddchar;
        pddtype = 'PDAPPRD';
        pddcode = 'APPRD';
        AM008_ = CV_BYKEY;
        CHAIN(NE) DL008_ RKWPDDATA;
        RS008_ = RcdSts2_('GETRCD': %error: %found: %eof);
        pdapprd = %trim(pddchar);
       endif;
       if (client = '116');
        pddtype = 'DLRINPUT';
        pddcode = 'SELOFFICE';
        AM008_ = CV_BYKEY;
        CHAIN(NE) DL008_ RKWPDDATA;
        RS008_ = RcdSts2_('GETRCD': %error: %found: %eof);
        seloffice = %trim(pddchar);
        pddtype = 'DLRINPUT';
        pddcode = 'MAXLNAMT';
        AM008_ = CV_BYKEY;
        CHAIN(NE) DL008_ RKWPDDATA;
        RS008_ = RcdSts2_('GETRCD': %error: %found: %eof);
        MAXLNAMT = %dec(aton_(pddchar:46:16):46:16);
        pddtype = 'DLRINPUT';
        pddcode = 'MAXLNTERM';
        AM008_ = CV_BYKEY;
        CHAIN(NE) DL008_ RKWPDDATA;
        RS008_ = RcdSts2_('GETRCD': %error: %found: %eof);
        MAXLNTERM = %dec(aton_(pddchar:46:16):46:16);
       endif;
       if ((((client = '108')) or ((client = '908'))));
        pddtype = 'DLRINPUT';
        pddcode = 'DISCPCT';
        AM008_ = CV_BYKEY;
        CHAIN(NE) DL008_ RKWPDDATA;
        RS008_ = RcdSts2_('GETRCD': %error: %found: %eof);
        if (RS008_ = '1');
         discpct = %dec(aton_(pddchar:46:16):46:16);
        endif;
        pddtype = 'DLRINPUT';
        pddcode = 'COMMPCT';
        AM008_ = CV_BYKEY;
        CHAIN(NE) DL008_ RKWPDDATA;
        RS008_ = RcdSts2_('GETRCD': %error: %found: %eof);
        if (RS008_ = '1');
         commpct = %dec(aton_(pddchar:46:16):46:16);
        endif;
        pddtype = 'DLRINPUT';
        pddcode = 'EPDPCT';
        AM008_ = CV_BYKEY;
        CHAIN(NE) DL008_ RKWPDDATA;
        RS008_ = RcdSts2_('GETRCD': %error: %found: %eof);
        if (RS008_ = '1');
         epdpct = %dec(aton_(pddchar:46:16):46:16);
        endif;
        pddtype = 'DLRINPUT';
        pddcode = 'FICOPCT';
        AM008_ = CV_BYKEY;
        CHAIN(NE) DL008_ RKWPDDATA;
        RS008_ = RcdSts2_('GETRCD': %error: %found: %eof);
        if (RS008_ = '1');
         ficopct = %dec(aton_(pddchar:46:16):46:16);
        endif;
        pddtype = 'DLRINPUT';
        pddcode = 'FICOSCORE';
        AM008_ = CV_BYKEY;
        CHAIN(NE) DL008_ RKWPDDATA;
        RS008_ = RcdSts2_('GETRCD': %error: %found: %eof);
        if (RS008_ = '1');
         ficoscore = %dec(aton_(pddchar:46:16):46:16);
        endif;
        pddtype = 'DLRINPUT';
        pddcode = 'EMPLPCT';
        AM008_ = CV_BYKEY;
        CHAIN(NE) DL008_ RKWPDDATA;
        RS008_ = RcdSts2_('GETRCD': %error: %found: %eof);
        if (RS008_ = '1');
         emplpct = %dec(aton_(pddchar:46:16):46:16);
        endif;
        pddtype = 'DLRINPUT';
        pddcode = 'FICOYN';
        AM008_ = CV_BYKEY;
        CHAIN(NE) DL008_ RKWPDDATA;
        RS008_ = RcdSts2_('GETRCD': %error: %found: %eof);
        if (RS008_ = '1');
         ficoyn = pddchar;
        endif;
        pddtype = 'DLRINPUT';
        pddcode = 'DOWNPMT';
        pddchar = '';
        AM008_ = CV_BYKEY;
        CHAIN(NE) DL008_ RKWPDDATA;
        RS008_ = RcdSts2_('GETRCD': %error: %found: %eof);
        if (RS008_ = '1');
         downpmt = %dec(aton_(pddchar:46:16):46:16);
        endif;
        pdno = getparm3_('pdno':'*OPT');
        pddtype = 'DLR_EMAIL';
        SETLL  eventkey RKWPDDATA;
        RS008_ = RcdSts2_('POSRCD':%error:%equal:%eof);
        READE(NE) eventkey RKWPDDATA;
        RS008_ = RcdSts2_('GETNXTRCD':%error:%found:%eof);
        AM008_ = CV_ByKey;
        if (RS008_ = '1');
         email1 = pddchar;
        endif;
        READE(NE) eventkey RKWPDDATA;
        RS008_ = RcdSts2_('GETNXTRCD':%error:%found:%eof);
        AM008_ = CV_ByKey;
        if (RS008_ = '1');
         email2 = pddchar;
        endif;
        READE(NE) eventkey RKWPDDATA;
        RS008_ = RcdSts2_('GETNXTRCD':%error:%found:%eof);
        AM008_ = CV_ByKey;
        if (RS008_ = '1');
         email3 = pddchar;
        endif;
        READE(NE) eventkey RKWPDDATA;
        RS008_ = RcdSts2_('GETNXTRCD':%error:%found:%eof);
        AM008_ = CV_ByKey;
        if (RS008_ = '1');
         email4 = pddchar;
        endif;
        READE(NE) eventkey RKWPDDATA;
        RS008_ = RcdSts2_('GETNXTRCD':%error:%found:%eof);
        AM008_ = CV_ByKey;
        if (RS008_ = '1');
         email5 = pddchar;
        endif;
       endif;
       pddchar = '';
       pddtype = 'DLRINPUT';
       pddcode = 'PRTOPROC';
       AM008_ = CV_BYKEY;
       CHAIN(NE) DL008_ RKWPDDATA;
       RS008_ = RcdSts2_('GETRCD': %error: %found: %eof);
       PRTOPROC = %dec(aton_(pddchar:46:16):46:16);
       pddchar = '';
       pddtype = 'DLRINPUT';
       pddcode = 'EPOFEE';
       AM008_ = CV_BYKEY;
       CHAIN(NE) DL008_ RKWPDDATA;
       RS008_ = RcdSts2_('GETRCD': %error: %found: %eof);
       EPOFEE = %dec(aton_(pddchar:46:16):46:16);
       pddchar = '';
       pddtype = 'DLRINPUT';
       pddcode = 'EPOPCT';
       AM008_ = CV_BYKEY;
       CHAIN(NE) DL008_ RKWPDDATA;
       RS008_ = RcdSts2_('GETRCD': %error: %found: %eof);
       EPOPCT = %dec(aton_(pddchar:46:16):46:16);
       pddchar = '';
       pddtype = 'DLRINPUT';
       pddcode = 'ORGPCT';
       AM008_ = CV_BYKEY;
       CHAIN(NE) DL008_ RKWPDDATA;
       RS008_ = RcdSts2_('GETRCD': %error: %found: %eof);
       ORGPCT = %dec(aton_(pddchar:46:16):46:16);
       pddchar = '';
       pddtype = 'DLRINPUT';
       pddcode = 'RTOPMT';
       AM008_ = CV_BYKEY;
       CHAIN(NE) DL008_ RKWPDDATA;
       RS008_ = RcdSts2_('GETRCD': %error: %found: %eof);
       RTOPMT = %dec(aton_(pddchar:46:16):46:16);
       pddchar = '';
       pddtype = 'DLRINPUT';
       pddcode = 'INCENT_AVERAGE';
       AM008_ = CV_BYKEY;
       CHAIN(NE) DL008_ RKWPDDATA;
       RS008_ = RcdSts2_('GETRCD': %error: %found: %eof);
       incent_average = %dec(aton_(pddchar:46:16):46:16);
       pddchar = '';
       pddtype = 'DLRINPUT';
       pddcode = 'INCENT_DISC';
       AM008_ = CV_BYKEY;
       CHAIN(NE) DL008_ RKWPDDATA;
       RS008_ = RcdSts2_('GETRCD': %error: %found: %eof);
       incent_disc = %dec(aton_(pddchar:46:16):46:16);
       pddchar = '';
       pddtype = 'DLRINPUT';
       pddcode = 'NEW_DAYS';
       AM008_ = CV_BYKEY;
       CHAIN(NE) DL008_ RKWPDDATA;
       RS008_ = RcdSts2_('GETRCD': %error: %found: %eof);
       new_days = %dec(aton_(pddchar:46:16):46:16);
       pddchar = '';
       pddtype = 'DLRINPUT';
       pddcode = 'NEW_DISCOUNT';
       AM008_ = CV_BYKEY;
       CHAIN(NE) DL008_ RKWPDDATA;
       RS008_ = RcdSts2_('GETRCD': %error: %found: %eof);
       new_discount = %dec(aton_(pddchar:46:16):46:16);
       pddchar = '';
       pddtype = 'DLRINPUT';
       pddcode = 'EMPL_DATE';
       AM008_ = CV_BYKEY;
       CHAIN(NE) DL008_ RKWPDDATA;
       RS008_ = RcdSts2_('GETRCD': %error: %found: %eof);
       EMPL_DATE = AlpToDate_(pddchar:'*ISO');
       pddchar = '';
       pddtype = 'DLRINPUT';
       pddcode = 'EMPL_DAYS';
       AM008_ = CV_BYKEY;
       CHAIN(NE) DL008_ RKWPDDATA;
       RS008_ = RcdSts2_('GETRCD': %error: %found: %eof);
       empl_days = %dec(aton_(pddchar:46:16):46:16);
       pddchar = '';
       pddtype = 'DLRINPUT';
       pddcode = 'EMPL_AMOUNT';
       AM008_ = CV_BYKEY;
       CHAIN(NE) DL008_ RKWPDDATA;
       RS008_ = RcdSts2_('GETRCD': %error: %found: %eof);
       empl_amount = %dec(aton_(pddchar:46:16):46:16);
       pddchar = '';
       pddtype = 'DLRINPUT';
       pddcode = 'MOVOLUME';
       AM008_ = CV_BYKEY;
       CHAIN(NE) DL008_ RKWPDDATA;
       RS008_ = RcdSts2_('GETRCD': %error: %found: %eof);
       movolume = %dec(aton_(pddchar:46:16):46:16);
       pddchar = '';
       pddtype = 'DLRINPUT';
       pddcode = 'RATE_TIER';
       AM008_ = CV_BYKEY;
       CHAIN(NE) DL008_ RKWPDDATA;
       RS008_ = RcdSts2_('GETRCD': %error: %found: %eof);
       rate_tier = pddchar;
       pddchar = '';
       pddtype = 'DLRINPUT';
       pddcode = 'SAC_DAYS';
       AM008_ = CV_BYKEY;
       CHAIN(NE) DL008_ RKWPDDATA;
       RS008_ = RcdSts2_('GETRCD': %error: %found: %eof);
       sac_days = %dec(aton_(pddchar:46:16):46:16);
       if (client = '115');
        WPROCD = %dec(aton_( getparm3_('WPROCD':'*OPT'):46:16):11:2);
        WPROCD = %dec(aton_('WPROCD':46:16):11:2);
       endif;
       puotype = 'EDITDLR';
       AM011_ = CV_BYKEY;
       CHAIN(NE) DL011_ RKWPUOPT;
       RS011_ = RcdSts2_('GETRCD': %error: %found: %eof);
       if ((((RS011_ = '1')) and ((puoyesno = 'N'))));
        disabled = 'disabled';
       endif;
       pruletype = 'SYSTEM';
       prulename = 'ESIGNDLROWNER';
       AM018_ = CV_BYKEY;
       CHAIN(E) DL018_ RKWPRULE;
       RS018_ = RcdSts2_('GETRCD': %error: %found: %eof);
       if (((RS018_ = '1') and (pruleyesno = 'Y')));
        pddtype = 'CUSTOMER';
        pddcode = '';
        pddchar = '';
        AM008_ = CV_BYKEY;
        CHAIN(NE) codekey RKWPDDATA;
        RS008_ = RcdSts2_('GETRCD': %error: %found: %eof);
        if (((pdno <> '') and ((RS008_ = '1'))));
         Ccust = %dec(aton_(pddcode:46:16):46:16);
         AM016_ = CV_BYKEY;
         CHAIN(NE) DL016_ RKWCNAME;
         RS016_ = RcdSts2_('GETRCD': %error: %found: %eof);
         if (RS016_ = '1');
          dsname = cname;
         endif;
        endif;
       endif;
       pddtype = 'CUSTOMER';
       pddcode = '';
       pddchar = '';
       AM008_ = CV_BYKEY;
       CHAIN(NE) codekey RKWPDDATA;
       RS008_ = RcdSts2_('GETRCD': %error: %found: %eof);
       if (((pdno <> '') and ((RS008_ = '1'))));
        Ccust = %dec(aton_(pddcode:46:16):46:16);
        conttype = 'HOME';
        pruletype = 'SYSTEM';
        prulename = 'CONTACTTYPEEMAIL';
        AM018_ = CV_BYKEY;
        CHAIN(NE) DL018_ RKWPRULE;
        RS018_ = RcdSts2_('GETRCD': %error: %found: %eof);
        if ((((RS018_ = '1')) and ((pruleyesno = 'Y'))));
         conttype = 'EMAIL';
        endif;
        AM013_ = CV_BYKEY;
        CHAIN(NE) DL013_ RKWCCONT;
        RS013_ = RcdSts2_('GETRCD': %error: %found: %eof);
        if (RS013_ = '1');
         signemail = cemail;
        endif;
       endif;
       if (((signemail = '') and (mode <> 'new')));
        signemail = pdemail;
       endif;
       pddtype = 'DLRINPUT';
       pddcode = 'EFTBATCH';
       AM008_ = CV_BYKEY;
       CHAIN(NE) DL008_ RKWPDDATA;
       RS008_ = RcdSts2_('GETRCD': %error: %found: %eof);
       if (RS008_ = '1');
        eftbatch = pddchar;
       else;
        eftbatch = 'N';
       endif;
       pddtype = 'DLRINPUT';
       pddcode = 'SIGNTYPE';
       AM008_ = CV_BYKEY;
       CHAIN(NE) DL008_ RKWPDDATA;
       RS008_ = RcdSts2_('GETRCD': %error: %found: %eof);
       signtype = pddchar;
       pdrtype = 'RISKPER';
       AM022_ = CV_BYKEY;
       CHAIN(NE) DL022_ RKWPDRATE;
       RS022_ = RcdSts2_('GETRCD': %error: %found: %eof);
       RISKPER = PDRATE;
       outweb_(%subst(%str(%addr(H__6(1))):1:413));
       outweb_(%subst(%str(%addr(H__5(1))):1:2600));
       outweb_(%subst(%str(%addr(H__6(6))):14:1961));
       if (((phpdlrnote = 'Y') and (rrn <> 0)));
        OutWeb_('<div class="dialog" title="Dealer Notes: ');
        OutWeb_(%trimr(pdname));
        OutWeb_('" id="DealerNotesDialog">'+x'0D'+''+x'25'+'  		<iframe width-
       ="98%" height="98%" src="/kwik/kl/dealer_notes?dlr=');
        OutWeb_(%trimr(pdno));
        OutWeb_('"></iframe>'+x'0D'+''+x'25'+'  	</div>');
       endif;
       outweb_(%subst(%str(%addr(H__6(30))):55:31));
       wfrtn__ = AfToPage_(QPGMNAM__);
       outweb_(%subst(%str(%addr(H__6(31))):6:172));
       AfToPage_(%trim(%editc(RRN:'X')));
       outweb_(%subst(%str(%addr(H__6(33))):18:56));
       wfrtn__ = AfToPage_(SAVEDRRN);
       outweb_(%subst(%str(%addr(H__6(33))):74:65));
       wfrtn__ = AfToPage_(PDNAME);
       outweb_(%subst(%str(%addr(H__6(34))):59:264));
       wfrtn__ = AfToPage_(PDNO);
       outweb_(%subst(%str(%addr(H__6(38))):3:52));
       if (client = '119');
        OutWeb_(%trimr( '<button type="button" onclick="location.href=''glf_l-
       info.pgm?pdno=' + %trim(pdno) + '''">Addl Lawyer Info</button>'));
       endif;
       outweb_(%subst(%str(%addr(H__6(38))):55:11));
       if (((phpdlrnote = 'Y') and (rrn <> 0)));
        OutWeb_('<button type="button" class="dialog-toggle" data-target="#De-
       alerNotesDialog">Notes</button>');
       endif;
       outweb_(%subst(%str(%addr(H__6(38))):66:83));
       wfrtn__ = AfToPage_(PGM_LNLIST);
       outweb_(%subst(%str(%addr(H__6(39))):69:744));
       wfrtn__ = AfToPage_(DISABLED);
       outweb_(%subst(%str(%addr(H__6(49))):13:8));
       wfrtn__ = AfToPage_(PDNO);
       outweb_(%subst(%str(%addr(H__6(49))):21:160));
       gas_cash_box0();
       outweb_(%subst(%str(%addr(H__6(51))):21:225));
       wfrtn__ = AfToPage_(DISABLED);
       outweb_(%subst(%str(%addr(H__6(54))):6:8));
       wfrtn__ = AfToPage_(PDNAME);
       outweb_(%subst(%str(%addr(H__6(54))):14:233));
       wfrtn__ = AfToPage_(DSNAME);
       outweb_(%subst(%str(%addr(H__6(57))):7:160));
       pdnusebox0();
       outweb_(%subst(%str(%addr(H__6(59))):7:159));
       pdlocbox0();
       outweb_(%subst(%str(%addr(H__6(61))):6:156));
       dlrstatbox0();
       outweb_(%subst(%str(%addr(H__6(63))):2:158));
       pdpgmbox0();
       outweb_(%subst(%str(%addr(H__6(64))):80:153));
       eftbatchbox0();
       outweb_(%subst(%str(%addr(H__6(66))):73:222));
       wfrtn__ = AfToPage_(%char(KWPEDATE: *USA));
       outweb_(%subst(%str(%addr(H__6(69))):55:45));
       if ((((client = '108')) or ((client = '908'))));
        OutWeb_('<tr><td class="left">Cash Payment?</td><td class="right">');
        cashpmtbox0();
        OutWeb_('</td></tr>');
        OutWeb_('<tr><td class="left">Sales Tax Required?</td><td class="righ-
       t">');
        salestaxbox0();
        OutWeb_('</td></tr>');
        OutWeb_('<tr><td class="left">Automatic Sales Tax?</td><td class="rig-
       ht">');
        autotaxbox0();
        OutWeb_('</td></tr>');
       endif;
       outweb_(%subst(%str(%addr(H__6(70))):20:124));
       signtypebox0();
       outweb_(%subst(%str(%addr(H__6(71))):64:73));
       if (approvalexp = 'Y');
        OutWeb_('<tr><td class="left">Approval Good for Days:</td><td class="-
       right">');
        OutWeb_(%trimr( '<input type="text" name="APPRDAYS" id="APPRDAYS" val-
       ue="' + %trim(apprdays) + '">'));
        OutWeb_('</td></tr>');
       endif;
       outweb_(%subst(%str(%addr(H__6(72))):57:21));
       if (dlrstynopt = 'Y');
        OutWeb_('<tr><td class="left">Use Dealer State for Docs:</td><td clas-
       s="right">');
        dlrstynbox0();
        OutWeb_('</td></tr>');
       endif;
       outweb_(%subst(%str(%addr(H__6(72))):78:21));
       if (renttoown = 'Y');
        OutWeb_('<tr><td class="left">Rent-To-Own?</td><td class="right">');
        rtoynbox0();
        OutWeb_('</td></tr>');
        OutWeb_('<tr><td class="left">Does Dealer take Returns?</td><td class-
       ="right">');
        repodlrbox0();
        OutWeb_('</td></tr>');
        OutWeb_(%trimr( '<tr><td class="left">RTO Processing Fee:</td><td cla-
       ss="right"><input type="text" name="PRTOPROC" size="6" maxlength="6" v-
       alue="' + %editc(PRTOPROC:'J') + '" style="width: 150px;"></td></tr><t-
       r>'));
        OutWeb_(%trimr( '<tr><td class="left">Early Buyout Fee:</td><td class-
       ="right"><input type="text" name="EPOFEE" size="6" maxlength="6" value-
       ="' + %editc(EPOFEE:'J') + '" style="width: 150px;"></td></tr><tr>'));
        OutWeb_(%trimr( '<tr><td class="left">Early Buyout Pct:</td><td class-
       ="right"><input type="text" name="EPOPCT" size="6" maxlength="6" value-
       ="' + %editc(EPOPCT:'J') + '" style="width: 150px;"></td></tr><tr>'));
        OutWeb_(%trimr( '<tr><td class="left">RTO 1st Payment:</td><td class=-
       "right"><input type="text" name="RTOPMT" size="6" maxlength="6" value=-
       "' + %editc(RTOPMT:'J') + '" style="width: 150px;"></td></tr><tr>'));
       endif;
       OutWeb_(%trimr( '<tr><td class="left">Origination Fee Pct:</td><td cla-
       ss="right"><input type="text" name="ORGPCT" size="6" maxlength="6" val-
       ue="' + %editc(ORGPCT:'J') + '" style="width: 150px;"></td></tr><tr>')
       );
       outweb_(%subst(%str(%addr(H__6(73))):19:44));
       if (client = '105');
        OutWeb_('<tr><td class="left">Risk-based pricing?</td><td class="righ-
       t">');
        riskbpbox0();
        OutWeb_('</td></tr>');
        OutWeb_('<tr><td class="left">Notice of Cancelation?</td><td class="r-
       ight">');
        nocdocbox0();
        OutWeb_('</td></tr>');
       endif;
       outweb_(%subst(%str(%addr(H__6(73))):63:21));
       if (client = '104');
        OutWeb_('<tr><td class="left">Date Dealer Approved</td><td class="rig-
       ht">');
        OutWeb_('<input type="text" placeholder="MM/DD/YYYY" value="');
        OutWeb_(%trimr( %trim(pdapprd)));
        OutWeb_('" class="date" name="PDAPPRD" maxlength="10">');
        OutWeb_('</td></tr>');
        OutWeb_('<tr><td class="left">Fund by Fax?</td><td class="right">');
        fbfbox0();
        OutWeb_('</td></tr>');
        OutWeb_('<tr><td class="left">Loan Group:</td><td class="right">');
        OutWeb_('<input type="text" value="');
        OutWeb_(%trimr( %trim(pdlngrp)));
        OutWeb_('" name="PDLNGRP" maxlength="25">');
        OutWeb_('</td></tr>');
        OutWeb_('<tr><td class="left">Fraud Verify:</td><td class="right">');
        OutWeb_('<input type="checkbox" value="Y" ');
        if (frverify = 'Y');
         OutWeb_('checked');
        endif;
        OutWeb_(' name="FRVERIFY" id="FRVERIFY">');
        OutWeb_('</td></tr>');
        OutWeb_('<tr><td class="left">Home Improvement:</td><td class="right"-
       >');
        OutWeb_('<input type="checkbox" value="Y" ');
        if (vhomeimp = 'Y');
         OutWeb_('checked');
        endif;
        OutWeb_(' name="VHOMEIMP" id="VHOMEIMP">');
        OutWeb_('</td></tr>');
        OutWeb_('<tr><td class="left">Rebates:</td><td class="right">');
        OutWeb_('<input type="checkbox" value="Y" ');
        if (vrebate = 'Y');
         OutWeb_('checked');
        endif;
        OutWeb_(' name="VREBATE" id="VREBATE">');
        OutWeb_('</td></tr>');
       endif;
       if (fundflag = 'Y');
        OutWeb_('<tr><td class="left">Do Not Fund:</td><td class="right">');
        donotfundbox0();
        OutWeb_('</td></tr>');
        OutWeb_('<tr id="FUNDNOTErow" ');
        if (((donotfund = 'N') or (donotfund = '')));
         OutWeb_(' style="display:none" ');
        endif;
        OutWeb_('><td class="left">Do Not Fund Note:<br><span id="FUNDNOTEcou-
       nt">0 / 80</span></td><td class="right"><textarea id="FUNDNOTE" name="-
       FUNDNOTE"');
        OutWeb_(%trimr( ' onkeyup="updateCounter(''FUNDNOTE'');" rows="5" >' +
        %trim(fundnote) + '</textarea></td></tr>'));
       endif;
       if (email_status = 'Y');
        OutWeb_('<tr><td class="left">Email Status Changes:</td><td class="ri-
       ght">');
        emailstatusbox0();
        OutWeb_('</td></tr>');
       endif;
       outweb_(%subst(%str(%addr(H__6(74))):4:223));
       wfrtn__ = AfToPage_(DISABLED);
       outweb_(%subst(%str(%addr(H__6(76))):67:8));
       AfToPage_(%trim(%editc(RISKPER:'4')));
       outweb_(%subst(%str(%addr(H__6(76))):75:294));
       wfrtn__ = AfToPage_(DISABLED);
       outweb_(%subst(%str(%addr(H__6(80))):49:8));
       AfToPage_(%trim(%editc(WPROCD:'4')));
       outweb_(%subst(%str(%addr(H__6(80))):57:224));
       permitaddonbox0();
       outweb_(%subst(%str(%addr(H__6(83))):41:159));
       categorybox0();
       outweb_(%subst(%str(%addr(H__6(85))):40:211));
       wfrtn__ = AfToPage_(DISABLED);
       outweb_(%subst(%str(%addr(H__6(88))):11:8));
       wfrtn__ = AfToPage_(PDNAM1);
       outweb_(%subst(%str(%addr(H__6(88))):19:217));
       wfrtn__ = AfToPage_(DISABLED);
       outweb_(%subst(%str(%addr(H__6(90))):76:8));
       wfrtn__ = AfToPage_(PDNAM2);
       outweb_(%subst(%str(%addr(H__6(91))):4:177));
       leadsrcbox0();
       outweb_(%subst(%str(%addr(H__6(93))):21:152));
       salesrepbox0();
       outweb_(%subst(%str(%addr(H__6(95))):13:52));
       OutWeb_('<tr>');
       OutWeb_('<td class="left">Commission Percentage:</td>');
       OutWeb_('<td class="right">');
       OutWeb_(%trimr( '<input type="text" name="COMMPCT" id="COMMPCT" maxlen-
       gth="14" class="numeric" value="' + %editc(commpct:'N') + '">'));
       OutWeb_('</td>');
       OutWeb_('</tr>');
       outweb_(%subst(%str(%addr(H__6(95))):65:123));
       hobox0();
       outweb_(%subst(%str(%addr(H__6(97))):28:201));
       wfrtn__ = AfToPage_(DISABLED);
       outweb_(%subst(%str(%addr(H__6(99))):69:8));
       wfrtn__ = AfToPage_(DBA);
       outweb_(%subst(%str(%addr(H__6(99))):77:218));
       wfrtn__ = AfToPage_(DISABLED);
       outweb_(%subst(%str(%addr(H__6(102))):55:8));
       wfrtn__ = AfToPage_(PDEMAIL);
       outweb_(%subst(%str(%addr(H__6(102))):63:188));
       appdecpbox0();
       outweb_(%subst(%str(%addr(H__6(105))):11:218));
       wfrtn__ = AfToPage_(DISABLED);
       outweb_(%subst(%str(%addr(H__6(107))):69:8));
       wfrtn__ = AfToPage_(PDEMAIL2);
       outweb_(%subst(%str(%addr(H__6(107))):77:190));
       appdecsbox0();
       outweb_(%subst(%str(%addr(H__6(110))):27:215));
       wfrtn__ = AfToPage_(DISABLED);
       outweb_(%subst(%str(%addr(H__6(113))):2:8));
       wfrtn__ = AfToPage_(SIGNEMAIL);
       outweb_(%subst(%str(%addr(H__6(113))):10:75));
       if ((((client = '108')) or ((client = '908'))));
        OutWeb_('<tr><td class=''left''>Funding Report Email1:</td>');
        OutWeb_('<td class=''right''><input id=''1PDDCHAR'' type=''text'' nam-
       e=''1PDDCHAR'' size=''30'' maxlength=''80'' value=''');
        OutWeb_(%trimr( %trim(email1)));
        OutWeb_('''></td></tr>');
        OutWeb_('<tr><td class=''left''>Funding Report Email2:</td>');
        OutWeb_('<td class=''right''><input id=''2PDDCHAR'' type=''text'' nam-
       e=''2PDDCHAR'' size=''30'' maxlength=''80'' value=''');
        OutWeb_(%trimr( %trim(email2)));
        OutWeb_('''></td></tr>');
        OutWeb_('<tr><td class=''left''>Funding Report Email3:</td>');
        OutWeb_('<td class=''right''><input id=''3PDDCHAR'' type=''text'' nam-
       e=''3PDDCHAR'' size=''30'' maxlength=''80'' value=''');
        OutWeb_(%trimr( %trim(email3)));
        OutWeb_('''></td></tr>');
        OutWeb_('<tr><td class=''left''>Funding Report Email4:</td>');
        OutWeb_('<td class=''right''><input id=''4PDDCHAR'' type=''text'' nam-
       e=''4PDDCHAR'' size=''30'' maxlength=''80'' value=''');
        OutWeb_(%trimr( %trim(email4)));
        OutWeb_('''></td></tr>');
        OutWeb_('<tr><td class=''left''>Funding Report Email5:</td>');
        OutWeb_('<td class=''right''><input id=''5PDDCHAR'' type=''text'' nam-
       e=''5PDDCHAR'' size=''30'' maxlength=''80'' value=''');
        OutWeb_(%trimr( %trim(email5)));
        OutWeb_('''></td></tr>');
       endif;
       outweb_(%subst(%str(%addr(H__6(114))):5:162));
       docbefappbox0();
       outweb_(%subst(%str(%addr(H__6(116))):7:158));
       stipgrpbox0();
       outweb_(%subst(%str(%addr(H__6(118))):5:94));
       if (((client = '116') or (client = '110')));
        OutWeb_('<tr>');
        OutWeb_('<td class="left">Allow Office Selection?</td>');
        OutWeb_('<td class="right">');
        offselyesno0();
        OutWeb_('</td>');
        OutWeb_('</tr>');
       endif;
       if (client = '116');
        OutWeb_('<tr>');
        OutWeb_('<td class="left">Max Loan Amount:</td>');
        OutWeb_('<td class="right">');
        OutWeb_(%trimr( '<input type="text" name="MAXLNAMT" id="MAXLNAMT" max-
       length="14" class="numeric" value="' + %trim(%editc(maxlnamt:'P')) + '-
       ">'));
        OutWeb_('</td>');
        OutWeb_('</tr>');
        OutWeb_('<tr>');
        OutWeb_('<td class="left">Max Loan Term:</td>');
        OutWeb_('<td class="right">');
        OutWeb_(%trimr( '<input type="text" name="MAXLNTERM" id="MAXLNTERM" c-
       lass="numeric" maxlength="5" value="' + %trim(%editc(maxlnterm:'P'))
       + '">'));
        OutWeb_('</td>');
        OutWeb_('</tr>');
       endif;
       OutWeb_('<tr>');
       OutWeb_('<td class="left">Discount Percentage:</td>');
       OutWeb_('<td class="right">');
       OutWeb_(%trimr( '<input type="text" name="DISCPCT" id="DISCPCT" maxlen-
       gth="14" class="numeric" value="' + %editc(discpct:'N') + '">'));
       OutWeb_('</td>');
       OutWeb_('</tr>');
       OutWeb_('<tr>');
       OutWeb_('<td class="left">Early Payoff Discount Pct:</td>');
       OutWeb_('<td class="right">');
       OutWeb_(%trimr( '<input type="text" name="EPDPCT" id="EPDPCT" maxlengt-
       h="14" class="numeric" value="' + %trim(%editc(epdpct:'P')) + '">'));
       OutWeb_('</td>');
       OutWeb_('</tr>');
       OutWeb_('<tr><td class="left">Dealer Rewards?</td><td class="right">');
       ficoynbox0();
       OutWeb_('</td></tr>');
       OutWeb_('<tr><td class="left">Dealer Reward FICO Score</td><td class="-
       right">');
       ficoscorebox0();
       OutWeb_('</td></tr>');
       OutWeb_('<tr><td class="left">Dealer Reward Fee</td><td class="right">-
       ');
       emplpctbox0();
       OutWeb_('</td></tr>');
       outweb_(%subst(%str(%addr(H__6(119))):19:22));
       if ((((client = '108')) or ((client = '908'))));
        OutWeb_('<tr><td class="left">Authorize Debit Cards?</td><td class="r-
       ight">');
        usaepayathbox0();
        OutWeb_('</td></tr>');
       endif;
       outweb_(%subst(%str(%addr(H__6(119))):41:127));
       dlrdbtbox0();
       outweb_(%subst(%str(%addr(H__6(121))):8:169));
       pinbox0();
       outweb_(%subst(%str(%addr(H__6(123))):17:169));
       cvvbox0();
       outweb_(%subst(%str(%addr(H__6(125))):26:174));
       avsbox0();
       outweb_(%subst(%str(%addr(H__6(127))):40:170));
       pinsbox0();
       outweb_(%subst(%str(%addr(H__6(129))):50:190));
       ibvbox0();
       outweb_(%subst(%str(%addr(H__6(131))):80:191));
       ibvwbox0();
       outweb_(%subst(%str(%addr(H__6(134))):31:180));
       ibvsbox0();
       outweb_(%subst(%str(%addr(H__6(136))):51:191));
       walletbox0();
       outweb_(%subst(%str(%addr(H__6(139))):2:216));
       walletwbox0();
       outweb_(%subst(%str(%addr(H__6(141))):58:157));
       dlrrepbox0();
       outweb_(%subst(%str(%addr(H__6(143))):55:233));
       wfrtn__ = AfToPage_(DISABLED);
       outweb_(%subst(%str(%addr(H__6(146))):48:8));
       AfToPage_(%trim(%editc(DOWNPMT:'4')));
       outweb_(%subst(%str(%addr(H__6(146))):56:205));
       dpoptbox0();
       outweb_(%subst(%str(%addr(H__6(149))):21:190));
       downpctbox0();
       outweb_(%subst(%str(%addr(H__6(151))):51:171));
       proc_ov_box0();
       outweb_(%subst(%str(%addr(H__6(153))):62:299));
       wfrtn__ = AfToPage_(DISABLED);
       outweb_(%subst(%str(%addr(H__6(157))):41:8));
       wfrtn__ = AfToPage_(%trim(%editw(PDPHON:'   -   -    ')));
       outweb_(%subst(%str(%addr(H__6(157))):49:306));
       wfrtn__ = AfToPage_(DISABLED);
       outweb_(%subst(%str(%addr(H__6(161))):35:8));
       wfrtn__ = AfToPage_(%trim(%editw(PDFAX:'   -   -    ')));
       outweb_(%subst(%str(%addr(H__6(161))):43:310));
       wfrtn__ = AfToPage_(DISABLED);
       outweb_(%subst(%str(%addr(H__6(165))):33:8));
       wfrtn__ = AfToPage_(%trim(%editw(PDPHON1:'   -   -    ')));
       outweb_(%subst(%str(%addr(H__6(165))):41:176));
       credbox0();
       outweb_(%subst(%str(%addr(H__6(167))):57:307));
       wfrtn__ = AfToPage_(DISABLED);
       outweb_(%subst(%str(%addr(H__6(171))):44:8));
       wfrtn__ = AfToPage_(%trim(%editw(PDTIN:'  -       ')));
       outweb_(%subst(%str(%addr(H__6(171))):52:154));
       locbox0();
       outweb_(%subst(%str(%addr(H__6(173))):46:215));
       wfrtn__ = AfToPage_(DISABLED);
       outweb_(%subst(%str(%addr(H__6(176))):21:8));
       wfrtn__ = AfToPage_(PDADR1);
       outweb_(%subst(%str(%addr(H__6(176))):29:227));
       wfrtn__ = AfToPage_(DISABLED);
       outweb_(%subst(%str(%addr(H__6(179))):16:8));
       wfrtn__ = AfToPage_(PDADR2);
       outweb_(%subst(%str(%addr(H__6(179))):24:207));
       wfrtn__ = AfToPage_(DISABLED);
       outweb_(%subst(%str(%addr(H__6(181))):71:8));
       wfrtn__ = AfToPage_(PDCITY);
       outweb_(%subst(%str(%addr(H__6(181))):79:150));
       wrtpdstbox0();
       outweb_(%subst(%str(%addr(H__6(183))):69:278));
       wfrtn__ = AfToPage_(DISABLED);
       outweb_(%subst(%str(%addr(H__6(187))):27:8));
       AfToPage_(%trim(%editc(PDZIP:'X')));
       outweb_(%subst(%str(%addr(H__6(187))):35:312));
       wfrtn__ = AfToPage_(DISABLED);
       outweb_(%subst(%str(%addr(H__6(191))):27:8));
       wfrtn__ = AfToPage_(LONGLAT);
       outweb_(%subst(%str(%addr(H__6(191))):35:160));
       wrtprodbox0();
       outweb_(%subst(%str(%addr(H__6(193))):35:161));
       paytypebox0();
       outweb_(%subst(%str(%addr(H__6(195))):36:226));
       wfrtn__ = AfToPage_(DISABLED);
       outweb_(%subst(%str(%addr(H__6(198))):22:8));
       wfrtn__ = AfToPage_(PDGLVEND);
       outweb_(%subst(%str(%addr(H__6(198))):30:227));
       wfrtn__ = AfToPage_(DISABLED);
       outweb_(%subst(%str(%addr(H__6(201))):17:8));
       AfToPage_(%trim(%editc(PDEFTABA:'4')));
       outweb_(%subst(%str(%addr(H__6(201))):25:272));
       wfrtn__ = AfToPage_(DISABLED);
       outweb_(%subst(%str(%addr(H__6(204))):57:8));
       wfrtn__ = AfToPage_(PDEFTACCT);
       outweb_(%subst(%str(%addr(H__6(204))):65:199));
       achtypebox0();
       outweb_(%subst(%str(%addr(H__6(207))):24:197));
       wfrtn__ = AfToPage_(PDUID);
       outweb_(%subst(%str(%addr(H__6(209))):61:248));
       wfrtn__ = AfToPage_(PDUPASS);
       outweb_(%subst(%str(%addr(H__6(212))):69:179));
       manubox0();
       outweb_(%subst(%str(%addr(H__6(215))):8:259));
       wfrtn__ = AfToPage_(DISABLED);
       outweb_(%subst(%str(%addr(H__6(218))):27:8));
       wfrtn__ = AfToPage_(OMANU);
       outweb_(%subst(%str(%addr(H__6(218))):35:161));
       psold1box0();
       outweb_(%subst(%str(%addr(H__6(220))):36:259));
       wfrtn__ = AfToPage_(DISABLED);
       outweb_(%subst(%str(%addr(H__6(223))):55:8));
       wfrtn__ = AfToPage_(OPSOLD1);
       outweb_(%subst(%str(%addr(H__6(223))):63:160));
       psold2box0();
       outweb_(%subst(%str(%addr(H__6(225))):63:259));
       wfrtn__ = AfToPage_(DISABLED);
       outweb_(%subst(%str(%addr(H__6(229))):2:8));
       wfrtn__ = AfToPage_(OPSOLD2);
       outweb_(%subst(%str(%addr(H__6(229))):10:160));
       psold3box0();
       outweb_(%subst(%str(%addr(H__6(231))):10:164));
       decmodbox0();
       outweb_(%subst(%str(%addr(H__6(233))):14:162));
       webmodbox0();
       outweb_(%subst(%str(%addr(H__6(235))):16:343));
       wfrtn__ = AfToPage_(DISABLED);
       outweb_(%subst(%str(%addr(H__6(239))):39:8));
       wfrtn__ = AfToPage_(OPSOLD3);
       outweb_(%subst(%str(%addr(H__6(239))):47:257));
       wfrtn__ = AfToPage_(DISABLED);
       outweb_(%subst(%str(%addr(H__6(242))):64:46));
       wfrtn__ = AfToPage_(DLRNOTE);
       outweb_(%subst(%str(%addr(H__6(243))):30:250));
       wfrtn__ = AfToPage_(DISABLED);
       outweb_(%subst(%str(%addr(H__6(246))):40:47));
       wfrtn__ = AfToPage_(DLRNOTE2);
       outweb_(%subst(%str(%addr(H__6(247))):7:250));
       wfrtn__ = AfToPage_(DISABLED);
       outweb_(%subst(%str(%addr(H__6(250))):17:47));
       wfrtn__ = AfToPage_(DLRNOTE3);
       outweb_(%subst(%str(%addr(H__6(250))):64:250));
       wfrtn__ = AfToPage_(DISABLED);
       outweb_(%subst(%str(%addr(H__6(253))):74:47));
       wfrtn__ = AfToPage_(DLRNOTE4);
       outweb_(%subst(%str(%addr(H__6(254))):41:589));
       wfrtn__ = AfToPage_(DISABLED);
       outweb_(%subst(%str(%addr(H__6(261))):70:47));
       wfrtn__ = AfToPage_(DLRNOTE5);
       outweb_(%subst(%str(%addr(H__6(262))):37:255));
       wfrtn__ = AfToPage_(DISABLED);
       outweb_(%subst(%str(%addr(H__6(265))):52:47));
       wfrtn__ = AfToPage_(DLRNOTE6);
       outweb_(%subst(%str(%addr(H__6(266))):19:167));
       new_app_box0();
       outweb_(%subst(%str(%addr(H__6(268))):26:176));
       new_sapp_box0();
       outweb_(%subst(%str(%addr(H__6(270))):42:158));
       new_ll_box0();
       outweb_(%subst(%str(%addr(H__6(272))):40:160));
       new_ibvr_box0();
       outweb_(%subst(%str(%addr(H__6(274))):40:237));
       wfrtn__ = AfToPage_(APITOKEN);
       outweb_(%subst(%str(%addr(H__6(277))):37:169));
       tierbox0();
       outweb_(%subst(%str(%addr(H__6(279))):46:234));
       wfrtn__ = AfToPage_(DISABLED);
       outweb_(%subst(%str(%addr(H__6(282))):40:8));
       AfToPage_(%trim(%editc(INCENT_AVERAGE:'3')));
       outweb_(%subst(%str(%addr(H__6(282))):48:294));
       wfrtn__ = AfToPage_(DISABLED);
       outweb_(%subst(%str(%addr(H__6(286))):22:24));
       AfToPage_(%trim(%editc(INCENT_DISC:'N')));
       outweb_(%subst(%str(%addr(H__6(286))):46:242));
       wfrtn__ = AfToPage_(DISABLED);
       outweb_(%subst(%str(%addr(H__6(289))):48:8));
       AfToPage_(%trim(%editc(NEW_DAYS:'3')));
       outweb_(%subst(%str(%addr(H__6(289))):56:291));
       wfrtn__ = AfToPage_(DISABLED);
       outweb_(%subst(%str(%addr(H__6(293))):27:24));
       AfToPage_(%trim(%editc(NEW_DISCOUNT:'N')));
       outweb_(%subst(%str(%addr(H__6(293))):51:242));
       wfrtn__ = AfToPage_(%char(EMPL_DATE: *USA));
       outweb_(%subst(%str(%addr(H__6(296))):53:221));
       wfrtn__ = AfToPage_(DISABLED);
       outweb_(%subst(%str(%addr(H__6(299))):34:8));
       AfToPage_(%trim(%editc(EMPL_DAYS:'3')));
       outweb_(%subst(%str(%addr(H__6(299))):42:284));
       wfrtn__ = AfToPage_(DISABLED);
       outweb_(%subst(%str(%addr(H__6(303))):6:8));
       AfToPage_(%trim(%editc(EMPL_AMOUNT:'3')));
       outweb_(%subst(%str(%addr(H__6(303))):14:205));
       bankstipbox0();
       outweb_(%subst(%str(%addr(H__6(305))):59:172));
       dlrsignbox0();
       outweb_(%subst(%str(%addr(H__6(307))):71:185));
       textappbox0();
       outweb_(%subst(%str(%addr(H__6(310))):16:230));
       wfrtn__ = AfToPage_(DISABLED);
       outweb_(%subst(%str(%addr(H__6(313))):6:8));
       AfToPage_(%trim(%editc(SAC_DAYS:'4')));
       outweb_(%subst(%str(%addr(H__6(313))):14:307));
       wfrtn__ = AfToPage_(DISABLED);
       outweb_(%subst(%str(%addr(H__6(317))):1:8));
       AfToPage_(%trim(%editc(MOVOLUME:'4')));
       outweb_(%subst(%str(%addr(H__6(317))):9:232));
       dispcollbox0();
       outweb_(%subst(%str(%addr(H__6(320))):1:182));
       deldatebox0();
       outweb_(%subst(%str(%addr(H__6(322))):23:173));
       approveallbox0();
       outweb_(%subst(%str(%addr(H__6(324))):36:183));
       apprpendbox0();
       outweb_(%subst(%str(%addr(H__6(326))):59:195));
       addrvalidbox0();
       outweb_(%subst(%str(%addr(H__6(329))):14:180));
       pmtcalcbox0();
       outweb_(%subst(%str(%addr(H__6(331))):34:193));
       fundlistbox0();
       outweb_(%subst(%str(%addr(H__6(333))):67:196));
       pfndlistbox0();
       outweb_(%subst(%str(%addr(H__6(336))):23:192));
       ltodepbox0();
       outweb_(%subst(%str(%addr(H__6(338))):55:195));
       ldwoptbox0();
       outweb_(%subst(%str(%addr(H__6(341))):10:206));
       adddownbox0();
       outweb_(%subst(%str(%addr(H__6(343))):56:199));
       warrantybox0();
       outweb_(%subst(%str(%addr(H__6(346))):15:188));
       deliverybox0();
       outweb_(%subst(%str(%addr(H__6(348))):43:181));
       nocreditbox0();
       outweb_(%subst(%str(%addr(H__6(350))):64:187));
       abasearchbox0();
       outweb_(%subst(%str(%addr(H__6(353))):11:208));
       dsignbox0();
       outweb_(%subst(%str(%addr(H__6(355))):59:180));
       ppcardbox0();
       outweb_(%subst(%str(%addr(H__6(357))):79:180));
       ppibvbox0();
       outweb_(%subst(%str(%addr(H__6(360))):19:197));
       bankstmtibvbox0();
       outweb_(%subst(%str(%addr(H__6(362))):56:216));
       appdaysbox0();
       outweb_(%subst(%str(%addr(H__6(365))):32:218));
       storisfastbox0();
       outweb_(%subst(%str(%addr(H__6(368))):10:208));
       fundpartbox0();
       outweb_(%subst(%str(%addr(H__6(370))):58:244));
       select;
       when (client = '103');
       wrtstateofbus0();
       when (client = '104');
       wrtstateofbus0();
       other;
       endsl;
       outweb_(%subst(%str(%addr(H__6(373))):62:188));
       select;
       when (client = '103');
       wrtloantypes0();
       when (client = '104');
       wrtloantypes0();
       when (client = '109');
       wrtloantypes0();
       other;
       endsl;
       outweb_(%subst(%str(%addr(H__6(376))):10:165));
       AfToPage_(%trim(%editc(RRN:'X')));
       outweb_(%subst(%str(%addr(H__6(378))):15:471));
       wfrtn__ = AfToPage_(CLIENT);
       outweb_(%subst(%str(%addr(H__6(384))):6:15));
       wfrtn__ = AfToPage_(CLIENT);
       outweb_(%subst(%str(%addr(H__6(384))):21:4699));
       wfrtn__ = AfToPage_(DLRALTDISP);
       outweb_(%subst(%str(%addr(H__6(442))):80:295));

      /end-free
     c     *PSSR         begsr
     c                   endsr
     P                 E


     P*---------------------------------------------------------------------
     P* endmanage0...               - User defined function
     P*---------------------------------------------------------------------
     P endmanage0...
     P                 B
     D endmanage0...
     D                 PI


     D d_kwpedate      S             10A
     D count           S              2P 0
     D count1          S              2P 0


      /free
       puid = userid;
       AM005_ = CV_BYKEY;
       CHAIN(NE) DL005_ RKWPUBASE;
       RS005_ = RcdSts2_('GETRCD': %error: %found: %eof);
       rtoyesno = getparm3_('RTOYESNO':'*OPT');
       puotype = 'EDITDLR';
       AM011_ = CV_BYKEY;
       CHAIN(NE) DL011_ RKWPUOPT;
       RS011_ = RcdSts2_('GETRCD': %error: %found: %eof);
       if ((((RS011_ = '1')) and ((puoyesno = 'N'))));
        Redirect2_( %trim(pgm_lnlist) + '?rrn=' + savedrrn:'*SAME':'rand');
        return ;
       endif;
       if ((((puprofile <> 'ADMINISTRATOR')) and ((puoyesno <> 'Y'))));
        Redirect2_( %trim(pgm_lnlist) + '?rrn=' + savedrrn:'*SAME':'rand');
        return ;
       endif;
       pdno = getparm3_('pdno':'*OPT');
       mode = getparm3_('mode':'*OPT');
       SETLL  dealerlink RKWPDDATA;
       RS008_ = RcdSts2_('POSRCD':%error:%equal:%eof);
       READE(E) dealerlink RKWPDDATA;
       RS008_ = RcdSts2_('GETNXTRCD':%error:%found:%eof);
       AM008_ = CV_ByKey;
       dow (RS008_ = '1');
       if (((pddtype = 'CUSTOMER') or (pddcode = 'BBIBVDLR')));
       else;
      /end-free
     C                   EVAL      RS008_ = DeleteRcd_('RKWPDDATA')
      /free
       endif;
       READE(E) dealerlink RKWPDDATA;
       RS008_ = RcdSts2_('GETNXTRCD':%error:%found:%eof);
       AM008_ = CV_ByKey;
       enddo;
       c = 1;
       dow (c <= 63);
       states(c) = getnxtparm3_('STATE':'*OPT');
       if (states(c) = '');
        leave;
       endif;
       dividepos = scanstr_('/': states(c): 1);
       dividebef = dividepos - 1;
       divideaft = dividepos + 1;
       code = %subst(states(c):1:dividebef);
       desc = %subst(states(c):divideaft:40);
       pddtype = 'STATE';
       pddcode = code;
       pddchar = desc;
       WRITE RKWPDDATA;
       RS008_ = RcdSts2_('WRTRCD': %error: %found: %eof);
       c = c + 1;
       enddo;
       c = 1;
       dow (c <= 20);
       products(c) = getnxtparm3_('LNPROD':'*OPT');
       if (products(c) = '');
        leave;
       endif;
       dividepos = scanstr_('/': products(c): 1);
       dividebef = dividepos - 1;
       divideaft = dividepos + 1;
       code = %subst(products(c):1:dividebef);
       desc = %subst(products(c):divideaft:40);
       pddtype = 'LNPROD';
       pddcode = code;
       pddchar = desc;
       WRITE RKWPDDATA;
       RS008_ = RcdSts2_('WRTRCD': %error: %found: %eof);
       c = c + 1;
       enddo;
       c = 1;
       dow (c <= 3);
       pddtype = 'PRODSOLD' + %trim(%editc(c:'P'));
       pddcode = getparm3_( 'PRODSOLD' + %trim(%editc(c:'P')):'*OPT');
       if (pddcode <> '');
        dividepos = scanstr_('/': pddcode: 1);
        dividebef = dividepos - 1;
        divideaft = dividepos + 1;
        fldlength = 25 - divideaft;
        code = %subst(pddcode:1:dividebef);
        desc = %subst(pddcode:divideaft:fldlength);
        pddcode = code;
        pddchar = desc;
        WRITE RKWPDDATA;
        RS008_ = RcdSts2_('WRTRCD': %error: %found: %eof);
       endif;
       c = c + 1;
       enddo;
       pddtype = 'SALESREP';
       pddcode = getparm3_('SALESREP':'*OPT');
       if (pddcode <> '');
        dividepos = scanstr_('/': pddcode: 1);
        dividebef = dividepos - 1;
        divideaft = dividepos + 1;
        fldlength = 25 - divideaft;
        code = %subst(pddcode:1:dividebef);
        desc = %subst(pddcode:divideaft:fldlength);
        pddcode = code;
        pddchar = desc;
        WRITE RKWPDDATA;
        RS008_ = RcdSts2_('WRTRCD': %error: %found: %eof);
       endif;
       pddtype = 'LEADSRC';
       pddcode = getparm3_('LEADSRC':'*OPT');
       if (pddcode <> '');
        dividepos = scanstr_('/': pddcode: 1);
        dividebef = dividepos - 1;
        divideaft = dividepos + 1;
        fldlength = 25 - divideaft;
        code = %subst(pddcode:1:dividebef);
        desc = %subst(pddcode:divideaft:fldlength);
        pddcode = code;
        pddchar = desc;
        WRITE RKWPDDATA;
        RS008_ = RcdSts2_('WRTRCD': %error: %found: %eof);
       endif;
       pddtype = 'HOMEOFFICE';
       pddcode = getparm3_('HOMEOFFICE':'*OPT');
       if (pddcode <> '');
        dividepos = scanstr_('/': pddcode: 1);
        dividebef = dividepos - 1;
        divideaft = dividepos + 1;
        fldlength = 25 - divideaft;
        code = %subst(pddcode:1:dividebef);
        desc = %subst(pddcode:divideaft:fldlength);
        pddcode = code;
        pddchar = desc;
        WRITE RKWPDDATA;
        RS008_ = RcdSts2_('WRTRCD': %error: %found: %eof);
       endif;
       pddtype = 'APPDECP';
       pddcode = getparm3_('APPDECP':'*OPT');
       if (pddcode <> '');
        WRITE RKWPDDATA;
        RS008_ = RcdSts2_('WRTRCD': %error: %found: %eof);
       endif;
       pddtype = 'REPODLR';
       pddcode = getparm3_('REPODLR':'*OPT');
       if (pddcode <> '');
        WRITE RKWPDDATA;
        RS008_ = RcdSts2_('WRTRCD': %error: %found: %eof);
       endif;
       pddtype = 'APPDECS';
       pddcode = getparm3_('APPDECS':'*OPT');
       if (pddcode <> '');
        WRITE RKWPDDATA;
        RS008_ = RcdSts2_('WRTRCD': %error: %found: %eof);
       endif;
       pddtype = 'DOCBEFAPP';
       pddcode = getparm3_('DOCBEFAPP':'*OPT');
       if (pddcode <> '');
        dividepos = scanstr_('/': pddcode: 1);
        dividebef = dividepos - 1;
        divideaft = dividepos + 1;
        fldlength = 25 - divideaft;
        code = %subst(pddcode:1:dividebef);
        desc = %subst(pddcode:divideaft:fldlength);
        pddcode = code;
        pddchar = desc;
        WRITE RKWPDDATA;
        RS008_ = RcdSts2_('WRTRCD': %error: %found: %eof);
       endif;
       pddtype = 'PERMITADDON';
       pddcode = getparm3_('PERMITADDON':'*OPT');
       if (pddcode <> '');
        dividepos = scanstr_('/': pddcode: 1);
        dividebef = dividepos - 1;
        divideaft = dividepos + 1;
        fldlength = 25 - divideaft;
        code = %subst(pddcode:1:dividebef);
        desc = %subst(pddcode:divideaft:fldlength);
        pddcode = code;
        pddchar = desc;
        WRITE RKWPDDATA;
        RS008_ = RcdSts2_('WRTRCD': %error: %found: %eof);
       endif;
       if (client = '105');
        pddtype = 'RISKBP';
        pddcode = getparm3_('RISKBP':'*OPT');
        if (pddcode <> '');
         dividepos = scanstr_('/': pddcode: 1);
         dividebef = dividepos - 1;
         divideaft = dividepos + 1;
         fldlength = 25 - divideaft;
         code = %subst(pddcode:1:dividebef);
         desc = %subst(pddcode:divideaft:fldlength);
         pddcode = code;
         pddchar = desc;
         WRITE RKWPDDATA;
         RS008_ = RcdSts2_('WRTRCD': %error: %found: %eof);
        endif;
        pddtype = 'NOCDOC';
        pddcode = getparm3_('NOCDOC':'*OPT');
        if (pddcode <> '');
         dividepos = scanstr_('/': pddcode: 1);
         dividebef = dividepos - 1;
         divideaft = dividepos + 1;
         fldlength = 25 - divideaft;
         code = %subst(pddcode:1:dividebef);
         desc = %subst(pddcode:divideaft:fldlength);
         pddcode = code;
         pddchar = desc;
         WRITE RKWPDDATA;
         RS008_ = RcdSts2_('WRTRCD': %error: %found: %eof);
        endif;
       endif;
       if ((((client = '108')) or ((client = '908'))));
        pddtype = 'DLRINPUT';
        pddcode = 'CASHPMT';
        AM008_ = CV_BYKEY;
        CHAIN(E) DL008_ RKWPDDATA;
        RS008_ = RcdSts2_('GETRCD': %error: %found: %eof);
        pddchar = getparm3_('CASHPMT':'*OPT');
        if (RS008_ = '1');
         RS008_ = UpdateRcd_('RKWPDDATA');
        else;
         WRITE RKWPDDATA;
         RS008_ = RcdSts2_('WRTRCD': %error: %found: %eof);
        endif;
        pddtype = 'DLRINPUT';
        pddcode = 'SALESTAX';
        AM008_ = CV_BYKEY;
        CHAIN(E) DL008_ RKWPDDATA;
        RS008_ = RcdSts2_('GETRCD': %error: %found: %eof);
        pddchar = getparm3_('SALESTAX':'*OPT');
        if (RS008_ = '1');
         RS008_ = UpdateRcd_('RKWPDDATA');
        else;
         WRITE RKWPDDATA;
         RS008_ = RcdSts2_('WRTRCD': %error: %found: %eof);
        endif;
        pddtype = 'DLRINPUT';
        pddcode = 'AUTOTAX';
        AM008_ = CV_BYKEY;
        CHAIN(E) DL008_ RKWPDDATA;
        RS008_ = RcdSts2_('GETRCD': %error: %found: %eof);
        pddchar = getparm3_('AUTOTAX':'*OPT');
        if (RS008_ = '1');
         RS008_ = UpdateRcd_('RKWPDDATA');
        else;
         WRITE RKWPDDATA;
         RS008_ = RcdSts2_('WRTRCD': %error: %found: %eof);
        endif;
       endif;
       pddtype = 'DLRINPUT';
       pddcode = 'BANKSTIP';
       AM008_ = CV_BYKEY;
       CHAIN(E) DL008_ RKWPDDATA;
       RS008_ = RcdSts2_('GETRCD': %error: %found: %eof);
       pddchar = getparm3_('BANKSTIP':'*OPT');
       if (RS008_ = '1');
        RS008_ = UpdateRcd_('RKWPDDATA');
       else;
        WRITE RKWPDDATA;
        RS008_ = RcdSts2_('WRTRCD': %error: %found: %eof);
       endif;
       pddtype = 'DLRINPUT';
       pddcode = 'APPROVEALL';
       AM008_ = CV_BYKEY;
       CHAIN(E) DL008_ RKWPDDATA;
       RS008_ = RcdSts2_('GETRCD': %error: %found: %eof);
       pddchar = getparm3_('APPROVEALL':'*OPT');
       if (RS008_ = '1');
        RS008_ = UpdateRcd_('RKWPDDATA');
       else;
        WRITE RKWPDDATA;
        RS008_ = RcdSts2_('WRTRCD': %error: %found: %eof);
       endif;
       pddtype = 'DLRINPUT';
       pddcode = 'NOCREDIT';
       AM008_ = CV_BYKEY;
       CHAIN(E) DL008_ RKWPDDATA;
       RS008_ = RcdSts2_('GETRCD': %error: %found: %eof);
       pddchar = getparm3_('NOCREDIT':'*OPT');
       if (RS008_ = '1');
        RS008_ = UpdateRcd_('RKWPDDATA');
       else;
        WRITE RKWPDDATA;
        RS008_ = RcdSts2_('WRTRCD': %error: %found: %eof);
       endif;
       pddtype = 'DLRINPUT';
       pddcode = 'ABASEARCH';
       AM008_ = CV_BYKEY;
       CHAIN(E) DL008_ RKWPDDATA;
       RS008_ = RcdSts2_('GETRCD': %error: %found: %eof);
       pddchar = getparm3_('ABASEARCH':'*OPT');
       if (RS008_ = '1');
        RS008_ = UpdateRcd_('RKWPDDATA');
       else;
        WRITE RKWPDDATA;
        RS008_ = RcdSts2_('WRTRCD': %error: %found: %eof);
       endif;
       pddtype = 'DLRINPUT';
       pddcode = 'DLRSIGN';
       AM008_ = CV_BYKEY;
       CHAIN(E) DL008_ RKWPDDATA;
       RS008_ = RcdSts2_('GETRCD': %error: %found: %eof);
       pddchar = getparm3_('DLRSIGN':'*OPT');
       if (RS008_ = '1');
        RS008_ = UpdateRcd_('RKWPDDATA');
       else;
        WRITE RKWPDDATA;
        RS008_ = RcdSts2_('WRTRCD': %error: %found: %eof);
       endif;
       if (approvalexp = 'Y');
        pddtype = 'DLRINPUT';
        pddcode = 'APPRDAYS';
        AM008_ = CV_BYKEY;
        CHAIN(E) DL008_ RKWPDDATA;
        RS008_ = RcdSts2_('GETRCD': %error: %found: %eof);
        pddchar = getparm3_('APPRDAYS':'*OPT');
        if (RS008_ = '1');
         RS008_ = UpdateRcd_('RKWPDDATA');
        else;
         WRITE RKWPDDATA;
         RS008_ = RcdSts2_('WRTRCD': %error: %found: %eof);
        endif;
       endif;
       pddtype = 'DLRINPUT';
       pddcode = 'TEXTAPP';
       AM008_ = CV_BYKEY;
       CHAIN(E) DL008_ RKWPDDATA;
       RS008_ = RcdSts2_('GETRCD': %error: %found: %eof);
       pddchar = getparm3_('TEXTAPP':'*OPT');
       if (RS008_ = '1');
        RS008_ = UpdateRcd_('RKWPDDATA');
       else;
        WRITE RKWPDDATA;
        RS008_ = RcdSts2_('WRTRCD': %error: %found: %eof);
       endif;
       pddtype = 'DLRINPUT';
       pddcode = 'DISPCOLL';
       AM008_ = CV_BYKEY;
       CHAIN(E) DL008_ RKWPDDATA;
       RS008_ = RcdSts2_('GETRCD': %error: %found: %eof);
       pddchar = getparm3_('DISPCOLL':'*OPT');
       if (RS008_ = '1');
        RS008_ = UpdateRcd_('RKWPDDATA');
       else;
        WRITE RKWPDDATA;
        RS008_ = RcdSts2_('WRTRCD': %error: %found: %eof);
       endif;
       pddtype = 'DLRINPUT';
       pddcode = 'DELDATE';
       AM008_ = CV_BYKEY;
       CHAIN(E) DL008_ RKWPDDATA;
       RS008_ = RcdSts2_('GETRCD': %error: %found: %eof);
       pddchar = getparm3_('DELDATE':'*OPT');
       if (RS008_ = '1');
        RS008_ = UpdateRcd_('RKWPDDATA');
       else;
        WRITE RKWPDDATA;
        RS008_ = RcdSts2_('WRTRCD': %error: %found: %eof);
       endif;
       pddtype = 'DLRINPUT';
       pddcode = 'PMTCALC';
       AM008_ = CV_BYKEY;
       CHAIN(E) DL008_ RKWPDDATA;
       RS008_ = RcdSts2_('GETRCD': %error: %found: %eof);
       pddchar = getparm3_('PMTCALC':'*OPT');
       if (RS008_ = '1');
        RS008_ = UpdateRcd_('RKWPDDATA');
       else;
        WRITE RKWPDDATA;
        RS008_ = RcdSts2_('WRTRCD': %error: %found: %eof);
       endif;
       pddtype = 'DLRINPUT';
       pddcode = 'FUNDLIST';
       AM008_ = CV_BYKEY;
       CHAIN(E) DL008_ RKWPDDATA;
       RS008_ = RcdSts2_('GETRCD': %error: %found: %eof);
       pddchar = getparm3_('FUNDLIST':'*OPT');
       if (RS008_ = '1');
        RS008_ = UpdateRcd_('RKWPDDATA');
       else;
        WRITE RKWPDDATA;
        RS008_ = RcdSts2_('WRTRCD': %error: %found: %eof);
       endif;
       pddtype = 'DLRINPUT';
       pddcode = 'PARFUND';
       AM008_ = CV_BYKEY;
       CHAIN(E) DL008_ RKWPDDATA;
       RS008_ = RcdSts2_('GETRCD': %error: %found: %eof);
       pddchar = getparm3_('PARFUND':'*OPT');
       if (RS008_ = '1');
        RS008_ = UpdateRcd_('RKWPDDATA');
       else;
        WRITE RKWPDDATA;
        RS008_ = RcdSts2_('WRTRCD': %error: %found: %eof);
       endif;
       pddtype = 'DLRINPUT';
       pddcode = 'LTODEP';
       AM008_ = CV_BYKEY;
       CHAIN(E) DL008_ RKWPDDATA;
       RS008_ = RcdSts2_('GETRCD': %error: %found: %eof);
       pddchar = getparm3_('LTODEP':'*OPT');
       if (RS008_ = '1');
        RS008_ = UpdateRcd_('RKWPDDATA');
       else;
        WRITE RKWPDDATA;
        RS008_ = RcdSts2_('WRTRCD': %error: %found: %eof);
       endif;
       pddtype = 'DLRINPUT';
       pddcode = 'LDWOPT';
       AM008_ = CV_BYKEY;
       CHAIN(E) DL008_ RKWPDDATA;
       RS008_ = RcdSts2_('GETRCD': %error: %found: %eof);
       pddchar = getparm3_('LDWOPT':'*OPT');
       if (RS008_ = '1');
        RS008_ = UpdateRcd_('RKWPDDATA');
       else;
        WRITE RKWPDDATA;
        RS008_ = RcdSts2_('WRTRCD': %error: %found: %eof);
       endif;
       pddtype = 'DLRINPUT';
       pddcode = 'ADDDOWN';
       AM008_ = CV_BYKEY;
       CHAIN(E) DL008_ RKWPDDATA;
       RS008_ = RcdSts2_('GETRCD': %error: %found: %eof);
       pddchar = getparm3_('ADDDOWN':'*OPT');
       if (RS008_ = '1');
        RS008_ = UpdateRcd_('RKWPDDATA');
       else;
        WRITE RKWPDDATA;
        RS008_ = RcdSts2_('WRTRCD': %error: %found: %eof);
       endif;
       pddtype = 'DLRINPUT';
       pddcode = 'WARRANTY';
       AM008_ = CV_BYKEY;
       CHAIN(E) DL008_ RKWPDDATA;
       RS008_ = RcdSts2_('GETRCD': %error: %found: %eof);
       pddchar = getparm3_('WARRANTY':'*OPT');
       if (RS008_ = '1');
        RS008_ = UpdateRcd_('RKWPDDATA');
       else;
        WRITE RKWPDDATA;
        RS008_ = RcdSts2_('WRTRCD': %error: %found: %eof);
       endif;
       pddtype = 'DLRINPUT';
       pddcode = 'APPRPEND';
       AM008_ = CV_BYKEY;
       CHAIN(E) DL008_ RKWPDDATA;
       RS008_ = RcdSts2_('GETRCD': %error: %found: %eof);
       pddchar = getparm3_('APPRPEND':'*OPT');
       if (RS008_ = '1');
        RS008_ = UpdateRcd_('RKWPDDATA');
       else;
        WRITE RKWPDDATA;
        RS008_ = RcdSts2_('WRTRCD': %error: %found: %eof);
       endif;
       pddtype = 'DLRINPUT';
       pddcode = 'ADDRVALID';
       AM008_ = CV_BYKEY;
       CHAIN(E) DL008_ RKWPDDATA;
       RS008_ = RcdSts2_('GETRCD': %error: %found: %eof);
       pddchar = getparm3_('ADDRVALID':'*OPT');
       if (RS008_ = '1');
        RS008_ = UpdateRcd_('RKWPDDATA');
       else;
        WRITE RKWPDDATA;
        RS008_ = RcdSts2_('WRTRCD': %error: %found: %eof);
       endif;
       pddtype = 'DLRINPUT';
       pddcode = 'DOCUSIGN';
       AM008_ = CV_BYKEY;
       CHAIN(E) DL008_ RKWPDDATA;
       RS008_ = RcdSts2_('GETRCD': %error: %found: %eof);
       pddchar = getparm3_('DOCUSIGN':'*OPT');
       if (RS008_ = '1');
        RS008_ = UpdateRcd_('RKWPDDATA');
       else;
        WRITE RKWPDDATA;
        RS008_ = RcdSts2_('WRTRCD': %error: %found: %eof);
       endif;
       pddtype = 'DLRINPUT';
       pddcode = 'PPCARD';
       AM008_ = CV_BYKEY;
       CHAIN(E) DL008_ RKWPDDATA;
       RS008_ = RcdSts2_('GETRCD': %error: %found: %eof);
       pddchar = getparm3_('PPCARD':'*OPT');
       if (RS008_ = '1');
        RS008_ = UpdateRcd_('RKWPDDATA');
       else;
        WRITE RKWPDDATA;
        RS008_ = RcdSts2_('WRTRCD': %error: %found: %eof);
       endif;
       pddtype = 'DLRINPUT';
       pddcode = 'PPIBV';
       AM008_ = CV_BYKEY;
       CHAIN(E) DL008_ RKWPDDATA;
       RS008_ = RcdSts2_('GETRCD': %error: %found: %eof);
       pddchar = getparm3_('PPIBV':'*OPT');
       if (RS008_ = '1');
        RS008_ = UpdateRcd_('RKWPDDATA');
       else;
        WRITE RKWPDDATA;
        RS008_ = RcdSts2_('WRTRCD': %error: %found: %eof);
       endif;
       pddtype = 'DLRINPUT';
       pddcode = 'BANKSTMTIBV';
       AM008_ = CV_BYKEY;
       CHAIN(E) DL008_ RKWPDDATA;
       RS008_ = RcdSts2_('GETRCD': %error: %found: %eof);
       pddchar = getparm3_('BANKSTMTIB':'*OPT');
       if (RS008_ = '1');
        RS008_ = UpdateRcd_('RKWPDDATA');
       else;
        WRITE RKWPDDATA;
        RS008_ = RcdSts2_('WRTRCD': %error: %found: %eof);
       endif;
       pddtype = 'DLRINPUT';
       pddcode = 'STORISFAST';
       AM008_ = CV_BYKEY;
       CHAIN(E) DL008_ RKWPDDATA;
       RS008_ = RcdSts2_('GETRCD': %error: %found: %eof);
       pddchar = getparm3_('STORISFAST':'*OPT');
       if (RS008_ = '1');
        RS008_ = UpdateRcd_('RKWPDDATA');
       else;
        WRITE RKWPDDATA;
        RS008_ = RcdSts2_('WRTRCD': %error: %found: %eof);
       endif;
       pddtype = 'DLRINPUT';
       pddcode = 'FUNDPART';
       AM008_ = CV_BYKEY;
       CHAIN(E) DL008_ RKWPDDATA;
       RS008_ = RcdSts2_('GETRCD': %error: %found: %eof);
       pddchar = getparm3_('FUNDPART':'*OPT');
       if (RS008_ = '1');
        RS008_ = UpdateRcd_('RKWPDDATA');
       else;
        WRITE RKWPDDATA;
        RS008_ = RcdSts2_('WRTRCD': %error: %found: %eof);
       endif;
       pddtype = 'DLRINPUT';
       pddcode = 'DELIVERY';
       AM008_ = CV_BYKEY;
       CHAIN(E) DL008_ RKWPDDATA;
       RS008_ = RcdSts2_('GETRCD': %error: %found: %eof);
       pddchar = getparm3_('DELIVERY':'*OPT');
       if (RS008_ = '1');
        RS008_ = UpdateRcd_('RKWPDDATA');
       else;
        WRITE RKWPDDATA;
        RS008_ = RcdSts2_('WRTRCD': %error: %found: %eof);
       endif;
       pddtype = 'DLRINPUT';
       pddcode = 'DOWNPCT';
       AM008_ = CV_BYKEY;
       CHAIN(E) DL008_ RKWPDDATA;
       RS008_ = RcdSts2_('GETRCD': %error: %found: %eof);
       pddchar = getparm3_('DOWNPCT':'*OPT');
       if (RS008_ = '1');
        RS008_ = UpdateRcd_('RKWPDDATA');
       else;
        WRITE RKWPDDATA;
        RS008_ = RcdSts2_('WRTRCD': %error: %found: %eof);
       endif;
      /end-free
     C/Exec SQL
     C+  select KWK_PURL1 into :phploc from KWSURL where KWK_PUTYPE='PHPCLI'
     C/End-Exec
      /free
       usaepayloc = '/www/apachedft/jcf/application/cli/add_missing_locations-
       .php';
       if (client = '104');
        pddtype = 'PDAPPRD';
        pddcode = 'APPRD';
        AM008_ = CV_BYKEY;
        CHAIN(E) DL008_ RKWPDDATA;
        RS008_ = RcdSts2_('GETRCD': %error: %found: %eof);
        pddchar = getparm3_('PDAPPRD':'*OPT');
        if (RS008_ = '1');
         RS008_ = UpdateRcd_('RKWPDDATA');
        else;
         WRITE RKWPDDATA;
         RS008_ = RcdSts2_('WRTRCD': %error: %found: %eof);
        endif;
        pddtype = 'FBF';
        pddcode = getparm3_('FBF':'*OPT');
        if (pddcode <> '');
         dividepos = scanstr_('/': pddcode: 1);
         dividebef = dividepos - 1;
         divideaft = dividepos + 1;
         fldlength = 25 - divideaft;
         code = %subst(pddcode:1:dividebef);
         desc = %subst(pddcode:divideaft:fldlength);
         pddcode = code;
         pddchar = desc;
         WRITE RKWPDDATA;
         RS008_ = RcdSts2_('WRTRCD': %error: %found: %eof);
        endif;
       endif;
       pddtype = 'PAYTYPE';
       pddcode = getparm3_('PAYTYPE':'*OPT');
       if (pddcode <> '');
        dividepos = scanstr_('/': pddcode: 1);
        dividebef = dividepos - 1;
        divideaft = dividepos + 1;
        fldlength = 25 - divideaft;
        code = %subst(pddcode:1:dividebef);
        desc = %subst(pddcode:divideaft:fldlength);
        pddcode = code;
        pddchar = desc;
        WRITE RKWPDDATA;
        RS008_ = RcdSts2_('WRTRCD': %error: %found: %eof);
       endif;
       pddtype = 'DLRSTAT';
       pddcode = getparm3_('DLRSTAT':'*OPT');
       if (pddcode <> '');
        dividepos = scanstr_('/': pddcode: 1);
        dividebef = dividepos - 1;
        divideaft = dividepos + 1;
        fldlength = 25 - divideaft;
        code = %subst(pddcode:1:dividebef);
        desc = %subst(pddcode:divideaft:fldlength);
        pddcode = code;
        pddchar = desc;
        WRITE RKWPDDATA;
        RS008_ = RcdSts2_('WRTRCD': %error: %found: %eof);
       endif;
       pddtype = 'CREDHOW';
       pddcode = getparm3_('CREDHOW':'*OPT');
       if (pddcode <> '');
        dividepos = scanstr_('/': pddcode: 1);
        dividebef = dividepos - 1;
        divideaft = dividepos + 1;
        fldlength = 25 - divideaft;
        code = %subst(pddcode:1:dividebef);
        desc = %subst(pddcode:divideaft:fldlength);
        pddcode = code;
        pddchar = desc;
        WRITE RKWPDDATA;
        RS008_ = RcdSts2_('WRTRCD': %error: %found: %eof);
       endif;
       pddtype = 'MFGNAME';
       pddcode = getparm3_('MFGNAME':'*OPT');
       if (pddcode <> '');
        dividepos = scanstr_('/': pddcode: 1);
        dividebef = dividepos - 1;
        divideaft = dividepos + 1;
        fldlength = 25 - divideaft;
        code = %subst(pddcode:1:dividebef);
        desc = %subst(pddcode:divideaft:fldlength);
        pddcode = code;
        pddchar = desc;
        WRITE RKWPDDATA;
        RS008_ = RcdSts2_('WRTRCD': %error: %found: %eof);
       endif;
       pddtype = 'DLRINPUT';
       pddcode = 'STIPGRP';
       pddchar = getparm3_('STIPGRP':'*OPT');
       WRITE RKWPDDATA;
       RS008_ = RcdSts2_('WRTRCD': %error: %found: %eof);
       if (fundflag = 'Y');
        pddtype = 'DLRINPUT';
        pddcode = 'DONOTFUND';
        pddchar = getparm3_('DONOTFUND':'*OPT');
        WRITE RKWPDDATA;
        RS008_ = RcdSts2_('WRTRCD': %error: %found: %eof);
        pddtype = 'DLRINPUT';
        pddcode = 'FUNDNOTE';
        pddchar = getparm3_('FUNDNOTE':'*OPT');
        WRITE RKWPDDATA;
        RS008_ = RcdSts2_('WRTRCD': %error: %found: %eof);
       endif;
       pddtype = 'DLRINPUT';
       pddcode = 'APITOKEN';
       pddchar = getparm3_('APITOKEN':'*OPT');
       WRITE RKWPDDATA;
       RS008_ = RcdSts2_('WRTRCD': %error: %found: %eof);
       pddtype = 'DLRINPUT';
       pddcode = 'DBA';
       pddchar = getparm3_('DBA':'*OPT');
       WRITE RKWPDDATA;
       RS008_ = RcdSts2_('WRTRCD': %error: %found: %eof);
       pddtype = 'DLRINPUT';
       pddcode = 'DLRDBT';
       pddchar = getparm3_('DLRDBT':'*OPT');
       WRITE RKWPDDATA;
       RS008_ = RcdSts2_('WRTRCD': %error: %found: %eof);
       pddtype = 'DLRINPUT';
       pddcode = 'CATEGORY';
       pddchar = getparm3_('CATEGORY':'*OPT');
       WRITE RKWPDDATA;
       RS008_ = RcdSts2_('WRTRCD': %error: %found: %eof);
       pddtype = 'DLRINPUT';
       pddcode = 'NEWAPP';
       pddchar = getparm3_('NEWAPP':'*OPT');
       WRITE RKWPDDATA;
       RS008_ = RcdSts2_('WRTRCD': %error: %found: %eof);
       pddtype = 'DLRINPUT';
       pddcode = 'EXPIREDAYS';
       pddchar = getparm3_('EXPIREDAYS':'*OPT');
       WRITE RKWPDDATA;
       RS008_ = RcdSts2_('WRTRCD': %error: %found: %eof);
       pddtype = 'DLRINPUT';
       pddcode = 'NEWSUPAPP';
       pddchar = getparm3_('NEWSUPAPP':'*OPT');
       WRITE RKWPDDATA;
       RS008_ = RcdSts2_('WRTRCD': %error: %found: %eof);
       pddtype = 'DLRTYPE';
       pddcode = 'GASCASH';
       pddchar = getparm3_('GASCASH':'*OPT');
       WRITE RKWPDDATA;
       RS008_ = RcdSts2_('WRTRCD': %error: %found: %eof);
       pddtype = 'DLRINPUT';
       pddcode = 'NEWLL';
       pddchar = getparm3_('NEWLL':'*OPT');
       WRITE RKWPDDATA;
       RS008_ = RcdSts2_('WRTRCD': %error: %found: %eof);
       pddtype = 'DLRINPUT';
       pddcode = 'PROCOV';
       pddchar = getparm3_('PROCOV':'*OPT');
       WRITE RKWPDDATA;
       RS008_ = RcdSts2_('WRTRCD': %error: %found: %eof);
       pddtype = 'DLRINPUT';
       pddcode = 'NEWIBVR';
       pddchar = getparm3_('NEWIBVR':'*OPT');
       WRITE RKWPDDATA;
       RS008_ = RcdSts2_('WRTRCD': %error: %found: %eof);
       pddtype = 'DLRINPUT';
       pddcode = 'DLRPIN';
       pddchar = getparm3_('DLRPIN':'*OPT');
       WRITE RKWPDDATA;
       RS008_ = RcdSts2_('WRTRCD': %error: %found: %eof);
       pddtype = 'DLRINPUT';
       pddcode = 'DLRCVV';
       pddchar = getparm3_('DLRCVV':'*OPT');
       WRITE RKWPDDATA;
       RS008_ = RcdSts2_('WRTRCD': %error: %found: %eof);
       pddtype = 'DLRINPUT';
       pddcode = 'AVSCHECK';
       pddchar = getparm3_('AVSCHECK':'*OPT');
       WRITE RKWPDDATA;
       RS008_ = RcdSts2_('WRTRCD': %error: %found: %eof);
       pddtype = 'DLRINPUT';
       pddcode = 'SIGNPIN';
       pddchar = getparm3_('SIGNPIN':'*OPT');
       WRITE RKWPDDATA;
       RS008_ = RcdSts2_('WRTRCD': %error: %found: %eof);
       pddtype = 'DLRINPUT';
       pddcode = 'IBVS';
       pddchar = getparm3_('IBVS':'*OPT');
       WRITE RKWPDDATA;
       RS008_ = RcdSts2_('WRTRCD': %error: %found: %eof);
       pddtype = 'DLRINPUT';
       pddcode = 'DPOPT';
       pddchar = getparm3_('DPOPT':'*OPT');
       WRITE RKWPDDATA;
       RS008_ = RcdSts2_('WRTRCD': %error: %found: %eof);
       pddtype = 'DLRINPUT';
       pddcode = 'WALLET';
       pddchar = getparm3_('WALLET':'*OPT');
       WRITE RKWPDDATA;
       RS008_ = RcdSts2_('WRTRCD': %error: %found: %eof);
       pddtype = 'DLRINPUT';
       pddcode = 'IBVW';
       pddchar = getparm3_('IBVW':'*OPT');
       WRITE RKWPDDATA;
       RS008_ = RcdSts2_('WRTRCD': %error: %found: %eof);
       pddtype = 'DLRINPUT';
       pddcode = 'WALLETW';
       pddchar = getparm3_('WALLETW':'*OPT');
       WRITE RKWPDDATA;
       RS008_ = RcdSts2_('WRTRCD': %error: %found: %eof);
       pddtype = 'DLRINPUT';
       pddcode = 'DLRREP';
       pddchar = getparm3_('DLRREP':'*OPT');
       WRITE RKWPDDATA;
       RS008_ = RcdSts2_('WRTRCD': %error: %found: %eof);
       pddtype = 'DLRINPUT';
       pddcode = 'CREDHOW';
       pddchar = getparm3_('CREDHOW':'*OPT');
       WRITE RKWPDDATA;
       RS008_ = RcdSts2_('WRTRCD': %error: %found: %eof);
       pddtype = 'DLRINPUT';
       pddcode = 'APPDECP';
       pddchar = getparm3_('APPDECP':'*OPT');
       WRITE RKWPDDATA;
       RS008_ = RcdSts2_('WRTRCD': %error: %found: %eof);
       pddtype = 'DLRINPUT';
       pddcode = 'REPODLR';
       pddchar = getparm3_('REPODLR':'*OPT');
       WRITE RKWPDDATA;
       RS008_ = RcdSts2_('WRTRCD': %error: %found: %eof);
       pddtype = 'DLRINPUT';
       pddcode = 'PDEMAIL2';
       pddchar = getparm3_('PDEMAIL2':'*OPT');
       WRITE RKWPDDATA;
       RS008_ = RcdSts2_('WRTRCD': %error: %found: %eof);
       pddtype = 'DLRINPUT';
       pddcode = 'LONGLAT';
       pddchar = getparm3_('LONGLAT':'*OPT');
       WRITE RKWPDDATA;
       RS008_ = RcdSts2_('WRTRCD': %error: %found: %eof);
       pddtype = 'DLRINPUT';
       pddcode = 'APPDECS';
       pddchar = getparm3_('APPDECS':'*OPT');
       WRITE RKWPDDATA;
       RS008_ = RcdSts2_('WRTRCD': %error: %found: %eof);
       pddtype = 'DLRINPUT';
       pddcode = 'DOCBEFAPP';
       pddchar = getparm3_('DOCBEFAPP':'*OPT');
       WRITE RKWPDDATA;
       RS008_ = RcdSts2_('WRTRCD': %error: %found: %eof);
       pddtype = 'DLRINPUT';
       pddcode = 'PERMITADDON';
       pddchar = getparm3_('PERMITADDON':'*OPT');
       WRITE RKWPDDATA;
       RS008_ = RcdSts2_('WRTRCD': %error: %found: %eof);
       pddtype = 'DLRINPUT';
       pddcode = 'OMANU';
       pddchar = getparm3_('OMANU':'*OPT');
       WRITE RKWPDDATA;
       RS008_ = RcdSts2_('WRTRCD': %error: %found: %eof);
       pddtype = 'DLRINPUT';
       pddcode = 'OPSOLD1';
       pddchar = getparm3_('OPSOLD1':'*OPT');
       WRITE RKWPDDATA;
       RS008_ = RcdSts2_('WRTRCD': %error: %found: %eof);
       pddtype = 'DLRINPUT';
       pddcode = 'OPSOLD2';
       pddchar = getparm3_('OPSOLD2':'*OPT');
       WRITE RKWPDDATA;
       RS008_ = RcdSts2_('WRTRCD': %error: %found: %eof);
       pddtype = 'DLRINPUT';
       pddcode = 'OPSOLD3';
       pddchar = getparm3_('OPSOLD3':'*OPT');
       WRITE RKWPDDATA;
       RS008_ = RcdSts2_('WRTRCD': %error: %found: %eof);
       pddtype = 'DLRINPUT';
       pddcode = 'DLRNOTE';
       pddchar = getparm3_('DLRNOTE':'*OPT');
       WRITE RKWPDDATA;
       RS008_ = RcdSts2_('WRTRCD': %error: %found: %eof);
       pddtype = 'DLRINPUT';
       pddcode = 'DLRNOTE2';
       pddchar = getparm3_('DLRNOTE2':'*OPT');
       WRITE RKWPDDATA;
       RS008_ = RcdSts2_('WRTRCD': %error: %found: %eof);
       pddtype = 'DLRINPUT';
       pddcode = 'DLRNOTE3';
       pddchar = getparm3_('DLRNOTE3':'*OPT');
       WRITE RKWPDDATA;
       RS008_ = RcdSts2_('WRTRCD': %error: %found: %eof);
       pddtype = 'DLRINPUT';
       pddcode = 'DLRNOTE4';
       pddchar = getparm3_('DLRNOTE4':'*OPT');
       WRITE RKWPDDATA;
       RS008_ = RcdSts2_('WRTRCD': %error: %found: %eof);
       pddtype = 'DLRINPUT';
       pddcode = 'DLRNOTE5';
       pddchar = getparm3_('DLRNOTE5':'*OPT');
       WRITE RKWPDDATA;
       RS008_ = RcdSts2_('WRTRCD': %error: %found: %eof);
       pddtype = 'DLRINPUT';
       pddcode = 'DLRNOTE6';
       pddchar = getparm3_('DLRNOTE6':'*OPT');
       WRITE RKWPDDATA;
       RS008_ = RcdSts2_('WRTRCD': %error: %found: %eof);
       pddtype = 'DLRINPUT';
       pddcode = 'DLRALTYN';
       pddchar = getparm3_('DLRALTYN':'*OPT');
       dlraltdisp = getparm3_('DLRALTYN':'*OPT');
       WRITE RKWPDDATA;
       RS008_ = RcdSts2_('WRTRCD': %error: %found: %eof);
       pddtype = 'DLRINPUT';
       pddcode = 'GLVEND';
       pddchar = getparm3_('PDGLVEND':'*OPT');
       WRITE RKWPDDATA;
       RS008_ = RcdSts2_('WRTRCD': %error: %found: %eof);
       if (client = '105');
        pddtype = 'DLRINPUT';
        pddcode = 'RISKBP';
        pddchar = getparm3_('RISKBP':'*OPT');
        WRITE RKWPDDATA;
        RS008_ = RcdSts2_('WRTRCD': %error: %found: %eof);
        pddtype = 'DLRINPUT';
        pddcode = 'NOCDOC';
        pddchar = getparm3_('NOCDOC':'*OPT');
        WRITE RKWPDDATA;
        RS008_ = RcdSts2_('WRTRCD': %error: %found: %eof);
       endif;
       if (client = '104');
        pddtype = 'DLRINPUT';
        pddcode = 'FBF';
        pddchar = getparm3_('FBF':'*OPT');
        WRITE RKWPDDATA;
        RS008_ = RcdSts2_('WRTRCD': %error: %found: %eof);
       endif;
       if (client = '116');
        pddtype = 'DLRINPUT';
        pddcode = 'SELOFFICE';
        AM008_ = CV_BYKEY;
        CHAIN(E) DL008_ RKWPDDATA;
        RS008_ = RcdSts2_('GETRCD': %error: %found: %eof);
        pddchar = getparm3_('SELOFFICE':'*OPT');
        if (RS008_ = '1');
         RS008_ = UpdateRcd_('RKWPDDATA');
        else;
         WRITE RKWPDDATA;
         RS008_ = RcdSts2_('WRTRCD': %error: %found: %eof);
        endif;
        pddtype = 'DLRINPUT';
        pddcode = 'MAXLNTERM';
        AM008_ = CV_BYKEY;
        CHAIN(E) DL008_ RKWPDDATA;
        RS008_ = RcdSts2_('GETRCD': %error: %found: %eof);
        pddchar = getparm3_('MAXLNTERM':'*OPT');
        if (RS008_ = '1');
         RS008_ = UpdateRcd_('RKWPDDATA');
        else;
         WRITE RKWPDDATA;
         RS008_ = RcdSts2_('WRTRCD': %error: %found: %eof);
        endif;
        pddtype = 'DLRINPUT';
        pddcode = 'MAXLNAMT';
        AM008_ = CV_BYKEY;
        CHAIN(E) DL008_ RKWPDDATA;
        RS008_ = RcdSts2_('GETRCD': %error: %found: %eof);
        pddchar = getparm3_('MAXLNAMT':'*OPT');
        if (RS008_ = '1');
         RS008_ = UpdateRcd_('RKWPDDATA');
        else;
         WRITE RKWPDDATA;
         RS008_ = RcdSts2_('WRTRCD': %error: %found: %eof);
        endif;
       endif;
       if ((((client = '108')) or ((client = '908'))));
        pddtype = 'DLRINPUT';
        pddcode = 'DISCPCT';
        AM008_ = CV_BYKEY;
        CHAIN(E) DL008_ RKWPDDATA;
        RS008_ = RcdSts2_('GETRCD': %error: %found: %eof);
        pddchar = getparm3_('DISCPCT':'*OPT');
        if (RS008_ = '1');
         RS008_ = UpdateRcd_('RKWPDDATA');
        else;
         WRITE RKWPDDATA;
         RS008_ = RcdSts2_('WRTRCD': %error: %found: %eof);
        endif;
        pddtype = 'DLRINPUT';
        pddcode = 'COMMPCT';
        AM008_ = CV_BYKEY;
        CHAIN(E) DL008_ RKWPDDATA;
        RS008_ = RcdSts2_('GETRCD': %error: %found: %eof);
        pddchar = getparm3_('COMMPCT':'*OPT');
        if (RS008_ = '1');
         RS008_ = UpdateRcd_('RKWPDDATA');
        else;
         WRITE RKWPDDATA;
         RS008_ = RcdSts2_('WRTRCD': %error: %found: %eof);
        endif;
        pddtype = 'DLRINPUT';
        pddcode = 'EPDPCT';
        AM008_ = CV_BYKEY;
        CHAIN(E) DL008_ RKWPDDATA;
        RS008_ = RcdSts2_('GETRCD': %error: %found: %eof);
        pddchar = getparm3_('EPDPCT':'*OPT');
        if (RS008_ = '1');
         RS008_ = UpdateRcd_('RKWPDDATA');
        else;
         WRITE RKWPDDATA;
         RS008_ = RcdSts2_('WRTRCD': %error: %found: %eof);
        endif;
        pddtype = 'DLRINPUT';
        pddcode = 'FICOPCT';
        AM008_ = CV_BYKEY;
        CHAIN(E) DL008_ RKWPDDATA;
        RS008_ = RcdSts2_('GETRCD': %error: %found: %eof);
        pddchar = getparm3_('FICOPCT':'*OPT');
        if (RS008_ = '1');
         RS008_ = UpdateRcd_('RKWPDDATA');
        else;
         WRITE RKWPDDATA;
         RS008_ = RcdSts2_('WRTRCD': %error: %found: %eof);
        endif;
        pddtype = 'DLRINPUT';
        pddcode = 'FICOSCORE';
        AM008_ = CV_BYKEY;
        CHAIN(E) DL008_ RKWPDDATA;
        RS008_ = RcdSts2_('GETRCD': %error: %found: %eof);
        pddchar = getparm3_('FICOSCORE':'*OPT');
        if (RS008_ = '1');
         RS008_ = UpdateRcd_('RKWPDDATA');
        else;
         WRITE RKWPDDATA;
         RS008_ = RcdSts2_('WRTRCD': %error: %found: %eof);
        endif;
        pddtype = 'DLRINPUT';
        pddcode = 'EMPLPCT';
        AM008_ = CV_BYKEY;
        CHAIN(E) DL008_ RKWPDDATA;
        RS008_ = RcdSts2_('GETRCD': %error: %found: %eof);
        pddchar = getparm3_('EMPLPCT':'*OPT');
        if (RS008_ = '1');
         RS008_ = UpdateRcd_('RKWPDDATA');
        else;
         WRITE RKWPDDATA;
         RS008_ = RcdSts2_('WRTRCD': %error: %found: %eof);
        endif;
        pddtype = 'DLRINPUT';
        pddcode = 'FICOYN';
        AM008_ = CV_BYKEY;
        CHAIN(E) DL008_ RKWPDDATA;
        RS008_ = RcdSts2_('GETRCD': %error: %found: %eof);
        pddchar = getparm3_('FICOYN':'*OPT');
        if (RS008_ = '1');
         RS008_ = UpdateRcd_('RKWPDDATA');
        else;
         WRITE RKWPDDATA;
         RS008_ = RcdSts2_('WRTRCD': %error: %found: %eof);
        endif;
        pddtype = 'DLRINPUT';
        pddcode = 'DOWNPMT';
        AM008_ = CV_BYKEY;
        CHAIN(E) DL008_ RKWPDDATA;
        RS008_ = RcdSts2_('GETRCD': %error: %found: %eof);
        pddchar = getparm3_('DOWNPMT':'*OPT');
        if (pddchar <> '');
         downpmt = %dec(aton_(pddchar:46:16):46:16);
         if ((((downpmt <> 0)) and ((rtoyesno = 'Y'))));
          pddchar = '';
          Alert_('Down Payment Changed to .00 for LTO');
         endif;
        endif;
        if (RS008_ = '1');
         RS008_ = UpdateRcd_('RKWPDDATA');
        else;
         WRITE RKWPDDATA;
         RS008_ = RcdSts2_('WRTRCD': %error: %found: %eof);
        endif;
       endif;
       pddtype = 'DLRINPUT';
       pddcode = 'PRTOPROC';
       AM008_ = CV_BYKEY;
       CHAIN(E) DL008_ RKWPDDATA;
       RS008_ = RcdSts2_('GETRCD': %error: %found: %eof);
       pddchar = getparm3_('PRTOPROC':'*OPT');
       if (pddchar <> '');
        downpmt = %dec(aton_(pddchar:46:16):46:16);
        if ((((downpmt <> 0)) and ((rtoyesno <> 'Y'))));
         pddchar = '';
         Alert_('Processing Changed to .00 for Installment');
        endif;
       endif;
       if (RS008_ = '1');
        RS008_ = UpdateRcd_('RKWPDDATA');
       else;
        WRITE RKWPDDATA;
        RS008_ = RcdSts2_('WRTRCD': %error: %found: %eof);
       endif;
       pddtype = 'DLRINPUT';
       pddcode = 'EPOFEE';
       AM008_ = CV_BYKEY;
       CHAIN(E) DL008_ RKWPDDATA;
       RS008_ = RcdSts2_('GETRCD': %error: %found: %eof);
       pddchar = getparm3_('EPOFEE':'*OPT');
       if (RS008_ = '1');
        RS008_ = UpdateRcd_('RKWPDDATA');
       else;
        WRITE RKWPDDATA;
        RS008_ = RcdSts2_('WRTRCD': %error: %found: %eof);
       endif;
       pddtype = 'DLRINPUT';
       pddcode = 'RTOPMT';
       AM008_ = CV_BYKEY;
       CHAIN(E) DL008_ RKWPDDATA;
       RS008_ = RcdSts2_('GETRCD': %error: %found: %eof);
       pddchar = getparm3_('RTOPMT':'*OPT');
       if (RS008_ = '1');
        RS008_ = UpdateRcd_('RKWPDDATA');
       else;
        WRITE RKWPDDATA;
        RS008_ = RcdSts2_('WRTRCD': %error: %found: %eof);
       endif;
       pddtype = 'DLRINPUT';
       pddcode = 'EPOPCT';
       AM008_ = CV_BYKEY;
       CHAIN(E) DL008_ RKWPDDATA;
       RS008_ = RcdSts2_('GETRCD': %error: %found: %eof);
       pddchar = getparm3_('EPOPCT':'*OPT');
       if (RS008_ = '1');
        RS008_ = UpdateRcd_('RKWPDDATA');
       else;
        WRITE RKWPDDATA;
        RS008_ = RcdSts2_('WRTRCD': %error: %found: %eof);
       endif;
       pddtype = 'DLRINPUT';
       pddcode = 'ORGPCT';
       AM008_ = CV_BYKEY;
       CHAIN(E) DL008_ RKWPDDATA;
       RS008_ = RcdSts2_('GETRCD': %error: %found: %eof);
       pddchar = getparm3_('ORGPCT':'*OPT');
       if (RS008_ = '1');
        RS008_ = UpdateRcd_('RKWPDDATA');
       else;
        WRITE RKWPDDATA;
        RS008_ = RcdSts2_('WRTRCD': %error: %found: %eof);
       endif;
       pddtype = 'DLRINPUT';
       pddcode = 'INCENT_AVERAGE';
       AM008_ = CV_BYKEY;
       CHAIN(E) DL008_ RKWPDDATA;
       RS008_ = RcdSts2_('GETRCD': %error: %found: %eof);
       pddchar = getparm3_('INCENT_AVERAGE':'*OPT');
       if (RS008_ = '1');
        RS008_ = UpdateRcd_('RKWPDDATA');
       else;
        WRITE RKWPDDATA;
        RS008_ = RcdSts2_('WRTRCD': %error: %found: %eof);
       endif;
       pddtype = 'DLRINPUT';
       pddcode = 'INCENT_DISC';
       AM008_ = CV_BYKEY;
       CHAIN(E) DL008_ RKWPDDATA;
       RS008_ = RcdSts2_('GETRCD': %error: %found: %eof);
       pddchar = getparm3_('INCENT_DISC':'*OPT');
       if (RS008_ = '1');
        RS008_ = UpdateRcd_('RKWPDDATA');
       else;
        WRITE RKWPDDATA;
        RS008_ = RcdSts2_('WRTRCD': %error: %found: %eof);
       endif;
       pddtype = 'DLRINPUT';
       pddcode = 'NEW_DAYS';
       AM008_ = CV_BYKEY;
       CHAIN(E) DL008_ RKWPDDATA;
       RS008_ = RcdSts2_('GETRCD': %error: %found: %eof);
       pddchar = getparm3_('NEW_DAYS':'*OPT');
       if (RS008_ = '1');
        RS008_ = UpdateRcd_('RKWPDDATA');
       else;
        WRITE RKWPDDATA;
        RS008_ = RcdSts2_('WRTRCD': %error: %found: %eof);
       endif;
       pddtype = 'DLRINPUT';
       pddcode = 'NEW_DISCOUNT';
       AM008_ = CV_BYKEY;
       CHAIN(E) DL008_ RKWPDDATA;
       RS008_ = RcdSts2_('GETRCD': %error: %found: %eof);
       pddchar = getparm3_('NEW_DISCOUNT':'*OPT');
       if (RS008_ = '1');
        RS008_ = UpdateRcd_('RKWPDDATA');
       else;
        WRITE RKWPDDATA;
        RS008_ = RcdSts2_('WRTRCD': %error: %found: %eof);
       endif;
       pddtype = 'DLRINPUT';
       pddcode = 'EMPL_DATE';
       AM008_ = CV_BYKEY;
       CHAIN(E) DL008_ RKWPDDATA;
       RS008_ = RcdSts2_('GETRCD': %error: %found: %eof);
       pddchar = getparm3_('EMPL_DATE':'*OPT');
       inputdate = %subst(pddchar:1:10);
       vlddate10();
       if (datemsg = '');
        pddchar = %char(isodate:*ISO);
       else;
        pddchar = '';
       endif;
       if (RS008_ = '1');
        RS008_ = UpdateRcd_('RKWPDDATA');
       else;
        WRITE RKWPDDATA;
        RS008_ = RcdSts2_('WRTRCD': %error: %found: %eof);
       endif;
       pddtype = 'DLRINPUT';
       pddcode = 'EMPL_DAYS';
       AM008_ = CV_BYKEY;
       CHAIN(E) DL008_ RKWPDDATA;
       RS008_ = RcdSts2_('GETRCD': %error: %found: %eof);
       pddchar = getparm3_('EMPL_DAYS':'*OPT');
       if (RS008_ = '1');
        RS008_ = UpdateRcd_('RKWPDDATA');
       else;
        WRITE RKWPDDATA;
        RS008_ = RcdSts2_('WRTRCD': %error: %found: %eof);
       endif;
       pddtype = 'DLRINPUT';
       pddcode = 'EMPL_AMOUNT';
       AM008_ = CV_BYKEY;
       CHAIN(E) DL008_ RKWPDDATA;
       RS008_ = RcdSts2_('GETRCD': %error: %found: %eof);
       pddchar = getparm3_('EMPL_AMOUNT':'*OPT');
       if (RS008_ = '1');
        RS008_ = UpdateRcd_('RKWPDDATA');
       else;
        WRITE RKWPDDATA;
        RS008_ = RcdSts2_('WRTRCD': %error: %found: %eof);
       endif;
       pddtype = 'DLRINPUT';
       pddcode = 'SAC_DAYS';
       AM008_ = CV_BYKEY;
       CHAIN(E) DL008_ RKWPDDATA;
       RS008_ = RcdSts2_('GETRCD': %error: %found: %eof);
       pddchar = getparm3_('SAC_DAYS':'*OPT');
       if (RS008_ = '1');
        RS008_ = UpdateRcd_('RKWPDDATA');
       else;
        WRITE RKWPDDATA;
        RS008_ = RcdSts2_('WRTRCD': %error: %found: %eof);
       endif;
       pddtype = 'DLRINPUT';
       pddcode = 'MOVOLUME';
       AM008_ = CV_BYKEY;
       CHAIN(E) DL008_ RKWPDDATA;
       RS008_ = RcdSts2_('GETRCD': %error: %found: %eof);
       pddchar = getparm3_('MOVOLUME':'*OPT');
       if (RS008_ = '1');
        RS008_ = UpdateRcd_('RKWPDDATA');
       else;
        WRITE RKWPDDATA;
        RS008_ = RcdSts2_('WRTRCD': %error: %found: %eof);
       endif;
       pddtype = 'DLRINPUT';
       pddcode = 'RATE_TIER';
       AM008_ = CV_BYKEY;
       CHAIN(E) DL008_ RKWPDDATA;
       RS008_ = RcdSts2_('GETRCD': %error: %found: %eof);
       pddchar = getparm3_('RATE_TIER':'*OPT');
       if (RS008_ = '1');
        RS008_ = UpdateRcd_('RKWPDDATA');
       else;
        WRITE RKWPDDATA;
        RS008_ = RcdSts2_('WRTRCD': %error: %found: %eof);
       endif;
       d_kwpedate = getparm3_('d_kwpedate':'*OPT');
       inputdate = d_kwpedate;
       vlddate10();
       if (datemsg = '');
        KWPEDATE = isodate;
       else;
        KWPEDATE = CURISOD__;
       endif;
       pddtype = 'DLRINPUT';
       pddcode = 'PDEDATE';
       AM008_ = CV_BYKEY;
       CHAIN(E) DL008_ RKWPDDATA;
       RS008_ = RcdSts2_('GETRCD': %error: %found: %eof);
       pddchar = %char(KWPEDATE:*ISO);
       if (RS008_ <> '1');
        WRITE RKWPDDATA;
        RS008_ = RcdSts2_('WRTRCD': %error: %found: %eof);
       else;
        RS008_ = UpdateRcd_('RKWPDDATA');
       endif;
       if (mode = 'Add');
        getdealerparms0('KWPDBASE');
        WRITE RWPDBASE;
        RS001_ = RcdSts2_('WRTRCD': %error: %found: %eof);
        getdealerparms0('KWPDLOC');
        PDLOC = 0;
        WRITE RKWPDLOC;
        RS002_ = RcdSts2_('WRTRCD': %error: %found: %eof);
        if ((((client = '108')) or ((client = '908'))));
         pdno = getparm3_('pdno':'*OPT');
         pddtype = 'DLR_EMAIL';
         count = 1;
         dow (count <= 5);
         pddcode = 'E' + %trim(%editc(count:'P'));
         getemails0(count);
         WRITE RKWPDDATA;
         RS008_ = RcdSts2_('WRTRCD': %error: %found: %eof);
         count = count + 1;
         enddo;
        endif;
       endif;
       if (mode = 'Change');
        if ((((client = '108')) or ((client = '908'))));
         count1 = 1;
         pdno = getparm3_('pdno':'*OPT');
         pddtype = 'DLR_EMAIL';
         AM008_ = CV_BYKEY;
         CHAIN(E) eventkey RKWPDDATA;
         RS008_ = RcdSts2_('GETRCD': %error: %found: %eof);
         if (RS008_ = '3');
          SETLL  eventkey RKWPDDATA;
          RS008_ = RcdSts2_('POSRCD':%error:%equal:%eof);
          READE(E) eventkey RKWPDDATA;
          RS008_ = RcdSts2_('GETNXTRCD':%error:%found:%eof);
          AM008_ = CV_ByKey;
          dow (RS008_ = '1');
          getemails0(count1);
          RS008_ = UpdateRcd_('RKWPDDATA');
          count1 = count1 + 1;
          READE(E) eventkey RKWPDDATA;
          RS008_ = RcdSts2_('GETNXTRCD':%error:%found:%eof);
          AM008_ = CV_ByKey;
          enddo;
         else;
          if (RS008_ = '0');
           dow (count1 <= 5);
           pddcode = 'E' + %trim(%editc(count1:'P'));
           getemails0(count1);
           WRITE RKWPDDATA;
           RS008_ = RcdSts2_('WRTRCD': %error: %found: %eof);
           count1 = count1 + 1;
           enddo;
          endif;
         endif;
        endif;
        AM001_ = CV_BYKEY;
        CHAIN(E) dealerlink RWPDBASE;
        RS001_ = RcdSts2_('GETRCD': %error: %found: %eof);
        if (RS001_ = '1');
         getdealerparms0('KWPDBASE');
         RS001_ = UpdateRcd_('RWPDBASE');
        else;
         Alert_('there was an error updating KWPDBASE');
        endif;
        PDLOC = 0;
        AM002_ = CV_BYKEY;
        CHAIN(E) DL002_ RKWPDLOC;
        RS002_ = RcdSts2_('GETRCD': %error: %found: %eof);
        if (RS002_ = '1');
         getdealerparms0('KWPDLOC');
         pddtype = 'CUSTOMER';
         AM008_ = CV_BYKEY;
         CHAIN(NE) codekey RKWPDDATA;
         RS008_ = RcdSts2_('GETRCD': %error: %found: %eof);
         if (RS008_ = '1');
          CCUST = %dec(aton_(pddcode:46:16):9:0);
         endif;
         conttype = 'HOME';
         pruletype = 'SYSTEM';
         prulename = 'CONTACTTYPEEMAIL';
         AM018_ = CV_BYKEY;
         CHAIN(NE) DL018_ RKWPRULE;
         RS018_ = RcdSts2_('GETRCD': %error: %found: %eof);
         if ((((RS018_ = '1')) and ((pruleyesno = 'Y'))));
          conttype = 'EMAIL';
         endif;
         AM013_ = CV_BYKEY;
         CHAIN(E) DL013_ RKWCCONT;
         RS013_ = RcdSts2_('GETRCD': %error: %found: %eof);
         cemail = pdemail;
         if (RS013_ = '1');
          RS013_ = UpdateRcd_('RKWCCONT');
         endif;
         RS002_ = UpdateRcd_('RKWPDLOC');
        else;
         Alert_('there was an error updating KWPDLOC');
        endif;
       endif;
       pdutype = 'DEALER';
       pduid = '';
      /end-free
     C/Exec SQL
     C+  select PDUID into :PDUID from KWPDUSER where PDUDEALER =:PDNO and PDUTY
     C+ PE = :PDUTYPE
     C/End-Exec
      /free
       if (pduid <> '');
        savepdno = pdno;
        pdno = '';
        AM012_ = CV_BYKEY;
        CHAIN(E) DL012_ RKWPDUSER;
        RS012_ = RcdSts2_('GETRCD': %error: %found: %eof);
        if (RS012_ = '1');
      /end-free
     C                   EVAL      RS012_ = DeleteRcd_('RKWPDUSER')
      /free
        endif;
        pdno = savepdno;
       endif;
       pduid = getparm3_('pduid':'*OPT');
       pdupass = getparm3_('pdupass':'*OPT');
       if (pduid <> '');
        savepdno = pdno;
        pdno = '';
        AM012_ = CV_BYKEY;
        CHAIN(E) DL012_ RKWPDUSER;
        RS012_ = RcdSts2_('GETRCD': %error: %found: %eof);
        if (RS012_ = '1');
         Alert_('User ID already in use');
        else;
         pduemail = pdemail;
         pduname = pdname;
         pdudealer = savepdno;
         WRITE RKWPDUSER;
         RS012_ = RcdSts2_('WRTRCD': %error: %found: %eof);
         pdno = savepdno;
        endif;
       endif;
       dealersign0();
       signemail = getparm3_('signemail':'*OPT');
       pddtype = 'DLRINPUT';
       pddcode = 'EFTBATCH';
       AM008_ = CV_BYKEY;
       CHAIN(NE) DL008_ RKWPDDATA;
       RS008_ = RcdSts2_('GETRCD': %error: %found: %eof);
       pddchar = getparm3_('EFTBATCH':'*OPT');
       if (RS008_ = '1');
        RS008_ = UpdateRcd_('RKWPDDATA');
       else;
        WRITE RKWPDDATA;
        RS008_ = RcdSts2_('WRTRCD': %error: %found: %eof);
       endif;
       pddtype = 'DLRINPUT';
       pddcode = 'RTOYESNO';
       AM008_ = CV_BYKEY;
       CHAIN(NE) DL008_ RKWPDDATA;
       RS008_ = RcdSts2_('GETRCD': %error: %found: %eof);
       pddchar = getparm3_('RTOYESNO':'*OPT');
       if (RS008_ = '1');
        RS008_ = UpdateRcd_('RKWPDDATA');
       else;
        WRITE RKWPDDATA;
        RS008_ = RcdSts2_('WRTRCD': %error: %found: %eof);
       endif;
       pddtype = 'DLRINPUT';
       pddcode = 'WEBMODEL';
       AM008_ = CV_BYKEY;
       CHAIN(NE) DL008_ RKWPDDATA;
       RS008_ = RcdSts2_('GETRCD': %error: %found: %eof);
       pddchar = getparm3_('WEBMODEL':'*OPT');
       if (RS008_ = '1');
        RS008_ = UpdateRcd_('RKWPDDATA');
       else;
        WRITE RKWPDDATA;
        RS008_ = RcdSts2_('WRTRCD': %error: %found: %eof);
       endif;
       if (email_status = 'Y');
        pddtype = 'DLRINPUT';
        pddcode = 'EMAILSTYN';
        AM008_ = CV_BYKEY;
        CHAIN(NE) DL008_ RKWPDDATA;
        RS008_ = RcdSts2_('GETRCD': %error: %found: %eof);
        pddchar = getparm3_('EMAILSTYN':'*OPT');
        if (RS008_ = '1');
         RS008_ = UpdateRcd_('RKWPDDATA');
        else;
         WRITE RKWPDDATA;
         RS008_ = RcdSts2_('WRTRCD': %error: %found: %eof);
        endif;
       endif;
       if (dlrstynopt = 'Y');
        pddtype = 'DLRINPUT';
        pddcode = 'DLRSTYN';
        AM008_ = CV_BYKEY;
        CHAIN(NE) DL008_ RKWPDDATA;
        RS008_ = RcdSts2_('GETRCD': %error: %found: %eof);
        pddchar = getparm3_('DLRSTYN':'*OPT');
        if (RS008_ = '1');
         RS008_ = UpdateRcd_('RKWPDDATA');
        else;
         WRITE RKWPDDATA;
         RS008_ = RcdSts2_('WRTRCD': %error: %found: %eof);
        endif;
       endif;
       pddtype = 'DLRINPUT';
       pddcode = 'USAEPAYATH';
       AM008_ = CV_BYKEY;
       CHAIN(E) DL008_ RKWPDDATA;
       RS008_ = RcdSts2_('GETRCD': %error: %found: %eof);
       pddchar = getparm3_('USAEPAYATH':'*OPT');
       if (RS008_ = '1');
        RS008_ = UpdateRcd_('RKWPDDATA');
       else;
        WRITE RKWPDDATA;
        RS008_ = RcdSts2_('WRTRCD': %error: %found: %eof);
       endif;
       pddtype = 'DLRINPUT';
       pddcode = 'DLRDBT';
       AM008_ = CV_BYKEY;
       CHAIN(E) DL008_ RKWPDDATA;
       RS008_ = RcdSts2_('GETRCD': %error: %found: %eof);
       pddchar = getparm3_('DLRDBT':'*OPT');
       if (RS008_ = '1');
        RS008_ = UpdateRcd_('RKWPDDATA');
       else;
        WRITE RKWPDDATA;
        RS008_ = RcdSts2_('WRTRCD': %error: %found: %eof);
       endif;
       pddtype = 'DLRINPUT';
       pddcode = 'CATEGORY';
       AM008_ = CV_BYKEY;
       CHAIN(E) DL008_ RKWPDDATA;
       RS008_ = RcdSts2_('GETRCD': %error: %found: %eof);
       pddchar = getparm3_('CATEGORY':'*OPT');
       if (RS008_ = '1');
        RS008_ = UpdateRcd_('RKWPDDATA');
       else;
        WRITE RKWPDDATA;
        RS008_ = RcdSts2_('WRTRCD': %error: %found: %eof);
       endif;
       pddtype = 'DLRINPUT';
       pddcode = 'NEWAPP';
       AM008_ = CV_BYKEY;
       CHAIN(E) DL008_ RKWPDDATA;
       RS008_ = RcdSts2_('GETRCD': %error: %found: %eof);
       pddchar = getparm3_('NEWAPP':'*OPT');
       if (RS008_ = '1');
        RS008_ = UpdateRcd_('RKWPDDATA');
       else;
        WRITE RKWPDDATA;
        RS008_ = RcdSts2_('WRTRCD': %error: %found: %eof);
       endif;
       pddtype = 'DLRINPUT';
       pddcode = 'EXPIREDAYS';
       AM008_ = CV_BYKEY;
       CHAIN(E) DL008_ RKWPDDATA;
       RS008_ = RcdSts2_('GETRCD': %error: %found: %eof);
       pddchar = getparm3_('EXPIREDAYS':'*OPT');
       if (RS008_ = '1');
        RS008_ = UpdateRcd_('RKWPDDATA');
       else;
        WRITE RKWPDDATA;
        RS008_ = RcdSts2_('WRTRCD': %error: %found: %eof);
       endif;
       pddtype = 'DLRINPUT';
       pddcode = 'NEWSUPPAPP';
       AM008_ = CV_BYKEY;
       CHAIN(E) DL008_ RKWPDDATA;
       RS008_ = RcdSts2_('GETRCD': %error: %found: %eof);
       pddchar = getparm3_('NEWSUPPAPP':'*OPT');
       if (RS008_ = '1');
        RS008_ = UpdateRcd_('RKWPDDATA');
       else;
        WRITE RKWPDDATA;
        RS008_ = RcdSts2_('WRTRCD': %error: %found: %eof);
       endif;
       pddtype = 'DLRTYPE';
       pddcode = 'GASCASH';
       AM008_ = CV_BYKEY;
       CHAIN(E) DL008_ RKWPDDATA;
       RS008_ = RcdSts2_('GETRCD': %error: %found: %eof);
       pddchar = getparm3_('GASCASH':'*OPT');
       if (RS008_ = '1');
        RS008_ = UpdateRcd_('RKWPDDATA');
       else;
        WRITE RKWPDDATA;
        RS008_ = RcdSts2_('WRTRCD': %error: %found: %eof);
       endif;
       pddtype = 'DLRINPUT';
       pddcode = 'NEWLL';
       AM008_ = CV_BYKEY;
       CHAIN(E) DL008_ RKWPDDATA;
       RS008_ = RcdSts2_('GETRCD': %error: %found: %eof);
       pddchar = getparm3_('NEWLL':'*OPT');
       if (RS008_ = '1');
        RS008_ = UpdateRcd_('RKWPDDATA');
       else;
        WRITE RKWPDDATA;
        RS008_ = RcdSts2_('WRTRCD': %error: %found: %eof);
       endif;
       pddtype = 'DLRINPUT';
       pddcode = 'PROCOV';
       AM008_ = CV_BYKEY;
       CHAIN(E) DL008_ RKWPDDATA;
       RS008_ = RcdSts2_('GETRCD': %error: %found: %eof);
       pddchar = getparm3_('PROCOV':'*OPT');
       if (RS008_ = '1');
        RS008_ = UpdateRcd_('RKWPDDATA');
       else;
        WRITE RKWPDDATA;
        RS008_ = RcdSts2_('WRTRCD': %error: %found: %eof);
       endif;
       pddtype = 'DLRINPUT';
       pddcode = 'NEWIBVR';
       AM008_ = CV_BYKEY;
       CHAIN(E) DL008_ RKWPDDATA;
       RS008_ = RcdSts2_('GETRCD': %error: %found: %eof);
       pddchar = getparm3_('NEWIBVR':'*OPT');
       if (RS008_ = '1');
        RS008_ = UpdateRcd_('RKWPDDATA');
       else;
        WRITE RKWPDDATA;
        RS008_ = RcdSts2_('WRTRCD': %error: %found: %eof);
       endif;
       pddtype = 'DLRINPUT';
       pddcode = 'DLRPIN';
       AM008_ = CV_BYKEY;
       CHAIN(E) DL008_ RKWPDDATA;
       RS008_ = RcdSts2_('GETRCD': %error: %found: %eof);
       pddchar = getparm3_('DLRPIN':'*OPT');
       if (RS008_ = '1');
        RS008_ = UpdateRcd_('RKWPDDATA');
       else;
        WRITE RKWPDDATA;
        RS008_ = RcdSts2_('WRTRCD': %error: %found: %eof);
       endif;
       pddtype = 'DLRINPUT';
       pddcode = 'DLRCVV';
       AM008_ = CV_BYKEY;
       CHAIN(E) DL008_ RKWPDDATA;
       RS008_ = RcdSts2_('GETRCD': %error: %found: %eof);
       pddchar = getparm3_('DLRCVV':'*OPT');
       if (RS008_ = '1');
        RS008_ = UpdateRcd_('RKWPDDATA');
       else;
        WRITE RKWPDDATA;
        RS008_ = RcdSts2_('WRTRCD': %error: %found: %eof);
       endif;
       pddtype = 'DLRINPUT';
       pddcode = 'AVSCHECK';
       AM008_ = CV_BYKEY;
       CHAIN(E) DL008_ RKWPDDATA;
       RS008_ = RcdSts2_('GETRCD': %error: %found: %eof);
       pddchar = getparm3_('AVSCHECK':'*OPT');
       if (RS008_ = '1');
        RS008_ = UpdateRcd_('RKWPDDATA');
       else;
        WRITE RKWPDDATA;
        RS008_ = RcdSts2_('WRTRCD': %error: %found: %eof);
       endif;
       pddtype = 'DLRINPUT';
       pddcode = 'SIGNPIN';
       AM008_ = CV_BYKEY;
       CHAIN(E) DL008_ RKWPDDATA;
       RS008_ = RcdSts2_('GETRCD': %error: %found: %eof);
       pddchar = getparm3_('SIGNPIN':'*OPT');
       if (RS008_ = '1');
        RS008_ = UpdateRcd_('RKWPDDATA');
       else;
        WRITE RKWPDDATA;
        RS008_ = RcdSts2_('WRTRCD': %error: %found: %eof);
       endif;
       pddtype = 'DLRINPUT';
       pddcode = 'IBVS';
       AM008_ = CV_BYKEY;
       CHAIN(E) DL008_ RKWPDDATA;
       RS008_ = RcdSts2_('GETRCD': %error: %found: %eof);
       pddchar = getparm3_('IBVS':'*OPT');
       if (RS008_ = '1');
        RS008_ = UpdateRcd_('RKWPDDATA');
       else;
        WRITE RKWPDDATA;
        RS008_ = RcdSts2_('WRTRCD': %error: %found: %eof);
       endif;
       pddtype = 'DLRINPUT';
       pddcode = 'DPOPT';
       AM008_ = CV_BYKEY;
       CHAIN(E) DL008_ RKWPDDATA;
       RS008_ = RcdSts2_('GETRCD': %error: %found: %eof);
       pddchar = getparm3_('DPOPT':'*OPT');
       if (RS008_ = '1');
        RS008_ = UpdateRcd_('RKWPDDATA');
       else;
        WRITE RKWPDDATA;
        RS008_ = RcdSts2_('WRTRCD': %error: %found: %eof);
       endif;
       pddtype = 'DLRINPUT';
       pddcode = 'WALLET';
       AM008_ = CV_BYKEY;
       CHAIN(E) DL008_ RKWPDDATA;
       RS008_ = RcdSts2_('GETRCD': %error: %found: %eof);
       pddchar = getparm3_('WALLET':'*OPT');
       if (RS008_ = '1');
        RS008_ = UpdateRcd_('RKWPDDATA');
       else;
        WRITE RKWPDDATA;
        RS008_ = RcdSts2_('WRTRCD': %error: %found: %eof);
       endif;
       pddtype = 'DLRINPUT';
       pddcode = 'IBVW';
       AM008_ = CV_BYKEY;
       CHAIN(E) DL008_ RKWPDDATA;
       RS008_ = RcdSts2_('GETRCD': %error: %found: %eof);
       pddchar = getparm3_('IBVW':'*OPT');
       if (RS008_ = '1');
        RS008_ = UpdateRcd_('RKWPDDATA');
       else;
        WRITE RKWPDDATA;
        RS008_ = RcdSts2_('WRTRCD': %error: %found: %eof);
       endif;
       pddtype = 'DLRINPUT';
       pddcode = 'WALLETW';
       AM008_ = CV_BYKEY;
       CHAIN(E) DL008_ RKWPDDATA;
       RS008_ = RcdSts2_('GETRCD': %error: %found: %eof);
       pddchar = getparm3_('WALLETW':'*OPT');
       if (RS008_ = '1');
        RS008_ = UpdateRcd_('RKWPDDATA');
       else;
        WRITE RKWPDDATA;
        RS008_ = RcdSts2_('WRTRCD': %error: %found: %eof);
       endif;
       pddtype = 'DLRINPUT';
       pddcode = 'DLRREP';
       AM008_ = CV_BYKEY;
       CHAIN(E) DL008_ RKWPDDATA;
       RS008_ = RcdSts2_('GETRCD': %error: %found: %eof);
       pddchar = getparm3_('DLRREP':'*OPT');
       if (RS008_ = '1');
        RS008_ = UpdateRcd_('RKWPDDATA');
       else;
        WRITE RKWPDDATA;
        RS008_ = RcdSts2_('WRTRCD': %error: %found: %eof);
       endif;
       pddtype = 'DLRINPUT';
       pddcode = 'SIGNTYPE';
       AM008_ = CV_BYKEY;
       CHAIN(E) DL008_ RKWPDDATA;
       RS008_ = RcdSts2_('GETRCD': %error: %found: %eof);
       pddchar = getparm3_('SIGNTYPE':'*OPT');
       if (RS008_ = '1');
        RS008_ = UpdateRcd_('RKWPDDATA');
       else;
        WRITE RKWPDDATA;
        RS008_ = RcdSts2_('WRTRCD': %error: %found: %eof);
       endif;
       pddtype = 'DLRINPUT';
       pddcode = 'FRVERIFY';
       AM008_ = CV_BYKEY;
       CHAIN(E) DL008_ RKWPDDATA;
       RS008_ = RcdSts2_('GETRCD': %error: %found: %eof);
       pddchar = getparm3_('FRVERIFY':'*OPT');
       if (RS008_ = '1');
        RS008_ = UpdateRcd_('RKWPDDATA');
       else;
        WRITE RKWPDDATA;
        RS008_ = RcdSts2_('WRTRCD': %error: %found: %eof);
       endif;
       pddtype = 'DLRINPUT';
       pddcode = 'VHOMEIMP';
       AM008_ = CV_BYKEY;
       CHAIN(E) DL008_ RKWPDDATA;
       RS008_ = RcdSts2_('GETRCD': %error: %found: %eof);
       pddchar = getparm3_('VHOMEIMP':'*OPT');
       if (RS008_ = '1');
        RS008_ = UpdateRcd_('RKWPDDATA');
       else;
        WRITE RKWPDDATA;
        RS008_ = RcdSts2_('WRTRCD': %error: %found: %eof);
       endif;
       pddtype = 'DLRINPUT';
       pddcode = 'VREBATE';
       AM008_ = CV_BYKEY;
       CHAIN(E) DL008_ RKWPDDATA;
       RS008_ = RcdSts2_('GETRCD': %error: %found: %eof);
       pddchar = getparm3_('VREBATE':'*OPT');
       if (RS008_ = '1');
        RS008_ = UpdateRcd_('RKWPDDATA');
       else;
        WRITE RKWPDDATA;
        RS008_ = RcdSts2_('WRTRCD': %error: %found: %eof);
       endif;
       AM003_ = CV_BYKEY;
       CHAIN(E) DL003_ RWPDPGM;
       RS003_ = RcdSts2_('GETRCD': %error: %found: %eof);
       pdpgm = getparm3_('pdpgm':'*OPT');
       if (RS003_ = '1');
        RS003_ = UpdateRcd_('RWPDPGM');
       else;
        WRITE RWPDPGM;
        RS003_ = RcdSts2_('WRTRCD': %error: %found: %eof);
       endif;
       if (ondev = 'Y');
        pdrtype = 'RISKPER';
        RISKPER = %dec(aton_( getparm3_('RISKPER':'*OPT'):46:16):8:5);
        AM022_ = CV_BYKEY;
        CHAIN(E) DL022_ RKWPDRATE;
        RS022_ = RcdSts2_('GETRCD': %error: %found: %eof);
        PDRATE = RISKPER;
        if (RS022_ = '1');
         RS022_ = UpdateRcd_('RKWPDRATE');
        else;
         WRITE RKWPDRATE;
         RS022_ = RcdSts2_('WRTRCD': %error: %found: %eof);
        endif;
       endif;
       Redirect2_( %trim(pgm_lnlist) + '?rrn=' + savedrrn:'*SAME':'rand');
      /end-free
     c     *PSSR         begsr
     c                   endsr
     P                 E


     P*---------------------------------------------------------------------
     P* getdealerparms0...          - User defined function
     P*---------------------------------------------------------------------
     P getdealerparms0...
     P                 B
     D getdealerparms0...
     D                 PI
     D file                          10A
     D                                     VALUE






      /free
       select;
       when (file = 'KWPDBASE');
       pdnuse = getparm3_('pdnuse':'*OPT');
       pdname = getparm3_('pdname':'*OPT');
       PDTIN = %dec(aton_( getparm3_('PDTIN':'*OPT'):46:16):9:0);
       pdprod = getparm3_('pdprod':'*OPT');
       PDLOC = %dec(aton_( getparm3_('PDLOC':'*OPT'):46:16):11:0);
       PDEFTABA = %dec(aton_( getparm3_('PDEFTABA':'*OPT'):46:16):9:0);
       pdeftacct = getparm3_('pdeftacct':'*OPT');
       pdefttype = getparm3_('pdefttype':'*OPT');
       PDLOC = %dec(aton_( getparm3_('PDLOC':'*OPT'):46:16):11:0);
       pdmodel = getparm3_('pdmodel':'*OPT');
       pdlngrp = getparm3_('pdlngrp':'*OPT');
       when (file = 'KWPDLOC');
       pdnam1 = getparm3_('pdnam1':'*OPT');
       pdnam2 = getparm3_('pdnam2':'*OPT');
       pdadr1 = getparm3_('pdadr1':'*OPT');
       pdadr2 = getparm3_('pdadr2':'*OPT');
       pdcity = getparm3_('pdcity':'*OPT');
       pdst = getparm3_('pdst':'*OPT');
       PDZIP = %dec(aton_( getparm3_('PDZIP':'*OPT'):46:16):9:0);
       pdzipf = getparm3_('pdzipf':'*OPT');
       PDPHON = %dec(aton_( getparm3_('PDPHON':'*OPT'):46:16):10:0);
       PDPHON1 = %dec(aton_( getparm3_('PDPHON1':'*OPT'):46:16):10:0);
       PDFAX = %dec(aton_( getparm3_('PDFAX':'*OPT'):46:16):10:0);
       pdtimez = getparm3_('pdtimez':'*OPT');
       pdemail = getparm3_('pdemail':'*OPT');
       pduser = getparm3_('pduser':'*OPT');
       pdpass = getparm3_('pdpass':'*OPT');
       endsl;
      /end-free
     c     *PSSR         begsr
     c                   endsr
     P                 E


     P*---------------------------------------------------------------------
     P* getemails0...               - User defined function
     P*---------------------------------------------------------------------
     P getemails0...
     P                 B
     D getemails0...
     D                 PI
     D counter                        2P 0
     D                                     VALUE






      /free
       pddchar = getparm3_( %trim(%editc(counter:'P')) + 'PDDCHAR':'*OPT');
      /end-free
     c     *PSSR         begsr
     c                   endsr
     P                 E


     P*---------------------------------------------------------------------
     P* pdnusebox0...               - User defined function
     P*---------------------------------------------------------------------
     P pdnusebox0...
     P                 B
     D pdnusebox0...
     D                 PI




      /free
       OutWeb_('<select name="PDNUSE" id="PDNUSE" onchange="">');
       if (pdnuse = '');
        OutWeb_('<option selected value=""></option>');
       else;
        OutWeb_('<option value=""></option>');
       endif;
       if (pdnuse = 'Y');
        OutWeb_('<option selected value="Y">Yes</option>');
       else;
        OutWeb_('<option value="Y">Yes</option>');
       endif;
       if (pdnuse = 'N');
        OutWeb_('<option selected value="N">No</option>');
       else;
        OutWeb_('<option value="N">No</option>');
       endif;
       if (pdnuse = 'T');
        OutWeb_('<option selected value="T">Terminated</option>');
       else;
        OutWeb_('<option value="T">Terminated</option>');
       endif;
       OutWeb_('</select>');
      /end-free
     c     *PSSR         begsr
     c                   endsr
     P                 E


     P*---------------------------------------------------------------------
     P* achtypebox0...              - User defined function
     P*---------------------------------------------------------------------
     P achtypebox0...
     P                 B
     D achtypebox0...
     D                 PI




      /free
       boxtype = 'SYSTEM';
       p_ztype = 'ACH_ACTTYP';
       boxname = 'PDEFTTYPE';
       boxid = 'PDEFTTYPE';
       boxselect = pdefttype;
       jvalidation = ' ';
      /end-free
     C                   EVAL      QPGM__=%trim('KWWEB'     ) + '/' + 'SELBOX2'
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
     P* locbox0...                  - User defined function
     P*---------------------------------------------------------------------
     P locbox0...
     P                 B
     D locbox0...
     D                 PI




      /free
       p_ztype = 'KWPLBASE';
       boxname = 'PDLOC';
       boxid = 'PDLOC';
       boxselect = %trim(%editc(PDLOC:'P'));
       boxtype = 'OTHER';
      /end-free
     C                   EVAL      QPGM__=%trim('KWWEB'     ) + '/' + 'SELBOX2'
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
     P* wrtpdstbox0...              - User defined function
     P*---------------------------------------------------------------------
     P wrtpdstbox0...
     P                 B
     D wrtpdstbox0...
     D                 PI




      /free
       boxtype = 'SYSTEM';
       p_ztype = 'STATECODE';
       boxname = 'PDST';
       boxid = 'PDST';
       boxselect = pdst;
       jvalidation = 'valState(''stateErr'');';
      /end-free
     C                   EVAL      QPGM__=%trim('KWWEB'     ) + '/' + 'SELBOX2'
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
     P* salesrepbox0...             - User defined function
     P*---------------------------------------------------------------------
     P salesrepbox0...
     P                 B
     D salesrepbox0...
     D                 PI




      /free
       OutWeb_('<select name="SALESREP" id="SALESREP" onchange="">');
       OutWeb_('<option value=""></option>');
       psusrfile = 'KWLUFLD';
       PSUSRNO = %dec(aton_('2':46:16):11:0);
       SETLL  seqkey RKWPSUCOD;
       RS009_ = RcdSts2_('POSRCD':%error:%equal:%eof);
       READE(NE) seqkey RKWPSUCOD;
       RS009_ = RcdSts2_('GETNXTRCD':%error:%found:%eof);
       AM009_ = CV_ByKey;
       dow (RS009_ = '1');
       pddtype = 'SALESREP';
       pddcode = %trim(psusrcode);
       AM008_ = CV_BYKEY;
       CHAIN(NE) DL008_ RKWPDDATA;
       RS008_ = RcdSts2_('GETRCD': %error: %found: %eof);
       if (RS008_ = '1');
        OutWeb_(%trimr( '<option selected value="' + %trim(psusrcode) + '/'
       + %trim(psusrdesc) + '">' + %trim(psusrdesc) + '</option>'));
       else;
        OutWeb_(%trimr( '<option value="' + %trim(psusrcode) + '/' + %trim(
       psusrdesc) + '">' + %trim(psusrdesc) + '</option>'));
       endif;
       READE(NE) seqkey RKWPSUCOD;
       RS009_ = RcdSts2_('GETNXTRCD':%error:%found:%eof);
       AM009_ = CV_ByKey;
       enddo;
       OutWeb_('</select>');
      /end-free
     c     *PSSR         begsr
     c                   endsr
     P                 E


     P*---------------------------------------------------------------------
     P* leadsrcbox0...              - User defined function
     P*---------------------------------------------------------------------
     P leadsrcbox0...
     P                 B
     D leadsrcbox0...
     D                 PI




      /free
       OutWeb_('<select name="LEADSRC" id="LEADSRC" onchange="">');
       OutWeb_('<option value=""></option>');
       psusrfile = 'KWLUFLD';
       PSUSRNO = %dec(aton_('1':46:16):11:0);
       SETLL  *LOVAL RKWPSUCOD;
       RS009_ = RcdSts2_('POSRCD':%error:%equal:%eof);
       READE(NE) seqkey RKWPSUCOD;
       RS009_ = RcdSts2_('GETNXTRCD':%error:%found:%eof);
       AM009_ = CV_ByKey;
       dow (RS009_ = '1');
       pddtype = 'LEADSRC';
       pddcode = %trim(psusrcode);
       AM008_ = CV_BYKEY;
       CHAIN(NE) DL008_ RKWPDDATA;
       RS008_ = RcdSts2_('GETRCD': %error: %found: %eof);
       if (RS008_ = '1');
        OutWeb_(%trimr( '<option selected value="' + %trim(psusrcode) + '/'
       + %trim(psusrdesc) + '">' + %trim(psusrdesc) + '</option>'));
       else;
        OutWeb_(%trimr( '<option value="' + %trim(psusrcode) + '/' + %trim(
       psusrdesc) + '">' + %trim(psusrdesc) + '</option>'));
       endif;
       READE(NE) seqkey RKWPSUCOD;
       RS009_ = RcdSts2_('GETNXTRCD':%error:%found:%eof);
       AM009_ = CV_ByKey;
       enddo;
       OutWeb_('</select>');
      /end-free
     c     *PSSR         begsr
     c                   endsr
     P                 E


     P*---------------------------------------------------------------------
     P* hobox0...                   - User defined function
     P*---------------------------------------------------------------------
     P hobox0...
     P                 B
     D hobox0...
     D                 PI




      /free
       OutWeb_('<select name="HOMEOFFICE" id="HOMEOFFICE" onchange="">');
       OutWeb_('<option value=""></option>');
       psusrfile = 'KWLUFLD';
       PSUSRNO = %dec(aton_('4':46:16):11:0);
       SETLL  seqkey RKWPSUCOD;
       RS009_ = RcdSts2_('POSRCD':%error:%equal:%eof);
       READE(NE) seqkey RKWPSUCOD;
       RS009_ = RcdSts2_('GETNXTRCD':%error:%found:%eof);
       AM009_ = CV_ByKey;
       dow (RS009_ = '1');
       pddtype = 'HOMEOFFICE';
       pddcode = %trim(psusrcode);
       AM008_ = CV_BYKEY;
       CHAIN(NE) DL008_ RKWPDDATA;
       RS008_ = RcdSts2_('GETRCD': %error: %found: %eof);
       if (RS008_ = '1');
        OutWeb_(%trimr( '<option selected value="' + %trim(psusrcode) + '/'
       + %trim(psusrdesc) + '">' + %trim(psusrdesc) + '</option>'));
       else;
        OutWeb_(%trimr( '<option value="' + %trim(psusrcode) + '/' + %trim(
       psusrdesc) + '">' + %trim(psusrdesc) + '</option>'));
       endif;
       READE(NE) seqkey RKWPSUCOD;
       RS009_ = RcdSts2_('GETNXTRCD':%error:%found:%eof);
       AM009_ = CV_ByKey;
       enddo;
      /end-free
     c     *PSSR         begsr
     c                   endsr
     P                 E


     P*---------------------------------------------------------------------
     P* appdecpbox0...              - User defined function
     P*---------------------------------------------------------------------
     P appdecpbox0...
     P                 B
     D appdecpbox0...
     D                 PI




      /free
       pddtype = 'DLRINPUT';
       pddcode = 'APPDECP';
       AM008_ = CV_BYKEY;
       CHAIN(NE) DL008_ RKWPDDATA;
       RS008_ = RcdSts2_('GETRCD': %error: %found: %eof);
       if (RS008_ = '1');
        boxselect = %subst(pddchar:1:1);
       else;
        boxselect = 'N';
       endif;
       p_ztype = 'YESNO';
       boxname = 'APPDECP';
       boxid = 'APPDECP';
       boxtype = 'SYSTEM';
       jvalidation = ' ';
      /end-free
     C                   EVAL      QPGM__=%trim('KWWEB'     ) + '/' + 'SELBOX2'
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
     P* repodlrbox0...              - User defined function
     P*---------------------------------------------------------------------
     P repodlrbox0...
     P                 B
     D repodlrbox0...
     D                 PI




      /free
       p_ztype = 'YESNO';
       boxname = 'REPODLR';
       boxid = 'REPODLR';
       boxselect = repodlr;
       boxtype = 'SYSTEM';
       jvalidation = ' ';
      /end-free
     C                   EVAL      QPGM__=%trim('KWWEB'     ) + '/' + 'SELBOX2'
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
     P* appdecsbox0...              - User defined function
     P*---------------------------------------------------------------------
     P appdecsbox0...
     P                 B
     D appdecsbox0...
     D                 PI




      /free
       pddtype = 'DLRINPUT';
       pddcode = 'APPDECS';
       AM008_ = CV_BYKEY;
       CHAIN(NE) DL008_ RKWPDDATA;
       RS008_ = RcdSts2_('GETRCD': %error: %found: %eof);
       if (RS008_ = '1');
        boxselect = %subst(pddchar:1:1);
       else;
        boxselect = 'N';
       endif;
       p_ztype = 'YESNO';
       boxname = 'APPDECS';
       boxid = 'APPDECS';
       boxtype = 'SYSTEM';
       jvalidation = ' ';
      /end-free
     C                   EVAL      QPGM__=%trim('KWWEB'     ) + '/' + 'SELBOX2'
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
     P* docbefappbox0...            - User defined function
     P*---------------------------------------------------------------------
     P docbefappbox0...
     P                 B
     D docbefappbox0...
     D                 PI




      /free
       OutWeb_('<select name="DOCBEFAPP" id="DOCBEFAPP" onchange="">');
       OutWeb_('<option value=""></option>');
       p_ztype = 'DOCBEFAPP';
       SETLL  DL004_ RKWPDATA;
       RS004_ = RcdSts2_('POSRCD':%error:%equal:%eof);
       READE(NE) DL004_ RKWPDATA;
       RS004_ = RcdSts2_('GETNXTRCD':%error:%found:%eof);
       AM004_ = CV_ByKey;
       dow (RS004_ = '1');
       pddtype = 'DOCBEFAPP';
       pddcode = p_zkeya;
       AM008_ = CV_BYKEY;
       CHAIN(NE) DL008_ RKWPDDATA;
       RS008_ = RcdSts2_('GETRCD': %error: %found: %eof);
       if (RS008_ = '1');
        OutWeb_(%trimr( '<option selected value="' + %trim(p_zkeya) + '/' +
       %trim(p_zdesc) + '">' + %trim(p_zdesc) + '</option>'));
       else;
        OutWeb_(%trimr( '<option value="' + %trim(p_zkeya) + '/' + %trim(
       p_zdesc) + '">' + %trim(p_zdesc) + '</option>'));
       endif;
       READE(NE) DL004_ RKWPDATA;
       RS004_ = RcdSts2_('GETNXTRCD':%error:%found:%eof);
       AM004_ = CV_ByKey;
       enddo;
      /end-free
     c     *PSSR         begsr
     c                   endsr
     P                 E


     P*---------------------------------------------------------------------
     P* permitaddonbox0...          - User defined function
     P*---------------------------------------------------------------------
     P permitaddonbox0...
     P                 B
     D permitaddonbox0...
     D                 PI




      /free
       OutWeb_('<select name="PERMITADDON" id="PERMITADDON" onchange="">');
       OutWeb_('<option value=""></option>');
       p_ztype = 'PERMITADDON';
       SETLL  DL004_ RKWPDATA;
       RS004_ = RcdSts2_('POSRCD':%error:%equal:%eof);
       READE(NE) DL004_ RKWPDATA;
       RS004_ = RcdSts2_('GETNXTRCD':%error:%found:%eof);
       AM004_ = CV_ByKey;
       dow (RS004_ = '1');
       pddtype = 'PERMITADDON';
       pddcode = p_zkeya;
       AM008_ = CV_BYKEY;
       CHAIN(NE) DL008_ RKWPDDATA;
       RS008_ = RcdSts2_('GETRCD': %error: %found: %eof);
       if (RS008_ = '1');
        OutWeb_(%trimr( '<option selected value="' + %trim(p_zkeya) + '/' +
       %trim(p_zdesc) + '">' + %trim(p_zdesc) + '</option>'));
       else;
        OutWeb_(%trimr( '<option value="' + %trim(p_zkeya) + '/' + %trim(
       p_zdesc) + '">' + %trim(p_zdesc) + '</option>'));
       endif;
       READE(NE) DL004_ RKWPDATA;
       RS004_ = RcdSts2_('GETNXTRCD':%error:%found:%eof);
       AM004_ = CV_ByKey;
       enddo;
      /end-free
     c     *PSSR         begsr
     c                   endsr
     P                 E


     P*---------------------------------------------------------------------
     P* riskbpbox0...               - User defined function
     P*---------------------------------------------------------------------
     P riskbpbox0...
     P                 B
     D riskbpbox0...
     D                 PI




      /free
       OutWeb_('<select name="RISKBP" id="RISKBP" onchange="">');
       OutWeb_('<option value=""></option>');
       p_ztype = 'RISKBP';
       SETLL  DL004_ RKWPDATA;
       RS004_ = RcdSts2_('POSRCD':%error:%equal:%eof);
       READE(NE) DL004_ RKWPDATA;
       RS004_ = RcdSts2_('GETNXTRCD':%error:%found:%eof);
       AM004_ = CV_ByKey;
       dow (RS004_ = '1');
       pddtype = 'RISKBP';
       pddcode = p_zkeya;
       AM008_ = CV_BYKEY;
       CHAIN(NE) DL008_ RKWPDDATA;
       RS008_ = RcdSts2_('GETRCD': %error: %found: %eof);
       if (RS008_ = '1');
        OutWeb_(%trimr( '<option selected value="' + %trim(p_zkeya) + '/' +
       %trim(p_zdesc) + '">' + %trim(p_zdesc) + '</option>'));
       else;
        OutWeb_(%trimr( '<option value="' + %trim(p_zkeya) + '/' + %trim(
       p_zdesc) + '">' + %trim(p_zdesc) + '</option>'));
       endif;
       READE(NE) DL004_ RKWPDATA;
       RS004_ = RcdSts2_('GETNXTRCD':%error:%found:%eof);
       AM004_ = CV_ByKey;
       enddo;
      /end-free
     c     *PSSR         begsr
     c                   endsr
     P                 E


     P*---------------------------------------------------------------------
     P* nocdocbox0...               - User defined function
     P*---------------------------------------------------------------------
     P nocdocbox0...
     P                 B
     D nocdocbox0...
     D                 PI




      /free
       OutWeb_('<select name="NOCDOC" id="NOCDOC" onchange="">');
       OutWeb_('<option value=""></option>');
       p_ztype = 'NOCDOC';
       SETLL  DL004_ RKWPDATA;
       RS004_ = RcdSts2_('POSRCD':%error:%equal:%eof);
       READE(NE) DL004_ RKWPDATA;
       RS004_ = RcdSts2_('GETNXTRCD':%error:%found:%eof);
       AM004_ = CV_ByKey;
       dow (RS004_ = '1');
       pddtype = 'NOCDOC';
       pddcode = p_zkeya;
       AM008_ = CV_BYKEY;
       CHAIN(NE) DL008_ RKWPDDATA;
       RS008_ = RcdSts2_('GETRCD': %error: %found: %eof);
       if (RS008_ = '1');
        OutWeb_(%trimr( '<option selected value="' + %trim(p_zkeya) + '/' +
       %trim(p_zdesc) + '">' + %trim(p_zdesc) + '</option>'));
       else;
        OutWeb_(%trimr( '<option value="' + %trim(p_zkeya) + '/' + %trim(
       p_zdesc) + '">' + %trim(p_zdesc) + '</option>'));
       endif;
       READE(NE) DL004_ RKWPDATA;
       RS004_ = RcdSts2_('GETNXTRCD':%error:%found:%eof);
       AM004_ = CV_ByKey;
       enddo;
      /end-free
     c     *PSSR         begsr
     c                   endsr
     P                 E


     P*---------------------------------------------------------------------
     P* fbfbox0...                  - User defined function
     P*---------------------------------------------------------------------
     P fbfbox0...
     P                 B
     D fbfbox0...
     D                 PI




      /free
       OutWeb_('<select name="FBF" id="FBF" onchange="">');
       OutWeb_('<option value=""></option>');
       p_ztype = 'FBF';
       SETLL  DL004_ RKWPDATA;
       RS004_ = RcdSts2_('POSRCD':%error:%equal:%eof);
       READE(NE) DL004_ RKWPDATA;
       RS004_ = RcdSts2_('GETNXTRCD':%error:%found:%eof);
       AM004_ = CV_ByKey;
       dow (RS004_ = '1');
       pddtype = 'FBF';
       pddcode = p_zkeya;
       AM008_ = CV_BYKEY;
       CHAIN(NE) DL008_ RKWPDDATA;
       RS008_ = RcdSts2_('GETRCD': %error: %found: %eof);
       if (RS008_ = '1');
        OutWeb_(%trimr( '<option selected value="' + %trim(p_zkeya) + '/' +
       %trim(p_zdesc) + '">' + %trim(p_zdesc) + '</option>'));
       else;
        OutWeb_(%trimr( '<option value="' + %trim(p_zkeya) + '/' + %trim(
       p_zdesc) + '">' + %trim(p_zdesc) + '</option>'));
       endif;
       READE(NE) DL004_ RKWPDATA;
       RS004_ = RcdSts2_('GETNXTRCD':%error:%found:%eof);
       AM004_ = CV_ByKey;
       enddo;
      /end-free
     c     *PSSR         begsr
     c                   endsr
     P                 E


     P*---------------------------------------------------------------------
     P* paytypebox0...              - User defined function
     P*---------------------------------------------------------------------
     P paytypebox0...
     P                 B
     D paytypebox0...
     D                 PI




      /free
       OutWeb_('<select name="PAYTYPE" id="PAYTYPE" onchange="">');
       OutWeb_('<option value=""></option>');
       p_ztype = 'PAYTYPE';
       SETLL  DL004_ RKWPDATA;
       RS004_ = RcdSts2_('POSRCD':%error:%equal:%eof);
       READE(NE) DL004_ RKWPDATA;
       RS004_ = RcdSts2_('GETNXTRCD':%error:%found:%eof);
       AM004_ = CV_ByKey;
       dow (RS004_ = '1');
       pddtype = 'PAYTYPE';
       pddcode = p_zkeya;
       AM008_ = CV_BYKEY;
       CHAIN(NE) DL008_ RKWPDDATA;
       RS008_ = RcdSts2_('GETRCD': %error: %found: %eof);
       if (RS008_ = '1');
        OutWeb_(%trimr( '<option selected value="' + %trim(p_zkeya) + '/' +
       %trim(p_zdesc) + '">' + %trim(p_zdesc) + '</option>'));
       else;
        OutWeb_(%trimr( '<option value="' + %trim(p_zkeya) + '/' + %trim(
       p_zdesc) + '">' + %trim(p_zdesc) + '</option>'));
       endif;
       READE(NE) DL004_ RKWPDATA;
       RS004_ = RcdSts2_('GETNXTRCD':%error:%found:%eof);
       AM004_ = CV_ByKey;
       enddo;
      /end-free
     c     *PSSR         begsr
     c                   endsr
     P                 E


     P*---------------------------------------------------------------------
     P* dlrstatbox0...              - User defined function
     P*---------------------------------------------------------------------
     P dlrstatbox0...
     P                 B
     D dlrstatbox0...
     D                 PI




      /free
       OutWeb_('<select name="DLRSTAT" id="DLRSTAT" onchange="">');
       OutWeb_('<option value=""></option>');
       p_ztype = 'DLRSTAT';
       SETLL  DL004_ RKWPDATA;
       RS004_ = RcdSts2_('POSRCD':%error:%equal:%eof);
       READE(NE) DL004_ RKWPDATA;
       RS004_ = RcdSts2_('GETNXTRCD':%error:%found:%eof);
       AM004_ = CV_ByKey;
       dow (RS004_ = '1');
       pddtype = 'DLRSTAT';
       pddcode = p_zkeya;
       AM008_ = CV_BYKEY;
       CHAIN(NE) DL008_ RKWPDDATA;
       RS008_ = RcdSts2_('GETRCD': %error: %found: %eof);
       if (RS008_ = '1');
        OutWeb_(%trimr( '<option selected value="' + %trim(p_zkeya) + '/' +
       %trim(p_zdesc) + '">' + %trim(p_zdesc) + '</option>'));
       else;
        OutWeb_(%trimr( '<option value="' + %trim(p_zkeya) + '/' + %trim(
       p_zdesc) + '">' + %trim(p_zdesc) + '</option>'));
       endif;
       READE(NE) DL004_ RKWPDATA;
       RS004_ = RcdSts2_('GETNXTRCD':%error:%found:%eof);
       AM004_ = CV_ByKey;
       enddo;
      /end-free
     c     *PSSR         begsr
     c                   endsr
     P                 E


     P*---------------------------------------------------------------------
     P* credbox0...                 - User defined function
     P*---------------------------------------------------------------------
     P credbox0...
     P                 B
     D credbox0...
     D                 PI




      /free
       OutWeb_('<select name="CREDHOW" id="CREDHOW">');
       OutWeb_('<option value=""></option>');
       p_ztype = 'CREDHOW';
       SETLL  DL004_ RKWPDATA;
       RS004_ = RcdSts2_('POSRCD':%error:%equal:%eof);
       READE(NE) DL004_ RKWPDATA;
       RS004_ = RcdSts2_('GETNXTRCD':%error:%found:%eof);
       AM004_ = CV_ByKey;
       dow (RS004_ = '1');
       pddtype = 'CREDHOW';
       pddcode = p_zkeya;
       AM008_ = CV_BYKEY;
       CHAIN(NE) DL008_ RKWPDDATA;
       RS008_ = RcdSts2_('GETRCD': %error: %found: %eof);
       if (RS008_ = '1');
        OutWeb_(%trimr( '<option selected value="' + %trim(p_zkeya) + '/' +
       %trim(p_zdesc) + '">' + %trim(p_zdesc) + '</option>'));
       else;
        OutWeb_(%trimr( '<option value="' + %trim(p_zkeya) + '/' + %trim(
       p_zdesc) + '">' + %trim(p_zdesc) + '</option>'));
       endif;
       READE(NE) DL004_ RKWPDATA;
       RS004_ = RcdSts2_('GETNXTRCD':%error:%found:%eof);
       AM004_ = CV_ByKey;
       enddo;
      /end-free
     c     *PSSR         begsr
     c                   endsr
     P                 E


     P*---------------------------------------------------------------------
     P* manubox0...                 - User defined function
     P*---------------------------------------------------------------------
     P manubox0...
     P                 B
     D manubox0...
     D                 PI




      /free
       OutWeb_('<select name="MFGNAME" id="MFGNAME" onchange="showOtherRows()-
       ;">');
       OutWeb_('<option value=""></option>');
       p_ztype = 'MFGNAME';
       SETLL  DL004_ RKWPDATA;
       RS004_ = RcdSts2_('POSRCD':%error:%equal:%eof);
       READE(NE) DL004_ RKWPDATA;
       RS004_ = RcdSts2_('GETNXTRCD':%error:%found:%eof);
       AM004_ = CV_ByKey;
       dow (RS004_ = '1');
       pddtype = 'MFGNAME';
       pddcode = p_zkeya;
       AM008_ = CV_BYKEY;
       CHAIN(NE) DL008_ RKWPDDATA;
       RS008_ = RcdSts2_('GETRCD': %error: %found: %eof);
       if (RS008_ = '1');
        OutWeb_(%trimr( '<option selected value="' + %trim(p_zkeya) + '/' +
       %trim(p_zdesc) + '">' + %trim(p_zdesc) + '</option>'));
       else;
        OutWeb_(%trimr( '<option value="' + %trim(p_zkeya) + '/' + %trim(
       p_zdesc) + '">' + %trim(p_zdesc) + '</option>'));
       endif;
       READE(NE) DL004_ RKWPDATA;
       RS004_ = RcdSts2_('GETNXTRCD':%error:%found:%eof);
       AM004_ = CV_ByKey;
       enddo;
      /end-free
     c     *PSSR         begsr
     c                   endsr
     P                 E


     P*---------------------------------------------------------------------
     P* psold1box0...               - User defined function
     P*---------------------------------------------------------------------
     P psold1box0...
     P                 B
     D psold1box0...
     D                 PI




      /free
       OutWeb_('<select name="PRODSOLD1" id="PRODSOLD1" onchange="showOtherRo-
       ws();">');
       OutWeb_('<option value=""></option>');
       p_ztype = 'PRODSOLD';
       SETLL  DL004_ RKWPDATA;
       RS004_ = RcdSts2_('POSRCD':%error:%equal:%eof);
       READE(NE) DL004_ RKWPDATA;
       RS004_ = RcdSts2_('GETNXTRCD':%error:%found:%eof);
       AM004_ = CV_ByKey;
       dow (RS004_ = '1');
       pddtype = 'PRODSOLD1';
       pddcode = p_zkeya;
       AM008_ = CV_BYKEY;
       CHAIN(NE) DL008_ RKWPDDATA;
       RS008_ = RcdSts2_('GETRCD': %error: %found: %eof);
       if (RS008_ = '1');
        OutWeb_(%trimr( '<option selected value="' + %trim(p_zkeya) + '/' +
       %trim(p_zdesc) + '">' + %trim(p_zdesc) + '</option>'));
       else;
        OutWeb_(%trimr( '<option value="' + %trim(p_zkeya) + '/' + %trim(
       p_zdesc) + '">' + %trim(p_zdesc) + '</option>'));
       endif;
       READE(NE) DL004_ RKWPDATA;
       RS004_ = RcdSts2_('GETNXTRCD':%error:%found:%eof);
       AM004_ = CV_ByKey;
       enddo;
      /end-free
     c     *PSSR         begsr
     c                   endsr
     P                 E


     P*---------------------------------------------------------------------
     P* psold2box0...               - User defined function
     P*---------------------------------------------------------------------
     P psold2box0...
     P                 B
     D psold2box0...
     D                 PI




      /free
       OutWeb_('<select name="PRODSOLD2" id="PRODSOLD2" onchange="showOtherRo-
       ws();">');
       OutWeb_('<option value=""></option>');
       p_ztype = 'PRODSOLD';
       SETLL  DL004_ RKWPDATA;
       RS004_ = RcdSts2_('POSRCD':%error:%equal:%eof);
       READE(NE) DL004_ RKWPDATA;
       RS004_ = RcdSts2_('GETNXTRCD':%error:%found:%eof);
       AM004_ = CV_ByKey;
       dow (RS004_ = '1');
       pddtype = 'PRODSOLD2';
       pddcode = p_zkeya;
       AM008_ = CV_BYKEY;
       CHAIN(NE) DL008_ RKWPDDATA;
       RS008_ = RcdSts2_('GETRCD': %error: %found: %eof);
       if (RS008_ = '1');
        OutWeb_(%trimr( '<option selected value="' + %trim(p_zkeya) + '/' +
       %trim(p_zdesc) + '">' + %trim(p_zdesc) + '</option>'));
       else;
        OutWeb_(%trimr( '<option value="' + %trim(p_zkeya) + '/' + %trim(
       p_zdesc) + '">' + %trim(p_zdesc) + '</option>'));
       endif;
       READE(NE) DL004_ RKWPDATA;
       RS004_ = RcdSts2_('GETNXTRCD':%error:%found:%eof);
       AM004_ = CV_ByKey;
       enddo;
      /end-free
     c     *PSSR         begsr
     c                   endsr
     P                 E


     P*---------------------------------------------------------------------
     P* psold3box0...               - User defined function
     P*---------------------------------------------------------------------
     P psold3box0...
     P                 B
     D psold3box0...
     D                 PI




      /free
       OutWeb_('<select name="PRODSOLD3" id="PRODSOLD3" onchange="showOtherRo-
       ws();">');
       OutWeb_('<option value=""></option>');
       p_ztype = 'PRODSOLD';
       SETLL  DL004_ RKWPDATA;
       RS004_ = RcdSts2_('POSRCD':%error:%equal:%eof);
       READE(NE) DL004_ RKWPDATA;
       RS004_ = RcdSts2_('GETNXTRCD':%error:%found:%eof);
       AM004_ = CV_ByKey;
       dow (RS004_ = '1');
       pddtype = 'PRODSOLD3';
       pddcode = p_zkeya;
       AM008_ = CV_BYKEY;
       CHAIN(NE) DL008_ RKWPDDATA;
       RS008_ = RcdSts2_('GETRCD': %error: %found: %eof);
       if (RS008_ = '1');
        OutWeb_(%trimr( '<option selected value="' + %trim(p_zkeya) + '/' +
       %trim(p_zdesc) + '">' + %trim(p_zdesc) + '</option>'));
       else;
        OutWeb_(%trimr( '<option value="' + %trim(p_zkeya) + '/' + %trim(
       p_zdesc) + '">' + %trim(p_zdesc) + '</option>'));
       endif;
       READE(NE) DL004_ RKWPDATA;
       RS004_ = RcdSts2_('GETNXTRCD':%error:%found:%eof);
       AM004_ = CV_ByKey;
       enddo;
      /end-free
     c     *PSSR         begsr
     c                   endsr
     P                 E


     P*---------------------------------------------------------------------
     P* wrtstateofbus0...           - User defined function
     P*---------------------------------------------------------------------
     P wrtstateofbus0...
     P                 B
     D wrtstateofbus0...
     D                 PI




      /free
       p_ztype = 'STATECODE';
       SETLL  DL004_ RKWPDATA;
       RS004_ = RcdSts2_('POSRCD':%error:%equal:%eof);
       READE(NE) DL004_ RKWPDATA;
       RS004_ = RcdSts2_('GETNXTRCD':%error:%found:%eof);
       AM004_ = CV_ByKey;
       dow (RS004_ = '1');
       pddtype = 'STATE';
       pddcode = p_zkeya;
       AM008_ = CV_BYKEY;
       CHAIN(E) DL008_ RKWPDDATA;
       RS008_ = RcdSts2_('GETRCD': %error: %found: %eof);
       if (RS008_ = '1');
        OutWeb_(%trimr( '<tr><td><input checked type="checkbox" class="checkB-
       ox" name="STATE" value="' + %trim(p_zkeya) + '/' + %trim(p_zdesc) + '"-
       >&nbsp;&nbsp;' +
        %trim(p_zdesc) + '</td></tr>'));
       else;
        OutWeb_(%trimr( '<tr><td><input type="checkbox" class="checkBox" name-
       ="STATE" value="' + %trim(p_zkeya) + '/' + %trim(p_zdesc) + '">&nbsp;&-
       nbsp;' +
        %trim(p_zdesc) + '</td></tr>'));
       endif;
       READE(NE) DL004_ RKWPDATA;
       RS004_ = RcdSts2_('GETNXTRCD':%error:%found:%eof);
       AM004_ = CV_ByKey;
       enddo;
      /end-free
     c     *PSSR         begsr
     c                   endsr
     P                 E


     P*---------------------------------------------------------------------
     P* wrtloantypes0...            - User defined function
     P*---------------------------------------------------------------------
     P wrtloantypes0...
     P                 B
     D wrtloantypes0...
     D                 PI




      /free
       pprod = '';
       SETLL  DL007_ RKWPPBASE;
       RS007_ = RcdSts2_('POSRCD':%error:%equal:%eof);
       READ(NE)  RKWPPBASE;
       RS007_ = RcdSts2_('GETNXTRCD':%error:%found:%eof);
       AM007_ = CV_ByKey;
       dow (RS007_ = '1');
       pddtype = 'LNPROD';
       pddcode = pprod;
       AM008_ = CV_BYKEY;
       CHAIN(E) DL008_ RKWPDDATA;
       RS008_ = RcdSts2_('GETRCD': %error: %found: %eof);
       if (RS008_ = '1');
        OutWeb_(%trimr( '<tr><td><input checked type="checkbox" class="checkB-
       ox" name="LNPROD" value="' + %trim(pprod) + '/' + %trim(ppdesc) + '">&-
       nbsp;&nbsp;' +
        %trim(ppdesc) + '</td></tr>'));
       else;
        OutWeb_(%trimr( '<tr><td><input type="checkbox" class="checkBox" name-
       ="LNPROD" value="' + %trim(pprod) + '/' + %trim(ppdesc) + '">&nbsp;&nb-
       sp;' +
        %trim(ppdesc) + '</td></tr>'));
       endif;
       READ(NE)  RKWPPBASE;
       RS007_ = RcdSts2_('GETNXTRCD':%error:%found:%eof);
       AM007_ = CV_ByKey;
       enddo;
      /end-free
     c     *PSSR         begsr
     c                   endsr
     P                 E


     P*---------------------------------------------------------------------
     P* wrtprodbox0...              - User defined function
     P*---------------------------------------------------------------------
     P wrtprodbox0...
     P                 B
     D wrtprodbox0...
     D                 PI




      /free
       p_ztype = 'KWPPBASE';
       boxname = 'PDPROD';
       boxid = 'PDPROD';
       boxselect = pdprod;
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
       pprod = ' ';
       SETLL  DL007_ RKWPPBASE;
       RS007_ = RcdSts2_('POSRCD':%error:%equal:%eof);
       READ(NE)  RKWPPBASE;
       RS007_ = RcdSts2_('GETNXTRCD':%error:%found:%eof);
       AM007_ = CV_ByKey;
       dow (RS007_ = '1');
       OutWeb_('<option value="');
       OutWeb_(%trimr(pprod));
       OutWeb_('"');
       if (pdprod = pprod);
        OutWeb_(' selected');
       endif;
       OutWeb_('>');
       OutWeb_(%trimr(ppdesc));
       OutWeb_('</option>');
       READ(NE)  RKWPPBASE;
       RS007_ = RcdSts2_('GETNXTRCD':%error:%found:%eof);
       AM007_ = CV_ByKey;
       enddo;
       OutWeb_('</select>');
      /end-free
     c     *PSSR         begsr
     c                   endsr
     P                 E


     P*---------------------------------------------------------------------
     P* offselyesno0...             - User defined function
     P*---------------------------------------------------------------------
     P offselyesno0...
     P                 B
     D offselyesno0...
     D                 PI




      /free
       p_ztype = 'YESNO';
       boxname = 'SELOFFICE';
       boxid = 'SELOFFICE';
       boxselect = seloffice;
       boxtype = 'SYSTEM';
       jvalidation = ' ';
      /end-free
     C                   EVAL      QPGM__=%trim('KWWEB'     ) + '/' + 'SELBOX2'
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
     P* pdlocbox0...                - User defined function
     P*---------------------------------------------------------------------
     P pdlocbox0...
     P                 B
     D pdlocbox0...
     D                 PI




      /free
       p_ztype = 'KWPLBASE';
       boxname = 'PDLOC';
       boxid = 'PDLOC';
       boxselect = %trim(%editc(PDLOC:'P'));
       boxtype = ' ';
       jvalidation = ' ';
      /end-free
     C                   EVAL      QPGM__=%trim('KWWEB'     ) + '/' + 'SELBOX2'
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
     P* dealersign0...              - User defined function
     P*---------------------------------------------------------------------
     P dealersign0...
     P                 B
     D dealersign0...
     D                 PI




      /free
       Pdloc = 0;
       AM002_ = CV_BYKEY;
       CHAIN(NE) DL002_ RKWPDLOC;
       RS002_ = RcdSts2_('GETRCD': %error: %found: %eof);
       pddtype = 'CUSTOMER';
       pddcode = '';
       pddchar = '';
       AM008_ = CV_BYKEY;
       CHAIN(E) codekey RKWPDDATA;
       RS008_ = RcdSts2_('GETRCD': %error: %found: %eof);
       if (RS008_ <> '1');
        Ccust = KW_getcustno(0:PDTIN);
        pddcode = %trim(%editc(Ccust:'P'));
        WRITE RKWPDDATA;
        RS008_ = RcdSts2_('WRTRCD': %error: %found: %eof);
       endif;
       if (RS008_ = '1');
        Ccust = %dec(aton_(pddcode:46:16):46:16);
        AM014_ = CV_BYKEY;
        CHAIN(NE) DL014_ RKWCBASE;
        RS014_ = RcdSts2_('GETRCD': %error: %found: %eof);
        if (((RS014_ <> '1') or (0 = Ccust)));
         Ccust = KW_getcustno(0:PDTIN);
         pddcode = %trim(%editc(Ccust:'P'));
         RS008_ = UpdateRcd_('RKWPDDATA');
        endif;
       endif;
       AM014_ = CV_BYKEY;
       CHAIN(E) DL014_ RKWCBASE;
       RS014_ = RcdSts2_('GETRCD': %error: %found: %eof);
       AM016_ = CV_BYKEY;
       CHAIN(E) DL016_ RKWCNAME;
       RS016_ = RcdSts2_('GETRCD': %error: %found: %eof);
       Cadate = CURISOD__;
       AM015_ = CV_BYKEY;
       CHAIN(E) DL015_ RKWCADDR;
       RS015_ = RcdSts2_('GETRCD': %error: %found: %eof);
       Cbr = 1;
       cbp = '2';
       dsname = getparm3_('dsname':'*OPT');
       pruletype = 'SYSTEM';
       prulename = 'ESIGNDLROWNER';
       AM018_ = CV_BYKEY;
       CHAIN(E) DL018_ RKWPRULE;
       RS018_ = RcdSts2_('GETRCD': %error: %found: %eof);
       if ((((RS018_ = '1') and (pruleyesno = 'Y') and (dsname <> ''))));
        cname = dsname;
       else;
        cname = pdname;
       endif;
       caddr1 = pdadr1;
       caddr2 = pdadr2;
       ccity = pdcity;
       cst = pdst;
       Czip = Pdzip;
       ctint = 'T';
       RS014_ = UpdateRcd_('RKWCBASE');
       RS016_ = UpdateRcd_('RKWCNAME');
       if (RS015_ = '1');
        RS015_ = UpdateRcd_('RKWCADDR');
       else;
        WRITE RKWCADDR;
        RS015_ = RcdSts2_('WRTRCD': %error: %found: %eof);
       endif;
       signemail = pdemail;
       custemail0();
      /end-free
     c     *PSSR         begsr
     c                   endsr
     P                 E


     P*---------------------------------------------------------------------
     P* custemail0...               - User defined function
     P*---------------------------------------------------------------------
     P custemail0...
     P                 B
     D custemail0...
     D                 PI




      /free
       conttype = 'HOME';
       pruletype = 'SYSTEM';
       prulename = 'CONTACTTYPEEMAIL';
       AM018_ = CV_BYKEY;
       CHAIN(NE) DL018_ RKWPRULE;
       RS018_ = RcdSts2_('GETRCD': %error: %found: %eof);
       if ((((RS018_ = '1')) and ((pruleyesno = 'Y'))));
        conttype = 'EMAIL';
       endif;
       AM013_ = CV_BYKEY;
       CHAIN(E) DL013_ RKWCCONT;
       RS013_ = RcdSts2_('GETRCD': %error: %found: %eof);
       Cphone = Pdphon;
       Cext = 0;
       Ccell = 0;
       cemail = signemail;
       if (RS013_ = '1');
        RS013_ = UpdateRcd_('RKWCCONT');
       else;
        WRITE RKWCCONT;
        RS013_ = RcdSts2_('WRTRCD': %error: %found: %eof);
       endif;
      /end-free
     c     *PSSR         begsr
     c                   endsr
     P                 E


     P*---------------------------------------------------------------------
     P* decmodbox0...               - User defined function
     P*---------------------------------------------------------------------
     P decmodbox0...
     P                 B
     D decmodbox0...
     D                 PI



     D svmodel         S                   LIKE(pdmodel       )

      /free
       boxname = 'PDMODEL';
       boxid = 'PDMODEL';
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
       OutWeb_('<option value="">Use product settings</option>');
       svmodel = pdmodel;
       pdmodel = '';
       SETLL  DL017_ RKWPDECMOD;
       RS017_ = RcdSts2_('POSRCD':%error:%equal:%eof);
       READ(NE)  RKWPDECMOD;
       RS017_ = RcdSts2_('GETNXTRCD':%error:%found:%eof);
       AM017_ = CV_ByKey;
       dow (RS017_ = '1');
       if ( %subst(pdmodel: %len(%trimr( %trim(pdmodel))) - 2:3) <> 'REV');
        OutWeb_('<option value="');
        OutWeb_(%trimr(pdmodel));
        OutWeb_('"');
        if (pdmodel = svmodel);
         OutWeb_(' selected');
        endif;
        OutWeb_('>');
        OutWeb_(%trimr(pddesc));
        OutWeb_('</option>');
       endif;
       READ(NE)  RKWPDECMOD;
       RS017_ = RcdSts2_('GETNXTRCD':%error:%found:%eof);
       AM017_ = CV_ByKey;
       enddo;
       OutWeb_('</select>');
       pdmodel = svmodel;
      /end-free
     c     *PSSR         begsr
     c                   endsr
     P                 E


     P*---------------------------------------------------------------------
     P* webmodbox0...               - User defined function
     P*---------------------------------------------------------------------
     P webmodbox0...
     P                 B
     D webmodbox0...
     D                 PI



     D svmodel         S                   LIKE(pdmodel       )
     D svwmodel        S                   LIKE(pdmodel       )

      /free
       boxname = 'WEBMODEL';
       boxid = 'WEBMODEL';
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
       OutWeb_('<option value="">Use store model</option>');
       svmodel = pdmodel;
       svwmodel = webmodel;
       pdmodel = '';
       SETLL  DL017_ RKWPDECMOD;
       RS017_ = RcdSts2_('POSRCD':%error:%equal:%eof);
       READ(NE)  RKWPDECMOD;
       RS017_ = RcdSts2_('GETNXTRCD':%error:%found:%eof);
       AM017_ = CV_ByKey;
       dow (RS017_ = '1');
       OutWeb_('<option value="');
       OutWeb_(%trimr(pdmodel));
       OutWeb_('"');
       if (pdmodel = svwmodel);
        OutWeb_(' selected');
       endif;
       OutWeb_('>');
       OutWeb_(%trimr(pddesc));
       OutWeb_('</option>');
       READ(NE)  RKWPDECMOD;
       RS017_ = RcdSts2_('GETNXTRCD':%error:%found:%eof);
       AM017_ = CV_ByKey;
       enddo;
       OutWeb_('</select>');
       pdmodel = svmodel;
      /end-free
     c     *PSSR         begsr
     c                   endsr
     P                 E


     P*---------------------------------------------------------------------
     P* eftbatchbox0...             - User defined function
     P*---------------------------------------------------------------------
     P eftbatchbox0...
     P                 B
     D eftbatchbox0...
     D                 PI




      /free
       boxtype = 'SYSTEM';
       p_ztype = 'YESNO';
       boxname = 'EFTBATCH';
       boxid = 'EFTBATCH';
       boxselect = eftbatch;
       jvalidation = '';
      /end-free
     C                   EVAL      QPGM__=%trim('KWWEB'     ) + '/' + 'SELBOX2'
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
     P* donotfundbox0...            - User defined function
     P*---------------------------------------------------------------------
     P donotfundbox0...
     P                 B
     D donotfundbox0...
     D                 PI




      /free
       boxtype = 'SYSTEM';
       p_ztype = 'YESNO';
       boxname = 'DONOTFUND';
       boxid = 'DONOTFUND';
       boxselect = donotfund;
       jvalidation = '';
      /end-free
     C                   EVAL      QPGM__=%trim('KWWEB'     ) + '/' + 'SELBOX2'
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
     P* emailstatusbox0...          - User defined function
     P*---------------------------------------------------------------------
     P emailstatusbox0...
     P                 B
     D emailstatusbox0...
     D                 PI




      /free
       boxtype = 'SYSTEM';
       p_ztype = 'YESNO';
       boxname = 'EMAILSTYN';
       boxid = 'EMAILSTYN';
       boxselect = emailstyn;
       jvalidation = '';
      /end-free
     C                   EVAL      QPGM__=%trim('KWWEB'     ) + '/' + 'SELBOX2'
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
     P* rtoynbox0...                - User defined function
     P*---------------------------------------------------------------------
     P rtoynbox0...
     P                 B
     D rtoynbox0...
     D                 PI




      /free
       p_ztype = 'YESNO';
       boxname = 'RTOYESNO';
       boxid = 'RTOYESNO';
       boxselect = rtoyesno;
       boxtype = 'SYSTEM';
       jvalidation = ' ';
      /end-free
     C                   EVAL      QPGM__=%trim('KWWEB'     ) + '/' + 'SELBOX2'
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
     P* stipgrpbox0...              - User defined function
     P*---------------------------------------------------------------------
     P stipgrpbox0...
     P                 B
     D stipgrpbox0...
     D                 PI



     D short_ztype     S                   LIKE(p_ztype       )

      /free
       OutWeb_('<select name="STIPGRP" id="STIPGRP">');
      /end-free
     C/Exec SQL
     C+  declare sgrps scroll cursor for select				distinct p_ztype from kwp_dat
     C+ a where p_ztype like 'GSTP.%'
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
       OutWeb_('<option value=''''></option>');
       dow (((sqlcod <> 100) and (sqlcod >= 0)));
       short_ztype = %subst(p_ztype:6:10);
       if (stipgrp = p_ztype);
        OutWeb_(%trimr( '<option selected value="' + %trim(p_ztype) + '">' +
       %trim(short_ztype) + '</option>'));
       else;
        OutWeb_(%trimr( '<option value="' + %trim(p_ztype) + '">' + %trim(
       short_ztype) + '</option>'));
       endif;
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
       OutWeb_('</select>');
      /end-free
     c     *PSSR         begsr
     c                   endsr
     P                 E


     P*---------------------------------------------------------------------
     P* signtypebox0...             - User defined function
     P*---------------------------------------------------------------------
     P signtypebox0...
     P                 B
     D signtypebox0...
     D                 PI




      /free
       OutWeb_('<select name="SIGNTYPE" id="SIGNTYPE" onChange="updateVal(thi-
       s);" size="1">');
       OutWeb_('<option value=""></option>');
       if (signtype = 'ESIGN');
        OutWeb_(%trimr( '<option value="' + 'ESIGN' + '" selected>' + 'Electr-
       onic Signing' + '</option>'));
       else;
        OutWeb_(%trimr( '<option value="' + 'ESIGN' + '">' + 'Electronic Sign-
       ing' + '</option>'));
       endif;
       if (signtype = 'PRINTDOC');
        OutWeb_(%trimr( '<option value="' + 'PRINTDOC' + '" selected>' + 'Pri-
       nt Docs' + '</option>'));
       else;
        OutWeb_(%trimr( '<option value="' + 'PRINTDOC' + '">' + 'Print Docs'
       + '</option>'));
       endif;
       if (signtype = 'SIGNPAD');
        OutWeb_(%trimr( '<option value="' + 'SIGNPAD' + '" selected>' + 'Sign-
       ature Pad' + '</option>'));
       else;
        OutWeb_(%trimr( '<option value="' + 'SIGNPAD' + '">' + 'Signature Pad-
       ' + '</option>'));
       endif;
       if (signtype = 'ESIGNONLY');
        OutWeb_(%trimr( '<option value="' + 'ESIGNONLY' + '" selected>' + 'El-
       ectronic Signing Only' + '</option>'));
       else;
        OutWeb_(%trimr( '<option value="' + 'ESIGNONLY' + '">' + 'Electronic -
       Signing Only' + '</option>'));
       endif;
       OutWeb_('</select>');
      /end-free
     c     *PSSR         begsr
     c                   endsr
     P                 E


     P*---------------------------------------------------------------------
     P* dlrstynbox0...              - User defined function
     P*---------------------------------------------------------------------
     P dlrstynbox0...
     P                 B
     D dlrstynbox0...
     D                 PI




      /free
       pddtype = 'DLRINPUT';
       pddcode = 'DLRSTYN';
       AM008_ = CV_BYKEY;
       CHAIN(NE) DL008_ RKWPDDATA;
       RS008_ = RcdSts2_('GETRCD': %error: %found: %eof);
       if (RS008_ = '1');
        boxselect = %subst(pddchar:1:1);
       else;
        boxselect = 'N';
       endif;
       boxtype = 'SYSTEM';
       p_ztype = 'YESNO';
       boxname = 'DLRSTYN';
       boxid = 'DLRSTYN';
       jvalidation = '';
      /end-free
     C                   EVAL      QPGM__=%trim('KWWEB'     ) + '/' + 'SELBOX2'
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
     P* categorybox0...             - User defined function
     P*---------------------------------------------------------------------
     P categorybox0...
     P                 B
     D categorybox0...
     D                 PI




      /free
       OutWeb_('<select name="CATEGORY" id="CATEGORY" onchange="">');
       OutWeb_('<option value=""></option>');
       pddtype = 'DLRINPUT';
       pddcode = 'CATEGORY';
       AM008_ = CV_BYKEY;
       CHAIN(NE) DL008_ RKWPDDATA;
       RS008_ = RcdSts2_('GETRCD': %error: %found: %eof);
       if (RS008_ = '1');
        if ( %trim(pddchar) = '1');
         OutWeb_('<option selected value="1">Category 1</option>');
        else;
         OutWeb_('<option value="1">Caregory 1</option>');
        endif;
        if ( %trim(pddchar) = '2');
         OutWeb_('<option selected value="2">Category 2</option>');
        else;
         OutWeb_('<option value="2">Caregory 2</option>');
        endif;
        if ( %trim(pddchar) = '3');
         OutWeb_('<option selected value="3">Category 3</option>');
        else;
         OutWeb_('<option value="3">Caregory 3</option>');
        endif;
        if ( %trim(pddchar) = '4');
         OutWeb_('<option selected value="4">Category 4</option>');
        else;
         OutWeb_('<option value="4">Caregory 4</option>');
        endif;
       else;
        OutWeb_('<option value="1">Category 1</option>');
        OutWeb_('<option value="2">Category 2</option>');
        OutWeb_('<option value="3">Category 3</option>');
        OutWeb_('<option value="4">Category 4</option>');
       endif;
       OutWeb_('</select>');
      /end-free
     c     *PSSR         begsr
     c                   endsr
     P                 E


     P*---------------------------------------------------------------------
     P* new_app_box0...             - User defined function
     P*---------------------------------------------------------------------
     P new_app_box0...
     P                 B
     D new_app_box0...
     D                 PI




      /free
       OutWeb_('<select name="NEWAPP" id="NEWAPP" onchange="">');
       OutWeb_('<option value=""></option>');
       pddtype = 'DLRINPUT';
       pddcode = 'NEWAPP';
       AM008_ = CV_BYKEY;
       CHAIN(NE) DL008_ RKWPDDATA;
       RS008_ = RcdSts2_('GETRCD': %error: %found: %eof);
       if (RS008_ = '1');
        if ( %trim(pddchar) = 'L');
         OutWeb_('<option selected value="L">Legacy Websmart</option>');
        else;
         OutWeb_('<option value="L">Legacy Websmart</option>');
        endif;
        if ( %trim(pddchar) = 'O');
         OutWeb_('<option selected value="O">Original PHP</option>');
        else;
         OutWeb_('<option value="O">Original PHP</option>');
        endif;
        if ( %trim(pddchar) = 'N');
         OutWeb_('<option selected value="N">PHP mobile</option>');
        else;
         OutWeb_('<option value="N">PHP mobile</option>');
        endif;
       else;
        OutWeb_('<option value="L">Legacy Websmart</option>');
        OutWeb_('<option value="O">Original PHP</option>');
        OutWeb_('<option value="N">PHP mobile</option>');
       endif;
       OutWeb_('</select>');
      /end-free
     c     *PSSR         begsr
     c                   endsr
     P                 E


     P*---------------------------------------------------------------------
     P* new_sapp_box0...            - User defined function
     P*---------------------------------------------------------------------
     P new_sapp_box0...
     P                 B
     D new_sapp_box0...
     D                 PI




      /free
       OutWeb_('<select name="NEWSUPAPP" id="NEWSUPAPP" onchange="">');
       OutWeb_('<option value=""></option>');
       pddtype = 'DLRINPUT';
       pddcode = 'NEWSUPAPP';
       AM008_ = CV_BYKEY;
       CHAIN(NE) DL008_ RKWPDDATA;
       RS008_ = RcdSts2_('GETRCD': %error: %found: %eof);
       if (RS008_ = '1');
        if ( %trim(pddchar) = 'S');
         OutWeb_('<option selected value="S">(default) Standard Installment/R-
       TO</option>');
        else;
         OutWeb_('<option value="S">(default) Standard Installment/RTO</optio-
       n>');
        endif;
        if ( %trim(pddchar) = 'C');
         OutWeb_('<option selected value="C">Installment - New Calc</option>');
        else;
         OutWeb_('<option value="C">Installment - New Calc</option>');
        endif;
        if ( %trim(pddchar) = 'P');
         OutWeb_('<option selected value="P">Itemization-NEW</option>');
        else;
         OutWeb_('<option value="P">Itemization-NEW</option>');
        endif;
        if ( %trim(pddchar) = 'O');
         OutWeb_('<option selected value="O">Itemization-OLD</option>');
        else;
         OutWeb_('<option value="O">Itemization-OLD</option>');
        endif;
       else;
        OutWeb_('<option value="S">(default) Standard Installment/RTO</option-
       >');
        OutWeb_('<option value="C">Installment - New Calc</option>');
        OutWeb_('<option value="P">Itemization-NEW</option>');
        OutWeb_('<option value="O">Itemization-OLD</option>');
       endif;
       OutWeb_('</select>');
      /end-free
     c     *PSSR         begsr
     c                   endsr
     P                 E


     P*---------------------------------------------------------------------
     P* gas_cash_box0...            - User defined function
     P*---------------------------------------------------------------------
     P gas_cash_box0...
     P                 B
     D gas_cash_box0...
     D                 PI




      /free
       OutWeb_('<select name="GASCASH" id="GASCASH" onchange="">');
       OutWeb_('<option value=""></option>');
       pddtype = 'DLRTYPE';
       pddcode = 'GASCASH';
       AM008_ = CV_BYKEY;
       CHAIN(NE) DL008_ RKWPDDATA;
       RS008_ = RcdSts2_('GETRCD': %error: %found: %eof);
       if (RS008_ = '1');
        if ( %trim(pddchar) = 'Y');
         OutWeb_('<option selected value="Y">Yes</option>');
         OutWeb_('<option value="N">No</option>');
        else;
         OutWeb_('<option value="Y">Yes</option>');
         OutWeb_('<option selected value="N">No</option>');
        endif;
       else;
        OutWeb_('<option value="Y">Yes</option>');
        OutWeb_('<option value="N">No</option>');
       endif;
       OutWeb_('</select>');
      /end-free
     c     *PSSR         begsr
     c                   endsr
     P                 E


     P*---------------------------------------------------------------------
     P* new_ll_box0...              - User defined function
     P*---------------------------------------------------------------------
     P new_ll_box0...
     P                 B
     D new_ll_box0...
     D                 PI




      /free
       OutWeb_('<select name="NEWLL" id="NEWLL" onchange="">');
       OutWeb_('<option value=""></option>');
       pddtype = 'DLRINPUT';
       pddcode = 'NEWLL';
       AM008_ = CV_BYKEY;
       CHAIN(NE) DL008_ RKWPDDATA;
       RS008_ = RcdSts2_('GETRCD': %error: %found: %eof);
       if (RS008_ = '1');
        if ( %trim(pddchar) = 'Y');
         OutWeb_('<option selected value="Y">Yes</option>');
         OutWeb_('<option value="N">No</option>');
        else;
         OutWeb_('<option value="Y">Yes</option>');
         OutWeb_('<option selected value="N">No</option>');
        endif;
       else;
        OutWeb_('<option value="Y">Yes</option>');
        OutWeb_('<option value="N">No</option>');
       endif;
       OutWeb_('</select>');
      /end-free
     c     *PSSR         begsr
     c                   endsr
     P                 E


     P*---------------------------------------------------------------------
     P* proc_ov_box0...             - User defined function
     P*---------------------------------------------------------------------
     P proc_ov_box0...
     P                 B
     D proc_ov_box0...
     D                 PI




      /free
       OutWeb_('<select name="PROCOV" id="PROCOV" onchange="">');
       OutWeb_('<option value=""></option>');
       pddtype = 'DLRINPUT';
       pddcode = 'PROCOV';
       AM008_ = CV_BYKEY;
       CHAIN(NE) DL008_ RKWPDDATA;
       RS008_ = RcdSts2_('GETRCD': %error: %found: %eof);
       if (RS008_ = '1');
        if ( %trim(pddchar) = 'Y');
         OutWeb_('<option selected value="Y">Yes</option>');
         OutWeb_('<option value="N">No</option>');
        else;
         OutWeb_('<option value="Y">Yes</option>');
         OutWeb_('<option selected value="N">No</option>');
        endif;
       else;
        OutWeb_('<option value="Y">Yes</option>');
        OutWeb_('<option value="N">No</option>');
       endif;
       OutWeb_('</select>');
      /end-free
     c     *PSSR         begsr
     c                   endsr
     P                 E


     P*---------------------------------------------------------------------
     P* new_ibvr_box0...            - User defined function
     P*---------------------------------------------------------------------
     P new_ibvr_box0...
     P                 B
     D new_ibvr_box0...
     D                 PI




      /free
       OutWeb_('<select name="NEWIBVR" id="NEWIBVR" onchange="">');
       OutWeb_('<option value=""></option>');
       pddtype = 'DLRINPUT';
       pddcode = 'APITOKEN';
       AM008_ = CV_BYKEY;
       CHAIN(NE) DL008_ RKWPDDATA;
       RS008_ = RcdSts2_('GETRCD': %error: %found: %eof);
       if (RS008_ = '1');
        if ( %trim(pddchar) = 'Y');
         OutWeb_('<option selected value="Y">Yes</option>');
         OutWeb_('<option value="N">No</option>');
        else;
         OutWeb_('<option value="Y">Yes</option>');
         OutWeb_('<option selected value="N">No</option>');
        endif;
       else;
        OutWeb_('<option value="Y">Yes</option>');
        OutWeb_('<option value="N">No</option>');
       endif;
       OutWeb_('</select>');
      /end-free
     c     *PSSR         begsr
     c                   endsr
     P                 E


     P*---------------------------------------------------------------------
     P* dlrdbtbox0...               - User defined function
     P*---------------------------------------------------------------------
     P dlrdbtbox0...
     P                 B
     D dlrdbtbox0...
     D                 PI




      /free
       OutWeb_('<select name="DLRDBT" id="DLRDBT" onchange="">');
       OutWeb_('<option value=""></option>');
       pddtype = 'DLRINPUT';
       pddcode = 'DLRDBT';
       AM008_ = CV_BYKEY;
       CHAIN(NE) DL008_ RKWPDDATA;
       RS008_ = RcdSts2_('GETRCD': %error: %found: %eof);
       if (RS008_ = '1');
        if ( %trim(pddchar) = 'Y');
         OutWeb_('<option selected value="Y">Yes</option>');
         OutWeb_('<option value="N">No</option>');
        else;
         OutWeb_('<option value="Y">Yes</option>');
         OutWeb_('<option selected value="N">No</option>');
        endif;
       else;
        OutWeb_('<option value="Y" selected>Yes</option>');
        OutWeb_('<option value="N">No</option>');
       endif;
       OutWeb_('</select>');
      /end-free
     c     *PSSR         begsr
     c                   endsr
     P                 E


     P*---------------------------------------------------------------------
     P* pinbox0...                  - User defined function
     P*---------------------------------------------------------------------
     P pinbox0...
     P                 B
     D pinbox0...
     D                 PI




      /free
       OutWeb_('<select name="DLRPIN" id="DLRPIN" onchange="">');
       OutWeb_('<option value=""></option>');
       pddtype = 'DLRINPUT';
       pddcode = 'DLRPIN';
       AM008_ = CV_BYKEY;
       CHAIN(NE) DL008_ RKWPDDATA;
       RS008_ = RcdSts2_('GETRCD': %error: %found: %eof);
       if (RS008_ = '1');
        if ( %trim(pddchar) = 'Y');
         OutWeb_('<option selected value="Y">Yes</option>');
         OutWeb_('<option value="N">No</option>');
        else;
         OutWeb_('<option value="Y">Yes</option>');
         OutWeb_('<option selected value="N">No</option>');
        endif;
       else;
        OutWeb_('<option value="Y">Yes</option>');
        OutWeb_('<option value="N">No</option>');
       endif;
       OutWeb_('</select>');
      /end-free
     c     *PSSR         begsr
     c                   endsr
     P                 E


     P*---------------------------------------------------------------------
     P* pinsbox0...                 - User defined function
     P*---------------------------------------------------------------------
     P pinsbox0...
     P                 B
     D pinsbox0...
     D                 PI




      /free
       OutWeb_('<select name="SIGNPIN" id="SIGNPIN" onchange="">');
       OutWeb_('<option value=""></option>');
       pddtype = 'DLRINPUT';
       pddcode = 'SIGNPIN';
       AM008_ = CV_BYKEY;
       CHAIN(NE) DL008_ RKWPDDATA;
       RS008_ = RcdSts2_('GETRCD': %error: %found: %eof);
       if (RS008_ = '1');
        if ( %trim(pddchar) = 'Y');
         OutWeb_('<option selected value="Y">Yes</option>');
         OutWeb_('<option value="N">No</option>');
        else;
         OutWeb_('<option value="Y">Yes</option>');
         OutWeb_('<option selected value="N">No</option>');
        endif;
       else;
        OutWeb_('<option value="Y">Yes</option>');
        OutWeb_('<option value="N">No</option>');
       endif;
       OutWeb_('</select>');
      /end-free
     c     *PSSR         begsr
     c                   endsr
     P                 E


     P*---------------------------------------------------------------------
     P* cvvbox0...                  - User defined function
     P*---------------------------------------------------------------------
     P cvvbox0...
     P                 B
     D cvvbox0...
     D                 PI




      /free
       OutWeb_('<select name="DLRCVV" id="DLRCVV" onchange="">');
       OutWeb_('<option value=""></option>');
       pddtype = 'DLRINPUT';
       pddcode = 'DLRCVV';
       AM008_ = CV_BYKEY;
       CHAIN(NE) DL008_ RKWPDDATA;
       RS008_ = RcdSts2_('GETRCD': %error: %found: %eof);
       if (RS008_ = '1');
        if ( %trim(pddchar) = 'Y');
         OutWeb_('<option selected value="Y">Yes</option>');
         OutWeb_('<option value="N">No</option>');
        else;
         OutWeb_('<option value="Y">Yes</option>');
         OutWeb_('<option selected value="N">No</option>');
        endif;
       else;
        OutWeb_('<option value="Y">Yes</option>');
        OutWeb_('<option value="N">No</option>');
       endif;
       OutWeb_('</select>');
      /end-free
     c     *PSSR         begsr
     c                   endsr
     P                 E


     P*---------------------------------------------------------------------
     P* avsbox0...                  - User defined function
     P*---------------------------------------------------------------------
     P avsbox0...
     P                 B
     D avsbox0...
     D                 PI




      /free
       OutWeb_('<select name="AVSCHECK" id="AVSCHECK" onchange="">');
       OutWeb_('<option value=""></option>');
       pddtype = 'DLRINPUT';
       pddcode = 'AVSCHECK';
       AM008_ = CV_BYKEY;
       CHAIN(NE) DL008_ RKWPDDATA;
       RS008_ = RcdSts2_('GETRCD': %error: %found: %eof);
       if (RS008_ = '1');
        if ( %trim(pddchar) = 'Y');
         OutWeb_('<option selected value="Y">Yes</option>');
         OutWeb_('<option value="N">No</option>');
        else;
         OutWeb_('<option value="Y">Yes</option>');
         OutWeb_('<option selected value="N">No</option>');
        endif;
       else;
        OutWeb_('<option value="Y">Yes</option>');
        OutWeb_('<option value="N">No</option>');
       endif;
       OutWeb_('</select>');
      /end-free
     c     *PSSR         begsr
     c                   endsr
     P                 E


     P*---------------------------------------------------------------------
     P* ibvbox0...                  - User defined function
     P*---------------------------------------------------------------------
     P ibvbox0...
     P                 B
     D ibvbox0...
     D                 PI




      /free
       OutWeb_('<select name="IBV" id="IBV" onchange="">');
       OutWeb_('<option value=""></option>');
       pddtype = 'DLRINPUT';
       pddcode = 'IBV';
       AM008_ = CV_BYKEY;
       CHAIN(NE) DL008_ RKWPDDATA;
       RS008_ = RcdSts2_('GETRCD': %error: %found: %eof);
       if (RS008_ = '1');
        if ( %trim(pddchar) = 'Y');
         OutWeb_('<option selected value="Y">Yes</option>');
         OutWeb_('<option value="N">No</option>');
        else;
         OutWeb_('<option value="Y">Yes</option>');
         OutWeb_('<option selected value="N">No</option>');
        endif;
       else;
        OutWeb_('<option value="Y">Yes</option>');
        OutWeb_('<option value="N">No</option>');
       endif;
       OutWeb_('</select>');
      /end-free
     c     *PSSR         begsr
     c                   endsr
     P                 E


     P*---------------------------------------------------------------------
     P* walletbox0...               - User defined function
     P*---------------------------------------------------------------------
     P walletbox0...
     P                 B
     D walletbox0...
     D                 PI




      /free
       OutWeb_('<select name="WALLET" id="WALLET" onchange="">');
       OutWeb_('<option value=""></option>');
       pddtype = 'DLRINPUT';
       pddcode = 'WALLET';
       AM008_ = CV_BYKEY;
       CHAIN(NE) DL008_ RKWPDDATA;
       RS008_ = RcdSts2_('GETRCD': %error: %found: %eof);
       if (RS008_ = '1');
        if ( %trim(pddchar) = 'Y');
         OutWeb_('<option selected value="Y">Yes</option>');
         OutWeb_('<option value="N">No</option>');
        else;
         OutWeb_('<option value="Y">Yes</option>');
         OutWeb_('<option selected value="N">No</option>');
        endif;
       else;
        OutWeb_('<option value="Y">Yes</option>');
        OutWeb_('<option value="N">No</option>');
       endif;
       OutWeb_('</select>');
      /end-free
     c     *PSSR         begsr
     c                   endsr
     P                 E


     P*---------------------------------------------------------------------
     P* ibvwbox0...                 - User defined function
     P*---------------------------------------------------------------------
     P ibvwbox0...
     P                 B
     D ibvwbox0...
     D                 PI




      /free
       OutWeb_('<select name="IBVW" id="IBVW" onchange="">');
       OutWeb_('<option value=""></option>');
       pddtype = 'DLRINPUT';
       pddcode = 'IBVW';
       AM008_ = CV_BYKEY;
       CHAIN(NE) DL008_ RKWPDDATA;
       RS008_ = RcdSts2_('GETRCD': %error: %found: %eof);
       if (RS008_ = '1');
        if ( %trim(pddchar) = 'Y');
         OutWeb_('<option selected value="Y">Yes</option>');
         OutWeb_('<option value="N">No</option>');
        else;
         OutWeb_('<option value="Y">Yes</option>');
         OutWeb_('<option selected value="N">No</option>');
        endif;
       else;
        OutWeb_('<option value="Y">Yes</option>');
        OutWeb_('<option value="N">No</option>');
       endif;
       OutWeb_('</select>');
      /end-free
     c     *PSSR         begsr
     c                   endsr
     P                 E


     P*---------------------------------------------------------------------
     P* walletwbox0...              - User defined function
     P*---------------------------------------------------------------------
     P walletwbox0...
     P                 B
     D walletwbox0...
     D                 PI




      /free
       OutWeb_('<select name="WALLETW" id="WALLETW" onchange="">');
       OutWeb_('<option value=""></option>');
       pddtype = 'DLRINPUT';
       pddcode = 'WALLETW';
       AM008_ = CV_BYKEY;
       CHAIN(NE) DL008_ RKWPDDATA;
       RS008_ = RcdSts2_('GETRCD': %error: %found: %eof);
       if (RS008_ = '1');
        if ( %trim(pddchar) = 'Y');
         OutWeb_('<option selected value="Y">Yes</option>');
         OutWeb_('<option value="N">No</option>');
        else;
         OutWeb_('<option value="Y">Yes</option>');
         OutWeb_('<option selected value="N">No</option>');
        endif;
       else;
        OutWeb_('<option value="Y">Yes</option>');
        OutWeb_('<option value="N">No</option>');
       endif;
       OutWeb_('</select>');
      /end-free
     c     *PSSR         begsr
     c                   endsr
     P                 E


     P*---------------------------------------------------------------------
     P* dlrrepbox0...               - User defined function
     P*---------------------------------------------------------------------
     P dlrrepbox0...
     P                 B
     D dlrrepbox0...
     D                 PI




      /free
       OutWeb_('<select name="DLRREP" id="DLRREP" onchange="">');
       OutWeb_('<option value=""></option>');
       pddtype = 'DLRINPUT';
       pddcode = 'DLRREP';
       AM008_ = CV_BYKEY;
       CHAIN(NE) DL008_ RKWPDDATA;
       RS008_ = RcdSts2_('GETRCD': %error: %found: %eof);
       if (RS008_ = '1');
        if ( %trim(pddchar) = 'Y');
         OutWeb_('<option selected value="Y">Yes</option>');
         OutWeb_('<option value="N">No</option>');
        else;
         OutWeb_('<option value="Y">Yes</option>');
         OutWeb_('<option selected value="N">No</option>');
        endif;
       else;
        OutWeb_('<option value="Y">Yes</option>');
        OutWeb_('<option value="N">No</option>');
       endif;
       OutWeb_('</select>');
      /end-free
     c     *PSSR         begsr
     c                   endsr
     P                 E


     P*---------------------------------------------------------------------
     P* pdpgmbox0...                - User defined function
     P*---------------------------------------------------------------------
     P pdpgmbox0...
     P                 B
     D pdpgmbox0...
     D                 PI




      /free
       p_ztype = 'KWPPGM';
       boxname = 'PDPGM';
       boxid = 'PDPGM';
       boxselect = pdpgm;
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
       OutWeb_('<optgroup label="list1">');
       psprogram = ' ';
       SETLL  DL021_ RKWPPGM;
       RS021_ = RcdSts2_('POSRCD':%error:%equal:%eof);
       READ(NE)  RKWPPGM;
       RS021_ = RcdSts2_('GETNXTRCD':%error:%found:%eof);
       AM021_ = CV_ByKey;
       dow (RS021_ = '1');
       if (pspstatus = 'Y');
        OutWeb_('</optgroup>');
        OutWeb_('<optgroup label="list2">');
       endif;
       OutWeb_('<option value="');
       OutWeb_(%trimr(psprogram));
       OutWeb_('"');
       if (pdpgm = psprogram);
        OutWeb_(' selected');
       endif;
       OutWeb_('>');
       OutWeb_(%trimr(psprogram));
       OutWeb_('</option>');
       READ(NE)  RKWPPGM;
       RS021_ = RcdSts2_('GETNXTRCD':%error:%found:%eof);
       AM021_ = CV_ByKey;
       enddo;
       OutWeb_('</select>');
      /end-free
     c     *PSSR         begsr
     c                   endsr
     P                 E


     P*---------------------------------------------------------------------
     P* usaepayathbox0...           - User defined function
     P*---------------------------------------------------------------------
     P usaepayathbox0...
     P                 B
     D usaepayathbox0...
     D                 PI




      /free
       pddtype = 'DLRINPUT';
       pddcode = 'USAEPAYATH';
       AM008_ = CV_BYKEY;
       CHAIN(NE) DL008_ RKWPDDATA;
       RS008_ = RcdSts2_('GETRCD': %error: %found: %eof);
       if (RS008_ = '1');
        boxselect = %subst(pddchar:1:1);
       else;
        boxselect = 'N';
       endif;
       boxtype = 'SYSTEM';
       p_ztype = 'YESNO';
       boxname = 'USAEPAYATH';
       boxid = 'USAEPAYATH';
       jvalidation = '';
      /end-free
     C                   EVAL      QPGM__=%trim('KWWEB'     ) + '/' + 'SELBOX2'
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
     P* cashpmtbox0...              - User defined function
     P*---------------------------------------------------------------------
     P cashpmtbox0...
     P                 B
     D cashpmtbox0...
     D                 PI




      /free
       pddtype = 'DLRINPUT';
       pddcode = 'CASHPMT';
       AM008_ = CV_BYKEY;
       CHAIN(NE) DL008_ RKWPDDATA;
       RS008_ = RcdSts2_('GETRCD': %error: %found: %eof);
       if (RS008_ = '1');
        boxselect = %subst(pddchar:1:1);
       else;
        boxselect = 'N';
       endif;
       boxtype = 'SYSTEM';
       p_ztype = 'YESNO';
       boxname = 'CASHPMT';
       boxid = 'CASHPMT';
       jvalidation = '';
      /end-free
     C                   EVAL      QPGM__=%trim('KWWEB'     ) + '/' + 'SELBOX2'
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
     P* salestaxbox0...             - User defined function
     P*---------------------------------------------------------------------
     P salestaxbox0...
     P                 B
     D salestaxbox0...
     D                 PI




      /free
       pddtype = 'DLRINPUT';
       pddcode = 'SALESTAX';
       AM008_ = CV_BYKEY;
       CHAIN(NE) DL008_ RKWPDDATA;
       RS008_ = RcdSts2_('GETRCD': %error: %found: %eof);
       if (RS008_ = '1');
        boxselect = %subst(pddchar:1:1);
       else;
        boxselect = 'N';
       endif;
       boxtype = 'SYSTEM';
       p_ztype = 'YESNO';
       boxname = 'SALESTAX';
       boxid = 'SALESTAX';
       jvalidation = '';
      /end-free
     C                   EVAL      QPGM__=%trim('KWWEB'     ) + '/' + 'SELBOX2'
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
     P* autotaxbox0...              - User defined function
     P*---------------------------------------------------------------------
     P autotaxbox0...
     P                 B
     D autotaxbox0...
     D                 PI




      /free
       pddtype = 'DLRINPUT';
       pddcode = 'AUTOTAX';
       AM008_ = CV_BYKEY;
       CHAIN(NE) DL008_ RKWPDDATA;
       RS008_ = RcdSts2_('GETRCD': %error: %found: %eof);
       if (RS008_ = '1');
        boxselect = %subst(pddchar:1:1);
       else;
        boxselect = 'N';
       endif;
       boxtype = 'SYSTEM';
       p_ztype = 'YESNO';
       boxname = 'AUTOTAX';
       boxid = 'AUTOTAX';
       jvalidation = '';
      /end-free
     C                   EVAL      QPGM__=%trim('KWWEB'     ) + '/' + 'SELBOX2'
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
     P* ficoynbox0...               - User defined function
     P*---------------------------------------------------------------------
     P ficoynbox0...
     P                 B
     D ficoynbox0...
     D                 PI




      /free
       OutWeb_('<select name="FICOYN" id="FICOYN" onchange="">');
       OutWeb_('<option value=""></option>');
       pddtype = 'DLRINPUT';
       pddcode = 'FICOYN';
       AM008_ = CV_BYKEY;
       CHAIN(NE) DL008_ RKWPDDATA;
       RS008_ = RcdSts2_('GETRCD': %error: %found: %eof);
       if (RS008_ = '1');
        if ( %trim(pddchar) = 'Y');
         OutWeb_('<option selected value="Y">Yes</option>');
         OutWeb_('<option value="N">No</option>');
        else;
         OutWeb_('<option value="Y">Yes</option>');
         OutWeb_('<option selected value="N">No</option>');
        endif;
       else;
        OutWeb_('<option value="Y">Yes</option>');
        OutWeb_('<option value="N">No</option>');
       endif;
       OutWeb_('</select>');
      /end-free
     c     *PSSR         begsr
     c                   endsr
     P                 E


     P*---------------------------------------------------------------------
     P* ficoscorebox0...            - User defined function
     P*---------------------------------------------------------------------
     P ficoscorebox0...
     P                 B
     D ficoscorebox0...
     D                 PI




      /free
       boxname = 'FICOSCORE';
       boxid = 'FICOSCORE';
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
       OutWeb_('<option value="">000</option>');
      /end-free
     C/Exec SQL
     C+  Declare FICOSInput Cursor for Select P_Ztype, P_Zkeya, P_Zkeyn, P_Zdesc
     C+  from KWP_DATA where P_Ztype = 'FICOSCORE' order by P_Zkeyn for Read onl
     C+ y
     C/End-Exec
      /free
      /end-free
     C/Exec SQL
     C+  Open FICOSInput
     C/End-Exec
      /free
      /end-free
     C/Exec SQL
     C+  Get DIAGNOSTICS EXCEPTION 1 :SQL_State = RETURNED_SQLSTATE
     C/End-Exec
      /free
       if ( %subst(sql_state:1:2) = '00');
      /end-free
     C/Exec SQL
     C+  Fetch Next from FICOSInput into :P_Ztype, :P_Zkeya, :P_Zkeyn, :P_Zdesc
     C/End-Exec
      /free
      /end-free
     C/Exec SQL
     C+  Get DIAGNOSTICS EXCEPTION 1 :SQL_State = RETURNED_SQLSTATE
     C/End-Exec
      /free
       endif;
       dow ( %subst(sql_state:1:2) = '00');
       OutWeb_('<option value="');
       OutWeb_(%trimr( %trim(%editc(P_ZKeyn:'P'))));
       OutWeb_('"');
       if (ficoscore = P_Zkeyn);
        OutWeb_(' selected');
       endif;
       OutWeb_('>');
       OutWeb_(%trimr(p_zdesc));
       OutWeb_('</option>');
      /end-free
     C/Exec SQL
     C+  Fetch Next from FICOSInput into :P_Ztype, :P_Zkeya, :P_Zkeyn, :P_Zdesc
     C/End-Exec
      /free
      /end-free
     C/Exec SQL
     C+  Get DIAGNOSTICS EXCEPTION 1 :SQL_State = RETURNED_SQLSTATE
     C/End-Exec
      /free
       enddo;
       OutWeb_('</select>');
      /end-free
     C/Exec SQL
     C+  Close FICOSInput
     C/End-Exec
      /free
      /end-free
     c     *PSSR         begsr
     c                   endsr
     P                 E


     P*---------------------------------------------------------------------
     P* emplpctbox0...              - User defined function
     P*---------------------------------------------------------------------
     P emplpctbox0...
     P                 B
     D emplpctbox0...
     D                 PI




      /free
       boxname = 'EMPLPCT';
       boxid = 'EMPLPCT';
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
       OutWeb_('<option value="">.00</option>');
      /end-free
     C/Exec SQL
     C+  Declare EMPLPInput Cursor for Select P_Ztype, P_Zkeya, P_Zkeyn, P_Zdesc
     C+  from KWP_DATA where P_Ztype = 'EMPLPCT' order by P_Zkeyn for Read only
     C/End-Exec
      /free
      /end-free
     C/Exec SQL
     C+  Open EMPLPInput
     C/End-Exec
      /free
      /end-free
     C/Exec SQL
     C+  Get DIAGNOSTICS EXCEPTION 1 :SQL_State = RETURNED_SQLSTATE
     C/End-Exec
      /free
       if ( %subst(sql_state:1:2) = '00');
      /end-free
     C/Exec SQL
     C+  Fetch Next from EMPLPInput into :P_Ztype, :P_Zkeya, :P_Zkeyn, :P_Zdesc
     C/End-Exec
      /free
      /end-free
     C/Exec SQL
     C+  Get DIAGNOSTICS EXCEPTION 1 :SQL_State = RETURNED_SQLSTATE
     C/End-Exec
      /free
       endif;
       dow ( %subst(sql_state:1:2) = '00');
       OutWeb_('<option value="');
       OutWeb_(%trimr( %trim(%editc(P_ZKeyn:'P'))));
       OutWeb_('"');
       if (emplpct = P_Zkeyn);
        OutWeb_(' selected');
       endif;
       OutWeb_('>');
       OutWeb_(%trimr(p_zdesc));
       OutWeb_('</option>');
      /end-free
     C/Exec SQL
     C+  Fetch Next from EMPLPInput into :P_Ztype, :P_Zkeya, :P_Zkeyn, :P_Zdesc
     C/End-Exec
      /free
      /end-free
     C/Exec SQL
     C+  Get DIAGNOSTICS EXCEPTION 1 :SQL_State = RETURNED_SQLSTATE
     C/End-Exec
      /free
       enddo;
       OutWeb_('</select>');
      /end-free
     C/Exec SQL
     C+  Close EMPLPInput
     C/End-Exec
      /free
      /end-free
     c     *PSSR         begsr
     c                   endsr
     P                 E


     P*---------------------------------------------------------------------
     P* ibvsbox0...                 - User defined function
     P*---------------------------------------------------------------------
     P ibvsbox0...
     P                 B
     D ibvsbox0...
     D                 PI




      /free
       OutWeb_('<select name="IBVS" id="IBVS" onchange="">');
       OutWeb_('<option value=""></option>');
       pddtype = 'DLRINPUT';
       pddcode = 'IBVS';
       AM008_ = CV_BYKEY;
       CHAIN(NE) DL008_ RKWPDDATA;
       RS008_ = RcdSts2_('GETRCD': %error: %found: %eof);
       if (RS008_ = '1');
        select;
        when ( %trim(pddchar) = 'E');
        OutWeb_('<option selected value="E">Easy</option>');
        OutWeb_('<option value="N">None</option>');
        OutWeb_('<option value="I">Intermediate</option>');
        OutWeb_('<option value="H">Hard</option>');
        when ( %trim(pddchar) = 'I');
        OutWeb_('<option value="E">Easy</option>');
        OutWeb_('<option value="N">None</option>');
        OutWeb_('<option selected value="I">Intermediate</option>');
        OutWeb_('<option value="H">Hard</option>');
        when ( %trim(pddchar) = 'H');
        OutWeb_('<option value="E">Easy</option>');
        OutWeb_('<option value="N">None</option>');
        OutWeb_('<option value="I">Intermediate</option>');
        OutWeb_('<option selected value="H">Hard</option>');
        other;
        OutWeb_('<option value="E">Easy</option>');
        OutWeb_('<option selected value="N">None</option>');
        OutWeb_('<option value="I">Intermediate</option>');
        OutWeb_('<option value="H">Hard</option>');
        endsl;
       else;
        OutWeb_('<option value="E">Easy</option>');
        OutWeb_('<option value="N">None</option>');
        OutWeb_('<option value="I">Intermediate</option>');
        OutWeb_('<option value="H">Hard</option>');
       endif;
       OutWeb_('</select>');
      /end-free
     c     *PSSR         begsr
     c                   endsr
     P                 E


     P*---------------------------------------------------------------------
     P* dpoptbox0...                - User defined function
     P*---------------------------------------------------------------------
     P dpoptbox0...
     P                 B
     D dpoptbox0...
     D                 PI




      /free
       OutWeb_('<select name="DPOPT" id="DPOPT" onchange="">');
       OutWeb_('<option value=""></option>');
       pddtype = 'DLRINPUT';
       pddcode = 'DPOPT';
       AM008_ = CV_BYKEY;
       CHAIN(NE) DL008_ RKWPDDATA;
       RS008_ = RcdSts2_('GETRCD': %error: %found: %eof);
       if (RS008_ = '1');
        select;
        when ( %trim(pddchar) = 'NOZERO');
        OutWeb_('<option value="NONE">No Down Payment</option>');
        OutWeb_('<option selected value="NOZERO">Yes - but not on 0s</option>-
       ');
        OutWeb_('<option value="ALL">Yes  on all scores</option>');
        OutWeb_('<option value="HALF">Yes  50% of bottom 0s up</option>');
        when ( %trim(pddchar) = 'ALL');
        OutWeb_('<option value="NONE">No Down Payment</option>');
        OutWeb_('<option value="NOZERO">Yes - but not on 0s</option>');
        OutWeb_('<option selected value="ALL">Yes  on all scores</option>');
        OutWeb_('<option value="HALF">Yes  50% of bottom 0s up</option>');
        when ( %trim(pddchar) = 'HALF');
        OutWeb_('<option value="NONE">No Down Payment</option>');
        OutWeb_('<option value="NOZERO">Yes - but not on 0s</option>');
        OutWeb_('<option value="ALL">Yes  on all scores</option>');
        OutWeb_('<option selected value="HALF">Yes  50% of bottom 0s up</opt-
       ion>');
        when ( %trim(pddchar) = 'NONE');
        OutWeb_('<option selected value="NONE">No Down Payment</option>');
        OutWeb_('<option value="NOZERO">Yes - but not on 0s</option>');
        OutWeb_('<option value="ALL">Yes  on all scores</option>');
        OutWeb_('<option value="HALF">Yes  50% of bottom 0s up</option>');
        other;
        OutWeb_('<option value="NONE">No Down Payment</option>');
        OutWeb_('<option value="NOZERO">Yes - but not on 0s</option>');
        OutWeb_('<option value="ALL">Yes  on all scores</option>');
        OutWeb_('<option value="HALF">Yes  50% of bottom 0s up</option>');
        endsl;
       else;
        OutWeb_('<option value="NONE">No Down Payment</option>');
        OutWeb_('<option value="NOZERO">Yes - but not on 0s</option>');
        OutWeb_('<option value="ALL">Yes  on all scores</option>');
        OutWeb_('<option value="HALF">Yes  50% of bottom 0s up</option>');
       endif;
       OutWeb_('</select>');
      /end-free
     c     *PSSR         begsr
     c                   endsr
     P                 E


     P*---------------------------------------------------------------------
     P* tierbox0...                 - User defined function
     P*---------------------------------------------------------------------
     P tierbox0...
     P                 B
     D tierbox0...
     D                 PI




      /free
       boxname = 'RATE_TIER';
       boxid = 'RATE_TIER';
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
       OutWeb_('<option value="">NONE</option>');
       pdrcode = '';
       SETLL  DL024_ RKWPDECRAT;
       RS024_ = RcdSts2_('POSRCD':%error:%equal:%eof);
       READ(NE)  RKWPDECRAT;
       RS024_ = RcdSts2_('GETNXTRCD':%error:%found:%eof);
       AM024_ = CV_ByKey;
       dow (RS024_ = '1');
       if ((((PDRFICO = 680)) or ((PDRFICO = 1))));
        if (rate_tier = pdrcode);
         OutWeb_(%trimr( '<option selected value="' + %trim(pdrcode) + '">'
       + %trim(pdrdesc) + '</option>'));
        else;
         OutWeb_(%trimr( '<option value="' + %trim(pdrcode) + '">' + %trim(
       pdrdesc) + '</option>'));
        endif;
       endif;
       READ(NE)  RKWPDECRAT;
       RS024_ = RcdSts2_('GETNXTRCD':%error:%found:%eof);
       AM024_ = CV_ByKey;
       enddo;
       OutWeb_('</select>');
      /end-free
     c     *PSSR         begsr
     c                   endsr
     P                 E


     P*---------------------------------------------------------------------
     P* bankstipbox0...             - User defined function
     P*---------------------------------------------------------------------
     P bankstipbox0...
     P                 B
     D bankstipbox0...
     D                 PI




      /free
       pddtype = 'DLRINPUT';
       pddcode = 'BANKSTIP';
       AM008_ = CV_BYKEY;
       CHAIN(NE) DL008_ RKWPDDATA;
       RS008_ = RcdSts2_('GETRCD': %error: %found: %eof);
       if (RS008_ = '1');
        boxselect = %subst(pddchar:1:1);
       else;
        boxselect = 'N';
       endif;
       boxtype = 'SYSTEM';
       p_ztype = 'YESNO';
       boxname = 'BANKSTIP';
       boxid = 'BANKSTIP';
       jvalidation = '';
      /end-free
     C                   EVAL      QPGM__=%trim('KWWEB'     ) + '/' + 'SELBOX2'
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
     P* approveallbox0...           - User defined function
     P*---------------------------------------------------------------------
     P approveallbox0...
     P                 B
     D approveallbox0...
     D                 PI




      /free
       pddtype = 'DLRINPUT';
       pddcode = 'APPROVEALL';
       AM008_ = CV_BYKEY;
       CHAIN(NE) DL008_ RKWPDDATA;
       RS008_ = RcdSts2_('GETRCD': %error: %found: %eof);
       if (RS008_ = '1');
        boxselect = %subst(pddchar:1:1);
       else;
        boxselect = 'N';
       endif;
       boxtype = 'SYSTEM';
       p_ztype = 'YESNO';
       boxname = 'APPROVEALL';
       boxid = 'APPROVEALL';
       jvalidation = '';
      /end-free
     C                   EVAL      QPGM__=%trim('KWWEB'     ) + '/' + 'SELBOX2'
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
     P* nocreditbox0...             - User defined function
     P*---------------------------------------------------------------------
     P nocreditbox0...
     P                 B
     D nocreditbox0...
     D                 PI




      /free
       pddtype = 'DLRINPUT';
       pddcode = 'NOCREDIT';
       AM008_ = CV_BYKEY;
       CHAIN(NE) DL008_ RKWPDDATA;
       RS008_ = RcdSts2_('GETRCD': %error: %found: %eof);
       if (RS008_ = '1');
        boxselect = %subst(pddchar:1:1);
       else;
        boxselect = 'N';
       endif;
       boxtype = 'SYSTEM';
       p_ztype = 'YESNO';
       boxname = 'NOCREDIT';
       boxid = 'NOCREDIT';
       jvalidation = '';
      /end-free
     C                   EVAL      QPGM__=%trim('KWWEB'     ) + '/' + 'SELBOX2'
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
     P* abasearchbox0...            - User defined function
     P*---------------------------------------------------------------------
     P abasearchbox0...
     P                 B
     D abasearchbox0...
     D                 PI




      /free
       pddtype = 'DLRINPUT';
       pddcode = 'ABASEARCH';
       AM008_ = CV_BYKEY;
       CHAIN(NE) DL008_ RKWPDDATA;
       RS008_ = RcdSts2_('GETRCD': %error: %found: %eof);
       if (RS008_ = '1');
        boxselect = %subst(pddchar:1:1);
       else;
        boxselect = 'N';
       endif;
       boxtype = 'SYSTEM';
       p_ztype = 'YESNO';
       boxname = 'ABASEARCH';
       boxid = 'ABASEARCH';
       jvalidation = '';
      /end-free
     C                   EVAL      QPGM__=%trim('KWWEB'     ) + '/' + 'SELBOX2'
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
     P* textappbox0...              - User defined function
     P*---------------------------------------------------------------------
     P textappbox0...
     P                 B
     D textappbox0...
     D                 PI




      /free
       pddtype = 'DLRINPUT';
       pddcode = 'TEXTAPP';
       AM008_ = CV_BYKEY;
       CHAIN(NE) DL008_ RKWPDDATA;
       RS008_ = RcdSts2_('GETRCD': %error: %found: %eof);
       if (RS008_ = '1');
        boxselect = %subst(pddchar:1:1);
       else;
        boxselect = 'N';
       endif;
       boxtype = 'SYSTEM';
       p_ztype = 'YESNO';
       boxname = 'TEXTAPP';
       boxid = 'TEXTAPP';
       jvalidation = '';
      /end-free
     C                   EVAL      QPGM__=%trim('KWWEB'     ) + '/' + 'SELBOX2'
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
     P* dlrsignbox0...              - User defined function
     P*---------------------------------------------------------------------
     P dlrsignbox0...
     P                 B
     D dlrsignbox0...
     D                 PI




      /free
       pddtype = 'DLRINPUT';
       pddcode = 'DLRSIGN';
       AM008_ = CV_BYKEY;
       CHAIN(NE) DL008_ RKWPDDATA;
       RS008_ = RcdSts2_('GETRCD': %error: %found: %eof);
       if (RS008_ = '1');
        boxselect = %subst(pddchar:1:1);
       else;
        boxselect = 'N';
       endif;
       boxtype = 'SYSTEM';
       p_ztype = 'YESNO';
       boxname = 'DLRSIGN';
       boxid = 'DLRSIGN';
       jvalidation = '';
      /end-free
     C                   EVAL      QPGM__=%trim('KWWEB'     ) + '/' + 'SELBOX2'
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
     P* dispcollbox0...             - User defined function
     P*---------------------------------------------------------------------
     P dispcollbox0...
     P                 B
     D dispcollbox0...
     D                 PI




      /free
       pddtype = 'DLRINPUT';
       pddcode = 'DISPCOLL';
       AM008_ = CV_BYKEY;
       CHAIN(NE) DL008_ RKWPDDATA;
       RS008_ = RcdSts2_('GETRCD': %error: %found: %eof);
       if (RS008_ = '1');
        boxselect = %subst(pddchar:1:1);
       else;
        boxselect = 'N';
       endif;
       boxtype = 'SYSTEM';
       p_ztype = 'YESNO';
       boxname = 'DISPCOLL';
       boxid = 'DISPCOLL';
       jvalidation = '';
      /end-free
     C                   EVAL      QPGM__=%trim('KWWEB'     ) + '/' + 'SELBOX2'
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
     P* deldatebox0...              - User defined function
     P*---------------------------------------------------------------------
     P deldatebox0...
     P                 B
     D deldatebox0...
     D                 PI




      /free
       pddtype = 'DLRINPUT';
       pddcode = 'DELDATE';
       AM008_ = CV_BYKEY;
       CHAIN(NE) DL008_ RKWPDDATA;
       RS008_ = RcdSts2_('GETRCD': %error: %found: %eof);
       if (RS008_ = '1');
        boxselect = %subst(pddchar:1:1);
       else;
        boxselect = 'N';
       endif;
       boxtype = 'SYSTEM';
       p_ztype = 'YESNO';
       boxname = 'DELDATE';
       boxid = 'DELDATE';
       jvalidation = '';
      /end-free
     C                   EVAL      QPGM__=%trim('KWWEB'     ) + '/' + 'SELBOX2'
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
     P* pmtcalcbox0...              - User defined function
     P*---------------------------------------------------------------------
     P pmtcalcbox0...
     P                 B
     D pmtcalcbox0...
     D                 PI




      /free
       pddtype = 'DLRINPUT';
       pddcode = 'PMTCALC';
       AM008_ = CV_BYKEY;
       CHAIN(NE) DL008_ RKWPDDATA;
       RS008_ = RcdSts2_('GETRCD': %error: %found: %eof);
       if (RS008_ = '1');
        boxselect = %subst(pddchar:1:1);
       else;
        boxselect = 'N';
       endif;
       boxtype = 'SYSTEM';
       p_ztype = 'YESNO';
       boxname = 'PMTCALC';
       boxid = 'PMTCALC';
       jvalidation = '';
      /end-free
     C                   EVAL      QPGM__=%trim('KWWEB'     ) + '/' + 'SELBOX2'
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
     P* fundlistbox0...             - User defined function
     P*---------------------------------------------------------------------
     P fundlistbox0...
     P                 B
     D fundlistbox0...
     D                 PI




      /free
       pddtype = 'DLRINPUT';
       pddcode = 'FUNDLIST';
       AM008_ = CV_BYKEY;
       CHAIN(NE) DL008_ RKWPDDATA;
       RS008_ = RcdSts2_('GETRCD': %error: %found: %eof);
       if (RS008_ = '1');
        boxselect = %subst(pddchar:1:1);
       else;
        boxselect = 'N';
       endif;
       boxtype = 'SYSTEM';
       p_ztype = 'YESNO';
       boxname = 'FUNDLIST';
       boxid = 'FUNDLIST';
       jvalidation = '';
      /end-free
     C                   EVAL      QPGM__=%trim('KWWEB'     ) + '/' + 'SELBOX2'
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
     P* pfndlistbox0...             - User defined function
     P*---------------------------------------------------------------------
     P pfndlistbox0...
     P                 B
     D pfndlistbox0...
     D                 PI




      /free
       pddtype = 'DLRINPUT';
       pddcode = 'PARFUND';
       AM008_ = CV_BYKEY;
       CHAIN(NE) DL008_ RKWPDDATA;
       RS008_ = RcdSts2_('GETRCD': %error: %found: %eof);
       if (RS008_ = '1');
        boxselect = %subst(pddchar:1:1);
       else;
        boxselect = 'N';
       endif;
       boxtype = 'SYSTEM';
       p_ztype = 'YESNO';
       boxname = 'PARFUND';
       boxid = 'PARFUND';
       jvalidation = '';
      /end-free
     C                   EVAL      QPGM__=%trim('KWWEB'     ) + '/' + 'SELBOX2'
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
     P* ltodepbox0...               - User defined function
     P*---------------------------------------------------------------------
     P ltodepbox0...
     P                 B
     D ltodepbox0...
     D                 PI




      /free
       pddtype = 'DLRINPUT';
       pddcode = 'LTODEP';
       AM008_ = CV_BYKEY;
       CHAIN(NE) DL008_ RKWPDDATA;
       RS008_ = RcdSts2_('GETRCD': %error: %found: %eof);
       if (RS008_ = '1');
        boxselect = %subst(pddchar:1:1);
       else;
        boxselect = 'N';
       endif;
       boxtype = 'SYSTEM';
       p_ztype = 'YESNO';
       boxname = 'LTODEP';
       boxid = 'LTODEP';
       jvalidation = '';
      /end-free
     C                   EVAL      QPGM__=%trim('KWWEB'     ) + '/' + 'SELBOX2'
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
     P* ldwoptbox0...               - User defined function
     P*---------------------------------------------------------------------
     P ldwoptbox0...
     P                 B
     D ldwoptbox0...
     D                 PI




      /free
       pddtype = 'DLRINPUT';
       pddcode = 'LDWOPT';
       AM008_ = CV_BYKEY;
       CHAIN(NE) DL008_ RKWPDDATA;
       RS008_ = RcdSts2_('GETRCD': %error: %found: %eof);
       if (RS008_ = '1');
        boxselect = %subst(pddchar:1:1);
       else;
        boxselect = 'N';
       endif;
       boxtype = 'SYSTEM';
       p_ztype = 'YESNO';
       boxname = 'LDWOPT';
       boxid = 'LDWOPT';
       jvalidation = '';
      /end-free
     C                   EVAL      QPGM__=%trim('KWWEB'     ) + '/' + 'SELBOX2'
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
     P* adddownbox0...              - User defined function
     P*---------------------------------------------------------------------
     P adddownbox0...
     P                 B
     D adddownbox0...
     D                 PI




      /free
       pddtype = 'DLRINPUT';
       pddcode = 'ADDDOWN';
       AM008_ = CV_BYKEY;
       CHAIN(NE) DL008_ RKWPDDATA;
       RS008_ = RcdSts2_('GETRCD': %error: %found: %eof);
       if (RS008_ = '1');
        boxselect = %subst(pddchar:1:1);
       else;
        boxselect = 'Y';
       endif;
       boxtype = 'SYSTEM';
       p_ztype = 'YESNO';
       boxname = 'ADDDOWN';
       boxid = 'ADDDOWN';
       jvalidation = '';
      /end-free
     C                   EVAL      QPGM__=%trim('KWWEB'     ) + '/' + 'SELBOX2'
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
     P* deliverybox0...             - User defined function
     P*---------------------------------------------------------------------
     P deliverybox0...
     P                 B
     D deliverybox0...
     D                 PI




      /free
       pddtype = 'DLRINPUT';
       pddcode = 'DELIVERY';
       AM008_ = CV_BYKEY;
       CHAIN(NE) DL008_ RKWPDDATA;
       RS008_ = RcdSts2_('GETRCD': %error: %found: %eof);
       if (RS008_ = '1');
        boxselect = %subst(pddchar:1:1);
       else;
        boxselect = 'N';
       endif;
       boxtype = 'SYSTEM';
       p_ztype = 'YESNO';
       boxname = 'DELIVERY';
       boxid = 'DELIVERY';
       jvalidation = '';
      /end-free
     C                   EVAL      QPGM__=%trim('KWWEB'     ) + '/' + 'SELBOX2'
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
     P* warrantybox0...             - User defined function
     P*---------------------------------------------------------------------
     P warrantybox0...
     P                 B
     D warrantybox0...
     D                 PI




      /free
       pddtype = 'DLRINPUT';
       pddcode = 'WARRANTY';
       AM008_ = CV_BYKEY;
       CHAIN(NE) DL008_ RKWPDDATA;
       RS008_ = RcdSts2_('GETRCD': %error: %found: %eof);
       if (RS008_ = '1');
        boxselect = %subst(pddchar:1:1);
       else;
        boxselect = 'N';
       endif;
       boxtype = 'SYSTEM';
       p_ztype = 'YESNO';
       boxname = 'WARRANTY';
       boxid = 'WARRANTY';
       jvalidation = '';
      /end-free
     C                   EVAL      QPGM__=%trim('KWWEB'     ) + '/' + 'SELBOX2'
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
     P* downpctbox0...              - User defined function
     P*---------------------------------------------------------------------
     P downpctbox0...
     P                 B
     D downpctbox0...
     D                 PI




      /free
       pddtype = 'DLRINPUT';
       pddcode = 'DOWNPCT';
       AM008_ = CV_BYKEY;
       CHAIN(NE) DL008_ RKWPDDATA;
       RS008_ = RcdSts2_('GETRCD': %error: %found: %eof);
       if (RS008_ = '1');
        boxselect = %subst(pddchar:1:1);
       else;
        boxselect = 'Y';
       endif;
       boxtype = 'SYSTEM';
       p_ztype = 'YESNO';
       boxname = 'DOWNPCT';
       boxid = 'DOWNPCT';
       jvalidation = '';
      /end-free
     C                   EVAL      QPGM__=%trim('KWWEB'     ) + '/' + 'SELBOX2'
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
     P* apprpendbox0...             - User defined function
     P*---------------------------------------------------------------------
     P apprpendbox0...
     P                 B
     D apprpendbox0...
     D                 PI




      /free
       pddtype = 'DLRINPUT';
       pddcode = 'APPRPEND';
       AM008_ = CV_BYKEY;
       CHAIN(NE) DL008_ RKWPDDATA;
       RS008_ = RcdSts2_('GETRCD': %error: %found: %eof);
       if (RS008_ = '1');
        boxselect = %subst(pddchar:1:1);
       else;
        boxselect = 'N';
       endif;
       boxtype = 'SYSTEM';
       p_ztype = 'YESNO';
       boxname = 'APPRPEND';
       boxid = 'APPRPEND';
       jvalidation = '';
      /end-free
     C                   EVAL      QPGM__=%trim('KWWEB'     ) + '/' + 'SELBOX2'
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
     P* dsignbox0...                - User defined function
     P*---------------------------------------------------------------------
     P dsignbox0...
     P                 B
     D dsignbox0...
     D                 PI




      /free
       pddtype = 'DLRINPUT';
       pddcode = 'DOCUSIGN';
       AM008_ = CV_BYKEY;
       CHAIN(NE) DL008_ RKWPDDATA;
       RS008_ = RcdSts2_('GETRCD': %error: %found: %eof);
       if (RS008_ = '1');
        boxselect = %subst(pddchar:1:1);
       else;
        boxselect = 'Y';
       endif;
       boxtype = 'SYSTEM';
       p_ztype = 'YESNO';
       boxname = 'DOCUSIGN';
       boxid = 'DOCUSIGN';
       jvalidation = '';
      /end-free
     C                   EVAL      QPGM__=%trim('KWWEB'     ) + '/' + 'SELBOX2'
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
     P* storisfastbox0...           - User defined function
     P*---------------------------------------------------------------------
     P storisfastbox0...
     P                 B
     D storisfastbox0...
     D                 PI




      /free
       pddtype = 'DLRINPUT';
       pddcode = 'STORISFAST';
       AM008_ = CV_BYKEY;
       CHAIN(NE) DL008_ RKWPDDATA;
       RS008_ = RcdSts2_('GETRCD': %error: %found: %eof);
       if (RS008_ = '1');
        boxselect = %subst(pddchar:1:1);
       else;
        boxselect = 'N';
       endif;
       boxtype = 'SYSTEM';
       p_ztype = 'YESNO';
       boxname = 'STORISFAST';
       boxid = 'STORISFAST';
       jvalidation = '';
      /end-free
     C                   EVAL      QPGM__=%trim('KWWEB'     ) + '/' + 'SELBOX2'
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
     P* fundpartbox0...             - User defined function
     P*---------------------------------------------------------------------
     P fundpartbox0...
     P                 B
     D fundpartbox0...
     D                 PI




      /free
       pddtype = 'DLRINPUT';
       pddcode = 'FUNDPART';
       AM008_ = CV_BYKEY;
       CHAIN(NE) DL008_ RKWPDDATA;
       RS008_ = RcdSts2_('GETRCD': %error: %found: %eof);
       if (RS008_ = '1');
        boxselect = %subst(pddchar:1:1);
       else;
        boxselect = 'N';
       endif;
       boxtype = 'SYSTEM';
       p_ztype = 'YESNO';
       boxname = 'FUNDPART';
       boxid = 'FUNDPART';
       jvalidation = '';
      /end-free
     C                   EVAL      QPGM__=%trim('KWWEB'     ) + '/' + 'SELBOX2'
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
     P* ppcardbox0...               - User defined function
     P*---------------------------------------------------------------------
     P ppcardbox0...
     P                 B
     D ppcardbox0...
     D                 PI




      /free
       pddtype = 'DLRINPUT';
       pddcode = 'PPCARD';
       AM008_ = CV_BYKEY;
       CHAIN(NE) DL008_ RKWPDDATA;
       RS008_ = RcdSts2_('GETRCD': %error: %found: %eof);
       if (RS008_ = '1');
        boxselect = %subst(pddchar:1:1);
       else;
        boxselect = 'N';
       endif;
       boxtype = 'SYSTEM';
       p_ztype = 'YESNO';
       boxname = 'PPCARD';
       boxid = 'PPCARD';
       jvalidation = '';
      /end-free
     C                   EVAL      QPGM__=%trim('KWWEB'     ) + '/' + 'SELBOX2'
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
     P* bankstmtibvbox0...          - User defined function
     P*---------------------------------------------------------------------
     P bankstmtibvbox0...
     P                 B
     D bankstmtibvbox0...
     D                 PI




      /free
       pddtype = 'DLRINPUT';
       pddcode = 'BANKSTMTIBV';
       AM008_ = CV_BYKEY;
       CHAIN(NE) DL008_ RKWPDDATA;
       RS008_ = RcdSts2_('GETRCD': %error: %found: %eof);
       if (RS008_ = '1');
        boxselect = %subst(pddchar:1:1);
       else;
        boxselect = 'N';
       endif;
       boxtype = 'SYSTEM';
       p_ztype = 'YESNO';
       boxname = 'BANKSTMTIB';
       boxid = 'BANKSTMTIB';
       jvalidation = '';
      /end-free
     C                   EVAL      QPGM__=%trim('KWWEB'     ) + '/' + 'SELBOX2'
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
     P* ppibvbox0...                - User defined function
     P*---------------------------------------------------------------------
     P ppibvbox0...
     P                 B
     D ppibvbox0...
     D                 PI




      /free
       pddtype = 'DLRINPUT';
       pddcode = 'PPIBV';
       AM008_ = CV_BYKEY;
       CHAIN(NE) DL008_ RKWPDDATA;
       RS008_ = RcdSts2_('GETRCD': %error: %found: %eof);
       if (RS008_ = '1');
        boxselect = %subst(pddchar:1:1);
       else;
        boxselect = 'N';
       endif;
       boxtype = 'SYSTEM';
       p_ztype = 'YESNO';
       boxname = 'PPIBV';
       boxid = 'PPIBV';
       jvalidation = '';
      /end-free
     C                   EVAL      QPGM__=%trim('KWWEB'     ) + '/' + 'SELBOX2'
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
     P* appdaysbox0...              - User defined function
     P*---------------------------------------------------------------------
     P appdaysbox0...
     P                 B
     D appdaysbox0...
     D                 PI




      /free
       OutWeb_('<select name="EXPIREDAYS" id="EXPIREDAYS" onchange="">');
       OutWeb_('<option value=""></option>');
       pddtype = 'DLRINPUT';
       pddcode = 'EXPIREDAYS';
       AM008_ = CV_BYKEY;
       CHAIN(NE) DL008_ RKWPDDATA;
       RS008_ = RcdSts2_('GETRCD': %error: %found: %eof);
       if (RS008_ = '1');
        if ( %trim(pddchar) = '60');
         OutWeb_('<option selected value="60">60 Days</option>');
        else;
         OutWeb_('<option value="60">60 Days</option>');
        endif;
        if ( %trim(pddchar) = '90');
         OutWeb_('<option selected value="90">90 Days</option>');
        else;
         OutWeb_('<option value="90">90 Days</option>');
        endif;
       else;
        OutWeb_('<option value="60" selected>60 Days</option>');
        OutWeb_('<option value="90">90 Days</option>');
       endif;
       OutWeb_('</select>');
      /end-free
     c     *PSSR         begsr
     c                   endsr
     P                 E


     P*---------------------------------------------------------------------
     P* addrvalidbox0...            - User defined function
     P*---------------------------------------------------------------------
     P addrvalidbox0...
     P                 B
     D addrvalidbox0...
     D                 PI




      /free
       pddtype = 'DLRINPUT';
       pddcode = 'ADDRVALID';
       AM008_ = CV_BYKEY;
       CHAIN(NE) DL008_ RKWPDDATA;
       RS008_ = RcdSts2_('GETRCD': %error: %found: %eof);
       if (RS008_ = '1');
        boxselect = %subst(pddchar:1:1);
       else;
        boxselect = 'N';
       endif;
       boxtype = 'SYSTEM';
       p_ztype = 'YESNO';
       boxname = 'ADDRVALID';
       boxid = 'ADDRVALID';
       jvalidation = '';
      /end-free
     C                   EVAL      QPGM__=%trim('KWWEB'     ) + '/' + 'SELBOX2'
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
     P* vlddate10...                - User defined function
     P*---------------------------------------------------------------------
     P vlddate10...
     P                 B
     D vlddate10...
     D                 PI


     D date8n          S              8P 0
     D date8a          S             10A
     D locdsh          S              3P 0
     D locslsh         S              3P 0
     D usadate         S               D   DATFMT(*USA      )


      /free
       datemsg = '';
       date8a = inputdate;
       locdsh = scanstr_('-': date8a: 1);
       locslsh = scanstr_('/': date8a: 1);
       if ((((locdsh> 0)) or ((locslsh> 0))));
        date8a = rplstr_(date8a:%trim('-'):%trim('/'));
        isodate = AlpToDate_(date8a:'*USA');
       else;
        date8n = %dec(aton_(inputdate:46:16):46:16);
        isodate = NumToDate_(date8n:'*USA');
       endif;
       if (LSTPMLERR_ <> 0);
        datemsg = inputdate + ' is not a valid date. Please enter date as mm--
       dd-ccyy.';
       endif;
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
       CURISOD__ = %date();
      /end-free
      /free
      /end-free
      /free
       QPGMNAM__=%trim(PGMNAME__) + '.pgm';

       // Initialize library list array for current job to find files
       rtlla__(1) = 'KWDB';
       rtlla__(2) = 'KWSYS';
       rtlla__(3) = 'KWDB108';

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
       if   ((file__='KWPDPGM' or file__='*ALL') and NOT %OPEN(KWPDPGM));
        if (mbr__ <> '*FIRST');
         ovrdbf_(ovrflag__:'KWPDPGM':'KWPDPGM' : '*LIBL' : mbr__);
        elseif ('KWPDPGM' <> 'KWPDPGM');
         ovrdbf_(ovrflag__:'KWPDPGM':'KWPDPGM' : '*LIBL');
        endif;
        if    erropen__ = 'Y';
         OPEN(E) KWPDPGM;                //    KWPDPGM
         if        %error;
          return %error;
         endif;
        else;
         OPEN KWPDPGM;                //    KWPDPGM
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
       if   ((file__='KWPPBASE' or file__='*ALL') and NOT %OPEN(KWPPBASE));
        if (mbr__ <> '*FIRST');
         ovrdbf_(ovrflag__:'KWPPBASE':'KWPPBASE' : '*LIBL' : mbr__);
        elseif ('KWPPBASE' <> 'KWPPBASE');
         ovrdbf_(ovrflag__:'KWPPBASE':'KWPPBASE' : '*LIBL');
        endif;
        if    erropen__ = 'Y';
         OPEN(E) KWPPBASE;                //    KWPPBASE
         if        %error;
          return %error;
         endif;
        else;
         OPEN KWPPBASE;                //    KWPPBASE
        endif;
       endif;
       if   ((file__='KWPDDATA' or file__='*ALL') and NOT %OPEN(KWPDDATA));
        if (mbr__ <> '*FIRST');
         ovrdbf_(ovrflag__:'KWPDDATA':'KWPDDATA' : '*LIBL' : mbr__);
        elseif ('KWPDDATA' <> 'KWPDDATA');
         ovrdbf_(ovrflag__:'KWPDDATA':'KWPDDATA' : '*LIBL');
        endif;
        if    erropen__ = 'Y';
         OPEN(E) KWPDDATA;                //    KWPDDATA
         if        %error;
          return %error;
         endif;
        else;
         OPEN KWPDDATA;                //    KWPDDATA
        endif;
       endif;
       if   ((file__='KWPSUCOD' or file__='*ALL') and NOT %OPEN(KWPSUCOD));
        if (mbr__ <> '*FIRST');
         ovrdbf_(ovrflag__:'KWPSUCOD':'KWPSUCOD' : '*LIBL' : mbr__);
        elseif ('KWPSUCOD' <> 'KWPSUCOD');
         ovrdbf_(ovrflag__:'KWPSUCOD':'KWPSUCOD' : '*LIBL');
        endif;
        if    erropen__ = 'Y';
         OPEN(E) KWPSUCOD;                //    KWPSUCOD
         if        %error;
          return %error;
         endif;
        else;
         OPEN KWPSUCOD;                //    KWPSUCOD
        endif;
       endif;
       if   ((file__='KWPSUFLD' or file__='*ALL') and NOT %OPEN(KWPSUFLD));
        if (mbr__ <> '*FIRST');
         ovrdbf_(ovrflag__:'KWPSUFLD':'KWPSUFLD' : '*LIBL' : mbr__);
        elseif ('KWPSUFLD' <> 'KWPSUFLD');
         ovrdbf_(ovrflag__:'KWPSUFLD':'KWPSUFLD' : '*LIBL');
        endif;
        if    erropen__ = 'Y';
         OPEN(E) KWPSUFLD;                //    KWPSUFLD
         if        %error;
          return %error;
         endif;
        else;
         OPEN KWPSUFLD;                //    KWPSUFLD
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
       if   ((file__='KWCBASE' or file__='*ALL') and NOT %OPEN(KWCBASE));
        if (mbr__ <> '*FIRST');
         ovrdbf_(ovrflag__:'KWCBASE':'KWCBASE' : '*LIBL' : mbr__);
        elseif ('KWCBASE' <> 'KWCBASE');
         ovrdbf_(ovrflag__:'KWCBASE':'KWCBASE' : '*LIBL');
        endif;
        if    erropen__ = 'Y';
         OPEN(E) KWCBASE;                //    KWCBASE
         if        %error;
          return %error;
         endif;
        else;
         OPEN KWCBASE;                //    KWCBASE
        endif;
       endif;
       if   ((file__='KWCADDR' or file__='*ALL') and NOT %OPEN(KWCADDR));
        if (mbr__ <> '*FIRST');
         ovrdbf_(ovrflag__:'KWCADDR':'KWCADDR' : '*LIBL' : mbr__);
        elseif ('KWCADDR' <> 'KWCADDR');
         ovrdbf_(ovrflag__:'KWCADDR':'KWCADDR' : '*LIBL');
        endif;
        if    erropen__ = 'Y';
         OPEN(E) KWCADDR;                //    KWCADDR
         if        %error;
          return %error;
         endif;
        else;
         OPEN KWCADDR;                //    KWCADDR
        endif;
       endif;
       if   ((file__='KWCNAME' or file__='*ALL') and NOT %OPEN(KWCNAME));
        if (mbr__ <> '*FIRST');
         ovrdbf_(ovrflag__:'KWCNAME':'KWCNAME' : '*LIBL' : mbr__);
        elseif ('KWCNAME' <> 'KWCNAME');
         ovrdbf_(ovrflag__:'KWCNAME':'KWCNAME' : '*LIBL');
        endif;
        if    erropen__ = 'Y';
         OPEN(E) KWCNAME;                //    KWCNAME
         if        %error;
          return %error;
         endif;
        else;
         OPEN KWCNAME;                //    KWCNAME
        endif;
       endif;
       if   ((file__='KWPDECMOD' or file__='*ALL') and NOT %OPEN(KWPDECMOD));
        if (mbr__ <> '*FIRST');
         ovrdbf_(ovrflag__:'KWPDECMOD':'KWPDECMOD' : '*LIBL' : mbr__);
        elseif ('KWPDECMOD' <> 'KWPDECMOD');
         ovrdbf_(ovrflag__:'KWPDECMOD':'KWPDECMOD' : '*LIBL');
        endif;
        if    erropen__ = 'Y';
         OPEN(E) KWPDECMOD;                //    KWPDECMOD
         if        %error;
          return %error;
         endif;
        else;
         OPEN KWPDECMOD;                //    KWPDECMOD
        endif;
       endif;
       if   ((file__='KWPRULE' or file__='*ALL') and NOT %OPEN(KWPRULE));
        if (mbr__ <> '*FIRST');
         ovrdbf_(ovrflag__:'KWPRULE':'KWPRULE' : '*LIBL' : mbr__);
        elseif ('KWPRULE' <> 'KWPRULE');
         ovrdbf_(ovrflag__:'KWPRULE':'KWPRULE' : '*LIBL');
        endif;
        if    erropen__ = 'Y';
         OPEN(E) KWPRULE;                //    KWPRULE
         if        %error;
          return %error;
         endif;
        else;
         OPEN KWPRULE;                //    KWPRULE
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
       if   ((file__='KWPPGM' or file__='*ALL') and NOT %OPEN(KWPPGM));
        if (mbr__ <> '*FIRST');
         ovrdbf_(ovrflag__:'KWPPGM':'KWPPGM' : '*LIBL' : mbr__);
        elseif ('KWPPGM' <> 'KWPPGM');
         ovrdbf_(ovrflag__:'KWPPGM':'KWPPGM' : '*LIBL');
        endif;
        if    erropen__ = 'Y';
         OPEN(E) KWPPGM;                //    KWPPGM
         if        %error;
          return %error;
         endif;
        else;
         OPEN KWPPGM;                //    KWPPGM
        endif;
       endif;
       if   ((file__='KWPDRATE' or file__='*ALL') and NOT %OPEN(KWPDRATE));
        if (mbr__ <> '*FIRST');
         ovrdbf_(ovrflag__:'KWPDRATE':'KWPDRATE' : '*LIBL' : mbr__);
        elseif ('KWPDRATE' <> 'KWPDRATE');
         ovrdbf_(ovrflag__:'KWPDRATE':'KWPDRATE' : '*LIBL');
        endif;
        if    erropen__ = 'Y';
         OPEN(E) KWPDRATE;                //    KWPDRATE
         if        %error;
          return %error;
         endif;
        else;
         OPEN KWPDRATE;                //    KWPDRATE
        endif;
       endif;
       if   ((file__='KWPEEVENT' or file__='*ALL') and NOT %OPEN(KWPEEVENT));
        if (mbr__ <> '*FIRST');
         ovrdbf_(ovrflag__:'KWPEEVENT':'KWPEEVENT' : '*LIBL' : mbr__);
        elseif ('KWPEEVENT' <> 'KWPEEVENT');
         ovrdbf_(ovrflag__:'KWPEEVENT':'KWPEEVENT' : '*LIBL');
        endif;
        if    erropen__ = 'Y';
         OPEN(E) KWPEEVENT;                //    KWPEEVENT
         if        %error;
          return %error;
         endif;
        else;
         OPEN KWPEEVENT;                //    KWPEEVENT
        endif;
       endif;
       if   ((file__='KWPDECRATE' or file__='*ALL') and NOT %OPEN(KWPDECRATE));
        if (mbr__ <> '*FIRST');
         ovrdbf_(ovrflag__:'KWPDECRATE':'KWPDECRATE' : '*LIBL' : mbr__);
        elseif ('KWPDECRATE' <> 'KWPDECRATE');
         ovrdbf_(ovrflag__:'KWPDECRATE':'KWPDECRATE' : '*LIBL');
        endif;
        if    erropen__ = 'Y';
         OPEN(E) KWPDECRATE;                //    KWPDECRATE
         if        %error;
          return %error;
         endif;
        else;
         OPEN KWPDECRATE;                //    KWPDECRATE
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
       when      rcdfmt__='RWPDBASE' and AM001_ = CV_ByKey and RS001_ = *ON ;
       update RWPDBASE;
       when      rcdfmt__='RKWPDLOC' and AM002_ = CV_ByKey and RS002_ = *ON ;
       update RKWPDLOC;
       when      rcdfmt__='RWPDPGM' and AM003_ = CV_ByKey and RS003_ = *ON ;
       update RWPDPGM;
       when      rcdfmt__='RKWPDDATA' and AM008_ = CV_ByKey and RS008_ = *ON ;
       update RKWPDDATA;
       when      rcdfmt__='RKWCCONT' and AM013_ = CV_ByKey and RS013_ = *ON ;
       update RKWCCONT;
       when      rcdfmt__='RKWCBASE' and AM014_ = CV_ByKey and RS014_ = *ON ;
       update RKWCBASE;
       when      rcdfmt__='RKWCADDR' and AM015_ = CV_ByKey and RS015_ = *ON ;
       update RKWCADDR;
       when      rcdfmt__='RKWCNAME' and AM016_ = CV_ByKey and RS016_ = *ON ;
       update RKWCNAME;
       when      rcdfmt__='RKWPDRATE' and AM022_ = CV_ByKey and RS022_ = *ON ;
       update RKWPDRATE;
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
       when      rcdfmt__='RKWPDDATA' and AM008_ = CV_ByKey and RS008_ = *ON ;
       delete RKWPDDATA;
       when      rcdfmt__='RKWPDUSER' and AM012_ = CV_ByKey and RS012_ = *ON ;
       delete RKWPDUSER;
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
System Settings:  Dealers
**CTDATA H__1        listCss                          1434
body {
background-image: none;
color: #000000;
background-color: #c9c9c9;
paddin
g-top: 0px;
padding-bottom: 0px;
padding-left: 0px;
padding-right: 0px;
}

#sect
ions {
border: 1px solid #9A9AA4;
height: 548px;
margin-left: 10px;
overflow-x:
hidden;
position: relative;
width: 679px;
}

#wrapping {
width: 98%;
margin-left
: auto;
margin-right: auto;
}

#everything {
width: 98%;
margin-top: 10px;
margi
n-left: auto;
margin-right: auto;
padding-bottom: 10px;
background-color: #EAEAE
A;
background-image: url('/websmart/kwikloan/images/pshadow.png');
background-po
sition: right;
background-repeat: repeat-y;
}

#pagetitle {
font-size: 16px;
fon
t-weight: bold;
color: #FFFFFF;
width: 100%;
background-color: #839dc1;
height:
20px;
padding-top: 4px;
background-image: url('/websmart/kwikloan/images/pshadow
.png');
background-position: right;
background-repeat: repeat-y;
}

#pagetitle s
pan {
margin-left: 10px;
font-family: verdana;
padding: 5px;
}

#whitebg {
backg
round-color: #FFFFFF;
border: 1px solid #999;
padding: 10px;
margin-top: 10px;
m
argin-bottom: 10px;
margin-left: auto;
margin-right: auto;
width: 890px;
}

#whi
tebg table td a {
color: #06f;
}

DIV.whitebg {
height: 565px;	
}

DIV.left {
po
sition: relative;
float: left;
height: 550px;
width: 200px;
background-color: #6
d819c;
background-image: url('/websmart/kwikloan/images/loanInqLeft.png');
}

DI
V.right {
position: relative;
float: left;
height: 550px;
width: 650px; 
}
**CTDATA H__2        ListHeader                       3234
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.or
g/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>
    <meta name="genera
tor" content="WebSmart" />
    <meta http-equiv="Pragma" content="no-cache" />

   <title>System Settings:  Dealers</title>
    <link rel="stylesheet" type="tex
t/css" href="/k_loan/s/reset.css" media="screen, tv, projection" />
    <link re
l="stylesheet" type="text/css" href="/websmart/kwikloan/styles/notifications.css
" media="screen, tv, projection" />
    <link rel="stylesheet" type="text/css" h
ref="/k_loan/s/tablesorter.css" media="screen, tv, projection" />
    <style typ
e="text/css">
    
    </style>
    <script type="text/javascript" src="https://
getfirebug.com/firebug-lite.js"></script>
  </head>
  <body>
    
    <!-- modal
 window boxes -->
    <div id="modalOverlay" style="display: none;"></div>
    <
div id="modalContainer" style="display: none;">
      <div id="modalContent">

      <div class="modalHeader"><h3 id="headerText"></h3><a id="modalCloseA" clas
s="modalCloseA" onclick="hideStuff2();"><div id="modalCloseImg" class="modalClos
eImg"></div></a></div>
        <div id="modalFrameDiv"></div>
      </div>
    <
/div>
    <!-- end modal window boxes -->
    
    <div id="wrapping">
      <di
v id="everything">
        <div id="pagetitle">
          <span>System Settings:
  Dealers</span>
        </div>
        <div id="whitebg" class="whitebg">

     
          <div class="left">
            <table class="actionsTable" style
="table-layout:fixed;width:100%;">
              
              <!--<tr><td><a h
ref="#" onclick=""><img src="https://sv1.americanfirstfinance.com:8158/websmart/
kwikloan/images/loanInqADD.png"></a><span class="LSlabel"></span></td></tr>-->

             
              <form action="" method="POST">
                <tr><
td style="text-align:center;"><span style="color:white; font-weight:bold;">Deale
r Name: </span><br><input type="text" name="dlrname" id="dlrname" value=""></td>
</tr>  
                <tr>
                	<td style="text-align:center;">
	
               	<span style="color:white; font-weight:bold;">Dealer Code: </span
>
	                	<br>
	                	<input type="text" name="dlrcode" id=
"dlrcode" value="">
                	</td>
                </tr> 

  <tr>
                	<td style="text-align:center;">
	                	<br>
	
                	<span style="text-align:right">
		                	<input type=
"submit" value="Search">
		                	<input type="button" onclick="javasc
ript:window.location.href='?dlrname=&dlrcode=&dlrreset=Y'" value="Reset">
	
           	</span>
                	</td>
                </tr>  
         	  <
/form>
              </table>
            </div><!--left-->
            

     <div class="right">
              <div id="sections">
                <tabl
e id="mainTable" class="tablesorter">
                  <thead>

    <tr>
                      <th style="width: 100px;">Action</th>

           <th style="width: 100px;">Dealer Code</th>
                      <th>
Dealer Name</th>
                    </tr>
                  </thead>

        <tbody>

**CTDATA H__3        ListDetails                      528
<tr class="">
  <td>
    <select name="action" id="action" size="1" onchange="ne
wAct(this.value,,'',this);">
    	<option value="B"></option>
    	<option value
="">Edit Dealer</option>
    	<option value="">Edit Products</option>
    	<opti
on value="">Offices</option>
    	<option value="">Users</option>
    	<option v
alue="">Tax Settings</option>
    	<option value="">3rd Party Settings</option>

		<option value="">Dealer Payment</option>
    </select>
  </td> 
  <td class="t
ext right"></td>
  <td class="text"></td>
</tr>

**CTDATA H__4        ListFooter                       3661
</tbody>
</table>
<div id="pager">
  <input type="text" name="pagecurrent" id="p
agecurrent" class="pagecurrent" value="">
  <span> / </span>
  <span class="page
count">1</span>
  <form>
    <img src="/k_loan/i/asc.gif" class="first"/>
    <i
mg src="/k_loan/i/asc.gif" class="prev"/>
    <input class="pagedisplay" value="
">
    <img src="/k_loan/i/desc.gif" class="next"/>
    <img src="/k_loan/i/desc
.gif" class="last"/>
    <select style="width: 0px; height: 0px;" class="pagesiz
e">
    <option selected="selected" value="12">12</option>
    </select>
  </for
m>
</div>
<div id="tablenav" style="display: none;"></div>
</div>
</div>
</div>

</div>
</div>
<input type="hidden" id="rcdcnt" value="">
<input type="hidden" na
me ="mode" id="mode" value="">
<script type="text/javascript" src="/k_loan/jq/17
2.js"></script>
<script type="text/javascript" src="/k_loan/jq/tablesorter.2.3.4
.js"></script>
<script type="text/javascript" src="/k_loan/jq/tablepager.js"></s
cript>
<script type="text/javascript" src="/k_loan/jq/tablenav.js"></script>

<s
cript type="text/javascript">
$(document).ready(function() 
    { 
    	var coun
ter = document.getElementById('rcdcnt');
    	if(counter.value > 12)
    	{

		document.getElementById('tablenav').style.display = "";	
    	}
    	

$("#mainTable").tablesorter().tablesorterPager({ container: $("#pager"), positio
nFixed: false, size: 12, removeRows: false });
        
        var pageDisp = $
(".pagedisplay").attr("value");
        var totalPages = pageDisp.split("/");

  	
    	$("#tablenav").paginate({
				count 					: totalPages[1],
				start 			
		: 1,
				display     			: 20,
				border					: '#829CBF',
				text_color  			:
 '#FFFFFF',
				background_color    	: '#829CBF',
				border_hover_color		: '#82
9CBF',	
				text_hover_color  		: '#4F6B72',
				background_hover_color	: '#FFFF
FF',
				images					: false,
				onChange     			: function(page){
											//
$('._current','#paginationdemo').removeClass('_current').hide();
											//$(
'#p'+page).addClass('_current').show();
											document.getElementById('page
current').value = page;
											$("#pagecurrent").trigger('change');
								
		  }
		});
    } 
);



function checkMsg()
{
	if(document.getElementById('flag
Msg').value == "Y")
	{
		showMsg();
		setTimeout("hideMsg();",4000);
	}
}

funct
ion showMsg()
{
	$("#msg1").show(400);
	$("#sections").animate(
	{
    	height:
"451px",
  	}, 500 );
		
}
function hideMsg()
{
	$("#msg1").hide(400);
	$("#sect
ions").animate(
	{
    	height: "513px",
  	}, 500 );
}
function newAct(action,r
rn,pdno,fld)
{
	if(!action)
	{
		alert('No action was provided');
		return false
;
	}
	if(!rrn)
	{
		alert('No rrn was provided');
		return false;
	}
	if(!pdno)

	{
		pdno = "";
	}
	
	pdno = encodeURIComponent(pdno);
	
	var id = $(fld).attr('
id');
	document.getElementById(id).selectedIndex = 0;
	switch(action)
	{
		case
"B":
			break;
		case "N":
			alert("You do not have the necessary permissions t
o edit dealer information.");
			break;
		case "E":
			location.href = "?task=be
ginmanage&mode=edit&rrn=" + rrn + "&pdno=" + pdno;
			break;
		case "O":
			loca
tion.href = "S_DLRO.pgm?pdno=" + pdno;
			break;
		case "U":
			location.href =
"S_DLRU.pgm?pdno=" + pdno;
			break;
		case "L":
			location.href = "S_PGM.pgm?p
dno=" + pdno;
			break;
		case "P":
			location.href = "S_PRODEDIT.pgm?pdno=" +
pdno;
			break;
		case "T":
			location.href = "AIT_DLR.pgm?pdno=" + pdno;
			br
eak;
		case "3":
			location.href = "S_DLR3.pgm";
			break;
		case "4":
			locat
ion.href = "CompassACH/recon_form.php?clid=116&pdno=" + pdno;
			break;
		defaul
t:
			break;	
	}	
}
//checkMsg();
</script>

</body>
</html>

**CTDATA H__5        manageCss                        2600
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
#topBtns
{
float: right;
paddin
g-right: 12px;
margin-right: 30px;
}
.loanProd
{
border-left: 1px solid #cccccc;
	
}
.holderTd
{
border-right: 1px solid #cccccc;
}
#stateTable
{
position: relat
ive;
width: 300px;
border-left: 1px solid #CCCCCC;	
}
.stateTable tr td
{
paddin
g: 0px 0px 0px 3px;
vertical-align: top;	
}
.loanProd
{
padding: 0px 0px 0px 3px
;
vertical-align: top;	
}
#stateOfBus
{
font-family: verdana;
font-size: 11px;	

}
#loanProd
{
font-family: verdana;
font-size: 11px;
}
body {
background-image:
none;
color: #000000;
background-color: #c9c9c9;
padding-top: 0px;
padding-botto
m: 0px;
padding-left: 0px;
padding-right: 0px;
}

#wrapping {
width: 98%;
margin
-left: auto;
margin-right: auto;
}

#everything {
width: 98%;
margin-top: 10px;

margin-left: auto;
margin-right: auto;
padding-bottom: 10px;
background-color: #
EAEAEA;
background-image: url('/websmart/kwikloan/images/pshadow.png');
backgrou
nd-position: right;
background-repeat: repeat-y;
}

#pagetitle {
font-size: 14px
;
color: #FFFFFF;
width: 100%;
background-color: #839dc1;
padding: 10px;
positio
n: fixed;
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
background-color: #FFFFF
F;
border: 1px solid #999;
padding: 10px;
margin-top: 10px;
margin-bottom: 10px;

margin-left: auto;
margin-right: auto;
width: 98%;
height: 98%;
}

#whitebg tab
le td a {
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
b
ackground-image: url('/websmart/kwikloan/images/loanInqLeft.png');
}

DIV.right
{
position: relative;
float: left;
height: 550px;
width: 650px; 
}


table.deale
rTable 
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
table.d
ealerTable td 
{
font-family: verdana;
font-size: 11px;
padding: 6px 5px 6px 0px
;
vertical-align: middle;
}
table.dealerTable td.left 
{
text-align: right;
widt
h: 130px;
}
table.dealerTable td.right 
{
padding-left: 8px;
text-align: left;
w
idth: 190px;
vertical-align: middle;
}


**CTDATA H__6        RcdManage                        35654
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.or
g/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>
    <meta name="genera
tor" content="WebSmart" />
    <meta http-equiv="Pragma" content="no-cache" />

   <title>System Settings:  Dealers - Add or Change</title>
    <link rel="style
sheet" type="text/css" href="/k_com/jqui/jquery-ui.min.css">
    <style type="te
xt/css">
    
    </style>
    <script type="text/javascript" src="/k_com/jqLate
st.js"></script>
    <script type="text/javascript" src="/k_com/jqui/jquery-ui.m
in.js"></script>  
    <script type="text/javascript" src="/k_com/numeric.js"></
script>    
    <script type="text/javascript">
    $(document).ready(function()
{
    	$(".date").datepicker();
    	$(".numeric").numeric();
    	$(".dialog-to
ggle").click(function(){
    		$($(this).data("target")).dialog("open");
    	})
;
    	$(".dialog").dialog({
    		autoOpen:false,
    		width:875,
    		height
:600,
    		modal:true    		
    	});
    	
    	//$("#fundEmail").bootstrapVali
dator();
    	
    	$("#DONOTFUND").change(function(){
    		showFundNote($(this
).val());
    	});
    	
    	$("#SALESTAX").change(function(){
    		if($(this)
.val() == "N" || $(this).val() == ""){
    			$("#AUTOTAX").val('N');	
    		}	

    	});
    	
    	$("#AUTOTAX").change(function(){
    		if($(this).val() == "
Y"){
    			$("#SALESTAX").val('Y');	
    		}	
    	});
    });
	
	function show
FundNote(val){
				
		if (val == "Y"){
			document.getElementById("FUNDNOTErow")
.style.display="";		
		}	
		else{
			document.getElementById("FUNDNOTErow").styl
e.display="none";							
		}
		
	}

    //ensure a dealer code//name has been en
tered
    function check_form(f)
    {
    	var code = document.getElementById("
PDNO").value.trim();
    	var name = document.getElementById("PDNAME").value.tri
m();
    	if (name == "" || code == "")
    	{
    		alert("Please enter a deale
r code and name before adding/modifying a dealer");
    		return false;
    	}

   	else
    		return true;
    }
    
    </script>
    <script type="text/java
script" src="/websmart/kwikloan/javascript/klscripts.js"></script>
    <!-- remo
ved klthemes.js reference -->
    <script type="text/javascript" src="/websmart/
v7.2/javascript/esdiapi010.js"></script>
    
  </head>
  <body onload="fixRouti
ng();fixTaxId();checkMode();checkClient();">
    
      
    
    
    <form act
ion="" name="dealerForm" method="get" onSubmit="return check_form(this)">

<input type="hidden" name="task" value="endmanage">
      <input type="hidden" n
ame="rrn" value="">
      <input type="hidden" name="FirstRowRRN" value="">

  
      <div id="pagetitle">
        <span>Edit Dealer - </span>
        

   <div id="topBtns" style="float: right; padding-right: 12px;">
          <inpu
t type="submit" class="navbutton" name="mode" id="mode" value="Add"/>

<button class="navbutton"  onclick="javascript:location.href='S_PRODEDIT.pgm?pdn
o=';return false;">Manage Products</button>
          
                    

      <button class="navbutton"  onclick="javascript:location.href='';return fal
se;">Cancel</button>
        </div>
        
      </div>
      
      <div id="
wrapping">
        <div id="whitebg">
          <div id="EDITcontents"> 

     
            
            
            
            <table id="holderTable"
>
              <tr>
                <th id="header1">Dealer Information</th>

              <th id="header2">State(s) of Business</th>
                <th id=
"header3">Loan Products Offered</th>
              </tr>
              <tr>

            <td class="holderTd">
                  <table class="dealerTable" s
tyle="">
                    <tr>
                      <td class="left">Dealer
Code:</td>
                      <td class="right"><input type="text" id="PDNO"
name="PDNO"  value=""></td>
                    </tr>
                    <tr>

                     <td class="left">Gas Cash Dealer:</td>

  <td class="right"></td>
                    </tr>
                    <tr>

                   <td class="left">Company Name:</td>
                      <td
 class="right"><input type="text" name="PDNAME" id="PDNAME" size="30" maxlength=
"40"  value=""></td>
                    </tr>
                    <tr>

              <td class="left">Signer Name:</td>
                      <td class
="right"><input type="text" name="DSNAME" id="DSNAME" size="30" maxlength="40" v
alue=""></td>
                    </tr>
                    <tr>

       <td class="left">Disable Dealer?:</td>
                      <td class="r
ight"></td>
                    </tr>
                    <tr>

     <td class="left">Assign to Branch:</td>
                      <td class="ri
ght"></td>
                    </tr>
                    <tr>

    <td class="left">Dealer Status:</td>
                      <td class="right"
></td>
                    </tr>
                    <tr>

<td class="left">Default Program:</td>
                      <td class="right"><
/td>
                    </tr>
                    <tr>
                      <t
d class="left">Batch ACH?:</td>
                      <td class="right"></td>

                  </tr>
                    <tr>
         			 <td class="left">E
ntered Date:</td>
          			<td class="right"><input type="text" name="d_KWPE
DATE" id="d_KWPEDATE" size="10" maxlength="10" value=""></td>
        			</tr>

                   
                    <tr>
                      <td class="le
ft">Signing Type:</td>
                      <td class="right"></td>

         </tr>
                    
                    
                    

                  
                      
                    

   
                  <!-- <tr>  Comment out - ZD#1524
                      <td
 class="left">Risk Percentage</td>
                      <td class="right"><inpu
t type="text" name="RISKPER" id="RISKPER" size="25" maxlength="9"  value="" onKe
yPress="numbersOnly(this.value,this);"></td>
                    </tr>

          -->
                     <tr>
                      <td class="left">M
aximum Amount</td>
                      <td class="right"><input type="text" na
me="WPROCD" id="WPROCD" size="25" maxlength="9"  value="" onKeyPress="numbersOnl
y(this.value,this);"></td>
                    </tr>
                    <tr>

                    <td class="left">Allowed to take<br> ADD-ON Purchases?</td>

                      <td class="right"></td>
                    </tr>

            <tr>
                      <td class="left">Training Category</td>

                     <td class="right"></td>
                    </tr>

           <tr>
                      <td class="left">Owner Name:</td>

              <td class="right"><input type="text" name="PDNAM1" size="30" maxle
ngth="40"  value=""></td>
                    </tr>
                    <tr>

                   <td class="left">Contact Person:</td>
                      <
td class="right"><input type="text" name="PDNAM2" size="30" maxlength="40"  valu
e=""></td>
                    </tr>
                    
                    <t
r>
                      <td class="left">Lead Source:</td>

  <td class="right"></td>
                    </tr>
                    <tr>

                   <td class="left">Sales Rep:</td>
                      <td cl
ass="right"></td>
                    </tr>
                    

     <tr>
                      <td class="left">Home/Office:</td>

         <td class="right"></td>
                    </tr>
                    <
tr>
                      <td class="left">DBA:</td>
                      <td c
lass="right"><input type="text" name="DBA" size="30" maxlength="40"  value=""></
td>
                    </tr>
                    <tr>
                      <td
 class="left">Primary Email:</td>
                      <td class="right"><input
 type="text" name="PDEMAIL" size="30" maxlength="250"  value=""></td>

          </tr>
                    <tr>
                      <td class="left">
Alert Primary Email on Application Decision?</td>
                      <td clas
s="right"></td>
                    </tr>
                    <tr>

         <td class="left">Secondary Email:</td>
                      <td class=
"right"><input type="text" name="PDEMAIL2" size="30" maxlength="40"  value=""></
td>
                    </tr>
                    <tr>
                      <td
 class="left">Alert Secondary Email on Application Decision?</td>

        <td class="right"></td>
                    </tr>
                    <t
r>
                      <td class="left">Esign Email:</td>

  <td class="right"><input type="text" name="SIGNEMAIL" size="30" maxlength="50"
  value=""></td>
                    </tr>
                    

    
                    <tr>
                      <td class="left">Allow deale
r to generate documents before approval?</td>
                      <td class="r
ight"></td>
                    </tr>
                    <tr>

     <td class="left">Auto Stip Group:</td>
                      <td class="rig
ht"></td>
                    </tr>
                    
                    

                  
                     
                    <tr>

      	<td class="left">Allow Auto Debits?</td>
                    	<td class="
right"></td>
                    </tr>
                    <tr>

    	<td class="left">Use PIN Verification on Apps?</td>
                    	<t
d class="right"></td>
                    </tr>
                    <tr>

             	<td class="left">Use CVC Verification on Apps?</td>

      	<td class="right"></td>
                    </tr>
                     <t
r>
                    	<td class="left">Use Address Verification on Apps?</td>

                    	<td class="right"></td>
                    </tr>

           <tr>
                    	<td class="left">Use PIN Verification on ES
IGN?</td>
                    	<td class="right"></td>
                    </tr>

                    
                    <!--<tr>
                    	<td clas
s="left">Require IBV for All Apps?</td>
                    	<td class="right"><
/td>
                    </tr>-->
                      
                    <tr
>
                    	<td class="left">Require IBV for Web Apps?</td>

           	<td class="right"></td>
                    </tr>

  
                     <tr>
                    	<td class="left">Use IBV Risk
Level</td>
                    	<td class="right"></td>
                    </tr
>
                    
                   <tr>
                    	<td class="l
eft">Require Out of Wallet All Apps?</td>
                    	<td class="right"
></td>
                    </tr>
                   
                    

              <tr>
                    	<td class="left">Require Out of Wallet f
or Web Apps?</td>
                    	<td class="right"></td>

   </tr>
                    <tr>
                    	<td class="left">Enter De
aler Rep?</td>
                    	<td class="right"></td>

</tr>
                     <tr>
                      <td class="left">Down Paym
ent Amount</td>
                      <td class="right"><input type="text" name=
"DOWNPMT" id="DOWNPMT" size="25" maxlength="9"  value="" onKeyPress="numbersOnly
(this.value,this);"></td>
                    </tr>
                     <tr>

                  	<td class="left">Down Payment Option</td>

 	<td class="right"></td>
                    </tr>
                      

               <tr>
                    	<td class="left">Allow Down Pmt % on Br
onze?</td>
                    	<td class="right"></td>
                    </tr
>
                     <tr>
                    	<td class="left">Allow Processi
ng Fee Override?</td>
                    	<td class="right"></td>

       </tr>
                    <tr>
                      <td class="left">Pho
ne Number:</td>
                      <td class="right"><input type="text" name=
"PDPHON" size="30" maxlength="12" onkeyup="mask(this.value,this,'3,7','-');" onK
eyPress="numbersOnly(this.value,this);"  value=""></td>
                    </tr
>
                    <tr>
                      <td class="left">Primary Fax Nu
mber:</td>
                      <td class="right"><input type="text" name="PDFA
X" size="30" maxlength="12" onkeyup="mask(this.value,this,'3,7','-');" onKeyPres
s="numbersOnly(this.value,this);"  value=""></td>
                    </tr>

                <tr>
                      <td class="left">Secondary Fax Number
:</td>
                      <td class="right"><input type="text" name="PDPHON1"
 size="30" maxlength="12" onkeyup="mask(this.value,this,'3,7','-');" onKeyPress=
"numbersOnly(this.value,this);"  value=""></td>
                    </tr>

              <tr>
                      <td class="left">How to receive credit
decisions:</td>
                      <td class="right"></td>

  </tr>
                    <tr>
                      <td class="left">Tax ID N
umber:</td>
                      <td class="right"><input type="text" name="PDT
IN" id="PDTIN" size="9" maxlength="10" onkeyup="mask(this.value,this,'2','-');"
onKeyPress="numbersOnly(this.value,this);"  value=""></td>
                    <
/tr>	
                    <tr>
                      <td class="left">Location:<
/td>
                      <td class="right"></td>
                    </tr>

                 <tr>
                      <td class="left">Street Address:</td
>
                      <td class="right"><input type="text" name="PDADR1" size=
"40" maxlength="40"  value=""></td>
                    </tr>

  <tr>
                      <td class="left">Apartment / Suite Number:</td>

                   <td class="right"><input type="text" name="PDADR2" size="40"
maxlength="40"  value=""></td>
                    </tr>
                    <tr
>
                      <td class="left">City:</td>
                      <td cl
ass="right"><input type="text" name="PDCITY" size="30" maxlength="40"  value="">
</td>
                    </tr>
                    <tr>
                      <
td class="left">State:</td>
                      <td class="right"></td>

              </tr>
                    <tr>
                      <td class="le
ft">Zip:</td>
                      <td class="right"><input type="text" name="P
DZIP" id="PDZIP" size="10" maxlength="10" onkeyup="" onKeyPress="numbersOnly(thi
s.value,this);" onblur=""  value=""></td>
                    </tr>

        <tr>
                      <td class="left">Longitude & Latitude (Gas Ca
sh):</td>
                      <td class="right"><input type="text" name="LONGL
AT" id="LONGLAT" size="80" maxlength="80" onkeyup="" onKeyPress="numbersOnly(thi
s.value,this);" onblur=""  value=""></td>
                    </tr>

        <tr>
                      <td class="left">Default Product:</td>

                <td class="right"></td>
                    </tr>

      <tr>
                      <td class="left">Payment Preference:</td>

                 <td class="right"></td>
                    </tr>

       <tr>
                      <td class="left">G/L Vendor</td>

         <td class="right"><input type="text" name="PDGLVEND" id="PDGLVEND" size
="25" maxlength="25"  value="" ></td>
                    </tr>

    <tr>
                      <td class="left">Routing #</td>

     <td class="right"><input type="text" name="PDEFTABA" id="PDEFTABA" size="25
" maxlength="9"  value="" onKeyPress="numbersOnly(this.value,this);"></td>

               </tr>
                    <tr>
                      <td class="l
eft">Account #</td>
                      <td class="right"><input type="text" n
ame="PDEFTACCT" id="PDEFTACCT" size="30" maxlength="40"  value="" onKeyPress="nu
mbersOnly(this.value,this);"></td>
                    </tr>

 <tr>
                      <td class="left">Account Type</td>

     <td class="right"></td>
                    </tr>
                    <tr>

                      <td class="left">Master User ID:</td>

  <td class="right"><input type="text" name="PDUID"  value="" style="width: 110p
x;"></td>
                    </tr>
                    <tr>

   <td class="left">Master Password:</td>
                      <td class="right
"><input type="text" name="PDUPASS" size="40" maxlength="40" value="" style="wid
th: 110px;"></td>
                    </tr>
                    <tr>

           <td class="left">Manufacturer:</td>
                      <td class="
right"></td>
                    </tr>
                    <tr id="otherManuRow"
 style="display: none;">
                      <td class="left">Other Manufactur
er:</td>
                      <td class="right"><input type="text" name="OMANU"
 size="30" maxlength="40"  value=""></td>
                    </tr>

        <tr> 
                      <td class="left">Products Sold 1:</td>

                 <td class="right"></td>
                    </tr>

       <tr id="otherProd1Row" style="display: none;">
                      <td
class="left">Other Product 1:</td>
                      <td class="right"><inpu
t type="text" name="OPSOLD1" size="30" maxlength="40"  value=""></td>

          </tr>
                    <tr>
                      <td class="left">
Products Sold 2:</td>
                      <td class="right"></td>

        </tr>
                    <tr id="otherProd2Row" style="display: none;">

                      <td class="left">Other Product 2:</td>

    <td class="right"><input type="text" name="OPSOLD2" size="30" maxlength="40"
  value=""></td>
                    </tr>
                    <tr>

          <td class="left">Products Sold 3:</td>
                      <td class
="right"></td>
                    </tr>
                    <tr>

        <td class="left"> Store Decision Model:</td>
                      <td c
lass="right"></td>
                    </tr>
                    <tr>

            <td class="left"> WEB Decision Model:</td>
                      <td
 class="right"></td>
                    </tr>
                    

        
                    
                    
                    <tr id="o
therProd3Row" style="display: none;">
                      <td class="left">Oth
er Product 3:</td>
                      <td class="right"><input type="text" na
me="OPSOLD3" size="30" maxlength="40"  value=""></td>
                    </tr>

                    
                    <tr>
                      <td class="l
eft">Dealer Notes:<br><span id="DLRNOTEcount">0 / 80</span></td>

       <td class="right"><textarea id="DLRNOTE" name="DLRNOTE"  onkeyup="updateC
ounter('DLRNOTE');" rows="5"></textarea></td>
                    </tr>

            <tr>
                      <td class="left">Dealer Notes 2:<br><span
 id="DLRNOTE2count">0 / 80</span></td>
                      <td class="right"><
textarea id="DLRNOTE2" name="DLRNOTE2"  onkeyup="updateCounter('DLRNOTE2');" row
s="5"></textarea></td>
                    </tr>
                    <tr>

                <td class="left">Dealer Notes 3:<br><span id="DLRNOTE3count">0 /
 80</span></td>
                      <td class="right"><textarea id="DLRNOTE3"
name="DLRNOTE3"  onkeyup="updateCounter('DLRNOTE3');" rows="5"></textarea></td>

                    </tr>
                    <tr>
                      <td cla
ss="left">Dealer Notes 4:<br><span id="DLRNOTE4count">0 / 80</span></td>

               <td class="right"><textarea id="DLRNOTE4" name="DLRNOTE4"  onkeyu
p="updateCounter('DLRNOTE4');" rows="5"></textarea></td>
                    </t
r>
                    
                    <tr>
                      <td class
="left">Show dealer alert?</td>
                      <td class="right"><select
id="DLRALTYN" name="DLRALTYN"><option value=""></option><option value="Y">Yes</o
ption><option value="N">No</option></select></td>
                    </tr>

                
                    <tr>
                      <td class="left"
>Dealer Alert Text 1:<br><span id="DLRNOTE5count">0 / 80</span></td>

           <td class="right"><textarea id="DLRNOTE5" name="DLRNOTE5"  onkeyup="u
pdateCounter('DLRNOTE5');" rows="5"></textarea></td>
                    </tr>

                   <tr>
                      <td class="left">Dealer Alert Text
 2:<br><span id="DLRNOTE6count">0 / 80</span></td>
                      <td cla
ss="right"><textarea id="DLRNOTE6" name="DLRNOTE6"  onkeyup="updateCounter('DLRN
OTE6');" rows="5"></textarea></td>
                    </tr>

 <tr>
                    	<td class="left">Use New Web App?</td>

      	<td class="right"></td>
                    </tr>
                    <tr
>
                    	<td class="left">Use New Supplemental App (Finalize)?</td
>
                    	<td class="right"></td>
                    </tr>

             <tr>
                    	<td class="left">Use New Loan List?</td>

                    	<td class="right"></td>
                    </tr>

           <tr>
                    	<td class="left">Use New IBV Routing?</td>

                    	<td class="right"></td>
                    </tr>

           
                    <tr>
                    	<td class="left">API T
oken</td>
                    	<td class="right"><input type="text" name="APITOK
EN" size="30" maxlength="40" value=""></td>
                    </tr>

   
                    <tr>
                      <td class="left"> Rate Tier:<
/td>
                      <td class="right"></td>
                    </tr>
 		
			 <tr>
                      <td class="left">INCENTIVE-30 Day Avg</td>

                <td class="right"><input type="text" name="INCENT_AVERAGE" id="I
NCENT_AVERAGE" size="25" maxlength="9"  value="" onKeyPress="numbersOnly(this.va
lue,this);"></td>
                    </tr>    
                    <tr>

               <td class="left">INCENTIVE-Bonus Discount</td>

    <td class="right"><input type="text" name="INCENT_DISC" id="INCENT_DISC" siz
e="25" maxlength="9"  class="numeric" value=""  ></td>
                    </tr>
   
                    <tr>
                      <td class="left">NEW Dealer-#
 of Days</td>
                      <td class="right"><input type="text" name="N
EW_DAYS" id="NEW_DAYS" size="25" maxlength="9"  value="" onKeyPress="numbersOnly
(this.value,this);"></td>
                    </tr>   
                     <tr>

                      <td class="left">NEW Dealer-Discount</td>

       <td class="right"><input type="text" name="NEW_DISCOUNT" id="NEW_DISCOUNT
" size="25" maxlength="9"  class="numeric" value="" ></td>
                    <
/tr>      	
                    <tr>
         			 <td class="left">EMPL SPIFF-Tr
aining Date:</td>
          			<td class="right"><input type="text" name="EMPL_D
ATE" id="EMPL_DATE" size="10" maxlength="10" value=""></td>
        			</tr>

     			<tr>
                      <td class="left">EMPL SPIFF-# of Days</td>

                    <td class="right"><input type="text" name="EMPL_DAYS" id="EM
PL_DAYS" size="25" maxlength="9"  value="" onKeyPress="numbersOnly(this.value,th
is);"></td>
                    </tr> 
                    <tr>

      <td class="left">EMPL SPIFF-Amount</td>
                      <td class="r
ight"><input type="text" name="EMPL_AMOUNT" id="EMPL_AMOUNT" size="25" maxlength
="9"  value="" onKeyPress="numbersOnly(this.value,this);"></td>

    </tr>  
                     <tr>
                    	<td class="left">Bank
 Stipulation?</td>
                    	<td class="right"></td>

    </tr>
                     <tr>
                    	<td class="left">Dealer
 Signature on Print Docs?</td>
                    	<td class="right"></td>

                </tr>
                      <tr>
                    	<td class=
"left">Include in Text to App Landing Page Search?</td>
                    	<td
 class="right"></td>
                    </tr>
                    <tr>

              <td class="left">SAC - # of Days</td>
                      <td cl
ass="right"><input type="text" name="SAC_DAYS" id="SAC_DAYS" size="25" maxlength
="9"  value="" onKeyPress="numbersOnly(this.value,this);"></td>

    </tr> 
                    
                     <tr>

<td class="left">Potential 1 month volume</td>
                      <td class="
right"><input type="text" name="MOVOLUME" id="MOVOLUME" size="25" maxlength="9"
 value="" onKeyPress="numbersOnly(this.value,this);"></td>
                    <
/tr>  
                    
                    <tr>
                    	<td cl
ass="left">Display Purchase Detail?</td>
                    	<td class="right">
</td>
                    </tr>
                    
                    <tr>

                  	<td class="left">Change Delivery Date?</td>

   	<td class="right"></td>
                    </tr>
                    

               <tr>
                    	<td class="left">Approve All?</td>

                	<td class="right"></td>
                    </tr>

       
                    <tr>
                    	<td class="left">Approve P
ending Deals?</td>
                    	<td class="right"></td>

    </tr>
                    
                    <tr>
                    	<td
 class="left">Enable Address Validation on Apps?</td>
                    	<td c
lass="right"></td>
                    </tr>
                    

      <tr>
                    	<td class="left">Payment Calculator?</td>

              	<td class="right"></td>
                    </tr>

                        
                    <tr>
                    	<td class
="left">Funding List?</td>
                    	<td class="right"></td>

            </tr> 
                                      
                    <t
r>
                    	<td class="left">Partial Funding?</td>

   	<td class="right"></td>
                    </tr>

             
                    <tr>
                    	<td class="left">LTO
 Deposit?</td>
                    	<td class="right"></td>

</tr> 
                                         
                    <tr>

              	<td class="left">LDW Default?</td>
                    	<td class
="right"></td>
                    </tr> 

  
                    <tr>
                    	<td class="left">Additional Dow
n Payment?</td>
                    	<td class="right"></td>

 </tr>  
                                    
                    <tr>

           	<td class="left">Protection Plan Fee?</td>
                    	<td
class="right"></td>
                    </tr> 


                    <tr>
                    	<td class="left">Delivery Fee?</t
d>
                    	<td class="right"></td>
                    </tr>

              
                    <tr>
                    	<td class="left">Us
e No Credit Model?</td>
                    	<td class="right"></td>

         </tr>  
                                 
                    <tr>

                	<td class="left">ABA Search?</td>
                    	<td clas
s="right"></td>
                    </tr>  

 
                    <tr>
                    	<td class="left">Enable New Docu
sign Account?</td>
                    	<td class="right"></td>

    </tr>
                    
                    <tr>
                    	<td
 class="left">Deny Prepaid Cards?</td>
                    	<td class="right"></
td>
                    </tr> 
                    
                    <tr>

                 	<td class="left">IBV Prepaid Cards?</td>
                    	
<td class="right"></td>
                    </tr>
                    

           <tr>
                    	<td class="left">Convert Bank Statement Sti
ps to IBV?</td>
                    	<td class="right"></td>

 </tr>                    
                                    

    <tr>
                    	<td class="left">App Expiration Days</td>

            	<td class="right"></td>
                    </tr> 

                      
                    <tr><!-- MD SALES-219 -->

         	<td class="left">STORIS Fast Path?</td>
                    	<td class
="right"></td>
                    </tr>
                    

   <tr><!-- MD SALES-275 -->
                    	<td class="left">Fund on Parti
al Delivery?</td>
                    	<td class="right"></td>

   </tr>
                    
                  </table>
                </td>

               <td class="stateTable">
                  <table id="stateOfBus"
style="width: 230px; margin-top: 10px;">
                    

</table>
                </td>
                <td class="loanProd">

       <table id="loanProd" style="width: 270px; margin-top: 10px;">

         
                  </table>
                </td>
              </tr>

           </table>
            <script type="text/javascript">
			var protkey =
 "";   
			if( == 0)
			{
				xl_GetFormElementByName("mode").value = "Add";
			
} 
			else 
			{
				protkey  = xl_GetFormElementByName("PDNO");
				protkey.rea
dOnly = true;
				//protkey.className = protkey.className + " disabled";
				xl_
GetFormElementByName("mode").value = "Change";
			}
		</script>		
          </fo
rm>
        </div><!--editcontents-->
      </div><!--whiteBg-->
    </div><!--w
rapping-->
  </body>
  <script type="text/javascript">
function checkClient()
{

	if("" == "105" || "" == "905")
	{
		document.getElementById('header2').innerHTM
L = "";	
		document.getElementById('header3').innerHTML = "";
	}	
}
function sho
wOtherRows()
{
	var otMfgRow = document.getElementById('otherManuRow');
	var otM
fgVal = document.getElementById('MFGNAME').value;
	var otProd1Row = document.get
ElementById('otherProd1Row');
	var otProd1Val = document.getElementById('PRODSOL
D1').value;
	var otProd2Row = document.getElementById('otherProd2Row');
	var otP
rod2Val = document.getElementById('PRODSOLD2').value;
	var otProd3Row = document
.getElementById('otherProd3Row');
	var otProd3Val = document.getElementById('PRO
DSOLD3').value;
	
	if(otMfgVal == "OTHE/Other" || otMfgVal == "OT/Other")
	{
		o
tMfgRow.style.display = "";
	}
	else
	{
		otMfgRow.style.display = "none";
	}
	i
f(otProd1Val == "OTHER/Other" || otProd1Val == "OT/Other")
	{
		otProd1Row.style
.display = "";
	}
	else
	{
		otProd1Row.style.display = "none";
	}
	if(otProd2Va
l == "OTHER/Other" || otProd2Val == "OT/Other")
	{
		otProd2Row.style.display =
"";
	}
	else
	{
		otProd2Row.style.display = "none";
	}
	if(otProd3Val == "OTHER
/Other" || otProd3Val == "OT/Other")
	{
		otProd3Row.style.display = "";
	}
	els
e
	{
		otProd3Row.style.display = "none";
	}	
}
function formatZip(id)
{
	var zi
p = document.getElementById(id).value;
	var newZip = zip + "-0000";
	if(zip != "
")
	{
		if(zip.length < 6)
		{
			document.getElementById(id).value = newZip;	
	
	}
	}	
}
function mask(inputString,textbox,delimiterLocations,delimeter){
	//onl
y allow numeric input
    var characterTyped = inputString.substring(inputString
.length - 1);
    if (characterTyped != '0'
        && characterTyped != '1'

     && characterTyped != '2'
        && characterTyped != '3'
        && charac
terTyped != '4'
        && characterTyped != '5'
        && characterTyped != '6
'
        && characterTyped != '7'
        && characterTyped != '8'
        && c
haracterTyped != '9')
    {
        textbox.value = inputString.substring(0,inpu
tString.length - 1);
        return;
    }
    
    var locations = delimiterLoc
ations.split(',');
    
    for (var i = 0; i <= locations.length; i++)
    {

      for (var k = 0; k <= inputString.length; k++)
        {
            if (k
== locations[i])
            {
                if (inputString.substring(k, k+1)
 != delimeter)
                {
                    inputString = inputString.s
ubstring(0,k) + delimeter + inputString.substring(k,inputString.length);

         }
            }
        }
    }
    textbox.value = inputString;
}
func
tion numbersOnly(inputString,textbox){
	var characterTyped = inputString.substri
ng(inputString.length - 1);
	if (characterTyped != '0'
	&& characterTyped != '1'

	&& characterTyped != '2'
	&& characterTyped != '3'
	&& characterTyped != '4'
	
&& characterTyped != '5'
	&& characterTyped != '6'
	&& characterTyped != '7'
	&&
 characterTyped != '8'
	&& characterTyped != '9'
	&& characterTyped != '.'
	&& c
haracterTyped != '/')
{
textbox.value = inputString.substring(0,inputString.leng
th - 1);
return;
}
}
function zeroFill( number, width )
{
  width -= number.toSt
ring().length;
  if ( width > 0 )
  {
    return new Array( width + (/\./.test(
number ) ? 2 : 1) ).join( '0' ) + number;
  }
  return number + ""; // always re
turn a string
}


function fixRouting()
{
	
	var mod = document.getElementById('
PDEFTABA').value;
	var res = zeroFill(mod,9);
	document.getElementById('PDEFTABA
').value = res;
}

function fixTaxId()
{
	
	var mod = document.getElementById('P
DTIN').value;
	var res = zeroFill(mod,10);
	document.getElementById('PDTIN').val
ue = res;	
	
	
}

function clearFld(id)
{
document.getElementById(id).value="";	

}

function checkMode()
{

var mode=document.getElementById('mode').value;
if (
mode=="Add")
{
	clearFld("PDTIN");
	clearFld("PDZIP");
	clearFld("PDEFTABA");
}


if (mode == "Change")
{
if (document.getElementById("PDZIP").value == "00000000
00")
{
clearFld("PDZIP");	
}

if (document.getElementById("PDTIN").value == "000
00000000")
{
clearFld("PDTIN");	
}

if (document.getElementById("PDEFTABA").valu
e == "000000000")
{
clearFld("PDEFTABA");	
}
}
}
	
function fixZip()
{
	
var mod
 = document.getElementById('PDZIP').value;
var res = zeroFill(mod,10);
document.
getElementById('PDZIP').value = res;	
	
}
function subDealer()
{
	document.deale
rForm.submit();	
}
function updateCounter(fldId)
{
	var txt = document.getElemen
tById(fldId);
	var txtVal = document.getElementById(fldId).value;
	var countId =
 fldId + "count";
	
	if(txtVal.length > 80)
	{
		txtVal = txtVal.substr(0,80);	

		txt.value = txtVal;
	}
	
	document.getElementById(countId).innerHTML = txtVal.
length + " / 80";	
}
function setDlrAltDropDown()
{
	$("select#DLRALTYN").val(""
);
}

function setMaxAmt(amt)
{
	var maxAmt = amt;
	$("#WPROCD").val(amt);	
}
up
dateCounter('DLRNOTE');
updateCounter('DLRNOTE2');
updateCounter('DLRNOTE3');
up
dateCounter('DLRNOTE4');
updateCounter('DLRNOTE5');
updateCounter('DLRNOTE6');
s
howOtherRows();
setDlrAltDropDown();
</script>
</html>
**CTDATA H__7        lawyer_emls                      190
<tr>
  <td>
    <button style="margin-left:10px; margin-top:10px;" type="button"
 name="lemails" onclick="location.href='/kwik/glf/lawyer_emails.php';">Download
Emails</button> 
  </td>
</tr>

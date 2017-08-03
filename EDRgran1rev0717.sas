/*****************************************************
PROJECT: DARPA data analysis
FOR: Shennan Weiss
AUTHOR: INNA CHERVONEVA
DATE; 05/17
********************************************************/
OPTIONS LS = 80 PS = 55;
libname SW 'Y:\Documents\ICH_projects\consults\Weiss_Sh\darpa_stats\EDR';
/*
proc import datafile="Y:\Documents\ICH_projects\consults\Weiss_Sh\darpa_stats\EDRgran1rev.csv" 
out=SW.gran1rev dbms=dlm  replace;
delimiter='|';
 getnames=yes;
run;
*/;


data SW.gran1; set SW.gran1rev; tottrials=12; NotRemembered=12-Remembered; 
if EeventsL > 0  then do; EeventsL_th=EeventsL*1000; I_EeventsL=1; end;
   else if EeventsL ne '.' then do; EeventsL_th=0; I_EeventsL=0; end;
if EeventsR > 0  then do; EeventsR_th=EeventsR*1000; I_EeventsR=1; end;
   else if EeventsR ne '.' then do; EeventsR_th=0; I_EeventsR=0; end;

if DeventsL > 0  then do; DeventsL_th=DeventsL*1000; I_DeventsL=1; end;
   else if DeventsL ne '.' then do; DeventsL_th=0; I_DeventsL=0; end;
if DeventsR > 0  then do; DeventsR_th=DeventsR*1000; I_DeventsR=1; end;
   else if DeventsR ne '.' then do; DeventsR_th=0; I_DeventsR=0; end;

if ReventsL > 0  then do; ReventsL_th=ReventsL*1000; I_ReventsL=1; end;
   else if ReventsL ne '.' then do; ReventsL_th=0; I_ReventsL=0; end;
if ReventsR > 0  then do; ReventsR_th=ReventsR*1000; I_ReventsR=1; end;
   else if ReventsR ne '.' then do; ReventsR_th=0; I_ReventsR=0; end;
*** Trons;
if EtronsL > 0  then do; EtronsL_th=EtronsL*1000; I_EtronsL=1; end;
   else if EtronsL ne '.' then do; EtronsL_th=0; I_EtronsL=0; end;
if EtronsR > 0  then do; EtronsR_th=EtronsR*1000; I_EtronsR=1; end;
   else if EtronsR ne '.' then do; EtronsR_th=0; I_EtronsR=0; end;

if DtronsL > 0  then do; DtronsL_th=DtronsL*1000; I_DtronsL=1; end;
   else if DtronsL ne '.' then do; DtronsL_th=0; I_DtronsL=0; end;
if DtronsR > 0  then do; DtronsR_th=DtronsR*1000; I_DtronsR=1; end;
   else if DtronsR ne '.' then do; DtronsR_th=0; I_DtronsR=0; end;

if RtronsL > 0  then do; RtronsL_th=RtronsL*1000; I_RtronsL=1; end;
   else if RtronsL ne '.' then do; RtronsL_th=0; I_RtronsL=0; end;
if RtronsR > 0  then do; RtronsR_th=RtronsR*1000; I_RtronsR=1; end;
   else if RtronsR ne '.' then do; RtronsR_th=0; I_RtronsR=0; end;
*** Frons;
if EfronsL > 0  then do; EfronsL_th=EfronsL*1000; I_EfronsL=1; end;
   else if EfronsL ne '.' then do; EfronsL_th=0; I_EfronsL=0; end;
if EfronsR > 0  then do; EfronsR_th=EfronsR*1000; I_EfronsR=1; end;
   else if EfronsR ne '.' then do; EfronsR_th=0; I_EfronsR=0; end;

if DfronsL > 0  then do; DfronsL_th=DfronsL*1000; I_DfronsL=1; end;
   else if DfronsL ne '.' then do; DfronsL_th=0; I_DfronsL=0; end;
if DfronsR > 0  then do; DfronsR_th=DfronsR*1000; I_DfronsR=1; end;
   else if DfronsR ne '.' then do; DfronsR_th=0; I_DfronsR=0; end;

if RfronsL > 0  then do; RfronsL_th=RfronsL*1000; I_RfronsL=1; end;
   else if RfronsL ne '.' then do; RfronsL_th=0; I_RfronsL=0; end;
if RfronsR > 0  then do; RfronsR_th=RfronsR*1000;  I_RfronsR=1; end;
   else if RfronsR ne '.' then do; RfronsR_th=0; I_RfronsR=0; end;
*** RonO;
if EronoL > 0  then do; EronoL_th=EronoL*1000; I_EronoL=1; end;
   else if EronoL ne '.' then do; EronoL_th=0; I_EronoL=0; end;
if EronoR > 0  then do; EronoR_th=EronoR*1000; I_EronoR=1; end;
   else if EronoR ne '.' then do; EronoR_th=0; I_EronoR=0; end;

if DronoL > 0  then do; DronoL_th=DronoL*1000; I_DronoL=1; end;
   else if DronoL ne '.' then do; DronoL_th=0; I_DronoL=0; end;
if DronoR > 0  then do; DronoR_th=DronoR*1000; I_DronoR=1; end;
   else if DronoR ne '.' then do; DronoR_th=0; I_DronoR=0; end;

if RronoL > 0  then do; RronoL_th=RronoL*1000; I_RronoL=1; end;
   else if RronoL ne '.' then do; RronoL_th=0; I_RronoL=0; end;
if RronoR > 0  then do; RronoR_th=RronoR*1000; I_RronoR=1; end;
   else if RronoR ne '.' then do; RronoR_th=0; I_RronoR=0; end;
run;

**** **** model with 1000*event rates ;
proc genmod data=SW.gran1 ;
 class Subject /PARAM=GLM;
model NotRemembered/tottrials = 
I_EeventsL EeventsL_th I_EeventsR EeventsR_th 
I_DeventsL DeventsL_th I_DeventsR DeventsR_th
I_ReventsL ReventsL_th I_ReventsR ReventsR_th/ CL dist=bin; run;

proc genmod data=SW.gran1 ;
 class Subject /PARAM=GLM;
model Remembered/tottrials = 
I_EeventsL EeventsL_th I_EeventsR EeventsR_th 
I_DeventsL DeventsL_th I_DeventsR DeventsR_th
I_ReventsL ReventsL_th I_ReventsR ReventsR_th/ LRCL dist=bin;
 REPEATED SUBJECT=Subject/ TYPE=EXCH;
  contrast 'EeventsL' I_EeventsL 1, EeventsL_th 1/E; * wald ;
   contrast 'EeventsR' I_EeventsR 1, EeventsR_th 1/E; * wald ;
    contrast 'DeventsL' I_DeventsL 1, DeventsL_th 1/E; * wald ;
	  contrast 'DeventsR' I_DeventsR 1, DeventsR_th 1/E; * wald ;
       contrast 'ReventsL' I_ReventsL 1, ReventsL_th 1/E; * wald ;
         contrast 'ReventsR' I_ReventsR 1, ReventsR_th 1/E; * wald ;
 ods output  Contrasts=SW.Contr_all GEEEmpPEst=SW.Parms_all;
 run;
 
 proc print data=SW.Contr_all; run;
 proc print data=SW.Parms_all; run;

**** **** model with event rates ;
proc genmod data=SW.gran1 ;
 class Subject /PARAM=GLM;
model Remembered/tottrials = 
I_EeventsL EeventsL I_EeventsR EeventsR 
I_DeventsL DeventsL I_DeventsR DeventsR
I_ReventsL ReventsL I_ReventsR ReventsR/ CL dist=bin; run;

proc freq data=SW.gran1; table EeventsL*I_EeventsL EeventsR*I_EeventsR; run;

**** **** model with log counts of events ;
proc genmod data=SW.gran1 ;
 class Subject /PARAM=GLM;
model NotRemembered/tottrials = 
I_EeventsL EeventsL I_EeventsR EeventsR 
I_DeventsL DeventsL I_DeventsR DeventsR
I_ReventsL ReventsL I_ReventsR ReventsR/ CL dist=bin; 
 REPEATED SUBJECT=Subject/ TYPE=EXCH;
  contrast 'EeventsL' I_EeventsL 1, EeventsL 1/E;
   contrast 'EeventsR' I_EeventsR 1, EeventsR 1/E;
    contrast 'DeventsL' I_DeventsL 1, DeventsL 1/E;
	  contrast 'DeventsR' I_DeventsR 1, DeventsR 1/E;
       contrast 'ReventsL' I_ReventsL 1, ReventsL 1/E;
         contrast 'ReventsR' I_ReventsR 1, ReventsR 1/ E;
 ods output  Contrasts=SW.Contr_all GEEEmpPEst=SW.Parms_all;
 run;

 proc print data=SW.Contr_all; run;
 proc print data=SW.Parms_all; run;

 data SW.gran1; set SW.gran1; 
 allEvents=I_EeventsL+I_EeventsR+I_DeventsL+I_DeventsR+I_ReventsL+I_ReventsR; 
if allEvents > 0 then anyEvents=1;  run;

proc freq data=SW.gran1; table Subject*anyEvents; 
 ods output CrossTabFreqs=eventsbysubj; run;

data SubjWithevents(keep=Subject Frequency); set eventsbysubj; 
if anyEvents=1; if Frequency > 0; run;

 **** ****  **** ****  **** **** limit to subjects with any events;
proc sort data=SubjWithevents; by Subject; run;
proc sort data=SW.gran1; by Subject; run;
data SW.gran1SubjWevents; 
 merge SW.gran1 SubjWithevents; by Subject; 
  if Subject ne '.'; if Frequency ne '.'; run;

proc genmod data=SW.gran1SubjWevents;
 class Subject /PARAM=GLM;
model NotRemembered/tottrials = 
I_EeventsL EeventsL I_EeventsR EeventsR 
I_DeventsL DeventsL I_DeventsR DeventsR
I_ReventsL ReventsL I_ReventsR ReventsR/ CL dist=bin; 
 REPEATED SUBJECT=Subject/ TYPE=EXCH;
  contrast 'EeventsL' I_EeventsL 1, EeventsL_th 1/E; * wald ;
   contrast 'EeventsR' I_EeventsR 1, EeventsR_th 1/E; * wald ;
    contrast 'DeventsL' I_DeventsL 1, DeventsL_th 1/E; * wald ;
	  contrast 'DeventsR' I_DeventsR 1, DeventsR_th 1/E; * wald ;
       contrast 'ReventsL' I_ReventsL 1, ReventsL_th 1/E; * wald ;
         contrast 'ReventsR' I_ReventsR 1, ReventsR_th 1/E; * wald ;
 ods output  Contrasts=SW.Contr_all_15 GEEEmpPEst=SW.Parms_all_15;
 run;

 proc print data=SW.Contr_all_15; run;
 proc print data=SW.Parms_all_15; run;

 **** **** model with rates of events by type;
proc genmod data=SW.gran1 ;
 class Subject /PARAM=GLM;
model Remembered/tottrials = 
I_EtronsL EtronsL_th I_EtronsR EtronsR_th  
I_EfronsL EfronsL_th I_EfronsR EfronsR_th 
 I_EronoL EronoL_th  I_EronoR EronoR_th 
I_DtronsL DtronsL_th I_DtronsR DtronsR_th  
I_DfronsL DfronsL_th I_DfronsR DfronsR_th 
 I_DronoL DronoL_th  I_DronoR DronoR_th 
I_RtronsL RtronsL_th I_RtronsR RtronsR_th  
I_RfronsL RfronsL_th I_RfronsR RfronsR_th 
 I_RronoL RronoL_th  I_RronoR RronoR_th 
/ CL dist=bin;
 REPEATED SUBJECT=Subject/ TYPE=EXCH;

  contrast 'EfronsL' I_EfronsL 1, EfronsL_th 1;
   contrast 'EfronsR' I_EfronsR 1, EfronsR_th 1;
    contrast 'DfronsL' I_DfronsL 1, DfronsL_th 1;
	  contrast 'DfronsR' I_DfronsR 1, DfronsR_th 1;
       contrast 'RfronsL' I_RfronsL 1, RfronsL_th 1;
         contrast 'RfronsR' I_RfronsR 1, RfronsR_th 1;

  contrast 'EtronsL' I_EtronsL 1, EtronsL_th 1;
   contrast 'EtronsR' I_EtronsR 1, EtronsR_th 1;
    contrast 'DtronsL' I_DtronsL 1, DtronsL_th 1;
	  contrast 'DtronsR' I_DtronsR 1, DtronsR_th 1;
       contrast 'RtronsL' I_RtronsL 1, RtronsL_th 1;
         contrast 'RtronsR' I_RtronsR 1, RtronsR_th 1;

  contrast 'EronoL' I_EronoL 1, EronoL_th 1;
   contrast 'EronoR' I_EronoR 1, EronoR_th 1;
    contrast 'DronoL' I_DronoL 1, DronoL_th 1;
	  contrast 'DronoR' I_DronoR 1, DronoR_th 1;
       contrast 'RronoL' I_RronoL 1, RronoL_th 1;
         contrast 'RronoR' I_RronoR 1, RronoR_th 1;

 ods output Contrasts=SW.Contr_sep GEEEmpPEst=SW.Parms_sep;
 run;

 proc print data=SW.Contr_sep; run;
  proc print data=SW.Parms_sep; run;

 
 **** **** model with rates of events by type in 15 patients;

proc genmod data=SW.gran1SubjWevents;
 class Subject /PARAM=GLM;
model Remembered/tottrials = 
I_EtronsL EtronsL_th I_EtronsR EtronsR_th  
I_EfronsL EfronsL_th I_EfronsR EfronsR_th 
 I_EronoL EronoL_th  I_EronoR EronoR_th 
I_DtronsL DtronsL_th I_DtronsR DtronsR_th  
I_DfronsL DfronsL_th I_DfronsR DfronsR_th 
 I_DronoL DronoL_th  I_DronoR DronoR_th 
I_RtronsL RtronsL_th I_RtronsR RtronsR_th  
I_RfronsL RfronsL_th I_RfronsR RfronsR_th 
 I_RronoL RronoL_th  I_RronoR RronoR_th 
/ CL dist=bin;
 REPEATED SUBJECT=Subject/ TYPE=EXCH;

  contrast 'EfronsL' I_EfronsL 1, EfronsL_th 1;
   contrast 'EfronsR' I_EfronsR 1, EfronsR_th 1;
    contrast 'DfronsL' I_DfronsL 1, DfronsL_th 1;
	  contrast 'DfronsR' I_DfronsR 1, DfronsR_th 1;
       contrast 'RfronsL' I_RfronsL 1, RfronsL_th 1;
         contrast 'RfronsR' I_RfronsR 1, RfronsR_th 1;

  contrast 'EtronsL' I_EtronsL 1, EtronsL_th 1;
   contrast 'EtronsR' I_EtronsR 1, EtronsR_th 1;
    contrast 'DtronsL' I_DtronsL 1, DtronsL_th 1;
	  contrast 'DtronsR' I_DtronsR 1, DtronsR_th 1;
       contrast 'RtronsL' I_RtronsL 1, RtronsL_th 1;
         contrast 'RtronsR' I_RtronsR 1, RtronsR_th 1;

  contrast 'EronoL' I_EronoL 1, EronoL_th 1;
   contrast 'EronoR' I_EronoR 1, EronoR_th 1;
    contrast 'DronoL' I_DronoL 1, DronoL_th 1;
	  contrast 'DronoR' I_DronoR 1, DronoR_th 1;
       contrast 'RronoL' I_RronoL 1, RronoL_th 1;
         contrast 'RronoR' I_RronoR 1, RronoR_th 1;

 ods output Contrasts=SW.Contr_sep_15 GEEEmpPEst=SW.Parms_sep_15;
 run;

 proc print data=SW.Contr_sep_15; run;
  proc print data=SW.Parms_sep_15; run;

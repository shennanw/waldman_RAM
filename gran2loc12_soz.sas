/*****************************************************
PROJECT: DARPA data analysis
FOR: Shennan Weiss
AUTHOR: INNA CHERVONEVA
DATE; 05/17
********************************************************/
OPTIONS LS = 80 PS = 55;
libname SW 'Y:\Documents\ICH_projects\consults\Weiss_Sh\darpa_stats';

proc import datafile="Y:\Documents\ICH_projects\consults\Weiss_Sh\darpa_stats\gran2loc12.csv" 
out=SW.gran2loc12 dbms=dlm  replace;
delimiter='|';
 getnames=yes;
run;
*/;
proc freq data=SW.gran2loc12; table soz*Remembered*event /list; by location; 
 ods output List=SW.EventsFreqs_gran2loc12_soz; run;

***** model for events 1 and 2 indicators only;
proc genmod data=SW.gran2loc12 descending;
 class Subject soz uniqBL event(ref=FIRST);
model Remembered = event*soz/ CL dist=B; by location;
 LSMEANS event*soz/ exp cl diff;
REPEATED SUBJECT=Subject/SUBCLUSTER=uniqBL LOGOR=NEST1;
 ods output LSMeans=SW.LSMgran2loc12_soz Diffs=SW.DiffLSMgran2loc12_soz; run;

data SW.DiffLSMgran2loc12_soz; set SW.DiffLSMgran2loc12_soz; if SOZ=_SOZ; run;
/*
proc print data=SW.DiffLSMgran2loc12_soz; run;

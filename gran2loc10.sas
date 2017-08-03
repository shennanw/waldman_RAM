/*****************************************************
PROJECT: DARPA data analysis
FOR: Shennan Weiss
AUTHOR: INNA CHERVONEVA
DATE; 05/17
********************************************************/
OPTIONS LS = 80 PS = 55;
libname SW 'Y:\Documents\ICH_projects\consults\Weiss_Sh\darpa_stats';
/*
proc import datafile="Y:\Documents\ICH_projects\consults\Weiss_Sh\darpa_stats\gran2loc10.csv" 
out=SW.gran2loc10 dbms=dlm  replace;
delimiter='|';
 getnames=yes;
run;
*/;
proc freq data=SW.gran2loc10; table Subject*event; run;

proc freq data=SW.gran2loc10; table Remembered*event /list; by location; 
 ods output List=SW.EventsFreqs_gran2loc10; run;

***** exclude type 3 events and replace NAs; 
data gran2loc10event1; set SW.gran2loc10; if event=1;  
magnitudeN_6=magnitudeN/1000000; 
frequencyN_3=frequencyN/1000;
onsetN_3=onsetN/1000; run;

proc means data=gran2loc10event1; 
var magnitudeN_6 frequencyN_3 onsetN_3; by location;
output out=SW.event1meansloc10 mean=Mmagn Mfreq Monset; run;

***** compute the means for event=1; 
data gran2loc10wo3; set SW.gran2loc10; 
if event < 2.5;  _TYPE_=0;
magnitudeN_6=magnitudeN/1000000; 
frequencyN_3=frequencyN/1000;
onsetN_3=onsetN/1000; run;

data gran2loc10wo3; merge gran2loc10wo3 SW.event1meansloc10; by _TYPE_;
 if magnitudeN_6 > 0 then magnitudeC=magnitudeN_6-Mmagn; else magnitudeC=magnitudeN_6;
 if frequencyN_3 > 0 then frequencyC=frequencyN_3-Mfreq; else frequencyC=frequencyN_3;
 if onsetN_3 > 0 then onsetC=onsetN_3-Mfreq; else onsetC=onsetN_3; run;


***** model for events 1 and 2 indicators only;
proc genmod data=gran2loc10wo3 descending;
 class Subject uniqBL event(ref=FIRST);
model Remembered = event/ CL dist=B;
 LSMEANS event/ exp cl diff; by location;
REPEATED SUBJECT=Subject/SUBCLUSTER=uniqBL LOGOR=NEST1;
 ods output LSMeans=SW.LSMgran2loc10 Diffs=SW.DiffLSMgran2loc10; run;

***** model for events 1 and 2 indicators AND measures of event 1;
proc genmod data=gran2loc10wo3 descending;
 class Subject uniqBL event(ref=FIRST);
model Remembered = event magnitudeC frequencyC onsetC/ CL dist=B;
 LSMEANS event/ exp cl diff;  by location;
REPEATED SUBJECT=Subject/SUBCLUSTER=uniqBL LOGOR=NEST1;
 ods output LSMeans=SW.LSM_wnm_gran2loc10 Diffs=SW.DiffLSM_wnm_gran2loc10
GEEEmpPEst=SW.Parms_wnm_gran2loc10; run;

/*****************************************************
PROJECT: DARPA data analysis
FOR: Shennan Weiss
AUTHOR: INNA CHERVONEVA
DATE; 05/17
********************************************************/
OPTIONS LS = 80 PS = 55;
libname SW 'Y:\Documents\ICH_projects\consults\Weiss_Sh\darpa_stats';
/*
proc import datafile="Y:\Documents\ICH_projects\consults\Weiss_Sh\darpa_stats\gran2loc8.csv" 
out=SW.gran2loc8 dbms=dlm  replace;
delimiter='|';
 getnames=yes;
run;
*/;
proc freq data=SW.gran2loc8; table Subject*event; run;

proc freq data=SW.gran2loc8; table Remembered*event /list; by location; 
 ods output List=SW.EventsFreqs_gran2loc8; run;

***** exclude type 3 events and replace NAs; 
data gran2loc8event1; set SW.gran2loc8; if event=1;  
magnitudeN_6=magnitudeN/1000000; 
frequencyN_3=frequencyN/1000;
onsetN_3=onsetN/1000; run;
***** compute the means for event=1; 
proc means data=gran2loc8event1; 
var magnitudeN_6 frequencyN_3 onsetN_3; by location;
output out=SW.event1meansloc8 mean=Mmagn Mfreq Monset; run;

data gran2loc8wo3; set SW.gran2loc8; 
if event < 2.5;  _TYPE_=0;
magnitudeN_6=magnitudeN/1000000; 
frequencyN_3=frequencyN/1000;
onsetN_3=onsetN/1000; run;

data gran2loc8wo3; merge gran2loc8wo3 SW.event1meansloc8; by _TYPE_;
 if magnitudeN_6 > 0 then magnitudeC=magnitudeN_6-Mmagn; else magnitudeC=magnitudeN_6;
 if frequencyN_3 > 0 then frequencyC=frequencyN_3-Mfreq; else frequencyC=frequencyN_3;
 if onsetN_3 > 0 then onsetC=onsetN_3-Mfreq; else onsetC=onsetN_3; 
magnitude3=0; frequency3=0; onset3=0; run;

***** ***** ***** ***** ***** ***** ***** ***** **** event=3;
data gran2loc8event3; set SW.gran2loc8; if event=3;  
magnitudeN_6=magnitudeN/1000000; _TYPE_=0;
frequencyN_3=frequencyN/1000;
onsetN_3=onsetN/1000; run;

***** compute the means for event=3;
proc means data=gran2loc8event3; 
var magnitudeN_6 frequencyN_3 onsetN_3; by location;
output out=SW.event3meansloc8 mean=Mmagn Mfreq Monset; run;

data gran2loc8only3; merge gran2loc8event3 SW.event3meansloc8; by _TYPE_;
 if magnitudeN_6 > 0 then magnitude3=magnitudeN_6-Mmagn; else magnitude3=magnitudeN_6;
 if frequencyN_3 > 0 then frequency3=frequencyN_3-Mfreq; else frequency3=frequencyN_3;
 if onsetN_3 > 0 then onset3=onsetN_3-Mfreq; else onset3=onsetN_3; 
magnitudeC=0; frequencyC=0; onsetC=0;
run;

 data gran2loc8_WITH3; set gran2loc8wo3 gran2loc8only3; run;

proc genmod data=gran2loc8_WITH3 descending;
 class Subject uniqBL event(ref=FIRST);
model Remembered = event magnitudeC frequencyC onsetC 
magnitude3 frequency3 onset3/ CL dist=B;
 LSMEANS event/ exp cl diff; by location;
REPEATED SUBJECT=Subject/SUBCLUSTER=uniqBL LOGOR=NEST1;
 ods output LSMeans=SW.LSM_w3_gran2loc8 Diffs=SW.DiffLSM_w3_gran2loc8
GEEEmpPEst=SW.Parms_w3_gran2loc8; run;


***** model for events 1 and 2 indicators only;
proc genmod data=gran2loc8wo3 descending;
 class Subject uniqBL event(ref=FIRST);
model Remembered = event/ CL dist=B;
 LSMEANS event/ exp cl diff;  by location; 
REPEATED SUBJECT=Subject/SUBCLUSTER=uniqBL LOGOR=NEST1;
 ods output LSMeans=SW.LSMgran2loc8 Diffs=SW.DiffLSMgran2loc8; run;

***** model for events 1 and 2 indicators AND measures of event 1;
proc genmod data=gran2loc8wo3 descending;
 class Subject uniqBL event(ref=FIRST);  by location; 
model Remembered = event magnitudeC frequencyC onsetC/ CL dist=B;
 LSMEANS event/ exp cl diff;
REPEATED SUBJECT=Subject/SUBCLUSTER=uniqBL LOGOR=NEST1;
 ods output LSMeans=SW.LSM_wnm_gran2loc8 Diffs=SW.DiffLSM_wnm_gran2loc8
GEEEmpPEst=SW.Parms_wnm_gran2loc8; run;

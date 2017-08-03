/*****************************************************
PROJECT: DARPA data analysis
FOR: Shennan Weiss
AUTHOR: INNA CHERVONEVA
DATE; 05/17
********************************************************/
OPTIONS LS = 80 PS = 55;
libname SW 'Y:\Documents\ICH_projects\consults\Weiss_Sh\darpa_stats';

data SW.FreqTable; set SW.EventsFreqs_gran2loc1 SW.EventsFreqs_gran2loc2 
SW.EventsFreqs_gran2loc3 SW.EventsFreqs_gran2loc4 SW.EventsFreqs_gran2loc5
SW.EventsFreqs_gran2loc6 SW.EventsFreqs_gran2loc7 SW.EventsFreqs_gran2loc8
SW.EventsFreqs_gran2loc9 SW.EventsFreqs_gran2loc10 SW.EventsFreqs_gran2loc11
SW.EventsFreqs_gran2loc12; run;
proc print data=SW.FreqTable; run;

data SW.LSMgran2; set SW.LSMgran2loc1 SW.LSMgran2loc2 SW.LSMgran2loc3 SW.LSMgran2loc4
SW.LSMgran2loc5 SW.LSMgran2loc6 SW.LSMgran2loc7 SW.LSMgran2loc8 
SW.LSMgran2loc10 SW.LSMgran2loc11 SW.LSMgran2loc12; run;
proc print data=SW.LSMgran2; run;

data SW.DiffLSMgran2; set SW.DiffLSMgran2loc1 SW.DiffLSMgran2loc2 
SW.DiffLSMgran2loc3 SW.DiffLSMgran2loc4 SW.DiffLSMgran2loc5 
SW.DiffLSMgran2loc6 SW.DiffLSMgran2loc7 SW.DiffLSMgran2loc8 
SW.DiffLSMgran2loc10 SW.DiffLSMgran2loc11 SW.DiffLSMgran2loc12; run;
proc print data=SW.DiffLSMgran2; run;

data SW.event1means; set SW.event1meansloc1 SW.event1meansloc2 SW.event1meansloc3 SW.event1meansloc4
SW.event1meansloc5 SW.event1meansloc6 SW.event1meansloc7 SW.event1meansloc8 
SW.event1meansloc10 SW.event1meansloc11 SW.event1meansloc12; run;
proc print data=SW.event1means; run;

data SW.Parms_wnm_gran2; set SW.Parms_wnm_gran2loc1 SW.Parms_wnm_gran2loc2 
SW.Parms_wnm_gran2loc3 SW.Parms_wnm_gran2loc4 SW.Parms_wnm_gran2loc5 
SW.Parms_wnm_gran2loc6 SW.Parms_wnm_gran2loc7 SW.Parms_wnm_gran2loc8 
SW.Parms_wnm_gran2loc10 SW.Parms_wnm_gran2loc11 SW.Parms_wnm_gran2loc12; run;
proc sort data=SW.Parms_wnm_gran2; by Parm; run;
proc print data=SW.Parms_wnm_gran2; run;

data SW.LSM_wnm_gran2; set SW.LSM_wnm_gran2loc1 SW.LSM_wnm_gran2loc2 SW.LSM_wnm_gran2loc3 SW.LSM_wnm_gran2loc4
SW.LSM_wnm_gran2loc5 SW.LSM_wnm_gran2loc6 SW.LSM_wnm_gran2loc7 SW.LSM_wnm_gran2loc8 
SW.LSM_wnm_gran2loc10 SW.LSM_wnm_gran2loc11 SW.LSM_wnm_gran2loc12; run;
proc print data=SW.LSM_wnm_gran2; run;

data SW.DiffLSM_wnm_gran2; set SW.DiffLSM_wnm_gran2loc1 SW.DiffLSM_wnm_gran2loc2 
SW.DiffLSM_wnm_gran2loc3 SW.DiffLSM_wnm_gran2loc4 SW.DiffLSM_wnm_gran2loc5 
SW.DiffLSM_wnm_gran2loc6 SW.DiffLSM_wnm_gran2loc7 SW.DiffLSM_wnm_gran2loc8 
SW.DiffLSM_wnm_gran2loc10 SW.DiffLSM_wnm_gran2loc11 SW.DiffLSM_wnm_gran2loc12; run;
proc print data=SW.DiffLSM_wnm_gran2; run;

******************* models with event=3;
data SW.LSM_w3_gran2; set  SW.LSM_w3_gran2loc2 SW.LSM_w3_gran2loc6
SW.LSM_w3_gran2loc8 SW.LSM_w3_gran2loc12; run;
proc print data=SW.LSM_w3_gran2; run;

data SW.DiffLSM_w3_gran2; set  SW.DiffLSM_w3_gran2loc2 SW.DiffLSM_w3_gran2loc6
SW.DiffLSM_w3_gran2loc8 SW.DiffLSM_w3_gran2loc12; run;
proc print data=SW.DiffLSM_w3_gran2; run;

data SW.Parms_w3_gran2; set  SW.Parms_w3_gran2loc2 SW.Parms_w3_gran2loc6
SW.Parms_w3_gran2loc8 SW.Parms_w3_gran2loc12; run;
proc sort data=SW.Parms_w3_gran2; by Parm; run;
proc print data=SW.Parms_w3_gran2; run;

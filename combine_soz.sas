/*****************************************************
PROJECT: DARPA data analysis
FOR: Shennan Weiss
AUTHOR: INNA CHERVONEVA
DATE; 05/17
********************************************************/
OPTIONS LS = 80 PS = 55;
libname SW 'Y:\Documents\ICH_projects\consults\Weiss_Sh\darpa_stats';

data SW.FreqTable_soz; set SW.EventsFreqs_gran2loc1_soz SW.EventsFreqs_gran2loc2_soz 
SW.EventsFreqs_gran2loc3_soz SW.EventsFreqs_gran2loc4_soz SW.EventsFreqs_gran2loc5_soz
SW.EventsFreqs_gran2loc6_soz SW.EventsFreqs_gran2loc7_soz SW.EventsFreqs_gran2loc8_soz
SW.EventsFreqs_gran2loc9_soz SW.EventsFreqs_gran2loc10_soz SW.EventsFreqs_gran2loc11_soz
SW.EventsFreqs_gran2loc12_soz; run;

proc print data=SW.FreqTable_soz; 
var location SOZ Remembered event Frequency	Percent; run;
*** did not converge
*** SW.LSMgran2loc3_soz SW.LSMgran2loc4_soz SW.LSMgran2loc7_soz ;
*** SW.LSMgran2loc10_soz SW.LSMgran2loc11_soz ;
data SW.LSMgran2_soz; 
set SW.LSMgran2loc1_soz SW.LSMgran2loc2_soz 
 SW.LSMgran2loc5_soz SW.LSMgran2loc6_soz 
SW.LSMgran2loc8_soz SW.LSMgran2loc12_soz; run;
proc print data=SW.LSMgran2_soz; run;
*** SW.DiffLSMgran2loc3_soz SW.DiffLSMgran2loc4_soz;
data SW.DiffLSMgran2_soz; set SW.DiffLSMgran2loc1_soz SW.DiffLSMgran2loc2_soz 
 SW.DiffLSMgran2loc5_soz 
SW.DiffLSMgran2loc6_soz SW.DiffLSMgran2loc7_soz SW.DiffLSMgran2loc8_soz 
SW.DiffLSMgran2loc10_soz SW.DiffLSMgran2loc11_soz SW.DiffLSMgran2loc12_soz; run;
proc print data=SW.DiffLSMgran2_soz; run;

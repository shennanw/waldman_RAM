# waldman_RAM
Statistical Code Used To Reproduce The Data For Waldman et al
Raw statistical data is available on Zenodo

accuracy_stats.m : tests the accuracy of the Naive Bayesian Model
assembleGran2.r : Custom R statistics package to analyze the .csv tables of ripple occurrences by neuroanatomical location
build_locs_hfov2.m : used to group the ripple detections by neuroanatomical locations from the processed neurophysiological data, please contact shennan.weiss@jefferson.edu for more details
build_locs_params.m : used to group the ripple detection properties by neuroanatomical locations from the processed neurophysiological data, please contact shennan.weiss@jefferson.edu for more details
combine_soz.sas : R code for testing the influence of the SOZ on disruption of encoding by ripple events.
combine.sas : Custom SAS statistics package to analyze the .csv tables of ripple occurrences by neuroanatomical location
EDR_gran1.R : R code for analyzing the EDR (encoding, distractor, recall) .csv data
EDRgran1rev0717.sas : R code for analyzing the EDR (encoding, distractor, recall) .csv data
Gran2loc1_soz.R : Custom R statistics package to analyze the .csv tables of ripple occurrences by neuroanatomical location SOZ model
GranXlocX_soz.sas : Custom SAS statistics package to analyze the .csv tables of ripple occurrences by neuroanatomical location SOZ model
GranXlocX.R : Custom R statistics package to analyze the .csv tables of ripple occurrences by neuroanatomical location
Gran2loc1.sas : Custom SAS statistics package to analyze the .csv tables of ripple occurrences by neuroanatomical location 
irritative_stats.m : Code to calculate the ratio of ripple occurrences in the location were epileptiform discharges occur
mayo_fr1_build_x_y_v2.m : used to group the ripple detections by neuroanatomical locations from the processed neurophysiological data, please contact shennan.weiss@jefferson.edu for more details
mayo_fr1_complete_v2.m : used to group the ripple detections by neuroanatomical locations from the processed neurophysiological data, please contact shennan.weiss@jefferson.edu for more details
mayo_fr1_soz.m : Code to calculate the ratio of ripple occurrences in the location of the seizure onset zone
ml_surrogates.m : Code used for the naive bayesian machine learning and boot-strapping
patient_event_count.m : Used to derive the probability of ripple events at each electrode site
patient_nums.m : used to assign each patient an ID code
response_scramble.m : subfunction for ml_surrogates.m
soz_stats.m : Function to derive stats for probability of ripple events in and out of the SOZ/NSOZ and irritative zone.

Note: Further code and data is available upon request. This code allows for the reproduction of the statistical analysis used in Waldman et al., on the basis of the processed .csv and .mat files available on Zenodo.

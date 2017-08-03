clear
matfiles=dir(fullfile('/gestalt/home/mayo_fr1/FR1/zOut_132','*.mat'))
Loc1_t=[];
Loc2_t=[];
Loc3_t=[];
Loc4_t=[];
E_names_t=[];
Y_array_t=[];
X_array_1t=[];
X_array_2t=[];
X_array_3t=[];
X_array_4t=[];
X_array_1a_t=[];
X_array_2a_t=[];
X_array_3a_t=[];
X_array_1b_t=[];
X_array_2b_t=[];
X_array_3b_t=[];
X_array_1c_t=[];
X_array_2c_t=[];
X_array_3c_t=[];
for i=1:numel(matfiles)
  i
  path_str='/gestalt/home/mayo_fr1/FR1/zOut_132'
  file_path_1=[path_str '/' matfiles(i).name]
  path_str_2='/gestalt/home/mayo_fr1/FR1'
  file_path_2=[path_str_2 '/' matfiles(i).name(4:end)]
  load(file_path_1);
  load(file_path_2,'Words','bpElec');
  [vocab, Y_array, E_names, Loc1, Loc2, Loc3, Loc4, X_array_1, X_array_2, X_array_3, X_array_4, power_array_1, power_array_2, power_array_3, freq_array_1, freq_array_2, freq_array_3, onset_array_1, onset_array_2, onset_array_3]=mayo_fr1_build_x_y_v2(bpElec, Words, HFO, avMag, avFreq, tStart);  
  Loc1_t=vertcat(Loc1_t, Loc1);
  Loc2_t=vertcat(Loc2_t, Loc2);
  Loc3_t=vertcat(Loc3_t, Loc3);
  Loc4_t=vertcat(Loc4_t, Loc4);
  Y_array_t=horzcat(Y_array_t, Y_array);
  X_array_1t=vertcat(X_array_1t, X_array_1);
  X_array_2t=vertcat(X_array_2t, X_array_2);
  X_array_3t=vertcat(X_array_3t, X_array_3);
  X_array_4t=vertcat(X_array_4t, X_array_4);
  [X_array_1a, X_array_1b, X_array_1c, X_array_2a, X_array_2b, X_array_2c, X_array_3a, X_array_3b, X_array_3c]=build_locs_params(avMag, avFreq, tStart, Loc1,Loc2,Loc3);
  X_array_1a_t=vertcat(X_array_1a_t, X_array_1a);
  X_array_2a_t=vertcat(X_array_2a_t, X_array_2a);
  X_array_3a_t=vertcat(X_array_3a_t, X_array_3a);
  X_array_1b_t=vertcat(X_array_1b_t, X_array_1b);
  X_array_2b_t=vertcat(X_array_2b_t, X_array_2b);
  X_array_3b_t=vertcat(X_array_3b_t, X_array_3b);
  X_array_1c_t=vertcat(X_array_1c_t, X_array_1c);
  X_array_2c_t=vertcat(X_array_2c_t, X_array_2c);
  X_array_3c_t=vertcat(X_array_3c_t, X_array_3c);
  E_names_t=vertcat(E_names_t, E_names);
end;
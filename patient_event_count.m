clear
matfiles=dir(fullfile('/gestalt/home/mayo_fr1/FR1/zOut','*.mat'))
event_code=[];
E_names_t={''};
F_names_t={''};
for i=1:numel(matfiles)
  i
  path_str='/gestalt/home/mayo_fr1/FR1/zOut'
  file_path_1=[path_str '/' matfiles(i).name]
  path_str_2='/gestalt/home/mayo_fr1/FR1'
  file_path_2=[path_str_2 '/' matfiles(i).name(4:end)]
  load(file_path_1);
  load(file_path_2,'Words','bpElec');
  [Y,E_names,F_names]=mayo_fr1_soz(bpElec, Words, HFO, i, matfiles(i).name)
  event_code=vertcat(event_code, Y);
  E_names_t=vertcat(E_names_t, E_names);
  F_names_t=vertcat(F_names_t, F_names');
end;
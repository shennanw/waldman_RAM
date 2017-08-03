clear
matfiles=dir(fullfile('/gestalt/home/mayo_fr1/FR1/zOut','*.mat'))
pat_code_file={''};
pat_code_num=[];
for i=1:numel(matfiles)
  i
  path_str='/gestalt/home/mayo_fr1/FR1/zOut'
  file_path_1=[path_str '/' matfiles(i).name]
  path_str_2='/gestalt/home/mayo_fr1/FR1'
  file_path_2=[path_str_2 '/' matfiles(i).name(4:end)]
  load(file_path_1);
  load(file_path_2,'Words','bpElec');
  patient_code_file{i,:}=file_path_2;
  pat_cod_num_temp=[];
  for j=1:numel(Words)
     pat_cod_num_temp(j)=i;
  end;
  pat_code_num=horzcat(pat_code_num, pat_cod_num_temp);
end;
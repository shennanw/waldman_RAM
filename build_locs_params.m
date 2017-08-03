function [Y1a, Y1b, Y1c, Y2a, Y2b, Y2c, Y3a, Y3b, Y3c]=build_locs_params(avMag, avFreq, tStart, Loc1,Loc2,Loc3);
load('/gestalt/home/mayo_fr1/FR1/zOut/analysis/final_locs.mat')
num_trials=numel(avMag(:,1));
num_locations=numel(Loc1_complete);
Y1a = NaN(num_trials,num_locations);
Y1b = NaN(num_trials,num_locations);
Y1c = NaN(num_trials,num_locations);
for i=1:numel(avMag(:,1))
  % for each trial find all channels in given LOC #
   for j=1:numel(Loc1_complete)
    Mag_temp=[];
    Freq_temp=[];
    t_start_temp=[];
     for k=1:numel(avMag(1,:))
         if strcmp(Loc1(k),Loc1_complete{j})
             if avMag(i,k)>0
                Mag_temp=horzcat(Mag_temp, avMag(i,k));
             end;
             if avFreq(i,k)>0
                Freq_temp=horzcat(Freq_temp, avFreq(i,k));
             end;
             if tStart(i,k)>0
                t_start_temp=horzcat(t_start_temp, tStart(i,k));
             end;
         end;
     if ~isempty(Mag_temp)
         Y1a(i,j)=mean(Mag_temp);
     end;
     if ~isempty(Freq_temp)
         Y1b(i,j)=mean(Freq_temp);
     end;
     if ~isempty(t_start_temp)
         Y1c(i,j)=mean(t_start_temp);
     end;
     end;
   end;
end;

num_locations=numel(Loc2_complete);
Y2a = NaN(num_trials,num_locations);
Y2b = NaN(num_trials,num_locations);
Y2c = NaN(num_trials,num_locations);
for i=1:numel(avMag(:,1))
  % for each trial find all channels in given LOC #
   for j=1:numel(Loc2_complete)
    Mag_temp=[];
    Freq_temp=[];
    t_start_temp=[];
     for k=1:numel(avMag(1,:))
         if strcmp(Loc2(k),Loc2_complete{j})
             if avMag(i,k)>0
                Mag_temp=horzcat(Mag_temp, avMag(i,k));
             end;
             if avFreq(i,k)>0
                Freq_temp=horzcat(Freq_temp, avFreq(i,k));
             end;
             if tStart(i,k)>0
                t_start_temp=horzcat(t_start_temp, tStart(i,k));
             end;
         end;
     if ~isempty(Mag_temp)
         Y2a(i,j)=mean(Mag_temp);
     end;
     if ~isempty(Freq_temp)
         Y2b(i,j)=mean(Freq_temp);
     end;
     if ~isempty(t_start_temp)
         Y2c(i,j)=mean(t_start_temp);
     end;
     end;
   end;
end;

num_locations=numel(Loc3_complete);
Y3a = NaN(num_trials,num_locations);
Y3b = NaN(num_trials,num_locations);
Y3c = NaN(num_trials,num_locations);
for i=1:numel(avMag(:,1))
  % for each trial find all channels in given LOC #
   for j=1:numel(Loc3_complete)
    Mag_temp=[];
    Freq_temp=[];
    t_start_temp=[];
     for k=1:numel(avMag(1,:))
         if strcmp(Loc3(k),Loc3_complete{j})
             if avMag(i,k)>0
                Mag_temp=horzcat(Mag_temp, avMag(i,k));
             end;
             if avFreq(i,k)>0
                Freq_temp=horzcat(Freq_temp, avFreq(i,k));
             end;
             if tStart(i,k)>0
                t_start_temp=horzcat(t_start_temp, tStart(i,k));
             end;
         end;
     if ~isempty(Mag_temp)
         Y3a(i,j)=mean(Mag_temp);
     end;
     if ~isempty(Freq_temp)
         Y3b(i,j)=mean(Freq_temp);
     end;
     if ~isempty(t_start_temp)
         Y3c(i,j)=mean(t_start_temp);
     end;
     end;
   end;
end;
   
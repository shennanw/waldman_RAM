function [Y1,Y2,Y3,Y4]=build_locs_hfo(HFO,Loc1,Loc2,Loc3,Loc4);
load('/gestalt/home/mayo_fr1/FR1/zOut/analysis/final_locs.mat')
num_trials=numel(HFO(:,1));
num_locations=numel(Loc1_complete);
Y1 = NaN(num_trials,num_locations);
for i=1:numel(HFO(:,1))
  % for each trial find all channels in given LOC #
   for j=1:numel(Loc1_complete)
     for k=1:numel(HFO(1,:))
         if strcmp(Loc1(k),Loc1_complete{j})
             if HFO(i,k)==1
                 Y1(i,j)=1;
             end;
             if HFO(i,k)==2
                 if Y1(i,j)~=1
                     Y1(i,j)=2;
                 end;
             end;
             if HFO(i,k)==3
                 if Y1(i,j)~=1
                     if Y1(i,j)~=2
                         Y1(i,j)=3;
                     end;
                 end;
             end;
             if HFO(i,k)==0
                if Y1(i,j)~=1
                     if Y1(i,j)~=2
                         if Y1(i,j)~=3
                             Y1(i,j)=0;
                         end;
                     end;
                 end;
            end;
         end;
     end;
   end;
end;

num_locations=numel(Loc2_complete);
Y2 = NaN(num_trials,num_locations);
for i=1:numel(HFO(:,1));
  % for each trial find all channels in given LOC #
   for j=1:numel(Loc2_complete)
     for k=1:numel(HFO(1,:))
         if strcmp(Loc2(k),Loc2_complete{j})
             if HFO(i,k)==1
                 Y2(i,j)=1;
             end;
             if HFO(i,k)==2
                 if Y2(i,j)~=1
                     Y2(i,j)=2;
                 end;
             end;
             if HFO(i,k)==3
                 if Y2(i,j)~=1
                     if Y2(i,j)~=2
                         Y2(i,j)=3;
                     end;
                 end;
             end;
            if HFO(i,k)==0
                if Y2(i,j)~=1
                     if Y2(i,j)~=2
                         if Y2(i,j)~=3
                             Y2(i,j)=0;
                         end;
                     end;
                 end;
             end;
         end;
     end;
   end;
end;

num_locations=numel(Loc3_complete);
Y3 = NaN(num_trials,num_locations);
for i=1:numel(HFO(:,1))
  % for each trial find all channels in given LOC #
   for j=1:numel(Loc3_complete)
     for k=1:numel(HFO(1,:))
         if strcmp(Loc3(k),Loc3_complete{j})
             if HFO(i,k)==1
                 Y3(i,j)=1;
             end;
             if HFO(i,k)==2
                 if Y3(i,j)~=1
                     Y3(i,j)=2;
                 end;
             end;
             if HFO(i,k)==3
                 if Y3(i,j)~=1
                     if Y3(i,j)~=2
                         Y3(i,j)=3;
                     end;
                 end;
             end;
             if HFO(i,k)==0
                if Y3(i,j)~=1
                     if Y3(i,j)~=2
                         if Y3(i,j)~=3
                             Y3(i,j)=0;
                         end;
                     end;
                 end;
             end;
         end;
     end;
   end;
end;

num_locations=numel(Loc4_complete);
Y4 = NaN(num_trials,num_locations);
for i=1:numel(HFO(:,1))
  % for each trial find all channels in given LOC #
   for j=1:numel(Loc4_complete)
     for k=1:numel(HFO(1,:))
         if strcmp(Loc4(k),Loc4_complete{j})
             if HFO(i,k)==1
                 Y4(i,j)=1;
             end;
             if HFO(i,k)==2
                 if Y4(i,j)~=1
                     Y4(i,j)=2;
                 end;
             end;
             if HFO(i,k)==3
                 if Y4(i,j)~=1
                     if Y4(i,j)~=2
                         Y4(i,j)=3;
                     end;
                 end;
             end;
             if HFO(i,k)==0
                if Y4(i,j)~=1
                     if Y4(i,j)~=2
                         if Y4(i,j)~=3
                             Y4(i,j)=0;
                         end;
                     end;
                 end;
             end;
         end;
     end;
   end;
end;
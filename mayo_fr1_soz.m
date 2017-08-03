function [Y,E_names,F_names]=mayo_fr1_soz(bpElec, Words, HFO, pat_code_num, filename)

% Identify Depth Channels
D_channels=[]
for i=1:numel(bpElec)
    if bpElec(i).eType=='D'
        D_channels=horzcat(D_channels, i);
    end;
end;

E_names={''};
for i=1:numel(D_channels)
    E_names{i,1}=bpElec(D_channels(i)).tagName;
end;

% Build Loc Vector
Loc1={''};
for i=1:numel(D_channels)
    Loc1{i,1}=bpElec(D_channels(i)).Loc1;
end;

% Modify Loc2 and Loc3 with laterality
Loc2={''};
for i=1:numel(D_channels)
    loc2_str=[Loc1{i}(1) '-' bpElec(D_channels(i)).Loc2];
    Loc2{i,1}=loc2_str;
end;

Loc3={''};
for i=1:numel(D_channels)
    loc3_str=[Loc1{i}(1) '-' bpElec(D_channels(i)).Loc3];
    Loc3{i,1}=loc3_str;
end;

Y=[];
F_names={''};
for i=1:numel(D_channels)
    F_names{i}=filename;
    Y(i,1)=pat_code_num
    Y(i,2)=numel(find(HFO(:,i)==1))/numel(HFO(:,1));
    Y(i,3)=numel(find(HFO(:,i)==2))/numel(HFO(:,1));
    Y(i,4)=numel(find(HFO(:,i)==3))/numel(HFO(:,1));
end;


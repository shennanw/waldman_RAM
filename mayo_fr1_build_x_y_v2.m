function [vocab, Y_array, E_names, Loc1, Loc2, Loc3, Loc4, X_array_1, X_array_2, X_array_3, X_array_4, power_array_1, power_array_2, power_array_3, freq_array_1, freq_array_2, freq_array_3, onset_array_1, onset_array_2, onset_array_3]=mayo_fr1_build_x_y_v2(bpElec, Words, HFO, avMag, avFreq, tStart)

% Save vocabulary
vocab={''};
for i=1:numel(HFO(:,1))
   vocab{i,1}=(Words(i).item);
end;


% Build Y_array
Y_array=[];
for i=1:numel(HFO(:,1))
    Y_array(i)=Words(i).recalled;
end;

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

Loc4={''};
for i=1:numel(D_channels)
    loc4_str=[bpElec(D_channels(i)).locTag];
    Loc4{i,1}=loc4_str;
end;

% Need to write function to correctly build X_array
[X_array_1, X_array_2, X_array_3, X_array_4]=build_locs_hfov2(HFO,Loc1,Loc2,Loc3,Loc4);

% Need to write function to correctly build power array
% convert 0 to NaN
power_array_1=avMag;
power_array_2=avMag;
power_array_3=avMag;

% Need to write functions to correctly build freq array
% convert 0 to NaN
freq_array_1=avFreq;
freq_array_2=avFreq;
freq_array_3=avFreq;

% Need to write functions to correctly build onset array
% convert 0 to NaN
onset_array_1=tStart;
onset_array_2=tStart;
onset_array_3=tStart;
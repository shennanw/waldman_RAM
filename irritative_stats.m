%% For irritative zone
trons_rate_irr={''};
trons_rate_nirr={''};
frons_rate_irr={''};
frons_rate_nirr={''};
rono_rate_irr={''};
rono_rate_nirr={''};
patient=1;
counter_irr=1;
counter_nirr=1;
s_counter_irr=[];
s_counter_nirr=[];
for i=1:numel(A(:,1))
if A(i,1)~=patient
    s_counter_irr(patient)=counter_irr-1;
    s_counter_nirr(patient)=counter_nirr-1;
    patient=patient+1;
    counter_irr=1;
    counter_nirr=1;
end;
if A(i,6)==1
    trons_rate_irr{patient,counter_irr}=A(i,2);
    frons_rate_irr{patient,counter_irr}=A(i,3);
    rono_rate_irr{patient,counter_irr}=A(i,4);
    counter_irr=counter_irr+1;
else
    trons_rate_nirr{patient,counter_nirr}=A(i,2);
    frons_rate_nirr{patient,counter_nirr}=A(i,3);
    rono_rate_nirr{patient,counter_nirr}=A(i,4);
    counter_nirr=counter_nirr+1;
end;
end;
s_counter_irr(patient)=counter_irr-1;
s_counter_nirr(patient)=counter_nirr-1;

mean_trons_irr=[];
mean_frons_irr=[];
mean_rono_irr=[];
for i=1:patient
mean_trons_irr_t=[];
mean_frons_irr_t=[];
mean_rono_irr_t=[];
if s_counter_irr(i) > 1
    for j=1:s_counter_irr(i)
        mean_trons_irr_t=vertcat(mean_trons_irr_t, trons_rate_irr{i,j});
        mean_frons_irr_t=vertcat(mean_frons_irr_t, frons_rate_irr{i,j});
        mean_rono_irr_t=vertcat(mean_rono_irr_t, rono_rate_irr{i,j});
    end;
mean_trons_irr(i)=mean(mean_trons_irr_t);
mean_frons_irr(i)=mean(mean_frons_irr_t);
mean_rono_irr(i)=mean(mean_rono_irr_t);
else 
mean_trons_irr(i)=NaN;
mean_frons_irr(i)=NaN;
mean_rono_irr(i)=NaN;
end;
end;


mean_trons_nirr=[];
mean_frons_nirr=[];
mean_rono_nirr=[];
for i=1:patient
mean_trons_nirr_t=[];
mean_frons_nirr_t=[];
mean_rono_nirr_t=[];
if s_counter_nirr(i) > 1
    for j=1:s_counter_nirr(i)
        mean_trons_nirr_t=vertcat(mean_trons_nirr_t, trons_rate_nirr{i,j});
        mean_frons_nirr_t=vertcat(mean_frons_nirr_t, frons_rate_nirr{i,j});
        mean_rono_nirr_t=vertcat(mean_rono_nirr_t, rono_rate_nirr{i,j});
    end;
mean_trons_nirr(i)=mean(mean_trons_nirr_t);
mean_frons_nirr(i)=mean(mean_frons_nirr_t);
mean_rono_nirr(i)=mean(mean_rono_nirr_t);
else 
mean_trons_nirr(i)=NaN;
mean_frons_nirr(i)=NaN;
mean_rono_nirr(i)=NaN;
end;
end;
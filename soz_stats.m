trons_rate_soz={''};
trons_rate_nsoz={''};
frons_rate_soz={''};
frons_rate_nsoz={''};
rono_rate_soz={''};
rono_rate_nsoz={''};
patient=1;
counter_soz=1;
counter_nsoz=1;
s_counter_soz=[];
s_counter_nsoz=[];
for i=1:numel(A(:,1))
if A(i,1)~=patient
    s_counter_soz(patient)=counter_soz-1;
    s_counter_nsoz(patient)=counter_nsoz-1;
    patient=patient+1;
    counter_soz=1;
    counter_nsoz=1;
end;
if A(i,5)==1
    trons_rate_soz{patient,counter_soz}=A(i,2);
    frons_rate_soz{patient,counter_soz}=A(i,3);
    rono_rate_soz{patient,counter_soz}=A(i,4);
    counter_soz=counter_soz+1;
else
    trons_rate_nsoz{patient,counter_nsoz}=A(i,2);
    frons_rate_nsoz{patient,counter_nsoz}=A(i,3);
    rono_rate_nsoz{patient,counter_nsoz}=A(i,4);
    counter_nsoz=counter_nsoz+1;
end;
end;
s_counter_soz(patient)=counter_soz-1;
s_counter_nsoz(patient)=counter_nsoz-1;

mean_trons_soz=[];
mean_frons_soz=[];
mean_rono_soz=[];
for i=1:patient
mean_trons_soz_t=[];
mean_frons_soz_t=[];
mean_rono_soz_t=[];
if s_counter_soz(i) > 1
    for j=1:s_counter_soz(i)
        mean_trons_soz_t=vertcat(mean_trons_soz_t, trons_rate_soz{i,j});
        mean_frons_soz_t=vertcat(mean_frons_soz_t, frons_rate_soz{i,j});
        mean_rono_soz_t=vertcat(mean_rono_soz_t, rono_rate_soz{i,j});
    end;
mean_trons_soz(i)=mean(mean_trons_soz_t);
mean_frons_soz(i)=mean(mean_frons_soz_t);
mean_rono_soz(i)=mean(mean_rono_soz_t);
else 
mean_trons_soz(i)=NaN;
mean_frons_soz(i)=NaN;
mean_rono_soz(i)=NaN;
end;
end;


mean_trons_nsoz=[];
mean_frons_nsoz=[];
mean_rono_nsoz=[];
for i=1:patient
mean_trons_nsoz_t=[];
mean_frons_nsoz_t=[];
mean_rono_nsoz_t=[];
if s_counter_nsoz(i) > 1
    for j=1:s_counter_nsoz(i)
        mean_trons_nsoz_t=vertcat(mean_trons_nsoz_t, trons_rate_nsoz{i,j});
        mean_frons_nsoz_t=vertcat(mean_frons_nsoz_t, frons_rate_nsoz{i,j});
        mean_rono_nsoz_t=vertcat(mean_rono_nsoz_t, rono_rate_nsoz{i,j});
    end;
mean_trons_nsoz(i)=mean(mean_trons_nsoz_t);
mean_frons_nsoz(i)=mean(mean_frons_nsoz_t);
mean_rono_nsoz(i)=mean(mean_rono_nsoz_t);
else 
mean_trons_nsoz(i)=NaN;
mean_frons_nsoz(i)=NaN;
mean_rono_nsoz(i)=NaN;
end;
end;

        
        


    


    
      
     
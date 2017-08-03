function [acc, sens, spec, ppv, npv] = nb_rnd_seed(Y_real);
Mdl = fitcnb(X_array_2t,Y_array_t,'CategoricalPredictors','all')
% Real Model
sens=[];
spec=[];
ppv=[];
npv=[];
acc=[];
for j=1:300
 y=[];
 for i=1:58312
  x=rand;
  [label,Posterior] = predict(Mdl,X_array_2t(i,:));
  if label == 0
    if x <= Posterior(1)
     y(i)=0;
    else
     y(i)=1;
    end;
  else
    if x <= Posterior(1)
     y(i)=1;
    else
     y(i)=0;
    end;
  end;
end;
[table, chi2, p, labels] = crosstab(y,Y_array_t)
sens(j)=table(1,1)/(table(1,1)+table(1,2))
spec(j)=table(2,2)/(table(2,2)+table(2,1))
ppv(j)=table(1,1)/(table(1,1)+table(2,1))
npv(j)=table(2,2)/(table(2,2)+table(1,2))
acc(j)=(table(1,1)+table(2,2))/(table(1,1)+table(1,2)+table(2,1)+table(2,2))
save('real.mat','acc');
end;

% Real Model _3
Mdl = fitcnb(X_array_3t,Y_array_t,'CategoricalPredictors','all')
sens=[];
spec=[];
ppv=[];
npv=[];
acc=[];
parfor j=1:100
 y=[];
 for i=1:58312
  x=rand;
  [label,Posterior] = predict(Mdl,X_array_3t(i,:));
  if label == 0
    if x <= Posterior(1)
     y(i)=0;
    else
     y(i)=1;
    end;
  else
    if x <= Posterior(1)
     y(i)=1;
    else
     y(i)=0;
    end;
  end;
end;
[table, chi2, p, labels] = crosstab(y,Y_array_t)
sens(j)=table(1,1)/(table(1,1)+table(1,2))
spec(j)=table(2,2)/(table(2,2)+table(2,1))
ppv(j)=table(1,1)/(table(1,1)+table(2,1))
npv(j)=table(2,2)/(table(2,2)+table(1,2))
acc(j)=(table(1,1)+table(2,2))/(table(1,1)+table(1,2)+table(2,1)+table(2,2))
end;

%% baseline
parfor j=1:300
y=[];
for i=1:58312
 x=rand;
 if x<=0.7246
   y(i)=0;
 else
   y(i)=1; 
 end;
end;
[table, chi2, p, labels] = crosstab(y,Y_array_t)
sens(j)=table(1,1)/(table(1,1)+table(1,2))
spec(j)=table(2,2)/(table(2,2)+table(2,1))
ppv(j)=table(1,1)/(table(1,1)+table(2,1))
npv(j)=table(2,2)/(table(2,2)+table(1,2))
acc(j)=(table(1,1)+table(2,2))/(table(1,1)+table(1,2)+table(2,1)+table(2,2))
end;

% Surrogates
sens_t=[];
spec_t=[];
npv_t=[];
ppv_t=[];
acc_t=[];
for z=1:100
z
response_scramble
%Mdl = fitcnb(X_array_2t,scrambled_Y_t,'CategoricalPredictors','all','Cost',Cost)
Mdl = fitcnb(X_array_2t,scrambled_Y_t,'CategoricalPredictors','all')
parfor j=1:100
sens=[];
spec=[];
ppv=[];
npv=[];
acc=[];
 y=[];
 for i=1:58312
  x=rand;
  [label,Posterior] = predict(Mdl,X_array_2t(i,:));
  if label == 0
    if x <= Posterior(1)
     y(i)=0;
    else
     y(i)=1;
    end;
  else
    if x <= Posterior(1)
     y(i)=1;
    else
     y(i)=0;
    end;
  end;
end;
[table, chi2, p, labels] = crosstab(y,Y_array_t)
sens(j)=table(1,1)/(table(1,1)+table(1,2))
spec(j)=table(2,2)/(table(2,2)+table(2,1))
ppv(j)=table(1,1)/(table(1,1)+table(2,1))
npv(j)=table(2,2)/(table(2,2)+table(1,2))
acc(j)=(table(1,1)+table(2,2))/(table(1,1)+table(1,2)+table(2,1)+table(2,2))
end;
sens_t(z)=mean(sens);
spec_t(z)=mean(spec);
ppv_t(z)=mean(ppv);
npv_t(z)=mean(npv);
acc_t(z)=mean(acc);
end;

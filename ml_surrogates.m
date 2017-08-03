%function build machine learning surrogates

% build surrogates 
prob_array_change=[];
loss=[];
for z=1:500
z
response_scramble
Mdl = fitcnb(X_array_2t,scrambled_Y_t,'CategoricalPredictors','all')
%CVMdl=crossval(Mdl);
%loss(z)=kfoldLoss(CVMdl);
[label,Posterior] = predict(Mdl,[0 0 0 0 0 0 0 0 0 0 0 0 0]);
if label == 0
            prob_array_baseline=Posterior(1);
        else
            prob_array_baseline=Posterior(2);
        end;
for i=1:13
    for j=1:3
        vector=zeros(13,1);
        vector(i)=j;
        vector=vector';
        [label,Posterior] = predict(Mdl,vector);
        if label == 0
            temp_prob=Posterior(1);
        else
            temp_prob=Posterior(2);
        end;
    prob_array_change(i,j,z)=temp_prob-prob_array_baseline;
    end;
end;
end;

% calculate array from real y_array
Mdl = fitcnb(X_array_2t,Y_array_t,'CategoricalPredictors','all')
CVMdl=crossval(Mdl);
loss_real=kfoldLoss(CVMdl);
[label,Posterior] = predict(Mdl,[0 0 0 0 0 0 0 0 0 0 0 0 0]);
if label == 0
            prob_array_baseline=Posterior(1);
        else
            prob_array_baseline=Posterior(2);
        end;
for i=1:13
    for j=1:3
        vector=zeros(13,1);
        vector(i)=j;
        vector=vector';
        [label,Posterior] = predict(Mdl,vector);
        if label == 0
            temp_prob=Posterior(1);
        else
            temp_prob=Posterior(2);
        end;
    real_prob_array_change(i,j)=temp_prob-prob_array_baseline;
    end;
end;

% calculate z-score
z_score_vals=[];
size_surrogates=numel(prob_array_change(1,1,:));
for i=1:13
    for j=1:3
        temp_z=prob_array_change(i,j,:);
        temp_z=squeeze(temp_z);
        temp_z=vertcat(temp_z, real_prob_array_change(i,j));
        temp_z=zscore(temp_z);
        z_score_vals(i,j)=temp_z(size_surrogates+1);
    end;
end;

%%% Now for Loc3 after removing empty Locs
prob_array_change=[];
real_prob_array_change=[];
[a,b]=find(nansum(X_array_3t)<40);
X_array_3t(:,b)=[];
Loc3_complete(b)=[];

% build surrogates 
prob_array_change=[];
for z=1:300
z
response_scramble
Mdl = fitcnb(X_array_3t,scrambled_Y_t,'CategoricalPredictors','all')
[label,Posterior] = predict(Mdl,zeros(49,1)');
if label == 0
            prob_array_baseline=Posterior(1);
        else
            prob_array_baseline=Posterior(2);
        end;
for i=1:49
    for j=1:3
        vector=zeros(49,1);
        vector(i)=j;
        vector=vector';
        [label,Posterior] = predict(Mdl,vector);
        if label == 0
            temp_prob=Posterior(1);
        else
            temp_prob=Posterior(2);
        end;
    prob_array_change(i,j,z)=temp_prob-prob_array_baseline;
    end;
end;
end;

% calculate array from real y_array
Mdl = fitcnb(X_array_3t,Y_array_t,'CategoricalPredictors','all')
[label,Posterior] = predict(Mdl,zeros(49,1)');
if label == 0
            prob_array_baseline=Posterior(1);
        else
            prob_array_baseline=Posterior(2);
        end;
for i=1:49
    for j=1:3
        vector=zeros(49,1);
        vector(i)=j;
        vector=vector';
        [label,Posterior] = predict(Mdl,vector);
        if label == 0
            temp_prob=Posterior(1);
        else
            temp_prob=Posterior(2);
        end;
    real_prob_array_change(i,j)=temp_prob-prob_array_baseline;
    end;
end;

% calculate z-score
z_score_vals=[];
size_surrogates=numel(prob_array_change(1,1,:));
for i=1:49
    for j=1:3
        temp_z=prob_array_change(i,j,:);
        temp_z=squeeze(temp_z);
        temp_z=vertcat(temp_z, real_prob_array_change(i,j));
        temp_z=zscore(temp_z);
        z_score_vals(i,j)=temp_z(size_surrogates+1);
    end;
end;

%%% Now for Loc4 after removing empty Locs
prob_array_change=[];
real_prob_array_change=[];
[a,b]=find(nansum(X_array_4t)<40);
X_array_4t(:,b)=[];
Loc4_complete(b)=[];

% build surrogates 
prob_array_change=[];
for z=1:300
z
response_scramble
Mdl = fitcnb(X_array_4t,scrambled_Y_t,'CategoricalPredictors','all')
[label,Posterior] = predict(Mdl,zeros(14,1)');
if label == 0
            prob_array_baseline=Posterior(1);
        else
            prob_array_baseline=Posterior(2);
        end;
for i=1:14
    for j=1:3
        vector=zeros(14,1);
        vector(i)=j;
        vector=vector';
        [label,Posterior] = predict(Mdl,vector);
        if label == 0
            temp_prob=Posterior(1);
        else
            temp_prob=Posterior(2);
        end;
    prob_array_change(i,j,z)=temp_prob-prob_array_baseline;
    end;
end;
end;

% calculate array from real y_array
Mdl = fitcnb(X_array_4t,Y_array_t,'CategoricalPredictors','all')
[label,Posterior] = predict(Mdl,zeros(14,1)');
if label == 0
            prob_array_baseline=Posterior(1);
        else
            prob_array_baseline=Posterior(2);
        end;
for i=1:14
    for j=1:3
        vector=zeros(14,1);
        vector(i)=j;
        vector=vector';
        [label,Posterior] = predict(Mdl,vector);
        if label == 0
            temp_prob=Posterior(1);
        else
            temp_prob=Posterior(2);
        end;
    real_prob_array_change(i,j)=temp_prob-prob_array_baseline;
    end;
end;

% calculate z-score
z_score_vals=[];
size_surrogates=numel(prob_array_change(1,1,:));
for i=1:14
    for j=1:3
        temp_z=prob_array_change(i,j,:);
        temp_z=squeeze(temp_z);
        temp_z=vertcat(temp_z, real_prob_array_change(i,j));
        temp_z=zscore(temp_z);
        z_score_vals(i,j)=temp_z(size_surrogates+1);
    end;
end;





%%% Now for Loc1 after removing empty Locs
prob_array_change=[];
real_prob_array_change=[];
for z=1:300
z
response_scramble
Mdl = fitcnb(X_array_1t,scrambled_Y_t)
[label,Posterior] = predict(Mdl,zeros(2,1)');
if label == 0
            prob_array_baseline=Posterior(1);
        else
            prob_array_baseline=Posterior(2);
        end;
for i=1:2
    for j=1:3
        vector=zeros(2,1);
        vector(i)=j;
        vector=vector';
        [label,Posterior] = predict(Mdl,vector);
        if label == 0
            temp_prob=Posterior(1);
        else
            temp_prob=Posterior(2);
        end;
    prob_array_change(i,j,z)=temp_prob-prob_array_baseline;
    end;
end;
end;

% calculate array from real y_array
Mdl = fitcnb(X_array_1t,Y_array_t)
[label,Posterior] = predict(Mdl,zeros(2,1)');
if label == 0
            prob_array_baseline=Posterior(1);
        else
            prob_array_baseline=Posterior(2);
        end;
for i=1:2
    for j=1:3
        vector=zeros(2,1);
        vector(i)=j;
        vector=vector';
        [label,Posterior] = predict(Mdl,vector);
        if label == 0
            temp_prob=Posterior(1);
        else
            temp_prob=Posterior(2);
        end;
    real_prob_array_change(i,j)=temp_prob-prob_array_baseline;
    end;
end;

% calculate z-score
z_score_vals=[];
size_surrogates=numel(prob_array_change(1,1,:));
for i=1:2
    for j=1:3
        temp_z=prob_array_change(i,j,:);
        temp_z=squeeze(temp_z);
        temp_z=vertcat(temp_z, real_prob_array_change(i,j));
        temp_z=zscore(temp_z);
        z_score_vals(i,j)=temp_z(size_surrogates+1);
    end;
end;


% Loc 2 (setting all ripple events to 1)
% build surrogates 
prob_array_change=[];
loss=[];
for z=1:300
z
response_scramble
Mdl = fitcnb(X_array_2t_a,scrambled_Y_t,'CategoricalPredictors','all')
%CVMdl=crossval(Mdl);
%loss(z)=kfoldLoss(CVMdl);
[label,Posterior] = predict(Mdl,[0 0 0 0 0 0 0 0 0 0 0 0 0]);
if label == 0
            prob_array_baseline=Posterior(1);
        else
            prob_array_baseline=Posterior(2);
        end;
for i=1:13
    for j=1:3
        vector=zeros(13,1);
        vector(i)=j;
        vector=vector';
        [label,Posterior] = predict(Mdl,vector);
        if label == 0
            temp_prob=Posterior(1);
        else
            temp_prob=Posterior(2);
        end;
    prob_array_change(i,j,z)=temp_prob-prob_array_baseline;
    end;
end;
end;

% calculate array from real y_array
Mdl = fitcnb(X_array_2t_a,Y_array_t,'CategoricalPredictors','all')
[label,Posterior] = predict(Mdl,[0 0 0 0 0 0 0 0 0 0 0 0 0]);
if label == 0
            prob_array_baseline=Posterior(1);
        else
            prob_array_baseline=Posterior(2);
        end;
for i=1:13
    for j=1:3
        vector=zeros(13,1);
        vector(i)=j;
        vector=vector';
        [label,Posterior] = predict(Mdl,vector);
        if label == 0
            temp_prob=Posterior(1);
        else
            temp_prob=Posterior(2);
        end;
    real_prob_array_change(i,j)=temp_prob-prob_array_baseline;
    end;
end;

% calculate z-score
z_score_vals=[];
size_surrogates=numel(prob_array_change(1,1,:));
for i=1:13
    for j=1:3
        temp_z=prob_array_change(i,j,:);
        temp_z=squeeze(temp_z);
        temp_z=vertcat(temp_z, real_prob_array_change(i,j));
        temp_z=zscore(temp_z);
        z_score_vals(i,j)=temp_z(size_surrogates+1);
    end;
end;

% Loc 2 (setting all true ripple events to 1)
% build surrogates 
X_array_2t_tr(:,1)=[];
prob_array_change=[];
loss=[];
for z=1:300
z
response_scramble
Mdl = fitcnb(X_array_2t_tr,scrambled_Y_t)
%CVMdl=crossval(Mdl);
%loss(z)=kfoldLoss(CVMdl);
[label,Posterior] = predict(Mdl,[0 0 0 0 0 0 0 0 0 0 0 0 0 0]);
if label == 0
            prob_array_baseline=Posterior(1);
        else
            prob_array_baseline=Posterior(2);
        end;
for i=1:9
    for j=1:3
        vector=zeros(9,1);
        vector(i)=j;
        vector=vector';
        [label,Posterior] = predict(Mdl,vector);
        if label == 0
            temp_prob=Posterior(1);
        else
            temp_prob=Posterior(2);
        end;
    prob_array_change(i,j,z)=temp_prob-prob_array_baseline;
    end;
end;
end;

% calculate array from real y_array
Mdl = fitcnb(X_array_2t_tr,Y_array_t)
[label,Posterior] = predict(Mdl,[0 0 0 0 0 0 0 0 0]);
if label == 0
            prob_array_baseline=Posterior(1);
        else
            prob_array_baseline=Posterior(2);
        end;
for i=1:9
    for j=1:3
        vector=zeros(9,1);
        vector(i)=j;
        vector=vector';
        [label,Posterior] = predict(Mdl,vector);
        if label == 0
            temp_prob=Posterior(1);
        else
            temp_prob=Posterior(2);
        end;
    real_prob_array_change(i,j)=temp_prob-prob_array_baseline;
    end;
end;

% calculate z-score
z_score_vals=[];
size_surrogates=numel(prob_array_change(1,1,:));
for i=1:13
    for j=1:3
        temp_z=prob_array_change(i,j,:);
        temp_z=squeeze(temp_z);
        temp_z=vertcat(temp_z, real_prob_array_change(i,j));
        temp_z=zscore(temp_z);
        z_score_vals(i,j)=temp_z(size_surrogates+1);
    end;
end;

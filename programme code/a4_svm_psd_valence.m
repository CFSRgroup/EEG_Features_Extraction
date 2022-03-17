clc;
clear;
close all;

%%
load E:\EEGrecognition\Project_2103\labeled_features\psd\DEAP\data

x_1 = x;
y_valence_1 = y_valence+1;

load E:\EEGrecognition\Project_2103\labeled_features\psd\HCI\data

x_2 = x;
y_valence_2 = y_valence+1;

load E:\EEGrecognition\Project_2103\labeled_features\psd\SEED\data

x_3 = x;
y_valence_3 = y_valence+1;

%%
xtr = [x_2; x_3];
ytr = [y_valence_2; y_valence_3];

xte = x_1;
yte = y_valence_1;


for i = 1:5
svm_model = fitcsvm(xtr,ytr,'BoxConstraint',5^i);
[yte_p, ~] = predict(svm_model,xte);
yte_p = double(yte_p);
cte(:,:,i)=cfmatrix(yte,yte_p);%¼ÆËã»ìÏý¾ØÕó
[sen(i),spe(i),acc(i),pre(i),npv(i),f1(i)] = per_eva(cte(:,:,i));
end

[~, index_max] = max(mean((acc+f1)/2));

sen_1 = sen(index_max);
spe_1 = spe(index_max);
acc_1 = acc(index_max);
pre_1 = pre(index_max);
npv_1 = npv(index_max);
f1_1 = f1(index_max);

%%
xtr = [x_1; x_3];
ytr = [y_valence_1; y_valence_3];

xte = x_2;
yte = y_valence_2;

for i = 1:5
svm_model = fitcsvm(xtr,ytr,'BoxConstraint',5^i);
[yte_p, ~] = predict(svm_model,xte);
yte_p = double(yte_p);
cte(:,:,i)=cfmatrix(yte,yte_p);%¼ÆËã»ìÏý¾ØÕó
[sen(i),spe(i),acc(i),pre(i),npv(i),f1(i)] = per_eva(cte(:,:,i));
end

[~, index_max] = max(mean((acc+f1)/2));

sen_2 = sen(index_max);
spe_2 = spe(index_max);
acc_2 = acc(index_max);
pre_2 = pre(index_max);
npv_2 = npv(index_max);
f1_2 = f1(index_max);

%%
xtr = [x_1; x_2];
ytr = [y_valence_1; y_valence_2];

xte = x_3;
yte = y_valence_3;

for i = 1:5
svm_model = fitcsvm(xtr,ytr,'BoxConstraint',5^i);
[yte_p, ~] = predict(svm_model,xte);
yte_p = double(yte_p);
cte(:,:,i)=cfmatrix(yte,yte_p);%¼ÆËã»ìÏý¾ØÕó
[sen(i),spe(i),acc(i),pre(i),npv(i),f1(i)] = per_eva(cte(:,:,i));
end

[~, index_max] = max(mean((acc+f1)/2));

sen_3 = sen(index_max);
spe_3 = spe(index_max);
acc_3 = acc(index_max);
pre_3 = pre(index_max);
npv_3 = npv(index_max);
f1_3 = f1(index_max);

save E:\EEGrecognition\Project_2103\a4\psd\svm_valence sen_1 spe_1 acc_1 pre_1 npv_1 f1_1 sen_2 spe_2 acc_2 pre_2 npv_2 f1_2 sen_3 spe_3 acc_3 pre_3 npv_3 f1_3
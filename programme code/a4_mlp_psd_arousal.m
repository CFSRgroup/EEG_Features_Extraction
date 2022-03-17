clc;
clear;
close all;

%%
load D:\EEGRecognition\Project_2103\labeled_features\psd\DEAP\data

x_1 = x;
y_arousal_1 = y_arousal+1;

load D:\EEGRecognition\Project_2103\labeled_features\psd\HCI\data

x_2 = x;
y_arousal_2 = y_arousal+1;

%%
xtr = x_1;
ytr = y_arousal_1;

xte = x_2;
yte = y_arousal_2; 


pr = ones(204,2);   %���ø�֪��������������ÿ��Ԫ�ص�ֵ��
MLP_model = newp(pr,1);  %�����֪������
%ѵ����֪������
for i = 1:5
MLP_model.trainParam.epochs = 30
[MLP_model,tr]=train(MLP_model,xtr',ytr');%ѵ����֪������
%�������
yte_p = sim(MLP_model,xte')  %������
cte(:,:,i)=cfmatrix(yte,yte_p');%�����������
[sen(i),spe(i),acc(i),pre(i),npv(i),f1(i)] = per_eva(cte(:,:,i));
end


[~, index_max] = max((acc+f1)/2);

sen_1 = sen(index_max);
spe_1 = spe(index_max);
acc_1 = acc(index_max);
pre_1 = pre(index_max);
npv_1 = npv(index_max);
f1_1 = f1(index_max);

%%
xtr = x_2;
ytr = y_arousal_2;

xte = x_1;
yte = y_arousal_1;


for i = 1:5
%ѵ����֪������
MLP_model.trainParam.epochs = 30
[MLP_model,tr]=train(MLP_model,xtr',ytr');  %ѵ����֪������
%�������
yte_p = sim(MLP_model,xte')  %������
cte(:,:,i)=cfmatrix(yte,yte_p');%�����������
[sen(i),spe(i),acc(i),pre(i),npv(i),f1(i)] = per_eva(cte(:,:,i));
end

[~, index_max] = max((acc+f1)/2);

sen_2 = sen(index_max);
spe_2 = spe(index_max);
acc_2 = acc(index_max);
pre_2 = pre(index_max);
npv_2 = npv(index_max);
f1_2 = f1(index_max); 

save MLP_model
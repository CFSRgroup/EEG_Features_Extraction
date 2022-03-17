%本程序用于输入特征、目标类别标准化和汇总
clc;
clear;
close all;

%SEED脑电特征集每名被试包含90个样例
load E:\Matlab_projects\Project_202103\features\psd\SEED\p1
feature=zscore(feature);

load E:\Matlab_projects\Project_202103\labels\SEED\p1
feature(valence==-1,:) = [];
x=feature;

valence(valence==-1,:) = [];
y_valence=valence;

for zq=2:15
eval(['load E:\Matlab_projects\Project_202103\labels\SEED\p' num2str(zq) ''])
eval(['load E:\Matlab_projects\Project_202103\features\psd\SEED\p' num2str(zq) ''])
feature=zscore(feature);
feature(valence==-1,:) = [];
valence(valence==-1,:) = [];
x=[x;feature];
y_valence=[y_valence;valence];
end

save E:\Matlab_projects\Project_202103\labeled_features\psd\SEED\data x y_valence
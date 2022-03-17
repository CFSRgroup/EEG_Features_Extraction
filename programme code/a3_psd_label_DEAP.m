%本程序用于输入特征、目标类别标准化和汇总
clc;
clear;
close all;

%DEAP脑电特征集每名被试包含120个样例
load E:\Matlab_projects\Project_202103\features\psd\DEAP\p1
x=zscore(feature);
for zq=2:32
eval(['load E:\Matlab_projects\Project_202103\features\psd\DEAP\p' num2str(zq) ''])
feature=zscore(feature);
x=[x;feature];
end

load E:\Matlab_projects\Project_202103\labels\DEAP\p1
y_arousal=arousal;
y_valence=valence;
for zq=2:32
eval(['load E:\Matlab_projects\Project_202103\labels\DEAP\p' num2str(zq) ''])
y_arousal=[y_arousal;arousal];
y_valence=[y_valence;valence];
end

save E:\Matlab_projects\Project_202103\labeled_features\psd\DEAP\data x y_arousal y_valence
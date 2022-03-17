%本程序用于输入特征、目标类别标准化和汇总
clc;
clear;
close all;

%DEAP脑电特征集每名被试包含120个样例
%HCI脑电特征集每名被试包含60个样例
load D:\EEGRecognition\Project_2103\features\de_128\DEAP\p1
x=x
%x=zscore(feature);%将p1的feature标准化 经过处理的数据的均值为0，标准差为1
for zq=2:32
eval(['load D:\EEGRecognition\Project_2103\features\de_128\DEAP\p' num2str(zq) ''])
feature=x

%feature=zscore(feature);
x=[x;feature];
end

load D:\EEGRecognition\Project_2103\labels\DEAP\p1
y_arousal=arousal;
y_valence=valence;
for zq=2:32
eval(['load D:\EEGRecognition\Project_2103\labels\DEAP\p' num2str(zq) ''])
y_arousal=[y_arousal;arousal]
y_valence=[y_valence;valence];
end
arousal=y_arousal
valence=y_valence
save D:\EEGRecognition\Project_2103\labeled_features\de_128\DEAP\data x arousal valence
%本程序用于输入特征、目标类别标准化和汇总
clc;
clear;
close all;

%DEAP脑电特征集每名被试包含600个样例
load D:\EEGRecognition\Project_2103\features\psd+de\DEAP\p1
x=zscore(feature);%将p1的feature标准化 经过处理的数据的均值为0，标准差为1
for zq=2:32
eval(['load D:\EEGRecognition\Project_2103\features\psd+de\DEAP\p' num2str(zq) ''])
feature=zscore(feature);
x=[x;feature];
end

load D:\EEGRecognition\Project_2103\labels\4s\DEAP\p1
y_arousal=arousal;
y_valence=valence;
for zq=2:32
eval(['load D:\EEGRecognition\Project_2103\labels\4s\DEAP\p' num2str(zq) ''])
y_arousal=[y_arousal;arousal];
y_valence=[y_valence;valence];
end

save D:\EEGRecognition\Project_2103\labeled_features\psd+de\DEAP\data x y_arousal y_valence
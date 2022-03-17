%本程序用于输入特征、目标类别标准化和汇总
clc;
clear;
close all;

for zq=1:32
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
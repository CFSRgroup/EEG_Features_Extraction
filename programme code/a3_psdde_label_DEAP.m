%��������������������Ŀ������׼���ͻ���
clc;
clear;
close all;

%DEAP�Ե�������ÿ�����԰���600������
load D:\EEGRecognition\Project_2103\features\psd+de\DEAP\p1
x=zscore(feature);%��p1��feature��׼�� ������������ݵľ�ֵΪ0����׼��Ϊ1
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
%��������������������Ŀ������׼���ͻ���
clc;
clear;
close all;

%DEAP�Ե�������ÿ�����԰���120������
%HCI�Ե�������ÿ�����԰���60������
load D:\EEGRecognition\Project_2103\features\de_128\DEAP\p1
x=x
%x=zscore(feature);%��p1��feature��׼�� ������������ݵľ�ֵΪ0����׼��Ϊ1
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
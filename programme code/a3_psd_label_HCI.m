%��������������������Ŀ������׼���ͻ���
clc;
clear;
close all;

%HCI�Ե�������ÿ�����԰���60������
load E:\Matlab_projects\Project_202103\features\psd\HCI\p1
x=zscore(feature);
for zq=2:24
eval(['load E:\Matlab_projects\Project_202103\features\psd\HCI\p' num2str(zq) ''])
feature=zscore(feature);
x=[x;feature];
end

load E:\Matlab_projects\Project_202103\labels\HCI\p1
y_arousal=arousal;
y_valence=valence;
for zq=2:24
eval(['load E:\Matlab_projects\Project_202103\labels\HCI\p' num2str(zq) ''])
y_arousal=[y_arousal;arousal];
y_valence=[y_valence;valence];
end

save E:\Matlab_projects\Project_202103\labeled_features\psd\HCI\data x y_arousal y_valence
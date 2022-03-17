clc;
clear;
close all;

for zq=1:32
eval(['load D:\EEGRecognition\Project_2103\features\psd+de\DEAP\p' num2str(zq) ''])
x=zscore(feature)
eval(['load D:\EEGRecognition\Project_2103\labels\4s\DEAP\p' num2str(zq) ''])
eval(['save D:\EEGRecognition\Project_2103\labeled_features\psd+de\DEAP\p' num2str(zq) ' x arousal valence'])
end
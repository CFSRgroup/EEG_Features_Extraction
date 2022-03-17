clc;
clear;
close all;
eval(['load D:\EEGRecognition\Project_2103\labeled_features\de_combine\HCI\data.mat'])
for i=1:24
    feature=x((i-1)*60+1:i*60,:)
    arousal=y_arousal((i-1)*60+1:i*60,:)
    valence=y_valence((i-1)*60+1:i*60,:)
    eval(['save D:\EEGRecognition\Project_2103\labeled_features\de\HCI\p' num2str(i) ' feature arousal valence'])
end
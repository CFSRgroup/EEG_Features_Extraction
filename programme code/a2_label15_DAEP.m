%本程序用于DEAP情感识别数据库的目标类别确定
clc;
clear;
close all;

for zq=1:32
%载入数据集
    clear labels
    clear valence arousal
eval(['load D:\EEGRecognition\dataset\dataset_DEAP\s' num2str(zq)])

for i=1:size(labels,1)
    
    if labels(i,1)>=5
        valence(i,1)=1;
    else
        valence(i,1)=0;
    end
    
    if labels(i,2)>=5
        arousal(i,1)=1;
    else
        arousal(i,1)=0;
    end
end
valence = repmat(valence,15,1)
arousal=repmat(arousal,15,1)
eval(['save D:\EEGRecognition\Project_2103\labels\4s\DEAP\p' num2str(zq) ' valence arousal'])
end
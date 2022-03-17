clc;
clear;
close all;
len=zeros(20,1)
for zq=1:20
eval(['[data,numChan,labels,txt,fs,gain,prefiltering,ChanDim]=eeg_read_bdf(''D:\EEGRecognition\dataset\dataset_HCI\Part_20_S_Trial' num2str(zq) '_emotion.bdf'',''all'',''n'')'])
len(zq,1)=size(data,2)/256
end
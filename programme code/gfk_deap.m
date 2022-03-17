clc;
clear;
close all;

%%
load D:\EEGRecognition\Project_2103\labeled_features\de_2s\try\data
x1=theta;
x2=alpha;
x3=beta;
x4=gamma;
x5=x;
y1=arousal;
y2=valence;

for i=1:32
    middle = theta;
    xt = middle((i-1)*120+1:i*120,:,:);
    middle((i-1)*120+1:i*120,:,:)=[];
    xs=middle;
    yt = y1((i-1)*120+1:i*120,:);
    y1((i-1)*120+1:i*120,:)=[];
    ys = y1;
    xs = reshape(xs,3720,320);
    xt = reshape(xt,120,320);  
    dim=1;
    GFK(xs,xt,ys,yt,dim)
end
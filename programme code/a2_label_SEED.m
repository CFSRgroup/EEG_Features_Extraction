clc;
clear;
close all;

%The labels of all trials are 1,0,-1,-1,0,1,-1,0,1,1,0,-1,0,1,-1, where 1 for positive, 0 for neutral and -1 for negative.
labels=[1 1 1 -1 -1 -1 0 0 0 0 0 0 -1 -1 -1 1 1 1 0 0 0 -1 -1 -1 1 1 1 1 1 1 -1 -1 -1 0 0 0 -1 -1 -1 1 1 1 0 0 0];
valence = [labels';labels';labels'];

for zq = 1:15
eval(['save E:\Matlab_projects\Project_202103\labels\SEED\p' num2str(zq) ' valence']);
end
clc;
clear;
close all;

for sub = 1:48
eval(['load D:\EEGRecognition\Project_2103\features\deentropy\p' num2str(sub) ''])

x = [feature_lo; feature_hi];
x = zscore(x);

for i = 1:size(x, 1)
[image_top] = image_generation(x(i, :)', 'emotiv14.locs');

xx(:,:,i) = image_top(2:5:end,3:5:end,:); %下采样
% xx(:,:,i) = image_top; %下采样
end

xx(isnan(xx)==1) = 0;
x = xx;

eval(['save D:\EEGRecognition\Project_2103\features\deentropy_image23_positive\p' num2str(sub) ' x'])
end

z = x(:,:,1);
surf(z)


    










% eval(['save E:\Matlab_projects\Project_202009\feature_set\deentropy\p' num2str(sub) ' feature_lo feature_hi'])


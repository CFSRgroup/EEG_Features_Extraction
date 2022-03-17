clc;
clear;
close all;

for sub = 1:32
    
eval(['load D:\EEGRecognition\Project_2103\features\de\DEAP\p' num2str(sub) ''])

x = feature;
x = zscore(x);

for i = 1:size(x, 1)
[image_top] = image_generation(x(i, :)', 'DEAP-10-10-Cap32.locs');
%xx(:,:,i) = image_top(2:5:end,3:5:end,:); %ÏÂ²ÉÑù
xx(i,:,:) = image_top;

end
xx(isnan(xx)==1) = 0;
x = xx;

eval(['save D:\EEGRecognition\Project_2103\features\de_128\DEAP\p' num2str(sub) ' x'])
end



    










% eval(['save E:\Matlab_projects\Project_202009\feature_set\deentropy\p' num2str(sub) ' feature_lo feature_hi'])


%本程序用于DEAP情感识别数据库的目标类别确定
clc;
clear;
close all;

%载入数据集
load  D:\EEGRecognition\dataset\dataset_DEAP\s1
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
valence=[valence;valence;valence];
arousal=[arousal;arousal;arousal];

save D:\EEGRecognition\Project_2103\labels\DEAP\p1 valence arousal

%载入数据集
clc;
clear;
close all;
load D:\EEGRecognition\dataset\dataset_DEAP\s2
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
valence=[valence;valence;valence];
arousal=[arousal;arousal;arousal];
save D:\EEGRecognition\Project_2103\labels\DEAP\p2 valence arousal

%载入数据集
clc;
clear;
close all;
load D:\EEGRecognition\dataset\dataset_DEAP\s3
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
valence=[valence;valence;valence];
arousal=[arousal;arousal;arousal];
save D:\EEGRecognition\Project_2103\labels\DEAP\p3 valence arousal

%载入数据集
clc;
clear;
close all;
load D:\EEGRecognition\dataset\dataset_DEAP\s4
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
valence=[valence;valence;valence];
arousal=[arousal;arousal;arousal];
save D:\EEGRecognition\Project_2103\labels\DEAP\p4 valence arousal

%载入数据集
clc;
clear;
close all;
load D:\EEGRecognition\dataset\dataset_DEAP\s5
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
valence=[valence;valence;valence];
arousal=[arousal;arousal;arousal];
save D:\EEGRecognition\Project_2103\labels\DEAP\p5 valence arousal

%载入数据集
clc;
clear;
close all;
load D:\EEGRecognition\dataset\dataset_DEAP\s6
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
valence=[valence;valence;valence];
arousal=[arousal;arousal;arousal];
save D:\EEGRecognition\Project_2103\labels\DEAP\p6 valence arousal

%载入数据集
clc;
clear;
close all;
load D:\EEGRecognition\dataset\dataset_DEAP\s7
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
valence=[valence;valence;valence];
arousal=[arousal;arousal;arousal];
save D:\EEGRecognition\Project_2103\labels\DEAP\p7 valence arousal

%载入数据集
clc;
clear;
close all;
load D:\EEGRecognition\dataset\dataset_DEAP\s8
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
valence=[valence;valence;valence];
arousal=[arousal;arousal;arousal];
save D:\EEGRecognition\Project_2103\labels\DEAP\p8 valence arousal

%载入数据集
clc;
clear;
close all;
load D:\EEGRecognition\dataset\dataset_DEAP\s9
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
valence=[valence;valence;valence];
arousal=[arousal;arousal;arousal];
save D:\EEGRecognition\Project_2103\labels\DEAP\p9 valence arousal

%载入数据集
clc;
clear;
close all;
load D:\EEGRecognition\dataset\dataset_DEAP\s10
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
valence=[valence;valence;valence];
arousal=[arousal;arousal;arousal];
save D:\EEGRecognition\Project_2103\labels\DEAP\p10 valence arousal

%载入数据集
clc;
clear;
close all;
load D:\EEGRecognition\dataset\dataset_DEAP\s11
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
valence=[valence;valence;valence];
arousal=[arousal;arousal;arousal];
save D:\EEGRecognition\Project_2103\labels\DEAP\p11 valence arousal

%载入数据集
clc;
clear;
close all;
load D:\EEGRecognition\dataset\dataset_DEAP\s12
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
valence=[valence;valence;valence];
arousal=[arousal;arousal;arousal];
save D:\EEGRecognition\Project_2103\labels\DEAP\p12 valence arousal

%载入数据集
clc;
clear;
close all;
load D:\EEGRecognition\dataset\dataset_DEAP\s13
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
valence=[valence;valence;valence];
arousal=[arousal;arousal;arousal];
save D:\EEGRecognition\Project_2103\labels\DEAP\p13 valence arousal

%载入数据集
clc;
clear;
close all;
load D:\EEGRecognition\dataset\dataset_DEAP\s14
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
valence=[valence;valence;valence];
arousal=[arousal;arousal;arousal];
save D:\EEGRecognition\Project_2103\labels\DEAP\p14 valence arousal

%载入数据集
clc;
clear;
close all;
load D:\EEGRecognition\dataset\dataset_DEAP\s15
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
valence=[valence;valence;valence];
arousal=[arousal;arousal;arousal];
save D:\EEGRecognition\Project_2103\labels\DEAP\p15 valence arousal

%载入数据集
clc;
clear;
close all;
load D:\EEGRecognition\dataset\dataset_DEAP\s16
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
valence=[valence;valence;valence];
arousal=[arousal;arousal;arousal];
save D:\EEGRecognition\Project_2103\labels\DEAP\p16 valence arousal

%载入数据集
clc;
clear;
close all;
load D:\EEGRecognition\dataset\dataset_DEAP\s17
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
valence=[valence;valence;valence];
arousal=[arousal;arousal;arousal];
save D:\EEGRecognition\Project_2103\labels\DEAP\p17 valence arousal

%载入数据集
clc;
clear;
close all;
load D:\EEGRecognition\dataset\dataset_DEAP\s18
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
valence=[valence;valence;valence];
arousal=[arousal;arousal;arousal];
save D:\EEGRecognition\Project_2103\labels\DEAP\p18 valence arousal

%载入数据集
clc;
clear;
close all;
load D:\EEGRecognition\dataset\dataset_DEAP\s19
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
valence=[valence;valence;valence];
arousal=[arousal;arousal;arousal];
save D:\EEGRecognition\Project_2103\labels\DEAP\p19 valence arousal

%载入数据集
clc;
clear;
close all;
load D:\EEGRecognition\dataset\dataset_DEAP\s20
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
valence=[valence;valence;valence];
arousal=[arousal;arousal;arousal];
save D:\EEGRecognition\Project_2103\labels\DEAP\p20 valence arousal

%载入数据集
clc;
clear;
close all;
load D:\EEGRecognition\dataset\dataset_DEAP\s21
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
valence=[valence;valence;valence];
arousal=[arousal;arousal;arousal];
save D:\EEGRecognition\Project_2103\labels\DEAP\p21 valence arousal

%载入数据集
clc;
clear;
close all;
load D:\EEGRecognition\dataset\dataset_DEAP\s22
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
valence=[valence;valence;valence];
arousal=[arousal;arousal;arousal];
save D:\EEGRecognition\Project_2103\labels\DEAP\p22 valence arousal

%载入数据集
clc;
clear;
close all;
load D:\EEGRecognition\dataset\dataset_DEAP\s23
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
valence=[valence;valence;valence];
arousal=[arousal;arousal;arousal];
save D:\EEGRecognition\Project_2103\labels\DEAP\p23 valence arousal

%载入数据集
clc;
clear;
close all;
load D:\EEGRecognition\dataset\dataset_DEAP\s24
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
valence=[valence;valence;valence];
arousal=[arousal;arousal;arousal];
save D:\EEGRecognition\Project_2103\labels\DEAP\p24 valence arousal

%载入数据集
clc;
clear;
close all;
load D:\EEGRecognition\dataset\dataset_DEAP\s25
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
valence=[valence;valence;valence];
arousal=[arousal;arousal;arousal];
save D:\EEGRecognition\Project_2103\labels\DEAP\p25 valence arousal

%载入数据集
clc;
clear;
close all;
load D:\EEGRecognition\dataset\dataset_DEAP\s26
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
valence=[valence;valence;valence];
arousal=[arousal;arousal;arousal];
save D:\EEGRecognition\Project_2103\labels\DEAP\p26 valence arousal

%载入数据集
clc;
clear;
close all;
load D:\EEGRecognition\dataset\dataset_DEAP\s27
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
valence=[valence;valence;valence];
arousal=[arousal;arousal;arousal];
save D:\EEGRecognition\Project_2103\labels\DEAP\p27 valence arousal

%载入数据集
clc;
clear;
close all;
load D:\EEGRecognition\dataset\dataset_DEAP\s28
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
valence=[valence;valence;valence];
arousal=[arousal;arousal;arousal];
save D:\EEGRecognition\Project_2103\labels\DEAP\p28 valence arousal

%载入数据集
clc;
clear;
close all;
load D:\EEGRecognition\dataset\dataset_DEAP\s29
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
valence=[valence;valence;valence];
arousal=[arousal;arousal;arousal];
save D:\EEGRecognition\Project_2103\labels\DEAP\p29 valence arousal

%载入数据集
clc;
clear;
close all;
load D:\EEGRecognition\dataset\dataset_DEAP\s30
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
valence=[valence;valence;valence];
arousal=[arousal;arousal;arousal];
save D:\EEGRecognition\Project_2103\labels\DEAP\p30 valence arousal

%载入数据集
clc;
clear;
close all;
load D:\EEGRecognition\dataset\dataset_DEAP\s31
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
valence=[valence;valence;valence];
arousal=[arousal;arousal;arousal];
save D:\EEGRecognition\Project_2103\labels\DEAP\p31 valence arousal

%载入数据集
clc;
clear;
close all;
load D:\EEGRecognition\dataset\dataset_DEAP\s32
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
valence=[valence;valence;valence];
arousal=[arousal;arousal;arousal];
save D:\EEGRecognition\Project_2103\labels\DEAP\p32 valence arousal
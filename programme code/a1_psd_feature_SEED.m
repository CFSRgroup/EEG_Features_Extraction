%����������EEG������ȡ
clc;
clear;
close all;


%%
% ��1-160�������ղ�ͬ������theta slow-alpha alpha beta gamma˳�����У�5Ƶ�Σ���32��������˳������
% ��ѡSEED���ݼ����� [1 4 8 6 16 18 26 24 34 36 44 42 53 59 60 46 3 5 10 12 14 22
% 20 28 30 32 40 38 48 50 55 61];
% 1 	Fp1
% 2 	AF3
% 3 	F3
% 4 	F7
% 5 	FC5
% 6 	FC1
% 7 	C3
% 8 	T7
% 9 	CP5
% 10	CP1
% 11	P3
% 12	P7
% 13	PO3
% 14	O1
% 15	Oz
% 16	Pz
% 17	Fp2
% 18	AF4
% 19	Fz
% 20	F4
% 21	F8
% 22	FC6
% 23	FC2
% 24	Cz
% 25	C4
% 26	T8
% 27	CP6
% 28	CP2
% 29	P4
% 30	P8
% 31	PO4
% 32	O2
% 
% ��161-216�����ԳƵ�����14�飩���Ұ���-�����PSD�������˳�����£�
% 1 	Fp1
% 2 	AF3
% 3 	F3
% 4 	F7
% 5 	FC5
% 6 	FC1
% 7 	C3
% 8 	T7
% 9 	CP5
% 10	CP1
% 11	P3
% 12	P7
% 13	PO3
% 14	O1
% 
% 
% ��217-344����32����EEG�ľ�ֵ�����������ʡ��أ�32*4=128����


%%
for subject=1:15%�˴���ѭ��-����
for session=1:3
eval(['load D:\matlab\matlab7\work\OFS_data_process\article_18\dataset_SEED\' num2str(subject) '_' num2str(session) ''])

for trial=1:15
%��SEED���ݼ���ѡ��32��������32������DEAP��HCI���ݿ�һ��
eval(['data=eeg' num2str(trial) '([1 4 8 6 16 18 26 24 34 36 44 42 53 59 60 46 3 5 10 12 14 22 20 28 30 32 40 38 48 50 55 61],:)'';'])


%%
%�����˲�
%�����˲���ȥ�۵�
filterorder=7;
Fs=200;
%��ͨ����,ֵ��ע���������Ĳ���ʱ��һ�����,1Ϊ�ο�˹��Ƶ��,������Ƶ�ʵ�һ��
filtercutoff_high=2*3/Fs;
%�����˲�������,���ø�ͨ�˲���
[f_b, f_a]=butter(filterorder,filtercutoff_high,'high');
%�������˲�
for i=1:32
segment=data(:,i);
data(:,i)=filtfilt(f_b,f_a,segment);
end

%��ͨ����,ֵ��ע���������Ĳ���ʱ��һ�����,1Ϊ�ο�˹��Ƶ��,������Ƶ�ʵ�һ��
filtercutoff_low=2*45/Fs;
%�����˲�������,���õ�ͨ�˲���
[f_b, f_a]=butter(filterorder,filtercutoff_low,'low');
%�������˲�
for i=1:32
segment=data(:,i);
data(:,i)=filtfilt(f_b,f_a,segment);
end
data=single(data);


%%
%PSD�����������
length=size(data,1);%����SEED���ݿ�ÿ������һ��TRIAL���źų���
step=floor(length/3);%��ÿ��TRIAL��EEG�ֳ�3����ͬ��Ƭ��

for ns=1:3;%�˴���ѭ��
data_seg=data(1+(ns-1)*step:ns*step,:);

for i1=1:32;%�˴���ѭ��
    clear power_ratio power_ratio_single diff_power
    eeg=data_seg(:,i1);
    Fs=200;%����Ƶ��
    T=1/Fs;%��������
    L=step;%�źų���
    NFFT=2^nextpow2(L);
    psd=fft(eeg,NFFT)/L;
    psd=2*abs(psd(1:NFFT/2+1));
    f=(Fs/2*linspace(0,1,NFFT/2+1))';
    
    %thetaƵ�Σ�4-8Hz)��f�е�������theta1-theta2
    %slow_alphaƵ��(8-10Hz)��f�е�����
    %alphaƵ��(8-12Hz)��f�е�������alpha1-alpha2
    %betaƵ��(12-30Hz)��f�е�������beta1-beta2
    %gammaƵ��(30-45Hz)��f�е�������gamma1-gamma2
    theta1=165;
    theta2=329;
    alpha1=theta2+1;
    alpha2=493;
    beta1=alpha2+1;
    beta2=1230;
    gamma1=beta2+1;
    gamma2=1845;
    %����ƽ��������
    theta=mean(psd(theta1:theta2,1));
    alpha=mean(psd(alpha1:alpha2,1));
    beta=mean(psd(beta1:beta2,1));
    gamma=mean(psd(gamma1:gamma2,1));
    
    power(i1,:)=[theta alpha beta gamma];
end

%�������Ұ���Ĺ���֮��
diff_power(1,:)=power(17,:)-power(1,:);
diff_power(2,:)=power(18,:)-power(2,:);
diff_power(3,:)=power(20,:)-power(3,:);
diff_power(4,:)=power(21,:)-power(4,:);
diff_power(5,:)=power(22,:)-power(5,:);
diff_power(6,:)=power(23,:)-power(6,:);
diff_power(7,:)=power(25,:)-power(7,:);
diff_power(8,:)=power(26,:)-power(8,:);
diff_power(9,:)=power(27,:)-power(9,:);
diff_power(10,:)=power(28,:)-power(10,:);
diff_power(11,:)=power(29,:)-power(11,:);
diff_power(12,:)=power(30,:)-power(12,:);
diff_power(13,:)=power(31,:)-power(13,:);
diff_power(14,:)=power(32,:)-power(14,:);
%�������е��������Ұ����ʲ�����,��������������56
diff_powers(ns,:)=reshape(diff_power',1,14*4);

%���㹦�ʱ�ֵ
power_ratio(1,:)=power(19,:)./(power(2,:)+power(18,:));%Fz/AFz
power_ratio(2,:)=power(24,:)./power(19,:);%Cz/Fz
power_ratio(3,:)=power(16,:)./power(24,:);%Pz/Cz
power_ratio(4,:)=power(15,:)./power(16,:);%Oz/Pz
power_ratio_single(1,1)=power(19,1)/power(16,2);%Fz-theta/Pz-alpha
power_ratio_single(1,2)=(power(2,1)+power(18,1))/power(16,2);%AFz-theta/Cz-alpha
power_ratio_single(1,3)=power(24,1)/power(16,2);%Cz-theta/Pz-alpha
power_ratio_single(1,4)=power(16,1)/power(15,2);%Cz-theta/Oz-alpha

%�������й��ʱ�ֵ����20
power_ratio=reshape(power_ratio',1,4*4);
power_ratio_all(ns,:)=[power_ratio power_ratio_single];

powers(ns,:)=reshape(power',1,32*4);%�������й�������,��������������128
end


eeg_powers((1+(trial-1)*3)+(session-1)*45:(trial*3)+(session-1)*45,:)=[powers diff_powers power_ratio_all];%eegƵ������
end
end
feature=double(eeg_powers);
eval(['save E:\Matlab_projects\Project_202103\features\psd\SEED\p' num2str(subject) ' feature'])
end
%����������EEG������ȡ
clc;
clear;
close all;


% ��1-160�������ղ�ͬ������theta slow-alpha alpha beta gamma˳�����У�5Ƶ�Σ���32��������˳������
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

for zq=1:32
%�������ݼ�
clear feature
eval(['load D:\EEGRecognition\dataset\dataset_DEAP\s' num2str(zq)])
%%
data1=data;
for z1=1:15
data=data1(:,:,385+(z1-1)*512:384+z1*512);
%����eegʱ������
for i2=1:40
for i1=1:32
    clear power_ratio power_ratio_single diff_power
eeg=reshape(data(i2,i1,:),512,1);
Fs=128;%����Ƶ��
T=1/Fs;%��������
L=512;%�źų���
NFFT=2^nextpow2(L);
psd=fft(eeg,NFFT)/L;
psd=2*abs(psd(1:NFFT/2+1));
f=(Fs/2*linspace(0,1,NFFT/2+1))';

%thetaƵ�Σ�4-8Hz)��f�е�������theta1-theta2
%slow_alphaƵ��(8-10Hz)��f�е�����
%alphaƵ��(8-12Hz)��f�е�������alpha1-alpha2
%betaƵ��(12-30Hz)��f�е�������beta1-beta2
%gammaƵ��(30-45Hz)��f�е�������gamma1-gamma2
theta1=find(f==4);
theta2=find(f==8);
alpha1=theta2+1;
alpha2=find(f==12);
beta1=alpha2+1;
beta2=find(f==30);
gamma1=beta2+1;
gamma2=find(f==45);
%����ƽ��������
theta=mean(psd(theta1:theta2,1));
alpha=mean(psd(alpha1:alpha2,1));
beta=mean(psd(beta1:beta2,1));
gamma=mean(psd(gamma1:gamma2,1));

power(i1,:)=[theta alpha beta gamma];
end

%�������Ұ���Ĺ���֮��
%diff_power(1,:)=power(17,:)-power(1,:);
%diff_power(2,:)=power(18,:)-power(2,:);
%diff_power(3,:)=power(20,:)-power(3,:);
%diff_power(4,:)=power(21,:)-power(4,:);
%diff_power(5,:)=power(22,:)-power(5,:);
%diff_power(6,:)=power(23,:)-power(6,:);
%diff_power(7,:)=power(25,:)-power(7,:);
%diff_power(8,:)=power(26,:)-power(8,:);
%diff_power(9,:)=power(27,:)-power(9,:);
%diff_power(10,:)=power(28,:)-power(10,:);
%diff_power(11,:)=power(29,:)-power(11,:);
%diff_power(12,:)=power(30,:)-power(12,:);
%diff_power(13,:)=power(31,:)-power(13,:);
%diff_power(14,:)=power(32,:)-power(14,:);
%�������е��������Ұ����ʲ�����,��������������56
%diff_powers(i2,:)=reshape(diff_power',1,14*4);

%���㹦�ʱ�ֵCz/Fz
%power_ratio(1,:)=power(19,:)./(power(2,:)+power(18,:));%Fz/AFz
%power_ratio(2,:)=power(24,:)./power(19,:);%Cz/Fz
%power_ratio(3,:)=power(16,:)./power(24,:);%Pz/Cz
%power_ratio(4,:)=power(15,:)./power(16,:);%Oz/Pz
%power_ratio_single(1,1)=power(19,1)/power(16,2);%Fz-theta/Pz-alpha
%power_ratio_single(1,2)=(power(2,1)+power(18,1))/power(16,2);%AFz-theta/Cz-alpha
%power_ratio_single(1,3)=power(24,1)/power(16,2);%Cz-theta/Pz-alpha
%power_ratio_single(1,4)=power(16,1)/power(15,2);%Cz-theta/Oz-alpha

%�������й��ʱ�ֵ����20
%power_ratio=reshape(power_ratio',1,4*4);
%power_ratio_all(i2,:)=[power_ratio power_ratio_single];

powers(i2,:)=reshape(power',1,32*4);%�������й�������psd,��������������128
end
%eeg_powers=[powers diff_powers power_ratio_all];%eegƵ������
%%
% %����eegʱ������
% for i2=1:40
% for i1=1:32
% eeg=reshape(data(i2,i1,:),2560,1);
% eeg_var(i2,i1)=var(eeg);
% eeg_zcr(i2,i1)=zcr(eeg);
% eeg_entropy_shannon(i2,i1)=wentropy(eeg,'shannon');
% eeg_kurtosis(i2,i1)=kurtosis(eeg);
% eeg_skewness(i2,i1)=skewness(eeg);
% end
% end
% eeg_temp=[eeg_var eeg_zcr eeg_entropy_shannon eeg_kurtosis eeg_skewness];%eegʱ������
%%
%������������364,ע�������HCI��ʽ��һ��,40��һ�飬ÿ��һ���׶�
feature((z1-1)*40+1:z1*40,:)=powers;
end
eval(['save D:\EEGRecognition\Project_2103\features\psd\DEAP\p' num2str(zq) ' feature'])
end
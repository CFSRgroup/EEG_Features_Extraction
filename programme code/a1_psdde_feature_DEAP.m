%本程序用于EEG特征提取
clc;
clear;
close all;

for zq=1:32
%载入数据集
clear feature
eval(['load D:\EEGRecognition\dataset\dataset_DEAP\s' num2str(zq)])
%%
data1=data;
for z1=1:15
data=data1(:,:,385+(z1-1)*512:384+z1*512);
%计算eeg时域特征
for i2=1:40
for i1=1:32
    clear power_ratio power_ratio_single diff_power
eeg=reshape(data(i2,i1,:),512,1);
Fs=128;%采样频率
T=1/Fs;%采样周期
L=512;%信号长度
NFFT=2^nextpow2(L);
psd=fft(eeg,NFFT)/L;
psd=2*abs(psd(1:NFFT/2+1));
f=(Fs/2*linspace(0,1,NFFT/2+1))';

%theta频段（4-8Hz)在f中的索引是theta1-theta2
%slow_alpha频段(8-10Hz)在f中的索引
%alpha频段(8-12Hz)在f中的索引是alpha1-alpha2
%beta频段(12-30Hz)在f中的索引是beta1-beta2
%gamma频段(30-45Hz)在f中的索引是gamma1-gamma2
theta1=find(f==4);
theta2=find(f==8);
alpha1=theta2+1;
alpha2=find(f==12);
beta1=alpha2+1;
beta2=find(f==30);
gamma1=beta2+1;
gamma2=find(f==45);
%计算平均功率谱
theta=mean(psd(theta1:theta2,1));
alpha=mean(psd(alpha1:alpha2,1));
beta=mean(psd(beta1:beta2,1));
gamma=mean(psd(gamma1:gamma2,1));

power(i1,:)=[theta alpha beta gamma];
end
powers(i2,:)=reshape(power',1,32*4);%汇总所有功率特征psd,按导联次序排列128
end
%power_feature = reshape(powers,40,32,4)
%%
% %计算eeg时域特征
for i2=1:40
for i1=1:32
eeg=reshape(data(i2,i1,:),512,1);
eeg_de(i2,i1)=de_entropy(eeg);
% eeg_var(i2,i1)=var(eeg);
% eeg_zcr(i2,i1)=zcr(eeg);
% eeg_entropy_shannon(i2,i1)=wentropy(eeg,'shannon');
% eeg_kurtosis(i2,i1)=kurtosis(eeg);
% eeg_skewness(i2,i1)=skewness(eeg);
end
end
%de_feature=reshape(eeg_de,40,32,1)
% eeg_temp=[eeg_var eeg_zcr eeg_entropy_shannon eeg_kurtosis eeg_skewness];%eeg时域特征
features=reshape([powers,eeg_de],40,32,5)
%%
%汇总所有特征364,注意这里和HCI格式不一样,40个一组，每组一个阶段
feature((z1-1)*40+1:z1*40,:,:)=features;
end
eval(['save D:\EEGRecognition\Project_2103\features\psd+de\DEAP\p' num2str(zq) ' feature'])
end
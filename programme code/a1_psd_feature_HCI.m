clc;
clear;
close all;

% （1-160）：按照不同导联的theta slow-alpha alpha beta gamma顺序排列（5频段），32导联排列顺序如下
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
% （161-216）：对称导联（14组）的右半球-左半球PSD差，导联对顺序如下：
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

%将每次试验的EEG分为前，中，后，三个片段。
for sub = 1:24
for zq=1:20 %20次试验
eval(['[data,numChan,labels,txt,fs,gain,prefiltering,ChanDim] = eeg_read_bdf(''E:\Matlab_projects\Project_202103\dataset_HCI\Part_' num2str(sub) '_S_Trial' num2str(zq) '_emotion.bdf'',''all'',''n'');'])
%%
%下采样256-128Hz
eeg=zeros(32,size(data,2)/2);
for i=1:32
eeg(i,:)=downsample(data(i,:),2);
end
%%
%参考电极取32导联均值
eeg_mean=mean(eeg);
for i=1:32
eeg(i,:)=eeg(i,:)-eeg_mean;
end
%%
%利用滤波器去眼电
filterorder=7;
%带通设置,值得注意的是这里的参数时归一化后的,1为奈奎斯特频率,即采样频率的一半
filtercutoff=2*3/fs;
%计算滤波器参数,采用高通滤波器
[f_b, f_a]=butter(filterorder,filtercutoff,'high');
%对数据滤波
for i=1:32
segment=eeg(i,:)';
segment=filtfilt(f_b,f_a,segment);
eeg(i,:)=segment';
end
%截取EEG,删除最后５秒和最前５秒的数据
eeg=eeg(:,128*5+1:end-128*5);
%%
%计算EEG信号长度,将每次试验的EEG分为前，中，后，三个片段。
length=size(eeg,2)/128;%注意下采样
length_one_third=floor(length/3);%信号长度的1/3
%%
for z1=1:3 %计算3个片段
eeg_segment=eeg(1:32,1+(z1-1)*128*length_one_third:z1*128*length_one_third);
%%
%计算每导联功率谱
clear power diff_power power_ratio
for i=1:32
%利用离散傅立叶变换计算功率谱
eeg_single=eeg_segment(i,:);
Fs=128;%采样频率
T=1/Fs;%采样周期
L=length_one_third*128;%信号长度
NFFT=2^nextpow2(L);
psd=fft(eeg_single,NFFT)/L;
psd=2*abs(psd(1:NFFT/2+1))';
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
%保存结果
power(i,:)=[theta alpha beta gamma];
end
%%
%大脑左右半球的功率之差(右－左)
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
%计算所有导联的左右半球功率差特征,按导联次序排列56
diff_power=reshape(diff_power',1,14*4);
%%
%计算功率比值Cz/Fz
power_ratio(1,:)=power(19,:)./(power(2,:)+power(18,:));%Fz/AFz
power_ratio(2,:)=power(24,:)./power(19,:);%Cz/Fz
power_ratio(3,:)=power(16,:)./power(24,:);%Pz/Cz
power_ratio(4,:)=power(15,:)./power(16,:);%Oz/Pz
power_ratio_single(1,1)=power(19,1)/power(16,2);%Fz-theta/Pz-alpha
power_ratio_single(1,2)=(power(2,1)+power(18,1))/power(16,2);%AFz-theta/Cz-alpha
power_ratio_single(1,3)=power(24,1)/power(16,2);%Cz-theta/Pz-alpha
power_ratio_single(1,4)=power(16,1)/power(15,2);%Cz-theta/Oz-alpha
%汇总所有功率比值特征20
power_ratio=reshape(power_ratio',1,4*4);
power=reshape(power',1,32*4);%汇总所有功率特征,按导联次序排列128
power_ratio=[power_ratio power_ratio_single];
%%
eeg_powers=[power diff_power power_ratio];%汇总eeg频域特征204
%%
% %计算eeg时域特征
% for i=1:32
% eeg_segment_single=eeg_segment(i,:);
% eeg_var(1,i)=var(eeg_segment_single);
% eeg_zcr(1,i)=zcr(eeg_segment_single);
% eeg_entropy_shannon(1,i)=wentropy(eeg_segment_single,'shannon');
% eeg_kurtosis(1,i)=kurtosis(eeg_segment_single);
% eeg_skewness(1,i)=skewness(eeg_segment_single);
% end
% eeg_temp=[eeg_var eeg_zcr eeg_entropy_shannon eeg_kurtosis eeg_skewness];%汇总eeg时域特征160
%%
%汇总所有特征364
feature((zq-1)*3+z1,:)=eeg_powers;
end
end
eval(['save E:\Matlab_projects\Project_202103\features\psd\HCI\p' num2str(sub) ' feature'])
end

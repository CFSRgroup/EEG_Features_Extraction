clc;
clear;
close all;
clear feature

for zq=3:32
%�������ݼ�
clear feature
clear theta_feature
clear beta_feature
clear alpha_feature
clear gamma_feature
eval(['load D:\EEGRecognition\dataset\dataset_DEAP\s' num2str(zq)])

%ȥ��ǰ����������� ����ԭʼ���ݷֳ����δ���һ���׶�20s
data1=data;
for z1=1:3
data=data1(:,:,385+(z1-1)*2560:384+z1*2560);

for i2=1:40
for i1=1:32
eeg=reshape(data(i2,i1,:),2560,1);
% %thetaƵ�Σ�4-8Hz)��f�е�������theta1-theta2
% %slow_alphaƵ��(8-10Hz)��f�е�����
% %alphaƵ��(8-12Hz)��f�е�������alpha1-alpha2
% %betaƵ��(12-30Hz)��f�е�������beta1-beta2
% %gammaƵ��(30-45Hz)��f�е�������gamma1-gamma2
Fs=128;%����Ƶ��
T=1/Fs;%��������
L=256;%�źų���
NFFT=2^nextpow2(L);
%psd=fft(eeg,NFFT)/L;
%psd=2*abs(psd(1:NFFT/2+1));
f=(Fs/2*linspace(0,1,NFFT/2+1))';
theta1=find(f==4);
theta2=find(f==8);
alpha1=theta2+1;
alpha2=find(f==12);
beta1=alpha2+1;
beta2=find(f==30);
gamma1=beta2+1;
gamma2=find(f==45);
%һ���׶���2sΪһ����ȡ΢��������
for t=1:10 
eeg_2s=eeg((t-1)*256+1:t*256,1);
% ��Ƶ����ȡ΢����
theta=eeg_2s(theta1:theta2,1);
beta=eeg_2s(beta1:beta2,1);
alpha=eeg_2s(alpha1:alpha2,1);
gamma=eeg_2s(gamma1:gamma2,1);
eeg_de(i2,i1,t)=de_entropy(eeg_2s);
theta_de(i2,i1,t)=de_entropy(theta);
alpha_de(i2,i1,t)=de_entropy(alpha);
beta_de(i2,i1,t)=de_entropy(beta);
gamma_de(i2,i1,t)=de_entropy(gamma);
end
end
end
%������������,40��һ�飬ÿ��һ���׶�
feature((z1-1)*40+1:z1*40,:,:)=eeg_de
theta_feature((z1-1)*40+1:z1*40,:,:)=theta_de
alpha_feature((z1-1)*40+1:z1*40,:,:)=alpha_de
beta_feature((z1-1)*40+1:z1*40,:,:)=beta_de
gamma_feature((z1-1)*40+1:z1*40,:,:)=gamma_de


end
eval(['save D:\EEGRecognition\Project_2103\features\de_2s\try\p' num2str(zq) ' feature theta_feature alpha_feature beta_feature gamma_feature'])

end
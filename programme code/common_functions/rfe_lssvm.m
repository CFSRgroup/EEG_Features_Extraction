function [ranking]=rfe_lssvm(x,y,para_ind)
%输入类别必须是0，1

%选择验证数据集
xva=x;
%选择验证目标类别
yva=(y-0.5).*2;

%RFE初始化
INDE=1:1:size(xva,2);%添加索引
type='classification';KT='lin_kernel';%LSSVM参数的设置(RBF_kernel lin_kernel)
XN=xva;wsb=zeros(1,size(xva,2));
%进行RFE_arousal
for i=1:size(xva,2)
    [alpha,b]=trainlssvm({XN,yva,type,10^(-2+para_ind(1)),[],KT,'original'});%训练LSSVM
    w=abs((alpha.*yva)'*XN);%计算分类面的权值
    [pp ws]=sort(w);%ws中存放索引,sort是从左向右从小到大排序的
    XN(:,ws(end))=[];%当前最劣特征索引为INDEN(end)%%
    wsb(i)=INDE(ws(end));
    INDE(:,ws(end))=[];
    i;
end
RFE_array=fliplr(wsb);%计算得到的RFE特征排序

% for i=1:size(xva,2)
% R(i)=abs(corr(xva(:,RFE_array(i)),yva,'type','Spearman'));
% end

ranking=RFE_array;
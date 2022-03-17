function [ranking]=rfe_lssvm(x,y,para_ind)
%������������0��1

%ѡ����֤���ݼ�
xva=x;
%ѡ����֤Ŀ�����
yva=(y-0.5).*2;

%RFE��ʼ��
INDE=1:1:size(xva,2);%�������
type='classification';KT='lin_kernel';%LSSVM����������(RBF_kernel lin_kernel)
XN=xva;wsb=zeros(1,size(xva,2));
%����RFE_arousal
for i=1:size(xva,2)
    [alpha,b]=trainlssvm({XN,yva,type,10^(-2+para_ind(1)),[],KT,'original'});%ѵ��LSSVM
    w=abs((alpha.*yva)'*XN);%����������Ȩֵ
    [pp ws]=sort(w);%ws�д������,sort�Ǵ������Ҵ�С���������
    XN(:,ws(end))=[];%��ǰ������������ΪINDEN(end)%%
    wsb(i)=INDE(ws(end));
    INDE(:,ws(end))=[];
    i;
end
RFE_array=fliplr(wsb);%����õ���RFE��������

% for i=1:size(xva,2)
% R(i)=abs(corr(xva(:,RFE_array(i)),yva,'type','Spearman'));
% end

ranking=RFE_array;
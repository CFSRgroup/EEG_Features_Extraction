function [W,b]=perceptron(X,y,learnRate,maxiter)
 %�����Ȩ��W=[w1,w2,...,wn],ƫ����b
 %���룺��������X(m*n),������ǩy(m*1),learnRateѧϰ���ʣ�����������maxiter
 %y��ȡֵ{0,1}
 %ѡȡ�ļ����Ϊsign(z)
    [m,n]=size(X);
 
    %��ʼ��Ȩ��
    W=zeros(n,1);
    %��ʼ��ƫ����
    b=0;
    
    for step=1:maxiter
        flag=true;
        for j=1:m
            output=sign(X(j,:)*W+b);
            if(output~=y(j))
                flag=false;
                W=W+learnRate*(y(j)-output)*X(j,:)';
                b=b+learnRate*(y(j)-output);
            end
        end
        if(flag==true)
            break;
        end
    end
end
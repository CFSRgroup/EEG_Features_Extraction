function [W,b]=perceptron(X,y,learnRate,maxiter)
 %输出：权重W=[w1,w2,...,wn],偏置项b
 %输入：样本数据X(m*n),样本标签y(m*1),learnRate学习速率，最大迭代次数maxiter
 %y的取值{0,1}
 %选取的激活函数为sign(z)
    [m,n]=size(X);
 
    %初始化权重
    W=zeros(n,1);
    %初始化偏置项
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
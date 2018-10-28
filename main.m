clc;
clear all;
data=dlmread('ex1data1.txt');
X=data(:,1);
Y=data(:,2);
%plot(X,Y,'rx');
X=[ones(size(Y,1),1) X];
theta=rand([1 2]);
alpha=0.01;

%---------------------------------------------------------
%batch gradient descent
for j=1:300
%hypothesis
Hb=X*(theta');
%cost function
Jb(j)=sum(((Hb-Y).*(Hb-Y)));
Jb(j)=Jb(j)/(2*size(X,1));
%gradient
for i=1:2
grad_b(i)=sum(((Hb-Y).*(X(:,i))));
end
grad_b=grad_b/(size(X,1));
theta=theta-(alpha*grad_b);
end

%ploting cost function
figure(1)
i=1:300;
plot(i,Jb);
%plotting hypothesis
figure(2)
hold on
plot(X,Y,'rx');
plH=X*(theta');
plot(X,plH);
hold off


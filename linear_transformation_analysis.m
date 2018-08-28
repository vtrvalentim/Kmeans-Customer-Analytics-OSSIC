function [ ] = linear_transformation_analysis( x )

%declaring sizes of the matrices
[rows,cols]=size(x);
lntransf=zeros(rows,cols);
invtransf=zeros(rows,cols);
sqrttransf=zeros(rows,cols);

%-------------------------------------------------------------------

%calculating standard deviation and mean for original distribution

%mean
i=1;
sum=0;
totalresp=0;

while i<=cols
    sum=sum+i*x(1,i);
    totalresp=totalresp+x(1,i);
    i=i+1; 
end
meanx=sum/totalresp;
%sigma^2
i=1;
sum=0;
while i<=cols
    sum=sum+((meanx-i)^2)*x(1,i);
    i=i+1; 
end
stdx=sum/totalresp;


%-------------------------------------------------------------------


%computing ln transformation
i=1;
while i<=cols
    lntransf(1,i)=log(x(1,i));
    i=i+1;
end

%calculating standard deviation and mean for ln transform
%mean
i=1;
sum=0;
totalresp=0;
while i<=cols
    sum=sum+i*lntransf(1,i);
    totalresp=totalresp+lntransf(1,i);
    i=i+1; 
end
meanln=sum/totalresp;
%sigma^2
i=1;
sum=0;
while i<=cols
    sum=sum+((meanln-i)^2)*lntransf(1,i);
    i=i+1; 
end
stdln=sum/totalresp;


%-------------------------------------------------------------------


%computing inverse transformation
i=1;
while i<=cols
    invtransf(1,i)=1/(x(1,i));
    i=i+1;
end

%calculating standard deviation and mean for inverse transform
%mean
i=1;
sum=0;
totalresp=0;
while i<=cols
    sum=sum+i*invtransf(1,i);
    totalresp=totalresp+invtransf(1,i);
    i=i+1; 
end
meaninv=sum/totalresp;
%sigma^2
i=1;
sum=0;
while i<=cols
    sum=sum+((meaninv-i)^2)*invtransf(1,i);
    i=i+1; 
end
stdinv=sum/totalresp;



%-------------------------------------------------------------------

%computing sqrt transformation
i=1;
while i<=cols
    sqrttransf(1,i)=sqrt(x(1,i));
    i=i+1;
end
%calculating standard deviation and mean for sqrt transform
stdsqrt=std(sqrttransf);
meansqrt=mean(sqrttransf);
%mean
i=1;
sum=0;
totalresp=0;
while i<=cols
    sum=sum+i*sqrttransf(1,i);
    totalresp=totalresp+sqrttransf(1,i);
    i=i+1; 
end
meansqrt=sum/totalresp;
%sigma^2
i=1;
sum=0;
while i<=cols
    sum=sum+((meansqrt-i)^2)*sqrttransf(1,i);
    i=i+1; 
end
stdsqrt=sum/totalresp;


%-------------------------------------------------------------------



figure
subplot(4,1,1)
plot(x)
title('data')

subplot(4,1,2)
plot(lntransf)
title('ln transform')

subplot(4,1,3)
plot(invtransf)
title('inverse transform')

subplot(4,1,4)
plot(sqrttransf)
title('sqrt transform')


%-------------------------------------------------------------------


formatSpec = ' original:      sigma^2=%0.6f  ||  mean=%0.3f \n ln transform:  sigma^2=%0.6f  ||  mean=%0.3f \n inv transform: sigma^2=%0.6f  ||  mean=%0.3f \n sqrt:          sigma^2=%0.6f  ||  mean=%0.3f';
sprintf(formatSpec,stdx,meanx,stdln,meanln,stdinv,meaninv,stdsqrt,meansqrt)
end


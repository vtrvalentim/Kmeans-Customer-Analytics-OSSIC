function [ ] = linear_transformation_analysis( x )

%declaring sizes of the matrices
[rows,cols]=size(x);
lntransf=zeros(rows,cols);
invtransf=zeros(rows,cols);
sqrttransf=zeros(rows,cols);

%computing ln transformation
i=1;
while i<=cols
    lntransf(1,i)=ln(x(1,i));
    i=i+1;
end

%computing inverse transformation
i=1;
while i<=cols
    invtransf(1,i)=1/(x(1,i));
    i=i+1;
end

%computing sqrt transformation
i=1;
while i<=cols
    sqrttransf(1,i)=sqrt(x(1,i));
    i=i+1;
end

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


end


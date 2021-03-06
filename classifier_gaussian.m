function [ four_means,stdvall,class_sizes ] = classifier_gaussian( clean_data )

%calculating mean values of each column
overall_mean = mean(clean_data);

%creating random disturbance
adde=rand(1,13)/1000;


%initializing first two clusters
starting_p1 = overall_mean;
starting_p2 = overall_mean + adde;

%calculating covariance matrix
Sigma=cov(clean_data);
Sigmainv=inv(Sigma);

%declaring classifier vector size to improve computation speed
[row,col]= size(clean_data);
classifier=zeros(row,1);

%initializing counters
i=1;

%calculating gaussian distance from initial two means and classifying accordingly
while i<=row
    
    d_gaussian_p1 = sqrt(clean_data(i,:)*Sigmainv*transpose(starting_p1));
    d_gaussian_p2 = sqrt(clean_data(i,:)*Sigmainv*transpose(starting_p2));
    
    %classifying point according to smallest euclidean distance
    if d_gaussian_p1 < d_gaussian_p2
        classifier(i,1) = 1;
    else
        classifier(i,1) = 2;
    end
    
    i=i+1;
end


%initializing variables and counters:
i=1;
sum1=zeros(1,col);
sum2=zeros(1,col);
size1=0;
size2=0;

%calculating new means and cluster sizes:
while i<=row
    j=1;
    
    %computing class size
    if classifier(i,1)==1
            size1=size1+1;
    elseif classifier(i,1)==2
            size2=size2+1;
    end
    
    %computing sum of elements in each class
    while j<=col
        if classifier(i,1)==1
            
            sum1(1,j)=sum1(1,j)+clean_data(i,j);
        elseif classifier(i,1)==2
            
            sum2(1,j)=sum2(1,j)+clean_data(i,j);
        end
        j=j+1;
    end
    
   i=i+1;
   
end

%calculating new means
starting_p1_2=sum1/size1;
starting_p2_2=sum2/size2;

%creating random disturbance
adde=rand(1,13)/1000;

%initializing third and fourth clusters
starting_p3_2 = starting_p1_2+adde;
starting_p4_2 = starting_p2_2+adde;

%classifying new data points according to new means
%calculating gaussian distance from four means and classifying accordingly
i=1;
j=1;
while i<=row
    
    d_gaussian_p1 = sqrt(clean_data(i,:)*Sigmainv*transpose(starting_p1_2));
    d_gaussian_p2 = sqrt(clean_data(i,:)*Sigmainv*transpose(starting_p2_2));
    d_gaussian_p3 = sqrt(clean_data(i,:)*Sigmainv*transpose(starting_p3_2));
    d_gaussian_p4 = sqrt(clean_data(i,:)*Sigmainv*transpose(starting_p4_2));

    %classifying point according to smallest euclidean distance
    if d_gaussian_p1 < d_gaussian_p2 && d_gaussian_p1 < d_gaussian_p3 && d_gaussian_p1 < d_gaussian_p4
        classifier(i,1) = 1;
    elseif d_gaussian_p2 < d_gaussian_p1 && d_gaussian_p2 < d_gaussian_p3 && d_gaussian_p2 < d_gaussian_p4
        classifier(i,1) = 2;
    elseif d_gaussian_p3 < d_gaussian_p1 && d_gaussian_p3 < d_gaussian_p2 && d_gaussian_p3 < d_gaussian_p4
        classifier(i,1) = 3;
    elseif d_gaussian_p4 < d_gaussian_p1 && d_gaussian_p4 < d_gaussian_p3 && d_gaussian_p4 < d_gaussian_p2
        classifier(i,1) = 4;
    end
    
    i=i+1;
end

%-------------------------------------------------------------------

a=1;
while a<100

%initializing variables and counters:
i=1;
sum1=zeros(1,col);
sum2=zeros(1,col);
sum3=zeros(1,col);
sum4=zeros(1,col);
size1=0;
size2=0;
size3=0;
size4=0;

%calculating new means and cluster sizes:
while i<=row
    j=1;
    
    %computing class sizes
    if classifier(i,1)==1
            size1=size1+1;
    elseif classifier(i,1)==2
            size2=size2+1;
    elseif classifier(i,1)==3
            size3=size3+1;
    elseif classifier(i,1)==4
            size4=size4+1;
    end
    
    %computing sum of elements in each class
    while j<=col
        if classifier(i,1)==1
            
            sum1(1,j)=sum1(1,j)+clean_data(i,j);
        elseif classifier(i,1)==2
            
            sum2(1,j)=sum2(1,j)+clean_data(i,j);
        elseif classifier(i,1)==3
            
            sum3(1,j)=sum3(1,j)+clean_data(i,j);
        elseif classifier(i,1)==4
            
            sum4(1,j)=sum4(1,j)+clean_data(i,j);
        end
        j=j+1;
    end
    
   i=i+1;
   
end

%calculating new means
starting_p1_3=sum1/size1;
starting_p2_3=sum2/size2;
starting_p3_3=sum3/size3;
starting_p4_3=sum4/size4;

%classifying new data points according to new means
%calculating gaussian distance from four means and classifying accordingly
i=1;
j=1;

while i<=row
    
    d_gaussian_p1 = sqrt(clean_data(i,:)*Sigmainv*transpose(starting_p1_3));
    d_gaussian_p2 = sqrt(clean_data(i,:)*Sigmainv*transpose(starting_p2_3));
    d_gaussian_p3 = sqrt(clean_data(i,:)*Sigmainv*transpose(starting_p3_3));
    d_gaussian_p4 = sqrt(clean_data(i,:)*Sigmainv*transpose(starting_p4_3));
    
    %classifying point according to smallest euclidean distance
    if d_gaussian_p1 < d_gaussian_p2 && d_gaussian_p1 < d_gaussian_p3 && d_gaussian_p1 < d_gaussian_p4
        classifier(i,1) = 1;
    elseif d_gaussian_p2 < d_gaussian_p1 && d_gaussian_p2 < d_gaussian_p3 && d_gaussian_p2 < d_gaussian_p4
        classifier(i,1) = 2;
    elseif d_gaussian_p3 < d_gaussian_p1 && d_gaussian_p3 < d_gaussian_p2 && d_gaussian_p3 < d_gaussian_p4
        classifier(i,1) = 3;
    elseif d_gaussian_p4 < d_gaussian_p1 && d_gaussian_p4 < d_gaussian_p3 && d_gaussian_p4 < d_gaussian_p2
        classifier(i,1) = 4;
    end
    
    i=i+1;
end

a=a+1;
end

i=1;
stdv1=0;
stdv2=0;
stdv3=0;
stdv4=0;
while i<=row
   
    if classifier(i,1)==1
        stdv1=stdv1+(clean_data(i,:)-starting_p1_3)*transpose(clean_data(i,:)-starting_p1_3);
        
    elseif classifier (i,1)==2
        stdv2=stdv2+(clean_data(i,:)-starting_p2_3)*transpose(clean_data(i,:)-starting_p2_3);
        
    elseif classifier (i,1)==3
        stdv3=stdv3+(clean_data(i,:)-starting_p3_3)*transpose(clean_data(i,:)-starting_p3_3);
        
    elseif classifier (i,1)==4
        stdv4=stdv4+(clean_data(i,:)-starting_p4_3)*transpose(clean_data(i,:)-starting_p4_3);
    end
    
    i=i+1;
end

stdv1=stdv1/size1;
stdv2=stdv2/size2;
stdv3=stdv3/size3;
stdv4=stdv4/size4;

stdvall=[stdv1,stdv2,stdv3,stdv4];

four_means=[starting_p1_3;starting_p2_3;starting_p3_3;starting_p4_3];

class_sizes=[size1,size2,size3,size4];

figure
subplot(4,1,1)
plot(starting_p1_3)
subplot(4,1,2)
plot(starting_p2_3)
subplot(4,1,3)
plot(starting_p3_3)
subplot(4,1,4)
plot(starting_p4_3)

%end
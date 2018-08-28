function [ three_means,stdvall,class_sizes ] = classifier_euclidean_3( clean_data )

%calculating mean values of each column
overall_mean = mean(clean_data);

%creating random disturbance
x1=rand(1,13);
y1=x1/1000;
x2=rand(1,13);
y2=x2/1000;

%initializing first two clusters
starting_p1 = overall_mean;
starting_p2 = overall_mean + y1;
starting_p3 = overall_mean + y2;

%declaring classifier vector size to improve computation speed
[row,col]= size(clean_data);
classifier=zeros(row,1);

%initializing counters
i=1;
j=1;

%calculating euclidean distance from initial two means and classifying accordingly
while i<=row
    
    j=1;
    sum_p1=0;
    sum_p2=0;
    sum_p3=0;
    
    %calculating distance from p1
    while j<=col
       
        add = (clean_data(i,j)- starting_p1(1,j))^2;
        sum_p1 = sum_p1+add;
        j=j+1;
    end
    
    j=1;
    
    %calculating distance from p2
    while j<=col
       
        add = (clean_data(i,j)- starting_p2(1,j))^2;
        sum_p2 = sum_p2+add;
        j=j+1;
    end
    
    j=1;
    
        %calculating distance from p3
    while j<=col
       
        add = (clean_data(i,j)- starting_p3(1,j))^2;
        sum_p3 = sum_p3+add;
        j=j+1;
    end
    
    j=1;
    
    d_euclidean_p1 = sqrt(sum_p1);
    d_euclidean_p2 = sqrt(sum_p2);
    d_euclidean_p3 = sqrt(sum_p3);

    %classifying point according to smallest euclidean distance
    if d_euclidean_p1 < d_euclidean_p2 && d_euclidean_p1 < d_euclidean_p3 
        classifier(i,1) = 1;
    elseif d_euclidean_p2 < d_euclidean_p1 && d_euclidean_p2 < d_euclidean_p3 
        classifier(i,1) = 2;
    elseif d_euclidean_p3 < d_euclidean_p1 && d_euclidean_p3 < d_euclidean_p2 
        classifier(i,1) = 3;
    end
    
    i=i+1;
end

a=1;
while a<100
%initializing variables and counters:
i=1;
j=1;
sum1=zeros(1,col);
sum2=zeros(1,col);
sum3=zeros(1,col);
size1=0;
size2=0;
size3=0;

%calculating new means and cluster sizes:
while i<=row
    j=1;
    
    %computing class size
    if classifier(i,1)==1
            size1=size1+1;
    elseif classifier(i,1)==2
            size2=size2+1;
    elseif classifier(i,1)==3
            size3=size3+1;
    end
    
    %computing sum of elements in each class
    while j<=col
        if classifier(i,1)==1
            
            sum1(1,j)=sum1(1,j)+clean_data(i,j);
        elseif classifier(i,1)==2
            
            sum2(1,j)=sum2(1,j)+clean_data(i,j);
        elseif classifier(i,1)==3
            
            sum3(1,j)=sum3(1,j)+clean_data(i,j);
        end
        j=j+1;
    end
    
   i=i+1;
   
end

%calculating new means
starting_p1_2=sum1/size1;
starting_p2_2=sum2/size2;
starting_p3_2=sum3/size3;


%classifying data points according to new means
%calculating euclidean distance from initial two means and classifying accordingly
while i<=row
    
    j=1;
    sum_p1=0;
    sum_p2=0;
    sum_p3=0;
    
    %calculating distance from p1
    while j<=col
       
        add = (clean_data(i,j)- starting_p1_2(1,j))^2;
        sum_p1 = sum_p1+add;
        j=j+1;
    end
    
    j=1;
    
    %calculating distance from p2
    while j<=col
       
        add = (clean_data(i,j)- starting_p2_2(1,j))^2;
        sum_p2 = sum_p2+add;
        j=j+1;
    end
    
    j=1;
    
        %calculating distance from p3
    while j<=col
       
        add = (clean_data(i,j)- starting_p3_2(1,j))^2;
        sum_p3 = sum_p3+add;
        j=j+1;
    end
    
    j=1;
    
    d_euclidean_p1 = sqrt(sum_p1);
    d_euclidean_p2 = sqrt(sum_p2);
    d_euclidean_p3 = sqrt(sum_p3);

    %classifying point according to smallest euclidean distance
    if d_euclidean_p1 < d_euclidean_p2 && d_euclidean_p1 < d_euclidean_p3 
        classifier(i,1) = 1;
    elseif d_euclidean_p2 < d_euclidean_p1 && d_euclidean_p2 < d_euclidean_p3 
        classifier(i,1) = 2;
    elseif d_euclidean_p3 < d_euclidean_p1 && d_euclidean_p3 < d_euclidean_p2 
        classifier(i,1) = 3;
    end
    
    i=i+1;
end

a=a+1;
end

%calulating standard deviation of each class
i=1;
stdv1=0;
stdv2=0;
stdv3=0;

while i<=row
   
    if classifier(i,1)==1
        stdv1=stdv1+(clean_data(i,:)-starting_p1_2)*transpose(clean_data(i,:)-starting_p1_2);
        
    elseif classifier (i,1)==2
        stdv2=stdv2+(clean_data(i,:)-starting_p2_2)*transpose(clean_data(i,:)-starting_p2_2);
        
    elseif classifier (i,1)==3
        stdv3=stdv3+(clean_data(i,:)-starting_p3_2)*transpose(clean_data(i,:)-starting_p3_2);
        
    end
    
    i=i+1;
    
end


stdv1=stdv1/size1;
stdv2=stdv2/size2;
stdv3=stdv3/size3;

stdvall=[stdv1,stdv2,stdv3];

three_means=[starting_p1_2;starting_p2_2;starting_p3_2];

class_sizes=[size1,size2,size3];

figure
subplot(3,1,1)
plot(starting_p1_2)
subplot(3,1,2)
plot(starting_p2_2)
subplot(3,1,3)
plot(starting_p3_2)


end
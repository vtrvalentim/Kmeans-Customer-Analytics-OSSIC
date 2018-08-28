%putting matrix in numerical format

%import excell sheet OSSICsurvey: Home>Import Data>Cell Array> Replace blanks with NaN
OSSICsurvey2 = OSSICsurvey([2:end],:); %removing first row that contains question titles
[row,col]=size(OSSICsurvey2); %calculating size of resulting matrix


%----------------------------------------
%xlRange='J1:M3'
%OSSICsurvey2 = xlsread('Sheet_1.xls',xlRange);
%----------------------------------------

clean_data=zeros(row,col);%declaring matrix size to improve computation time
i=1;%counter
j=1;%counter

%creating string checks
check1 = 'No<br />0 hours';
check2 = '1 - 2 hours';
check3 = '2 - 4 hours';
check4 = '4 - 8 hours';
check5 = '8 - 16 hours';
check6 = '16 - 24 hours';
check7 = '24 - 35 hours';
check8 = '35+ hours';

check9 = 'None';
check10 = 'Amateur';
check11 = 'Serious Hobbyist';
check12 = 'Professional';

check13 = '17 or younger';
check14 = '18-20';
check15 = '21-24';
check16 = '25-29';
check17 = '30-34';
check18 = '35-39';
check19 = '40-44';
check20 = '45-49';
check21 = '50-54';
check22 = '55-59';
check23 = '60-64';
check24 = '65';

%populating clean_data matrix
while i<=row
    j=1;
    while j<=col

        if strcmp(OSSICsurvey2(i,j),check1) == 1
        
            clean_data(i,j) = 1;
            
        elseif strcmp(OSSICsurvey2(i,j),check2) == 1
            
            clean_data(i,j) = 2;
            
        elseif strcmp(OSSICsurvey2(i,j),check3) == 1
        
            clean_data(i,j) = 3;
            
        elseif strcmp(OSSICsurvey2(i,j),check4) == 1
        
            clean_data(i,j) = 4;
            
        elseif strcmp(OSSICsurvey2(i,j),check5) == 1
            
            clean_data(i,j) = 5;
            
        elseif strcmp(OSSICsurvey2(i,j),check6) == 1
            
            clean_data(i,j) = 6;
            
        elseif strcmp(OSSICsurvey2(i,j),check7) == 1
            
            clean_data(i,j) = 7;
            
        elseif strcmp(OSSICsurvey2(i,j),check8) == 1
            
            clean_data(i,j) = 8;
            
        elseif strcmp(OSSICsurvey2(i,j),check9) == 1
            
            clean_data(i,j) = 1;
            
        elseif strcmp(OSSICsurvey2(i,j),check10) == 1
            
            clean_data(i,j) = 2;
            
        elseif strcmp(OSSICsurvey2(i,j),check11) == 1
            
            clean_data(i,j) = 3;
            
        elseif strcmp(OSSICsurvey2(i,j),check12) == 1
            
            clean_data(i,j) = 4;
            
        elseif strcmp(OSSICsurvey2(i,j),check13) == 1
            
            clean_data(i,j) = 1;
            
        elseif strcmp(OSSICsurvey2(i,j),check14) == 1
            
            clean_data(i,j) = 2;
            
        elseif strcmp(OSSICsurvey2(i,j),check15) == 1
            
            clean_data(i,j) = 3;
            
        elseif strcmp(OSSICsurvey2(i,j),check16) == 1
            
            clean_data(i,j) = 4;
            
        elseif strcmp(OSSICsurvey2(i,j),check17) == 1
            
            clean_data(i,j) = 5;
            
        elseif strcmp(OSSICsurvey2(i,j),check18) == 1
            
            clean_data(i,j) = 6;
            
        elseif strcmp(OSSICsurvey2(i,j),check19) == 1
            
            clean_data(i,j) = 7;
            
        elseif strcmp(OSSICsurvey2(i,j),check20) == 1
            
            clean_data(i,j) = 8;
            
        elseif strcmp(OSSICsurvey2(i,j),check21) == 1
            
            clean_data(i,j) = 9;
            
        elseif strcmp(OSSICsurvey2(i,j),check22) == 1
            
            clean_data(i,j) = 10;
            
        elseif strcmp(OSSICsurvey2(i,j),check23) == 1
            
            clean_data(i,j) = 11;
            
        elseif strcmp(OSSICsurvey2(i,j),check24) == 1
            
            clean_data(i,j) = 12;
            
        else
            
            clean_data(i,j) = 0;
            
        end
         j=j+1;      
    end
    i=i+1;
end



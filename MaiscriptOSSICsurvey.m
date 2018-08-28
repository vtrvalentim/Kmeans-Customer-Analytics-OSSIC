%1) Overview of the data analyzed:

%output arguments are with number of responses for each available answer for each question question
%eg: music = [139,146,842,1362,1130,591,272,296] given that there where 139
%people who answered no/0 hours for Do you plan on listening to music using 
%your OSSIC X? If so, for how many hours per week?

%the relationship between variables and questions are as follows:
%music: Do you plan on listening to music using your OSSIC X? If so, for how many hours per week?
%moviestv: Do you plan on watching movies or TV shows using your OSSIC X? If so, for how many hours per week?
%gaming: Do you plan on using your OSSIC X for gaming? If so, for how many hours per week?
%vr: Do you plan on using your OSSIC X with virtual reality? If so, for how many hours per week?
%cmusicp: To what level do you create content in the following? Music production
%clivem: To what level do you create content in the following? Performing live music (band, DJ, singer etc.)
%csound: To what level do you create content in the following? Sound design
%caudioeng: To what level do you create content in the following? Audio engineering
%cgamed: To what level do you create content in the following? Game design
%cvr: To what level do you create content in the following? VR/AR content creation
%cfilm: To what level do you create content in the following? Film production
%clives: To what level do you create content in the following? Live Streaming
%age: Your age

%[music,moviestv,gaming,vr,cmusicp,clivem,csound,caudioeng,cgamed,cvr,cfilm,clives,age]=overall_data_vis;

%--------------------------------------------------------------------------

%2) Analysis of data distribution for each dimension (dimension = question) and for their linear transformations:

%the main objective of this analysis is to check if the distribuitions have
%gaussian properties
%linear_transformation_analysis(music);
%linear_transformation_analysis(moviestv);
%linear_transformation_analysis(gaming);
%linear_transformation_analysis(vr);
%linear_transformation_analysis(cmusicp);
%linear_transformation_analysis(clivem);
%linear_transformation_analysis(csound);
%linear_transformation_analysis(caudioeng);
%linear_transformation_analysis(cgamed);
%linear_transformation_analysis(cvr);
%linear_transformation_analysis(cfilm);
%linear_transformation_analysis(clives);
%linear_transformation_analysis(age);

%--------------------------------------------------------------------------

%3) Importing the survey data from the excell sheet and formating it

%import excell sheet Home>Import Data>Cell Array>File Sheet1>Replace blanks with NaN
%change the name of the imported matrix to OSSICsurvey --------------------------------------------------->

%surveydatamatrix


%--------------------------------------------------------------------------

[three_means_euc,stdv3_euc,class_sizes3_euc]=classifier_euclidean_3(clean_data);
[four_means_euc,stdv4_euc,class_sizes4_euc]=classifier_euclidean(clean_data);
[five_means_euc,stdv5_euc,class_sizes5_euc]=classifier_euclidean_5(clean_data);
[six_means_euc,stdv6_euc,class_sizes6_euc]=classifier_euclidean_6(clean_data);

stdvall_euc=[stdv3_euc,0,0,0;stdv4_euc,0,0;stdv5_euc,0;stdv6_euc];

euclidean_means = [three_means_euc;four_means_euc;five_means_euc;six_means_euc];

sizes_euc = [class_sizes3_euc,0,0,0;class_sizes4_euc,0,0;class_sizes5_euc,0;class_sizes6_euc];

%---

[two_means_gau,stdv2_gau,class_sizes2_gau]=classifier_gaussian_2(clean_data);
[three_means_gau,stdv3_gau,class_sizes3_gau]=classifier_gaussian_3(clean_data);
[four_means_gau,stdv4_gau,class_sizes4_gau]=classifier_gaussian(clean_data);
[five_means_gau,stdv5_gau,class_sizes5_gau]=classifier_gaussian_5(clean_data);
[five_means2_gau,stdv52_gau,class_sizes52_gau]=classifier_gaussian_52(clean_data);
[five_means3_gau,stdv53_gau,class_sizes53_gau]=classifier_gaussian_53(clean_data);

stdvall_gau=[stdv2_gau,0,0,0;stdv3_gau,0,0;stdv4_gau,0;stdv5_gau;stdv52_gau;stdv53_gau];

gaussian_means = [two_means_gau;three_means_gau;four_means_gau;five_means_gau;five_means2_gau;five_means3_gau];

sizes_gaus = [class_sizes2_gau,0,0,0;class_sizes3_gau,0,0;class_sizes4_gau,0;class_sizes5_gau;class_sizes52_gau;class_sizes53_gau;];

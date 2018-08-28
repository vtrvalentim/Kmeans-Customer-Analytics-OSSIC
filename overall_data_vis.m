function [ music,moviestv,gaming,vr,cmusicp,clivem,csound,caudioeng,cgamed,cvr,cfilm,clives,age ] = overall_data_vis()

%overall data sets for hours of usage
music = [139,446,842,1362,1130,591,272,296];
moviestv = [571,787,1316,1298,680,258,89,79];
gaming=[1006,569,630,855,893,556,256,313];
vr=[2324,892,673,572,341,147,48,81];

%labelhours=['0','1-2','2-4','4-8','8-16','16-24','24-35','35+'];

%overall data sets for content creation
cmusicp=[3327,1046,440,189];
clivem=[3890,640,329,143];
csound=[3896,676,255,175];
caudioeng=[3887,661,254,200];
cgamed=[3956,668,226,152];
cvr=[4324,390,152,136];
cfilm=[3818,713,253,218];
clives=[3609,1043,258,92];

%labelc=['None','Amateur','Serious','Pro'];

%overal data sets misc
age=[39,227,598,1089,951,725,477,320,212,142,110,82,30];

%labelage=['17-','18-20','21-24','25-29','30-34','35-39','40-44','45-49','50-54','55-59','60-64','65+'];

%plotting hours data
figure()
subplot(4,1,1)
plot(music)
title('music hours')

subplot(4,1,2)
plot(moviestv)
title('movies & TV hours')

subplot(4,1,3)
plot(gaming)
title('gaming hours')

subplot(4,1,4)
plot(vr)
title('VR hours')


%ploting creation data 1
figure()
subplot(4,1,1)
plot(cmusicp)
title('Music Production')

subplot(4,1,2)
plot(clivem)
title('Performing Live Music')

subplot(4,1,3)
plot(csound)
title('Sound Design')

subplot(4,1,4)
plot(caudioeng)
title('Audio Engineering')

%ploting creation data 2
figure();
subplot(4,1,1)
plot(cgamed)
title('Game Design')

subplot(4,1,2)
plot(cvr)
title('VR/AR Content')

subplot(4,1,3)
plot(cfilm)
title('Film Production')

subplot(4,1,4)
plot(clives)
title('Live Streaming')

%ploting misc data
figure()
plot(age)
title('Age')

end
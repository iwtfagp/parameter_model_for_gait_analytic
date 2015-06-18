clc; clear all; close all;

header={'Left Hip','Right Hip','Left Knee','Right Knee',    ...
'Back Roll','Back yaw','Back Pitch',                        ...
'Left Thigh Roll','Left Thigh yaw','Left Thigh Pitch',      ...
'Right Thigh Roll','Right Thigh yaw','Right Thigh Pitch',   ...
'Left Shank Roll','Left Shank yaw','Left Shank Pitch',      ...
'Right Shank Roll','Right Shank yaw','Right Shank Pitch'};
 
% NewFilename = 'C:\Users\William\Dropbox\Code_Exoskeleton\1-ExperimentStep\Data\Data-2015-5-3-William\';
NewFilename = 'C:\Users\William\Dropbox\Code_Exoskeleton\1-ExperimentStep\Data\Data-2015-4-17-William\';
NewFilename = [NewFilename 'William_20150417_135350_1.percent']

data=load(NewFilename);
% 
% Left_Hip = data(1:100:10000,1);
% Right_Hip = data(1:100:10000,2);
% Left_Knee = data(1:100:10000,3);
% Right_Knee = data(1:100:10000,4);
Left_Hip = data(1:50:10000,1);
Right_Hip = data(1:50:10000,2);
Left_Knee = data(1:50:10000,3);
Right_Knee = data(1:50:10000,4);
% 
% set(gcf,'numbertitle','off')      
% set(gcf,'name',NewFilename)



scatter(Left_Hip,Left_Knee,'*');
xlabel('Hip (degree)')
ylabel('Knee (degree)')
hold on ;
scatter(Right_Hip,Right_Knee,'.');
plot([120 120],[0 120],'r')
plot([-10 -10],[0 120],'r')

plot([-10 120],[120 120],'r')
plot([-10 120],[0 0],'r')
hold off ;
legend('RightLeg', 'LeftLeg',4)

figure();
scatter(Left_Hip,Right_Hip,'*');
xlabel('Left_Hip (degree)')
ylabel('Right_Hip (degree)')
hold on ;
plot([-20 20],[20 -20],'r')
plot([-20 70],[70 -20],'r')


figure();
ANGLE = Left_Hip-Right_Hip;
plot(ANGLE);
title('LeftHip-RightHip')
xlabel('data (number)')
ylabel('Angle (degree)')

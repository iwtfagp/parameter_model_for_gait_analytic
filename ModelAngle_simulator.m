clc; clear all; close all;


dirName = 'C:\Users\William\Dropbox\Code_Exoskeleton\1-ExperimentStep\Data\Data-2015-5-17-William\';
filename_downStair = 'downstair\William-downstair_20150517.model';
filename_yStair  = 'upstair\William-upstair_20150517.model';
filename_walking = 'walking\William-walking_20150517.model';
filename_walking_fast = 'walking_fast\William-walking_fast.model';

% dirName = 'C:\Users\William\Dropbox\Code_Exoskeleton\1-ExperimentStep\Data\Data-2015-5-27-HCC\';
% % filename_downStair = 'downstair\William-downstair_20150517.model';
% % filename_yStair  = 'upstair\William-upstair_20150517.model';
% filename_walking = 'walking\HCC-walking_20150527.model';
% % filename_walking_fast = 'walking_fast\William-walking_fast.model';

data_downStair = load([dirName filename_downStair]);
data_upStair  = load([dirName filename_yStair]);
data_walking = load([dirName filename_walking]);
data_walking_fast = load([dirName filename_walking_fast]);


number = 100;

DDNum = 4;
% data = data_downStair(1:number:10000,DDNum);
% data = data_upStair(1:number:10000,DDNum);
% data = data_walking_fast(1:number:10000,DDNum);
data = data_walking(1:number:10000,DDNum);
totalNum = size(data,1);
%% parameter
sin_x = 83;
sin_y = 10;
sin_amp = 65;
gauss_x = 20;
gauss_y = 0;
gauss_amp = 10;
gauss_sig = 20;
gaitCycle = 0;
%% function
sin_x = sin_x - totalNum*3/4- totalNum/100*gaitCycle;
sin_part = (sin_amp-sin_y)*sin(2*pi/totalNum:2*pi/totalNum:2*pi) + sin_y;
sin_curve = zeros(totalNum,1)';

for i = 1:size(sin_part,2)
    new_position = sin_x-totalNum/2+i;
    new_position = mod(new_position, totalNum)+1;
    sin_curve(:,new_position) = sin_part(:,i);
end

gauss_part = (gauss_amp - gauss_y)*gaussmf(1:totalNum,[gauss_sig totalNum/2]) + gauss_y;
gauss_curve = zeros(totalNum,1)';
for i = 1:size(gauss_part,2)
    new_position = gauss_x- totalNum/100*gaitCycle-totalNum/2+i;
    new_position = mod(new_position, totalNum)+1;
    gauss_curve(:,new_position) = gauss_part(:,i);
end



plot(data);hold on;
plot(sin_curve,'r-+')
plot(gauss_curve,'g-o')

set(gcf,'Units','centimeters','position',[5 5 10 8]);
xlabel('gait cycle period (%)', 'fontsize',12);
ylabel('Angle (degree)', 'fontsize',12);
legend('data', 'model-sin', 'model-gaussian',4)



% 
% margin = 100;
% 
% figure();
% for pos = 1:4
%     subplot(2,2,pos);
%     plot(data_walking(1:margin:10000,pos*2));hold on;
% end
% figure();
% for pos = 1:4
%     subplot(2,2,pos);
%     plot(data_upStair(1:margin:10000,pos*2));hold on;
% end
% figure();
% for pos = 1:4
%     subplot(2,2,pos);
%     plot(data_walking(1:margin:10000,pos*2));hold on;
% end
% 
% 
% 

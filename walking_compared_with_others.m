clc; clear all; close all;


dirName = 'C:\Users\William\Dropbox\Code_Exoskeleton\1-ExperimentStep\Data\Data-2015-5-17-William\';
filename_downStair = 'downstair\William-downstair_20150517.model';
filename_upStair  = 'upstair\William-upstair_20150517.model';
filename_walking = 'walking\William-walking_20150517.model';
filename_walking_fast = 'walking_fast\William-walking_fast.model';


data_downStair = load([dirName filename_downStair]);
data_upStair  = load([dirName filename_upStair]);
data_walking = load([dirName filename_walking]);
data_walking_fast = load([dirName filename_walking_fast]);



margin = 100;

figure();
for pos = 1:4 
    subplot(2,2,pos);
    plot(data_walking(1:margin:10000,pos*2));hold on;
    plot(data_downStair(1:margin:10000,pos*2),'r+');hold off;
end
figure();
for pos = 1:4 
    subplot(2,2,pos);
    plot(data_walking(1:margin:10000,pos*2));hold on;
    plot(data_upStair(1:margin:10000,pos*2),'r+');hold off;
end
figure();
for pos = 1:4 
    subplot(2,2,pos);
    plot(data_walking(1:margin:10000,pos*2));hold on;
    plot(data_walking_fast(1:margin:10000,pos*2),'r+');hold off;
end




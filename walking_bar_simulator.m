clc; clear all; close all;

dir = 'C:\Users\William\Dropbox\Code_Exoskeleton\1-ExperimentStep\Data\Data-2015-5-17-William'
% fileName = '\walking\William-walking_20150517.model'
% fileName = '\walking_fast\William-walking_fast.model'
% fileName = '\upstair\William-upstair_20150517.model'
fileName = '\downstair\William-downstair_20150517.model'
fileName = [dir fileName];
data = load(fileName);

% data(:,4) = zeros(10000,1);
% data(:,8) = zeros(10000,1);



number = 500;
endNumber = 10000;
% plot(data);
phase = -pi;
thigh_x = 46*sin(data(1:number:endNumber,4)./180*pi + phase)
thigh_y = 46*cos(data(1:number:endNumber,4)./180*pi + phase)


culf_x = 49*sin(-1*data(1:number:endNumber,8)./180*pi + phase) + thigh_x
culf_y = 49*cos(-1*data(1:number:endNumber,8)./180*pi + phase) + thigh_y



% plot(thigh_x, thigh_y, culf_x, culf_y);


x=[thigh_x';zeros(size(thigh_x'))];y=[thigh_y';zeros(size(thigh_y'))];
h = plot(x(:),y(:));hold on;
x=[culf_x';thigh_x'];y=[culf_y';thigh_y'];
plot(x(:),y(:),'Color','r');hold on;

% x = 0:0.1:8*pi;
% h = plot(x, sin(x).*exp(-x/5), 'EraseMode', 'xor');
% h = plot(x(:),y(:), 'EraseMOde', 'xor')
% for i = 1:0.01:10
%     y = line(x,y)
%     set(h, 'ydata', y);
%     drawnow
% end


% line(x(5,:)',data,'color','r','linestyle',':');
% line([0,0],[60,0])
% for i=2:4,set(h(i),'erasemode','xor');end


% sizeNum = size(data,1);

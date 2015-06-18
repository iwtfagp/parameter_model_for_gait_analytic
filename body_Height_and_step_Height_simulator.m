clc;clear all;close all;

KKR =  []
ttR =  []

% Kr = 0.5:0.001:1.5;

t1_i = 30;
t2_i = 65;
total_i = 170;
step_Height = 15;


    height = 185;
    a1 = 0.245*height;
    a2 = 0.246*height;
for tt = 0:0.001:45*pi/180
    Kr = 0;
    t1 = (t1_i+(total_i-t1_i)*Kr)*pi/180;
    t2 = (t2_i+(total_i-t2_i)*Kr)*pi/180;
    while (a1+a2)*cos(tt) < a1*cos(t1-tt)+a2*cos(t2+tt-t1)+step_Height && Kr < 50
    Kr = Kr+0.001;
    t1 = (t1_i+(total_i-t1_i)*Kr)*pi/180;
    t2 = (t2_i+(total_i-t2_i)*Kr)*pi/180;
    end
    ttR = [ttR tt];
    KKR = [KKR Kr];
end
ttR = ttR/pi*180;
    t1 = (30*Kr)*pi/180;
    t2 = (65*Kr)*pi/180;
tt1 =  (t1_i+(total_i-t1_i).*KKR);
tt2 =  (t2_i+(total_i-t2_i).*KKR);
plot(ttR,tt1,'b-',ttR,tt2,'r--'); hold on;
grid()

step_Height = [ 'Human height = ' num2str(height) ' ,Step Height = ' num2str(step_Height) ]
title(step_Height);
xlabel('body')
ylabel('angle')
legend('thigh', 'shank',2);

% plot(ttR,KKR);


% plot(fun)
% syms a1 a2 Kr tt;
% sol = solve('(a1+a2)*cos(tt) = a1*cos(30*Kr-tt) + a2*cos(65*Kr+tt-30*Kr) + 10','tt');
% eqn = sin(x) == 1;
% solx = solve(eqn,x)



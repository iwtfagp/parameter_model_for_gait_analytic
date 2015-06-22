function [sin_curve, gauss_curve] = modelangle(sin_x, sin_y, sin_amp, gauss_x, gauss_y, gauss_amp, gauss_sig, gaitCycle, totalNum)
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
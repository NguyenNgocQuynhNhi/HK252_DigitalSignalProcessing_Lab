clear();    clc;    clf();

function [yn, yorigin] = convolution(xn, xorigin, hn, horigin)
    Lx = length(xn);
    Lh = length(hn);
    n_start_x = 0 - xorigin + 1;
    n_end_x = n_start_x + Lx - 1;
    n_start_h = 0 - horigin + 1;
    n_end_h = n_start_h + Lh - 1;
    n_start_y = n_start_x + n_start_h;
    n_end_y = n_end_x + n_end_h;
    yorigin = 1 - n_start_y;
    
    for n = n_start_y : n_end_y
        i_y = n + yorigin;
        yn(1, i_y) = 0;
        for k = n_start_x : n_end_x
            i_x = k + xorigin;
            i_h = (n - k) + horigin;
            if (i_x >= 1 && i_x <= Lx) && (i_h >= 1 && i_h <= Lh) then
                yn(1, i_y) = yn(1, i_y) + xn(i_x) * hn(i_h);
            end
        end 
    end
    
endfunction

xn = [1, 2, 3, 1];
xorigin = 1;
hn = [1, 2, 1, -1];
horigin = 2;
[yn, yorigin] = convolution(xn, xorigin, hn, horigin);
disp(yn);
disp(yorigin);

n_x = (1 : size(xn, '*')) - xorigin;
n_h = (1 : size(hn, '*')) - horigin;
n_y = (1 : size(yn, '*')) - yorigin;

timeMin = min([min(n_x), min(n_h), min(n_y)]);
timeMax = max([max(n_x), max(n_h), max(n_y)]);
timeLimit = [timeMin, timeMax];
Amin = min([min(xn), min(hn), min(yn)]);
Amax = max([max(xn), max(hn), max(yn)]);
ALimit = [Amin, Amax];

subplot(3, 1, 1);
plot2d3(n_x, xn);
plot(n_x, xn, "ro");
gca().data_bounds = [timeMin - 1, Amin - 1; timeMax + 1, Amax + 1];
title("Original signal x(n)");
xlabel("n"); ylabel("Aplitude");
xgrid(color('gray'));

subplot(3, 1, 2);
plot2d3(n_h, hn);
plot(n_h, hn, "ro");
gca().data_bounds = [timeMin - 1, Amin - 1; timeMax + 1, Amax + 1];
title("Original signal h(n)");
xlabel("n"); ylabel("Aplitude");
xgrid(color('gray'));

subplot(3, 1, 3);
plot2d3(n_y, yn);
plot(n_y, yn, "ro");
gca().data_bounds = [timeMin - 1, Amin - 1; timeMax + 1, Amax + 1];
title("Convolution signal y(n) = x(n) * h(n)");
xlabel("n"); ylabel("Aplitude");
xgrid(color('gray'));

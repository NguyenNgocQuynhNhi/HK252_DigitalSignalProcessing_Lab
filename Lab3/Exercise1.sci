clear(); clc; clf();

function [yn, yorigin] = delay(xn, xorigin, k)
    yn = xn;
    yorigin = xorigin - k;
endfunction

xn = [1, -2, 3, 6];
xorigin = 3;
k = 1;
[yn, yorigin] = delay(xn, xorigin, k);
disp(xn);
disp(xorigin);
disp(yn);
disp(yorigin);

// --- Dynamic Calculation the values of n-axis ---
// n = index - origin_index
n_x = (1:size(xn, '*')) - xorigin;
n_y = (1:size(yn, '*')) - yorigin;

subplot(2, 1, 1);
plot2d3(n_x, xn);
plot(n_x, xn, "ro");
title("Original Signal x(n)");
xlabel("n"); ylabel("Aplitude");
xgrid(color('gray'));

subplot(2, 1, 2);
plot2d3(n_y, yn);
plot(n_y, yn, "ro");
title("y(n) = x(n - 1)");
xlabel("n"); ylabel("Aplitude");
xgrid(color('gray'));

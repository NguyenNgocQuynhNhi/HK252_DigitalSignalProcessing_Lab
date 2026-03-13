clear(); clc; 

//function [yn, yorigin] = delay(xn, xorigin, k)
    
//endfunction

xn = [1, -2, 3, 6];
xorigin = 3;
k = 1;
//y_n = [x_n(1 - k), x_n(2 - k), x_n(3 - k), x_n(4 - k)];
yn = xn;
disp(xn);
disp(yn);

subplot(2, 1, 1);
n_x = -2:1;
plot2d3(n_x, xn);
plot(n_x, xn, "ro");
title("Original Signal x(n)");
xlabel("n"); ylabel("Aplitude");
xgrid(color('gray'));

subplot(2, 1, 2);
n_y = -1:2;
plot2d3(n_y, yn);
plot(n_y, yn, "ro");
title("y(n) = x(n - 1)");
xlabel("n"); ylabel("Aplitude");
xgrid(color('gray'));

clear();    clc;    clf();

function [yn, yorigin] = fold(xn, xorigin)
    length_x = length(xn);
    yorigin = length_x - xorigin + 1;
    
    for i = 0 : 5
        yn(1, i + 1) = xn(length_x - i);
    end
    
endfunction

xn = [1, 2, 5, 7, -3, -4];
xorigin = 3;
[yn, yorigin] = fold(xn, xorigin);
disp(xn);
disp(xorigin);
disp(yn);
disp(yorigin);

n_x = (1 : size(xn, '*')) - xorigin;
n_y = (1 : size(yn, '*')) - yorigin;

subplot(2, 1, 1);
plot2d3(n_x, xn);
plot(n_x, xn, "ro");
title("Original signal x(n)");
xlabel("n"); ylabel("Aplitude");
xgrid(color('gray'));

subplot(2, 1, 2);
plot2d3(n_y, yn);
plot(n_y, yn, "ro");
title("Folded signal y(n) = x(-n)");
xlabel("n"); ylabel("Aplitude");
xgrid(color('gray'));

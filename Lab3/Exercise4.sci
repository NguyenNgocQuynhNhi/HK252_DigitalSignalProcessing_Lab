clear();    clc;    clf();

function a = zeroFront(xn, gap)
    for i = 1 : gap
        a(1, i) = 0;
    end
    
    aLength = length(a);
    xnLength = length(xn);
    for i = 1 : xnLength
        a(1, aLength + i) = xn(i);
    end
endfunction

function b = zeroBack(xn, denta)
    xnLength = length(xn);
    for i = 1 : denta
        xn(1, xnLength + i) = 0;
    end
    b = xn;
endfunction

function [yn, yorigin] = add(x1n, x1origin, x2n, x2origin)
    gap = abs(x1origin - x2origin);
    
    if x1origin < x2origin then
        yorigin = x2origin;

        //x1new = zeroFront(x1n, gap);
        x1n = zeroFront(x1n, gap);
        disp("ZeroFront x1n = ");
        disp(x1n);
        
        denta = abs(length(x1n) - length(x2n));
        if (length(x1n) > length(x2n)) then
            x2n = zeroBack(x2n, denta);
            disp("ZeroBack x2n = ");
            disp(x2n);
        elseif length(x1n) < length(x2n) then
            x1n = zeroBack(x1n, denta);
            disp("ZeroBack x1n = ");
            disp(x1n);
        end
    elseif x2origin < x1origin then 
        yorigin = x1origin;
        
        x2n = zeroFront(x2n, gap);
        disp("ZeroFront x2n = ");
        disp(x2n);
        
        denta = abs(length(x2n) - length(x1n));
        if (length(x2n) > length(x1n)) then
            x1n = zeroBack(x1n, denta);
            disp("ZeroBack x1n = ");
            disp(x1n);
        elseif length(x2n) < length(x1n) then
            x2n = zeroBack(x2n, denta);
            disp("ZeroBack x2n = ");
            disp(x2n);
        end
    else
        yorigin = x1origin;
        denta = length(x1n) - length(x2n);
        if (denta > 0) then
            x2n = zeroBack(x2n, denta);
            disp("ZeroBack x2n = ");
            disp(x2n);
        elseif denta < 0 then
            x1n = zeroBack(x1n, -denta);
            disp("ZeroBack x1n = ");
            disp(x1n);
        end                    
    end
    
    yn = x1n + x2n;
    
endfunction

x1n = [1, 2, 3, 4, 5];
x1origin = 3;
x2n = [0, 1, 2, 3];
x2origin = 3;
[yn, yorigin] = add(x1n, x1origin, x2n, x2origin);
disp(yn);
disp(yorigin);

n_x1 = (1 : size(x1n, '*')) - x1origin;
n_x2 = (1 : size(x2n, '*')) - x2origin;
n_y = (1 : size(yn, '*')) - yorigin;

timeMin = min([min(n_x1), min(n_x2), min(n_y)]);
timeMax = max([max(n_x1), max(n_x2), max(n_y)]);
timeLimit = [timeMin, timeMax];
Amin = min([min(x1n), min(x2n), min(yn)]);
Amax = max([max(x1n), max(x2n), max(yn)]);
ALimit = [Amin, Amax];

subplot(3, 1, 1);
plot2d3(n_x1, x1n);
plot(n_x1, x1n, "ro");
gca().data_bounds = [timeMin - 1, Amin - 1; timeMax + 1, Amax + 1];
title("Original signal x1(n)");
xlabel("n"); ylabel("Aplitude");
xgrid(color('gray'));

subplot(3, 1, 2);
plot2d3(n_x2, x2n);
plot(n_x2, x2n, "ro");
gca().data_bounds = [timeMin - 1, Amin - 1; timeMax + 1, Amax + 1];
title("Original signal x2(n)");
xlabel("n"); ylabel("Aplitude");
xgrid(color('gray'));

subplot(3, 1, 3);
plot2d3(n_y, yn);
plot(n_y, yn, "ro");
gca().data_bounds = [timeMin - 1, Amin - 1; timeMax + 1, Amax + 1];
title("Sum signal y(n) = x1(n) + x2(n)");
xlabel("n"); ylabel("Aplitude");
xgrid(color('gray'));

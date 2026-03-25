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

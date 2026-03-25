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

        x1new = zeroFront(x1n, gap);
        disp("ZeroFront x1n = ");
        disp(x1new);
        
        denta = abs(length(x1new) - length(x2n));
        if (length(x1new) > length(x2n)) then
            x2new = zeroBack(x2n, denta);
            disp("ZeroBack x2n = ");
            disp(x2new);
        else
            x1new = zeroBack(x1new, denta);
            disp("ZeroBack x1new = ");
            disp(x1new);
        end
        
        yn = x2new + x1new;

    //else if x2origin < x1origin then
    else 
        yorigin = x1origin;
        
        x2new = zeroFront(x2n, gap);
        disp("ZeroFront x2n = ");
        disp(x2new);
        
        denta = abs(length(x2new) - length(x1n));
        if (length(x2new) > length(x1n)) then
            x1new = zeroBack(x1n, denta);
            disp("ZeroBack x1n = ");
            disp(x1new);
        else
            x2new = zeroBack(x2new, denta);
            disp("ZeroBack x2new = ")
            disp(x2new);
        end
        
        yn = x2new + x1new;
    end
    
/*        
    else
        yorigin = x1origin;
        if (length(x1n) > length(x2n)) then
            denta = length(x1n) - length(x2n);
            x2new = zeroBack(x2n, denta);
            disp("ZeroBack x2n = ");
            disp(x2new);
        
            yn = x1n + x2new;
        else if (length(x2n) > length(x1n)) then
            denta = length(x2n) - length(x1n);
            x1new = zeroBack(x1n, denta);
            disp("ZeroBack x1n = ");
            disp(x1new);
            
            yn = x1new + x2n;
        else
            yn = x1n + x2n;
        end
*/
    //end
    
endfunction

x1n = [1, 2, 3, 4, 5];
x1origin = 3;
x2n = [1, 2, 3];
x2origin = 3;
[yn, yorigin] = add(x1n, x1origin, x2n, x2origin);
disp(yn);
disp(yorigin);

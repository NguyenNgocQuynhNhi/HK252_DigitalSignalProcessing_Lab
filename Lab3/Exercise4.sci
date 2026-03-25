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

function zeroBack(xn, denta)
    xnLength = length(xn);
    for i = 1 : denta
        xn(1, xnLength + i) = 0;
    end
endfunction

function [yn, yorigin] = add(x1n, x1origin, x2n, x2origin)
    gap = abs(x1origin - x2origin);
    if x1origin < x2origin then
        yorigin = x2origin;
/*
        for i = 1 : gap;
            x1new(1, i) = 0;
        end
        length_x1new = length(x1new);
        length_x1 = length(x1n);
        for i = 1 : length_x1;
            x1new(1, length_x1new + i) = x1n(i); 
        end
  */
        x1new = zeroFront(x1n, gap);
        
/*        
        length_x1new = length(x1new);
        if (length_x1new > length(x2n)) then
            denta = length_x1new - length(x2n);
            for i = 1 : denta 
                x2n(1, length(x2n) + i) = 0;
            end
        else
            denta = length(x2n) - length_x1new;
            for i = 1 : denta
                x1new(1, length_x1new + 1) = 0;
            end
        end
*/
        denta = abs(length(x1new) - length(x2n));
        if (length(x1new) > length(x2n)) then
            zeroBack(x2n, denta);
        else
            zeroBack(x1new, denta);
        end
           
        yn = x1new + x2n; 

    else
        yorigin = x1origin;
        yn = 0;
   /*     
        for i = 1 : gap;
            x2new(1, i) = 0;
        end
        
        length_x2new = length(x2new);
        length_x2 = length(x2n);
        for i = 1 : length_x2;
            x2new(1, length_x2new + i) = x2n(i); 
        end
        */
    end

    
endfunction

x2n = [1, 2, 3, 4, 5];
x1n = [0, 1, 2, 3];
[yn, yorigin] = add(x1n, 2, x2n, 3);
disp(yn);

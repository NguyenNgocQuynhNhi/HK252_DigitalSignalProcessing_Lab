clear();    clc;    clf();

function [yn, yorigin] = add(x1n, x1origin, x2n, x2origin)
    gap = abs(x1origin - x2origin);
    if x1origin < x2origin then
        yorigin = x2origin;
        for i = 1 : gap;
            x1new(1, i) = 0;
        end
        length_x1new = length(x1new);
        length_x1 = length(x1n);
        for i = 1 : length_x1;
            x1new(1, length_x1new + i) = x1n(i); 
        end
        
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

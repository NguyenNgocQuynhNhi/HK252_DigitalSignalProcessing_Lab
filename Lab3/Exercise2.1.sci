clear();    clc;    clf();

n_start = -3;
n_end = 3;
xorigin = 0 - n_start + 1;

for n = n_start : n_end
    i_x = n + xorigin;
    if (n >= -3 && n <= -1) then
        xn(1, i_x) = 1 + n/3;
    elseif (n >= 0 && n <= 3) then
        xn(1, i_x) = 1;
    else
        xn(1, i_x) = 0;
    end
end

disp(xn);

function draw(xn, xorigin)
    n_x = (1:size(xn, '*')) - xorigin;
    n_start = 1 - xorigin;
    n_end = n_start + length(xn) - 1;
    
    plot2d3(n_x, xn);
    plot(n_x, xn, "ro");
    gca().data_bounds = [n_start - 1, min(xn); n_end + 1, max(xn) + 1];
    //title("Original Signal x(n)");
    xlabel("n"); ylabel("Aplitude");
    xgrid(color('gray'));
endfunction

draw(xn, xorigin);


//-------------- Exercise 2.1b1 ----------------------
function [yn, yorigin] = fold(xn, xorigin)
    length_x = length(xn);
    yorigin = length_x - xorigin + 1; 
    for i = 0 : (length_x - 1) 
        yn(1, i + 1) = xn(length_x - i);
    end
endfunction

function [yn, yorigin] = delay(xn, xorigin, k)
    yn = xn;
    yorigin = xorigin - k;
endfunction

disp(xn);
subplot(3, 1, 1);
draw(xn, xorigin);
title("Original Signal x(n)");

[xn_fold, xorigin_fold] = fold(xn, xorigin);
disp(xn_fold);
subplot(3, 1, 2);
draw(xn_fold, xorigin_fold);
title("Folded Signal x(n)");

[xnb1, xnb1origin] = delay(xn_fold, xorigin_fold, 4);
disp(xnb1);
disp(xnb1origin);
subplot(3, 1, 3);
draw(xnb1, xnb1origin);
title("Delayed Folded Signal x(n)");

//-------------- Exercise 2.1b2 ----------------------
disp(xn);
subplot(3, 1, 1);
draw(xn, xorigin);
title("Original Signal x(n)");

[xn_delay, xorigin_delay] = delay(xn, xorigin, 4);
disp(xn_delay);
subplot(3, 1, 2);
draw(xn_delay, xorigin_delay);
title("Delayed Signal x(n)");

[xnb2, xnb2origin] = fold(xn_delay, xorigin_delay);
disp(xnb2);
subplot(3, 1, 3);
draw(xnb2, xnb2origin);
title("Folded Delayed Signal x(n)");






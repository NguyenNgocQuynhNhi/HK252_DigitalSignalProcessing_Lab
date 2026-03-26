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


n_x = (1:size(xn, '*')) - xorigin;

plot2d3(n_x, xn);
plot(n_x, xn, "ro");
gca().data_bounds = [n_start - 1, min(xn); n_end + 1, max(xn) + 1];
title("Original Signal x(n)");
xlabel("n"); ylabel("Aplitude");
xgrid(color('gray'));



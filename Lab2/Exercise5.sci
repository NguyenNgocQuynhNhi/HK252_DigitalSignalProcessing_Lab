clear; clc; clf();

n = -1:1;
x = [1, 3, -2];
disp(x);

x_neg = [x(3), x(2), x(1)];
disp(x_neg);

x_e = 0.5 * (x + x_neg);
x_o = 0.5 * (x - x_neg);
disp(x_e);
disp(x_o);

subplot(3, 1, 1);
plot2d3(n, x);
plot(n, x, 'ro');
title("Original Signal x(n)");
xlabel("n");
ylabel("Amplitude");

subplot(3, 1, 2);
plot2d3(n, x_e);
plot(n, x_e, 'bo');
title("Even Component x_e(n)");
xlabel("n");
ylabel("Amplitude");

subplot(3, 1, 3);
plot2d3(n, x_o);
plot(n, x_o, 'go');
title("Odd Component x_o(n)");
xlabel("n");
ylabel("Amplitude");



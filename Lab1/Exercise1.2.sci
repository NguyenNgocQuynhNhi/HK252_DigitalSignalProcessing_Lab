clear; clc;
clf();

//------------ Analog signal x_a(t) ---------------
t = linspace(0, 0.1, 1000);
x_a = 3 * sin(100 * %pi * t);

subplot(3, 1, 1);
plot(t, x_a, "red");
xtitle("Analog Signal x_a(t) = 3sin(100pi t)", "Time (s)", "Amplitude");
xgrid();

//------------ Discrete-time signal x(n) -------------
n = 0 : 30;
x_n = 3 * sin(%pi * n / 3);

subplot(3, 1, 2);
plot2d3(n, x_n);
plot(n, x_n, "ro");
xtitle("Discrete-time Signal x(n) (N=6)", "n (samples)", "Amplitude");
xgrid();

//------------ Quantitized signal x_q(n) -------------
delta = 0.1;
x_q = delta * floor(x_n / delta);

subplot(3, 1, 3);
plot2d3(n, x_q);
plot(n, x_q, "bo");
xtitle("Quantized Signal xq(n) with delta=0.1", "n (samples)", "Amplitude");
xgrid();

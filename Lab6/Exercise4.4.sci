// Problem 4.4 - Discrete-Time Fourier Series (DTFS)
clear; clc; clf;

// Dữ liệu miền thời gian
n = 0:5;
x = [3, 2, 1, 0, 1, 2];

// Dữ liệu miền tần số
k = 0:5;
ck = [1.5, 2/3, 0, 1/6, 0, 2/3];

// 1. Vẽ tín hiệu x(n)
subplot(3, 1, 1);
plot2d3(n, x); // Hàm plot2d3 dùng để vẽ dạng stem trong Scilab
plot(n, x, 'bo'); // Thêm marker tròn
title('Periodic Signal x(n) (1 period)', 'fontsize', 3);
xlabel('Time index n'); ylabel('Amplitude'); xgrid(1);

// 2. Vẽ phổ biên độ
subplot(3, 1, 2);
plot2d3(k, abs(ck));
plot(k, abs(ck), 'ro');
title('Magnitude Spectrum |c_k|', 'fontsize', 3);
xlabel('Frequency index k'); ylabel('Magnitude'); xgrid(1);

// 3. Vẽ phổ pha
subplot(3, 1, 3);
plot2d3(k, zeros(k));
plot(k, zeros(k), 'go');
title('Phase Spectrum \angle c_k', 'fontsize', 3);
xlabel('Frequency index k'); ylabel('Phase (rad)'); xgrid(1);

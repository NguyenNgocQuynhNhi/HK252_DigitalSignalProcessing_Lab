// Problem 4.2 - Continuous-Time Fourier Transform Spectra
clear; clc; clf;

// Khởi tạo các tham số
A = 1; 
a = 1;
Omega = -10 : 0.05 : 10; // Dải tần số góc Omega

// 1. Phổ của tín hiệu (a): x(t) = A*e^(-at)u(t)
X_a = A ./ (a + %i * Omega);
mag_Xa = abs(X_a);
phase_Xa = atan(imag(X_a), real(X_a));

subplot(2, 2, 1);
plot(Omega, mag_Xa, 'b', 'LineWidth', 2);
title('Magnitude Spectrum (a)', 'fontsize', 3);
xlabel('\Omega'); ylabel('|X_a(\Omega)|'); xgrid(1);

subplot(2, 2, 3);
plot(Omega, phase_Xa, 'r', 'LineWidth', 2);
title('Phase Spectrum (a)', 'fontsize', 3);
xlabel('\Omega'); ylabel('\angle X_a(\Omega)'); xgrid(1);

// 2. Phổ của tín hiệu (b): x(t) = A*e^(-a|t|)
X_b = (2 * A * a) ./ (a^2 + Omega.^2);
mag_Xb = abs(X_b);
phase_Xb = atan(imag(X_b), real(X_b)); // Thực chất luôn bằng 0

subplot(2, 2, 2);
plot(Omega, mag_Xb, 'b', 'LineWidth', 2);
title('Magnitude Spectrum (b)', 'fontsize', 3);
xlabel('\Omega'); ylabel('|X_b(\Omega)|'); xgrid(1);

subplot(2, 2, 4);
plot(Omega, phase_Xb, 'r', 'LineWidth', 2);
title('Phase Spectrum (b)', 'fontsize', 3);
xlabel('\Omega'); ylabel('\angle X_b(\Omega)'); xgrid(1);

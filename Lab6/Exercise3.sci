// Exercise 3 - Signal and System in Frequency Domain
clear; clc; clf;

// Dải tần số từ -pi đến pi
w = -%pi : 0.01 : %pi;

// ==========================================
// 1. Tín hiệu x1(n) = 0.1^n * u(n)
// ==========================================
X1 = 1 ./ (1 - 0.1 * exp(-%i * w));

// Vẽ phổ biên độ x1(n)
subplot(2, 2, 1);
plot(w, abs(X1), 'b', 'LineWidth', 2);
xgrid(1);
title('Amplitude Spectrum of x1(n)', 'fontsize', 3);
xlabel('Frequency \omega (rad/sample)');
ylabel('|X1(e^{j\omega})|');

// Vẽ phổ pha x1(n)
subplot(2, 2, 3);
plot(w, atan(imag(X1), real(X1)), 'r', 'LineWidth', 2);
xgrid(1);
title('Phase Spectrum of x1(n)', 'fontsize', 3);
xlabel('Frequency \omega (rad/sample)');
ylabel('Phase (rad)');

// ==========================================
// 2. Tín hiệu x2(n) = d(n) + d(n-1) + d(n-2) + d(n-3)
// ==========================================
X2 = 1 + exp(-%i * w) + exp(-%i * 2 * w) + exp(-%i * 3 * w);

// Vẽ phổ biên độ x2(n)
subplot(2, 2, 2);
plot(w, abs(X2), 'b', 'LineWidth', 2);
xgrid(1);
title('Amplitude Spectrum of x2(n)', 'fontsize', 3);
xlabel('Frequency \omega (rad/sample)');
ylabel('|X2(e^{j\omega})|');

// Vẽ phổ pha x2(n)
subplot(2, 2, 4);
plot(w, atan(imag(X2), real(X2)), 'r', 'LineWidth', 2);
xgrid(1);
title('Phase Spectrum of x2(n)', 'fontsize', 3);
xlabel('Frequency \omega (rad/sample)');
ylabel('Phase (rad)');

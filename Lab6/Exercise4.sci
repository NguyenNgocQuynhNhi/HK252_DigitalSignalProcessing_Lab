// Exercise 4 - Spectrum of LTI System Impulse Response
clear; clc; clf;

// Dải tần số từ -pi đến pi
w = -%pi : 0.01 : %pi;

// Tính toán đáp ứng tần số H(e^{jw})
H = 1 ./ (1 + 0.1*exp(-%i * w) + 0.2*exp(-%i * 2 * w));

// Vẽ phổ biên độ
subplot(2, 1, 1);
plot(w, abs(H), 'b', 'LineWidth', 2);
xgrid(1);
title('Amplitude Spectrum of h(n) |H(e^{j\omega})|', 'fontsize', 3);
xlabel('Frequency \omega (rad/sample)');
ylabel('Magnitude');

// Vẽ phổ pha
subplot(2, 1, 2);
plot(w, atan(imag(H), real(H)), 'r', 'LineWidth', 2);
xgrid(1);
title('Phase Spectrum of h(n) \angle H(e^{j\omega})', 'fontsize', 3);
xlabel('Frequency \omega (rad/sample)');
ylabel('Phase (rad)');

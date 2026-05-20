// Exercise 5 - Output Signal Spectrum
clear; clc; clf;

// Dải tần số
w = -%pi : 0.01 : %pi;

// Biến đổi Fourier của đầu ra Y(e^{jw})
Y = (1 + exp(-%i * w)) ./ (1 - 0.5 * exp(-%i * w));

// Vẽ phổ biên độ của y(n)
subplot(2, 1, 1);
plot(w, abs(Y), 'b', 'LineWidth', 2);
xgrid(1);
title('Amplitude Spectrum of Output y(n) |Y(e^{j\omega})|', 'fontsize', 3);
xlabel('Frequency \omega (rad/sample)');
ylabel('Magnitude');

// Vẽ phổ pha của y(n)
subplot(2, 1, 2);
plot(w, atan(imag(Y), real(Y)), 'r', 'LineWidth', 2);
xgrid(1);
title('Phase Spectrum of Output y(n) \angle Y(e^{j\omega})', 'fontsize', 3);
xlabel('Frequency \omega (rad/sample)');
ylabel('Phase (rad)');

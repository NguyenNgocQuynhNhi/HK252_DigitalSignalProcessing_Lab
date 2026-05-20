// Problem 4.3 - Spectrum of Triangular Pulse
clear; clc; clf;

tau = 1; // Giả sử tau = 1
F = -3 : 0.01 : 3; // Dải tần số F (Hz)

// Tránh lỗi chia cho 0 tại F = 0
X_a = zeros(F);
for i = 1:length(F)
    if F(i) == 0 then
        X_a(i) = tau;
    else
        X_a(i) = tau * (sin(%pi * F(i) * tau) / (%pi * F(i) * tau))^2;
    end
end

// Vẽ phổ biên độ
subplot(2, 1, 1);
plot(F, abs(X_a), 'b', 'LineWidth', 2);
title('Magnitude Spectrum |X_a(F)|', 'fontsize', 3);
xlabel('Frequency F (Hz)'); ylabel('|X_a(F)|'); xgrid(1);

// Vẽ phổ pha (luôn bằng 0 vì X_a(F) >= 0)
phase_Xa = atan(imag(X_a), real(X_a));
subplot(2, 1, 2);
plot(F, phase_Xa, 'r', 'LineWidth', 2);
title('Phase Spectrum \angle X_a(F)', 'fontsize', 3);
xlabel('Frequency F (Hz)'); ylabel('\angle X_a(F)'); xgrid(1);

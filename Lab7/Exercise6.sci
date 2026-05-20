clear(); clc; clf();

// Ham 1: Tinh tich chap vong dung FFT
function y = circ_conv_fft(x, h)
    y = ifft(fft(x) .* fft(h));
endfunction

// Ham 2: Tinh tich chap vong truc tiep (khong dung FFT)
function y = circ_conv_direct(x, h)
    N = length(x);
    y = zeros(1, N);
    for n = 0:N-1
        for k = 0:N-1
            // Them +N truoc khi modulo de dam bao gia tri luon duong
            idx = modulo(n - k + N, N);
            y(n+1) = y(n+1) + x(k+1) * h(idx+1);
        end
    end
endfunction

// Kiem chung ket qua
x = [1, 2, 1, -1];
h = [0, 1/3, -1/3, 1/3];

y1 = circ_conv_fft(x, h);
y2 = circ_conv_direct(x, h);

disp(y1, "Ket qua dung FFT:");
disp(y2, "Ket qua dung cach truc tiep:");
disp(norm(y1 - y2), "Sai so giua 2 phuong phap:");

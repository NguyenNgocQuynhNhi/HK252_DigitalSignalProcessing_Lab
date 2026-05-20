clear(); clc; clf();

function y = lin_conv_fft(x, h)
    Nx = length(x);
    Nh = length(h);
    // Chieu dai cua tich chap tuyen tinh
    N = Nx + Nh - 1; 
    
    // Zero-padding cho ca 2 tin hieu dat chieu dai N
    xz = [x, zeros(1, N - Nx)];
    hz = [h, zeros(1, N - Nh)];
    
    // Thuc hien tich chap vong tren 2 tin hieu da padding
    y = ifft(fft(xz) .* fft(hz));
endfunction

// Kiem chung
x = [1, 2, 3];
h = [4, 5, 6, 7];

y_fft = lin_conv_fft(x, h);
y_conv = conv(x, h); // Ham conv cua Scilab

disp(y_fft, "Ket qua dung FFT voi Zero-padding:");
disp(y_conv, "Ket qua dung ham conv:");

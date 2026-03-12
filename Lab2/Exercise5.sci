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

// --- Cấu hình chung cho cửa sổ hình ảnh ---
f = gcf(); 
f.background = color('white'); // Đổi nền sang trắng tinh khôi

// Vẽ đồ thị 1: Original Signal
subplot(3, 1, 1);
plot2d3(n, x); 
h1 = gce(); // Lấy handle của đường vừa vẽ
h1.children.thickness = 3; // Tăng độ dày đường đứng lên 3
h1.children.foreground = color('red'); // Màu đỏ đậm

plot(n, x, "ro"); 
h2 = gce();
h2.children.mark_size = 10; // Tăng kích thước điểm tròn
h2.children.mark_foreground = color('red');
title("Original Signal x(n)", "fontsize", 4);
xgrid(color('gray')); // Thêm lưới màu xám nhẹ

// Vẽ đồ thị 2: Even Component
subplot(3, 1, 2);
plot2d3(n, x_e);
h3 = gce(); h3.children.thickness = 3;
h3.children.foreground = color('blue');

plot(n, x_e, "bo"); 
h4 = gce(); h4.children.mark_size = 10;
title("Even Component x_e(n)", "fontsize", 4);
xgrid(color('gray'));

// Vẽ đồ thị 3: Odd Component
subplot(3, 1, 3);
plot2d3(n, x_o);
h5 = gce(); h5.children.thickness = 3;
h5.children.foreground = color('darkgreen');

plot(n, x_o, "go"); 
h6 = gce(); h6.children.mark_size = 10;
title("Odd Component x_o(n)", "fontsize", 4);
xgrid(color('gray'));



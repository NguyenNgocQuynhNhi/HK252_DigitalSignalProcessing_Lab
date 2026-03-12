clear; clc; clf();

// 1. Dinh nghia mien thoi gian chung n = -1 den 3
n = -1:3;

// 2. Can chinh cac vector tin hieu theo mien thoi gian chung
x1 = [0, 0, 1, 3, -2]; // x1(n)
x2 = [0, 1, 2, 3, 0];  // x2(n)
y  = x1 + x2;          // y(n)

// --- Cau hinh cua so do hoa ---
f = gcf(); f.background = color('white');

// Ve x1(n)
subplot(3, 1, 1);
plot2d3(n, x1); h1=gce(); h1.children.thickness=3; h1.children.foreground=color('red');
plot(n, x1, "ro"); h2=gce(); h2.children.mark_size=10;
title("Signal x1(n)", "fontsize", 4); xlabel("n"); ylabel("Amplitude");
xgrid(color('gray'));

// Ve x2(n)
subplot(3, 1, 2);
plot2d3(n, x2); h3=gce(); h3.children.thickness=3; h3.children.foreground=color('blue');
plot(n, x2, "bo"); h4=gce(); h4.children.mark_size=10;
title("Signal x2(n)", "fontsize", 4); xlabel("n"); ylabel("Amplitude");
xgrid(color('gray'));

// Ve y(n)
subplot(3, 1, 3);
plot2d3(n, y); h5=gce(); h5.children.thickness=3; h5.children.foreground=color('darkgreen');
plot(n, y, "go"); h6=gce(); h6.children.mark_size=10;
title("Sum Signal y(n) = x1(n) + x2(n)", "fontsize", 4); xlabel("n"); ylabel("Amplitude");
xgrid(color('gray'));
